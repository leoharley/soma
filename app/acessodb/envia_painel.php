<?php
$response = array();
include 'db/db_connect.php';
include 'functions.php';
 
//Get the input request parameters
$inputJSON = file_get_contents('php://input');
$input = json_decode($inputJSON, TRUE); //convert JSON into array

if (isset($input['dscategoria']) {
	
	if ($input['dscategoria'] == 'animais') {
	//Check for Mandatory parameters
		if(isset($input['idcontroleanimais']) && isset($input['idparcelaanimais'])
		&& isset($input['idacesso']) && isset($input['idtpobservacao'])
		&& isset($input['idclassificacao']) && isset($input['idgrauprotecao'])
		&& isset($input['latitudecampogd']) && isset($input['longitudecampogd'])
		){

			//Query to register new user
			$insertQuery  = "INSERT INTO tb_animais(id,id_parcela,id_acesso) VALUES (?,?,?)";
			if($stmt = $con->prepare($insertQuery)){
				$stmt->bind_param("sss",$input['idcontroleanimais'],strtok($input['idparcelaanimais'], '-'),$input['idacesso']);
				$stmt->execute();
				$response["status"] = 0;
				$response["message"] = "Registro animais adicionado";
				$stmt->close();
			}

		}
	}
}

else{
	$response["status"] = 2;
	$response["message"] = "Faltando parâmetros obrigatórios";
}
echo json_encode($response);
?>