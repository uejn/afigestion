-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 27-03-2015 a las 15:46:09
-- Versión del servidor: 5.5.41-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de datos: `uejn_afigestion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `afiliacion_estados`
--

CREATE TABLE IF NOT EXISTS `afiliacion_estados` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE IF NOT EXISTS `cargos` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `organismo_id` int(20) unsigned NOT NULL,
  `cargo` smallint(6) DEFAULT NULL,
  `subcargo` smallint(6) DEFAULT NULL,
  `descripcion` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orden` smallint(6) NOT NULL,
  `estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `partida` int(11) DEFAULT NULL,
  `orden2` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cargos_orden` (`orden`),
  KEY `cargos_cargo` (`cargo`,`subcargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE IF NOT EXISTS `documentos` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `persona_id` int(20) unsigned NOT NULL,
  `tipo_documento_id` int(20) unsigned NOT NULL,
  `numero_documento` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `edificios`
--

CREATE TABLE IF NOT EXISTS `edificios` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `localidad_id` int(20) unsigned NOT NULL,
  `calle` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numero` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `observacion` text COLLATE utf8_unicode_ci,
  `estado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_civiles`
--

CREATE TABLE IF NOT EXISTS `estado_civiles` (
  `id` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fecha_descripciones`
--

CREATE TABLE IF NOT EXISTS `fecha_descripciones` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_fechas`
--

CREATE TABLE IF NOT EXISTS `historial_fechas` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `persona_id` int(20) unsigned NOT NULL,
  `fecha` date DEFAULT NULL,
  `fecha_descripcion_id` int(20) unsigned NOT NULL,
  `observacion` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `legajos`
--

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
  KEY `legajos_ubicacion` (`ubicacion_id`,`edificio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidades`
--

CREATE TABLE IF NOT EXISTS `localidades` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `provincia_id` int(20) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `localidades_provincia_id` (`provincia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nacionalidades`
--

CREATE TABLE IF NOT EXISTS `nacionalidades` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE IF NOT EXISTS `personas` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `nro_afiliado` int(11) DEFAULT NULL,
  `afiliacion_estado_id` int(20) unsigned NOT NULL,
  `nombre` char(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sexo_id` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `es_delegado` int(1) DEFAULT '0',
  `estado_civil_id` int(20) unsigned NOT NULL,
  `nacionalidad_id` int(20) unsigned NOT NULL,
  `updated` datetime NOT NULL,
  `updated_by` int(20) DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personas_nro_afiliado` (`nro_afiliado`),
  KEY `nro_afiliado` (`nro_afiliado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE IF NOT EXISTS `provincias` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `schema_migrations`
--

INSERT INTO `schema_migrations` (`id`, `class`, `type`, `created`) VALUES
(1, 'InitMigrations', 'Migrations', '2015-03-27 15:28:26'),
(2, 'ConvertVersionToClassNames', 'Migrations', '2015-03-27 15:28:26'),
(3, 'IncreaseClassNameLength', 'Migrations', '2015-03-27 15:28:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sexos`
--

CREATE TABLE IF NOT EXISTS `sexos` (
  `id` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documentos`
--

CREATE TABLE IF NOT EXISTS `tipo_documentos` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tipo_documentos_alias` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicaciones`
--

CREATE TABLE IF NOT EXISTS `ubicaciones` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `ubicacion_tipo_id` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(10) DEFAULT NULL,
  `lft` int(10) DEFAULT NULL,
  `rght` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion_tipos`
--

CREATE TABLE IF NOT EXISTS `ubicacion_tipos` (
  `id` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
