<?php

namespace Controller;
use PromotionModel;
use CommandeController;

class ProduitController extends Controller{
public $TVA=0.2;

  public function all(){
    $produits = $this->getModel()->selectAllProduit();
    $categories = $this->getModel()->getAllCategories();
    
    $params = array(
      'produits' => $produits,
      'categories' => $categories,
    );
    $params['TVA'] = $this->TVA;
    return $this->render('layout.html','boutique.html',$params);
  }

  // affiche les produits d'une catégorie selectionnée
  public function afficheCategorie($cat){
    $produits = $this->getModel()->getAllProduitsByCategories($cat);
    $categories = $this->getModel()->getAllCategories();
      if($cat)  $selected = $cat;
      else $selected='';
    $params = array(
      'produits' => $produits,
      'categories' => $categories,
      'selected' =>$selected
    );
    $params['TVA'] = $this->TVA;
    return $this->render('layout.html','boutique.html',$params);
  }
  // affiche une fiche produit
  public function affiche($id){
    $message = '';
    $produit = $this->getModel()->selectProduit($id);
    $note = $this->getModel('Model\NoteModel')->selectBestNote($id);
    $moyenneNotes = $this->getModel('Model\NoteModel')->selectMoyNote($id);
    $membre = $this->getModel('Model\MembreModel')->selectMembre($note['id_membre']);
    $autresProduits = $this->getModel()->getThreeOtherProduitsByCategories($produit->getField('categorie'),$id);

    // traiter un ajout au panier
    if( !empty($_POST) ){
      $this->ajoutProduitPanier($_POST['id_produit'],$_POST['quantite']);
      $message = 'Le produit a été ajouté au panier';
    }

    // template : fiche_produit.html
    $params = array(
      'produit' => $produit,
      'message' => $message,
      'autresProduits' => $autresProduits,
      'note' => $note,
      'membre' => $membre,
      'moyenneNotes' => $moyenneNotes
    );
    $params['TVA'] = $this->TVA;
    return $this->render('layout.html','fiche_produit.html',$params);

  }

  // en cas d'utilisation du moteur de recherche
  public function recherche(){

    if(  !empty($_POST['term'])){
      $produits = $this->getModel()->getResultSearch($_POST['term']);

      $nbResultat = ($produits) ? count($produits) : 0;

      $title = 'Recherche de '.$_POST['term'];
      $params = array(
        'title' => $title,
        'produits' => $produits,
        'nbresult' => $nbResultat
      );
      $this->render('layout.html','recherche.html',$params);
    }
    else{
      $this->all();
    }

  }

  // Méthodes liées au PANIER
  public function panier(){

    if(!empty($_POST['viderpanier'])){
      $this->viderPanier();
    }

    if(!empty($_SESSION['panier'])){
      $params['content_panier'] = array();
      for($i=0; $i< count($_SESSION['panier']['id_produit']); $i++){
        $params['content_panier'][$i] = $this->getModel()->selectProduit($_SESSION['panier']['id_produit'][$i]);
      }
    }
    $params['title'] = 'Panier';
    $params['TVA'] = $this->TVA;
    return $this->render('layout.html','panier.html',$params);

  }
  public function verifPromo(){
      if(isset($_POST['validerpanier'])){
        if(isset($_POST['promo']) && !empty($_POST['promo'])){
          $promotion=$this->getModel('Model\PromotionModel')->selectPromotionByRef($_POST['promo']);
          if($promotion==false ) {$erreur[]="Ce code promo n'existe pas.\n";}
          else{
            $isUsed=$this->getModel('Model\PromotionModel')->isPromotionUsed($promotion['id_promotion'],$_SESSION['membre']->getField('id_membre'));
            if($isUsed) {var_dump($isUsed);$erreur[]="Vous avez déja utilisé ce code promo.\n";}
          if(intval($_POST['sommeTotale'])<$promotion['panier_minimum']) $erreur[]="La valeur de votre panier est inférieure à ".$promotion['panier_minimum']." €.\n"; 
          if($promotion['stock']<=0) $erreur[]="La promotion est épuisée.\n";
          if($promotion['date_expiration']<date("Y-m-d") ) $erreur[]="La période de promotion a expiré le .".$promotion['date_expiration']."\n";}
if(isset($erreur)){
  $params['erreur'] = $erreur;
  $params['title'] = 'Panier';
  $params['TVA'] = $this->TVA;
  if(!empty($_SESSION['panier'])){
    $params['content_panier'] = array();
    for($i=0; $i< count($_SESSION['panier']['id_produit']); $i++){
      $params['content_panier'][$i] = $this->getModel()->selectProduit($_SESSION['panier']['id_produit'][$i]);
    }
  }
  return $this->render('layout.html','panier.html',$params);
}
          else{
            $infos = array(
              'id_membre' => $_SESSION['membre']->getField('id_membre'),
              'id_promotion' => $promotion['id_promotion']
            );
            $isUsed=$this->getModel('Model\PromotionModel')->usePromo($infos);
            $promotion['stock']-=1;
            $_POST['sommeTotale']=intval($_POST['sommeTotale'])-$promotion['valeur'];

            $promo=$_POST['promo']."--".$promotion['valeur'];
            $this->redirect($this->url.'commande/afficheCommande/'.$_POST['sommeTotale'].'/'.$promo);
          }
        }
        else{
        $this->redirect($this->url.'commande/afficheCommande/'.$_POST['sommeTotale'].'/Aucune--Zéro'); 
        }
      } 
      } 

  public function creationPanier(){
    if(!isset($_SESSION['panier'])){
      $_SESSION['panier']['id_produit'] = array();
      $_SESSION['panier']['quantite'] = array();
      $_SESSION['panier']['prix'] = array();
    }
  }
  public function viderPanier(){
    if(isset($_SESSION['panier'])){
      unset($_SESSION['panier']);
    }
  }
  public function ajoutProduitPanier($id_produit,$quantite){
    $this->creationPanier();
    $position_produit = array_search($id_produit,$_SESSION['panier']['id_produit']);
    if($position_produit !== false){
      $_SESSION['panier']['quantite'][$position_produit] += $quantite;
    }else{
      $_SESSION['panier']['id_produit'][] = $id_produit;
      $_SESSION['panier']['quantite'][] = $quantite;
      $_SESSION['panier']['prix'][] =  $this->getModel()->selectProduit($id_produit)->getField('prix');
    }
  }

  // methodes admin de gestion des produits
  public function adminProduit($order='',$desc=''){

    // tester si je suis admin
    if(isset($_SESSION['membre']) && $_SESSION['membre']->isAdmin()){
      $params['title'] = 'Admin Produits';
      $params['produits'] = $this->getModel()->selectAllProduit($order,$desc);
      if(empty($desc)){$params['desc']='asc';}
      else{$params['desc']='';}
      return $this->render('layout.html','adminProduit.html',$params);
    }
    else{
      $this->redirect($this->url . 'membre/connexion');
    }
  }

  public function suppProduit($id){
    if( isset($_SESSION['membre']) && $_SESSION['membre']->isAdmin() ){
      $this->getModel()->deleteProduit($id);
      $this->redirect($this->url.'produit/adminProduit');
    }
    else{
      $this->redirect($this->url . 'membre/connexion');
    }
  }

  public function ajoutProduit(){
    if( isset($_SESSION['membre']) && $_SESSION['membre']->isAdmin() ){


      $erreur = array();
      if(!empty($_POST)){

        $champsvides = 0;
        foreach($_POST as $key=>$value){
          if(empty($value) && $key!=("traducteur" || "date_traduction")) $champsvides++;
          if($key==("date_parution" || "date_traduction")){$value=intval($value);}
        }
        if($champsvides>0){
          $erreur[] = 'Merci de remplir '.$champsvides.' champ(s) manquant(s)';
        }

        if(empty($erreur)){
          $this->copyPhoto();
          $this->getModel()->insertProduit($_POST);
          $this->redirect($this->url.'produit/adminProduit');
        }

      }


      $params['title'] = "Ajout d'un produit";
      $params['erreur'] = (!empty($erreur)) ? implode('<br>',$erreur) : '';
      $params['produit_actuel'] = $_POST;
      return $this->render('layout.html','ajoutProduit.html',$params);

    }
    else{
      $this->redirect($this->url . 'membre/connexion');
    }
  }



  public function editProduit($id){
    if( isset($_SESSION['membre']) && $_SESSION['membre']->isAdmin() ){

      $erreur = array();
      if(!empty($_POST)){

        $champsvides = 0;
        foreach($_POST as $key=>$value){

          if(empty($value) && $key!=("traducteur" || "date_traduction" || "photo")) $champsvides++;
          if(empty($value) && $key=="photo"){unset($_POST['photo']);}
        }
        if($champsvides>0){
          $erreur[] = 'Merci de remplir '.$champsvides.' champ(s) manquant(s)';
        }

        if(empty($erreur)){
          $this->copyPhoto();
          $this->getModel()->updateProduit($id,$_POST);
          $this->redirect($this->url.'produit/adminProduit');
        }
      }

      $params['title'] = "Modification d'un produit";
      $params['erreur'] = (!empty($erreur)) ? implode('<br>',$erreur) : '';

      $params['produit_actuel'] = (!empty($_POST)) ? $_POST : $this->getModel()->selectProduit($id)->getFields() ;

      $params['produit_actuel']['photo'] = $this->getModel()->selectProduit($id)->getField('photo');

      return $this->render('layout.html','ajoutProduit.html',$params);

    }
    else{
      $this->redirect($this->url . 'membre/connexion');
    }
  }

  public function copyPhoto(){
    if(!empty($_FILES['photo']['name'])){
      $nom = $_POST['reference'].'_'.$_FILES['photo']['name'];
      $_POST['photo'] = $nom;
      $pathPhoto = __DIR__ . '/../../web/photo/' . $nom;
      move_uploaded_file($_FILES['photo']['tmp_name'],$pathPhoto);
    }
  }

  public function majStocks(){
    if( isset($_SESSION['panier']) ){
      // je deduis le stock pour chaque ligne du panier
      for($i=0; $i<count($_SESSION['panier']['id_produit']);$i++){
        $id_produit = $_SESSION['panier']['id_produit'][$i];
        $produit = $this->getModel()->selectProduit($id_produit);
        $new_stock = $produit->getField('stock') - $_SESSION['panier']['quantite'][$i];
        $this->getModel()->updateProduit($id_produit,array('stock' => $new_stock));
      }
      // destruction  du panier
      $this->viderPanier();
    }
    // retour aux commandes
    $this->redirect($this->url.'commande/afficheCommande');
  }


}

