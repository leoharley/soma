<?php
$response = array();
include 'db/db_connect.php';
include 'functions.php';
 
//Get the input request parameters
$inputJSON = file_get_contents('php://input');
$input = json_decode($inputJSON, TRUE); //convert JSON into array

if ($input['dscategoria'] == 'animais') {
	$insertQuery  = "REPLACE INTO tb_animais(id,id_parcela,id_acesso,id_tipo_observacao,id_classificacao,id_grau_protecao,latitude_campo_gd,longitude_campo_gd) VALUES (?,?,?,?,?,?,?,?)";
	if($stmt = $con->prepare($insertQuery)){
		$stmt->bind_param("ssssssss",$input['idcontroleanimais'],strtok($input['idparcelaanimais'], '-'),$input['idacesso'],strtok($input['idtpobservacao'], '-'),strtok($input['idclassificacao'], '-'),strtok($input['idgrauprotecao'], '-'),$input['latitudecampogd'],$input['longitudecampogd']);
		$stmt->execute();
		$response["status"] = 0;
		
		$response["message"] = "Enviado com sucesso!";
		$stmt->close();
	}
} else if ($input['dscategoria'] == 'arvoresvivas') {
    $insertQuery  = "REPLACE INTO tb_arvores_vivas(id,id_parcela,id_acesso,id_grau_protecao,latitude_campo_gd,longitude_campo_gd,nu_biomassa,identificacao,nu_circunferencia,nu_altura,nu_altura_total,nu_altura_fuste,nu_altura_copa,isolada,floracao_frutificacao) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	if($stmt = $con->prepare($insertQuery)){
		$stmt->bind_param("sssssssssssssss",$input['idcontrolearvoresvivas'],strtok($input['idparcelaarvoresvivas'], '-'),$input['idacesso'],strtok($input['idgrauprotecao'], '-'),$input['latitudecampogd'],$input['longitudecampogd'],$input['nubiomassa'],$input['identificacao'],$input['nucircunferencia'],$input['nualtura'],$input['nualturatotal'],$input['nualturafuste'],$input['nualturacopa'],$input['isolada'],$input['floracaofrutificacao']);
		$stmt->execute();
		$response["status"] = 0;
		
		$response["message"] = "Enviado com sucesso!";
		$stmt->close();
	}

} else if ($input['dscategoria'] == 'epifitas') {
    $insertQuery  = "REPLACE INTO tb_epifitas(id,id_acesso,id_parcela,latitude_campo_gd,longitude_campo_gd) VALUES (?,?,?,?,?)";
	if($stmt = $con->prepare($insertQuery)){
		$stmt->bind_param("sssss",$input['idcontrolearvoresvivas'],$input['idacesso'],strtok($input['idparcelaarvoresvivas'], '-'),$input['latitudecampogd'],$input['longitudecampogd']);
		$stmt->execute();
		$response["status"] = 0;
		
		$response["message"] = $input['idcontrolearvoresvivas'];
		$stmt->close();
	}

} else if ($input['dscategoria'] == 'hidrologia') {
    $insertQuery  = "REPLACE INTO tb_hidrologia(id,id_parcela,id_acesso,descricao,latitude_campo_gd,longitude_campo_gd) VALUES (?,?,?,?,?,?)";
	if($stmt = $con->prepare($insertQuery)){
		$stmt->bind_param("ssssss",$input['idcontrolehidrologia'],strtok($input['idparcelahidrologia'], '-'),$input['idacesso'],$input['descricao'],$input['latitudecampogd'],$input['longitudecampogd']);
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
		
		$response["message"] = $input['name'];
		$stmt->close();
	}

}
else{
	$response["status"] = 2;
	$response["message"] = "Faltando parâmetros obrigatórios";
}
echo json_encode($response);
?>