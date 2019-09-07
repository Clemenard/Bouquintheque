<?php
namespace Model;
use PDO;
 class ProduitModel extends Model{

  public function selectAllProduit($order=''){
    return $this->selectAll($order);
    }

  public function selectProduit($id){
      return $this->select($id);
    }

  public function deleteProduit($id){
    return $this->delete($id);
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
    $requete = "SELECT DISTINCT categorie FROM " .$this->getTable(true)." ORDER BY categorie";
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
  OR LOWER(couleur) LIKE CONCAT('%',:term,'%')";
  $resultat = $this->getDb()->prepare($requete);
  $resultat->bindValue(':term',mb_strtolower($term),PDO::PARAM_STR);
  $resultat->execute();
  $donnees = $resultat->fetchAll(PDO::FETCH_CLASS,'Entity\\' .ucfirst($this->getTable()));
  if(!$donnees) return false;
  else return $donnees;
}
}
?>
