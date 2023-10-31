<?php
define('DB_USER', "u699148595_u699148595_som"); // db user
define('DB_PASSWORD', "%Soma2023"); // db password (mention your db password here)
define('DB_DATABASE', "u699148595_inventario_hom"); // database name
define('DB_SERVER', "185.211.7.205:3306"); // db server
 

$con = mysqli_connect(DB_SERVER,DB_USER,DB_PASSWORD,DB_DATABASE);


// Check connection
if(mysqli_connect_errno())
{
	echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

//$mysqli->close();
 
?>