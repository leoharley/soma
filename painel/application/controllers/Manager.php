<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';
/**
 * Class : Manager (ManagerController)
 * Manager class to control to authenticate manager credentials and include manager functions.
 * @author : Samet Aydın / sametay153@gmail.com
 * @version : 1.0
 * @since : 27.02.2018
 */
class Manager extends BaseController
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();
        $this->load->model('user_model');
        // Datas -> libraries ->BaseController / This function used load user sessions
        $this->datas();
        // isLoggedIn / Login control function /  This function used login control
        $isLoggedIn = $this->session->userdata('isLoggedIn');
        if(!isset($isLoggedIn) || $isLoggedIn != TRUE)
        {
            redirect('login');
        }
        else
        {
            // isManagerOrAdmin / Admin or manager role control function / This function used admin or manager role control
            if($this->isManagerOrAdmin() == TRUE)
            {
                $this->accesslogincontrol();
            }
        }
    }
        
     /**
     * This function used to show tasks
     */
    function tasks()
    {
            $data['taskRecords'] = $this->user_model->getTasks();

            $process = 'Todas as missões';
            $processFunction = 'Manager/tasks';
            $this->logrecord($process,$processFunction);

            $this->global['pageTitle'] = 'ADMIN : Todas as missões';
            
            $this->loadViews("tasks", $this->global, $data, NULL);
    }

    function atividades()
    {
            $data['atividadesDados'] = $this->user_model->carregaAtividades();

            $process = 'Todas as missões';
            $processFunction = 'Manager/tasks';
         //   $this->logrecord($process,$processFunction);

            $this->global['pageTitle'] = 'ADMIN : Todas as missões';
            
            $this->loadViews("atividades", $this->global, $data, NULL);
    }

    function inscricoes()
    {
            $data['inscricoesDados'] = $this->user_model->carregaInscricoes();

            $process = 'Todas as missões';
            $processFunction = 'Manager/tasks';
         //   $this->logrecord($process,$processFunction);

            $this->global['pageTitle'] = 'ADMIN : Todas as missões';
            
            $this->loadViews("inscricoes", $this->global, $data, NULL);
    }

    function alunos()
    {
            $data['alunosDados'] = $this->user_model->carregaAlunos();

            $process = 'Todas as missões';
            $processFunction = 'Manager/tasks';
         //   $this->logrecord($process,$processFunction);

            $this->global['pageTitle'] = 'ADMIN : Todas as missões';
            
            $this->loadViews("alunos", $this->global, $data, NULL);
    }

    function professores()
    {
            $data['professoresDados'] = $this->user_model->carregaProfessores();

            $process = 'Todas as missões';
            $processFunction = 'Manager/tasks';
         //   $this->logrecord($process,$processFunction);

            $this->global['pageTitle'] = 'ADMIN : Todas as missões';
            
            $this->loadViews("professores", $this->global, $data, NULL);
    }

    function locais()
    {
            $data['locaisDados'] = $this->user_model->carregaLocais();

            $process = 'Todas as missões';
            $processFunction = 'Manager/tasks';
         //   $this->logrecord($process,$processFunction);

            $this->global['pageTitle'] = 'ADMIN : Todas as missões';
            
            $this->loadViews("locais", $this->global, $data, NULL);
    }

    function modalidades()
    {
            $data['modalidadesDados'] = $this->user_model->carregaModalidades();

            $process = 'Todas as missões';
            $processFunction = 'Manager/tasks';
         //   $this->logrecord($process,$processFunction);

            $this->global['pageTitle'] = 'ADMIN : Todas as missões';
            
            $this->loadViews("modalidades", $this->global, $data, NULL);
    }

    function questionario_parq()
    {
            $data['formParqDados'] = $this->user_model->carregaFormParq();

            $process = 'Todas as missões';
            $processFunction = 'Manager/tasks';
         //   $this->logrecord($process,$processFunction);

            $this->global['pageTitle'] = 'ADMIN : Todas as missões';
            
            $this->loadViews("questionario_parq", $this->global, $data, NULL);
    }

    function questionario_whoqol()
    {
    //        $data['formWhoqolDados'] = $this->user_model->carregaFormParq();

            $process = 'Todas as missões';
            $processFunction = 'Manager/tasks';
         //   $this->logrecord($process,$processFunction);

            $this->global['pageTitle'] = 'ADMIN : Todas as missões';
            
            $this->loadViews("questionario_whoqol", $this->global,  NULL);
    }

    function monitoramento()
    {
    //        $data['formWhoqolDados'] = $this->user_model->carregaFormParq();

            $process = 'Todas as missões';
            $processFunction = 'Manager/tasks';
         //   $this->logrecord($process,$processFunction);

            $this->global['pageTitle'] = 'ADMIN : Todas as missões';
            
            $this->loadViews("monitoramento", $this->global,  NULL);
    }

    /**
     * This function is used to load the add new task
     */
    function addNewTask()
    {
            $data['tasks_prioritys'] = $this->user_model->getTasksPrioritys();

            $this->global['pageTitle'] = 'ADMIN : Adicionar tarefa';

            $this->loadViews("addNewTask", $this->global, $data, NULL);
    }

     /**
     * This function is used to add new task to the system
     */
    function addNewTasks()
    {
            $this->load->library('form_validation');
            
            $this->form_validation->set_rules('fname','Görev Başlığı','required');
            $this->form_validation->set_rules('priority','Öncelik','required');
            
            if($this->form_validation->run() == FALSE)
            {
                $this->addNewTask();
            }
            else
            {
                $title = $this->input->post('fname');
                $comment = $this->input->post('comment');
                $priorityId = $this->input->post('priority');
                $statusId = 1;
                $permalink = sef($title);
                
                $taskInfo = array('title'=>$title, 'comment'=>$comment, 'priorityId'=>$priorityId, 'statusId'=> $statusId,
                                    'permalink'=>$permalink, 'createdBy'=>$this->vendorId, 'createdDtm'=>date('Y-m-d H:i:s'));
                                    
                $result = $this->user_model->addNewTasks($taskInfo);
                
                if($result > 0)
                {
                    $process = 'Adicionar tarefa';
                    $processFunction = 'Manager/addNewTasks';
                    $this->logrecord($process,$processFunction);

                    $this->session->set_flashdata('success', 'Tarefa criada com sucesso');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Falha na criação da tarefa');
                }
                
                redirect('addNewTask');
            }
        }

    /**
     * This function is used to open edit tasks view
     */
    function editOldTask($taskId = NULL)
    {
            if($taskId == null)
            {
                redirect('tasks');
            }
            
            $data['taskInfo'] = 0;

        /*    $data['taskInfo'] = $this->user_model->getTaskInfo($taskId);
            $data['tasks_prioritys'] = $this->user_model->getTasksPrioritys();
            $data['tasks_situations'] = $this->user_model->getTasksSituations(); */
            
            $this->global['pageTitle'] = 'ADMIN : Editar Tarefa';
            
            $this->loadViews("editOldTask", $this->global, $data, NULL);
    }

    /**
     * This function is used to edit tasks
     */
    function editTask()
    {            
        $this->load->library('form_validation');

        $this->form_validation->set_rules('fname','Título da tarefa','required');
        $this->form_validation->set_rules('priority','Prioridade','required');
        
        $taskId = $this->input->post('taskId');

        if($this->form_validation->run() == FALSE)
        {
            $this->editOldTask($taskId);
        }
        else
        {
            $taskId = $this->input->post('taskId');
            $title = $this->input->post('fname');
            $comment = $this->input->post('comment');
            $priorityId = $this->input->post('priority');
            $statusId = $this->input->post('status');
            $permalink = sef($title);
            
            $taskInfo = array('title'=>$title, 'comment'=>$comment, 'priorityId'=>$priorityId, 'statusId'=> $statusId,
                                'permalink'=>$permalink);
                                
            $result = $this->user_model->editTask($taskInfo,$taskId);
            
            if($result > 0)
            {
                $process = 'Edição de tarefas';
                $processFunction = 'Manager/editTask';
                $this->logrecord($process,$processFunction);
                $this->session->set_flashdata('success', 'Edição de tarefas bem-sucedida');
            }
            else
            {
                $this->session->set_flashdata('error', 'Falha na edição da tarefa');
            }
            redirect('tasks');

            }
    }

    /**
     * This function is used to delete tasks
     */
    function deleteTask($taskId = NULL)
    {
        if($taskId == null)
            {
                redirect('tasks');
            }

            $result = $this->user_model->deleteTask($taskId);
            
            if ($result == TRUE) {
                 $process = 'Excluir uma tarefa';
                 $processFunction = 'Manager/deleteTask';
                 $this->logrecord($process,$processFunction);

                 $this->session->set_flashdata('success', 'A exclusão da tarefa foi bem-sucedida');
                }
            else
            {
                $this->session->set_flashdata('error', 'Falha na exclusão da tarefa');
            }
            redirect('tasks');
    }

}