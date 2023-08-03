<?php
function getFilterFamilia(){
	$pdo = new PDO("mysql:host=127.0.0.1; dbname=soma;", "root", "");
	$sql = "SELECT distinct nome,id from tb_fauna_familia";
	$stm = $pdo->prepare($sql);
	$stm->execute();
	sleep(1);
	echo json_encode($stm->fetchAll(PDO::FETCH_ASSOC));
	$pdo = null;
}
getFilterFamilia();
?>