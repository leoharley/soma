<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';
/**
 * Class : Admin (AdminController)
 * Admin class to control to authenticate admin credentials and include admin functions.
 * @author : Samet Aydın / sametay153@gmail.com
 * @version : 1.0
 * @since : 27.02.2018
 */
class Selecao extends BaseController
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();
        $this->load->model('login_model');
        $this->load->model('user_model');
        $this->load->model('PrincipalModel');
        $this->load->model('SelecaoModel');
        // Datas -> libraries ->BaseController / This function used load user sessions
        $this->datas();
        // isLoggedIn / Login control function /  This function used login control
        $isLoggedIn = $this->session->userdata('isLoggedIn');
        
        date_default_timezone_set('America/Sao_Paulo');

        if(!isset($isLoggedIn) || $isLoggedIn != TRUE)
        {
            redirect('login');
        }
        
    /*    else
        {
            // isAdmin / Admin role control function / This function used admin role control
            if($this->isAdmin() == TRUE)
            {
                $this->accesslogincontrol();
            }
        } */
    }

    // INICIO DAS FUNÇÕES DA TELA DE FAUNA CLASSIFICAÇÃO

    function selecaoFaunaClassificacao()
    {
            $tpTela = $this->uri->segment(2);

            $data['perfis'] = $this->PrincipalModel->carregaPerfisUsuarios();

            if ($tpTela == 'listar') {

                $searchText = $this->security->xss_clean($this->input->post('searchText'));
                $data['searchText'] = $searchText;
                
                $this->load->library('pagination');
                
                $count = 0;

                $returns = $this->paginationCompress ( "selecaoFaunaClassificacao/listar", $count, 10 );
                
                $data['registros'] = $this->SelecaoModel->listaFaunaClassificacao($searchText, $returns["page"], $returns["segment"]);
                
                $process = 'Listar projetos';
                $processFunction = 'Selecao/selecaoFaunaClassificacao';
                $this->logrecord($process,$processFunction);

                $this->global['pageTitle'] = 'SOMA : Lista de Fauna Classificação';

                $data['infoPerfil'] = $this->PrincipalModel->carregaInfoPerfil();
               
                $this->loadViews("selecao/l_selecaoFaunaClassificacao", $this->global, $data, NULL);
            }
            else if ($tpTela == 'cadastrar') {
                $this->global['pageTitle'] = 'SOMA : Cadastro de Fauna Classificação';
                
                $data['infoPerfil'] = $this->PrincipalModel->carregaInfoPerfil();

                $this->loadViews("selecao/c_selecaoFaunaClassificacao", $this->global, $data, NULL); 
            }
            else if ($tpTela == 'editar') {
                $id = $this->uri->segment(3);
                if($id == null)
                {
                    redirect('selecaoFaunaClassificacao/listar');
                }

                $data['info'] = $this->SelecaoModel->carregaInfoFaunaClassificacao($id);

                $this->global['pageTitle'] = 'SOMA : Editar Fauna Classificação';      
                $this->loadViews("selecao/c_selecaoFaunaClassificacao", $this->global, $data, NULL);
            }
    }

    function adicionaFaunaClassificacao() 
    {
                $nome = $this->input->post('nome');
                $info = array('nome'=> $nome);
                $result = $this->SelecaoModel->adicionaFaunaClassificacao($info);
                
                if($result > 0)
                {
                    $process = 'Adicionar Fauna Classificação';
                    $processFunction = 'Selecao/adicionaProjeto';
                    $this->logrecord($process,$processFunction);
                    $this->session->set_flashdata('success', 'Fauna classificação criada com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na criação da fauna classificação');
                }
                
                redirect('selecaoFaunaClassificacao/listar');
    }


    function editaFaunaClassificacao()
    {           
                $id = $this->input->post('id');
                $nome = $this->input->post('nome');
                $info = array('nome'=> $nome);
                $resultado = $this->SelecaoModel->editaFaunaClassificacao($info, $id);
                
                if($resultado == true)
                {
                    $process = 'Fauna classificação atualizada';
                    $processFunction = 'Selecao/editaFaunaClassificacao';
                    $this->logrecord($process,$processFunction);
                    $this->session->set_flashdata('success', 'Fauna classificação atualizada com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na atualização da fauna classificação');
                }
                redirect('selecaoFaunaClassificacao/listar');
    }

    function apagaFaunaClassificacao()
    {
            $id = $this->uri->segment(2);
            $resultado = $this->SelecaoModel->apagaFaunaClassificacao($id);
            
            if ($resultado) {
                 $process = 'Exclusão da fauna classificação';
                 $processFunction = 'Selecao/apagaFaunaClassificacao';
                 $this->logrecord($process,$processFunction);
                 $this->session->set_flashdata('success', 'Fauna classificação deletada com sucesso');

                }
                else 
                { 
                    $this->session->set_flashdata('error', 'Falha em excluir fauna classificação');
                }
                redirect('selecaoFaunaClassificacao/listar');
    }


    // INICIO DAS FUNÇÕES DA TELA DE TIPO PARCELA

    function selecaoTipoParcela()
    {
            $tpTela = $this->uri->segment(2);

            $data['perfis'] = $this->PrincipalModel->carregaPerfisUsuarios();

            if ($tpTela == 'listar') {

                $searchText = $this->security->xss_clean($this->input->post('searchText'));
                $data['searchText'] = $searchText;
                
                $this->load->library('pagination');
                
                $count = 0;

                $returns = $this->paginationCompress ( "selecaoTipoParcela/listar", $count, 10 );
                
                $data['registros'] = $this->SelecaoModel->listaTipoParcela($searchText, $returns["page"], $returns["segment"]);
                
                $process = 'Listar tipo parcela';
                $processFunction = 'Selecao/selecaoTipoParcela';
                $this->logrecord($process,$processFunction);

                $this->global['pageTitle'] = 'SOMA : Lista de Tipo Parcela';

                $data['infoPerfil'] = $this->PrincipalModel->carregaInfoPerfil();
               
                $this->loadViews("selecao/l_selecaoTipoParcela", $this->global, $data, NULL);
            }
            else if ($tpTela == 'cadastrar') {
                $this->global['pageTitle'] = 'SOMA : Cadastro de Tipo Parcela';
                
                $data['infoPerfil'] = $this->PrincipalModel->carregaInfoPerfil();

                $this->loadViews("selecao/c_selecaoTipoParcela", $this->global, $data, NULL); 
            }
            else if ($tpTela == 'editar') {
                $id = $this->uri->segment(3);
                if($id == null)
                {
                    redirect('selecaoTipoParcela/listar');
                }

                $data['info'] = $this->SelecaoModel->carregaInfoTipoParcela($id);

                $this->global['pageTitle'] = 'SOMA : Editar Tipo Parcela';      
                $this->loadViews("selecao/c_selecaoTipoParcela", $this->global, $data, NULL);
            }
    }

    function adicionaTipoParcela() 
    {
                $nome = $this->input->post('nome');
                $info = array('nome'=> $nome);
                $result = $this->SelecaoModel->adicionaTipoParcela($info);
                
                if($result > 0)
                {
                    $process = 'Adicionar Tipo Parcela';
                    $processFunction = 'Selecao/adicionaProjeto';
                    $this->logrecord($process,$processFunction);
                    $this->session->set_flashdata('success', 'Tipo parcela criada com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na criação de tipo parcela');
                }
                
                redirect('selecaoTipoParcela/listar');
    }


    function editaTipoParcela()
    {           
                $id = $this->input->post('id');
                $nome = $this->input->post('nome');
                $info = array('nome'=> $nome);
                $resultado = $this->SelecaoModel->editaTipoParcela($info, $id);
                
                if($resultado == true)
                {
                    $process = 'Tipo parcela atualizada';
                    $processFunction = 'Selecao/editaTipoParcela';
                    $this->logrecord($process,$processFunction);
                    $this->session->set_flashdata('success', 'Tipo parcela atualizada com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na atualização do tipo parcela');
                }
                redirect('selecaoTipoParcela/listar');
    }

    function apagaTipoParcela()
    {
            $id = $this->uri->segment(2);
            $resultado = $this->SelecaoModel->apagaTipoParcela($id);
            
            if ($resultado) {
                 $process = 'Exclusão do tipo parcela';
                 $processFunction = 'Selecao/apagaTipoParcela';
                 $this->logrecord($process,$processFunction);
                 $this->session->set_flashdata('success', 'Tipo parcela deletado com sucesso');

                }
                else 
                { 
                    $this->session->set_flashdata('error', 'Falha em excluir tipo parcela');
                }
                redirect('selecaoTipoParcela/listar');
    }


    // INICIO DAS FUNÇÕES DA TELA DE TIPO BIOMA

    function selecaoTipoBioma()
    {
            $tpTela = $this->uri->segment(2);

            $data['perfis'] = $this->PrincipalModel->carregaPerfisUsuarios();

            if ($tpTela == 'listar') {

                $searchText = $this->security->xss_clean($this->input->post('searchText'));
                $data['searchText'] = $searchText;
                
                $this->load->library('pagination');
                
                $count = 0;

                $returns = $this->paginationCompress ( "selecaoTipoBioma/listar", $count, 10 );
                
                $data['registros'] = $this->SelecaoModel->listaTipoBioma($searchText, $returns["page"], $returns["segment"]);
                
                $process = 'Listar tipo bioma';
                $processFunction = 'Selecao/selecaoTipoBioma';
                $this->logrecord($process,$processFunction);

                $this->global['pageTitle'] = 'SOMA : Lista de Tipo Bioma';

                $data['infoPerfil'] = $this->PrincipalModel->carregaInfoPerfil();
               
                $this->loadViews("selecao/l_selecaoTipoBioma", $this->global, $data, NULL);
            }
            else if ($tpTela == 'cadastrar') {
                $this->global['pageTitle'] = 'SOMA : Cadastro de Tipo Bioma';
                
                $data['infoPerfil'] = $this->PrincipalModel->carregaInfoPerfil();

                $this->loadViews("selecao/c_selecaoTipoBioma", $this->global, $data, NULL); 
            }
            else if ($tpTela == 'editar') {
                $id = $this->uri->segment(3);
                if($id == null)
                {
                    redirect('selecaoTipoBioma/listar');
                }

                $data['info'] = $this->SelecaoModel->carregaInfoTipoBioma($id);

                $this->global['pageTitle'] = 'SOMA : Editar Tipo Bioma';      
                $this->loadViews("selecao/c_selecaoTipoBioma", $this->global, $data, NULL);
            }
    }

    function adicionaTipoBioma() 
    {
                $nome = $this->input->post('nome');
                $info = array('nome'=> $nome);
                $result = $this->SelecaoModel->adicionaTipoBioma($info);
                
                if($result > 0)
                {
                    $process = 'Adicionar Tipo Bioma';
                    $processFunction = 'Selecao/adicionaTipoBioma';
                    $this->logrecord($process,$processFunction);
                    $this->session->set_flashdata('success', 'Tipo bioma criada com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na criação de Tipo bioma');
                }
                
                redirect('selecaoTipoBioma/listar');
    }


    function editaTipoBioma()
    {           
                $id = $this->input->post('id');
                $nome = $this->input->post('nome');
                $info = array('nome'=> $nome);
                $resultado = $this->SelecaoModel->editaTipoBioma($info, $id);
                
                if($resultado == true)
                {
                    $process = 'Tipo bioma atualizada';
                    $processFunction = 'Selecao/editaTipoBioma';
                    $this->logrecord($process,$processFunction);
                    $this->session->set_flashdata('success', 'Tipo bioma atualizado com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na atualização do tipo bioma');
                }
                redirect('selecaoTipoBioma/listar');
    }

    function apagaTipoBioma()
    {
            $id = $this->uri->segment(2);
            $resultado = $this->SelecaoModel->apagaTipoBioma($id);
            
            if ($resultado) {
                 $process = 'Exclusão do tipo bioma';
                 $processFunction = 'Selecao/apagaTipoBioma';
                 $this->logrecord($process,$processFunction);
                 $this->session->set_flashdata('success', 'Tipo bioma deletado com sucesso');

                }
                else 
                { 
                    $this->session->set_flashdata('error', 'Falha em excluir tipo bioma');
                }
                redirect('selecaoTipoBioma/listar');
    }


    // INICIO DAS FUNÇÕES DA TELA DE GRAU EPIFITISMO

    function selecaoGrauEpifitismo()
    {
            $tpTela = $this->uri->segment(2);

            $data['perfis'] = $this->PrincipalModel->carregaPerfisUsuarios();

            if ($tpTela == 'listar') {

                $searchText = $this->security->xss_clean($this->input->post('searchText'));
                $data['searchText'] = $searchText;
                
                $this->load->library('pagination');
                
                $count = 0;

                $returns = $this->paginationCompress ( "selecaoGrauEpifitismo/listar", $count, 10 );
                
                $data['registros'] = $this->SelecaoModel->listaGrauEpifitismo($searchText, $returns["page"], $returns["segment"]);
                
                $process = 'Listar grau epifitismo';
                $processFunction = 'Selecao/selecaoGrauEpifitismo';
                $this->logrecord($process,$processFunction);

                $this->global['pageTitle'] = 'SOMA : Lista de grau epifitismo';

                $data['infoPerfil'] = $this->PrincipalModel->carregaInfoPerfil();
               
                $this->loadViews("selecao/l_selecaoGrauEpifitismo", $this->global, $data, NULL);
            }
            else if ($tpTela == 'cadastrar') {
                $this->global['pageTitle'] = 'SOMA : Cadastro de Grau Epifitismo';
                
                $data['infoPerfil'] = $this->PrincipalModel->carregaInfoPerfil();

                $this->loadViews("selecao/c_selecaoGrauEpifitismo", $this->global, $data, NULL); 
            }
            else if ($tpTela == 'editar') {
                $id = $this->uri->segment(3);
                if($id == null)
                {
                    redirect('selecaoGrauEpifitismo/listar');
                }

                $data['info'] = $this->SelecaoModel->carregaInfoGrauEpifitismo($id);

                $this->global['pageTitle'] = 'SOMA : Editar Grau Epifitismo';      
                $this->loadViews("selecao/c_selecaoGrauEpifitismo", $this->global, $data, NULL);
            }
    }

    function adicionaGrauEpifitismo() 
    {
                $nome = $this->input->post('nome');
                $info = array('nome'=> $nome);
                $result = $this->SelecaoModel->adicionaGrauEpifitismo($info);
                
                if($result > 0)
                {
                    $process = 'Adicionar Grau Epifitismo';
                    $processFunction = 'Selecao/adicionaGrauEpifitismo';
                    $this->logrecord($process,$processFunction);
                    $this->session->set_flashdata('success', 'Grau epifitismo criada com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na criação de Grau epifitismo');
                }
                
                redirect('selecaoGrauEpifitismo/listar');
    }


    function editaGrauEpifitismo()
    {           
                $id = $this->input->post('id');
                $nome = $this->input->post('nome');
                $info = array('nome'=> $nome);
                $resultado = $this->SelecaoModel->editaGrauEpifitismo($info, $id);
                
                if($resultado == true)
                {
                    $process = 'Grau epifitismo atualizada';
                    $processFunction = 'Selecao/editaGrauEpifitismo';
                    $this->logrecord($process,$processFunction);
                    $this->session->set_flashdata('success', 'Grau epifitismo atualizado com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na atualização do grau epifitismo');
                }
                redirect('selecaoGrauEpifitismo/listar');
    }

    function apagaGrauEpifitismo()
    {
            $id = $this->uri->segment(2);
            $resultado = $this->SelecaoModel->apagaGrauEpifitismo($id);
            
            if ($resultado) {
                 $process = 'Exclusão do grau epifitismo';
                 $processFunction = 'Selecao/apagaGrauEpifitismo';
                 $this->logrecord($process,$processFunction);
                 $this->session->set_flashdata('success', 'Grau epifitismo deletado com sucesso');

                }
                else 
                { 
                    $this->session->set_flashdata('error', 'Falha em excluir grau epifitismo');
                }
                redirect('selecaoGrauEpifitismo/listar');
    }


    // INICIO DAS FUNÇÕES DA TELA DE ESTÁGIO REGENERAÇÃO

    function selecaoEstagioRegeneracao()
    {
            $tpTela = $this->uri->segment(2);

            $data['perfis'] = $this->PrincipalModel->carregaPerfisUsuarios();

            if ($tpTela == 'listar') {

                $searchText = $this->security->xss_clean($this->input->post('searchText'));
                $data['searchText'] = $searchText;
                
                $this->load->library('pagination');
                
                $count = 0;

                $returns = $this->paginationCompress ( "selecaoEstagioRegeneracao/listar", $count, 10 );
                
                $data['registros'] = $this->SelecaoModel->listaEstagioRegeneracao($searchText, $returns["page"], $returns["segment"]);
                
                $process = 'Listar estágio regeneração';
                $processFunction = 'Selecao/selecaoEstagioRegeneracao';
                $this->logrecord($process,$processFunction);

                $this->global['pageTitle'] = 'SOMA : Lista de estágio regeneração';

                $data['infoPerfil'] = $this->PrincipalModel->carregaInfoPerfil();
               
                $this->loadViews("selecao/l_selecaoEstagioRegeneracao", $this->global, $data, NULL);
            }
            else if ($tpTela == 'cadastrar') {
                $this->global['pageTitle'] = 'SOMA : Cadastro de Estágio Regeneração';
                
                $data['infoPerfil'] = $this->PrincipalModel->carregaInfoPerfil();

                $this->loadViews("selecao/c_selecaoEstagioRegeneracao", $this->global, $data, NULL); 
            }
            else if ($tpTela == 'editar') {
                $id = $this->uri->segment(3);
                if($id == null)
                {
                    redirect('selecaoEstagioRegeneracao/listar');
                }

                $data['info'] = $this->SelecaoModel->carregaInfoEstagioRegeneracao($id);

                $this->global['pageTitle'] = 'SOMA : Editar Estágio Regeneração';      
                $this->loadViews("selecao/c_selecaoEstagioRegeneracao", $this->global, $data, NULL);
            }
    }

    function adicionaEstagioRegeneracao() 
    {
                $nome = $this->input->post('nome');
                $info = array('nome'=> $nome);
                $result = $this->SelecaoModel->adicionaEstagioRegeneracao($info);
                
                if($result > 0)
                {
                    $process = 'Adicionar Estágio Regeneração';
                    $processFunction = 'Selecao/adicionaEstagioRegeneracao';
                    $this->logrecord($process,$processFunction);
                    $this->session->set_flashdata('success', 'Estágio regeneração criada com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na criação de estágio regeneração');
                }
                
                redirect('selecaoEstagioRegeneracao/listar');
    }


    function editaEstagioRegeneracao()
    {           
                $id = $this->input->post('id');
                $nome = $this->input->post('nome');
                $info = array('nome'=> $nome);
                $resultado = $this->SelecaoModel->editaEstagioRegeneracao($info, $id);
                
                if($resultado == true)
                {
                    $process = 'Estágio regeneração atualizada';
                    $processFunction = 'Selecao/editaEstagioRegeneracao';
                    $this->logrecord($process,$processFunction);
                    $this->session->set_flashdata('success', 'Estágio regeneração atualizado com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na atualização do estágio regeneração');
                }
                redirect('selecaoEstagioRegeneracao/listar');
    }

    function apagaEstagioRegeneracao()
    {
            $id = $this->uri->segment(2);
            $resultado = $this->SelecaoModel->apagaEstagioRegeneracao($id);
            
            if ($resultado) {
                 $process = 'Exclusão do estágio regeneração';
                 $processFunction = 'Selecao/apagaEstagioRegeneracao';
                 $this->logrecord($process,$processFunction);
                 $this->session->set_flashdata('success', 'Estágio regeneração deletado com sucesso');

                }
                else 
                { 
                    $this->session->set_flashdata('error', 'Falha em excluir estágio regeneração');
                }
                redirect('selecaoEstagioRegeneracao/listar');
    }


    // INICIO DAS FUNÇÕES DA TELA DE GRAU PROTEÇÃO

    function selecaoGrauProtecao()
    {
            $tpTela = $this->uri->segment(2);

            $data['perfis'] = $this->PrincipalModel->carregaPerfisUsuarios();

            if ($tpTela == 'listar') {

                $searchText = $this->security->xss_clean($this->input->post('searchText'));
                $data['searchText'] = $searchText;
                
                $this->load->library('pagination');
                
                $count = 0;

                $returns = $this->paginationCompress ( "selecaoGrauProtecao/listar", $count, 10 );
                
                $data['registros'] = $this->SelecaoModel->listaGrauProtecao($searchText, $returns["page"], $returns["segment"]);
                
                $process = 'Listar grau de proteção';
                $processFunction = 'Selecao/selecaoGrauProtecao';
                $this->logrecord($process,$processFunction);

                $this->global['pageTitle'] = 'SOMA : Lista de grau de proteção';

                $data['infoPerfil'] = $this->PrincipalModel->carregaInfoPerfil();
               
                $this->loadViews("selecao/l_selecaoGrauProtecao", $this->global, $data, NULL);
            }
            else if ($tpTela == 'cadastrar') {
                $this->global['pageTitle'] = 'SOMA : Cadastro de Grau de Proteção';
                
                $data['infoPerfil'] = $this->PrincipalModel->carregaInfoPerfil();

                $this->loadViews("selecao/c_selecaoGrauProtecao", $this->global, $data, NULL); 
            }
            else if ($tpTela == 'editar') {
                $id = $this->uri->segment(3);
                if($id == null)
                {
                    redirect('selecaoGrauProtecao/listar');
                }

                $data['info'] = $this->SelecaoModel->carregaInfoGrauProtecao($id);

                $this->global['pageTitle'] = 'SOMA : Editar Grau de Proteção';      
                $this->loadViews("selecao/c_selecaoGrauProtecao", $this->global, $data, NULL);
            }
    }

    function adicionaGrauProtecao() 
    {
                $nome = $this->input->post('nome');
                $info = array('nome'=> $nome);
                $result = $this->SelecaoModel->adicionaGrauProtecao($info);
                
                if($result > 0)
                {
                    $process = 'Adicionar Grau de Proteção';
                    $processFunction = 'Selecao/adicionaGrauProtecao';
                    $this->logrecord($process,$processFunction);
                    $this->session->set_flashdata('success', 'Grau de proteção criada com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na criação de grau de proteção');
                }
                
                redirect('selecaoGrauProtecao/listar');
    }


    function editaGrauProtecao()
    {           
                $id = $this->input->post('id');
                $nome = $this->input->post('nome');
                $info = array('nome'=> $nome);
                $resultado = $this->SelecaoModel->editaGrauProtecao($info, $id);
                
                if($resultado == true)
                {
                    $process = 'Grau de proteção atualizada';
                    $processFunction = 'Selecao/editaGrauProtecao';
                    $this->logrecord($process,$processFunction);
                    $this->session->set_flashdata('success', 'Grau de proteção atualizado com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na atualização do grau de proteção');
                }
                redirect('selecaoGrauProtecao/listar');
    }

    function apagaGrauProtecao()
    {
            $id = $this->uri->segment(2);
            $resultado = $this->SelecaoModel->apagaGrauProtecao($id);
            
            if ($resultado) {
                 $process = 'Exclusão do grau de proteção';
                 $processFunction = 'Selecao/apagaGrauProtecao';
                 $this->logrecord($process,$processFunction);
                 $this->session->set_flashdata('success', 'Grau de proteção deletado com sucesso');

                }
                else 
                { 
                    $this->session->set_flashdata('error', 'Falha em excluir grau de proteção');
                }
                redirect('selecaoGrauProtecao/listar');
    }





    function valor($val)
    {
        $val = str_replace(",",".",$val);
        $val = preg_replace('/\.(?=.*\.)/', '', $val);
       // return ($val); 
        return floatval($val);      
    }

}