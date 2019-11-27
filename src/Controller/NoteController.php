<?php

namespace Controller;

class NoteController extends Controller{

  public function notes($id){
    $erreur = array();

    if(!empty($_POST)){

      $champsvides = 0;
      foreach($_POST as $value){
        if(empty($value)) $champsvides++;
      }
      if($champsvides>0){
        $erreur[] = 'Merci de remplir '.$champsvides.' champ(s) manquant(s)';
      }
      if($_POST['note']<0 || $_POST['note']>10){
        $erreur[] = 'Veuillez rentrer une note comprise entre 0 et 10';
      }

      if(empty($erreur)){
        $this->getModel()->insertNote($_POST);
        unset($_POST);
      }

    }
    $produit = $this->getModel('Model\ProduitModel')->selectProduit($id);
    $notesProduit = $this->getModel()->selectAllNotesInProduit($id);
    $i=0;
    if($notesProduit){
    foreach($notesProduit as $note){
      $notesProduit[$i]->membre=$this->getModel('Model\MembreModel')->selectMembre($note->getField('id_membre'));
      $i++;
    }}
    $params = array(
      'produit' => $produit,
      'notes' => $notesProduit,
      'erreur' =>$erreur,
      'note_actuelle'=>$_POST
    );
    return $this->render('layout.html','notes.html',$params);
  }

}
?>
