<?php

namespace Controller;

class PromotionController extends Controller{
    public function adminPromotion($order='',$desc=''){

        // tester si je suis admin
        if(isset($_SESSION['membre']) && $_SESSION['membre']->isAdmin()){
          $params['title'] = 'Admin Promotions';
          $params['promotions'] = $this->getModel()->selectAllPromotion($order,$desc);
          if(empty($desc)){$params['desc']='asc';}
          else{$params['desc']='';}
          return $this->render('layout.html','adminPromotion.html',$params);
        }
        else{
          $this->redirect($this->url . 'membre/connexion');
        }
      }

      public function ajoutPromotion(){
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
              $this->getModel()->insertPromotion($_POST);
              $this->redirect($this->url.'promotion/adminPromotion');
            }
    
          }
    
    
          $params['title'] = "Ajout d'une promotion";
          $params['erreur'] = (!empty($erreur)) ? implode('<br>',$erreur) : '';
          $params['promotion_actuel'] = $_POST;
          return $this->render('layout.html','ajoutPromotion.html',$params);
    
        }
        else{
          $this->redirect($this->url . 'membre/connexion');
        }
      }
      public function editPromotion($id){
        if( isset($_SESSION['membre']) && $_SESSION['membre']->isAdmin() ){
    
          $erreur = array();
          if(!empty($_POST)){
    
            $champsvides = 0;
            foreach($_POST as $value){
    
              if(empty($value) ) $champsvides++;
            }
            if($champsvides>0){
              $erreur[] = 'Merci de remplir '.$champsvides.' champ(s) manquant(s)';
            }
    
            if(empty($erreur)){
              $this->getModel()->updatePromotion($id,$_POST);
              $this->redirect($this->url.'promotion/adminPromotion');
            }
          }
    
          $params['title'] = "Modification d'une promotion";
          $params['erreur'] = (!empty($erreur)) ? implode('<br>',$erreur) : '';
    
          $params['promotion_actuel'] = (!empty($_POST)) ? $_POST : $this->getModel()->selectPromotion($id)->getFields() ;
    
    
          return $this->render('layout.html','ajoutPromotion.html',$params);
    
        }
        else{
          $this->redirect($this->url . 'membre/connexion');
        }
      }
    }
    ?>