<?php
namespace Model;
 class PromotionModel extends Model{

  public function selectAllPromotion($order=''){
    return $this->selectAll($order);
    }

  public function selectPromotion($id){
      return $this->select($id);
    }

    public function deleteNote($id){
        return $this->delete($id);
      }

  public function insertPromotion($infos){
    return $this->insert($infos);
  }

  public function updatePromotion($id,$infos){
    return $this->update($id,$infos);
  }

  public function deleteAllPromotion(){
  return $this->deleteAll();
  }
  public function selectPromotionByRef($ref){
    $q=$this->execRequest('SELECT * FROM '.$this->getTable(true).' WHERE reference = :ref',array('ref'=>$ref));
    $data=$q->fetch();
    if(!$data){
      return false;
    }
    else{
    return $data;}
  }

  public function isPromotionUsed($promotion,$membre){
    $q=$this->execRequest('SELECT * FROM bouquintheque_promotion_par_membre WHERE id_promotion = :promo AND id_membre = :membre ',
    array('promo'=>$promotion,'membre'=>$membre));
    $data=$q->fetch();
    if(!$data){
      return false;
    }
    else{
    return $data;}
  }



public function usePromo($infos){
  $q=$this->execRequest('INSERT INTO bouquintheque_promotion_par_membre (id_membre,id_promotion) VALUES (:'.implode(', :', array_keys($infos)).')',$infos);
  return $this->getDb()->lastInsertId();
}

}
?>