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
          $q=$this->execRequest('SELECT * FROM '.$this->getTable(true). 'WHERE id_produit='.$id );
          // .' '.$order.' '.$desc
          $data=$q->fetchAll(PDO::FETCH_CLASS,'Entity\\'.ucfirst($this->getTable()));
          if(!$data){
            return false;
          }
          else{
          return $data;}
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
