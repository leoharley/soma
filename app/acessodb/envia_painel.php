<?php
$response = array();
include 'db/db_connect.php';
include 'functions.php';
 
//Get the input request parameters
$inputJSON = file_get_contents('php://input');
$input = json_decode($inputJSON, TRUE); //convert JSON into array
 
//Check for Mandatory parameters
if(isset($input['registroanimais'])){
	$registroanimais = $input['registroanimais'];
		
	//Query to register new user
	$insertQuery  = "INSERT INTO teste_envia_painel(descricao) VALUES (?)";
	if($stmt = $con->prepare($insertQuery)){
		$stmt->bind_param("ssss",$registroanimais[0]->id);
		$stmt->execute();
		$response["status"] = 0;
		$response["message"] = "Registro animais adicionado";
		$stmt->close();
	}

}
else{
	$response["status"] = 2;
	$response["message"] = "Faltando parâmetros obrigatórios";
}
echo json_encode($response);
?>