<?php
$response = array();
include 'db/db_connect.php';
include 'functions.php';
 
//Get the input request parameters
$inputJSON = file_get_contents('php://input');
$input = json_decode($inputJSON, TRUE); //convert JSON into array
 
//Check for Mandatory parameters

$query    = "SELECT Parcelas.id, Propriedades.no_propriedade 
			 FROM tb_parcelas as Parcelas 
			 INNER JOIN tb_propriedades as Propriedades on Propriedades.id = Parcelas.id_propriedade 
			 and Propriedades.st_registro_ativo = 'S'
			 WHERE Parcelas.st_registro_ativo = 'S'";
 
if($stmt = $con->prepare($query)){
	$stmt->execute();
	$response = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
	$stmt->close();
}

//Display the JSON response
echo json_encode($response);
?>