<?php
$response = array();
include 'db/db_connect.php';
include 'functions.php';
 
//Get the input request parameters
$inputJSON = file_get_contents('php://input');
$input = json_decode($inputJSON, TRUE); //convert JSON into array
$modo_debug = true;

$latitudecampogd  = $input['latitudecampogd'];
$longitudecampogd = $input['longitudecampogd'];
$result = explode(" ",DDtoDMS_string($latitudecampogd,$longitudecampogd));

function getBetween($string, $start = "", $end = ""){
    if (strpos($string, $start)) { // required if $start not exist in $string
        $startCharCount = strpos($string, $start) + strlen($start);
        $firstSubStr = substr($string, $startCharCount, strlen($string));
        $endCharCount = strpos($firstSubStr, $end);
        if ($endCharCount == 0) {
            $endCharCount = strlen($firstSubStr);
        }
        return substr($firstSubStr, 0, $endCharCount);
    } else {
        return '';
    }
}

if ($modo_debug) {
	
$insertQuery  = "INSERT INTO tb_debug(ds_campos) VALUES (?)";
	if($stmt = $con->prepare($insertQuery)){
		$stmt->bind_param("s",$input);
		$stmt->execute();
		$response["status"] = 0;
		
		$response["message"] = "Enviado com sucesso!";
		$stmt->close();
	}
	
} else {

if ($input['dscategoria'] == 'limpatabelas') {
	
		//PROVISÓRIO ANTES DO SERGIO FAZER UMA FUNÇÃO LIMPANDO TUDO, JUNTO COM AS RLS E REGISTRO DE IMAGENS
		$insertQuery  = "DELETE FROM tb_animais WHERE id_acesso = (?)";
		if($stmt = $con->prepare($insertQuery)){
			$stmt->bind_param("s",$input['idacesso']);
			$stmt->execute();
			$response["status"] = 0;
			$response["message"] = "Apagada com sucesso!";
			$stmt->close();
		}
		$insertQuery  = "DELETE FROM tb_arvores_vivas WHERE id_acesso = (?)";
		if($stmt = $con->prepare($insertQuery)){
			$stmt->bind_param("s",$input['idacesso']);
			$stmt->execute();
			$response["status"] = 0;
			$response["message"] = "Apagada com sucesso!";
			$stmt->close();
		}
		$insertQuery  = "DELETE FROM tb_epifitas WHERE id_acesso = (?)";
		if($stmt = $con->prepare($insertQuery)){
			$stmt->bind_param("s",$input['idacesso']);
			$stmt->execute();
			$response["status"] = 0;
			$response["message"] = "Apagada com sucesso!";
			$stmt->close();
		}
		$insertQuery  = "DELETE FROM tb_hidrologia WHERE id_acesso = (?)";
		if($stmt = $con->prepare($insertQuery)){
			$stmt->bind_param("s",$input['idacesso']);
			$stmt->execute();
			$response["status"] = 0;
			$response["message"] = "Apagada com sucesso!";
			$stmt->close();
		}
	
} else if ($input['dscategoria'] == 'animais') {
	//	$input['latitudecampogd'] e $input['longitudecampogd']//AQUI SERGIONE, PEGA OS CAMPOS QUE VEM DO APP, TRANSFORMA AQUI PRA GMS E JOGA NOS CAMPOS DE GMS NO PAINEL
	if (strtok($input['idtpobservacao'], '-') == 'SELECIONE'){$idtpobservacao = null;} else {$idtpobservacao = strtok($input['idtpobservacao'], '-');}
	if (strtok($input['idclassificacao'], '-') == 'SELECIONE'){$idclassificacao = null;} else {$idclassificacao = strtok($input['idclassificacao'], '-');}
	if (strtok($input['idgrauprotecao'], '-') == 'SELECIONE'){$idgrauprotecao = null;} else {$idgrauprotecao = strtok($input['idgrauprotecao'], '-');}
	
	$insertQuery  = "REPLACE INTO tb_animais(id,id_parcela,id_acesso,id_tipo_observacao,id_classificacao,id_grau_protecao,latitude_campo_gd,longitude_campo_gd,latitude_campo_gms,longitude_campo_gms,descricao) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
	if($stmt = $con->prepare($insertQuery)){
		$stmt->bind_param("sssssssssss",$input['idcontroleanimais'],getBetween($input['idparcelaanimais'],"(",")"),$input['idacesso'],$idtpobservacao,$idclassificacao,$idgrauprotecao,$input['latitudecampogd'] ,$input['longitudecampogd'],$result[0],$result[1],$input['descricao']);
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
    if (strtok($input['idestagioregeneracao'], '-') == 'SELECIONE'){$idestagioregeneracao = null;} else {$idestagioregeneracao = strtok($input['idestagioregeneracao'], '-');}
	if (strtok($input['idgrauepifitismo'], '-') == 'SELECIONE'){$idgrauepifitismo = null;} else {$idgrauepifitismo = strtok($input['idgrauepifitismo'], '-');}
	if (strtok($input['idgrauprotecao'], '-') == 'SELECIONE'){$idgrauprotecao = null;} else {$idgrauprotecao = strtok($input['idgrauprotecao'], '-');}
	
    $insertQuery  = "REPLACE INTO tb_arvores_vivas(id,id_parcela,id_acesso,id_grau_protecao,latitude_campo_gd,longitude_campo_gd,nu_biomassa,identificacao,nu_circunferencia,nu_altura,nu_altura_total,nu_altura_fuste,nu_altura_copa,isolada,floracao_frutificacao,latitude_campo_gms,longitude_campo_gms,descricao,id_estagio_regeneracao,id_grau_epifitismo) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	if($stmt = $con->prepare($insertQuery)){
		$stmt->bind_param("ssssssssssssssssssss",$input['idcontrolearvoresvivas'],getBetween($input['idparcelaarvoresvivas'],"(",")"),$input['idacesso'],$idgrauprotecao,$input['latitudecampogd'],$input['longitudecampogd'],$input['nubiomassa'],$input['identificacao'],$input['nucircunferencia'],$input['nualtura'],$input['nualturatotal'],$input['nualturafuste'],$input['nualturacopa'],$input['isolada'],$input['floracaofrutificacao'],$result[0],$result[1],$input['descricao'],$idestagioregeneracao,$idgrauepifitismo);
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
	
    $insertQuery  = "REPLACE INTO tb_epifitas(id,id_acesso,id_parcela,latitude_campo_gd,longitude_campo_gd,latitude_campo_gms,longitude_campo_gms,descricao) VALUES (?,?,?,?,?,?,?,?)";
	if($stmt = $con->prepare($insertQuery)){
		$stmt->bind_param("ssssssss",$input['idcontroleepifitas'],$input['idacesso'],getBetween($input['idparcelaepifitas'],"(",")"),$input['latitudecampogd'],$input['longitudecampogd'],$result[0],$result[1],$input['descricao']);
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
		
    $insertQuery  = "REPLACE INTO tb_hidrologia(id,id_parcela,id_acesso,descricao,latitude_campo_gd,longitude_campo_gd,latitude_campo_gms,longitude_campo_gms) VALUES (?,?,?,?,?,?,?,?)";
	if($stmt = $con->prepare($insertQuery)){
		$stmt->bind_param("ssssssss",$input['idcontrolehidrologia'],getBetween($input['idparcelahidrologia'],"(",")"),$input['idacesso'],$input['descricao'],$input['latitudecampogd'],$input['longitudecampogd'],$result[0],$result[1]);
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


}


echo json_encode($response);
?>