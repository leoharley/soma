<?php
function getFilterFamilia(){
	$pdo = new PDO("mysql:host=localhost; dbname=u699148595_inventario_hom;", "u699148595_u699148595_som", "5;K+5qbi");
	$sql = "SELECT distinct nome,id from tb_flora_familia";
	$stm = $pdo->prepare($sql);
	$stm->execute();
	sleep(1);
	echo json_encode($stm->fetchAll(PDO::FETCH_ASSOC));
	$pdo = null;
}
getFilterFamilia();
?>