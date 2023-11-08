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
                $data['infoRespTecnico'] = $this->PrincipalModel->carregaInfoRespTecnico();
                $data['nextIdProjeto'] = $this->PrincipalModel->carregaNextIdProjeto();

                $this->loadViews("principal/c_principalProjeto", $this->global, $data, NULL); 
            }
            else if ($tpTela == 'editar') {
                $IdProjeto = $this->uri->segment(3);
                if($IdProjeto == null)
                {
                    redirect('principalProjeto/listar');
                }

                $data['infoPerfil'] = $this->PrincipalModel->carregaInfoPerfil();
                $data['infoRespTecnico'] = $this->PrincipalModel->carregaInfoRespTecnico();
                $data['infoProjeto'] = $this->PrincipalModel->carregaInfoProjetoExistente($IdProjeto);
                
                $this->global['pageTitle'] = 'SOMA : Editar projeto';      
                $this->loadViews("principal/c_principalProjeto", $this->global, $data, NULL);
            }
    }

    function adicionaProjeto() 
    {
                $nome = $this->input->post('nome');
                $perimetro = $this->input->post('perimetro');
                $dt_inicio = $this->input->post('dt_inicio');
                $dt_final = $this->input->post('dt_final');
                $id_resp_tecnico = $this->input->post('id_resp_tecnico');
                $nu_art = $this->input->post('nu_art');
            //    $roleId = $this->input->post('role');

                $infoProjeto = array('nome'=> $nome, 'id_acesso'=> $this->session->userdata('userId'), 
                'perimetro'=>$perimetro, 'dt_inicio'=>$dt_inicio, 'dt_final'=> $dt_final, 'id_resp_tecnico'=> $id_resp_tecnico, 
                'nu_art'=> $nu_art, 'st_registro_ativo'=>'S');
                
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
                
                $IdProjeto = $this->input->post('id');

                $nome = $this->input->post('nome');
                $perimetro = $this->input->post('perimetro');
                $dt_inicio = $this->input->post('dt_inicio');
                $dt_final = $this->input->post('dt_final');
                $id_resp_tecnico = $this->input->post('id_resp_tecnico');
                $nu_art = $this->input->post('nu_art');
                        
                $infoProjeto = array('nome'=> $nome, 'id_acesso'=> $this->session->userdata('userId'), 
                'perimetro'=>$perimetro, 'dt_inicio'=>$dt_inicio, 'dt_final'=> $dt_final, 'id_resp_tecnico'=> $id_resp_tecnico, 
                'nu_art'=> $nu_art, 'st_registro_ativo'=>'S');
                
                $resultado = $this->PrincipalModel->editaProjeto($infoProjeto, $IdProjeto);   
                
                if($resultado == true)
                {
                    $process = 'Projeto atualizado';
                    $processFunction = 'Principal/editaProjeto';
                    $this->logrecord($process,$processFunction);

                    $this->session->set_flashdata('success', 'Projeto atualizado com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na atualização do projeto');
                }
                    
                    redirect('principalProjeto/listar');
    }

    function apagaProjeto()
    {
            $IdProjeto = $this->uri->segment(2);

            $resultado = $this->PrincipalModel->apagaProjeto($IdProjeto);
            
            if ($resultado) {
                 $process = 'Exclusão de projeto';
                 $processFunction = 'Principal/apagaProjeto';
                 $this->logrecord($process,$processFunction);

                 $this->session->set_flashdata('success', 'Projeto deletado com sucesso');

                }
                else 
                { 
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

                $data['nextIdPropriedade'] = $this->PrincipalModel->carregaNextIdPropriedade();

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

                $id_projeto = $this->input->post('id_projeto');
                $nu_ano_emissao = $this->input->post('nu_ano_emissao');
                $nu_inscricao_car = str_replace(array('-','.'), '', $this->input->post('nu_inscricao_car'));
                $nu_ccir = $this->input->post('nu_ccir');
                $proprietario = $this->input->post('proprietario');
                $no_propriedade = $this->input->post('no_propriedade');
                $cnpj = preg_replace('/[^0-9]/', '', $this->input->post('cnpj'));
                $cpf = preg_replace('/[^0-9]/', '', $this->input->post('cpf'));
                $liberado_campo = $this->input->post('liberado_campo');
                
                $infoPropriedade = array('id_acesso'=> $this->session->userdata('userId'), 'id_projeto'=> $id_projeto,
                'nu_ano_emissao'=>$nu_ano_emissao,'nu_inscricao_car'=>$nu_inscricao_car, 'nu_ccir'=>$nu_ccir,
                'proprietario'=>$proprietario,'no_propriedade'=>$no_propriedade, 'cnpj'=>$cnpj,
                'cpf'=>$cpf,'liberado_campo'=>$liberado_campo, 'st_registro_ativo'=>'S');

                /*if(!empty($_FILES['arquivo']['name'])){
                    $config['upload_path'] = 'uploads/images/';
                    $config['allowed_types'] = 'jpg|jpeg|png|gif';
                    $config['file_name'] = $_FILES['picture']['name'];
                    
                    //Load upload library and initialize configuration
                    $this->load->library('upload',$config);
                    $this->upload->initialize($config);
                    
                    if($this->upload->do_upload('picture')){
                        $uploadData = $this->upload->data();
                        $picture = $uploadData['file_name'];
                    }else{
                        $arquivo = '';
                    }
                }else{
                    $arquivo = '';
                }*/
                                    
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

                $id_projeto = $this->input->post('id_projeto');
                $nu_ano_emissao = $this->input->post('nu_ano_emissao');
                $nu_inscricao_car = str_replace(array('-','.'), '', $this->input->post('nu_inscricao_car'));
                $nu_ccir = $this->input->post('nu_ccir');
                $proprietario = $this->input->post('proprietario');
                $no_propriedade = $this->input->post('no_propriedade');
                $cnpj = preg_replace('/[^0-9]/', '', $this->input->post('cnpj'));
                $cpf = preg_replace('/[^0-9]/', '', $this->input->post('cpf'));
                $liberado_campo = $this->input->post('liberado_campo');
                
                $infoPropriedade = array('id_acesso'=> $this->session->userdata('userId'), 'id_projeto'=> $id_projeto,
                'nu_ano_emissao'=>$nu_ano_emissao,'nu_inscricao_car'=>$nu_inscricao_car, 'nu_ccir'=>$nu_ccir,
                'proprietario'=>$proprietario,'no_propriedade'=>$no_propriedade, 'cnpj'=>$cnpj,
                'cpf'=>$cpf,'liberado_campo'=>$liberado_campo, 'st_registro_ativo'=>'S');
                
                
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
                //$data['infoEstagiosRegeneracao'] = $this->PrincipalModel->carregaInfoEstagiosRegeneracao();
                //$data['infoGrausEpifitismo'] = $this->PrincipalModel->carregaInfoGrausEpifitismo();
                $data['infoTiposBioma'] = $this->PrincipalModel->carregaInfoTiposBioma();
                $data['infoTiposParcela'] = $this->PrincipalModel->carregaInfoTiposParcela();

                $data['nextIdParcela'] = $this->PrincipalModel->carregaNextIdParcela();

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
                //$data['infoEstagiosRegeneracao'] = $this->PrincipalModel->carregaInfoEstagiosRegeneracao();
               // $data['infoGrausEpifitismo'] = $this->PrincipalModel->carregaInfoGrausEpifitismo();
                $data['infoTiposBioma'] = $this->PrincipalModel->carregaInfoTiposBioma();
                $data['infoTiposParcela'] = $this->PrincipalModel->carregaInfoTiposParcela();

                $this->global['pageTitle'] = 'SOMA : Editar parcela';      
                $this->loadViews("principal/c_principalParcela", $this->global, $data, NULL);
            }
    }

    function adicionaParcela() 
    {

                $id_propriedade = $this->input->post('id_propriedade');
                $nu_parcela = $this->PrincipalModel->carregaNextNuParcela($id_propriedade)[0]->next_nu_parcela;
                $nu_ano_emissao = $this->input->post('nu_ano_emissao');
                $id_estagio_regeneracao = $this->input->post('id_estagio_regeneracao');
                $id_grau_epifitismo = $this->input->post('id_grau_epifitismo');
                $id_tipo_bioma = $this->input->post('id_tipo_bioma');
                $id_tipo_parcela = $this->input->post('id_tipo_parcela');
                $tamanho_parcela = $this->input->post('tamanho_parcela');
                $carbono_vegetacao = $this->input->post('carbono_vegetacao');
                $biomassa_vegetacao_total = $this->input->post('biomassa_vegetacao_total');
                $biomassa_arbustiva = $this->input->post('biomassa_arbustiva');
                $biomassa_hectare = $this->input->post('biomassa_hectare');
                $carbono_total = $this->input->post('carbono_total');
				
				$latitude = preg_replace('/-+/', '', $this->input->post('latitude'));
				$longitude = preg_replace('/-+/', '', $this->input->post('longitude'));
				
				$latitude_gd = ($this->DMStoDD(strtok($latitude, '°'),$this->get_string_between($latitude, '°', '\''),$this->get_string_between($latitude, '\'', '.')));
				$longitude_gd = ($this->DMStoDD(strtok($longitude, '°'),$this->get_string_between($longitude, '°', '\''),$this->get_string_between($longitude, '\'', '.')));

                
                $infoParcela = array('id_acesso'=> $this->session->userdata('userId'), 'id_propriedade'=> $id_propriedade,
                'nu_ano_emissao'=>$nu_ano_emissao,'id_estagio_regeneracao'=>$id_estagio_regeneracao, 'id_grau_epifitismo'=>$id_grau_epifitismo,
                'id_tipo_bioma'=>$id_tipo_bioma,'id_tipo_parcela'=>$id_tipo_parcela,'tamanho_parcela'=>$tamanho_parcela, 'carbono_vegetacao'=>$carbono_vegetacao,
                'biomassa_vegetacao_total'=>$biomassa_vegetacao_total,'biomassa_arbustiva'=>$biomassa_arbustiva, 'biomassa_hectare'=>$biomassa_hectare,
                'carbono_total'=>$carbono_total, 'latitude_gms'=>$latitude, 'longitude_gms'=>$longitude, 'latitude_gd'=>$latitude_gd,'longitude_gd'=>$longitude_gd, 'st_registro_ativo'=>'S');
                                    
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
            $id_estagio_regeneracao = $this->input->post('id_estagio_regeneracao');
            $id_grau_epifitismo = $this->input->post('id_grau_epifitismo');
            $id_tipo_parcela = $this->input->post('id_tipo_parcela');
            $id_tipo_bioma = $this->input->post('id_tipo_bioma');
            $tamanho_parcela = $this->input->post('tamanho_parcela');
            $carbono_vegetacao = $this->input->post('carbono_vegetacao');
            $biomassa_vegetacao_total = $this->input->post('biomassa_vegetacao_total');
            $biomassa_arbustiva = $this->input->post('biomassa_arbustiva');
            $biomassa_hectare = $this->input->post('biomassa_hectare');
            $carbono_total = $this->input->post('carbono_total');
  
			$latitude = preg_replace('/-+/', '', $this->input->post('latitude'));
			$longitude = preg_replace('/-+/', '', $this->input->post('longitude'));


			$latitude_gd = ($this->DMStoDD(strtok($latitude, '°'),$this->get_string_between($latitude, '°', '\''),$this->get_string_between($latitude, '\'', '.')));
			$longitude_gd = ($this->DMStoDD(strtok($longitude, '°'),$this->get_string_between($longitude, '°', '\''),$this->get_string_between($longitude, '\'', '.')));




  
            $infoParcela = array('id_acesso'=> $this->session->userdata('userId'), 'id_propriedade'=> $id_propriedade,
            'nu_ano_emissao'=>$nu_ano_emissao,'id_estagio_regeneracao'=>$id_estagio_regeneracao, 'id_grau_epifitismo'=>$id_grau_epifitismo,
            'id_tipo_bioma'=>$id_tipo_bioma,'id_tipo_parcela'=>$id_tipo_parcela,'tamanho_parcela'=>$tamanho_parcela, 'carbono_vegetacao'=>$carbono_vegetacao,
            'biomassa_vegetacao_total'=>$biomassa_vegetacao_total,'biomassa_arbustiva'=>$biomassa_arbustiva, 'biomassa_hectare'=>$biomassa_hectare,
            'carbono_total'=>$carbono_total, 'latitude_gms'=>$latitude, 'longitude_gms'=>$longitude, 'latitude_gd'=>$latitude_gd, 'longitude_gd'=>$longitude_gd, 'st_registro_ativo'=>'S');
                
            
            
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
                $data['infoGrausProtecao'] = $this->PrincipalModel->carregaInfoGrausProtecao();
                $data['infoEstagiosRegeneracao'] = $this->PrincipalModel->carregaInfoEstagiosRegeneracao();
                $data['infoGrausEpifitismo'] = $this->PrincipalModel->carregaInfoGrausEpifitismo();

                $data['nextIdArvoreViva'] = $this->PrincipalModel->carregaNextIdArvoreViva();
 
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
                $data['infoFamilias'] = $this->PrincipalModel->carregaInfoFamilias();
                $data['infoGeneros'] = $this->PrincipalModel->carregaInfoGeneros();
                $data['infoEspecies'] = $this->PrincipalModel->carregaInfoEspecies();
                $data['infoGrausProtecao'] = $this->PrincipalModel->carregaInfoGrausProtecao();
                $data['infoEstagiosRegeneracao'] = $this->PrincipalModel->carregaInfoEstagiosRegeneracao();
                $data['infoGrausEpifitismo'] = $this->PrincipalModel->carregaInfoGrausEpifitismo();

                $this->global['pageTitle'] = 'SOMA : Editar Árvore Viva';      
                $this->loadViews("principal/c_principalArvoreViva", $this->global, $data, NULL);
            }
    }

    function adicionaArvoreViva() 
    {
                $id_parcela  = $this->input->post('id_parcela');
                $latitude = preg_replace('/-+/', '', $this->input->post('latitude'));
                $longitude = preg_replace('/-+/', '', $this->input->post('longitude'));
                $id_familia = $this->input->post('id_familia');
                $id_genero = $this->input->post('id_genero');
                $id_especie = $this->input->post('id_especie');
                $nu_biomassa = $this->input->post('nu_biomassa');
                $identificacao = $this->input->post('identificacao');
                $id_grau_protecao = $this->input->post('id_grau_protecao');
                $nu_circunferencia = $this->input->post('nu_circunferencia');
                $nu_altura = $this->input->post('nu_altura');
                $nu_altura_total = $this->input->post('nu_altura_total');
                $nu_altura_fuste = $this->input->post('nu_altura_fuste');
                $nu_altura_copa = $this->input->post('nu_altura_copa');
                $isolada = $this->input->post('isolada');
                $floracao_frutificacao = $this->input->post('floracao_frutificacao');
                $descricao = $this->input->post('descricao');

                $latitude_gd = ($this->DMStoDD(strtok($latitude, '°'),$this->get_string_between($latitude, '°', '\''),$this->get_string_between($latitude, '\'', '.')));
                $longitude_gd = ($this->DMStoDD(strtok($longitude, '°'),$this->get_string_between($longitude, '°', '\''),$this->get_string_between($longitude, '\'', '.')));

                $infoArvoreViva = array('id_parcela'=> $id_parcela, 'id_acesso'=>$this->session->userdata('userId'), 'latitude_gms'=>$latitude, 
                                    'longitude_gms'=>$longitude,'nu_biomassa'=> $nu_biomassa, 'identificacao'=>$identificacao, 
                                    'id_grau_protecao'=>$id_grau_protecao, 'nu_circunferencia'=>$nu_circunferencia, 'nu_altura'=>$nu_altura,
                                    'nu_altura_total'=>$nu_altura_total, 'nu_altura_fuste'=>$nu_altura_fuste, 'nu_altura_copa'=>$nu_altura_copa,
                                    'isolada'=>$isolada, 'floracao_frutificacao'=>$floracao_frutificacao, 'descricao'=>$descricao, 
                                    'latitude_gd'=>$latitude_gd, 'longitude_gd'=>$longitude_gd, 'st_registro_ativo'=>'S');
                                    
                $result = $this->PrincipalModel->adicionaArvoreViva($infoArvoreViva);
                
                $infoRlFloraFamiliaGeneroEspecie = array('id_arvores_vivas'=> $result, 'id_familia'=>$id_familia,
                                                         'id_genero '=> $id_genero, 'id_especie'=>$id_especie, 'st_registro_ativo'=>'S');
                                    
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
                $latitude = preg_replace('/-+/', '', $this->input->post('latitude'));
                $longitude = preg_replace('/-+/', '', $this->input->post('longitude'));
                $id_familia = $this->input->post('id_familia');
                $id_genero = $this->input->post('id_genero');
                $id_especie = $this->input->post('id_especie');
                $nu_biomassa = $this->input->post('nu_biomassa');
                $identificacao = $this->input->post('identificacao');
                $id_grau_protecao = $this->input->post('id_grau_protecao');
                $nu_circunferencia = $this->input->post('nu_circunferencia');
                $nu_altura = $this->input->post('nu_altura');
                $nu_altura_total = $this->input->post('nu_altura_total');
                $nu_altura_fuste = $this->input->post('nu_altura_fuste');
                $nu_altura_copa = $this->input->post('nu_altura_copa');
                $isolada = $this->input->post('isolada');
                $floracao_frutificacao = $this->input->post('floracao_frutificacao');
                $descricao = $this->input->post('descricao');

                $latitude_gd = ($this->DMStoDD(strtok($latitude, '°'),$this->get_string_between($latitude, '°', '\''),$this->get_string_between($latitude, '\'', '.')));
                $longitude_gd = ($this->DMStoDD(strtok($longitude, '°'),$this->get_string_between($longitude, '°', '\''),$this->get_string_between($longitude, '\'', '.')));

                $infoArvoreViva = array('id_parcela'=> $id_parcela, 'id_acesso'=>$this->session->userdata('userId'), 'latitude_gms'=>$latitude, 
                                    'longitude_gms'=>$longitude,'nu_biomassa'=> $nu_biomassa, 'identificacao'=>$identificacao, 
                                    'id_grau_protecao'=>$id_grau_protecao, 'nu_circunferencia'=>$nu_circunferencia, 'nu_altura'=>$nu_altura,
                                    'nu_altura_total'=>$nu_altura_total, 'nu_altura_fuste'=>$nu_altura_fuste, 'nu_altura_copa'=>$nu_altura_copa,
                                    'isolada'=>$isolada, 'floracao_frutificacao'=>$floracao_frutificacao, 'descricao'=>$descricao, 
                                    'latitude_gd'=>$latitude_gd, 'longitude_gd'=>$longitude_gd, 'st_registro_ativo'=>'S');
                                    
                $result = $this->PrincipalModel->editaArvoreViva($infoArvoreViva, $IdArvoreViva);
                
                $infoRlFloraFamiliaGeneroEspecie = array('id_familia'=>$id_familia, 'id_genero '=> $id_genero, 
                                                         'id_especie'=>$id_especie, 'st_registro_ativo'=>'S');
                                    
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

                $returns = $this->paginationCompress ( "principalAnimal/listar", $count, 10 );
                
                $data['registrosAnimal'] = $this->PrincipalModel->listaAnimais($searchText, $returns["page"], $returns["segment"]);
                
                $process = 'Listar animais';
                $processFunction = 'Principal/principalAnimal';
                $this->logrecord($process,$processFunction);

                $this->global['pageTitle'] = 'SOMA : Lista de Animal';

                $data['infoPerfil'] = $this->PrincipalModel->carregaInfoPerfil();
               
                $this->loadViews("principal/l_principalAnimal", $this->global, $data, NULL); //CONTINUAR DAQUI
            }
            else if ($tpTela == 'cadastrar') {
                $this->global['pageTitle'] = 'SOMA : Cadastro de Animal';

                $data['infoFamiliasFauna'] = $this->PrincipalModel->carregaInfoFamiliasFauna();
                $data['infoParcelas'] = $this->PrincipalModel->carregaInfoParcelas();
                $data['infoTiposObservacao'] = $this->PrincipalModel->carregaInfoTiposObservacao();
                $data['infoGrausProtecao'] = $this->PrincipalModel->carregaInfoGrausProtecao();
                $data['infoFaunaClassificacoes'] = $this->PrincipalModel->carregaInfoFaunaClassificacoes();
                
                $data['infoPerfil'] = $this->PrincipalModel->carregaInfoPerfil();

                $data['nextIdAnimal'] = $this->PrincipalModel->carregaNextIdAnimal();

                $this->loadViews("principal/c_principalAnimal", $this->global, $data, NULL); 
            }
            else if ($tpTela == 'editar') {
                $IdAnimal = $this->uri->segment(3);
                if($IdAnimal == null)
                {
                    redirect('principalAnimal/listar');
                }

                $data['infoParcelas'] = $this->PrincipalModel->carregaInfoParcelas();
                $data['infoAnimal'] = $this->PrincipalModel->carregaInfoAnimal($IdAnimal);
                $data['infoFamiliasFauna'] = $this->PrincipalModel->carregaInfoFamiliasFauna();
                $data['infoGenerosFauna'] = $this->PrincipalModel->carregaInfoGenerosFauna();
                $data['infoEspeciesFauna'] = $this->PrincipalModel->carregaInfoEspeciesFauna();
                $data['infoTiposObservacao'] = $this->PrincipalModel->carregaInfoTiposObservacao();
                $data['infoGrausProtecao'] = $this->PrincipalModel->carregaInfoGrausProtecao();
                $data['infoFaunaClassificacoes'] = $this->PrincipalModel->carregaInfoFaunaClassificacoes();

                $this->global['pageTitle'] = 'SOMA : Editar Animal';      
                $this->loadViews("principal/c_principalAnimal", $this->global, $data, NULL);
            }
    }

    function adicionaAnimal() 
    {
            $id_parcela  = $this->input->post('id_parcela');
            $id_familia  = $this->input->post('id_familia');
            $id_genero  = $this->input->post('id_genero');
            $id_especie  = $this->input->post('id_especie');
            $id_tipo_observacao  = $this->input->post('id_tipo_observacao');
            $id_classificacao  = $this->input->post('id_classificacao');
            $id_grau_protecao = $this->input->post('id_grau_protecao');
            $latitude = preg_replace('/-+/', '', $this->input->post('latitude'));
            $longitude = preg_replace('/-+/', '', $this->input->post('longitude'));

            $latitude_gd = ($this->DMStoDD(strtok($latitude, '°'),$this->get_string_between($latitude, '°', '\''),$this->get_string_between($latitude, '\'', '.')));
            $longitude_gd = ($this->DMStoDD(strtok($longitude, '°'),$this->get_string_between($longitude, '°', '\''),$this->get_string_between($longitude, '\'', '.')));
            
            $descricao  = $this->input->post('descricao');
            
            $infoAnimal = array('id_parcela'=> $id_parcela, 'id_acesso'=>$this->session->userdata('userId'), 'latitude_gms'=>$latitude, 
                                'longitude_gms'=>$longitude,'id_tipo_observacao'=> $id_tipo_observacao,
                                'id_classificacao'=>$id_classificacao, 'id_grau_protecao'=>$id_grau_protecao, 'descricao'=>$descricao,
                                'latitude_gd'=>$latitude_gd, 'longitude_gd'=>$longitude_gd, 'st_registro_ativo'=>'S');
                                
            $result = $this->PrincipalModel->adicionaAnimal($infoAnimal);
            
            $infoRlFaunaFamiliaGeneroEspecie = array('id_animais'=> $result, 'id_familia'=>$id_familia,
                                                    'id_genero '=> $id_genero, 'id_especie'=>$id_especie, 
                                                    'st_registro_ativo'=>'S');
                                
            $resultRl = $this->PrincipalModel->adicionaRlFaunaFamiliaGeneroEspecie($infoRlFaunaFamiliaGeneroEspecie);
            
            if($result > 0 && $resultRl > 0)
            {
                $process = 'Adicionar animal';
                $processFunction = 'Principal/adicionaAnimal';
                $this->logrecord($process,$processFunction);

                $this->session->set_flashdata('success', 'Animal criado com sucesso');
            }
            else
            {
                $this->session->set_flashdata('error', 'Falha na criação de animal');
            }          
            
            redirect('principalAnimal/listar');
    }


    function editaAnimal()
    {
            $IdAnimal = $this->input->post('id');

            $id_parcela  = $this->input->post('id_parcela');
            $id_familia  = $this->input->post('id_familia');
            $id_genero  = $this->input->post('id_genero');
            $id_especie  = $this->input->post('id_especie');
            $id_tipo_observacao  = $this->input->post('id_tipo_observacao');
            $id_classificacao  = $this->input->post('id_classificacao');
            $id_grau_protecao = $this->input->post('id_grau_protecao');
            $latitude = preg_replace('/-+/', '', $this->input->post('latitude'));
            $longitude = preg_replace('/-+/', '', $this->input->post('longitude'));

            $latitude_gd = ($this->DMStoDD(strtok($latitude, '°'),$this->get_string_between($latitude, '°', '\''),$this->get_string_between($latitude, '\'', '.')));
            $longitude_gd = ($this->DMStoDD(strtok($longitude, '°'),$this->get_string_between($longitude, '°', '\''),$this->get_string_between($longitude, '\'', '.')));

            $descricao  = $this->input->post('descricao');

            $infoAnimal = array('id_parcela'=> $id_parcela, 'id_acesso'=>$this->session->userdata('userId'), 'latitude_gms'=>$latitude, 
                                'longitude_gms'=>$longitude,'id_tipo_observacao'=> $id_tipo_observacao,
                                'id_classificacao'=>$id_classificacao, 'id_grau_protecao'=>$id_grau_protecao, 'descricao'=>$descricao,
                                'latitude_gd'=>$latitude_gd, 'longitude_gd'=>$longitude_gd, 'st_registro_ativo'=>'S');
                                
            $result = $this->PrincipalModel->editaAnimal($infoAnimal, $IdAnimal);
            
            $infoRlFaunaFamiliaGeneroEspecie = array('id_familia'=>$id_familia, 'id_genero '=> $id_genero, 
                                                    'id_especie'=>$id_especie, 'st_registro_ativo'=>'S');
                                
            $resultRl = $this->PrincipalModel->editaRlFaunaFamiliaGeneroEspecie($infoRlFaunaFamiliaGeneroEspecie, $IdAnimal);
            
            if($result && $resultRl)
            {
                $process = 'Animais atualizada';
                $processFunction = 'Principal/editaAnimal';
                $this->logrecord($process,$processFunction);

                $this->session->set_flashdata('success', 'Animais atualizado com sucesso');
            }
            else
            {
                $this->session->set_flashdata('error', 'Falha na atualização de animais');
            }
            
            redirect('principalAnimal/listar');
    }

    function apagaAnimal()
    {
            $IdAnimal = $this->uri->segment(2);

            $resultado = $this->PrincipalModel->apagaAnimal($IdAnimal);
            
            if ($resultado) {
                // echo(json_encode(array('status'=>TRUE)));

                $process = 'Exclusão de animal';
                $processFunction = 'Principal/apagaAnimal';
                $this->logrecord($process,$processFunction);

                $this->session->set_flashdata('success', 'Animal deletado com sucesso');

                }
                else 
                { 
                    //echo(json_encode(array('status'=>FALSE))); 
                    $this->session->set_flashdata('error', 'Falha em excluir animal');
                }
                redirect('principalAnimal/listar');
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

                $returns = $this->paginationCompress ( "principalEpifita/listar", $count, 10 );
                
                $data['registrosEpifitas'] = $this->PrincipalModel->listaEpifitas($searchText, $returns["page"], $returns["segment"]);
                
                $process = 'Listar Epífitas';
                $processFunction = 'Principal/principalEpifita';
                $this->logrecord($process,$processFunction);

                $this->global['pageTitle'] = 'SOMA : Lista de Epífitas';

                $data['infoPerfil'] = $this->PrincipalModel->carregaInfoPerfil();
               
                $this->loadViews("principal/l_principalEpifita", $this->global, $data, NULL);
            }
            else if ($tpTela == 'cadastrar') {
                $this->global['pageTitle'] = 'SOMA : Cadastro de Epífita';
                
                $data['infoFamilias'] = $this->PrincipalModel->carregaInfoFamilias();
                $data['infoParcelas'] = $this->PrincipalModel->carregaInfoParcelas();
                
                $data['nextIdEpifita'] = $this->PrincipalModel->carregaNextIdEpifita();
                
                $this->loadViews("principal/c_principalEpifita", $this->global, $data, NULL); 
            }
            else if ($tpTela == 'editar') {
                $IdEpifita = $this->uri->segment(3);
                if($IdEpifita == null)
                {
                    redirect('principalEpifita/listar');
                }

                $data['infoParcelas'] = $this->PrincipalModel->carregaInfoParcelas();
                $data['infoEpifita'] = $this->PrincipalModel->carregaInfoEpifita($IdEpifita);
                $data['infoFamilias'] = $this->PrincipalModel->carregaInfoFamilias();
                $data['infoGeneros'] = $this->PrincipalModel->carregaInfoGeneros();
                $data['infoEspecies'] = $this->PrincipalModel->carregaInfoEspecies();

                $this->global['pageTitle'] = 'SOMA : Editar epífita';      
                $this->loadViews("principal/c_principalEpifita", $this->global, $data, NULL);
            }
    }

    function adicionaEpifita() 
    {
        $id_parcela  = $this->input->post('id_parcela');
        $latitude = preg_replace('/-+/', '', $this->input->post('latitude'));
        $longitude = preg_replace('/-+/', '', $this->input->post('longitude'));
        $id_familia = $this->input->post('id_familia');
        $id_genero = $this->input->post('id_genero');
        $id_especie = $this->input->post('id_especie');

        $latitude_gd = ($this->DMStoDD(strtok($latitude, '°'),$this->get_string_between($latitude, '°', '\''),$this->get_string_between($latitude, '\'', '.')));
        $longitude_gd = ($this->DMStoDD(strtok($longitude, '°'),$this->get_string_between($longitude, '°', '\''),$this->get_string_between($longitude, '\'', '.')));

        $descricao = $this->input->post('descricao');

        $infoEpifita = array('id_parcela'=> $id_parcela, 'id_acesso'=>$this->session->userdata('userId'),
                             'latitude_gms'=>$latitude, 'longitude_gms'=>$longitude, 'descricao'=>$descricao,
                             'latitude_gd'=>$latitude_gd,'longitude_gd'=>$longitude_gd, 'st_registro_ativo'=>'S');
                            
        $result = $this->PrincipalModel->adicionaEpifita($infoEpifita);
        
        $infoRlEpifitaFamiliaGeneroEspecie = array('id_epifitas'=> $result, 'id_familia'=>$id_familia,
                                                 'id_genero '=> $id_genero, 'id_especie'=>$id_especie, 
                                                 'st_registro_ativo'=>'S');
                            
        $resultRl = $this->PrincipalModel->adicionaRlEpifitaFamiliaGeneroEspecie($infoRlEpifitaFamiliaGeneroEspecie);
        
        if($result > 0 && $resultRl > 0)
        {
            $process = 'Adicionar epífita';
            $processFunction = 'Principal/adicionaEpifita';
            $this->logrecord($process,$processFunction);

            $this->session->set_flashdata('success', 'Epífita criada com sucesso');
        }
        else
        {
            $this->session->set_flashdata('error', 'Falha na criação de epífita');
        }          
        
        redirect('principalEpifita/listar');
    }


    function editaEpifita()
    {
            $IdEpifita = $this->input->post('id');

                $id_parcela  = $this->input->post('id_parcela');
                $latitude = preg_replace('/-+/', '', $this->input->post('latitude'));
                $longitude = preg_replace('/-+/', '', $this->input->post('longitude'));
                $id_familia = $this->input->post('id_familia');
                $id_genero = $this->input->post('id_genero');
                $id_especie = $this->input->post('id_especie');

                $latitude_gd = ($this->DMStoDD(strtok($latitude, '°'),$this->get_string_between($latitude, '°', '\''),$this->get_string_between($latitude, '\'', '.')));
                $longitude_gd = ($this->DMStoDD(strtok($longitude, '°'),$this->get_string_between($longitude, '°', '\''),$this->get_string_between($longitude, '\'', '.')));

                $descricao = $this->input->post('descricao');

                $infoEpifita = array('id_parcela'=> $id_parcela, 'id_acesso'=>$this->session->userdata('userId'), 
                                     'latitude_gms'=>$latitude, 'longitude_gms'=>$longitude, 'descricao'=>$descricao,
                                     'latitude_gd'=>$latitude_gd, 'longitude_gd'=>$longitude_gd, 'st_registro_ativo'=>'S');
                                    
                $result = $this->PrincipalModel->editaEpifita($infoEpifita, $IdEpifita);
                
                $infoRlEpifitaFamiliaGeneroEspecie = array('id_familia'=>$id_familia, 'id_genero '=> $id_genero, 
                                                         'id_especie'=>$id_especie, 'st_registro_ativo'=>'S');
                                    
                $resultRl = $this->PrincipalModel->editaRlEpifitaFamiliaGeneroEspecie($infoRlEpifitaFamiliaGeneroEspecie, $IdEpifita);
                
                if($result && $resultRl)
                {
                    $process = 'Epífita atualizada';
                    $processFunction = 'Principal/editaEpifita';
                    $this->logrecord($process,$processFunction);

                    $this->session->set_flashdata('success', 'Epífita atualizada com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na atualização de epífita');
                }
                
                redirect('principalEpifita/listar');
           // }
    }

    function apagaEpifita()
    {
            $IdEpifita = $this->uri->segment(2);

            $resultado = $this->PrincipalModel->apagaEpifita($IdEpifita);
            
            if ($resultado) {
                // echo(json_encode(array('status'=>TRUE)));

                $process = 'Exclusão de epífita';
                $processFunction = 'Principal/apagaEpifita';
                $this->logrecord($process,$processFunction);

                $this->session->set_flashdata('success', 'Epífita deletada com sucesso');

                }
                else 
                { 
                    //echo(json_encode(array('status'=>FALSE))); 
                    $this->session->set_flashdata('error', 'Falha em excluir epífita');
                }
                redirect('principalEpifita/listar');
    }


    function principalHidrologia()
    {
            $tpTela = $this->uri->segment(2);

            $data['perfis'] = $this->PrincipalModel->carregaPerfisUsuarios();

            if ($tpTela == 'listar') {

                $searchText = $this->security->xss_clean($this->input->post('searchText'));
                $data['searchText'] = $searchText;
                
                $this->load->library('pagination');
                
                $count = 0;

                $returns = $this->paginationCompress ( "principalHidrologia/listar", $count, 10 );
                
                $data['registrosHidrologia'] = $this->PrincipalModel->listaHidrologia($searchText, $returns["page"], $returns["segment"]);
                
                $process = 'Listar Hidrologias';
                $processFunction = 'Principal/principalHidrologia';
                $this->logrecord($process,$processFunction);

                $this->global['pageTitle'] = 'SOMA : Lista de Hidrologia';

                $data['infoPerfil'] = $this->PrincipalModel->carregaInfoPerfil();
               
                $this->loadViews("principal/l_principalHidrologia", $this->global, $data, NULL);
            }
            else if ($tpTela == 'cadastrar') {
                $this->global['pageTitle'] = 'SOMA : Cadastro de Hidrologia';
                
                $data['infoParcelas'] = $this->PrincipalModel->carregaInfoParcelas();
                
                $data['nextIdHidrologia'] = $this->PrincipalModel->carregaNextIdHidrologia();
                
                $this->loadViews("principal/c_principalHidrologia", $this->global, $data, NULL); 
            }
            else if ($tpTela == 'editar') {
                $IdHidrologia = $this->uri->segment(3);
                if($IdHidrologia == null)
                {
                    redirect('principalHidrologia/listar');
                }

                $data['infoParcelas'] = $this->PrincipalModel->carregaInfoParcelas();
                $data['infoHidrologia'] = $this->PrincipalModel->carregaInfoHidrologia($IdHidrologia);
               
                $this->global['pageTitle'] = 'SOMA : Editar Hidrologia';      
                $this->loadViews("principal/c_principalHidrologia", $this->global, $data, NULL);
            }
    }

    function adicionaHidrologia() 
    {
        $id_parcela  = $this->input->post('id_parcela');
        $descricao  = $this->input->post('descricao');
        $latitude = preg_replace('/-+/', '', $this->input->post('latitude'));
        $longitude = preg_replace('/-+/', '', $this->input->post('longitude'));
        
        $latitude_gd = ($this->DMStoDD(strtok($latitude, '°'),$this->get_string_between($latitude, '°', '\''),$this->get_string_between($latitude, '\'', '.')));
        $longitude_gd = ($this->DMStoDD(strtok($longitude, '°'),$this->get_string_between($longitude, '°', '\''),$this->get_string_between($longitude, '\'', '.')));
        
        $infoHidrologia = array('id_parcela'=> $id_parcela, 'id_acesso'=>$this->session->userdata('userId'),
                             'descricao'=>$descricao, 'latitude_gms'=>$latitude, 'longitude_gms'=>$longitude, 'latitude_gd'=>$latitude_gd,
                             'longitude_gd'=>$longitude_gd, 'dt_cadastro'=>date('d-m-y'), 'st_registro_ativo'=>'S');
                            
        $result = $this->PrincipalModel->adicionaHidrologia($infoHidrologia);
        
        if($result > 0)
        {
            $process = 'Adicionar Hidrologia';
            $processFunction = 'Principal/adicionaHidrologia';
            $this->logrecord($process,$processFunction);

            $this->session->set_flashdata('success', 'Hidrologia criada com sucesso');
        }
        else
        {
            $this->session->set_flashdata('error', 'Falha na criação de hidrologia');
        }          
        
        redirect('principalHidrologia/listar');
    }


    function editaHidrologia()
    {
        $IdHidrologia = $this->input->post('id');

        $id_parcela  = $this->input->post('id_parcela');
        $descricao  = $this->input->post('descricao');
        $latitude = preg_replace('/-+/', '', $this->input->post('latitude'));
        $longitude = preg_replace('/-+/', '', $this->input->post('longitude'));
        
        $latitude_gd = ($this->DMStoDD(strtok($latitude, '°'),$this->get_string_between($latitude, '°', '\''),$this->get_string_between($latitude, '\'', '.')));
        $longitude_gd = ($this->DMStoDD(strtok($longitude, '°'),$this->get_string_between($longitude, '°', '\''),$this->get_string_between($longitude, '\'', '.')));
        
        $infoHidrologia = array('id_parcela'=> $id_parcela, 'id_acesso'=>$this->session->userdata('userId'),
                                'descricao'=>$descricao, 'latitude_gms'=>$latitude, 'longitude_gms'=>$longitude, 'latitude_gd'=>$latitude_gd,
                                'longitude_gd'=>$longitude_gd, 'dt_cadastro'=>date('d-m-y'), 'st_registro_ativo'=>'S');
                                
        $result = $this->PrincipalModel->editaHidrologia($infoHidrologia, $IdHidrologia);            
        
        if($result)
        {
            $process = 'Hidrologia atualizada';
            $processFunction = 'Principal/editaHidrologia';
            $this->logrecord($process,$processFunction);

            $this->session->set_flashdata('success', 'Hidrologia atualizada com sucesso');
        }
        else
        {
            $this->session->set_flashdata('error', 'Falha na atualização de hidrologia');
        }
        
        redirect('principalHidrologia/listar');
    }

    function apagaHidrologia()
    {
            $IdHidrologia = $this->uri->segment(2);

            $resultado = $this->PrincipalModel->apagaHidrologia($IdHidrologia);
            
            if ($resultado) {
                $process = 'Exclusão de hidrologia';
                $processFunction = 'Principal/apagaHidrologia';
                $this->logrecord($process,$processFunction);

                $this->session->set_flashdata('success', 'Hidrologia deletada com sucesso');
                }
                else 
                { 
                    $this->session->set_flashdata('error', 'Falha em excluir hidrologia');
                }
                redirect('principalHidrologia/listar');
    }

    function consultaGenero()
    {
            $idFamilia = $this->uri->segment(2);
                       
            $resultado = $this->PrincipalModel->consultaGenero($idFamilia);
            
            echo json_encode($resultado);
    }

    function consultaEspecie()
    {
            $idGenero = $this->uri->segment(2);
                       
            $resultado = $this->PrincipalModel->consultaEspecie($idGenero);
            
            echo json_encode($resultado);
    }


    function consultaGeneroFauna()
    {
            $idFamilia = $this->uri->segment(2);
                       
            $resultado = $this->PrincipalModel->consultaGeneroFauna($idFamilia);
            
            echo json_encode($resultado);
    }

    function consultaEspecieFauna()
    {
            $idGenero = $this->uri->segment(2);
                       
            $resultado = $this->PrincipalModel->consultaEspecieFauna($idGenero);
            
            echo json_encode($resultado);
    }

    function valor($val)
    {
        $val = str_replace(",",".",$val);
        $val = preg_replace('/\.(?=.*\.)/', '', $val);
       // return ($val); 
        return floatval($val);      
    }

    function get_string_between($string, $start, $end){
        $string = ' ' . $string;
        $ini = strpos($string, $start);
        if ($ini == 0) return '';
        $ini += strlen($start);
        $len = strpos($string, $end, $ini) - $ini;
        return substr($string, $ini, $len);
    }

    function DMStoDD($deg,$min,$sec)
    {
        // Converting DMS ( Degrees / minutes / seconds ) to decimal format
    return $deg+((($min*60)+($sec))/3600);
    }

}