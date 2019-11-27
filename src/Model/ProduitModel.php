<?php
namespace Model;
use PDO;
 class ProduitModel extends Model{

  public function selectAllProduit($order='',$asc=""){
    $requete = "SELECT * FROM " .$this->getTable(true) .  " WHERE is_deleted = 0 ";
    if(!empty($order)){$requete .=" ORDER BY ".$order;}
    if(!empty($asc)){$requete .=" DESC";}
    $resultat = $this->getDb()->prepare($requete);
    $resultat->execute();
    $donnees = $resultat->fetchAll(PDO::FETCH_CLASS,'Entity\\' . ucfirst($this->getTable()));
    if(!$donnees){
      return false;
    }else{
      return $donnees;
    }
    }
    public function selectProduit($id){

      $q=$this->execRequest('SELECT * FROM '.$this->getTable(true).' WHERE is_deleted=0 and id_'.$this->getTable().' = :id',array('id'=>$id));
        $q->setFetchMode(PDO::FETCH_CLASS,'Entity\\'.ucfirst($this->getTable()));
      $data=$q->fetch();
      if(!$data){
        return false;
      }
      else{
      return $data;}
    }

  public function deleteProduit($id){
    $infos['is_deleted']=1;
    return $this->update($id,$infos);
  }

  public function insertProduit($infos){
    return $this->insert($infos);
  }

  public function updateProduit($id,$infos){
    return $this->update($id,$infos);
  }

  public function deleteAllProduit(){
  return $this->deleteAll();
  }



  public function getAllCategories(){
    $requete = "SELECT DISTINCT categorie FROM " .$this->getTable(true)." WHERE is_deleted =0 ORDER BY categorie";
    $resultat = $this->getDb()->query($requete);
    $donnees = $resultat->fetchAll();
    if(!$donnees){
      return false;
    }else{
      return $donnees;
    }
  }


  public function getAllProduitsByCategories($cat){
    $requete = "SELECT * FROM " .$this->getTable(true) .  " WHERE categorie = :cat";
    $resultat = $this->getDb()->prepare($requete);
    $resultat->bindValue(':cat',$cat,PDO::PARAM_STR);
    $resultat->execute();
    $donnees = $resultat->fetchAll(PDO::FETCH_CLASS,'Entity\\' . ucfirst($this->getTable()));
    if(!$donnees){
      return false;
    }else{
      return $donnees;
    }
  }

  public function getThreeOtherProduitsByCategories($cat,$id){
    $requete = "SELECT * FROM " .$this->getTable(true) .  " WHERE categorie = :cat AND id_produit!=:id LIMIT 0,3";
    $resultat = $this->getDb()->prepare($requete);
    $resultat->bindValue(':cat',$cat,PDO::PARAM_STR);
    $resultat->bindValue(':id',$id,PDO::PARAM_STR);
    $resultat->execute();
    $donnees = $resultat->fetchAll(PDO::FETCH_CLASS,'Entity\\' . ucfirst($this->getTable()));
    if(!$donnees){
      return false;
    }else{
      return $donnees;
    }
  }

public function getResultSearch($term){
  $requete = "SELECT * FROM " .$this->getTable(true) . " WHERE LOWER(titre) LIKE CONCAT('%',:term,'%')
  OR LOWER(categorie) LIKE CONCAT('%',:term,'%')
  OR LOWER(description) LIKE CONCAT('%',:term,'%')
  OR LOWER(traducteur) LIKE CONCAT('%',:term,'%')
  OR LOWER(collection) LIKE CONCAT('%',:term,'%')
  OR LOWER(editeur) LIKE CONCAT('%',:term,'%')
  OR LOWER(auteur) LIKE CONCAT('%',:term,'%')";
  $resultat = $this->getDb()->prepare($requete);
  $resultat->bindValue(':term',mb_strtolower($term),PDO::PARAM_STR);
  $resultat->execute();
  $donnees = $resultat->fetchAll(PDO::FETCH_CLASS,'Entity\\' .ucfirst($this->getTable()));
  if(!$donnees) return false;
  else return $donnees;
}
}
?>
