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
                $cnpj = preg_replace('/[^0-9]/', '', $this->input->post('cnpj'));
                $cpf = preg_replace('/[^0-9]/', '', $this->input->post('cpf'));
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
                
                $count = 0;

                $returns = $this->paginationCompress ( "principalTelas/listar", $count, 50 );
                
                $data['registrosParcelas'] = $this->PrincipalModel->listaParcelas($searchText, $returns["page"], $returns["segment"]);
                
                $process = 'Listar parcelas';
                $processFunction = 'Principal/principalParcelas';
                $this->logrecord($process,$processFunction);

                $this->global['pageTitle'] = 'SOMA : Lista de Parcelas';
                
                $this->loadViews("principal/l_principalParcela", $this->global, $data, NULL);
            }
            else if ($tpTela == 'cadastrar') {
                $this->global['pageTitle'] = 'SOMA : Cadastro de parcela';
                
                $data['infoPropriedades'] = $this->PrincipalModel->carregaInfoPropriedades();

                $this->loadViews("principal/c_principalParcela", $this->global, $data, NULL); 
            }
            else if ($tpTela == 'editar') {
                $IdParcela = $this->uri->segment(3); //CONTINUAR DAQUI
                if($IdParcela == null)
                {
                    redirect('principalParcela/listar');
                }
                $data['infoPropriedades'] = $this->PrincipalModel->carregaInfoPropriedades();
                $data['infoParcela'] = $this->PrincipalModel->carregaInfoParcela($IdParcela);
                $this->global['pageTitle'] = 'SOMA : Editar parcela';      
                $this->loadViews("principal/c_principalParcela", $this->global, $data, NULL);
            }
    }

    function adicionaParcela() 
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

                $id_propriedade = $this->input->post('id_propriedade');
                $nu_ano_emissao = $this->input->post('nu_ano_emissao');
                $estagio_regeneracao = $this->input->post('estagio_regeneracao');
                $grau_epifitismo = $this->input->post('grau_epifitismo');
                $tipo_bioma = $this->input->post('tipo_bioma');
                $tipo_parcela = $this->input->post('tipo_parcela');
                $tamanho_parcela = $this->input->post('tamanho_parcela');
                $carbono_vegetacao = $this->input->post('carbono_vegetacao');
                $biomassa_vegetacao_total = $this->input->post('biomassa_vegetacao_total');
                $biomassa_arbustiva = $this->input->post('biomassa_arbustiva');
                $biomassa_hectare = $this->input->post('biomassa_hectare');
                $carbono_total = $this->input->post('carbono_total');
                
                $infoParcela = array('id_acesso'=> $this->session->userdata('userId'), 'id_propriedade'=> $id_propriedade,
                'nu_ano_emissao'=>$nu_ano_emissao,'estagio_regeneracao'=>$estagio_regeneracao, 'grau_epifitismo'=>$grau_epifitismo,
                'tipo_bioma'=>$tipo_bioma,'tipo_parcela'=>$tipo_parcela,'tamanho_parcela'=>$tamanho_parcela, 'carbono_vegetacao'=>$carbono_vegetacao,
                'biomassa_vegetacao_total'=>$biomassa_vegetacao_total,'biomassa_arbustiva'=>$biomassa_arbustiva, 'biomassa_hectare'=>$biomassa_hectare,
                'carbono_total'=>$carbono_total);
                                    
                $resultado = $this->PrincipalModel->adicionaParcela($infoParcela);
                
                if($resultado > 0)
                {
                    $process = 'Adicionar parcela';
                    $processFunction = 'Principal/adicionaParcela';
                    $this->logrecord($process,$processFunction);

                    $this->session->set_flashdata('success', 'Parcela criada com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na criação da parcela');
                }
                
                redirect('principalParcela/listar');

        //    }
    }

    function editaParcela()
    {    
            $IdParcela = $this->input->post('id');

            $id_propriedade = $this->input->post('id_propriedade');
            $nu_ano_emissao = $this->input->post('nu_ano_emissao');
            $estagio_regeneracao = $this->input->post('estagio_regeneracao');
            $grau_epifitismo = $this->input->post('grau_epifitismo');
            $tipo_parcela = $this->input->post('tipo_parcela');
            $tipo_bioma = $this->input->post('tipo_bioma');
            $tamanho_parcela = $this->input->post('tamanho_parcela');
            $carbono_vegetacao = $this->input->post('carbono_vegetacao');
            $biomassa_vegetacao_total = $this->input->post('biomassa_vegetacao_total');
            $biomassa_arbustiva = $this->input->post('biomassa_arbustiva');
            $biomassa_hectare = $this->input->post('biomassa_hectare');
            $carbono_total = $this->input->post('carbono_total');
            
            $infoParcela = array('id_acesso'=> $this->session->userdata('userId'), 'id_propriedade'=> $id_propriedade,
            'nu_ano_emissao'=>$nu_ano_emissao,'estagio_regeneracao'=>$estagio_regeneracao, 'grau_epifitismo'=>$grau_epifitismo,
            'tipo_bioma'=>$tipo_bioma,'tipo_parcela'=>$tipo_parcela,'tamanho_parcela'=>$tamanho_parcela, 'carbono_vegetacao'=>$carbono_vegetacao,
            'biomassa_vegetacao_total'=>$biomassa_vegetacao_total,'biomassa_arbustiva'=>$biomassa_arbustiva, 'biomassa_hectare'=>$biomassa_hectare,
            'carbono_total'=>$carbono_total);
                
            
            
            $resultado = $this->PrincipalModel->editaParcela($infoParcela, $IdParcela);
            
            if($resultado == true)
            {
                $process = 'Parcela atualizada';
                $processFunction = 'Principal/editaParcela';
                $this->logrecord($process,$processFunction);

                $this->session->set_flashdata('success', 'Parcela atualizada com sucesso');
            }
            else
            {
                $this->session->set_flashdata('error', 'Falha na atualização da parcela');
            }
            
            redirect('principalParcela/listar');
        // }
    }

    function apagaParcela()
    {
            $IdParcela = $this->uri->segment(2);
   
            $resultado = $this->PrincipalModel->apagaParcela($IdParcela);
            
            if ($resultado) {
                // echo(json_encode(array('status'=>TRUE)));

                 $process = 'Exclusão da parcela';
                 $processFunction = 'Principal/apagaParcela';
                 $this->logrecord($process,$processFunction);

                 $this->session->set_flashdata('success', 'Parcela deletado com sucesso');

                }
                else 
                { 
                    //echo(json_encode(array('status'=>FALSE))); 
                    $this->session->set_flashdata('error', 'Falha em excluir a parcela');
                }
                redirect('principalParcela/listar');
    }
// FIM DAS FUNÇÕES DA TELA DE TELAS

// INICIO DAS FUNÇÕES DA TELA DE ARVORE VIVA

function principalArvoreViva()
    {
            $tpTela = $this->uri->segment(2);

            $data['perfis'] = $this->PrincipalModel->carregaPerfisUsuarios();

            if ($tpTela == 'listar') {

                $searchText = $this->security->xss_clean($this->input->post('searchText'));
                $data['searchText'] = $searchText;
                
                $this->load->library('pagination');
                
                $count = 0;

                $returns = $this->paginationCompress ( "principalArvoreViva/listar", $count, 10 );
                
                $data['registrosArvoreViva'] = $this->PrincipalModel->listaArvoresVivas($searchText, $returns["page"], $returns["segment"]);
                
                $process = 'Listar árvores vivas';
                $processFunction = 'Principal/principalArvoreViva';
                $this->logrecord($process,$processFunction);

                $this->global['pageTitle'] = 'SOMA : Lista de Árvores Vivas';

                $data['infoPerfil'] = $this->PrincipalModel->carregaInfoPerfil();
               
                $this->loadViews("principal/l_principalArvoreViva", $this->global, $data, NULL);
            }
            else if ($tpTela == 'cadastrar') {
                $this->global['pageTitle'] = 'SOMA : Cadastro de Árvores Vivas';

                $data['infoFamilias'] = $this->PrincipalModel->carregaInfoFamilias();
                $data['infoParcelas'] = $this->PrincipalModel->carregaInfoParcelas();
 
                $this->loadViews("principal/c_principalArvoreViva", $this->global, $data, NULL); 
            }
            else if ($tpTela == 'editar') {
                $IdArvoreViva = $this->uri->segment(3);
                if($IdArvoreViva == null)
                {
                    redirect('principalArvoreViva/listar');
                }

                $data['infoParcelas'] = $this->PrincipalModel->carregaInfoParcelas();
                $data['infoArvoreViva'] = $this->PrincipalModel->carregaInfoArvoreViva($IdArvoreViva);                      

                $this->global['pageTitle'] = 'SOMA : Editar Árvore Viva';      
                $this->loadViews("principal/c_principalArvoreViva", $this->global, $data, NULL);
            }
    }

    function adicionaArvoreViva() 
    {
                $id_parcela  = $this->input->post('id_parcela');
                $latitude = $this->input->post('latitude');
                $longitude = preg_replace('/-+/', '', $this->input->post('longitude'));
                $id_familia = $this->input->post('id_familia');
                $id_genero = $this->input->post('id_genero');
                $id_especie = $this->input->post('id_especie');
                $nu_biomassa = $this->input->post('nu_biomassa');
                $nova = $this->input->post('nova');
                $grau_protecao = $this->input->post('grau_protecao');
                $nu_circunferencia = $this->input->post('nu_circunferencia');
                $nu_altura = $this->input->post('nu_altura');
                $nu_altura_total = $this->input->post('nu_altura_total');
                $nu_altura_fuste = $this->input->post('nu_altura_fuste');
                $nu_altura_copa = $this->input->post('nu_altura_copa');
                $isolada = $this->input->post('isolada');
                $floracao_frutificacao = $this->input->post('floracao_frutificacao');

                $infoArvoreViva = array('id_parcela'=> $id_parcela, 'id_acesso'=>$this->session->userdata('userId'), 'latitude'=>$latitude, 
                                    'longitude'=>$longitude,'nu_biomassa'=> $nu_biomassa, 'nova'=>$nova, 
                                    'grau_protecao'=>$grau_protecao, 'nu_circunferencia'=>$nu_circunferencia, 'nu_altura'=>$nu_altura,
                                    'nu_altura_total'=>$nu_altura_total, 'nu_altura_fuste'=>$nu_altura_fuste, 'nu_altura_copa'=>$nu_altura_copa,
                                    'isolada'=>$isolada, 'floracao_frutificacao'=>$floracao_frutificacao);
                                    
                $result = $this->PrincipalModel->adicionaArvoreViva($infoArvoreViva);
                
                $infoRlFloraFamiliaGeneroEspecie = array('id_arvores_vivas'=> $result, 'id_familia'=>$id_familia,
                                                         'id_genero '=> $id_genero, 'id_especie'=>$id_especie);
                                    
                $resultRl = $this->PrincipalModel->adicionaRlFloraFamiliaGeneroEspecie($infoRlFloraFamiliaGeneroEspecie);
                
                if($result > 0 && $resultRl > 0)
                {
                    $process = 'Adicionar árvore viva';
                    $processFunction = 'Principal/adicionaArvoreViva';
                    $this->logrecord($process,$processFunction);

                    $this->session->set_flashdata('success', 'Árvore viva criada com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na criação de árvore viva');
                }          
                
                redirect('principalArvoreViva/listar');

    }


    function editaArvoreViva()
    {
                $IdArvoreViva = $this->input->post('id');

                $id_parcela  = $this->input->post('id_parcela');
                $latitude = $this->input->post('latitude');
                $longitude = preg_replace('/-+/', '', $this->input->post('longitude'));
                $id_familia = $this->input->post('id_familia');
                $id_genero = $this->input->post('id_genero');
                $id_especie = $this->input->post('id_especie');
                $nu_biomassa = $this->input->post('nu_biomassa');
                $nova = $this->input->post('nova');
                $grau_protecao = $this->input->post('grau_protecao');
                $nu_circunferencia = $this->input->post('nu_circunferencia');
                $nu_altura = $this->input->post('nu_altura');
                $nu_altura_total = $this->input->post('nu_altura_total');
                $nu_altura_fuste = $this->input->post('nu_altura_fuste');
                $nu_altura_copa = $this->input->post('nu_altura_copa');
                $isolada = $this->input->post('isolada');
                $floracao_frutificacao = $this->input->post('floracao_frutificacao');

                $infoArvoreViva = array('id_parcela'=> $id_parcela, 'id_acesso'=>$this->session->userdata('userId'), 'latitude'=>$latitude, 
                                    'longitude'=>$longitude,'nu_biomassa'=> $nu_biomassa, 'nova'=>$nova, 
                                    'grau_protecao'=>$grau_protecao, 'nu_circunferencia'=>$nu_circunferencia, 'nu_altura'=>$nu_altura,
                                    'nu_altura_total'=>$nu_altura_total, 'nu_altura_fuste'=>$nu_altura_fuste, 'nu_altura_copa'=>$nu_altura_copa,
                                    'isolada'=>$isolada, 'floracao_frutificacao'=>$floracao_frutificacao);
                                    
                $result = $this->PrincipalModel->editaArvoreViva($infoArvoreViva, $IdArvoreViva);
                
                $infoRlFloraFamiliaGeneroEspecie = array('id_familia'=>$id_familia, 'id_genero '=> $id_genero, 
                                                         'id_especie'=>$id_especie);
                                    
                $resultRl = $this->PrincipalModel->editaRlFloraFamiliaGeneroEspecie($infoRlFloraFamiliaGeneroEspecie, $IdArvoreViva);
                
                if($result && $resultRl)
                {
                    $process = 'Árvore viva atualizada';
                    $processFunction = 'Principal/editaArvoreViva';
                    $this->logrecord($process,$processFunction);

                    $this->session->set_flashdata('success', 'Árvore viva atualizada com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na atualização de árvore viva');
                }
                
                redirect('principalArvoreViva/listar');
           // }
    }

    function apagaArvoreViva()
    {
            $IdArvoreViva = $this->uri->segment(2);

            $resultado = $this->PrincipalModel->apagaArvoreViva($IdArvoreViva);
            
            if ($resultado) {
                // echo(json_encode(array('status'=>TRUE)));

                 $process = 'Exclusão de árvore viva';
                 $processFunction = 'Principal/apagaArvoreViva';
                 $this->logrecord($process,$processFunction);

                 $this->session->set_flashdata('success', 'Árvore viva deletada com sucesso');

                }
                else 
                { 
                    //echo(json_encode(array('status'=>FALSE))); 
                    $this->session->set_flashdata('error', 'Falha em excluir árvore viva');
                }
                redirect('principalArvoreViva/listar');
    }
// FIM DAS FUNÇÕES DA TELA DE ARVORE VIVA

function principalAnimal()
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

    function adicionaAnimal() 
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


    function editaAnimal()
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

    function apagaAnimal()
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


    function principalEpifita()
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


    function editaEpifita()
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

    function apagaEpifita()
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

    function consultaGenero()
    {
           
            $idFamilia = $this->uri->segment(2);
                       
            $resultado = $this->PrincipalModel->consultaGenero($idFamilia);
            
            echo json_encode($resultado);
    }

    function valor($val)
    {
        $val = str_replace(",",".",$val);
        $val = preg_replace('/\.(?=.*\.)/', '', $val);
       // return ($val); 
        return floatval($val);      
    }

}