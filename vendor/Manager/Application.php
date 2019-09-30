<?php
namespace Manager;
final class Application{
  private $controller;
  private $action;
  private $argument='';
  private $argumentBis='';


public function __construct(){
  $tab=explode('/',$_SERVER['REQUEST_URI']);
  if(!empty($tab[2]) && file_exists(__DIR__ . '/../../src/Controller/'.ucfirst($tab[2]).'Controller.php')){
    $this->controller = 'Controller\\'.ucfirst($tab[2]).'Controller';
  }
  else{
  $this->controller =  'Controller\ProduitController';
  }
  if(!empty($tab[3])) {
    $this->action = $tab[3];
  }
  else{
    $this->controller =  'Controller\ProduitController';
    $this->action = 'all';
  }
  if(!empty($tab[4])) {
    $this->argument = urldecode($tab[4]);
  }
  if(!empty($tab[5])) {
    $this->argumentBis = urldecode($tab[5]);
  }

}

public function run(){

  if(!is_null($this->controller)){
    $a=new $this->controller;
    if(!is_null($this->action) && method_exists($a,$this->action)){
      $action=$this->action;
      $a->$action($this->argument,$this->argumentBis);
    }
    else{
      require __DIR__.'/../../src/View/404.html';
    }
  }
}
}


?>
