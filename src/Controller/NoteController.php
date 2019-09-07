<?php

namespace Controller;

class NoteController extends Controller{

  public function allInProduit($id){
    $produit = $this->getModel('Model\ProduitModel')->selectProduit($id);
    $notesProduit = $this->getModel()->selectAllNotesInProduit($id);
    $i=0;
    foreach($notesProduit as $note){
      $notesProduit[$i]['membre']=$this->getModel('Model\MembreModel')->selectMembre($note->getField('id_membre'));
      $i++;
    }
    $erreur = array();

    if(!empty($_POST)){

      $champsvides = 0;
      foreach($_POST as $value){
        if(empty($value)) $champsvides++;
      }
      if($champsvides>0){
        $erreur[] = 'Merci de remplir '.$champvides.' champ(s) manquant(s)';
      }

      if(empty($erreur)){
        $this->copyPhoto();
        $this->getModel()->insertProduit($_POST);
        $this->redirect($this->url.'note/allInProduit');
      }

    }
    $params = array(
      'produits' => $produits,
      'notes' => $notesProduit,
      'erreur' =>$erreur,
      'note_actuelle'=>$_POST
    );
    return $this->render('layout.html','notes.html',$params);
  }

}
?>
