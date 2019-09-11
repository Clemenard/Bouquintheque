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



}
?>
<!-- 75/25/30 -->