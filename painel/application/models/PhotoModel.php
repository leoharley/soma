<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class PhotoModel extends CI_Model
{
    
public function get($offset = 0, $ds_categoria, $id_categoria, $order_field, $order)
  {
    $limit = 18;
    $offset = 0;
    //$offset = $offset * 12;
    $this->db->where('ds_categoria', $ds_categoria);
    $this->db->where('id_categoria', $id_categoria);
    $this->db->limit($limit, $offset);
    $this->db->order_by($order_field, $order);
    $query = $this->db->get('photos');

    return $query->result_array();
  }

  public function get_by_id($id)
  {
    $query = $this->db->get_where('photos', array('id'=>$id));

    return $query->row_array();
  }

  public function persist($photo, $ds_categoria, $id_categoria)
  {
    $photo['date'] = date('Y-m-d', strtotime($photo['date']));
    $photo['ds_categoria'] = $ds_categoria;
    $photo['id_categoria'] = $id_categoria;
    $bool = $this->db->insert('photos', $photo);

    return $bool;
  }

  public function delete($id)
  {
    $bool = $this->db->delete('photos', array('id' => $id));

    return $bool;
  }

  public function update($id, $photo)
  {
    $this->db->where('id', $id);
    $photo['date'] = date('Y-m-d', strtotime($photo['date']));
    $bool = $this->db->update('photos', $photo);

    return $bool;
  }

  public function record_count() {
    return $this->db->count_all('photos');
  }

}