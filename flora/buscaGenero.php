<?php
function getFilterGenero($familia){
	$pdo = new PDO("mysql:host=localhost; dbname=u699148595_inventario_hom;", "u699148595_u699148595_som", "5;K+5qbi");
	//$sql = "SELECT nome FROM tb_flora WHERE id = ?";
	

	$sql = "SELECT ";
	$sql .= "	distinct g.nome, g.id";
	$sql .= " FROM ";
	$sql .= "	tb_flora a, tb_flora_familia f, tb_flora_genero g, tb_flora_especie e ";
	$sql .= " WHERE ";
	$sql .= "	a.id_familia = f.id AND ";
	$sql .= "    a.id_genero = g.id AND ";
	$sql .= "    a.id_especie = e.id AND 	";
	$sql .= "    a.id_familia = ? ";
	$sql .= " ORDER BY f.nome, g.nome, e.nome"	;

//print_r($sql);	
	
	$stm = $pdo->prepare($sql);
	$stm->bindValue(1, $familia);
	$stm->execute();
	sleep(1);
	echo json_encode($stm->fetchAll(PDO::FETCH_ASSOC));
	$pdo = null;
}

if(isset($_POST["familia"])){
	$familia = $_POST["familia"];
	//var_dump($familia);
	getFilterGenero($familia);	
}

?>