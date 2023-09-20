<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Photo_Model extends CI_Model
{
  public $id;
  public $name;
  public $desc;
  public $date;
  public $location;
  public $link_thumb;
  public $link_small;

  public function __construct()
  {
    parent::__construct();
    $this->load->database();
  }

  
}
