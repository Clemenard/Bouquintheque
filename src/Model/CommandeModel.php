<?php

namespace Model;
use PDO;

class CommandeModel extends Model{

  public function registerCommande($infos){
    return $this->insert($infos);
  }

  public function getMyCommande($id){
    return $this->select($id);
  }

  public function getBestSales(){
    $requete = "SELECT id_produit,SUM(quantite) AS nb_ventes FROM bouquintheque_details_" . $this->getTable(). " GROUP BY id_produit ORDER BY nb_ventes DESC LIMIT 10";
    $resultat = $this->getDb()->prepare($requete);
    $resultat->execute();
    $donnees = $resultat->fetchAll();
    if($donnees) return $donnees;
    else return false;
}

  // --------------- SPECIFIQUE ------------------
  public function registerDetails($infos){
    $requete = "INSERT INTO bouquintheque_details_" . $this->getTable(). " (" . implode(',',array_keys($infos)) . ") VALUES (:" . implode(', :',array_keys($infos)) . ")";
    $resultat = $this->getDb()->prepare($requete);
    if( $resultat->execute($infos) ){
      return $this->getDb()->lastInsertId();
    }
    else{
      return false;
    }
  }

  public function getMesCommandes(){
    if(isset($_SESSION['membre'])){
      $monId = $_SESSION['membre']->getField('id_membre');
      $requete = "SELECT * FROM " .$this->getTable(true) ." WHERE id_membre = :id_membre";
      $resultat = $this->getDb()->prepare($requete);
      $resultat->bindValue(':id_membre',$monId,PDO::PARAM_INT);
      $resultat->execute();
      $donnees = $resultat->fetchAll(PDO::FETCH_CLASS,'Entity\\'.ucfirst($this->getTable()));
      if($donnees) return $donnees;
      else return false;
    }else{
      return false;
    }
  }

  public function getallDetailsCommandes(){

      $requete = "SELECT * FROM bouquintheque_commande c, bouquintheque_membre m, bouquintheque_produit p, bouquintheque_details_commande d WHERE  d.id_produit=p.id_produit AND d.id_commande=c.id_commande AND c.id_membre = m.id_membre GROUP BY c.id_commande ";
      $resultat = $this->getDb()->prepare($requete);
      $resultat->execute();
      $donnees = $resultat->fetchAll();
      if($donnees) return $donnees;
      else return false;
    }
    public function getDetailsMyCommandes($id){

        $requete = "SELECT * FROM bouquintheque_commande c, bouquintheque_produit p, bouquintheque_details_commande d WHERE  d.id_produit=p.id_produit AND d.id_commande=c.id_commande AND c.id_commande=:id";
        $resultat = $this->getDb()->prepare($requete);
              $resultat->bindValue(':id',$id,PDO::PARAM_INT);
        $resultat->execute();
        $donnees = $resultat->fetchAll();
        if($donnees) return $donnees;
        else return false;
      }
      public function getDetails($id,$option=false){
        $requete = "SELECT * FROM bouquintheque_details_commande c,bouquintheque_produit p WHERE id_commande = :id_commande and p.id_produit=c.id_produit";
        // if($option){$requete.=' AND id_membre =:id_membre';}
        $resultat = $this->getDb()->prepare($requete);
        $resultat->bindValue(':id_commande',$id,\PDO::PARAM_INT);
        // if($option){$resultat->bindValue(':id_membre',$_SESSION['membre']->getField('id_membre'),PDO::PARAM_INT);}
        $resultat->execute();
        $donnees = $resultat->fetchAll();
        if($donnees) return $donnees;
        else return false;
      }

}
