<?php

namespace Model;
use PDO;

class MembreModel extends Model{

  public function inscription($infos){
    return $this->register($infos);
  }

  public function selectMembre($id){
    return $this->select($id);
  }

  public function updateMembre($id,$infos){
    return $this->update($id,$infos);
  }

  public function existsPseudo($pseudo){
    $requete = "SELECT * FROM " .$this->getTable(true)." WHERE pseudo = :pseudo";
    $resultat = $this->getDb()->prepare($requete);
    $resultat->bindValue(':pseudo',$pseudo,PDO::PARAM_STR);
    $resultat->execute();
    $resultat->setFetchMode(PDO::FETCH_CLASS,'Entity\\' .ucfirst($this->getTable()));
    $donnees = $resultat->fetch();
    if( $donnees ) return $donnees;
    else return false;
  }

}
