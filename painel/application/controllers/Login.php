<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require APPPATH . '/libraries/BaseController.php';
require 'vendor/autoload.php';

/**
 * Class : Login (LoginController)
 * Admin class to control to authenticate admin credentials and include admin functions.
 * @author : Samet Aydın / sametay153@gmail.com
 * @version : 1.0
 * @since : 27.02.2018
 */
class Login extends BaseController
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();
        $this->load->model('login_model');
        date_default_timezone_set('America/Sao_Paulo');
    }

    /**
     * Index Page for this controller.
     */
    public function index()
    {
        $this->isLoggedIn();
    }

    /**
     * This function is used to open error /404 not found page
     */
    public function error()
    {
        $isLoggedIn = $this->session->userdata('isLoggedIn');
        
        if(!isset($isLoggedIn) || $isLoggedIn != TRUE)
        {
            $this->load->view('login');
        }
        else
        {
            $process = 'Hata';
            $processFunction = 'Login/error';
            $this->logrecord($process,$processFunction);
            redirect('pageNotFound');
        }
    }

    /**
     * This function is used to access denied page
     */
    public function noaccess() {
        
        $this->global['pageTitle'] = 'ADMIN : Acesso negado';
        $this->datas();

        $this->load->view ( 'includes/header', $this->global );
		$this->load->view ( 'access' );
		$this->load->view ( 'includes/footer' );
    }

    /**
     * This function used to check the user is logged in or not
     */
    function isLoggedIn()
    {
        $isLoggedIn = $this->session->userdata('isLoggedIn');
        
        if(!isset($isLoggedIn) || $isLoggedIn != TRUE)
        {
            $this->load->view('login');
        }
        else
        {
            redirect('/dashboard');
        }
    }
    
    
    /**
     * This function used to logged in user
     */
    public function loginMe()
    {
        $this->load->library('form_validation');
        
        //$this->form_validation->set_rules('usuario', 'Usuário', 'required|max_length[128]|trim');
        $this->form_validation->set_rules('senha', 'Senha', 'required|max_length[32]');

        if($this->form_validation->run() == FALSE)
        {
            $this->index();
        }
        else
        {
            $cpf = $this->security->xss_clean($this->input->post('cpf'));
            $senha = $this->input->post('senha');
            
            $result = $this->login_model->loginMe($cpf, $senha);
            
            if(count($result) > 0)
            {
                foreach ($result as $res)
                {
                  //  $lastLogin = $this->login_model->lastLoginInfo($res->userId);
                    
                    $process = 'Conecte-se';
                    $processFunction = 'Login/loginMe';

                    $sessionArray = array('userId'=>$res->id_acesso,              
                                          'role'=>$res->id_perfil,
                                          'roleText'=>$res->ds_perfil,
                                          'name'=>$res->nome,
                                          'stadmin'=>$res->st_admin,
                                        // 'lastLogin'=> $lastLogin->createdDtm,
                                        //  'status'=> $res->status,
                                          'isLoggedIn' => TRUE
                                    );

                   //var_dump($sessionArray);exit;         

                    $this->session->set_userdata($sessionArray);
                    
                  //  unset($sessionArray['userId'], $sessionArray['isLoggedIn'], $sessionArray['lastLogin']);
                    
              //      $this->logrecord($process,$processFunction);

                    redirect('/dashboard');
                }
            }
            else
            {
                $this->session->set_flashdata('error', 'CPF ou senha incorretos');
                
                redirect('/login');
            }
        }
    }

    /**
     * This function used to load forgot password view
     */
    public function forgotPassword()
    {
        $isLoggedIn = $this->session->userdata('isLoggedIn');
        
        if(!isset($isLoggedIn) || $isLoggedIn != TRUE)
        {
            $this->load->view('forgotPassword');
        }
        else
        {
            redirect('/dashboard');
        }
    }
    
    /**
     * This function used to generate reset password request link
     */
    function resetPasswordUser()
    {
        $status = '';
        
        $this->load->library('form_validation');
        
        $this->form_validation->set_rules('login_email','Email','trim|required|valid_email');
                
        if($this->form_validation->run() == FALSE)
        {
            $this->forgotPassword();
        }
        else 
        {
            $email = $this->security->xss_clean($this->input->post('login_email'));
            
            if($this->login_model->checkEmailExist($email))
            {
                $encoded_email = urlencode($email);
                
                $this->load->helper('string');
                $data['email'] = $email;
                $data['activation_id'] = random_string('alnum',15);
                $data['createdDtm'] = date('Y-m-d H:i:s');
                $data['agent'] = getBrowserAgent();
                $data['client_ip'] = $this->input->ip_address();
                
                $save = $this->login_model->resetPasswordUser($data);                
                
                if($save)
                {
                    $data1['reset_link'] = base_url() . "resetPasswordConfirmUser/" . $data['activation_id'] . "/" . $encoded_email;
                    $userInfo = $this->login_model->getCustomerInfoByEmail($email);

                    if(!empty($userInfo)){
                        $data1["name"] = $userInfo[0]->ds_nome;
                        $data1["email"] = $userInfo[0]->ds_email;
                        $data1["message"] = "Redefina sua senha";
                    }

                    $tmp["data"] = $data1;

                    $mail = new PHPMailer(true);

                    /*$sendStatus = resetPasswordEmail($data1);*/

                    //Server settings
                    $mail->isSMTP();
                    $mail->SMTPDebug = 0;
                    $mail->Host = 'smtp.hostinger.com';
                    $mail->Port = 587;
                    $mail->SMTPAuth = true;
                    $mail->Username = 'sistema@somasustentabilidade.com.br';
                    $mail->Password = '%Soma1234';
                    $mail->setFrom('sistema@somasustentabilidade.com.br', 'SOMA SUSTENTABILIDADE');
                    $mail->addAddress($data1["email"], $data1["name"]);
                    $mail->Subject = 'Redefinir senha';
                    // $mail->msgHTML(file_get_contents('message.html'), __DIR__);
                    $mail->Body = $this->load->view('email/resetPassword', $tmp, TRUE);
                    $mail->isHTML(true);

                    $sendStatus = $mail->send();


                    $process = 'Solicitação de redefinição de senha';
                    $processFunction = 'Login/resetPasswordUser';
                    $this->logrecord($process,$processFunction);

                    if($sendStatus){
                        $status = "send";
                        setFlashData($status, "Seu link de redefinição de senha foi enviado com sucesso. Verifique seu e-mail.");
                    } else {
                        $status = "notsend";
                        setFlashData($status, "E-mail falhou, tente novamente.");
                    }
                }
                else
                {
                    $status = 'unable';
                    setFlashData($status, "Ocorreu um erro ao enviar suas informações, tente novamente.");
                }
            }
            else
            {
                $status = 'invalid';
                setFlashData($status, "Seu endereço de email não está registrado no sistema.");
            }
            redirect('/forgotPassword');
        }
    }

    /**
     * This function used to reset the password 
     * @param string $activation_id : This is unique id
     * @param string $email : This is user email
     */
    function resetPasswordConfirmUser($activation_id, $email)
    {
        // Get email and activation code from URL values at index 3-4
        $email = urldecode($email);
        
        // Check activation id in database
        $is_correct = $this->login_model->checkActivationDetails($email, $activation_id);
        
        $data['email'] = $email;
        $data['activation_code'] = $activation_id;
        
        if ($is_correct)
        {
            $this->load->view('newPassword', $data);
        }
        else
        {
            redirect('/login');
        }
    }
    
    /**
     * This function used to create new password for user
     */
    function createPasswordUser()
    {
        $status = '';
        $message = '';
        $email = $this->input->post("email");
        $activation_id = $this->input->post("activation_code");
        
        $this->load->library('form_validation');
        
        $this->form_validation->set_rules('password','Password','required|max_length[20]');
        $this->form_validation->set_rules('cpassword','Confirm Password','trim|required|matches[password]|max_length[20]');
        
        if($this->form_validation->run() == FALSE)
        {
            $this->resetPasswordConfirmUser($activation_id, urlencode($email));
        }
        else
        {
            $password = $this->input->post('password');
            $cpassword = $this->input->post('cpassword');
            
            // Check activation id in database
            $is_correct = $this->login_model->checkActivationDetails($email, $activation_id);
            
            if($is_correct)
            {               
                $this->login_model->createPasswordUser($email, $password);
                
                $process = 'Redefinição de senha';
                $processFunction = 'Login/createPasswordUser';
                $this->logrecord($process,$processFunction);

                $status = 'success';
                $message = 'Senha mudada com sucesso';
            }
            else
            {
                $status = 'error';
                $message = 'Senha não alterada';
            }
            
            setFlashData($status, $message);

            redirect("/login");
        }
    }
}

?>