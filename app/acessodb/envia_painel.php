<?php
$response = array();
include 'db/db_connect.php';
include 'functions.php';
 
//Get the input request parameters
$inputJSON = file_get_contents('php://input');
$input = json_decode($inputJSON, TRUE); //convert JSON into array

$latitudecampogd  = $input['latitudecampogd'];
$longitudecampogd = $input['longitudecampogd'];
$result = explode(" ",DDtoDMS_string($latitudecampogd,$longitudecampogd));
	

if ($input['dscategoria'] == 'animais') {
	//	$input['latitudecampogd'] e $input['longitudecampogd']//AQUI SERGIONE, PEGA OS CAMPOS QUE VEM DO APP, TRANSFORMA AQUI PRA GMS E JOGA NOS CAMPOS DE GMS NO PAINEL
	
	$insertQuery  = "DELETE FROM tb_animais WHERE id_acesso=".$input['idacesso'];
	if($stmt = $con->prepare($insertQuery)){
		$stmt->execute();
		$response["status"] = 0;
		$response["message"] = "Enviado com sucesso!";
		$stmt->close();
	}
	
	$insertQuery  = "REPLACE INTO tb_animais(id,id_parcela,id_acesso,id_tipo_observacao,id_classificacao,id_grau_protecao,latitude_campo_gd,longitude_campo_gd,latitude_campo_gms,longitude_campo_gms) VALUES (?,?,?,?,?,?,?,?,?,?)";
	if($stmt = $con->prepare($insertQuery)){
		$stmt->bind_param("ssssssssss",$input['idcontroleanimais'],strtok($input['idparcelaanimais'], '-'),$input['idacesso'],strtok($input['idtpobservacao'], '-'),strtok($input['idclassificacao'], '-'),strtok($input['idgrauprotecao'], '-'),$input['latitudecampogd'] ,$input['longitudecampogd'],$result[0],$result[1]);
		$stmt->execute();
		$response["status"] = 0;
		
		$response["message"] = "Enviado com sucesso!";
		$stmt->close();
	}
	
	$insertQuery  = "REPLACE INTO rl_fauna_familia_genero_especie(id_animais,id_familia,id_genero,id_especie) VALUES (?,?,?,?)";
	if($stmt = $con->prepare($insertQuery)){
		$stmt->bind_param("ssss",$input['idcontroleanimais'],strtok($input['idfamilia'], '-'),strtok($input['idgenero'], '-'),strtok($input['idespecie'], '-'));
		$stmt->execute();
		$response["status"] = 0;
		
		$response["message"] = "Enviado com sucesso!";
		$stmt->close();
	}
	
} else if ($input['dscategoria'] == 'arvoresvivas') {
	
	$insertQuery  = "DELETE FROM tb_arvores_vivas WHERE id_acesso=".$input['idacesso'];
	if($stmt = $con->prepare($insertQuery)){
		$stmt->execute();
		$response["status"] = 0;
		$response["message"] = "Enviado com sucesso!";
		$stmt->close();
	}
	
    $insertQuery  = "REPLACE INTO tb_arvores_vivas(id,id_parcela,id_acesso,id_grau_protecao,latitude_campo_gd,longitude_campo_gd,nu_biomassa,identificacao,nu_circunferencia,nu_altura,nu_altura_total,nu_altura_fuste,nu_altura_copa,isolada,floracao_frutificacao,latitude_campo_gms,longitude_campo_gms) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	if($stmt = $con->prepare($insertQuery)){
		$stmt->bind_param("sssssssssssssssss",$input['idcontrolearvoresvivas'],strtok($input['idparcelaarvoresvivas'], '-'),$input['idacesso'],strtok($input['idgrauprotecao'], '-'),$input['latitudecampogd'],$input['longitudecampogd'],$input['nubiomassa'],$input['identificacao'],$input['nucircunferencia'],$input['nualtura'],$input['nualturatotal'],$input['nualturafuste'],$input['nualturacopa'],$input['isolada'],$input['floracaofrutificacao'],$result[0],$result[1]);
		$stmt->execute();
		$response["status"] = 0;
		
		$response["message"] = "Enviado com sucesso!";
		$stmt->close();
	}
	
	$insertQuery  = "REPLACE INTO rl_flora_familia_genero_especie(id_arvores_vivas,id_familia,id_genero,id_especie) VALUES (?,?,?,?)";
	if($stmt = $con->prepare($insertQuery)){
		$stmt->bind_param("ssss",$input['idcontrolearvoresvivas'],strtok($input['idfamilia'], '-'),strtok($input['idgenero'], '-'),strtok($input['idespecie'], '-'));
		$stmt->execute();
		$response["status"] = 0;
		
		$response["message"] = "Enviado com sucesso!";
		$stmt->close();
	}
	
} else if ($input['dscategoria'] == 'epifitas') {
	$insertQuery  = "DELETE FROM tb_epifitas WHERE id_acesso=".$input['idacesso'];
	if($stmt = $con->prepare($insertQuery)){
		$stmt->execute();
		$response["status"] = 0;
		$response["message"] = "Enviado com sucesso!";
		$stmt->close();
	}
	
    $insertQuery  = "REPLACE INTO tb_epifitas(id,id_acesso,id_parcela,latitude_campo_gd,longitude_campo_gd,latitude_campo_gms,longitude_campo_gms) VALUES (?,?,?,?,?,?,?)";
	if($stmt = $con->prepare($insertQuery)){
		$stmt->bind_param("sssssss",$input['idcontroleepifitas'],$input['idacesso'],strtok($input['idparcelaepifitas'], '-'),$input['latitudecampogd'],$input['longitudecampogd'],$result[0],$result[1]);
		$stmt->execute();
		$response["status"] = 0;
		
		$response["message"] = "Enviado com sucesso!";
		$stmt->close();
	}
	
	$insertQuery  = "REPLACE INTO rl_epifitas_familia_genero_especie(id_epifitas,id_familia,id_genero,id_especie) VALUES (?,?,?,?)";
	if($stmt = $con->prepare($insertQuery)){
		$stmt->bind_param("ssss",$input['idcontroleepifitas'],strtok($input['idfamilia'], '-'),strtok($input['idgenero'], '-'),strtok($input['idespecie'], '-'));
		$stmt->execute();
		$response["status"] = 0;
		
		$response["message"] = "Enviado com sucesso!";
		$stmt->close();
	}

} else if ($input['dscategoria'] == 'hidrologia') {
	$insertQuery  = "DELETE FROM tb_hidrologia WHERE id_acesso=".$input['idacesso'];
	if($stmt = $con->prepare($insertQuery)){
		$stmt->execute();
		$response["status"] = 0;
		$response["message"] = "Enviado com sucesso!";
		$stmt->close();
	}
	
    $insertQuery  = "REPLACE INTO tb_hidrologia(id,id_parcela,id_acesso,descricao,latitude_campo_gd,longitude_campo_gd,latitude_campo_gms,longitude_campo_gms) VALUES (?,?,?,?,?,?,?,?)";
	if($stmt = $con->prepare($insertQuery)){
		$stmt->bind_param("ssssssss",$input['idcontrolehidrologia'],strtok($input['idparcelahidrologia'], '-'),$input['idacesso'],$input['descricao'],$input['latitudecampogd'],$input['longitudecampogd'],$result[0],$result[1]);
		$stmt->execute();
		$response["status"] = 0;
		
		$response["message"] = "Enviado com sucesso!";
		$stmt->close();
	}

} else if ($input['dscategoria'] == 'infoarquivo') {
    $insertQuery  = "INSERT INTO photos(name,ds_categoria,id_categoria,description,date,link,link_thumb,id_acesso) VALUES (?,?,?,?,?,?,?,?)";
	if($stmt = $con->prepare($insertQuery)){
		$stmt->bind_param("ssssssss",$input['name'],$input['dscategoriatabela'],$input['idcategoria'],$input['description'],$input['date'],$input['link'],$input['linkthumb'],$input['idacesso']);
		$stmt->execute();
		$response["status"] = 0;
		
		$response["message"] = "Informação de arquivos atualizadas com sucesso!";
		$stmt->close();
	}

}
else{
	$response["status"] = 2;
	$response["message"] = "Faltando parâmetros obrigatórios";
}





echo json_encode($response);
?>