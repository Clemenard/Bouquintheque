<?php
namespace Model;
use PDO;
 class NoteModel extends Model{

  public function selectAllNote($order=''){
    return $this->selectAll($order);
    }

    public function selectAllNoteInProduit($id,$order=''){
        if(!empty($order)) $order=' ORDER BY '.$order;
      if(!empty($desc)) $desc='DESC';
          $q=$this->execRequest('SELECT * FROM '.$this->getTable(true). 'WHERE id_produit= '.$id );
          $data=$q->fetchAll(PDO::FETCH_CLASS,'Entity\\'.ucfirst($this->getTable()));
          if(!$data){
            return false;
          }
          else{
          return $data;}
      }
      public function selectBestNote($id){
        $requete='SELECT * FROM '.$this->getTable(true). ' WHERE id_produit= '.$id.' ORDER BY note DESC LIMIT 1';
          $resultat = $this->getDb()->query($requete);
        $donnees = $resultat->fetch();
          if(!$donnees){
            return false;
          }
          else{
          return $donnees;}
      }

      public function selectMoyNote($id){
            $requete='SELECT AVG(note) AS note FROM '.$this->getTable(true). ' GROUP BY id_produit= '.$id;
              $resultat = $this->getDb()->query($requete);
            $donnees = $resultat->fetch();
              if(!$donnees){
                return false;
              }
              else{
              return $donnees;}
      }

  public function selectNote($id){
      return $this->select($id);
    }

  public function deleteNote($id){
    return $this->delete($id);
  }

  public function insertNote($infos){
    return $this->insert($infos);
  }

  public function updateNote($id,$infos){
    return $this->update($id,$infos);
  }

  public function deleteAllNote(){
  return $this->deleteAll();
  }

}
?>
