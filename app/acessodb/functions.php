<?php


$random_salt_length = 32;
/**
* Queries the database and checks whether the user already exists
* 
* @param $username
* 
* @return
*/
function userExists($username){
	$query = "SELECT cadpessoa.nu_cpf as username FROM tb_cadastro_pessoa as cadpessoa WHERE cadpessoa.nu_cpf = ?";
	global $con;
	if($stmt = $con->prepare($query)){
		$stmt->bind_param("s",$username);
		$stmt->execute();
		$stmt->store_result();
		$stmt->fetch();
		if($stmt->num_rows == 1){
			$stmt->close();
			return true;
		}
		$stmt->close();
	}
 
	return false;
}
 
/**
* Creates a unique Salt for hashing the password
* 
* @return
*/
function getSalt(){
	global $random_salt_length;
	return bin2hex(openssl_random_pseudo_bytes($random_salt_length));
}
 
/**
* Creates password hash using the Salt and the password
* 
* @param $password
* @param $salt
* 
* @return
*/
function concatPasswordWithSalt($password,$salt){
	global $random_salt_length;
	if($random_salt_length % 2 == 0){
		$mid = $random_salt_length / 2;
	}
	else{
		$mid = ($random_salt_length - 1) / 2;
	}
 
	return
	substr($salt,0,$mid - 1).$password.substr($salt,$mid,$random_salt_length - 1);
 
}

function DMStoDD($deg,$min,$sec)
{

    // Converting DMS ( Degrees / minutes / seconds ) to decimal format
    return $deg+((($min*60)+($sec))/3600);
}    

function DDtoDMS($dec)
{
    // Converts decimal format to DMS ( Degrees / minutes / seconds ) 
    $vars = explode(".",$dec);
    $deg = $vars[0];
    $tempma = "0.".$vars[1];

    $tempma = $tempma * 3600;
    $min = floor($tempma / 60);
    $sec = $tempma - ($min*60);

    return array("deg"=>$deg,"min"=>$min,"sec"=>$sec);
}    
function DDtoDMS_string($latitude=false, $longitude=false)
{
    $result = array();
    
    # latitude (N or S)
    if($latitude)
    {
        $degrees = DDtoDMS($latitude);
        
        # data manipulation (2 digits, round, ...)
        $degrees['min'] = sprintf('%02d',$degrees['min']);
        $degrees['sec'] = sprintf('%04.1f',number_format($degrees['sec'], 1));
        
        # N or S
        $north_south = ($degrees['deg'] < 0) ? 'S' : 'N';
        
        array_push($result, abs($degrees['deg']).'°'.$degrees['min'].'\''.$degrees['sec'].'"'.$north_south);
    }
    
    # longitude (E or W)
    if($longitude)
    {
        $degrees = DDtoDMS($longitude);
        
        # data manipulation (2 digits, round, ...)
        $degrees['min'] = sprintf('%02d',$degrees['min']);
        $degrees['sec'] = sprintf('%04.1f',number_format($degrees['sec'], 1));
        
        # E or W
        $east_west = ($degrees['deg'] < 0) ? 'W' : 'E';
        
        array_push($result, abs($degrees['deg']).'°'.$degrees['min'].'\''.$degrees['sec'].'"'.$east_west); 
    }
    
    return implode(' ', $result);
}


?>