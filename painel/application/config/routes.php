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

$route['principalProjeto/:any/:any'] = "principal/principalProjeto/$1/$2";
$route['principalProjeto/:any'] = "principal/principalProjeto/$1";

$route['principalPropriedade/:any/:any'] = "principal/principalPropriedade/$1/$2";
$route['principalPropriedade/:any'] = "principal/principalPropriedade/$1";

$route['principalParcela/:any/:any'] = "principal/principalParcela/$1/$2";
$route['principalParcela/:any'] = "principal/principalParcela/$1";

$route['principalArvoreViva/:any/:any'] = "principal/principalArvoreViva/$1/$2";
$route['principalArvoreViva/:any'] = "principal/principalArvoreViva/$1";

$route['principalAnimal/:any/:any'] = "principal/principalAnimal/$1/$2";
$route['principalAnimal/:any'] = "principal/principalAnimal/$1";

$route['principalEpifita/:any/:any'] = "principal/principalEpifita/$1/$2";
$route['principalEpifita/:any'] = "principal/principalEpifita/$1";

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
$route['adicionaProjeto'] = "principal/adicionaProjeto";
$route['editaProjeto'] = "principal/editaProjeto";
$route['apagaProjeto/:any'] = "principal/apagaProjeto/$1";

/*********** ROUTES PARA AÇÕES DA TELA PROPRIEDADES *******************/
$route['adicionaPropriedade'] = "principal/adicionaPropriedade";
$route['editaPropriedade'] = "principal/editaPropriedade";
$route['apagaPropriedade/:any'] = "principal/apagaPropriedade/$1";

/*********** ROUTES PARA AÇÕES DA TELA PARCELAS *******************/
$route['adicionaParcela'] = "principal/adicionaParcela";
$route['editaParcela'] = "principal/editaParcela";
$route['apagaParcela/:any'] = "principal/apagaParcela/$1";

/*********** ROUTES PARA AÇÕES DA TELA ÁRVORES VIVAS *******************/
$route['adicionaArvoreViva'] = "principal/adicionaArvoreViva";
$route['editaArvoreViva'] = "principal/editaArvoreViva";
$route['apagaArvoreViva/:any'] = "principal/apagaArvoreViva/$1";

/*********** ROUTES PARA AÇÕES DA TELA ANIMAIS *******************/
$route['adicionaAnimal'] = "principal/adicionaAnimal";
$route['editaAnimal'] = "principal/editaAnimal";
$route['apagaAnimal/:any'] = "principal/apagaAnimal/$1";

/*********** ROUTES PARA AÇÕES DA TELA EPIFITAS *******************/
$route['adicionaEpifita'] = "principal/adicionaEpifita";
$route['editaEpifita'] = "principal/editaEpifita";
$route['apagaEpifita/:any'] = "principal/apagaEpifita/$1";


$route['consultaGenero/:any'] = "principal/consultaGenero/$1";


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