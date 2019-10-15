<?php

namespace Controller;

class DiversController extends Controller{

  public function quisommesnous(){
   
    $params = array(
      'titre' => "Qui sommes nous?"
    );
    return $this->render('layout.html','quisommesnous.html',$params);
  }

}
?>