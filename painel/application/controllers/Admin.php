<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';
/**
 * Class : Admin (AdminController)
 * Admin class to control to authenticate admin credentials and include admin functions.
 * @author : Samet Aydın / sametay153@gmail.com
 * @version : 1.0
 * @since : 27.02.2018
 */
class Admin extends BaseController
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();
        $this->load->model('login_model');
        $this->load->model('user_model');
       // $this->load->model('photo_model');
        $this->load->library(array('pagination', 'session', 'form_validation', 'image_lib'));
        $this->load->helper('form');
        // Datas -> libraries ->BaseController / This function used load user sessions
        $this->datas();
        // isLoggedIn / Login control function /  This function used login control
        $this->page_items = array(
            'msg' => null,
            'table_photo' => null,
            'form_upload' => null,
            'form_edit' => null,
            'pagination' => null,
        );

        $isLoggedIn = $this->session->userdata('isLoggedIn');
        if(!isset($isLoggedIn) || $isLoggedIn != TRUE)
        {
            redirect('login');
        }
        
       /* else
        {
            // isAdmin / Admin role control function / This function used admin role control
            if($this->isAdmin() == TRUE)
            {
                $this->accesslogincontrol();
            }
        }*/
    }
	
     /**
     * This function is used to load the user list
     */
    function userListing()
    {   
            $searchText = $this->security->xss_clean($this->input->post('searchText'));
            $data['searchText'] = $searchText;
            
            $this->load->library('pagination');
            
            $count = $this->user_model->userListingCount($searchText);

			$returns = $this->paginationCompress ( "userListing/", $count, 10 );
            
            $data['userRecords'] = $this->user_model->userListing($searchText, $returns["page"], $returns["segment"]);
            
            $process = 'Lista de usuários';
            $processFunction = 'Admin/userListing';
            $this->logrecord($process,$processFunction);

            $this->global['pageTitle'] = 'ADMIN : Lista de usuários';
            
            $this->loadViews("users", $this->global, $data, NULL);
    }

    /**
     * This function is used to load the add new form
     */
    function addNew()
    {
            $data['roles'] = $this->user_model->getUserRoles();

            $this->global['pageTitle'] = 'ADMIN : Adicionar usuário';

            $this->loadViews("addNew", $this->global, $data, NULL);
    }


    /**
     * This function is used to add new user to the system
     */
    function addNewUser()
    {
            $this->load->library('form_validation');
            
            $this->form_validation->set_rules('fname','Full Name','trim|required|max_length[128]');
            $this->form_validation->set_rules('email','Email','trim|required|valid_email|max_length[128]');
            $this->form_validation->set_rules('password','Password','required|max_length[20]');
            $this->form_validation->set_rules('cpassword','Confirm Password','trim|required|matches[password]|max_length[20]');
            $this->form_validation->set_rules('role','Role','trim|required|numeric');
            $this->form_validation->set_rules('mobile','Mobile Number','required|min_length[10]');
            
            if($this->form_validation->run() == FALSE)
            {
                $this->addNew();
            }
            else
            {
                $name = ucwords(strtolower($this->security->xss_clean($this->input->post('fname'))));
                $email = $this->security->xss_clean($this->input->post('email'));
                $password = $this->input->post('password');
                $roleId = $this->input->post('role');
                $mobile = $this->security->xss_clean($this->input->post('mobile'));
                
                $userInfo = array('email'=>$email, 'password'=>getHashedPassword($password), 'roleId'=>$roleId, 'name'=> $name,
                                    'mobile'=>$mobile, 'createdBy'=>$this->vendorId, 'createdDtm'=>date('Y-m-d H:i:s'));
                                    
                $result = $this->user_model->addNewUser($userInfo);
                
                if($result > 0)
                {
                    $process = 'Adicionando usuários';
                    $processFunction = 'Admin/addNewUser';
                    $this->logrecord($process,$processFunction);

                    $this->session->set_flashdata('success', 'Usuário criado com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na criação do usuário');
                }
                
                redirect('userListing');
            }
        }

     /**
     * This function is used load user edit information
     * @param number $userId : Optional : This is user id
     */
    function editOld($userId = NULL)
    {
            if($userId == null)
            {
                redirect('userListing');
            }
            
            $data['roles'] = $this->user_model->getUserRoles();
            $data['userInfo'] = $this->user_model->getUserInfo($userId);

            $this->global['pageTitle'] = 'ADMIN : Editar usuário';
            
            $this->loadViews("editOld", $this->global, $data, NULL);
    }


    /**
     * This function is used to edit the user informations
     */
    function editUser()
    {
            $this->load->library('form_validation');
            
            $userId = $this->input->post('userId');
            
            $this->form_validation->set_rules('fname','Full Name','trim|required|max_length[128]');
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
            {
                $name = ucwords(strtolower($this->security->xss_clean($this->input->post('fname'))));
                $email = $this->security->xss_clean($this->input->post('email'));
                $password = $this->input->post('password');
                $roleId = $this->input->post('role');
                $mobile = $this->security->xss_clean($this->input->post('mobile'));
                
                $userInfo = array();
                
                if(empty($password))
                {
                    $userInfo = array('email'=>$email, 'roleId'=>$roleId, 'name'=>$name,
                                    'mobile'=>$mobile, 'status'=>0, 'updatedBy'=>$this->vendorId, 'updatedDtm'=>date('Y-m-d H:i:s'));
                }
                else
                {
                    $userInfo = array('email'=>$email, 'password'=>getHashedPassword($password), 'roleId'=>$roleId,
                        'name'=>ucwords($name), 'mobile'=>$mobile,'status'=>0, 'updatedBy'=>$this->vendorId, 
                        'updatedDtm'=>date('Y-m-d H:i:s'));
                }
                
                $result = $this->user_model->editUser($userInfo, $userId);
                
                if($result == true)
                {
                    $process = 'Atualizar usuário';
                    $processFunction = 'Admin/editUser';
                    $this->logrecord($process,$processFunction);

                    $this->session->set_flashdata('success', 'Usuário atualizado com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na atualização do usuário');
                }
                
                redirect('userListing');
            }
    }

     /**
     * This function is used to delete the user using userId
     * @return boolean $result : TRUE / FALSE
     */
    function deleteUser()
    {
            $userId = $this->input->post('userId');
            $userInfo = array('isDeleted'=>1,'updatedBy'=>$this->vendorId, 'updatedDtm'=>date('Y-m-d H:i:s'));
            
            $result = $this->user_model->deleteUser($userId, $userInfo);
            
            if ($result > 0) {
                 echo(json_encode(array('status'=>TRUE)));

                 $process = 'Deletar usuário';
                 $processFunction = 'Admin/deleteUser';
                 $this->logrecord($process,$processFunction);

                }
            else { echo(json_encode(array('status'=>FALSE))); }
    }

     /**
     * This function used to show log history
     * @param number $userId : This is user id
     */
    function logHistory($userId = NULL)
    {
            $data['dbinfo'] = $this->user_model->gettablemb('tb_log','u699148595_inventario_hom');
            if(isset($data['dbinfo']->total_size))
            {
                if(($data['dbinfo']->total_size)>1000){
                    $this->backupLogTable();
                }
            }
            $data['userRecords'] = $this->user_model->logHistory($userId);

            $process = 'Visualização de log';
            $processFunction = 'Admin/logHistory';
            $this->logrecord($process,$processFunction);

            $this->global['pageTitle'] = 'ADMIN : Histórico de Login do Usuário';
            
            $this->loadViews("logHistory", $this->global, $data, NULL);
    }

    /**
     * This function used to show specific user log history
     * @param number $userId : This is user id
     */
    function logHistorysingle($userId = NULL)
    {       
            $userId = ($userId == NULL ? $this->session->userdata("userId") : $userId);
            $data["userInfo"] = $this->user_model->getUserInfoById($userId);
            $data['userRecords'] = $this->user_model->logHistory($userId);
            
            $process = 'Visualização de log único';
            $processFunction = 'Admin/logHistorysingle';
            $this->logrecord($process,$processFunction);

            $this->global['pageTitle'] = 'ADMIN : Histórico de Login do Usuário';
            
            $this->loadViews("logHistorysingle", $this->global, $data, NULL);      
    }
    
    /**
     * This function used to backup and delete log table
     */
    function backupLogTable()
    {
        $this->load->dbutil();
        $prefs = array(
            'tables'=>array('tbl_log')
        );
        $backup=$this->dbutil->backup($prefs) ;

        date_default_timezone_set('Europe/Istanbul');
        $date = date('d-m-Y H-i');

        $filename = './backup/'.$date.'.sql.gz';
        $this->load->helper('file');
        write_file($filename,$backup);

        $this->user_model->clearlogtbl();

        if($backup)
        {
            $this->session->set_flashdata('success', 'Limpeza e backup da tabela bem-sucedida');
            redirect('log-history');
        }
        else
        {
            $this->session->set_flashdata('error', 'Falha na limpeza do backup e da tabela');
            redirect('log-history');
        }
    }

    /**
     * This function used to open the logHistoryBackup page
     */
    function logHistoryBackup()
    {
            $data['dbinfo'] = $this->user_model->gettablemb('tbl_log_backup','cias');
            if(isset($data['dbinfo']->total_size))
            {
            if(($data['dbinfo']->total_size)>1000){
                $this->backupLogTable();
            }
            }
            $data['userRecords'] = $this->user_model->logHistoryBackup();

            $process = 'Visualização de log de backup';
            $processFunction = 'Admin/logHistoryBackup';
            $this->logrecord($process,$processFunction);

            $this->global['pageTitle'] = 'ADMIN : Histórico de logon do backup do usuário';
            
            $this->loadViews("logHistoryBackup", $this->global, $data, NULL);
    }

    /**
     * This function used to delete backup_log table
     */
    function backupLogTableDelete()
    {
        $backup=$this->user_model->clearlogBackuptbl();

        if($backup)
        {
            $this->session->set_flashdata('success', 'Limpeza da tabela bem-sucedida');
            redirect('log-history-backup');
        }
        else
        {
            $this->session->set_flashdata('error', 'Falha na limpeza da tabela');
            redirect('log-history-backup');
        }
    }

    /**
     * This function used to open the logHistoryUpload page
     */
    function logHistoryUpload()
    {       
            $this->load->helper('directory');
            $map = directory_map('./backup/', FALSE, TRUE);
        
            $data['backups']=$map;

            $process = 'Upload de um log de backup';
            $processFunction = 'Admin/logHistoryUpload';
            $this->logrecord($process,$processFunction);

            $this->global['pageTitle'] = 'ADMIN : Upload de um log de usuário';
            
            $this->loadViews("logHistoryUpload", $this->global, $data, NULL);      
    }

    /**
     * This function used to upload backup for backup_log table
     */
    function logHistoryUploadFile()
    {
        $optioninput = $this->input->post('optionfilebackup');

        if ($optioninput == '0' && $_FILES['filebackup']['name'] != '')
        {
            $config = array(
            'upload_path' => "./uploads/",
            'allowed_types' => "gz|sql|gzip",
            'overwrite' => TRUE,
            'max_size' => "20048000", // Can be set to particular file size , here it is 20 MB(20048 Kb)
            );

            $this->load->library('upload', $config);
            $upload= $this->upload->do_upload('filebackup');
                $data = $this->upload->data();
                $filepath = $data['full_path'];
                $path_parts = pathinfo($filepath);
                $filetype = $path_parts['extension'];
                if ($filetype == 'gz')
                {
                    // Read entire gz file
                    $lines = gzfile($filepath);
                    $lines = str_replace('tbl_log','tbl_log_backup', $lines);
                }
                else
                {
                    // Read in entire file
                    $lines = file($filepath);
                    $lines = str_replace('tbl_log','tbl_log_backup', $lines);
                }
        }

        else if ($optioninput != '0' && $_FILES['filebackup']['name'] == '')
        {
            $filepath = './backup/'.$optioninput;
            $path_parts = pathinfo($filepath);
            $filetype = $path_parts['extension'];
            if ($filetype == 'gz')
            {
                // Read entire gz file
                $lines = gzfile($filepath);
                $lines = str_replace('tbl_log','tbl_log_backup', $lines);
            }
            else
            {
                // Read in entire file
                $lines = file($filepath);
                $lines = str_replace('tbl_log','tbl_log_backup', $lines);
            }
        }
                // Set line to collect lines that wrap
                $templine = '';
                
                // Loop through each line
                foreach ($lines as $line)
                {
                    // Skip it if it's a comment
                    if (substr($line, 0, 2) == '--' || $line == '')
                    continue;
                    // Add this line to the current templine we are creating
                    $templine .= $line;

                    // If it has a semicolon at the end, it's the end of the query so can process this templine
                    if (substr(trim($line), -1, 1) == ';')
                    {
                        // Perform the query
                        $this->db->query($templine);

                        // Reset temp variable to empty
                        $templine = '';
                    }
                }
            if (empty($lines) || !isset($lines))
            {
                $this->session->set_flashdata('error', 'Falha no upload do backup');
                redirect('log-history-upload');
            }
            else
            {
                $this->session->set_flashdata('success', 'Upload de backup bem-sucedido');
                redirect('log-history-upload');
            }
    }


    public function index()
    {   
       /* if ( ! $this->session->userdata('logged_in')) {
            $this->page_items['msg'] = "Login to see this page.";
            $this->render('index', $this->page_items);
        } else {*/
            exit;
            if ($this->input->get()) {
                $this->session->set_userdata('order_field', $this->input->get('order_field'));
                $this->session->set_userdata('order', $this->input->get('order'));
            }

            // Get photo with offset based on 3 segment of uri
            $photos = $this->photo_model->get(
                $this->current_page(),
                $this->uri->segment(2),
                $this->uri->segment(3),
                ($this->session->userdata('order_field') ?: 'id'),
                ($this->session->userdata('order') ?: 'asc')
            );

            if ( !$photos) {
                $this->page_items['msg'] = "No photo found in database.";
                $this->page_items['ds_categoria'] = $this->uri->segment(2);
                $this->page_items['id_categoria'] = $this->uri->segment(3);

                $this->render('index', $this->page_items);
            } else {
                $this->page_items['table_photo'] = $this->load->view(
                    'admin/photo/parts_table_photo',
                    array(
                        'ds_categoria' => $this->uri->segment(2),
                        'id_categoria' => $this->uri->segment(3),
                        'photos' => $photos),
                    true
                );

                $this->init_pagination();

                $this->page_items['pagination'] = $this->load->view(
                    'admin/templates/parts_pagination',
                    array('links' => $this->pagination->create_links()),
                    true
                );

                $this->page_items['ds_categoria'] = $this->uri->segment(2);
                $this->page_items['id_categoria'] = $this->uri->segment(3);

                $this->render('index', $this->page_items);
            }
     //   }
    }

    public function login()
    {
        if ($this->session->userdata('logged_in')) {
            redirect('admin');
        } else {
            $this->form_validation->set_rules('password', 'Password', 'trim|required');
            if ($this->form_validation->run() == false) {
                $this->page_items['msg'] = validation_errors('<span> ','<span>');

                $this->render('index', $this->page_items);
            } else {
                $pass = $this->input->post('password');
                $hash = $this->config->item('hash');
                
                if ( ! password_verify($pass, $hash)) {
                    $this->page_items['msg'] = "Wrong password.";

                    $this->render('index', $this->page_items);
                } else {
                    $this->session->set_userdata('logged_in', true);
                    redirect('admin');
                }
            }
        }

    }

    public function logout()
    {
        $this->session->sess_destroy();

        redirect('admin');
    }

    public function upload()
    {
        $ds_categoria = $this->uri->segment(3);
        $id_categoria = $this->uri->segment(4);

        $this->form_validation->set_rules('name', 'Photo name', 'trim|required');
        $this->form_validation->set_rules('description', 'Description', 'trim|required');
        $this->form_validation->set_rules('date', 'Date', 'trim|required');
       // $this->form_validation->set_rules('location', 'Location', 'trim|required');

        if ($this->form_validation->run() == false) {
            $this->page_items['msg'] = validation_errors('<span> ','</span>');
            $this->page_items['ds_categoria'] = $ds_categoria;
            $this->page_items['id_categoria'] = $id_categoria;
            $this->page_items['form_upload'] = $this->load->view(
                'admin/photo/parts_form_upload',
                $this->page_items,
                true
            );

            $this->render('photo/upload', $this->page_items);
        } else {
            $ds_categoria = $this->input->post('ds_categoria');
            $id_categoria = $this->input->post('id_categoria');

            $config['upload_path']          = './uploads/';
            $config['allowed_types']        = 'gif|jpg|png|doc|txt';
            $config['encrypt_name']         = true;
            $config['max_size']             = 50000000;
            $this->load->library('upload', $config);

            if ( ! $this->upload->do_upload('photo')) {
                $this->page_items['msg'] = $this->upload->display_errors('<span> ', '</span>');
                $this->page_items['form_upload'] = $this->load->view(
                    'admin/photo/parts_form_upload',
                    $this->page_items,
                    true
                );

                $this->render('photo/upload', $this->page_items);
            } else {
                $upload_data = $this->upload->data();
                $data = $this->input->post();
                $source = 'uploads/'.$upload_data['file_name'];

                $this->create_thumb($source, 100, 75, true);
                $this->create_thumb($source, 640, 480, false);

                $data['link'] ='uploads/' . $upload_data['file_name'];
                $data['link_thumb'] =
                    'uploads/' .
                    $upload_data['raw_name'] .
                    '_thumb' .
                    $upload_data['file_ext']
                ;

                $this->photo_model->persist($data, $ds_categoria, $id_categoria);

                $this->page_items['ds_categoria'] = $ds_categoria;
                $this->page_items['id_categoria'] = $id_categoria;

                $this->page_items['msg'] = "Upload success.";

                redirect('admin/'.$ds_categoria.'/'.$id_categoria);

               // $this->render('index', $this->page_items);
            }
        }

    }

    public function edit($id=null)
    {
        $id = $this->uri->segment(5);
        if ( !is_numeric($id)) {
            $this->page_items['msg'] = "No photo with such id";

            $this->render('index', $this->page_items);
        } else {
            $this->form_validation->set_rules('name', 'Photo name', 'trim|required');
            $this->form_validation->set_rules('description', 'Description', 'trim|required');
            $this->form_validation->set_rules('date', 'Date', 'trim|required');
         //   $this->form_validation->set_rules('location', 'Location', 'trim|required');

            if ($this->form_validation->run() == false) {
                $photo = $this->photo_model->get_by_id($id);

                if ( ! $photo) {
                    $this->page_items['msg'] = "No photo with such id.";

                    $this->render('index', $data);
                } else {
                    $date = $photo['date'];
                    $format = 'm/d/Y';
                    $photo['date'] = date($format, strtotime($date));

                    $this->page_items['msg'] = validation_errors('<span> ','</span>');
                    $this->page_items['form_edit'] = $this->load->view(
                        'admin/photo/parts_form_edit',
                        array('msg' => $this->page_items['msg'], 'photo' => $photo),
                        true
                    );

                    $this->render('photo/edit', $this->page_items);
                }
            } else {
                $data['photo'] = $this->input->post();
                $this->photo_model->update($data['photo']['id'], $data['photo']);

                $this->page_items['msg'] = "Edit photo success.";
                $this->render('index', $this->page_items);
            }
        }

    }

    public function delete($id)
    {
        $ds_categoria = $this->uri->segment(3);
        $id_categoria = $this->uri->segment(4);
        $id = $this->uri->segment(5);
        $photo = $this->photo_model->get_by_id($id);
        unlink($photo['link']);
        unlink($photo['link_thumb']);

        $this->photo_model->delete($id);

        redirect('admin/'.$ds_categoria.'/'.$id_categoria);
    }

    private function init_pagination()
    {
        // Codeigniter pagination configuration
        $config = array();
        $config['base_url'] = site_url() . '/admin/index';
        $config['total_rows'] = $this->photo_model->record_count();
        $config['per_page'] = 18;
        $config['uri_segment'] = 3;
        // Applying bootstrap templates to codeigniter pagination
        $config['full_tag_open'] = "<ul class='pagination'>";
        $config['full_tag_close'] ="</ul>";
        $config['num_tag_open'] = '<li>';
        $config['num_tag_close'] = '</li>';
        $config['cur_tag_open'] = "<li class='disabled'><li class='active'><a href='#'>";
        $config['cur_tag_close'] = "<span class='sr-only'></span></a></li>";
        $config['next_tag_open'] = "<li>";
        $config['next_tagl_close'] = "</li>";
        $config['prev_tag_open'] = "<li>";
        $config['prev_tagl_close'] = "</li>";
        $config['first_tag_open'] = "<li>";
        $config['first_tagl_close'] = "</li>";
        $config['last_tag_open'] = "<li>";
        $config['last_tagl_close'] = "</li>";

        $this->pagination->initialize($config);
    }

    private function current_page()
    {
        // Get page index from 3rd segment of uri
        $page = ($this->uri->segment(3)) ? $this->uri->segment(3) : 0;

        return $page;
    }

    private function create_thumb($source, $w, $h, $thumb)
    {
        $config['image_library'] = 'gd2';
        $config['source_image'] = $source;
        $config['create_thumb'] = $thumb;
        $config['maintain_ratio'] = TRUE;
        $config['width'] = $w;
        $config['height'] = $h;
        $this->image_lib->initialize($config);

        $this->image_lib->resize();
        $this->image_lib->clear();
    }

    private function render($view, $data)
    {
        $this->load->view('admin/templates/header', $data);
        $this->load->view('admin/' . $view, $data);
        $this->load->view('admin/templates/footer');
    }

}