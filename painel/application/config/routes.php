<?php
defined('BASEPATH') OR exit('No direct script access allowed');


$route['default_controller'] = "login";
$route['404_override'] = 'login/error';

$route['cadastroUsuario/:any/:any'] = "cadastro/cadastroUsuario/$1/$2";
$route['cadastroUsuario/:any'] = "cadastro/cadastroUsuario/$1";

$route['cadastroPermissao/:any/:any'] = "cadastro/cadastroPermissao/$1/$2";
$route['cadastroPermissao/:any'] = "cadastro/cadastroPermissao/$1";

$route['cadastroPerfil/:any/:any'] = "cadastro/cadastroPerfil/$1/$2";
$route['cadastroPerfil/:any'] = "cadastro/cadastroPerfil/$1";

$route['cadastroProjeto/:any/:any'] = "cadastro/cadastroProjeto/$1/$2";
$route['cadastroProjeto/:any'] = "cadastro/cadastroProjeto/$1";

$route['cadastroPropriedade/:any/:any'] = "cadastro/cadastroPropriedade/$1/$2";
$route['cadastroPropriedade/:any'] = "cadastro/cadastroPropriedade/$1";

$route['cadastroParcela/:any/:any'] = "cadastro/cadastroParcela/$1/$2";
$route['cadastroParcela/:any'] = "cadastro/cadastroParcela/$1";

$route['cadastroFlora/:any/:any'] = "cadastro/cadastroFlora/$1/$2";
$route['cadastroFlora/:any'] = "cadastro/cadastroFlora/$1";

$route['cadastroFauna/:any/:any'] = "cadastro/cadastroFauna/$1/$2";
$route['cadastroFauna/:any'] = "cadastro/cadastroFauna/$1";

$route['cadastroEpiteta/:any/:any'] = "cadastro/cadastroEpiteta/$1/$2";
$route['cadastroEpiteta/:any'] = "cadastro/cadastroEpiteta/$1";

$route['relatorioLogs/listar'] = "admin/logHistory";

/*********** ROUTES PARA AÇÕES DA TELA USUÁRIO *******************/
$route['adicionaUsuario'] = "cadastro/adicionaUsuario";
$route['editaUsuario'] = "cadastro/editaUsuario";
$route['apagaUsuario/:any'] = "cadastro/apagaUsuario/$1";

/*********** ROUTES PARA AÇÕES DA TELA PERFIL *******************/
$route['adicionaPerfil'] = "cadastro/adicionaPerfil";
$route['editaPerfil'] = "cadastro/editaPerfil";
$route['apagaPerfil/:any'] = "cadastro/apagaPerfil/$1";

/*********** ROUTES PARA AÇÕES DA TELA PERMISSAO *******************/
$route['editaPermissao'] = "cadastro/editaPermissao";


/*********** ROUTES PARA AÇÕES DA TELA PROJETOS *******************/
$route['adicionaProjeto'] = "cadastro/adicionaProjeto";
$route['editaProjeto'] = "cadastro/editaProjeto";
$route['apagaProjeto/:any'] = "cadastro/apagaProjeto/$1";

/*********** ROUTES PARA AÇÕES DA TELA PROPRIEDADES *******************/
$route['adicionaPropriedade'] = "cadastro/adicionaPropriedade";
$route['editaPropriedade'] = "cadastro/editaPropriedade";
$route['apagaPropriedade/:any'] = "cadastro/apagaPropriedade/$1";

/*********** ROUTES PARA AÇÕES DA TELA PARCELAS *******************/
$route['adicionaParcela'] = "cadastro/adicionaParcela";
$route['editaParcela'] = "cadastro/editaParcela";
$route['apagaParcela/:any'] = "cadastro/apagaParcela/$1";

/*********** ROUTES PARA AÇÕES DA TELA FLORA *******************/
$route['adicionaFlora'] = "cadastro/adicionaFlora";
$route['editaFlora'] = "cadastro/editaFlora";
$route['apagaFlora/:any'] = "cadastro/apagaFlora/$1";

/*********** ROUTES PARA AÇÕES DA TELA FAUNA *******************/
$route['adicionaFauna'] = "cadastro/adicionaFauna";
$route['editaFauna'] = "cadastro/editaFauna";
$route['apagaFauna/:any'] = "cadastro/apagaFauna/$1";

/*********** ROUTES PARA AÇÕES DA TELA EPITETAS *******************/
$route['adicionaEpiteta'] = "cadastro/adicionaEpiteta";
$route['editaEpiteta'] = "cadastro/editaEpiteta";
$route['apagaEpiteta/:any'] = "cadastro/apagaEpiteta/$1";



/*********** USER DEFINED ROUTES *******************/

$route['loginMe'] = 'login/loginMe';
$route['dashboard'] = 'user';
$route['logout'] = 'user/logout';

/*********** ADMIN CONTROLLER ROUTES *******************/
$route['noaccess'] = 'login/noaccess';
$route['userListing'] = 'admin/userListing';
$route['userListing/(:num)'] = "admin/userListing/$1";
$route['addNew'] = "admin/addNew";
$route['addNewUser'] = "admin/addNewUser";
$route['editOld'] = "admin/editOld";
$route['editOld/(:num)'] = "admin/editOld/$1";
$route['editUser'] = "admin/editUser";
$route['deleteUser'] = "admin/deleteUser";
$route['log-history'] = "admin/logHistory";
$route['log-history-backup'] = "admin/logHistoryBackup";
$route['log-history/(:num)'] = "admin/logHistorysingle/$1";
$route['log-history/(:num)/(:num)'] = "admin/logHistorysingle/$1/$2";
$route['backupLogTable'] = "admin/backupLogTable";
$route['backupLogTableDelete'] = "admin/backupLogTableDelete";
$route['log-history-upload'] = "admin/logHistoryUpload";
$route['logHistoryUploadFile'] = "admin/logHistoryUploadFile";

/*********** MANAGER CONTROLLER ROUTES *******************/
$route['tasks'] = "manager/tasks";
$route['atividades'] = "manager/atividades";
$route['inscricoes'] = "manager/inscricoes";
$route['alunos'] = "manager/alunos";
$route['professores'] = "manager/professores";
$route['locais'] = "manager/locais";
$route['modalidades'] = "manager/modalidades";
$route['questionario_parq'] = "manager/questionario_parq";
$route['questionario_whoqol'] = "manager/questionario_whoqol";
$route['monitoramento'] = "manager/monitoramento";

$route['addNewTask'] = "manager/addNewTask";
$route['addNewTasks'] = "manager/addNewTasks";
$route['editOldTask/(:num)'] = "manager/editOldTask/$1";
$route['editTask'] = "manager/editTask";
$route['deleteTask/(:num)'] = "manager/deleteTask/$1";

/*********** USER CONTROLLER ROUTES *******************/
$route['loadChangePass'] = "user/loadChangePass";
$route['changePassword'] = "user/changePassword";
$route['pageNotFound'] = "user/pageNotFound";
$route['checkEmailExists'] = "user/checkEmailExists";
$route['endTask/(:num)'] = "user/endTask/$1";
$route['etasks'] = "user/etasks";
$route['userEdit'] = "user/loadUserEdit";
$route['updateUser'] = "user/updateUser";


/*********** LOGIN CONTROLLER ROUTES *******************/
$route['forgotPassword'] = "login/forgotPassword";
$route['resetPasswordUser'] = "login/resetPasswordUser";
$route['resetPasswordConfirmUser'] = "login/resetPasswordConfirmUser";
$route['resetPasswordConfirmUser/(:any)'] = "login/resetPasswordConfirmUser/$1";
$route['resetPasswordConfirmUser/(:any)/(:any)'] = "login/resetPasswordConfirmUser/$1/$2";
$route['createPasswordUser'] = "login/createPasswordUser";

/* End of file routes.php */
/* Location: ./application/config/routes.php */