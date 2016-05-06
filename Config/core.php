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

Configure::write('Afigestion.descuento_mes', '');
Configure::write('Afigestion.descuento_anio', '');

Configure::write('Afigestion.carpeta_licencias_txt', '/var/www/html/TxtLicencias/diciembre');

Configure::write('Afigestion.carpeta_descuentos_txt', '/var/www/html/txtDescuentos/diciembre');

/*Path donde se encuentran los txt de licencias para la migracion mensual man*/
Configure::write('Afigestion.carpeta_licencias_txt', '/var/www/html/TxtLicencias/diciembre');

Configure::write('Afigestion.verificar_array_lindo', '/var/www/html/afi-gestion-marce/Vendor/afigestion/plugins/Afigestion/Test/TxtFilesForFixture/descuentos/');

Configure::write('Afigestion.carpeta_descuentos_fallidos', '/var/www/html/afi-gestion-marce/Vendor/afigestion/plugins/Afigestion/Test/TxtFilesForFixture/descuentos/carpeta_con_archivo_mal_para_filemig/');

Configure::write('DbTmpMig.migrators', array(
                        //'NewsisAfiliadosDb',
                        //'NewsisPadronDb',
                        //'Menu28PadronDb',								
                        //'Menu28AfiliadosDb',
                        //'Menu28PadronTxt',								
                        'NewsisConsejoPadronTxt',
                        'NewsisCortePadronTxt',
                        'NewsisDefensoriaPadronTxt',
                        'NewsisProcuracionPadronTxt',					
            ));