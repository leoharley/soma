<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';
/**
 * Class : Admin (AdminController)
 * Admin class to control to authenticate admin credentials and include admin functions.
 * @author : Samet Aydın / sametay153@gmail.com
 * @version : 1.0
 * @since : 27.02.2018
 */
class Principal extends BaseController
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

    function principalProjeto()
    {
            $tpTela = $this->uri->segment(2);

            $data['perfis'] = $this->PrincipalModel->carregaPerfisUsuarios();

            if ($tpTela == 'listar') {

                $searchText = $this->security->xss_clean($this->input->post('searchText'));
                $data['searchText'] = $searchText;
                
                $this->load->library('pagination');
                
                $count = 0;

                $returns = $this->paginationCompress ( "principalProjeto/listar", $count, 10 );
                
                $data['registrosProjetos'] = $this->PrincipalModel->listaProjetos($searchText, $returns["page"], $returns["segment"]);
                
                $process = 'Listar projetos';
                $processFunction = 'Principal/principalProjeto';
                $this->logrecord($process,$processFunction);

                $this->global['pageTitle'] = 'SOMA : Lista de Projeto';

                $data['infoPerfil'] = $this->PrincipalModel->carregaInfoPerfil();
               
                $this->loadViews("principal/l_principalProjeto", $this->global, $data, NULL);
            }
            else if ($tpTela == 'cadastrar') {
                $this->global['pageTitle'] = 'SOMA : Cadastro de Projeto';
                
                $data['infoPerfil'] = $this->PrincipalModel->carregaInfoPerfil();

                $this->loadViews("principal/c_principalProjeto", $this->global, $data, NULL); 
            }
            else if ($tpTela == 'editar') {
                $IdUsuario = $this->uri->segment(3);
                if($IdUsuario == null)
                {
                    redirect('principalProjeto/listar');
                }

                $data['infoPerfil'] = $this->PrincipalModel->carregaInfoPerfil();
                $data['infoUsuario'] = $this->PrincipalModel->carregaInfoUsuario($IdUsuario);
                $this->global['pageTitle'] = 'SOMA : Editar projeto';      
                $this->loadViews("principal/c_principalProjeto", $this->global, $data, NULL);
            }
    }

    function adicionaProjeto() 
    {
         /*   $this->load->library('form_validation');
            
            $this->form_validation->set_rules('Nome_Usuario','Nome','trim|required|max_length[128]');
            $this->form_validation->set_rules('Cpf_Usuario','CPF','trim|required|max_length[128]');
            $this->form_validation->set_rules('Email','Email','trim|required|valid_email|max_length[128]');
            $this->form_validation->set_rules('Senha','Senha','required|max_length[20]');
            $this->form_validation->set_rules('resenha','Confirme a senha','trim|required|matches[password]|max_length[20]');*/

        //VALIDAÇÃO

        //    $this->form_validation->set_rules('perfil','Role','trim|required|numeric');
            
        /*    if($this->form_validation->run() == FALSE)
            {

                redirect('principalUsuario/cadastrar');
            }
            else
        { */

                $nome = $this->input->post('nome');
                $perimetro = $this->input->post('perimetro');
                $dt_inicio = $this->input->post('dt_inicio');
                $dt_final = $this->input->post('dt_final');
            //    $roleId = $this->input->post('role');

                $infoProjeto = array('nome'=> $nome, 'id_acesso'=> $this->session->userdata('userId'), 'perimetro'=>$perimetro, 'dt_inicio'=>$dt_inicio,
                'dt_final'=> $dt_final);
                
                $result = $this->PrincipalModel->adicionaProjeto($infoProjeto);
                
                if($result > 0)
                {
                    $process = 'Adicionar projeto';
                    $processFunction = 'Principal/adicionaProjeto';
                    $this->logrecord($process,$processFunction);

                    $this->session->set_flashdata('success', 'Projeto criado com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na criação do projeto');
                }

   
                
                redirect('principalProjeto/listar');

        //    }
    }


    function editaProjeto()
    {
            $this->load->library('form_validation');
            
            $IdUsuario = $this->input->post('co_seq_principal_pessoa');

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
                
                $resultado = $this->PrincipalModel->editaUsuario($infoUsuario, $IdUsuario);
                
                if($resultado == true)
                {
                    $process = 'Usuário atualizado';
                    $processFunction = 'Principal/editaUsuario';
                    $this->logrecord($process,$processFunction);

                    $this->session->set_flashdata('success', 'Usuário atualizado com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na atualização do usuário');
                }
                
                redirect('principalUsuario/listar');
           // }
    }

    function apagaProjeto()
    {
            $IdProjeto = $this->uri->segment(2);

            $resultado = $this->PrincipalModel->apagaProjeto($IdProjeto);
            
            if ($resultado) {
                // echo(json_encode(array('status'=>TRUE)));

                 $process = 'Exclusão de projeto';
                 $processFunction = 'Principal/apagaProjeto';
                 $this->logrecord($process,$processFunction);

                 $this->session->set_flashdata('success', 'Projeto deletado com sucesso');

                }
                else 
                { 
                    //echo(json_encode(array('status'=>FALSE))); 
                    $this->session->set_flashdata('error', 'Falha em excluir o projeto');
                }
                redirect('principalProjeto/listar');
    }
    // FIM DAS FUNÇÕES DA TELA DE USUÁRIO

    // INICIO DAS FUNÇÕES DA TELA DE PERFIL

    function principalPropriedade()
    {
            $tpTela = $this->uri->segment(2);

            $data['perfis'] = $this->PrincipalModel->carregaPerfisUsuarios();

            if ($tpTela == 'listar') {

                $searchText = $this->security->xss_clean($this->input->post('searchText'));
                $data['searchText'] = $searchText;
                
                $this->load->library('pagination');
                
                $count = 0;

                $returns = $this->paginationCompress ( "principalPropriedade/listar", $count, 10 );
                
                $data['registrosPropriedades'] = $this->PrincipalModel->listaPropriedades($searchText, $returns["page"], $returns["segment"]);
                
                $process = 'Listar propriedades';
                $processFunction = 'Principal/principalPropriedade';
                $this->logrecord($process,$processFunction);

                $this->global['pageTitle'] = 'SOMA : Lista de Propriedades';
                
                $this->loadViews("principal/l_principalPropriedade", $this->global, $data, NULL);
            }
            else if ($tpTela == 'cadastrar') {
                $this->global['pageTitle'] = 'SOMA : Cadastro de Propriedades';
                
                $data['infoProjetos'] = $this->PrincipalModel->carregaInfoProjetos();

                $this->loadViews("principal/c_principalPropriedade", $this->global, $data, NULL); 
            }
            else if ($tpTela == 'editar') {
                $IdPropriedade = $this->uri->segment(3);
                if($IdPropriedade == null)
                {
                    redirect('principalPropriedade/listar');
                }
                $data['infoProjetos'] = $this->PrincipalModel->carregaInfoProjetos();
                $data['infoPropriedade'] = $this->PrincipalModel->carregaInfoPropriedadeExistente($IdPropriedade);
                $this->global['pageTitle'] = 'SOMA : Editar Propriedade';      
                $this->loadViews("principal/c_principalPropriedade", $this->global, $data, NULL);
            }
    }

    function adicionaPropriedade() 
    {

        //VALIDAÇÃO

        //    $this->form_validation->set_rules('perfil','Role','trim|required|numeric');
            
        //    if($this->form_validation->run() == FALSE)
        //    {

        //        $data['perfis'] = $this->PrincipalModel->carregaPerfisUsuarios();
        //        $this->global['pageTitle'] = 'SOMA : Adicionar usuário';
        //        $this->loadViews("c_principalUsuario", $this->global, $data, NULL);

        //    }
        //    else
        //{

                $id_projeto = $this->input->post('id_projeto');
                $nu_ano_emissao = $this->input->post('nu_ano_emissao');
                $nu_inscricao_car = $this->input->post('nu_inscricao_car');
                $nu_ccir = $this->input->post('nu_ccir');
                $proprietario = $this->input->post('proprietario');
                $no_propriedade = $this->input->post('no_propriedade');
                $cnpj = preg_replace('/[^0-9]/', '', $this->input->post('cnpj'));
                $cpf = preg_replace('/[^0-9]/', '', $this->input->post('cpf'));
                $liberado_campo = $this->input->post('liberado_campo');
                
                $infoPropriedade = array('id_acesso'=> $this->session->userdata('userId'), 'id_projeto'=> $id_projeto,
                'nu_ano_emissao'=>$nu_ano_emissao,'nu_inscricao_car'=>$nu_inscricao_car, 'nu_ccir'=>$nu_ccir,
                'proprietario'=>$proprietario,'no_propriedade'=>$no_propriedade, 'cnpj'=>$cnpj,
                'cpf'=>$cpf,'liberado_campo'=>$liberado_campo);
                                    
                $resultado = $this->PrincipalModel->adicionaPropriedade($infoPropriedade);
                
                if($resultado > 0)
                {
                    $process = 'Adicionar propriedade';
                    $processFunction = 'Principal/adicionaPropriedade';
                    $this->logrecord($process,$processFunction);

                    $this->session->set_flashdata('success', 'Propriedade criada com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na criação do propriedade');
                }
                
                redirect('principalPropriedade/listar');

        //    }
    }


    function editaPropriedade()
    {
            $this->load->library('form_validation');
            
            $IdPropriedade = $this->input->post('id');

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

                $id_projeto = $this->input->post('id_projeto');
                $nu_ano_emissao = $this->input->post('nu_ano_emissao');
                $nu_inscricao_car = $this->input->post('nu_inscricao_car');
                $nu_ccir = $this->input->post('nu_ccir');
                $proprietario = $this->input->post('proprietario');
                $no_propriedade = $this->input->post('no_propriedade');
                $cnpj = $this->input->post('cnpj');
                $cpf = $this->input->post('cpf');
                $liberado_campo = $this->input->post('liberado_campo');
                
                $infoPropriedade = array('id_acesso'=> $this->session->userdata('userId'), 'id_projeto'=> $id_projeto,
                'nu_ano_emissao'=>$nu_ano_emissao,'nu_inscricao_car'=>$nu_inscricao_car, 'nu_ccir'=>$nu_ccir,
                'proprietario'=>$proprietario,'no_propriedade'=>$no_propriedade, 'cnpj'=>$cnpj,
                'cpf'=>$cpf,'liberado_campo'=>$liberado_campo);
                
                
                $resultado = $this->PrincipalModel->editaPropriedade($infoPropriedade, $IdPropriedade);
                
                if($resultado == true)
                {
                    $process = 'Propriedade atualizada';
                    $processFunction = 'Principal/editaPropriedade';
                    $this->logrecord($process,$processFunction);

                    $this->session->set_flashdata('success', 'Propriedade atualizada com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na atualização da propriedade');
                }
                
                redirect('principalPropriedade/listar');
           // }
    }

    function apagaPropriedade()
    {
            $IdPropriedade = $this->uri->segment(2);
              
            $resultado = $this->PrincipalModel->apagaPropriedade($IdPropriedade);
            
            if ($resultado) {
                // echo(json_encode(array('status'=>TRUE)));

                 $process = 'Exclusão de propriedade';
                 $processFunction = 'Principal/apagaPropriedade';
                 $this->logrecord($process,$processFunction);

                 $this->session->set_flashdata('success', 'Propriedade deletada com sucesso');

                }
                else 
                { 
                    //echo(json_encode(array('status'=>FALSE))); 
                    $this->session->set_flashdata('error', 'Falha em excluir a propriedade');
                }
                redirect('principalPropriedade/listar');
    }
    // FIM DAS FUNÇÕES DA TELA DE PERFIL


    // INICIO DAS FUNÇÕES DA TELA DE TELAS

    function principalParcela()
    {
            $tpTela = $this->uri->segment(2);

            $data['perfis'] = $this->PrincipalModel->carregaPerfisUsuarios();

            if ($tpTela == 'listar') {

                $searchText = $this->security->xss_clean($this->input->post('searchText'));
                $data['searchText'] = $searchText;
                
                $this->load->library('pagination');
                
                $count = $this->PrincipalModel->userListingCount($searchText);

                $returns = $this->paginationCompress ( "principalTelas/listar", $count, 50 );
                
                $data['registrosTelas'] = $this->PrincipalModel->listaTelas($this->session->userdata('userId'), $searchText, $returns["page"], $returns["segment"]);
                
                $process = 'Listar telas';
                $processFunction = 'Principal/principalTelas';
                $this->logrecord($process,$processFunction);

                $this->global['pageTitle'] = 'SOMA : Lista de Telas';
                
                $this->loadViews("principal/l_principalTelas", $this->global, $data, NULL);
            }
            else if ($tpTela == 'editar') {
                $IdTelas = $this->uri->segment(3);
                if($IdTelas == null)
                {
                    redirect('principalTela/listar');
                }
                $data['infoTelas'] = $this->PrincipalModel->carregaInfoTelas($IdTelas);
                $this->global['pageTitle'] = 'SOMA : Editar Telas';      
                $this->loadViews("principal/c_principalTelas", $this->global, $data, NULL);
            }
    }

    function editaParcela()
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

                foreach ($this->PrincipalModel->carregaInfoTelas($IdTela) as $data){
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
                
                
                $resultado = $this->PrincipalModel->editaTelas($infoTela, $IdTela);
                
                if($resultado == true)
                {
                    $process = 'Tela atualizada';
                    $processFunction = 'Principal/editaTelas';
                    $this->logrecord($process,$processFunction);

                    $this->session->set_flashdata('success', 'Tela atualizada com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na atualização da tela');
                }
                
                redirect('principalTelas/listar');
           // }
    }

    function apagaParcela()
    {
            $IdPerfil = $this->uri->segment(2);

            $infoPerfil = array('Deletado'=>'S', 'AtualizadoPor'=>$this->vendorId, 'Dt_Atualizacao'=>date('Y-m-d H:i:s'));
            
            $resultado = $this->PrincipalModel->apagaPerfil($infoPerfil, $IdPerfil);
            
            if ($resultado) {
                // echo(json_encode(array('status'=>TRUE)));

                 $process = 'Exclusão de perfil';
                 $processFunction = 'Principal/apagaPerfil';
                 $this->logrecord($process,$processFunction);

                 $this->session->set_flashdata('success', 'Perfil deletado com sucesso');

                }
                else 
                { 
                    //echo(json_encode(array('status'=>FALSE))); 
                    $this->session->set_flashdata('error', 'Falha em excluir o perfil');
                }
                redirect('principalPerfil/listar');
    }
// FIM DAS FUNÇÕES DA TELA DE TELAS

// INICIO DAS FUNÇÕES DA TELA DE PERMISSAO

function principalFlora()
    {
            $tpTela = $this->uri->segment(2);

            $data['perfis'] = $this->PrincipalModel->carregaPerfisUsuarios();

            if ($tpTela == 'listar') {

                $searchText = $this->security->xss_clean($this->input->post('searchText'));
                $data['searchText'] = $searchText;
                
                $this->load->library('pagination');
                
                $count = 0;

                $returns = $this->paginationCompress ( "principalProjeto/listar", $count, 10 );
                
                $data['registrosProjetos'] = $this->PrincipalModel->listaProjetos($searchText, $returns["page"], $returns["segment"]);
                
                $process = 'Listar projetos';
                $processFunction = 'Principal/principalProjeto';
                $this->logrecord($process,$processFunction);

                $this->global['pageTitle'] = 'SOMA : Lista de Projeto';

                $data['infoPerfil'] = $this->PrincipalModel->carregaInfoPerfil();
               
                $this->loadViews("principal/l_principalProjeto", $this->global, $data, NULL);
            }
            else if ($tpTela == 'cadastrar') {
                $this->global['pageTitle'] = 'SOMA : Cadastro de Projeto';
                
                $data['infoPerfil'] = $this->PrincipalModel->carregaInfoPerfil();

                $this->loadViews("principal/c_principalProjeto", $this->global, $data, NULL); 
            }
            else if ($tpTela == 'editar') {
                $IdUsuario = $this->uri->segment(3);
                if($IdUsuario == null)
                {
                    redirect('principalProjeto/listar');
                }

                $data['infoPerfil'] = $this->PrincipalModel->carregaInfoPerfil();
                $data['infoUsuario'] = $this->PrincipalModel->carregaInfoUsuario($IdUsuario);
                $this->global['pageTitle'] = 'SOMA : Editar projeto';      
                $this->loadViews("principal/c_principalProjeto", $this->global, $data, NULL);
            }
    }

    function adicionaFlora() 
    {
         /*   $this->load->library('form_validation');
            
            $this->form_validation->set_rules('Nome_Usuario','Nome','trim|required|max_length[128]');
            $this->form_validation->set_rules('Cpf_Usuario','CPF','trim|required|max_length[128]');
            $this->form_validation->set_rules('Email','Email','trim|required|valid_email|max_length[128]');
            $this->form_validation->set_rules('Senha','Senha','required|max_length[20]');
            $this->form_validation->set_rules('resenha','Confirme a senha','trim|required|matches[password]|max_length[20]');*/

        //VALIDAÇÃO

        //    $this->form_validation->set_rules('perfil','Role','trim|required|numeric');
            
        /*    if($this->form_validation->run() == FALSE)
            {

                redirect('principalUsuario/cadastrar');
            }
            else
        { */

                $nome = $this->input->post('ds_nome');
                $cpf = $this->input->post('nu_cpf');
                $email = $this->security->xss_clean($this->input->post('ds_email'));
                $id_perfil = $this->input->post('id_perfil');
                $senha = $this->input->post('ds_senha');
                $admin = 'N';
            //    $roleId = $this->input->post('role');

                if ($this->PrincipalModel->consultaUsuarioExistente($cpf,$email) == null) {

                $infoUsuario = array('ds_nome'=> $nome, 'ds_email'=>$email, 'st_admin'=>$admin,
                                    'id_perfil'=> $id_perfil, 'nu_cpf'=>$cpf);
                                    
                $result = $this->PrincipalModel->adicionaUsuario($infoUsuario);
                
                $infoAcesso = array('co_principal_pessoa '=> $result, 'ds_senha'=>$senha);
                                    
                $resultAcesso = $this->PrincipalModel->adicionaAcesso($infoAcesso);
                
                if($result > 0 && $resultAcesso > 0)
                {
                    $process = 'Adicionar usuário';
                    $processFunction = 'Principal/adicionaUsuario';
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
                
                redirect('principalUsuario/listar');

        //    }
    }


    function editaFlora()
    {
            $this->load->library('form_validation');
            
            $IdUsuario = $this->input->post('co_seq_principal_pessoa');

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
                
                $resultado = $this->PrincipalModel->editaUsuario($infoUsuario, $IdUsuario);
                
                if($resultado == true)
                {
                    $process = 'Usuário atualizado';
                    $processFunction = 'Principal/editaUsuario';
                    $this->logrecord($process,$processFunction);

                    $this->session->set_flashdata('success', 'Usuário atualizado com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na atualização do usuário');
                }
                
                redirect('principalUsuario/listar');
           // }
    }

    function apagaFlora()
    {
            $IdUsuario = $this->uri->segment(2);

            $resultado = $this->PrincipalModel->apagaUsuario($IdUsuario);
            
            if ($resultado) {
                // echo(json_encode(array('status'=>TRUE)));

                 $process = 'Exclusão de usuário';
                 $processFunction = 'Principal/apagaUsuario';
                 $this->logrecord($process,$processFunction);

                 $this->session->set_flashdata('success', 'Usuário deletado com sucesso');

                }
                else 
                { 
                    //echo(json_encode(array('status'=>FALSE))); 
                    $this->session->set_flashdata('error', 'Falha em excluir o usuário');
                }
                redirect('principalUsuario/listar');
    }
// FIM DAS FUNÇÕES DA TELA DE PERMISSAO

function principalFauna()
    {
            $tpTela = $this->uri->segment(2);

            $data['perfis'] = $this->PrincipalModel->carregaPerfisUsuarios();

            if ($tpTela == 'listar') {

                $searchText = $this->security->xss_clean($this->input->post('searchText'));
                $data['searchText'] = $searchText;
                
                $this->load->library('pagination');
                
                $count = 0;

                $returns = $this->paginationCompress ( "principalProjeto/listar", $count, 10 );
                
                $data['registrosProjetos'] = $this->PrincipalModel->listaProjetos($searchText, $returns["page"], $returns["segment"]);
                
                $process = 'Listar projetos';
                $processFunction = 'Principal/principalProjeto';
                $this->logrecord($process,$processFunction);

                $this->global['pageTitle'] = 'SOMA : Lista de Projeto';

                $data['infoPerfil'] = $this->PrincipalModel->carregaInfoPerfil();
               
                $this->loadViews("principal/l_principalProjeto", $this->global, $data, NULL);
            }
            else if ($tpTela == 'cadastrar') {
                $this->global['pageTitle'] = 'SOMA : Cadastro de Projeto';
                
                $data['infoPerfil'] = $this->PrincipalModel->carregaInfoPerfil();

                $this->loadViews("principal/c_principalProjeto", $this->global, $data, NULL); 
            }
            else if ($tpTela == 'editar') {
                $IdUsuario = $this->uri->segment(3);
                if($IdUsuario == null)
                {
                    redirect('principalProjeto/listar');
                }

                $data['infoPerfil'] = $this->PrincipalModel->carregaInfoPerfil();
                $data['infoUsuario'] = $this->PrincipalModel->carregaInfoUsuario($IdUsuario);
                $this->global['pageTitle'] = 'SOMA : Editar projeto';      
                $this->loadViews("principal/c_principalProjeto", $this->global, $data, NULL);
            }
    }

    function adicionaFauna() 
    {
         /*   $this->load->library('form_validation');
            
            $this->form_validation->set_rules('Nome_Usuario','Nome','trim|required|max_length[128]');
            $this->form_validation->set_rules('Cpf_Usuario','CPF','trim|required|max_length[128]');
            $this->form_validation->set_rules('Email','Email','trim|required|valid_email|max_length[128]');
            $this->form_validation->set_rules('Senha','Senha','required|max_length[20]');
            $this->form_validation->set_rules('resenha','Confirme a senha','trim|required|matches[password]|max_length[20]');*/

        //VALIDAÇÃO

        //    $this->form_validation->set_rules('perfil','Role','trim|required|numeric');
            
        /*    if($this->form_validation->run() == FALSE)
            {

                redirect('principalUsuario/cadastrar');
            }
            else
        { */

                $nome = $this->input->post('ds_nome');
                $cpf = $this->input->post('nu_cpf');
                $email = $this->security->xss_clean($this->input->post('ds_email'));
                $id_perfil = $this->input->post('id_perfil');
                $senha = $this->input->post('ds_senha');
                $admin = 'N';
            //    $roleId = $this->input->post('role');

                if ($this->PrincipalModel->consultaUsuarioExistente($cpf,$email) == null) {

                $infoUsuario = array('ds_nome'=> $nome, 'ds_email'=>$email, 'st_admin'=>$admin,
                                    'id_perfil'=> $id_perfil, 'nu_cpf'=>$cpf);
                                    
                $result = $this->PrincipalModel->adicionaUsuario($infoUsuario);
                
                $infoAcesso = array('co_principal_pessoa '=> $result, 'ds_senha'=>$senha);
                                    
                $resultAcesso = $this->PrincipalModel->adicionaAcesso($infoAcesso);
                
                if($result > 0 && $resultAcesso > 0)
                {
                    $process = 'Adicionar usuário';
                    $processFunction = 'Principal/adicionaUsuario';
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
                
                redirect('principalUsuario/listar');

        //    }
    }


    function editaFauna()
    {
            $this->load->library('form_validation');
            
            $IdUsuario = $this->input->post('co_seq_principal_pessoa');

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
                
                $resultado = $this->PrincipalModel->editaUsuario($infoUsuario, $IdUsuario);
                
                if($resultado == true)
                {
                    $process = 'Usuário atualizado';
                    $processFunction = 'Principal/editaUsuario';
                    $this->logrecord($process,$processFunction);

                    $this->session->set_flashdata('success', 'Usuário atualizado com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na atualização do usuário');
                }
                
                redirect('principalUsuario/listar');
           // }
    }

    function apagaFauna()
    {
            $IdUsuario = $this->uri->segment(2);

            $resultado = $this->PrincipalModel->apagaUsuario($IdUsuario);
            
            if ($resultado) {
                // echo(json_encode(array('status'=>TRUE)));

                 $process = 'Exclusão de usuário';
                 $processFunction = 'Principal/apagaUsuario';
                 $this->logrecord($process,$processFunction);

                 $this->session->set_flashdata('success', 'Usuário deletado com sucesso');

                }
                else 
                { 
                    //echo(json_encode(array('status'=>FALSE))); 
                    $this->session->set_flashdata('error', 'Falha em excluir o usuário');
                }
                redirect('principalUsuario/listar');
    }


    function principalEpiteta()
    {
            $tpTela = $this->uri->segment(2);

            $data['perfis'] = $this->PrincipalModel->carregaPerfisUsuarios();

            if ($tpTela == 'listar') {

                $searchText = $this->security->xss_clean($this->input->post('searchText'));
                $data['searchText'] = $searchText;
                
                $this->load->library('pagination');
                
                $count = 0;

                $returns = $this->paginationCompress ( "principalProjeto/listar", $count, 10 );
                
                $data['registrosProjetos'] = $this->PrincipalModel->listaProjetos($searchText, $returns["page"], $returns["segment"]);
                
                $process = 'Listar projetos';
                $processFunction = 'Principal/principalProjeto';
                $this->logrecord($process,$processFunction);

                $this->global['pageTitle'] = 'SOMA : Lista de Projeto';

                $data['infoPerfil'] = $this->PrincipalModel->carregaInfoPerfil();
               
                $this->loadViews("principal/l_principalProjeto", $this->global, $data, NULL);
            }
            else if ($tpTela == 'cadastrar') {
                $this->global['pageTitle'] = 'SOMA : Cadastro de Projeto';
                
                $data['infoPerfil'] = $this->PrincipalModel->carregaInfoPerfil();

                $this->loadViews("principal/c_principalProjeto", $this->global, $data, NULL); 
            }
            else if ($tpTela == 'editar') {
                $IdUsuario = $this->uri->segment(3);
                if($IdUsuario == null)
                {
                    redirect('principalProjeto/listar');
                }

                $data['infoPerfil'] = $this->PrincipalModel->carregaInfoPerfil();
                $data['infoUsuario'] = $this->PrincipalModel->carregaInfoUsuario($IdUsuario);
                $this->global['pageTitle'] = 'SOMA : Editar projeto';      
                $this->loadViews("principal/c_principalProjeto", $this->global, $data, NULL);
            }
    }

    function adicionaEpiteta() 
    {
         /*   $this->load->library('form_validation');
            
            $this->form_validation->set_rules('Nome_Usuario','Nome','trim|required|max_length[128]');
            $this->form_validation->set_rules('Cpf_Usuario','CPF','trim|required|max_length[128]');
            $this->form_validation->set_rules('Email','Email','trim|required|valid_email|max_length[128]');
            $this->form_validation->set_rules('Senha','Senha','required|max_length[20]');
            $this->form_validation->set_rules('resenha','Confirme a senha','trim|required|matches[password]|max_length[20]');*/

        //VALIDAÇÃO

        //    $this->form_validation->set_rules('perfil','Role','trim|required|numeric');
            
        /*    if($this->form_validation->run() == FALSE)
            {

                redirect('principalUsuario/cadastrar');
            }
            else
        { */

                $nome = $this->input->post('ds_nome');
                $cpf = $this->input->post('nu_cpf');
                $email = $this->security->xss_clean($this->input->post('ds_email'));
                $id_perfil = $this->input->post('id_perfil');
                $senha = $this->input->post('ds_senha');
                $admin = 'N';
            //    $roleId = $this->input->post('role');

                if ($this->PrincipalModel->consultaUsuarioExistente($cpf,$email) == null) {

                $infoUsuario = array('ds_nome'=> $nome, 'ds_email'=>$email, 'st_admin'=>$admin,
                                    'id_perfil'=> $id_perfil, 'nu_cpf'=>$cpf);
                                    
                $result = $this->PrincipalModel->adicionaUsuario($infoUsuario);
                
                $infoAcesso = array('co_principal_pessoa '=> $result, 'ds_senha'=>$senha);
                                    
                $resultAcesso = $this->PrincipalModel->adicionaAcesso($infoAcesso);
                
                if($result > 0 && $resultAcesso > 0)
                {
                    $process = 'Adicionar usuário';
                    $processFunction = 'Principal/adicionaUsuario';
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
                
                redirect('principalUsuario/listar');

        //    }
    }


    function editaEpiteta()
    {
            $this->load->library('form_validation');
            
            $IdUsuario = $this->input->post('co_seq_principal_pessoa');

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
                
                $resultado = $this->PrincipalModel->editaUsuario($infoUsuario, $IdUsuario);
                
                if($resultado == true)
                {
                    $process = 'Usuário atualizado';
                    $processFunction = 'Principal/editaUsuario';
                    $this->logrecord($process,$processFunction);

                    $this->session->set_flashdata('success', 'Usuário atualizado com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na atualização do usuário');
                }
                
                redirect('principalUsuario/listar');
           // }
    }

    function apagaEpiteta()
    {
            $IdUsuario = $this->uri->segment(2);

            $resultado = $this->PrincipalModel->apagaUsuario($IdUsuario);
            
            if ($resultado) {
                // echo(json_encode(array('status'=>TRUE)));

                 $process = 'Exclusão de usuário';
                 $processFunction = 'Principal/apagaUsuario';
                 $this->logrecord($process,$processFunction);

                 $this->session->set_flashdata('success', 'Usuário deletado com sucesso');

                }
                else 
                { 
                    //echo(json_encode(array('status'=>FALSE))); 
                    $this->session->set_flashdata('error', 'Falha em excluir o usuário');
                }
                redirect('principalUsuario/listar');
    }

    function valor($val)
    {
        $val = str_replace(",",".",$val);
        $val = preg_replace('/\.(?=.*\.)/', '', $val);
       // return ($val); 
        return floatval($val);      
    }

}