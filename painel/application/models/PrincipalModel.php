<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class PrincipalModel extends CI_Model
{
    
// INICIO DAS CONSULTAS NA TELA DE USUÁRIO
    function listaProjetos($searchText = '', $page, $segment)
    {
        $this->db->select('Projetos.id, Projetos.nome, Projetos.perimetro, Projetos.dt_inicio, Projetos.dt_final, CadastroPessoa.no_resp_tecnico');
        $this->db->from('tb_projetos as Projetos');        
        $this->db->join('tb_cadastro_pessoa as CadastroPessoa', 'CadastroPessoa.id_acesso = Projetos.id_resp_tecnico','left');
        if(!empty($searchText)) {
            $likeCriteria = "(Projetos.nome LIKE '%".$searchText."%'
                            OR Projetos.perimetro LIKE '%".$searchText."%')";
            $this->db->where($likeCriteria);
        }

        $this->db->where('Projetos.st_registro_ativo', 'S');
        $this->db->limit($page, $segment);
        $query = $this->db->get();
		        
        $result = $query->result();        
        return $result;
    }

    function adicionaProjeto($infoUsuario)
    {
        $this->db->trans_start();
        $this->db->insert('tb_projetos', $infoUsuario);
        
        $insert_id = $this->db->insert_id();
        
        $this->db->trans_complete();
        
        return $insert_id;
    }

    function editaProjeto($infoProjeto, $IdProjeto)
    {
        $this->db->where('id', $IdProjeto);
        $this->db->update('tb_projetos', $infoProjeto);
        
        return TRUE;
    }

    function apagaProjeto($IdProjeto)
    {
        $infoProjeto['st_registro_ativo'] = 'N';

        $id_propriedade = $this->carregaInfoIdPropriedade($IdProjeto)[0]->id;

        $this->db->where('id', $IdProjeto);
        $this->db->update('tb_projetos', $infoProjeto);

        $this->db->where('id_projeto', $IdProjeto);
        $this->db->update('tb_propriedades', $infoProjeto);

        $this->db->where('id_propriedade', $id_propriedade);
        $this->db->update('tb_parcelas', $infoProjeto);
        
        $this->db->reconnect();
        $this->db->start_cache();

        $sql="
        UPDATE tb_arvores_vivas
        set st_registro_ativo = 'N'
        where id_parcela in (select id from tb_parcelas 
        where id_propriedade = {$id_propriedade})";

        $query = $this->db->query($sql);
        $this->db->stop_cache();
        $this->db->flush_cache();

        $this->db->reconnect();
        $this->db->start_cache();

        $sql="
        UPDATE tb_animais
        set st_registro_ativo = 'N'
        where id_parcela in (select id from tb_parcelas 
        where id_propriedade = {$id_propriedade})";

        $query = $this->db->query($sql);
        $this->db->stop_cache();
        $this->db->flush_cache();

        $this->db->reconnect();
        $this->db->start_cache();

        $sql="
        UPDATE tb_epifitas
        set st_registro_ativo = 'N'
        where id_parcela in (select id from tb_parcelas 
        where id_propriedade = {$id_propriedade})";

        $query = $this->db->query($sql);
        $this->db->stop_cache();
        $this->db->flush_cache();

        $this->db->reconnect();
        $this->db->start_cache();

        $sql="
        UPDATE tb_hidrologia
        set st_registro_ativo = 'N'
        where id_parcela in (select id from tb_parcelas 
        where id_propriedade = {$id_propriedade})";

        $query = $this->db->query($sql);
        $this->db->stop_cache();
        $this->db->flush_cache();
    
        return TRUE;
    }

    function carregaInfoIdPropriedade($id)
    {
        $this->db->select('id');
        $this->db->from('tb_propriedades');
        $this->db->where('id_projeto', $id);
        $query = $this->db->get();
        
        return $query->result();
    }

    function carregaInfoIdParcela($id)
    {
        $this->db->select('id');
        $this->db->from('tb_parcelas');
        $this->db->where('id_parcela', $id);
        $query = $this->db->get();
        
        return $query->result();
    }



    function listaPropriedades($searchText = '', $page, $segment)
    {
        $this->db->select('*');
        $this->db->from('tb_propriedades as Propriedades');        
   //     $this->db->join('tbl_roles as Role', 'Role.roleId = Usuarios.roleId','left');
        if(!empty($searchText)) {
            $likeCriteria = "(Propriedades.no_propriedade LIKE '%".$searchText."%'
                            OR Propriedades.proprietario LIKE '%".$searchText."%')";
            $this->db->where($likeCriteria);
        }

        $this->db->where('Propriedades.st_registro_ativo', 'S');
        $this->db->limit($page, $segment);
        $query = $this->db->get();
		        
        $result = $query->result();        
        return $result;
    }

    function adicionaPropriedade($infoPropriedade)
    {
        $this->db->trans_start();
        $this->db->insert('tb_propriedades', $infoPropriedade);
        
        $insert_id = $this->db->insert_id();
        
        $this->db->trans_complete();
        
        return $insert_id;
    }

    function editaPropriedade($infoPropriedade, $IdPropriedade)
    {
        $this->db->where('id', $IdPropriedade);
        $this->db->update('tb_propriedades', $infoPropriedade);
        
        return TRUE;
    }

    function apagaPropriedade($idPropriedade)
    {
        $info['st_registro_ativo'] = 'N';
        $this->db->where('id', $idPropriedade);
        $this->db->update('tb_propriedades', $info);
        
        $this->db->where('id_propriedade', $idPropriedade);
        $this->db->update('tb_parcelas', $infoProjeto);
        
        $this->db->reconnect();
        $this->db->start_cache();

        $sql="
        UPDATE tb_arvores_vivas
        set st_registro_ativo = 'N'
        where id_parcela in (select id from tb_parcelas 
        where id_propriedade = {$idPropriedade})";

        $query = $this->db->query($sql);
        $this->db->stop_cache();
        $this->db->flush_cache();

        $this->db->reconnect();
        $this->db->start_cache();

        $sql="
        UPDATE tb_animais
        set st_registro_ativo = 'N'
        where id_parcela in (select id from tb_parcelas 
        where id_propriedade = {$idPropriedade})";

        $query = $this->db->query($sql);
        $this->db->stop_cache();
        $this->db->flush_cache();

        $this->db->reconnect();
        $this->db->start_cache();

        $sql="
        UPDATE tb_epifitas
        set st_registro_ativo = 'N'
        where id_parcela in (select id from tb_parcelas 
        where id_propriedade = {$idPropriedade})";

        $query = $this->db->query($sql);
        $this->db->stop_cache();
        $this->db->flush_cache();

        $this->db->reconnect();
        $this->db->start_cache();

        $sql="
        UPDATE tb_hidrologia
        set st_registro_ativo = 'N'
        where id_parcela in (select id from tb_parcelas 
        where id_propriedade = {$idPropriedade})";

        $query = $this->db->query($sql);
        $this->db->stop_cache();
        $this->db->flush_cache();
        
        return TRUE;

    }



    function listaParcelas($searchText = '', $page, $segment)
    {
        $this->db->select('Parcelas.*, Propriedades.no_propriedade, EstagioRegeneracao.nome as nome_estagio_regeneracao, GrauEpifitismo.nome as nome_grau_epifitismo, TipoBioma.nome as nome_tipo_bioma');
        $this->db->from('tb_parcelas as Parcelas');
        $this->db->join('tb_propriedades as Propriedades', 'Propriedades.id = Parcelas.id_propriedade','left');        
        $this->db->join('tb_estagio_regeneracao as EstagioRegeneracao', 'EstagioRegeneracao.id = Parcelas.id_estagio_regeneracao','left');        
        $this->db->join('tb_grau_epifitismo as GrauEpifitismo', 'GrauEpifitismo.id = Parcelas.id_grau_epifitismo','left');        
        $this->db->join('tb_tipo_bioma as TipoBioma', 'TipoBioma.id = Parcelas.id_tipo_bioma','left');        
   //     $this->db->join('tbl_roles as Role', 'Role.roleId = Usuarios.roleId','left');
        if(!empty($searchText)) {
            $likeCriteria = "(Parcelas.nu_ano_emissao LIKE '%".$searchText."%'
                            OR Parcelas.tipo_bioma LIKE '%".$searchText."%')";
            $this->db->where($likeCriteria);
        }

        $this->db->where('Parcelas.st_registro_ativo', 'S');
        $this->db->limit($page, $segment);
        $query = $this->db->get();
		        
        $result = $query->result();        
        return $result;
    }

    function adicionaParcela($infoParcela)
    {
        $this->db->trans_start();
        $this->db->insert('tb_parcelas', $infoParcela);
        
        $insert_id = $this->db->insert_id();
        
        $this->db->trans_complete();
        
        return $insert_id;
    }

    function editaParcela($infoParcela, $IdParcela)
    {
        $this->db->where('id', $IdParcela);
        $this->db->update('tb_parcelas', $infoParcela);
        
        return TRUE;
    }

    function apagaParcela($idParcela)
    {
        $info['st_registro_ativo'] = 'N';
        $this->db->where('id', $idParcela);
        $this->db->update('tb_parcelas', $info);
        
        $this->db->reconnect();
        $this->db->start_cache();

        $sql="
        UPDATE tb_arvores_vivas
        set st_registro_ativo = 'N'
        where id_parcela = {$idParcela})";

        $query = $this->db->query($sql);
        $this->db->stop_cache();
        $this->db->flush_cache();

        $this->db->reconnect();
        $this->db->start_cache();

        $sql="
        UPDATE tb_animais
        set st_registro_ativo = 'N'
        where id_parcela = {$idParcela})";

        $query = $this->db->query($sql);
        $this->db->stop_cache();
        $this->db->flush_cache();

        $this->db->reconnect();
        $this->db->start_cache();

        $sql="
        UPDATE tb_epifitas
        set st_registro_ativo = 'N'
        where id_parcela = {$idParcela})";

        $query = $this->db->query($sql);
        $this->db->stop_cache();
        $this->db->flush_cache();

        $this->db->reconnect();
        $this->db->start_cache();

        $sql="
        UPDATE tb_hidrologia
        set st_registro_ativo = 'N'
        where id_parcela = {$idParcela})";

        $query = $this->db->query($sql);
        $this->db->stop_cache();
        $this->db->flush_cache();


        return TRUE;
    }

    function apagaFilhos($tabela, $coluna, $id)
    {
        $info['st_registro_ativo'] = 'N';
        $this->db->where($coluna, $id);
        $this->db->update($tabela, $info);
        
        return TRUE;
    }


    function adicionaAcesso($infoAcesso)
    {
        $this->db->trans_start();
        $this->db->insert('tb_acesso', $infoAcesso);
        
        $insert_id = $this->db->insert_id();
        
        $this->db->trans_complete();

        return $insert_id;
    }

    function editaUsuario($infoUsuario, $IdUsuario)
    {
        $this->db->where('co_seq_cadastro_pessoa', $IdUsuario);
        $this->db->update('tb_cadastro_pessoa', $infoUsuario);
        
        return TRUE;
    }

    function setaUsuarioAdm($IdUsuario, $infoUsuario)
    {
        $this->db->where('co_seq_cadastro_pessoa', $IdUsuario);
        $this->db->update('tb_cadastro_pessoa', $infoUsuario);
        
        return TRUE;
    }
    
    function apagaUsuario($IdUsuario)
    {
        $info['st_registro_ativo'] = 'N';
        $this->db->where('id', $IdUsuario);
        $this->db->update('tb_cadastro_pessoa', $info);
        
        return TRUE;

    /*    $this->db->where('co_seq_cadastro_pessoa', $IdUsuario);
        $res2 = $this->db->delete('tb_cadastro_pessoa');

        if(!$res1 && !$res2)
        {
            $error = $this->db->error();
            return $error['code'];
            //return array $error['code'] & $error['message']
        }
        else
        {
            return TRUE;
        }*/

        // $this->db->where('Id_Usuario', $IdUsuario);
        // $this->db->update('TabUsuario', $infoUsuario);
        
        // return $this->db->affected_rows();
    }

    function carregaInfoParcela($IdParcela)
    {
        $this->db->select('*');
        $this->db->from('tb_parcelas');
        $this->db->where('id', $IdParcela);
        $query = $this->db->get();
        
        return $query->result();
    }

    function carregaInfoArvoreViva($IdArvoreViva)
    {
        $this->db->select('ArvoresVivas.*,Rl.id_familia,Rl.id_genero,Rl.id_especie');
        $this->db->from('tb_arvores_vivas as ArvoresVivas');
        $this->db->join('rl_flora_familia_genero_especie as Rl', 'Rl.id_arvores_vivas = ArvoresVivas.id','left'); 
        $this->db->where('ArvoresVivas.id', $IdArvoreViva);
        $query = $this->db->get();
        
        return $query->result();
    }

    function carregaInfoEpifita($IdEpifita)
    {
        $this->db->select('Epifitas.*,Rl.id_familia,Rl.id_genero,Rl.id_especie');
        $this->db->from('tb_epifitas as Epifitas');
        $this->db->join('rl_epifitas_familia_genero_especie as Rl', 'Rl.id_epifitas = Epifitas.id','left'); 
        $this->db->where('Epifitas.id', $IdEpifita);
        $query = $this->db->get();
        
        return $query->result();
    }

    function carregaInfoHidrologia($IdHidrologia)
    {
        $this->db->select('Hidrologia.*');
        $this->db->from('tb_hidrologia as Hidrologia');
        $this->db->where('Hidrologia.id', $IdHidrologia);
        $query = $this->db->get();
        
        return $query->result();
    }

    function carregaInfoAnimal($IdAnimal)
    {
        $this->db->select('Animais.*,Rl.id_familia,Rl.id_genero,Rl.id_especie');
        $this->db->from('tb_animais as Animais');
        $this->db->join('rl_fauna_familia_genero_especie as Rl', 'Rl.id_animais = Animais.id','left'); 
        $this->db->where('Animais.id', $IdAnimal);
        $query = $this->db->get();
        
        return $query->result();
    }

    function carregaInfoPerfil()
    {
        $this->db->select('id_perfil, ds_perfil, st_admin');
        $this->db->from('tb_perfil');
        $query = $this->db->get();
        
        return $query->result();
    }

    function carregaInfoEstagiosRegeneracao()
    {
        $this->db->select('id, nome');
        $this->db->from('tb_estagio_regeneracao');
        $query = $this->db->get();
        
        return $query->result();
    }

    function carregaInfoGrausEpifitismo()
    {
        $this->db->select('id, nome');
        $this->db->from('tb_grau_epifitismo');
        $query = $this->db->get();
        
        return $query->result();
    }

    function carregaInfoTiposBioma()
    {
        $this->db->select('id, nome');
        $this->db->from('tb_tipo_bioma');
        $query = $this->db->get();
        
        return $query->result();
    }

    function carregaInfoTiposParcela()
    {
        $this->db->select('id, nome');
        $this->db->from('tb_tipo_parcela');
        $query = $this->db->get();
        
        return $query->result();
    }

    function carregaInfoTiposObservacao()
    {
        $this->db->select('id, nome');
        $this->db->from('tb_fauna_tipo_observacao');
        $query = $this->db->get();
        
        return $query->result();
    }

    function carregaInfoGrausProtecao()
    {
        $this->db->select('id, nome');
        $this->db->from('tb_grau_protecao');
        $query = $this->db->get();
        
        return $query->result();
    }

    function carregaInfoFaunaClassificacoes()
    {
        $this->db->select('id, nome');
        $this->db->from('tb_fauna_classificacao');
        $query = $this->db->get();
        
        return $query->result();
    }

    function carregaInfoUsuario($IdUsuario)
    {
        $this->db->select('co_seq_cadastro_pessoa, id_perfil, ds_nome, ds_email, nu_cpf, st_admin');
        $this->db->from('tb_cadastro_pessoa');
        $this->db->where('co_seq_cadastro_pessoa', $IdUsuario);
        $query = $this->db->get();
        
        return $query->result();
    }
    

    function carregaInfoUsuarioPorEmail($email)
    {
        $this->db->select('co_seq_cadastro_pessoa, ds_nome, ds_email, nu_cpf, st_admin');
        $this->db->from('tb_cadastro_pessoa');
        $this->db->where('ds_email', $email);
        $query = $this->db->get();

        return $query->result();
    }

    function consultaUsuarioExistente($CpfUsuario, $Email)
    {
        $this->db->select('co_seq_cadastro_pessoa, ds_nome, ds_email, nu_cpf');
        $this->db->from('tb_cadastro_pessoa');
        $campos = "((\"nu_cpf\" = '".$CpfUsuario."'
                    OR ds_email = '".$Email."'))";
        $this->db->where($campos);
        $query = $this->db->get();
        
        return $query->result();
    }

    function carregaInfoPropriedadeExistente($IdPropriedade)
    {
        $this->db->select('*');
        $this->db->from('tb_propriedades');
        $this->db->where('id', $IdPropriedade);
        $query = $this->db->get();
        
        return $query->result();
    }

    function carregaInfoProjetoExistente($IdProjeto)
    {
        $this->db->select('*');
        $this->db->from('tb_projetos');
        $this->db->where('id', $IdProjeto);
        $query = $this->db->get();
        
        return $query->result();
    }


// FIM DAS CONSULTAS NA TELA DE USUÁRIO

// INICIO DAS CONSULTAS NA TELA DE PERFIL
function listaPerfis($searchText = '', $page, $segment)
{
    $this->db->select('Perfis.id_perfil, Perfis.ds_perfil');
    $this->db->from('tb_perfil as Perfis');

    if(!empty($searchText)) {
        $likeCriteria = "(Perfis.ds_perfil  LIKE '%".$searchText."%')";
        $this->db->where($likeCriteria);
    }

    $this->db->where('Perfis.st_registro_ativo', 'S');
    $this->db->limit($page, $segment);
    $query = $this->db->get();
    
    $result = $query->result();        
    return $result;
}

function adicionaPerfil($infoPerfil)
{
    $this->db->trans_start();
    $this->db->insert('tb_perfil', $infoPerfil);
    $insert_id = $this->db->insert_id();
    $this->db->trans_complete();

    $DsTelas = array('Projetos','Propriedades','Parcelas','Flora','Fauna','Epitetas');

    foreach ($DsTelas as $data) {
        $infoPermissao = array('id_perfil'=> $insert_id, 'ds_tela'=>$data,
        'dt_cadastro'=>date('Y-m-d H:i:s'));
        $this->db->trans_start();
        $this->db->insert('tb_permissao', $infoPermissao);
        
        $insert_id_Permissao = $this->db->insert_id();
        
        $this->db->trans_complete();
    }
    
    return $insert_id;
}

function editaPerfil($infoPerfil, $IdPerfil)
{
    $this->db->where('id_perfil', $IdPerfil);
    $this->db->update('tb_perfil', $infoPerfil);
    
    return TRUE;
}

function apagaPerfil($infoPerfil, $IdPerfil)
{
    $info['st_registro_ativo'] = 'N';
    $this->db->where('id', $IdPerfil);
    $this->db->update('tb_permissao', $info);
        
    return TRUE;

    /*    $this->db->where('id_perfil', $IdPerfil);
        $res1 = $this->db->delete('tb_permissao');

        $this->db->where('id_perfil', $IdPerfil);
        $res2 = $this->db->delete('tb_perfil');

        if(!$res1 && !$res2)
        {
            $error = $this->db->error();
            return $error['code'];
            //return array $error['code'] & $error['message']
        }
        else
        {
            return TRUE;
        }*/
}

function carregaInfoPerfilExistente($IdPerfil)
{
    $this->db->select('id_perfil, ds_perfil, st_admin');
    $this->db->from('tb_perfil');
    $this->db->where('id_perfil', $IdPerfil);
    $query = $this->db->get();
    
    return $query->result();
}
// FIM DAS CONSULTAS NA TELA DE PERFIL

// INICIO DAS CONSULTAS NA TELA DE PERMISSOES
function listaPermissao($idUser, $searchText = '', $page, $segment)
{
    $this->db->select('Permissao.id_permissao, Perfis.ds_perfil, Permissao.ds_tela, Permissao.atualizar,
    Permissao.Inserir, Permissao.excluir, Permissao.consultar, Permissao.imprimir');
    $this->db->from('tb_permissao as Permissao');    
    $this->db->join('tb_perfil as Perfis', 'Perfis.id_perfil = Permissao.id_perfil','inner');
    if(!empty($searchText)) {
        $likeCriteria = "(Perfis.ds_perfil LIKE '%".$searchText."%'
                        OR Permissao.ds_tela LIKE '%".$searchText."%')";
        $this->db->where($likeCriteria);
    }

    $this->db->where('Permissao.st_registro_ativo', 'S');
//   $this->db->where('Permissao.CriadoPor', $idUser);
    $this->db->limit($page, $segment);
    $query = $this->db->get();
    
    $result = $query->result();        
    return $result;
}

function editaPermissao($infoPermissao, $IdPermissao)
{
    $this->db->where('id_permissao', $IdPermissao);
    $this->db->update('tb_permissao', $infoPermissao);
    
    return TRUE;
}

function carregaInfoPermissao($IdPermissao)
{
    $this->db->select('Permissao.id_permissao, Perfis.ds_perfil, Permissao.ds_tela, Permissao.atualizar,
    Permissao.Inserir, Permissao.excluir, Permissao.consultar, Permissao.imprimir');
    $this->db->from('tb_permissao as Permissao');    
    $this->db->join('tb_perfil as Perfis', 'Perfis.id_perfil = Permissao.id_perfil','inner');
    $this->db->where('id_permissao', $IdPermissao);
    $this->db->where('st_registro_ativo','S');
    $query = $this->db->get();
    
    return $query->result();
}
// FIM DAS CONSULTAS NA TELA DE PERMISSAO

    /**
     * This function is used to get the user roles information
     * @return array $result : This is result of the query
     */
    function carregaPerfisUsuarios()
    {
        $this->db->select('id_perfil, ds_perfil');
        $this->db->from('tb_perfil');
        $this->db->where('st_registro_ativo','S');
        $query = $this->db->get();
        
        return $query->result();
    }


    function carregaInfoProjetos()
    {
        $this->db->select('*');
        $this->db->from('tb_projetos as Projetos');
        $this->db->where('st_registro_ativo','S');
        $query = $this->db->get();

        return $query->result();
    }

    function carregaInfoPropriedades()
    {
        $this->db->select('*');
        $this->db->from('tb_propriedades as Propriedades');
        $this->db->where('st_registro_ativo','S');
        $query = $this->db->get();

        return $query->result();
    }

    function carregaInfoParcelas()
    {
        $this->db->select('Parcelas.*, Propriedades.no_propriedade');
        $this->db->from('tb_parcelas as Parcelas');
        $this->db->join('tb_propriedades as Propriedades', 'Propriedades.id = Parcelas.id_propriedade and Propriedades.st_registro_ativo = \'S\'','left');
        $this->db->where('Parcelas.st_registro_ativo','S');
        $query = $this->db->get();

        return $query->result();
    }

    function carregaInfoFamilias()
    {
        $this->db->select('Familias.id, Familias.nome');
        $this->db->from('tb_flora_familia as Familias');
        $this->db->where('st_registro_ativo','S');
        $query = $this->db->get();

        return $query->result();
    }

    function carregaInfoGeneros()
    {
        $this->db->select('Generos.id, Generos.nome');
        $this->db->from('tb_flora_genero as Generos');
        $this->db->where('st_registro_ativo','S');
        $query = $this->db->get();

        return $query->result();
    }

    function carregaInfoEspecies()
    {
        $this->db->select('distinct(Especies.id), Especies.nome');
        $this->db->from('tb_flora_especie as Especies');
        $this->db->where('st_registro_ativo','S');
        $query = $this->db->get();

        return $query->result();
    }

    function carregaInfoRespTecnico()
    {
        $this->db->select('CadastroPessoa.co_seq_cadastro_pessoa as id_resp_tecnico, CadastroPessoa.ds_nome as no_resp_tecnico');
        $this->db->from('tb_cadastro_pessoa as CadastroPessoa');
        $this->db->join('tb_perfil as Perfil', 'Perfil.id_perfil = CadastroPessoa.id_perfil and Perfil.st_registro_ativo = \'S\'','left');
        $this->db->where('Perfil.ds_perfil','Engenheiro');
        $this->db->where('CadastroPessoa.st_registro_ativo','S');
        $query = $this->db->get();

        return $query->result();
    }


    function carregaInfoFamiliasFauna()
    {
        $this->db->select('Familias.id, Familias.nome');
        $this->db->from('tb_fauna_familia as Familias');
        $this->db->where('st_registro_ativo','S');
        $query = $this->db->get();

        return $query->result();
    }

    function carregaInfoGenerosFauna()
    {
        $this->db->select('Generos.id, Generos.nome');
        $this->db->from('tb_fauna_genero as Generos');
        $this->db->where('st_registro_ativo','S');
        $query = $this->db->get();

        return $query->result();
    }

    function carregaInfoEspeciesFauna()
    {
        $this->db->select('Especies.id, Especies.nome');
        $this->db->from('tb_fauna_especie as Especies');
        $this->db->where('st_registro_ativo','S');
        $query = $this->db->get();

        return $query->result();
    }

    function listaArvoresVivas($searchText = '', $page, $segment)
    {
        $this->db->select('ArvoresVivas.*,Parcelas.id as id_parcela, Propriedades.no_propriedade, CadastroPessoa.ds_nome, GrauProtecao.nome as nome_grau_protecao');
        $this->db->from('tb_arvores_vivas as ArvoresVivas');
        $this->db->join('tb_parcelas as Parcelas', 'Parcelas.id = ArvoresVivas.id_parcela','left');
        $this->db->join('tb_propriedades as Propriedades', 'Propriedades.id = Parcelas.id_propriedade','left');        
        $this->db->join('tb_acesso as Acesso', 'Acesso.co_seq_acesso = ArvoresVivas.id_acesso','left'); 
        $this->db->join('tb_cadastro_pessoa as CadastroPessoa', 'CadastroPessoa.id_acesso = Acesso.co_seq_acesso','left'); 
        $this->db->join('tb_grau_protecao as GrauProtecao', 'GrauProtecao.id = ArvoresVivas.id_grau_protecao','left');        
   //     $this->db->join('tbl_roles as Role', 'Role.roleId = Usuarios.roleId','left');
        if(!empty($searchText)) {
            $likeCriteria = "(ArvoresVivas.grau_protecao LIKE '%".$searchText."%'
                            OR ArvoresVivas.floracao_frutificacao LIKE '%".$searchText."%')";
            $this->db->where($likeCriteria);
        }

        $this->db->where('ArvoresVivas.st_registro_ativo', 'S');
        $this->db->limit($page, $segment);
        $query = $this->db->get();
		        
        $result = $query->result();        
        return $result;
    }

    function adicionaArvoreViva($infoArvoreViva)
    {
        $this->db->trans_start();
        $this->db->insert('tb_arvores_vivas', $infoArvoreViva);
        
        $insert_id = $this->db->insert_id();
        
        $this->db->trans_complete();
        
        return $insert_id;
    }

    function editaArvoreViva($infoArvoreViva, $IdArvoreViva)
    {
        $this->db->where('id', $IdArvoreViva);
        $this->db->update('tb_arvores_vivas', $infoArvoreViva);
        
        return TRUE;
    }

    function apagaArvoreViva($IdArvoreViva)
    {
        $info['st_registro_ativo'] = 'N';
        $this->db->where('id_arvores_vivas', $IdArvoreViva);
        $this->db->update('rl_flora_familia_genero_especie', $info);
        $this->db->where('id', $IdArvoreViva);
        $this->db->update('tb_arvores_vivas', $info);
        
        return TRUE;

    /*    $this->db->where('id_arvores_vivas', $IdArvoreViva);
        $res1 = $this->db->delete('rl_flora_familia_genero_especie');
        $this->db->where('id', $IdArvoreViva);
        $res2 = $this->db->delete('tb_arvores_vivas');

        if(!$res1 && !$res2)
        {
            $error = $this->db->error();
            return $error['code'];
        }
        else
        {
            return TRUE;
        }*/

    }

    function adicionaRlFloraFamiliaGeneroEspecie($infoRlFloraFamiliaGeneroEspecie)
    {
        $this->db->trans_start();
        $this->db->insert('rl_flora_familia_genero_especie', $infoRlFloraFamiliaGeneroEspecie);
        
        $insert_id = $this->db->insert_id();
        
        $this->db->trans_complete();
        
        return $insert_id;
    }

    function editaRlFloraFamiliaGeneroEspecie($infoRlFloraFamiliaGeneroEspecie, $IdArvoreViva)
    {
        $this->db->where('id_arvores_vivas', $IdArvoreViva);
        $this->db->update('rl_flora_familia_genero_especie', $infoRlFloraFamiliaGeneroEspecie);
        
        return TRUE;
    }

    function apagaRlFloraFamiliaGeneroEspecie($IdRlFloraFamiliaGeneroEspecie)
    {
        $info['st_registro_ativo'] = 'N';
        $this->db->where('id', $IdRlFloraFamiliaGeneroEspecie);
        $this->db->update('rl_flora_familia_genero_especie', $info);
        
        return TRUE;

    /*    $this->db->where('id', $IdRlFloraFamiliaGeneroEspecie);
        $res2 = $this->db->delete('rl_flora_familia_genero_especie');

        if(!$res1 && !$res2)
        {
            $error = $this->db->error();
            return $error['code'];
        }
        else
        {
            return TRUE;
        }*/

    }

    function consultaGenero($idFamilia)
    {
        $this->db->select('distinct(Genero.id), Genero.nome');
        $this->db->from('tb_flora as Flora');
        $this->db->join('tb_flora_genero as Genero', 'Genero.id = Flora.id_genero','left');
        $this->db->where('Flora.id_familia', $idFamilia);
        $query = $this->db->get();

        return $query->result();
    }

    function consultaEspecie($idGenero)
    {
        $this->db->select('distinct(Especie.id), Especie.nome, Especie.no_popular');
        $this->db->from('tb_flora as Flora');
        $this->db->join('tb_flora_especie as Especie', 'Especie.id = Flora.id_especie','left');
        $this->db->where('Flora.id_genero', $idGenero);
        $query = $this->db->get();

        return $query->result();
    }


    function listaAnimais($searchText = '', $page, $segment)
    {
        $this->db->select('Animais.*,Parcelas.id as id_parcela, Propriedades.no_propriedade, CadastroPessoa.ds_nome, 
        FaunaTipoObservacao.nome as nome_fauna_tipo_observacao, FaunaClassificacao.nome as nome_classificacao');
        $this->db->from('tb_animais as Animais');
        $this->db->join('tb_parcelas as Parcelas', 'Parcelas.id = Animais.id_parcela','left');
        $this->db->join('tb_propriedades as Propriedades', 'Propriedades.id = Parcelas.id_propriedade','left');        
        $this->db->join('tb_acesso as Acesso', 'Acesso.co_seq_acesso = Animais.id_acesso','left'); 
        $this->db->join('tb_cadastro_pessoa as CadastroPessoa', 'CadastroPessoa.id_acesso = Acesso.co_seq_acesso','left'); 
        $this->db->join('tb_fauna_tipo_observacao as FaunaTipoObservacao', 'FaunaTipoObservacao.id = Animais.id_tipo_observacao','left');
        $this->db->join('tb_fauna_classificacao as FaunaClassificacao', 'FaunaClassificacao.id = Animais.id_classificacao','left');
   //     $this->db->join('tbl_roles as Role', 'Role.roleId = Usuarios.roleId','left');
        if(!empty($searchText)) {
            $likeCriteria = "(Animais.grau_protecao LIKE '%".$searchText."%'
                            OR Animais.floracao_frutificacao LIKE '%".$searchText."%')";
            $this->db->where($likeCriteria);
        }

        $this->db->where('Animais.st_registro_ativo', 'S');
        $this->db->limit($page, $segment);
        $query = $this->db->get();
		        
        $result = $query->result();        
        return $result;
    }

    function adicionaAnimal($infoAnimal)
    {
        $this->db->trans_start();
        $this->db->insert('tb_animais', $infoAnimal);
        
        $insert_id = $this->db->insert_id();
        
        $this->db->trans_complete();
        
        return $insert_id;
    }

    function editaAnimal($infoAnimal, $IdAnimal)
    {
        $this->db->where('id', $IdAnimal);
        $this->db->update('tb_animais', $infoAnimal);
        
        return TRUE;
    }

    function apagaAnimal($IdAnimal)
    {
        $info['st_registro_ativo'] = 'N';
        $this->db->where('id_animais', $IdAnimal);
        $this->db->update('rl_fauna_familia_genero_especie', $info);
        $this->db->where('id', $IdAnimal);
        $this->db->update('tb_animais', $info);
        
        return TRUE;

    /*    $this->db->where('id_animais', $IdAnimal);
        $res1 = $this->db->delete('rl_fauna_familia_genero_especie');
        $this->db->where('id', $IdAnimal);
        $res2 = $this->db->delete('tb_animais');

        if(!$res1 && !$res2)
        {
            $error = $this->db->error();
            return $error['code'];
        }
        else
        {
            return TRUE;
        }*/

    }

    function adicionaRlFaunaFamiliaGeneroEspecie($infoRlFaunaFamiliaGeneroEspecie)
    {
        $this->db->trans_start();
        $this->db->insert('rl_fauna_familia_genero_especie', $infoRlFaunaFamiliaGeneroEspecie);
        
        $insert_id = $this->db->insert_id();
        
        $this->db->trans_complete();
        
        return $insert_id;
    }

    function editaRlFaunaFamiliaGeneroEspecie($infoRlFaunaFamiliaGeneroEspecie, $IdAnimal)
    {
        $this->db->where('id_animais', $IdAnimal);
        $this->db->update('rl_fauna_familia_genero_especie', $infoRlFaunaFamiliaGeneroEspecie);
        
        return TRUE;
    }

    function apagaRlFaunaFamiliaGeneroEspecie($IdRlFaunaFamiliaGeneroEspecie)
    {
        $info['st_registro_ativo'] = 'N';
        $this->db->where('id', $IdRlFaunaFamiliaGeneroEspecie);
        $this->db->update('rl_fauna_familia_genero_especie', $info);
             
        return TRUE;

     /*   $this->db->where('id', $IdRlFaunaFamiliaGeneroEspecie);
        $res2 = $this->db->delete('rl_fauna_familia_genero_especie');

        if(!$res1 && !$res2)
        {
            $error = $this->db->error();
            return $error['code'];
        }
        else
        {
            return TRUE;
        }*/

    }

    function consultaGeneroFauna($idFamilia)
    {
        $this->db->select('distinct(Genero.id), Genero.nome');
        $this->db->from('tb_fauna as Fauna');
        $this->db->join('tb_fauna_genero as Genero', 'Genero.id = Fauna.id_genero','left');
        $this->db->where('Fauna.id_familia', $idFamilia);
        $query = $this->db->get();

        return $query->result();
    }

    function consultaEspecieFauna($idGenero)
    {
        $this->db->select('distinct(Especie.id), Especie.nome, Especie.no_popular');
        $this->db->from('tb_fauna as Fauna');
        $this->db->join('tb_fauna_especie as Especie', 'Especie.id = Fauna.id_especie','left');
        $this->db->where('Fauna.id_genero', $idGenero);
        $query = $this->db->get();      

        return $query->result();
    }


    function listaEpifitas($searchText = '', $page, $segment)
    {
        $this->db->select('Epifitas.*,Parcelas.id as id_parcela, Propriedades.no_propriedade, CadastroPessoa.ds_nome');
        $this->db->from('tb_epifitas as Epifitas');
        $this->db->join('tb_parcelas as Parcelas', 'Parcelas.id = Epifitas.id_parcela','left');
        $this->db->join('tb_propriedades as Propriedades', 'Propriedades.id = Parcelas.id_propriedade','left');        
        $this->db->join('tb_acesso as Acesso', 'Acesso.co_seq_acesso = Epifitas.id_acesso','left'); 
        $this->db->join('tb_cadastro_pessoa as CadastroPessoa', 'CadastroPessoa.id_acesso = Acesso.co_seq_acesso','left'); 
   //     $this->db->join('tbl_roles as Role', 'Role.roleId = Usuarios.roleId','left');
        if(!empty($searchText)) {
            $likeCriteria = "(Epifitas.latitude LIKE '%".$searchText."%'
                            OR Epifitas.longitude LIKE '%".$searchText."%')";
            $this->db->where($likeCriteria);
        }

        $this->db->where('Epifitas.st_registro_ativo', 'S');
        $this->db->limit($page, $segment);
        $query = $this->db->get();
		        
        $result = $query->result();        
        return $result;
    }

    function adicionaEpifita($infoEpifita)
    {
        $this->db->trans_start();
        $this->db->insert('tb_epifitas', $infoEpifita);
        
        $insert_id = $this->db->insert_id();
        
        $this->db->trans_complete();
        
        return $insert_id;
    }

    function editaEpifita($infoEpifita, $IdEpifita)
    {
        $this->db->where('id', $IdEpifita);
        $this->db->update('tb_epifitas', $infoEpifita);
        
        return TRUE;
    }

    function apagaEpifita($IdEpifita)
    {
        $info['st_registro_ativo'] = 'N';
        $this->db->where('id_epifitas', $IdEpifita);
        $this->db->update('rl_epifitas_familia_genero_especie', $info);
        $this->db->where('id', $IdEpifita);
        $this->db->update('tb_epifitas', $info);
            
        return TRUE;
    }


    function listaHidrologia($searchText = '', $page, $segment)
    {
        $this->db->select('Hidrologia.*,Parcelas.id as id_parcela, Propriedades.no_propriedade, CadastroPessoa.ds_nome');
        $this->db->from('tb_hidrologia as Hidrologia');
        $this->db->join('tb_parcelas as Parcelas', 'Parcelas.id = Hidrologia.id_parcela','left');
        $this->db->join('tb_propriedades as Propriedades', 'Propriedades.id = Parcelas.id_propriedade','left');        
        $this->db->join('tb_acesso as Acesso', 'Acesso.co_seq_acesso = Hidrologia.id_acesso','left'); 
        $this->db->join('tb_cadastro_pessoa as CadastroPessoa', 'CadastroPessoa.id_acesso = Acesso.co_seq_acesso','left'); 

        if(!empty($searchText)) {
            $likeCriteria = "(Hidrologia.latitude LIKE '%".$searchText."%'
                            OR Hidrologia.longitude LIKE '%".$searchText."%')";
            $this->db->where($likeCriteria);
        }

        $this->db->where('Hidrologia.st_registro_ativo', 'S');
        $this->db->limit($page, $segment);
        $query = $this->db->get();
		        
        $result = $query->result();        
        return $result;
    }

    function adicionaHidrologia($infoHidrologia)
    {
        $this->db->trans_start();
        $this->db->insert('tb_hidrologia', $infoHidrologia);
        
        $insert_id = $this->db->insert_id();
        
        $this->db->trans_complete();
        
        return $insert_id;
    }

    function editaHidrologia($infoHidrologia, $IdHidrologia)
    {
        $this->db->where('id', $IdHidrologia);
        $this->db->update('tb_hidrologia', $infoHidrologia);
        
        return TRUE;
    }

    function apagaHidrologia($IdHidrologia)
    {
        $info['st_registro_ativo'] = 'N';
        $this->db->where('id', $IdHidrologia);
        $this->db->update('tb_hidrologia', $info);
            
        return TRUE;
    }

    function adicionaRlEpifitaFamiliaGeneroEspecie($infoRlEpifitaFamiliaGeneroEspecie)
    {
        $this->db->trans_start();
        $this->db->insert('rl_epifitas_familia_genero_especie', $infoRlEpifitaFamiliaGeneroEspecie);
        
        $insert_id = $this->db->insert_id();
        
        $this->db->trans_complete();
        
        return $insert_id;
    }

    function editaRlEpifitaFamiliaGeneroEspecie($infoRlEpifitaFamiliaGeneroEspecie, $IdEpifita)
    {
        $this->db->where('id_epifitas', $IdEpifita);
        $this->db->update('rl_epifitas_familia_genero_especie', $infoRlEpifitaFamiliaGeneroEspecie);
        
        return TRUE;
    }

    function apagaRlEpifitaFamiliaGeneroEspecie($IdRlEpifitaFamiliaGeneroEspecie)
    {
        $info['st_registro_ativo'] = 'N';
        $this->db->where('id', $IdRlEpifitaFamiliaGeneroEspecie);
        $this->db->update('rl_epifitas_familia_genero_especie', $info);
        
        return TRUE;

    /*    $this->db->where('id', $IdRlEpifitaFamiliaGeneroEspecie);
        $res2 = $this->db->delete('rl_epifitas_familia_genero_especie');

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

    /**
     * This function is used to check whether email id is already exist or not
     * @param {string} $email : This is email id
     * @param {number} $userId : This is user id
     * @return {mixed} $result : This is searched result
     */
    function checkEmailExists($email, $userId = 0)
    {
        $this->db->select("email");
        $this->db->from("tbl_users");
        $this->db->where("email", $email);   
        $this->db->where("isDeleted", 0);
        if($userId <> 0){
            $this->db->where("userId <>", $userId);
        }
        $query = $this->db->get();

        return $query->result();
    }
    
    
    /**
     * This function is used to add new user to system
     * @return number $insert_id : This is last inserted id
     */
    function addNewUser($userInfo)
    {
        $this->db->trans_start();
        $this->db->insert('tbl_users', $userInfo);
        
        $insert_id = $this->db->insert_id();
        
        $this->db->trans_complete();
        
        return $insert_id;
    }
    
    /**
     * This function used to get user information by id
     * @param number $userId : This is user id
     * @return array $result : This is user information
     */
    function getUserInfo($userId)
    {
        $this->db->select('userId, name, email, mobile, roleId');
        $this->db->from('tbl_users');
        $this->db->where('isDeleted', 0);
        $this->db->where('userId', $userId);
        $query = $this->db->get();
        
        return $query->result();
    }
    
    
    /**
     * This function is used to update the user information
     * @param array $userInfo : This is users updated information
     * @param number $userId : This is user id
     */
    function editUser($userInfo, $userId)
    {
        $this->db->where('userId', $userId);
        $this->db->update('tbl_users', $userInfo);
        
        return TRUE;
    }
    
    
    
    /**
     * This function is used to delete the user information
     * @param number $userId : This is user id
     * @return boolean $result : TRUE / FALSE
     */
    function deleteUser($userId, $userInfo)
    {
        $this->db->where('userId', $userId);
        $this->db->update('tbl_users', $userInfo);
        
        return $this->db->affected_rows();
    }


    /**
     * This function is used to match users password for change password
     * @param number $userId : This is user id
     */
    function matchOldPassword($userId, $oldPassword)
    {
        $this->db->select('userId, password');
        $this->db->where('userId', $userId);        
        $this->db->where('isDeleted', 0);
        $query = $this->db->get('tbl_users');
        
        $user = $query->result();

        if(!empty($user)){
            if(verifyHashedPassword($oldPassword, $user[0]->password)){
                return $user;
            } else {
                return array();
            }
        } else {
            return array();
        }
    }
    
    /**
     * This function is used to change users password
     * @param number $userId : This is user id
     * @param array $userInfo : This is user updation info
     */
    function changePassword($userId, $userInfo)
    {
        $this->db->where('userId', $userId);
        $this->db->where('isDeleted', 0);
        $this->db->update('tbl_users', $userInfo);
        
        return $this->db->affected_rows();
    }


    /**
     * This function is used to get user log history count
     * @param number $userId : This is user id
     */
    	
    function logHistoryCount($userId)
    {
        $this->db->select('*');
        $this->db->from('tbl_log as BaseTbl');

        if ($userId == NULL)
        {
            $query = $this->db->get();
            return $query->num_rows();
        }
        else
        {
            $this->db->where('BaseTbl.userId', $userId);
            $query = $this->db->get();
            return $query->num_rows();
        }
    }

    /**
     * This function is used to get user log history
     * @param number $userId : This is user id
     * @return array $result : This is result
     */
    function logHistory($userId)
    {
        $this->db->select('*');        
        $this->db->from('tbl_log as BaseTbl');

        if ($userId == NULL)
        {
            $this->db->order_by('BaseTbl.createdDtm', 'DESC');
            $query = $this->db->get();
            $result = $query->result();        
            return $result;
        }
        else
        {
            $this->db->where('BaseTbl.userId', $userId);
            $this->db->order_by('BaseTbl.createdDtm', 'DESC');
            $query = $this->db->get();
            $result = $query->result();
            return $result;
        }
    }

    /**
     * This function used to get user information by id
     * @param number $userId : This is user id
     * @return array $result : This is user information
     */
    function getUserInfoById($userId)
    {
        $this->db->select('userId, name, email, mobile, roleId');
        $this->db->from('tbl_users');
        $this->db->where('isDeleted', 0);
        $this->db->where('userId', $userId);
        $query = $this->db->get();
        
        return $query->row();
    }

    /**
     * This function is used to get tasks
     */
    function getTasks()
    {
        $this->db->select('*');
        $this->db->from('tbl_task as TaskTbl');
        $this->db->join('tbl_users as Users','Users.userId = TaskTbl.createdBy');
        $this->db->join('tbl_roles as Roles','Roles.roleId = Users.roleId');
        $this->db->join('tbl_tasks_situations as Situations','Situations.statusId = TaskTbl.statusId');
        $this->db->join('tbl_tasks_prioritys as Prioritys','Prioritys.priorityId = TaskTbl.priorityId');
        $this->db->order_by('TaskTbl.statusId ASC, TaskTbl.priorityId');
        $query = $this->db->get();
        $result = $query->result();        
        return $result;
    }

    /**
     * This function is used to get task prioritys
     */
    function getTasksPrioritys()
    {
        $this->db->select('*');
        $this->db->from('tbl_tasks_prioritys');
        $query = $this->db->get();
        
        return $query->result();
    }

    /**
     * This function is used to get task situations
     */
    function getTasksSituations()
    {
        $this->db->select('*');
        $this->db->from('tbl_tasks_situations');
        $query = $this->db->get();
        
        return $query->result();
    }
    
    /**
     * This function is used to add a new task
     */
    function addNewTasks($taskInfo)
    {
        $this->db->trans_start();
        $this->db->insert('tbl_task', $taskInfo);
        
        $insert_id = $this->db->insert_id();
        
        $this->db->trans_complete();
        
        return $insert_id;
    }

    /**
     * This function used to get task information by id
     * @param number $taskId : This is task id
     * @return array $result : This is task information
     */
    function getTaskInfo($taskId)
    {
        $this->db->select('*');
        $this->db->from('tbl_task');
        $this->db->join('tbl_tasks_situations as Situations','Situations.statusId = tbl_task.statusId');
        $this->db->join('tbl_tasks_prioritys as Prioritys','Prioritys.priorityId = tbl_task.priorityId');
        $this->db->where('id', $taskId);
        $query = $this->db->get();
        
        return $query->result();
    }
    
    /**
     * This function is used to edit tasks
     */
    function editTask($taskInfo, $taskId)
    {
        $this->db->where('id', $taskId);
        $this->db->update('tbl_task', $taskInfo);
        
        return $this->db->affected_rows();
    }
    
    /**
     * This function is used to delete tasks
     */
    function deleteTask($taskId)
    {
        $this->db->where('id', $taskId);
        $this->db->delete('tbl_task');
        return TRUE;
    }

    /**
     * This function is used to return the size of the table
     * @param string $tablename : This is table name
     * @param string $dbname : This is database name
     * @return array $return : Table size in mb
     */
    function gettablemb($tablename,$dbname)
    {
        $this->db->select('round(((data_length + index_length)/1024/1024),2) as total_size');
        $this->db->from('information_schema.tables');
        $this->db->where('table_name', $tablename);
        $this->db->where('table_schema', $dbname);
        $query = $this->db->get($tablename);
        
        return $query->row();
    }

    /**
     * This function is used to delete tbl_log table records
     */
    function clearlogtbl()
    {
        $this->db->truncate('tbl_log');
        return TRUE;
    }

    /**
     * This function is used to delete tbl_log_backup table records
     */
    function clearlogBackuptbl()
    {
        $this->db->truncate('tbl_log_backup');
        return TRUE;
    }

    /**
     * This function is used to get user log history
     * @return array $result : This is result
     */
    function logHistoryBackup()
    {
        $this->db->select('*');        
        $this->db->from('tbl_log_backup as BaseTbl');
        $this->db->order_by('BaseTbl.createdDtm', 'DESC');
        $query = $this->db->get();
        $result = $query->result();        
        return $result;
    }

    /**
     * This function is used to complete tasks
     */
    function endTask($taskId, $taskInfo)
    {
        $this->db->where('id', $taskId);
        $this->db->update('tbl_task', $taskInfo);
        
        return $this->db->affected_rows();
    }

    /**
     * This function is used to get the tasks count
     * @return array $result : This is result
     */
    function tasksCount()
    {
        $this->db->select('*');
        $this->db->from('tbl_task as BaseTbl');
        $query = $this->db->get();
        return $query->num_rows();
    }

    /**
     * This function is used to get the finished tasks count
     * @return array $result : This is result
     */
    function finishedTasksCount()
    {
        $this->db->select('*');
        $this->db->from('tbl_task as BaseTbl');
        $this->db->where('BaseTbl.statusId', 2);
        $query = $this->db->get();
        return $query->num_rows();
    }

    /**
     * This function is used to get the logs count
     * @return array $result : This is result
     */
    function logsCount()
    {
        $this->db->select('*');
        $this->db->from('tbl_log as BaseTbl');
        $query = $this->db->get();
        return $query->num_rows();
    }

    /**
     * This function is used to get the users count
     * @return array $result : This is result
     */
    function usersCount()
    {
        $this->db->select('*');
        $this->db->from('tbl_users as BaseTbl');
        $this->db->where('isDeleted', 0);
        $query = $this->db->get();
        return $query->num_rows();
    }

    function getUserStatus($userId)
    {
        $this->db->select('BaseTbl.status');
        $this->db->where('BaseTbl.userId', $userId);
        $this->db->limit(1);
        $query = $this->db->get('tbl_users as BaseTbl');

        return $query->row();
    }

    function carregaNextIdParcela()
    {
        $this->db->select('max(id)+1 as id');
        $this->db->limit(1);
        $query = $this->db->get('tb_parcelas');

        return $query->row();
    }

    function carregaNextIdProjeto()
    {
        $this->db->select('max(id)+1 as id');
        $this->db->limit(1);
        $query = $this->db->get('tb_projetos');

        return $query->row();
    }

    function carregaNextIdAnimal()
    {
        $this->db->select('max(id)+1 as id');
        $this->db->limit(1);
        $query = $this->db->get('tb_animais');

        return $query->row();
    }

    function carregaNextIdArvoreViva()
    {
        $this->db->select('max(id)+1 as id');
        $this->db->limit(1);
        $query = $this->db->get('tb_arvores_vivas');

        return $query->row();
    }

    function carregaNextIdEpifita()
    {
        $this->db->select('max(id)+1 as id');
        $this->db->limit(1);
        $query = $this->db->get('tb_epifitas');

        return $query->row();
    }

    function carregaNextIdHidrologia()
    {
        $this->db->select('max(id)+1 as id');
        $this->db->limit(1);
        $query = $this->db->get('tb_hidrologia');

        return $query->row();
    }

    function carregaNextIdPropriedade()
    {
        $this->db->select('max(id)+1 as id');
        $this->db->limit(1);
        $query = $this->db->get('tb_propriedades');

        return $query->row();
    }

}

  