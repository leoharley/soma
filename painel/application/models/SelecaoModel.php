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

        $this->db->where('FaunaClassificacao.st_registro_ativo', 'S');
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
        $res = $this->db->delete('tb_fauna_classificacao');

        if(!$res)
        {
            $error = $this->db->error();
            return $error['code'];
        }
        else
        {
            return TRUE;
        }

        /*$info['st_registro_ativo'] = 'N';
        $this->db->where('id', $id);
        $this->db->update('tb_fauna_classificacao', $info);

        return TRUE;*/
    /*    $this->db->where('id', $id);
        $res2 = $this->db->delete('tb_fauna_classificacao');

        if(!$res1 && !$res2)
        {
            $error = $this->db->error();
            return $error['code'];
        }
        else
        {
            return TRUE;
        } */

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

        $this->db->where('TipoParcela.st_registro_ativo', 'S');
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
        $res = $this->db->delete('tb_tipo_parcela');

        if(!$res)
        {
            $error = $this->db->error();
            return $error['code'];
        }
        else
        {
            return TRUE;
        }

        /*$info['st_registro_ativo'] = 'N';
        $this->db->where('id', $id);
        $this->db->update('tb_tipo_parcela', $info);
        
        return TRUE;*/

    /*    $this->db->where('id', $id);
        $res2 = $this->db->delete('tb_tipo_parcela');

        if(!$res1 && !$res2)
        {
            $error = $this->db->error();
            return $error['code'];
        }
        else
        {
            return TRUE;
        } */

    }
    
    function carregaInfoTipoParcela($id)
    {
        $this->db->select('*');
        $this->db->from('tb_tipo_parcela');
        $this->db->where('id', $id);
        $query = $this->db->get();
        
        return $query->result();
    }


    //TIPO BIOMA
    function listaTipoBioma($searchText = '', $page, $segment)
    {
        $this->db->select('TipoBioma.id, TipoBioma.nome');
        $this->db->from('tb_tipo_bioma as TipoBioma');        
        if(!empty($searchText)) {
            $likeCriteria = "(TipoBioma.id LIKE '%".$searchText."%'
                            OR TipoBioma.nome LIKE '%".$searchText."%')";
            $this->db->where($likeCriteria);
        }

        $this->db->where('TipoBioma.st_registro_ativo', 'S');
        $this->db->limit($page, $segment);
        $query = $this->db->get();
		        
        $result = $query->result();        
        return $result;
    }

    function adicionaTipoBioma($info)
    {
        $this->db->trans_start();
        $this->db->insert('tb_tipo_bioma', $info);
        
        $insert_id = $this->db->insert_id();
        
        $this->db->trans_complete();
        
        return $insert_id;
    }

    function editaTipoBioma($info, $id)
    {
        $this->db->where('id', $id);
        $this->db->update('tb_tipo_bioma', $info);
        
        return TRUE;
    }

    function apagaTipoBioma($id)
    {
        $this->db->where('id', $id);
        $res = $this->db->delete('tb_tipo_bioma');

        if(!$res)
        {
            $error = $this->db->error();
            return $error['code'];
        }
        else
        {
            return TRUE;
        }

        /*$info['st_registro_ativo'] = 'N';
        $this->db->where('id', $id);
        $this->db->update('tb_tipo_bioma', $info);
        
        return TRUE;*/

    /*    $this->db->where('id', $id);
        $res2 = $this->db->delete('tb_tipo_bioma');

        if(!$res1 && !$res2)
        {
            $error = $this->db->error();
            return $error['code'];
        }
        else
        {
            return TRUE;
        } */

    }
    
    function carregaInfoTipoBioma($id)
    {
        $this->db->select('*');
        $this->db->from('tb_tipo_bioma');
        $this->db->where('id', $id);
        $query = $this->db->get();
        
        return $query->result();
    }


    //GRAU EPIFITISMO
    function listaGrauEpifitismo($searchText = '', $page, $segment)
    {
        $this->db->select('GrauEpifitismo.id, GrauEpifitismo.nome');
        $this->db->from('tb_grau_epifitismo as GrauEpifitismo');        
        if(!empty($searchText)) {
            $likeCriteria = "(GrauEpifitismo.id LIKE '%".$searchText."%'
                            OR GrauEpifitismo.nome LIKE '%".$searchText."%')";
            $this->db->where($likeCriteria);
        }

        $this->db->where('GrauEpifitismo.st_registro_ativo', 'S');
        $this->db->limit($page, $segment);
        $query = $this->db->get();
		        
        $result = $query->result();        
        return $result;
    }

    function adicionaGrauEpifitismo($info)
    {
        $this->db->trans_start();
        $this->db->insert('tb_grau_epifitismo', $info);
        
        $insert_id = $this->db->insert_id();
        
        $this->db->trans_complete();
        
        return $insert_id;
    }

    function editaGrauEpifitismo($info, $id)
    {
        $this->db->where('id', $id);
        $this->db->update('tb_grau_epifitismo', $info);
        
        return TRUE;
    }

    function apagaGrauEpifitismo($id)
    {
        $this->db->where('id', $id);
        $res = $this->db->delete('tb_grau_epifitismo');

        if(!$res)
        {
            $error = $this->db->error();
            return $error['code'];
        }
        else
        {
            return TRUE;
        }

        /*$info['st_registro_ativo'] = 'N';
        $this->db->where('id', $id);
        $this->db->update('tb_grau_epifitismo', $info);
       
        return TRUE;*/

    /*    $this->db->where('id', $id);
        $res2 = $this->db->delete('tb_grau_epifitismo');

        if(!$res1 && !$res2)
        {
            $error = $this->db->error();
            return $error['code'];
        }
        else
        {
            return TRUE;
        } */

    }


    //ESTÁGIO REGENERAÇÃO
    function listaEstagioRegeneracao($searchText = '', $page, $segment)
    {
        $this->db->select('EstagioRegeneracao.id, EstagioRegeneracao.nome');
        $this->db->from('tb_estagio_regeneracao as EstagioRegeneracao');        
        if(!empty($searchText)) {
            $likeCriteria = "(EstagioRegeneracao.id LIKE '%".$searchText."%'
                            OR EstagioRegeneracao.nome LIKE '%".$searchText."%')";
            $this->db->where($likeCriteria);
        }

        $this->db->where('EstagioRegeneracao.st_registro_ativo', 'S');
        $this->db->limit($page, $segment);
        $query = $this->db->get();
		        
        $result = $query->result();        
        return $result;
    }

    function adicionaEstagioRegeneracao($info)
    {
        $this->db->trans_start();
        $this->db->insert('tb_estagio_regeneracao', $info);
        
        $insert_id = $this->db->insert_id();
        
        $this->db->trans_complete();
        
        return $insert_id;
    }

    function editaEstagioRegeneracao($info, $id)
    {
        $this->db->where('id', $id);
        $this->db->update('tb_estagio_regeneracao', $info);
        
        return TRUE;
    }

    function apagaEstagioRegeneracao($id)
    {
        $this->db->where('id', $id);
        $res = $this->db->delete('tb_estagio_regeneracao');

        if(!$res)
        {
            $error = $this->db->error();
            return $error['code'];
        }
        else
        {
            return TRUE;
        }

        /*$info['st_registro_ativo'] = 'N';
        $this->db->where('id', $id);
        $this->db->update('tb_estagio_regeneracao', $info);
        
        return TRUE;*/

    /*    $this->db->where('id', $id);
        $res2 = $this->db->delete('tb_estagio_regeneracao');

        if(!$res1 && !$res2)
        {
            $error = $this->db->error();
            return $error['code'];
        }
        else
        {
            return TRUE;
        } */

    }
    
    function carregaInfoEstagioRegeneracao($id)
    {
        $this->db->select('*');
        $this->db->from('tb_estagio_regeneracao');
        $this->db->where('id', $id);
        $query = $this->db->get();
        
        return $query->result();
    }

    function carregaInfoGrauEpifitismo($id)
    {
        $this->db->select('*');
        $this->db->from('tb_grau_epifitismo');
        $this->db->where('id', $id);
        $query = $this->db->get();
        
        return $query->result();
    }


    //GRAU DE PROTEÇÃO
    function listaGrauProtecao($searchText = '', $page, $segment)
    {
        $this->db->select('GrauProtecao.id, GrauProtecao.nome');
        $this->db->from('tb_grau_protecao as GrauProtecao');        
        if(!empty($searchText)) {
            $likeCriteria = "(GrauProtecao.id LIKE '%".$searchText."%'
                            OR GrauProtecao.nome LIKE '%".$searchText."%')";
            $this->db->where($likeCriteria);
        }

        $this->db->where('GrauProtecao.st_registro_ativo', 'S');
        $this->db->limit($page, $segment);
        $query = $this->db->get();
		        
        $result = $query->result();        
        return $result;
    }

    function adicionaGrauProtecao($info)
    {
        $this->db->trans_start();
        $this->db->insert('tb_grau_protecao', $info);
        
        $insert_id = $this->db->insert_id();
        
        $this->db->trans_complete();
        
        return $insert_id;
    }

    function editaGrauProtecao($info, $id)
    {
        $this->db->where('id', $id);
        $this->db->update('tb_grau_protecao', $info);
        
        return TRUE;
    }

    function apagaGrauProtecao($id)
    {
        $this->db->where('id', $id);
        $res = $this->db->delete('tb_grau_protecao');

        if(!$res)
        {
            $error = $this->db->error();
            return $error['code'];
        }
        else
        {
            return TRUE;
        }

        /*$info['st_registro_ativo'] = 'N';
        $this->db->where('id', $id);
        $this->db->update('tb_grau_protecao', $info);
        
        return TRUE;*/

    /*    $this->db->where('id', $id);
        $res2 = $this->db->delete('tb_grau_protecao');

        if(!$res1 && !$res2)
        {
            $error = $this->db->error();
            return $error['code'];
        }
        else
        {
            return TRUE;
        } */

    }
    
    function carregaInfoGrauProtecao($id)
    {
        $this->db->select('*');
        $this->db->from('tb_grau_protecao');
        $this->db->where('id', $id);
        $query = $this->db->get();
        
        return $query->result();
    }


    //FAUNA TIPO DE OBSERVAÇÃO
    function listaFaunaTipoObservacao($searchText = '', $page, $segment)
    {
        $this->db->select('FaunaTipoObservacao.id, FaunaTipoObservacao.nome');
        $this->db->from('tb_fauna_tipo_observacao as FaunaTipoObservacao');        
        if(!empty($searchText)) {
            $likeCriteria = "(FaunaTipoObservacao.id LIKE '%".$searchText."%'
                            OR FaunaTipoObservacao.nome LIKE '%".$searchText."%')";
            $this->db->where($likeCriteria);
        }

        $this->db->where('FaunaTipoObservacao.st_registro_ativo', 'S');
        $this->db->limit($page, $segment);
        $query = $this->db->get();
		        
        $result = $query->result();        
        return $result;
    }

    function adicionaFaunaTipoObservacao($info)
    {
        $this->db->trans_start();
        $this->db->insert('tb_fauna_tipo_observacao', $info);
        
        $insert_id = $this->db->insert_id();
        
        $this->db->trans_complete();
        
        return $insert_id;
    }

    function editaFaunaTipoObservacao($info, $id)
    {
        $this->db->where('id', $id);
        $this->db->update('tb_fauna_tipo_observacao', $info);
        
        return TRUE;
    }

    function apagaFaunaTipoObservacao($id)
    {
        $this->db->where('id', $id);
        $res = $this->db->delete('tb_fauna_tipo_observacao');

        if(!$res)
        {
            $error = $this->db->error();
            return $error['code'];
        }
        else
        {
            return TRUE;
        }

        /*$info['st_registro_ativo'] = 'N';
        $this->db->where('id', $id);
        $this->db->update('tb_fauna_tipo_observacao', $info);

        return TRUE;*/
    /*    $this->db->where('id', $id);
        $res2 = $this->db->delete('tb_fauna_tipo_observacao');

        if(!$res1 && !$res2)
        {
            $error = $this->db->error();
            return $error['code'];
        }
        else
        {
            return TRUE;
        } */

    }
    
    function carregaInfoFaunaTipoObservacao($id)
    {
        $this->db->select('*');
        $this->db->from('tb_fauna_tipo_observacao');
        $this->db->where('id', $id);
        $query = $this->db->get();
        
        return $query->result();
    }


}

  