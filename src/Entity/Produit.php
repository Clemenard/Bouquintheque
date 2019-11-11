<?php
namespace Entity;
class Produit extends Entity {
protected $id_produit,$reference,$categorie,$titre,$description,$auteur,$date_parution,$traducteur,$date_traduction,$editeur,$collection,$photo,$prix,$stock,$is_deleted;

public function getSmallTitle(){
    if (strlen($this->getField('titre'))>25){
        
        $titleTab=explode(" ",$this->getField('titre'));
        $smallTitle="";
        for($i=0;$i<count($titleTab);$i++){
            if(strlen($smallTitle)<25){$smallTitle.=" ".$titleTab[$i];}
        }
        return $smallTitle;
    }
    else{
    return $this->getField('titre');}

}
}
?>
