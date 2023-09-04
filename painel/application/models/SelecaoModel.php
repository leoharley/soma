<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class SelecaoModel extends CI_Model
{
    //FAUNA CLASSIFICACAO
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


    // TIPO PARCELA
    function listaTipoParcela($searchText = '', $page, $segment)
    {
        $this->db->select('TipoParcela.id, TipoParcela.nome');
        $this->db->from('tb_tipo_parcela as TipoParcela');        
        if(!empty($searchText)) {
            $likeCriteria = "(TipoParcela.id LIKE '%".$searchText."%'
                            OR TipoParcela.nome LIKE '%".$searchText."%')";
            $this->db->where($likeCriteria);
        }

        $this->db->limit($page, $segment);
        $query = $this->db->get();
		        
        $result = $query->result();        
        return $result;
    }

    function adicionaTipoParcela($info)
    {
        $this->db->trans_start();
        $this->db->insert('tb_tipo_parcela', $info);
        
        $insert_id = $this->db->insert_id();
        
        $this->db->trans_complete();
        
        return $insert_id;
    }

    function editaTipoParcela($info, $id)
    {
        $this->db->where('id', $id);
        $this->db->update('tb_tipo_parcela', $info);
        
        return TRUE;
    }

    function apagaTipoParcela($id)
    {
        $this->db->where('id', $id);
        $res2 = $this->db->delete('tb_tipo_parcela');

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
    
    function carregaInfoTipoParcela($id)
    {
        $this->db->select('*');
        $this->db->from('tb_tipo_parcela');
        $this->db->where('id', $id);
        $query = $this->db->get();
        
        return $query->result();
    }


}

  