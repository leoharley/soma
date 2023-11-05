<?php
$response = array();
include 'db/db_connect.php';
include 'functions.php';
 
//Get the input request parameters
$inputJSON = file_get_contents('php://input');
$input = json_decode($inputJSON, TRUE); //convert JSON into array
 
//Check for Mandatory parameters
			 
$query    = "SELECT FaunaClassificacao.id, FaunaClassificacao.nome, resultados.totais as contador
			 FROM tb_fauna_classificacao as FaunaClassificacao
			 LEFT JOIN (SELECT COUNT(*) AS totais, 0 AS Bonus
			 FROM tb_fauna_classificacao
			 WHERE st_registro_ativo = 'S'
			 GROUP BY NULL) resultados
			 ON 0 = resultados.Bonus
			 WHERE FaunaClassificacao.st_registro_ativo = 'S'";
 
if($stmt = $con->prepare($query)){
	$stmt->execute();
	$response = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
	$stmt->close();
}

//Display the JSON response
echo json_encode($response);
?>