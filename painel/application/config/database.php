<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
|--------------------------------------------------------------------------
| Database Settings
|--------------------------------------------------------------------------
|
*/

$active_group = 'default';
$query_builder = TRUE;

/*
$db['default'] = array(
	'dsn'	=> '',
	'hostname' => 'localhost:3306',
	'username' => 'appbm',
	'password' => '%appbm2020',
	'database' => 'paineladmin',
	'dbdriver' => 'mysqli',
	'dbprefix' => '',
	'pconnect' => FALSE,
	'db_debug' => (ENVIRONMENT !== 'production'),
	'cache_on' => FALSE,
	'cachedir' => '',
	'char_set' => 'utf8',
	'dbcollat' => 'utf8_general_ci',
	'swap_pre' => '',
	'encrypt' => FALSE,
	'compress' => FALSE,
	'stricton' => FALSE,
	'failover' => array(),
	'save_queries' => TRUE
); */

$db['default'] = array(
	'dsn'	=> '',
	'hostname' => '185.211.7.205:3306',
	'username' => 'u699148595_u699148595_som',
	'password' => '%Soma2023',
	'database' => 'u699148595_inventario_hom',
	'dbdriver' => 'mysqli',
	'dbprefix' => '',
	'pconnect' => FALSE,
	'db_debug' => (ENVIRONMENT !== 'production'),
	'cache_on' => FALSE,
	'cachedir' => '',
	'char_set' => 'utf8',
	'dbcollat' => 'utf8_general_ci',
	'swap_pre' => '',
	'encrypt' => FALSE,
	'compress' => FALSE,
	'stricton' => FALSE,
	'failover' => array(),
	'save_queries' => TRUE
);


