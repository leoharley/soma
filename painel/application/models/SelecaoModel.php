<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class SelecaoModel extends CI_Model
{
    
    function listaFaunaClassificacao($searchText = '', $page, $segment)
    {
        $this->db->select('FaunaClassificacao.id, FaunaClassificacao.nome');
        $this->db->from('tb_fauna_classificacao as FaunaClassificacao');        
        if(!empty($searchText)) {
            $likeCriteria = "(FaunaClassificacao.id LIKE '%".$searchText."%'
                            OR FaunaClassificacao.nome LIKE '%".$searchText."%')";
            $this->db->where($likeCriteria);
        }

        $this->db->limit($page, $segment);
        $query = $this->db->get();
		        
        $result = $query->result();        
        return $result;
    }

    function adicionaFaunaClassificacao($info)
    {
        $this->db->trans_start();
        $this->db->insert('tb_fauna_classificacao', $info);
        
        $insert_id = $this->db->insert_id();
        
        $this->db->trans_complete();
        
        return $insert_id;
    }

    function editaFaunaClassificacao($info, $id)
    {
        $this->db->where('id', $id);
        $this->db->update('tb_fauna_classificacao', $info);
        
        return TRUE;
    }

    function apagaFaunaClassificacao($id)
    {
        $this->db->where('id', $id);
        $res2 = $this->db->delete('tb_fauna_classificacao');

        if(!$res1 && !$res2)
        {
            $error = $this->db->error();
            return $error['code'];
        }
        else
        {
            return TRUE;
        }

    }
    
    function carregaInfoFaunaClassificacao($id)
    {
        $this->db->select('*');
        $this->db->from('tb_fauna_classificacao');
        $this->db->where('id', $id);
        $query = $this->db->get();
        
        return $query->result();
    }
}

  