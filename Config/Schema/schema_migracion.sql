

CREATE TABLE IF NOT EXISTS `personas` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `nro_afiliado` int(11) DEFAULT NULL,
  `afiliacion_estado_id` int(20) unsigned NOT NULL,
  `nombre` char(64) DEFAULT NULL,
  `sexo_id` varchar(1) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `es_delegado` int(1) DEFAULT 0,
  `estado_civil_id` int(20) unsigned NOT NULL,
  `nacionalidad_id` int(20) unsigned NOT NULL,
  `updated` datetime NOT NULL,
  `updated_by` int(20) DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int(20) DEFAULT NULL,
PRIMARY KEY (`id`),
  UNIQUE KEY `personas_nro_afiliado` (`nro_afiliado`),
  KEY `nro_afiliado` (`nro_afiliado`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE IF NOT EXISTS `documentos` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `persona_id` int(20) unsigned NOT NULL,
  `tipo_documento_id` int(20) unsigned NOT NULL,
  `numero_documento` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE IF NOT EXISTS `tipo_documentos` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `alias`varchar(3) DEFAULT NULL,
  `name`varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tipo_documentos_alias` (`alias`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE IF NOT EXISTS `legajos` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `legajo` mediumint(5) unsigned DEFAULT NULL,
  `edificio_id` int(20) unsigned NOT NULL,
  `cargo_id` int(20) unsigned NOT NULL,
  `ubicacion_id` int(20) unsigned NOT NULL,
  `antiguedad` decimal(5,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `legajos_legajo` (`legajo`),
  KEY `legajos_edificio_id` (`edificio_id`),
  KEY `legajos_cargo_id` (`cargo_id`),
  KEY `legajos_ubicacion_id` (`ubicacion_id`),
  KEY `legajos_ubicacion` (`ubicacion_id`, `edificio_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE IF NOT EXISTS `afiliacion_estados` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `name`varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE IF NOT EXISTS `sexos` (
  `id` varchar(1) NOT NULL,
  `name`varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE IF NOT EXISTS `estado_civiles` (
  `id` varchar(1) NOT NULL,
  `name`varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE IF NOT EXISTS `nacionalidades` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `name`varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




CREATE TABLE IF NOT EXISTS `historial_fechas` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `persona_id` int(20) unsigned NOT NULL,
  `fecha` date DEFAULT NULL,
  `fecha_descripcion_id` int(20) unsigned NOT NULL,
  `observacion` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE IF NOT EXISTS `fecha_descripciones` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `name`varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE IF NOT EXISTS `cargos` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `organismo_id` int(20) unsigned NOT NULL,
  `cargo` smallint(6) DEFAULT NULL,
  `subcargo` smallint(6) DEFAULT NULL,
  `descripcion` varchar(40) DEFAULT NULL,
  `orden` smallint(6) NOT NULL,
  `estado` char(1) DEFAULT NULL,
  `partida` int(11) DEFAULT NULL,
  `orden2` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cargos_orden` (`orden`),
  KEY `cargos_cargo` (`cargo`,`subcargo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE IF NOT EXISTS `edificios` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `localidad_id` int(20) unsigned NOT NULL,
  `calle` varchar(50) DEFAULT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `observacion` text,
  `estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE IF NOT EXISTS `localidades` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `provincia_id` int(20) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `localidades_provincia_id` (`provincia_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE IF NOT EXISTS `provincias` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  `alias` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE IF NOT EXISTS `ubicaciones` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ubicacion_tipo_id` varchar(1) NOT NULL,
  `parent_id` int(10) DEFAULT NULL,
  `lft` int(10) DEFAULT NULL,
  `rght` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE IF NOT EXISTS `ubicacion_tipos` (
  `id` varchar(1) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
