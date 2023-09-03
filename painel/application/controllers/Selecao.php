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
        $this->load->model('selecaoModel');
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

    // INICIO DAS FUNÇÕES DA TELA DE USUÁRIO

    function selecaoFaunaClassificacao()
    {
            $tpTela = $this->uri->segment(2);

            $data['perfis'] = $this->selecaoModel->carregaPerfisUsuarios();

            if ($tpTela == 'listar') {

                $searchText = $this->security->xss_clean($this->input->post('searchText'));
                $data['searchText'] = $searchText;
                
                $this->load->library('pagination');
                
                $count = 0;

                $returns = $this->paginationCompress ( "selecaoFaunaClassificacao/listar", $count, 10 );
                
                $data['registrosFaunaClassificacao'] = $this->SelecaoModel->listaFaunaClassificacao($searchText, $returns["page"], $returns["segment"]);
                
                $process = 'Listar projetos';
                $processFunction = 'Selecao/selecaoFaunaClassificacao';
                $this->logrecord($process,$processFunction);

                $this->global['pageTitle'] = 'SOMA : Lista de Fauna Classificação';

                $data['infoPerfil'] = $this->selecaoModel->carregaInfoPerfil();
               
                $this->loadViews("selecao/l_selecaoFaunaClassificacao", $this->global, $data, NULL);
            }
            else if ($tpTela == 'cadastrar') {
                $this->global['pageTitle'] = 'SOMA : Cadastro de Fauna Classificação';
                
                $data['infoPerfil'] = $this->selecaoModel->carregaInfoPerfil();

                $this->loadViews("selecao/c_selecaoFaunaClassificacao", $this->global, $data, NULL); 
            }
            else if ($tpTela == 'editar') {
                $IdFaunaClassificacao = $this->uri->segment(3);
                if($IdFaunaClassificacao == null)
                {
                    redirect('selecaoFaunaClassificacao/listar');
                }

                $data['infoFaunaClassificacao'] = $this->SelecaoModel->carregaInfoFaunaClassificacao($IdFaunaClassificacao);

                $this->global['pageTitle'] = 'SOMA : Editar Fauna Classificação';      
                $this->loadViews("selecao/c_selecaoFaunaClassificacao", $this->global, $data, NULL);
            }
    }

    function adicionaFaunaClassificacao() 
    {
                $nome = $this->input->post('nome');
                $perimetro = $this->input->post('perimetro');
                $dt_inicio = $this->input->post('dt_inicio');
                $dt_final = $this->input->post('dt_final');

                $infoProjeto = array('nome'=> $nome, 'id_acesso'=> $this->session->userdata('userId'), 'perimetro'=>$perimetro, 'dt_inicio'=>$dt_inicio,
                'dt_final'=> $dt_final);
                
                $result = $this->selecaoModel->adicionaProjeto($infoProjeto);
                
                if($result > 0)
                {
                    $process = 'Adicionar projeto';
                    $processFunction = 'selecao/adicionaProjeto';
                    $this->logrecord($process,$processFunction);

                    $this->session->set_flashdata('success', 'Projeto criado com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na criação do projeto');
                }
                
                redirect('selecaoFaunaClassificacao/listar');
    }


    function editaFaunaClassificacao()
    {           
            $IdUsuario = $this->input->post('co_seq_selecao_pessoa');

                $nome = $this->input->post('ds_nome');
                $cpf = $this->input->post('nu_cpf');
                $id_perfil = $this->input->post('id_perfil');
                $email = $this->security->xss_clean($this->input->post('ds_email'));
                $senha = $this->input->post('ds_senha');
                $admin = 'N';
                        
                $infoUsuario = array();
                
                if(empty($senha))
                {
                    $infoUsuario = array('ds_nome'=> $nome, 'ds_email'=>$email,'st_admin'=>$admin,
                                         'id_perfil'=>$id_perfil,'nu_cpf'=>$cpf);
                }
                else
                {
                    //'Senha'=>getHashedPassword($senha)
                    $infoUsuario = array('ds_nome'=> $nome, 'ds_email'=>$email, 'ds_senha'=>$senha, 
                                        'id_perfil'=> $id_perfil,'st_admin'=>$admin,'nu_cpf'=>$cpf);
                }
                
                $resultado = $this->selecaoModel->editaUsuario($infoUsuario, $IdUsuario);
                
                if($resultado == true)
                {
                    $process = 'Usuário atualizado';
                    $processFunction = 'selecao/editaUsuario';
                    $this->logrecord($process,$processFunction);

                    $this->session->set_flashdata('success', 'Usuário atualizado com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na atualização do usuário');
                }
                
                redirect('selecaoFaunaClassificacao/listar');
           // }
    }

    function apagaFaunaClassificacao()
    {
            $IdProjeto = $this->uri->segment(2);

            $resultado = $this->selecaoModel->apagaProjeto($IdProjeto);
            
            if ($resultado) {
                // echo(json_encode(array('status'=>TRUE)));

                 $process = 'Exclusão de projeto';
                 $processFunction = 'selecao/apagaProjeto';
                 $this->logrecord($process,$processFunction);

                 $this->session->set_flashdata('success', 'Projeto deletado com sucesso');

                }
                else 
                { 
                    //echo(json_encode(array('status'=>FALSE))); 
                    $this->session->set_flashdata('error', 'Falha em excluir o projeto');
                }
                redirect('selecaoFaunaClassificacao/listar');
    }

    function valor($val)
    {
        $val = str_replace(",",".",$val);
        $val = preg_replace('/\.(?=.*\.)/', '', $val);
       // return ($val); 
        return floatval($val);      
    }

}