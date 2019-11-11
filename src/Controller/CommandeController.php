<?php

namespace Controller;
use ProduitModel;

class CommandeController extends Controller{

  public $id_commande;
  public $TVA=0.2;

  public function adminCommande(){

    // tester si je suis admin
    if(isset($_SESSION['membre']) && $_SESSION['membre']->isAdmin()){
      $params['title'] = 'Admin Commandes';
      $params['commandes'] = $this->getModel()->getallDetailsCommandes();
      foreach($params['commandes'] as $ligne){
      $params['details_commandes'][$ligne['id_commande']]  =  $this->getModel()->getDetailsMyCommandes($ligne['id_commande']);
      }

      return $this->render('layout.html','adminCommande.html',$params);
    }
    else{
      $this->redirect($this->url . 'membre/connexion');
    }
  }

  public function changeStatut($idPlusStatut){
    if( isset($_SESSION['membre']) && $_SESSION['membre']->isAdmin() ){
      $tab= explode("-", $idPlusStatut);
      $statut=$tab[1];
      $this->getModel()->update($tab[0],array('etat'=>$statut));
      $this->redirect($this->url . 'commande/adminCommande');
    }
    else{
      $this->redirect($this->url . 'membre/connexion');
    }
  }

  public function afficheDetailsCommande($id){

if(!empty($id)){

    $params['details_commande'] = $this->getModel()->getDetailsMyCommandes($id);
      $params['title'] = 'Détail de ma commande';
      $params['commande'] = $this->getModel()->getMyCommande($id);
      $params['TVA'] = $this->TVA;
      return $this->render('layout.html','detailscommande.html',$params);
  }}

  public function afficheMeilleursVentes(){
    $params['meilleurs_ventes'] = $this->getModel()->getBestSales();
    $params['title'] = 'Meilleures ventes';
    $i=0;
    foreach ($params['meilleurs_ventes'] as $produit){
      $produitbis=$this->getModel('Model\ProduitModel')->selectProduit($produit['id_produit']);
      $params['meilleurs_ventes'][$i]['produit']=$produitbis;
      $i++;
    }
      return $this->render('layout.html','meilleursventes.html',$params);
  }

  public function afficheCommande($sommeTotale=0,$promo="Aucune"){
    if($sommeTotale>0){
        $this->validationCommande($promo,$sommeTotale);}
      $params['title'] = 'Mes Commandes';
      $params['commandes'] = $this->getModel()->getMesCommandes();
      $params['TVA'] = $this->TVA;
      return $this->render('layout.html','commande.html',$params);
  }

  public function validationCommande($promo,$sommeTotale){
    // panier devient une commande
    var_dump($_SESSION);
    if(isset($_SESSION['panier'])){
      // insertion de la commande

      $infos = array(
        'id_membre' => $_SESSION['membre']->getField('id_membre'),
        'montant' => $sommeTotale,
        'date_enregistrement' => date('Y-m-d H:i:s'),
        'etat' => 'en cours de traitement',
        'promotion' => $promo
      );
      $this->id_commande = $this->getModel()->registerCommande($infos);
      // $membre = new Model/Membre;
      // $_SESSION['membre']->setField('experience',$montant+$_SESSION['membre']->getField('experience'));
      // $membre->update(array('experience'=>$_SESSION['membre']->getField('experience')));

      // insertion des détails de la commande
      for($i=0; $i<count($_SESSION['panier']['id_produit']);$i++){
        $details = array(
          'id_commande' => $this->id_commande,
          'id_produit' => $_SESSION['panier']['id_produit'][$i],
          'quantite' =>$_SESSION['panier']['quantite'][$i],
          'prix' => $_SESSION['panier']['prix'][$i]
        );
        $this->getModel()->registerDetails($details);
      }
      // faire appel aux méthodes liées au produit
      $this->redirect($this->url.'produit/majStocks');

    }
  }

}
