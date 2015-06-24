<?php

if (file_exists(APP . 'Config' . DS . 'croogo.php')) {
	require APP . 'Config' . DS . 'croogo.php';
} else {
	if (!defined('LOG_ERROR')) {
		define('LOG_ERROR', LOG_ERR);
	}

	Configure::write('Error', array(
		'handler' => 'ErrorHandler::handleError',
		'level' => E_ALL & ~E_DEPRECATED,
		'trace' => true
	));

	Configure::write('Exception', array(
		'handler' => 'ErrorHandler::handleException',
		'renderer' => 'ExceptionRenderer',
		'log' => true
	));

	Configure::write('Session', array(
		'defaults' => 'php',
		'ini' => array(
			'session.cookie_httponly' => 1
		)
	));
}


/**
*
*	Cantidad de registros a migrar
*	Si se coloca false o 0 migra a todos
*
*	Se usa como "LIMIT" en la condicion del find
**/
Configure::write('Afigestion.AbstractMigratorLimit', false);

Configure::write('Config.language', 'spa');


Configure::write('DbTmpMig.migrators', array(
									'Menu28AfiliadosDb',
									'Menu28PadronDb',								
									'NewsisPadronDb',
									'NewsisAfiliadosDb',
									'Menu28PadronTxt',								
									'NewsisConsejoPadronTxt',
									'NewsisCortePadronTxt',
									'NewsisDefensoriaPadronTxt',
									'NewsisProcuracionPadronTxt',					
							));