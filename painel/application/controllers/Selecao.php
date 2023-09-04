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





    function valor($val)
    {
        $val = str_replace(",",".",$val);
        $val = preg_replace('/\.(?=.*\.)/', '', $val);
       // return ($val); 
        return floatval($val);      
    }

}