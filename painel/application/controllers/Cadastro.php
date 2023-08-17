<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';
/**
 * Class : Admin (AdminController)
 * Admin class to control to authenticate admin credentials and include admin functions.
 * @author : Samet Aydın / sametay153@gmail.com
 * @version : 1.0
 * @since : 27.02.2018
 */
class Cadastro extends BaseController
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();
        $this->load->model('login_model');
        $this->load->model('user_model');
        $this->load->model('CadastroModel');
        // Datas -> libraries ->BaseController / This function used load user sessions
        $this->datas();
        // isLoggedIn / Login control function /  This function used login control
        $isLoggedIn = $this->session->userdata('isLoggedIn');
        
        date_default_timezone_set('America/Sao_Paulo');

        if(!isset($isLoggedIn) || $isLoggedIn != TRUE)
        {
            redirect('login');
        }
        
        else
        {
            // isAdmin / Admin role control function / This function used admin role control
            if($this->isAdmin() == TRUE)
            {
                $this->accesslogincontrol();
            }
        }
    }

    // INICIO DAS FUNÇÕES DA TELA DE USUÁRIO

    function cadastroUsuario()
    {
            $tpTela = $this->uri->segment(2);

            $data['perfis'] = $this->CadastroModel->carregaPerfisUsuarios();

            if ($tpTela == 'listar') {

                $searchText = $this->security->xss_clean($this->input->post('searchText'));
                $data['searchText'] = $searchText;
                
                $this->load->library('pagination');
                
                $count = 0;

                $returns = $this->paginationCompress ( "cadastroUsuario/listar", $count, 10 );
                
                $data['registrosUsuarios'] = $this->CadastroModel->listaUsuarios($this->session->userdata('userId'), $this->session->userdata('IdEmpresa'), $searchText, $returns["page"], $returns["segment"]);
                
                $process = 'Listar usuários';
                $processFunction = 'Cadastro/cadastroUsuario';
                $this->logrecord($process,$processFunction);

                $this->global['pageTitle'] = 'QUALICAD : Lista de Usuário';
                
                $this->loadViews("cadastro/l_cadastroUsuario", $this->global, $data, NULL);
            }
            else if ($tpTela == 'cadastrar') {
                $this->global['pageTitle'] = 'QUALICAD : Cadastro de Usuário';
                $this->loadViews("cadastro/c_cadastroUsuario", $this->global, $data, NULL); 
            }
            else if ($tpTela == 'editar') {
                $IdUsuario = $this->uri->segment(3);
                if($IdUsuario == null)
                {
                    redirect('cadastroUsuario/listar');
                }
                $data['infoUsuario'] = $this->CadastroModel->carregaInfoUsuario($IdUsuario);
                $this->global['pageTitle'] = 'QUALICAD : Editar usuário';      
                $this->loadViews("cadastro/c_cadastroUsuario", $this->global, $data, NULL);
            }
    }

    function adicionaUsuario() 
    {
            $this->load->library('form_validation');
            
            $this->form_validation->set_rules('Nome_Usuario','Nome','trim|required|max_length[128]');
            $this->form_validation->set_rules('Cpf_Usuario','CPF','trim|required|max_length[128]');
            $this->form_validation->set_rules('Email','Email','trim|required|valid_email|max_length[128]');
            $this->form_validation->set_rules('Senha','Senha','required|max_length[20]');
            $this->form_validation->set_rules('resenha','Confirme a senha','trim|required|matches[password]|max_length[20]');

        //VALIDAÇÃO

        //    $this->form_validation->set_rules('perfil','Role','trim|required|numeric');
            
        /*    if($this->form_validation->run() == FALSE)
            {

                redirect('cadastroUsuario/cadastrar');
            }
            else
        { */

                $nome = $this->input->post('ds_nome');
                $cpf = $this->input->post('nu_cpf');
                $email = $this->security->xss_clean($this->input->post('ds_email'));
                $senha = $this->input->post('ds_senha');
                $admin = 'N';
            //    $roleId = $this->input->post('role');

                if ($this->CadastroModel->consultaUsuarioExistente($cpf,$email) == null) {

                $infoUsuario = array('ds_nome'=> $nome, 'ds_email'=>$email, 'st_admin'=>$admin,
                                    'nu_cpf'=>$cpf);
                                    
                $result = $this->CadastroModel->adicionaUsuario($infoUsuario);
                
                $infoAcesso = array('co_cadastro_pessoa '=> $infoUsuario, 'ds_senha'=>$senha);
                                    
                $resultAcesso = $this->CadastroModel->adicionaAcesso($infoAcesso);
                
                if($result > 0 && $resultAcesso > 0)
                {
                    $process = 'Adicionar usuário';
                    $processFunction = 'Cadastro/adicionaUsuario';
                    $this->logrecord($process,$processFunction);

                    $this->session->set_flashdata('success', 'Usuário criado com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na criação do usuário');
                }

            } else {
                    $this->session->set_flashdata('error', 'CPF ou Email já foram cadastrados!');
            }
                
                redirect('cadastroUsuario/listar');

        //    }
    }


    function editaUsuario()
    {
            $this->load->library('form_validation');
            
            $IdUsuario = $this->input->post('co_seq_cadastro_pessoa');

            //VALIDAÇÃO
            
         /*   $this->form_validation->set_rules('fname','Full Name','trim|required|max_length[128]');
            $this->form_validation->set_rules('email','Email','trim|required|valid_email|max_length[128]');
            $this->form_validation->set_rules('password','Password','matches[cpassword]|max_length[20]');
            $this->form_validation->set_rules('cpassword','Confirm Password','matches[password]|max_length[20]');
            $this->form_validation->set_rules('role','Role','trim|required|numeric');
            $this->form_validation->set_rules('mobile','Mobile Number','required|min_length[10]');
            
            if($this->form_validation->run() == FALSE)
            { 
                $this->editOld($userId);
            }
            else
            { */

                $nome = $this->input->post('ds_nome');
                $cpf = $this->input->post('nu_cpf');
                $email = $this->security->xss_clean($this->input->post('ds_email'));
                $senha = $this->input->post('ds_senha');
                $admin = 'N';
                        
                $infoUsuario = array();
                
                if(empty($senha))
                {
                    $infoUsuario = array('ds_nome'=> $nome, 'ds_email'=>$email,'st_admin'=>$admin,'nu_cpf'=>$cpf);
                }
                else
                {
                    //'Senha'=>getHashedPassword($senha)
                    $infoUsuario = array('ds_nome'=> $nome, 'ds_email'=>$email, 'ds_senha'=>$senha, 
                                         'st_admin'=>$admin,'nu_cpf'=>$cpf);
                }
                
                $resultado = $this->CadastroModel->editaUsuario($infoUsuario, $IdUsuario);
                
                if($resultado == true)
                {
                    $process = 'Usuário atualizado';
                    $processFunction = 'Cadastro/editaUsuario';
                    $this->logrecord($process,$processFunction);

                    $this->session->set_flashdata('success', 'Usuário atualizado com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na atualização do usuário');
                }
                
                redirect('cadastroUsuario/listar');
           // }
    }

    function apagaUsuario()
    {
            $IdUsuario = $this->uri->segment(2);

            $resultado = $this->CadastroModel->apagaUsuario($IdUsuario);
            
            if ($resultado) {
                // echo(json_encode(array('status'=>TRUE)));

                 $process = 'Exclusão de usuário';
                 $processFunction = 'Cadastro/apagaUsuario';
                 $this->logrecord($process,$processFunction);

                 $this->session->set_flashdata('success', 'Usuário deletado com sucesso');

                }
                else 
                { 
                    //echo(json_encode(array('status'=>FALSE))); 
                    $this->session->set_flashdata('error', 'Falha em excluir o usuário');
                }
                redirect('cadastroUsuario/listar');
    }
    // FIM DAS FUNÇÕES DA TELA DE USUÁRIO

    // INICIO DAS FUNÇÕES DA TELA DE PERFIL

    function cadastroPerfil()
    {
            $tpTela = $this->uri->segment(2);

            $data['perfis'] = $this->CadastroModel->carregaPerfisUsuarios();

            if ($tpTela == 'listar') {

                $searchText = $this->security->xss_clean($this->input->post('searchText'));
                $data['searchText'] = $searchText;
                
                $this->load->library('pagination');
                
                $count = 0;

                $returns = $this->paginationCompress ( "cadastroPerfil/listar", $count, 10 );
                
                $data['registrosPerfis'] = $this->CadastroModel->listaPerfis($searchText, $returns["page"], $returns["segment"]);
                
                $process = 'Listar perfis';
                $processFunction = 'Cadastro/cadastroPerfil';
                $this->logrecord($process,$processFunction);

                $this->global['pageTitle'] = 'QUALICAD : Lista de Perfil';
                
                $this->loadViews("cadastro/l_cadastroPerfil", $this->global, $data, NULL);
            }
            else if ($tpTela == 'cadastrar') {
                $this->global['pageTitle'] = 'QUALICAD : Cadastro de Perfil';
                $this->loadViews("cadastro/c_cadastroPerfil", $this->global, $data, NULL); 
            }
            else if ($tpTela == 'editar') {
                $IdPerfil = $this->uri->segment(3);
                if($IdPerfil == null)
                {
                    redirect('cadastroPerfil/listar');
                }
                $data['infoPerfil'] = $this->CadastroModel->carregaInfoPerfil($IdPerfil);
                $this->global['pageTitle'] = 'QUALICAD : Editar Perfil';      
                $this->loadViews("cadastro/c_cadastroPerfil", $this->global, $data, NULL);
            }
    }

    function adicionaPerfil() 
    {
            $this->load->library('form_validation');
            
            $this->form_validation->set_rules('Nome','Nome','trim|required|max_length[128]');        

        //VALIDAÇÃO

        //    $this->form_validation->set_rules('perfil','Role','trim|required|numeric');
            
        //    if($this->form_validation->run() == FALSE)
        //    {

        //        $data['perfis'] = $this->CadastroModel->carregaPerfisUsuarios();
        //        $this->global['pageTitle'] = 'QUALICAD : Adicionar usuário';
        //        $this->loadViews("c_cadastroUsuario", $this->global, $data, NULL);

        //    }
        //    else
        //{

                $id_perfil = $this->input->post('id_perfil');
                $ds_perfil = $this->input->post('ds_perfil');
                $st_admin = $this->input->post('st_admin');
                
                $infoPerfil = array('id_perfil'=> $id_perfil,'ds_perfil'=>$ds_perfil,'st_admin'=>$st_admin);
                                    
                $resultado = $this->CadastroModel->adicionaPerfil($infoPerfil);
                
                if($resultado > 0)
                {
                    $process = 'Adicionar perfil';
                    $processFunction = 'Cadastro/adicionaPerfil';
                    $this->logrecord($process,$processFunction);

                    $this->session->set_flashdata('success', 'Perfil criado com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na criação do perfil');
                }
                
                redirect('cadastroPerfil/listar');

        //    }
    }


    function editaPerfil()
    {
            $this->load->library('form_validation');
            
            $IdPerfil = $this->input->post('Id_CdPerfil');

            //VALIDAÇÃO
            
         /*   $this->form_validation->set_rules('fname','Full Name','trim|required|max_length[128]');
            $this->form_validation->set_rules('email','Email','trim|required|valid_email|max_length[128]');
            $this->form_validation->set_rules('password','Password','matches[cpassword]|max_length[20]');
            $this->form_validation->set_rules('cpassword','Confirm Password','matches[password]|max_length[20]');
            $this->form_validation->set_rules('role','Role','trim|required|numeric');
            $this->form_validation->set_rules('mobile','Mobile Number','required|min_length[10]');
            
            if($this->form_validation->run() == FALSE)
            { 
                $this->editOld($userId);
            }
            else
            { */

                $Ds_Perfil = ucwords(strtolower($this->security->xss_clean($this->input->post('Ds_Perfil'))));
                $PerfilAdmin = $this->input->post('PerfilAdmin');
                $Tp_Ativo = $this->input->post('Tp_Ativo');  

                foreach ($this->CadastroModel->carregaInfoPerfil($IdPerfil) as $data){
                    $Tp_Ativo_Atual = ($data->Tp_Ativo);
                }

                // if ($Tp_Ativo_Atual == 'N' && $Tp_Ativo == 'S')
                // {
                //     $Dt_Ativo = date('Y-m-d H:i:s');
                //     $Dt_Inativo = null;
                // } else if ($Tp_Ativo == 'N')
                // {
                //     $Dt_Ativo = null;
                //     $Dt_Inativo = date('Y-m-d H:i:s');
                // }     
                
                $Dt_Atualizacao = date('Y-m-d H:i:s');
                
                $infoPerfil = array('Ds_Perfil'=> $Ds_Perfil, 'AtualizadoPor'=>$this->vendorId,
                                    'PerfilAdmin'=>$PerfilAdmin, 'Dt_Atualizacao'=>$Dt_Atualizacao,
                                    'Tp_Ativo'=>$Tp_Ativo);
                
                
                $resultado = $this->CadastroModel->editaPerfil($infoPerfil, $IdPerfil);
                
                if($resultado == true)
                {
                    $process = 'Perfil atualizado';
                    $processFunction = 'Cadastro/editaPerfil';
                    $this->logrecord($process,$processFunction);

                    $this->session->set_flashdata('success', 'Perfil atualizado com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na atualização do perfil');
                }
                
                redirect('cadastroPerfil/listar');
           // }
    }

    function apagaPerfil()
    {
            $IdPerfil = $this->uri->segment(2);

            $infoPerfil = array('Deletado'=>'S', 'AtualizadoPor'=>$this->vendorId, 'Dt_Atualizacao'=>date('Y-m-d H:i:s'));
            
            $resultado = $this->CadastroModel->apagaPerfil($infoPerfil, $IdPerfil);
            
            if ($resultado) {
                // echo(json_encode(array('status'=>TRUE)));

                 $process = 'Exclusão de perfil';
                 $processFunction = 'Cadastro/apagaPerfil';
                 $this->logrecord($process,$processFunction);

                 $this->session->set_flashdata('success', 'Perfil deletado com sucesso');

                }
                else 
                { 
                    //echo(json_encode(array('status'=>FALSE))); 
                    $this->session->set_flashdata('error', 'Falha em excluir o perfil');
                }
                redirect('cadastroPerfil/listar');
    }
    // FIM DAS FUNÇÕES DA TELA DE PERFIL


    // INICIO DAS FUNÇÕES DA TELA DE TELAS

    function cadastroTelas()
    {
            $tpTela = $this->uri->segment(2);

            $data['perfis'] = $this->CadastroModel->carregaPerfisUsuarios();

            if ($tpTela == 'listar') {

                $searchText = $this->security->xss_clean($this->input->post('searchText'));
                $data['searchText'] = $searchText;
                
                $this->load->library('pagination');
                
                $count = $this->CadastroModel->userListingCount($searchText);

                $returns = $this->paginationCompress ( "cadastroTelas/listar", $count, 50 );
                
                $data['registrosTelas'] = $this->CadastroModel->listaTelas($this->session->userdata('userId'), $searchText, $returns["page"], $returns["segment"]);
                
                $process = 'Listar telas';
                $processFunction = 'Cadastro/cadastroTelas';
                $this->logrecord($process,$processFunction);

                $this->global['pageTitle'] = 'QUALICAD : Lista de Telas';
                
                $this->loadViews("cadastro/l_cadastroTelas", $this->global, $data, NULL);
            }
            else if ($tpTela == 'editar') {
                $IdTelas = $this->uri->segment(3);
                if($IdTelas == null)
                {
                    redirect('cadastroTela/listar');
                }
                $data['infoTelas'] = $this->CadastroModel->carregaInfoTelas($IdTelas);
                $this->global['pageTitle'] = 'QUALICAD : Editar Telas';      
                $this->loadViews("cadastro/c_cadastroTelas", $this->global, $data, NULL);
            }
    }

    function editaTelas()
    {
            $this->load->library('form_validation');
            
            $IdTela = $this->input->post('Id_Tela');

            //VALIDAÇÃO
            
         /*   $this->form_validation->set_rules('fname','Full Name','trim|required|max_length[128]');
            $this->form_validation->set_rules('email','Email','trim|required|valid_email|max_length[128]');
            $this->form_validation->set_rules('password','Password','matches[cpassword]|max_length[20]');
            $this->form_validation->set_rules('cpassword','Confirm Password','matches[password]|max_length[20]');
            $this->form_validation->set_rules('role','Role','trim|required|numeric');
            $this->form_validation->set_rules('mobile','Mobile Number','required|min_length[10]');
            
            if($this->form_validation->run() == FALSE)
            { 
                $this->editOld($userId);
            }
            else
            { */

                $Tp_Ativo = $this->input->post('Tp_Ativo');  

                foreach ($this->CadastroModel->carregaInfoTelas($IdTela) as $data){
                    $Tp_Ativo_Atual = ($data->Tp_Ativo);
                }

                // if ($Tp_Ativo_Atual == 'N' && $Tp_Ativo == 'S')
                // {
                //     $Dt_Ativo = date('Y-m-d H:i:s');
                //     $Dt_Inativo = null;
                // } else if ($Tp_Ativo == 'N')
                // {
                //     $Dt_Ativo = null;
                //     $Dt_Inativo = date('Y-m-d H:i:s');
                // }
                
                $Dt_Atualizacao = date('Y-m-d H:i:s');
                
                $infoTela = array('AtualizadoPor'=>$this->vendorId, 'Dt_Atualizacao'=>$Dt_Atualizacao,
                                    'Tp_Ativo'=>$Tp_Ativo);
                
                
                $resultado = $this->CadastroModel->editaTelas($infoTela, $IdTela);
                
                if($resultado == true)
                {
                    $process = 'Tela atualizada';
                    $processFunction = 'Cadastro/editaTelas';
                    $this->logrecord($process,$processFunction);

                    $this->session->set_flashdata('success', 'Tela atualizada com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na atualização da tela');
                }
                
                redirect('cadastroTelas/listar');
           // }
    }
// FIM DAS FUNÇÕES DA TELA DE TELAS

// INICIO DAS FUNÇÕES DA TELA DE PERMISSAO

function cadastroPermissao()
{
        $tpTela = $this->uri->segment(2);

        $data['perfis'] = $this->CadastroModel->carregaPerfisUsuarios();

        if ($tpTela == 'listar') {

            $searchText = $this->security->xss_clean($this->input->post('searchText'));
            $data['searchText'] = $searchText;
            
            $this->load->library('pagination');
            
            $count = 0;

            $returns = $this->paginationCompress ( "cadastroPermissao/listar", $count, 100 );
            
            $data['registrosPermissao'] = $this->CadastroModel->listaPermissao($this->session->userdata('userId'), $searchText, $returns["page"], $returns["segment"]);
            
            $process = 'Listar telas';
            $processFunction = 'Cadastro/cadastroPermissao';
            $this->logrecord($process,$processFunction);

            $this->global['pageTitle'] = 'QUALICAD : Lista de Permissões';
            
            $this->loadViews("cadastro/l_cadastroPermissao", $this->global, $data, NULL);
        }
        else if ($tpTela == 'editar') {
            $IdPermissao = $this->uri->segment(3);
            if($IdPermissao == null)
            {
                redirect('cadastroPermissao/listar');
            }
            $data['infoPermissao'] = $this->CadastroModel->carregaInfoPermissao($IdPermissao);
            $this->global['pageTitle'] = 'QUALICAD : Editar Permissões';      
            $this->loadViews("cadastro/c_cadastroPermissao", $this->global, $data, NULL);
        }
}

function editaPermissao()
{
        $this->load->library('form_validation');
        
        $IdPermissao = $this->input->post('Id_Permissao');

        //VALIDAÇÃO
        
     /*   $this->form_validation->set_rules('fname','Full Name','trim|required|max_length[128]');
        $this->form_validation->set_rules('email','Email','trim|required|valid_email|max_length[128]');
        $this->form_validation->set_rules('password','Password','matches[cpassword]|max_length[20]');
        $this->form_validation->set_rules('cpassword','Confirm Password','matches[password]|max_length[20]');
        $this->form_validation->set_rules('role','Role','trim|required|numeric');
        $this->form_validation->set_rules('mobile','Mobile Number','required|min_length[10]');
        
        if($this->form_validation->run() == FALSE)
        { 
            $this->editOld($userId);
        }
        else
        { */

            $Atualizar = $this->input->post('Atualizar');
            $Inserir = $this->input->post('Inserir');  
            $Excluir = $this->input->post('Excluir');  
            $Consultar = $this->input->post('Consultar');  
            $Imprimir = $this->input->post('Imprimir');  

            $infoPermissao = array('Atualizar'=>$Atualizar, 'Inserir'=>$Inserir, 'Excluir'=>$Excluir,
                                'Consultar'=>$Consultar,'Imprimir'=>$Imprimir, 'AtualizadoPor'=>$this->vendorId);
            
            $resultado = $this->CadastroModel->editaPermissao($infoPermissao, $IdPermissao);
            
            if($resultado == true)
            {
                $process = 'Permissão atualizada';
                $processFunction = 'Cadastro/editaPermissao';
                $this->logrecord($process,$processFunction);

                $this->session->set_flashdata('success', 'Permissões atualizadas com sucesso');
            }
            else
            {
                $this->session->set_flashdata('error', 'Falha na atualização das permissões');
            }
            
            redirect('cadastroPermissao/listar');
       // }
}
// FIM DAS FUNÇÕES DA TELA DE PERMISSAO

}