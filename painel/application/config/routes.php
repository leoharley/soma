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
$route['consultaEspecie/:any'] = "principal/consultaEspecie/$1";

$route['consultaGeneroFauna/:any'] = "principal/consultaGeneroFauna/$1";
$route['consultaEspecieFauna/:any'] = "principal/consultaEspecieFauna/$1";


/*********** ROUTES DO GRUPO SELEÇÕES *******************/
$route['selecaoFaunaClassificacao/:any/:any'] = "selecao/selecaoFaunaClassificacao/$1/$2";
$route['selecaoFaunaClassificacao/:any'] = "selecao/selecaoFaunaClassificacao/$1";

$route['selecaoTipoParcela/:any/:any'] = "selecao/selecaoTipoParcela/$1/$2";
$route['selecaoTipoParcela/:any'] = "selecao/selecaoTipoParcela/$1";

$route['selecaoTipoBioma/:any/:any'] = "selecao/selecaoTipoBioma/$1/$2";
$route['selecaoTipoBioma/:any'] = "selecao/selecaoTipoBioma/$1";

$route['selecaoGrauEpifitismo/:any/:any'] = "selecao/selecaoGrauEpifitismo/$1/$2";
$route['selecaoGrauEpifitismo/:any'] = "selecao/selecaoGrauEpifitismo/$1";

$route['selecaoEstagioRegeneracao/:any/:any'] = "selecao/selecaoEstagioRegeneracao/$1/$2";
$route['selecaoEstagioRegeneracao/:any'] = "selecao/selecaoEstagioRegeneracao/$1";

$route['selecaoGrauProtecao/:any/:any'] = "selecao/selecaoGrauProtecao/$1/$2";
$route['selecaoGrauProtecao/:any'] = "selecao/selecaoGrauProtecao/$1";

$route['selecaoFaunaTipoObservacao/:any/:any'] = "selecao/selecaoFaunaTipoObservacao/$1/$2";
$route['selecaoFaunaTipoObservacao/:any'] = "selecao/selecaoFaunaTipoObservacao/$1";


/*********** ROUTES PARA AÇÕES DA TELA FAUNA CLASSIFICAÇÃO *******************/
$route['adicionaFaunaClassificacao'] = "selecao/adicionaFaunaClassificacao";
$route['editaFaunaClassificacao'] = "selecao/editaFaunaClassificacao";
$route['apagaFaunaClassificacao/:any'] = "selecao/apagaFaunaClassificacao/$1";

/*********** ROUTES PARA AÇÕES DA TELA TIPO PARCELA *******************/
$route['adicionaTipoParcela'] = "selecao/adicionaTipoParcela";
$route['editaTipoParcela'] = "selecao/editaTipoParcela";
$route['apagaTipoParcela/:any'] = "selecao/apagaTipoParcela/$1";

/*********** ROUTES PARA AÇÕES DA TELA TIPO BIOMA *******************/
$route['adicionaTipoBioma'] = "selecao/adicionaTipoBioma";
$route['editaTipoBioma'] = "selecao/editaTipoBioma";
$route['apagaTipoBioma/:any'] = "selecao/apagaTipoBioma/$1";

/*********** ROUTES PARA AÇÕES DA TELA GRAU EPIFITISMO *******************/
$route['adicionaGrauEpifitismo'] = "selecao/adicionaGrauEpifitismo";
$route['editaGrauEpifitismo'] = "selecao/editaGrauEpifitismo";
$route['apagaGrauEpifitismo/:any'] = "selecao/apagaGrauEpifitismo/$1";

/*********** ROUTES PARA AÇÕES DA TELA ESTAGIO REGENERAÇÃO *******************/
$route['adicionaEstagioRegeneracao'] = "selecao/adicionaEstagioRegeneracao";
$route['editaEstagioRegeneracao'] = "selecao/editaEstagioRegeneracao";
$route['apagaEstagioRegeneracao/:any'] = "selecao/apagaEstagioRegeneracao/$1";

/*********** ROUTES PARA AÇÕES DA TELA GRAU PROTEÇÃO *******************/
$route['adicionaGrauProtecao'] = "selecao/adicionaGrauProtecao";
$route['editaGrauProtecao'] = "selecao/editaGrauProtecao";
$route['apagaGrauProtecao/:any'] = "selecao/apagaGrauProtecao/$1";

/*********** ROUTES PARA AÇÕES DA TELA FAUNA TIPO OBSERVAÇÃO *******************/
$route['adicionaFaunaTipoObservacao'] = "selecao/adicionaFaunaTipoObservacao";
$route['editaFaunaTipoObservacao'] = "selecao/editaFaunaTipoObservacao";
$route['apagaFaunaTipoObservacao/:any'] = "selecao/apagaFaunaTipoObservacao/$1";


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

$route['admin/(:any)/(:any)'] = 'admin/index/$1/$2';

/* End of file routes.php */
/* Location: ./application/config/routes.php */