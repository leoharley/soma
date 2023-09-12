<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class Login_model extends CI_Model
{
    
    /**
     * This function used to check the login credentials of the user
     * @param string $email : This is email of the user
     * @param string $password : This is encrypted password of the user
     */
    function loginMe($usuario, $senha)
    {
        $this->db->select('cadpessoa.co_seq_cadastro_pessoa as id_usuario, acesso.co_seq_acesso as id_acesso, acesso.ds_senha as senha, cadpessoa.ds_nome as nome,
        perfil.id_perfil, perfil.ds_perfil');
        $this->db->from('tb_cadastro_pessoa as cadpessoa');
        $this->db->join('tb_acesso as acesso','acesso.co_seq_acesso = cadpessoa.id_acesso');
        $this->db->join('tb_perfil as perfil','perfil.id_perfil = cadpessoa.id_perfil');
        $this->db->where('cadpessoa.nu_cpf', $usuario);
        $this->db->where('acesso.st_registro_ativo', 'S');
        $this->db->where('cadpessoa.st_registro_ativo', 'S');
        $query = $this->db->get();
        
        $usuario = $query->result();
        
        if(!empty($usuario)){
            if(verifyHashedPassword($senha,$usuario[0]->senha)){
                return $usuario;
            } else {
                return array();
            }
        } else {
            return array();
        }
    }

    /**
     * This function used to check email exists or not
     * @param {string} $email : This is users email id
     * @return {boolean} $result : TRUE/FALSE
     */
    function checkEmailExist($email)
    {
        $this->db->select('co_seq_cadastro_pessoa');
        $this->db->where('ds_email', $email);
        $this->db->where('st_registro_ativo', 'S');
        $query = $this->db->get('tb_cadastro_pessoa');

        if ($query->num_rows() > 0){
            return true;
        } else {
            return false;
        }
    }


    /**
     * This function used to insert reset password data
     * @param {array} $data : This is reset password data
     * @return {boolean} $result : TRUE/FALSE
     */
    function resetPasswordUser($data)
    {
        $result = $this->db->insert('tb_reset_password', $data);

        if($result) {
            return TRUE;
        } else {
            return FALSE;
        }
    }

    /**
     * This function is used to get customer information by email-id for forget password email
     * @param string $email : Email id of customer
     * @return object $result : Information of customer
     */
    function getCustomerInfoByEmail($email)
    {
        $this->db->select('co_seq_cadastro_pessoa, ds_email, ds_nome');
        $this->db->from('tb_cadastro_pessoa');
        $this->db->where('st_registro_ativo', 'S');
        $this->db->where('ds_email', $email);
        $query = $this->db->get();

        return $query->result();
    }

    /**
     * This function used to check correct activation deatails for forget password.
     * @param string $email : Email id of user
     * @param string $activation_id : This is activation string
     */
    function checkActivationDetails($email, $activation_id)
    {
        $this->db->select('id');
        $this->db->from('tb_reset_password');
        $this->db->where('email', $email);
        $this->db->where('activation_id', $activation_id);
        $query = $this->db->get();
        var_dump($this->db->last_query());exit;

        return $query->num_rows;
    }

    // This function used to create new password by reset link
    function createPasswordUser($email, $password)
    {
        $this->db->where('co_seq_acesso', $this->carregaInfoIdAcesso($email)[0]->id_acesso);
        $this->db->where('st_registro_ativo', 'S');
        $this->db->update('tb_acesso', array('password'=>getHashedPassword($password)));
        $this->db->delete('tb_reset_password', array('email'=>$email));
    }

    function carregaInfoIdAcesso($email)
    {
        $this->db->select('id_acesso');
        $this->db->from('tb_cadastro_pessoa');
        $this->db->where('ds_email', $email);
        $query = $this->db->get();
        
        return $query->result();
    }

    /**
     * This function used to save login information of user
     * @param array $loginInfo : This is users login information
     */
    function loginsert($logInfo)
    {
        $this->db->trans_start();
        $this->db->insert('tb_log', $logInfo);
        $this->db->trans_complete();
    }

    /**
     * This function is used to get last login info by user id
     * @param number $userId : This is user id
     * @return number $result : This is query result
     */
    function lastLoginInfo($userId)
    {
        $this->db->select('BaseTbl.createdDtm');
        $this->db->where('BaseTbl.userId', $userId);
        $this->db->order_by('BaseTbl.id', 'DESC');
        $this->db->limit(1);
        $query = $this->db->get('tbl_log as BaseTbl');

        return $query->row();
    }
}

?>