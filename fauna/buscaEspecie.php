<?php
function getFilterEspecie($genero){
	$pdo = new PDO("mysql:host=localhost; dbname=u699148595_inventario_hom;", "u699148595_u699148595_som", "5;K+5qbi");
	//$sql = "SELECT nome FROM tb_fauna WHERE id = ?";
	

	$sql = "SELECT ";
	$sql .= "	distinct e.nome, e.id, e.no_popular, e.no_cientifico";
	$sql .= " FROM ";
	$sql .= "	tb_fauna a, tb_fauna_familia f, tb_fauna_genero g, tb_fauna_especie e ";
	$sql .= " WHERE ";
	$sql .= "	a.id_familia = f.id AND ";
	$sql .= "    a.id_genero = g.id AND ";
	$sql .= "    a.id_especie = e.id AND 	";
	$sql .= "    a.id_genero = ? ";
	$sql .= " ORDER BY f.nome, g.nome, e.nome"	;

//print_r($sql);	
	
	$stm = $pdo->prepare($sql);
	$stm->bindValue(1, $genero);
	$stm->execute();
	sleep(1);
	echo json_encode($stm->fetchAll(PDO::FETCH_ASSOC));
	$pdo = null;
}

if(isset($_POST["genero"])){
	$genero = $_POST["genero"];
	//var_dump($genero);
	getFilterEspecie($genero);	
}

?>