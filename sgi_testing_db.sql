-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 07-09-2022 a las 16:12:29
-- Versión del servidor: 5.7.26
-- Versión de PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sgi_testing_db`
--

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `dataDashBoard_general`$$
CREATE PROCEDURE `dataDashBoard_general` ()  BEGIN
      DECLARE links int;
      DECLARE users_pap int;
      DECLARE users_dme int;
SELECT COUNT(id_router_unity) INTO links FROM router_unity;
SELECT COUNT(id_user_pap) INTO users_pap FROM user_pap;
SELECT COUNT(id_user_dme) INTO users_dme FROM user_dme;

SELECT links,users_pap,users_dme;

 END$$

DROP PROCEDURE IF EXISTS `docents_users`$$
CREATE PROCEDURE `docents_users` ()  BEGIN
      DECLARE docents_pap int;
      DECLARE docents_dme int;
SELECT COUNT(id_user_pap) INTO docents_pap FROM user_pap WHERE id_educational_category = 1 || id_educational_category = 3 || id_educational_category = 5;
SELECT COUNT(id_user_dme) INTO docents_dme FROM user_dme WHERE id_educational_category = 1 || id_educational_category = 3 || id_educational_category = 5;
SELECT docents_pap, docents_dme;

 END$$

DROP PROCEDURE IF EXISTS `links_active`$$
CREATE PROCEDURE `links_active` ()  BEGIN
      DECLARE links_active int;
SELECT COUNT(id_router_unity) INTO links_active FROM router_unity WHERE id_router_state=1;
SELECT links_active;

 END$$

DROP PROCEDURE IF EXISTS `links_inactive`$$
CREATE PROCEDURE `links_inactive` ()  BEGIN
      DECLARE links_inactive int;
SELECT COUNT(id_router_unity) INTO links_inactive FROM router_unity WHERE id_router_state != 1;
SELECT links_inactive;

 END$$

DROP PROCEDURE IF EXISTS `links_inactive_by_lighting`$$
CREATE PROCEDURE `links_inactive_by_lighting` ()  BEGIN
      DECLARE links_inactive_by_lighting int;
SELECT COUNT(id_router_unity) INTO links_inactive_by_lighting FROM router_unity WHERE id_router_state = 2;
SELECT links_inactive_by_lighting;

 END$$

DROP PROCEDURE IF EXISTS `masters_users`$$
CREATE PROCEDURE `masters_users` ()  BEGIN
      DECLARE masters_pap int;
      DECLARE masters_dme int;
SELECT COUNT(id_user_pap) INTO masters_pap FROM user_pap WHERE id_scientist_category = 2;
SELECT COUNT(id_user_dme) INTO masters_dme FROM user_dme WHERE id_scientist_category = 2;
SELECT masters_pap, masters_dme;

 END$$

DROP PROCEDURE IF EXISTS `no_docents_users`$$
CREATE PROCEDURE `no_docents_users` ()  BEGIN
      DECLARE no_docents_pap int;
      DECLARE no_docents_dme int;
SELECT COUNT(id_user_pap) INTO no_docents_pap FROM user_pap WHERE id_educational_category = 2 || id_educational_category = 4 || id_educational_category = 6;
SELECT COUNT(id_user_dme) INTO no_docents_dme FROM user_dme WHERE id_educational_category = 2 || id_educational_category = 4 || id_educational_category = 6;
SELECT no_docents_pap, no_docents_dme;

 END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `additional_assignment`
--

DROP TABLE IF EXISTS `additional_assignment`;
CREATE TABLE IF NOT EXISTS `additional_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `additional_assignment` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `additional_assignment`
--

INSERT INTO `additional_assignment` (`id`, `additional_assignment`) VALUES
(1, 'Doctor (+200MB)'),
(2, 'Master (+100MB)'),
(3, 'Proceso Doctorado (+100MB)'),
(4, 'Inv. de Proyecto (+100MB)'),
(5, 'Ninguna');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `charge_dme`
--

DROP TABLE IF EXISTS `charge_dme`;
CREATE TABLE IF NOT EXISTS `charge_dme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charge` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `charge_dme`
--

INSERT INTO `charge_dme` (`id`, `charge`) VALUES
(1, 'Metodólogo (500MB)'),
(2, 'Directivos (Sin límite)'),
(3, 'Tecnología (Sin límite)'),
(4, 'Nodo (Sin límite)'),
(5, 'Especialista Territorial de Política en Recursos Humano');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chat_service`
--

DROP TABLE IF EXISTS `chat_service`;
CREATE TABLE IF NOT EXISTS `chat_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chat_service` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `chat_service`
--

INSERT INTO `chat_service` (`id`, `chat_service`) VALUES
(1, 'Con mensajería instantánea'),
(2, 'Sin mensajería instantánea');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `educational_category`
--

DROP TABLE IF EXISTS `educational_category`;
CREATE TABLE IF NOT EXISTS `educational_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `educational_category` varchar(120) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `educational_category`
--

INSERT INTO `educational_category` (`id`, `educational_category`) VALUES
(1, 'Docente'),
(2, 'No docente'),
(3, 'Espec realiza labor docente'),
(4, 'Téc no docente'),
(5, 'Dirigente docente'),
(6, 'Dirigente no docente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `educational_center`
--

DROP TABLE IF EXISTS `educational_center`;
CREATE TABLE IF NOT EXISTS `educational_center` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_educational_level` int(11) NOT NULL,
  `educational_center` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`educational_center`),
  KEY `id_educational_level` (`id_educational_level`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `educational_center`
--

INSERT INTO `educational_center` (`id`, `id_educational_level`, `educational_center`) VALUES
(1, 1, 'CI Mártires de Florida'),
(2, 1, 'CI Trencito de la Alegría'),
(3, 1, 'CI Semillitas del Futuro'),
(4, 2, 'Especial Jóse L Tasende'),
(5, 2, 'CDO'),
(6, 2, 'Casa del Niño'),
(7, 3, 'Primaria Tania la Guerrillera'),
(8, 3, 'Primaria Héroes de Girón'),
(9, 3, 'Primaria José Martí'),
(10, 3, 'Primaria Heriberto M G'),
(11, 3, 'Primaria Jóse A Echeverría'),
(12, 3, 'Primaria Enrique J Varona'),
(13, 3, 'Primaria Manuel Fajardo'),
(14, 3, 'Primaria Camilo Cienfuegos'),
(15, 3, 'Primaria Renato Guitar'),
(16, 3, 'Primaria Leonor Pérez'),
(17, 3, 'Primaria Rodolfo R Esquivel'),
(18, 3, 'Primaria Sierra Maestra'),
(19, 3, 'Primaria Félix Varela'),
(20, 3, 'Primaria Manuel Ascunce'),
(21, 3, 'Primaria Carlos J Finlay'),
(22, 3, 'Primaria Rolando Valdivia'),
(23, 3, 'Primaria Victoria de Girón'),
(24, 3, 'Primaria Ruben Batista'),
(25, 3, 'Primaria Alfredo A Mola'),
(26, 3, 'Primaria Álvaro B Machado'),
(27, 3, 'Primaria Heriberto M Guzmán'),
(28, 3, 'Primaria Conrado Benites'),
(29, 3, 'Primaria Abel Santamaría'),
(30, 3, 'Primaria Francisco G Toro'),
(31, 3, 'Primaria Zona # 2'),
(32, 3, 'Primaria Zona # 3'),
(33, 4, 'ESBU José Martí'),
(34, 4, 'ESBU Farabundo Martí'),
(35, 4, 'ESBU Lope Recio'),
(36, 4, 'ESBU Julio A Mella'),
(37, 9, 'ESBEC Antonio Maceo'),
(38, 4, 'ESBEC Rigoberto Corcho'),
(39, 5, 'IPU República Bolivariana de Venezuela'),
(40, 5, 'IPR Rolando Valdivia'),
(41, 6, 'ETP IPA Sabino Pupo'),
(42, 6, 'ETP IPE Manuel R'),
(43, 6, 'ETP Oficio República Bolivariana de Venezuela'),
(44, 7, 'Enseñanza Adulto CUA'),
(45, 8, 'DME'),
(46, 8, 'CDIP'),
(47, 8, 'Centro Cerrado Félix S'),
(48, 8, 'Palacio de Pioneros'),
(49, 8, 'Centro Pioneros Exploradores'),
(50, 8, 'Casa del Educador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `educational_level`
--

DROP TABLE IF EXISTS `educational_level`;
CREATE TABLE IF NOT EXISTS `educational_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `educational_level` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `educational_level`
--

INSERT INTO `educational_level` (`id`, `educational_level`) VALUES
(1, 'Primera Infancia'),
(2, 'Especial'),
(3, 'Primaria'),
(4, 'ESBU'),
(5, 'Pre'),
(6, 'ETP'),
(7, 'Adulto'),
(8, 'Instancia'),
(9, 'ESBEC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `email_service`
--

DROP TABLE IF EXISTS `email_service`;
CREATE TABLE IF NOT EXISTS `email_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_service` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `email_service`
--

INSERT INTO `email_service` (`id`, `email_service`) VALUES
(1, 'Con correo Internacional'),
(2, 'Sin correo Internacional');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gender`
--

DROP TABLE IF EXISTS `gender`;
CREATE TABLE IF NOT EXISTS `gender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gender` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `gender`
--

INSERT INTO `gender` (`id`, `gender`) VALUES
(1, 'Masculino'),
(2, 'Femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quota_megas`
--

DROP TABLE IF EXISTS `quota_megas`;
CREATE TABLE IF NOT EXISTS `quota_megas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quota_megas` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `quota_megas`
--

INSERT INTO `quota_megas` (`id`, `quota_megas`) VALUES
(1, '0 MB/Sem'),
(2, '500 MB/Sem'),
(3, '600 MB/Sem'),
(4, '700 MB/Sem'),
(5, '800 MB/Sem');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `role`
--

INSERT INTO `role` (`id`, `role`) VALUES
(1, 'Webmaster'),
(2, 'Administrador'),
(3, 'Usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `router_speed`
--

DROP TABLE IF EXISTS `router_speed`;
CREATE TABLE IF NOT EXISTS `router_speed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `router_speed` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `router_speed`
--

INSERT INTO `router_speed` (`id`, `router_speed`) VALUES
(1, '256 KB'),
(2, '512 KB'),
(3, '1 MB'),
(4, '2 MB'),
(5, '3 MB'),
(6, '4 MB'),
(7, '5 MB');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `router_state`
--

DROP TABLE IF EXISTS `router_state`;
CREATE TABLE IF NOT EXISTS `router_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `router_state` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `router_state`
--

INSERT INTO `router_state` (`id`, `router_state`) VALUES
(1, 'Activo'),
(2, 'Inactivo por Descarga Eléctrica'),
(3, 'Inactivo por Problemas Técnicos'),
(4, 'Inactivo por Enlace Deshabilitado'),
(5, 'Inactivo por Problemas en la Línea');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `router_unity`
--

DROP TABLE IF EXISTS `router_unity`;
CREATE TABLE IF NOT EXISTS `router_unity` (
  `id_router_unity` int(11) NOT NULL AUTO_INCREMENT,
  `ed` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `password_router` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_township` int(11) NOT NULL,
  `id_educational_level` int(11) NOT NULL,
  `id_educational_center` int(11) NOT NULL,
  `professor_in_charge` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `address_center` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `phone_number_center` int(20) NOT NULL,
  `lan` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `mask` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `wan` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_router_speed` int(11) NOT NULL,
  `id_router_state` int(11) NOT NULL,
  `report` int(50) DEFAULT NULL,
  `date_report` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `inactive_days` int(250) DEFAULT NULL,
  `price_per_day` int(250) DEFAULT NULL,
  PRIMARY KEY (`id_router_unity`),
  KEY `id_router_state` (`id_router_state`),
  KEY `id_router_speed` (`id_router_speed`),
  KEY `id_township` (`id_township`),
  KEY `id_educational_level` (`id_educational_level`),
  KEY `id_educational_center` (`id_educational_center`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `router_unity`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `scientist_category`
--

DROP TABLE IF EXISTS `scientist_category`;
CREATE TABLE IF NOT EXISTS `scientist_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scientist_category` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `scientist_category`
--

INSERT INTO `scientist_category` (`id`, `scientist_category`) VALUES
(1, '.Dr'),
(2, '.MSc'),
(3, '.Ing'),
(4, '.Lic'),
(5, '.Téc');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status_pap`
--

DROP TABLE IF EXISTS `status_pap`;
CREATE TABLE IF NOT EXISTS `status_pap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_pap` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `status_pap`
--

INSERT INTO `status_pap` (`id`, `status_pap`) VALUES
(1, 'Alta'),
(2, 'Baja'),
(3, 'Jubilado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `surf_internet_service`
--

DROP TABLE IF EXISTS `surf_internet_service`;
CREATE TABLE IF NOT EXISTS `surf_internet_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `surf_internet_service` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `surf_internet_service`
--

INSERT INTO `surf_internet_service` (`id`, `surf_internet_service`) VALUES
(1, 'Navegación Internacional (500MB)'),
(2, 'Navegación Internacional (Sin límite)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `township`
--

DROP TABLE IF EXISTS `township`;
CREATE TABLE IF NOT EXISTS `township` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `township` varchar(120) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `township`
--

INSERT INTO `township` (`id`, `township`) VALUES
(1, 'Florida');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `last_name` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `login` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `gender` enum('Masculino','Femenino') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `e-mail` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `address` varchar(300) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `scientist_category` enum('Dr','MSc','Ing','Lic','Téc') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `identity` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_admin`
--

DROP TABLE IF EXISTS `users_admin`;
CREATE TABLE IF NOT EXISTS `users_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_role` int(11) NOT NULL,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `last_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_gender` int(11) NOT NULL,
  `login` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_role` (`id_role`),
  KEY `id_gender` (`id_gender`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users_admin`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_dme`
--

DROP TABLE IF EXISTS `user_dme`;
CREATE TABLE IF NOT EXISTS `user_dme` (
  `id_user_dme` int(11) NOT NULL AUTO_INCREMENT,
  `CI` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `surname` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `second_surname` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_gender` int(11) NOT NULL,
  `login` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_township` int(11) NOT NULL,
  `id_charge` int(11) NOT NULL,
  `id_email_service` int(11) NOT NULL,
  `email` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_surf_internet_service` int(11) NOT NULL,
  `id_chat_service` int(11) NOT NULL,
  `id_educational_category` int(11) NOT NULL,
  `id_scientist_category` int(11) NOT NULL,
  `id_additional_assignment` int(11) NOT NULL,
  `id_quota_megas` int(11) NOT NULL,
  PRIMARY KEY (`id_user_dme`),
  KEY `id_educational_category` (`id_educational_category`),
  KEY `id_quota_megas` (`id_quota_megas`),
  KEY `id_gender` (`id_gender`),
  KEY `id_township` (`id_township`),
  KEY `id_charge` (`id_charge`),
  KEY `id_email_service` (`id_email_service`),
  KEY `id_surf_internet_service` (`id_surf_internet_service`),
  KEY `id_chat_service` (`id_chat_service`),
  KEY `id_scientist_category` (`id_scientist_category`),
  KEY `id_additional_assignment` (`id_additional_assignment`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `user_dme`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_pap`
--

DROP TABLE IF EXISTS `user_pap`;
CREATE TABLE IF NOT EXISTS `user_pap` (
  `id_user_pap` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_gender` int(11) NOT NULL,
  `user_mail` varchar(300) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `login` varchar(40) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_township` int(11) DEFAULT NULL,
  `id_educational_level` int(11) NOT NULL,
  `id_educational_center` int(11) NOT NULL,
  `charge` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_educational_category` int(11) NOT NULL,
  `id_scientist_category` int(11) NOT NULL,
  `phone_number` int(11) NOT NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_status_pap` int(11) NOT NULL,
  PRIMARY KEY (`id_user_pap`),
  KEY `id_educational_level` (`id_educational_level`),
  KEY `id_educational_center` (`id_educational_center`),
  KEY `id_gender` (`id_gender`),
  KEY `id_township` (`id_township`),
  KEY `id_educational_category` (`id_educational_category`),
  KEY `id_scientist_category` (`id_scientist_category`),
  KEY `id_status_pap` (`id_status_pap`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `educational_center`
--
ALTER TABLE `educational_center`
  ADD CONSTRAINT `educational_center_ibfk_1` FOREIGN KEY (`id_educational_level`) REFERENCES `educational_level` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `router_unity`
--
ALTER TABLE `router_unity`
  ADD CONSTRAINT `router_unity_ibfk_1` FOREIGN KEY (`id_township`) REFERENCES `township` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `router_unity_ibfk_2` FOREIGN KEY (`id_educational_level`) REFERENCES `educational_level` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `router_unity_ibfk_3` FOREIGN KEY (`id_educational_center`) REFERENCES `educational_center` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `router_unity_ibfk_4` FOREIGN KEY (`id_router_speed`) REFERENCES `router_speed` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `router_unity_ibfk_5` FOREIGN KEY (`id_router_state`) REFERENCES `router_state` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `users_admin`
--
ALTER TABLE `users_admin`
  ADD CONSTRAINT `fk_user_admin_gender` FOREIGN KEY (`id_gender`) REFERENCES `gender` (`id`),
  ADD CONSTRAINT `fk_user_admin_role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id`);

--
-- Filtros para la tabla `user_dme`
--
ALTER TABLE `user_dme`
  ADD CONSTRAINT `user_dme_addit_assign` FOREIGN KEY (`id_additional_assignment`) REFERENCES `additional_assignment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_dme_category` FOREIGN KEY (`id_educational_category`) REFERENCES `educational_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_dme_charge` FOREIGN KEY (`id_charge`) REFERENCES `charge_dme` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_dme_chat_service` FOREIGN KEY (`id_chat_service`) REFERENCES `chat_service` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_dme_email_service` FOREIGN KEY (`id_email_service`) REFERENCES `email_service` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_dme_gender` FOREIGN KEY (`id_gender`) REFERENCES `gender` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_dme_quota` FOREIGN KEY (`id_quota_megas`) REFERENCES `quota_megas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_dme_scientist_category` FOREIGN KEY (`id_scientist_category`) REFERENCES `scientist_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_dme_surf_service` FOREIGN KEY (`id_surf_internet_service`) REFERENCES `surf_internet_service` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_dme_township` FOREIGN KEY (`id_township`) REFERENCES `township` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `user_pap`
--
ALTER TABLE `user_pap`
  ADD CONSTRAINT `status_pap_users` FOREIGN KEY (`id_status_pap`) REFERENCES `status_pap` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_pap_ibfk_2` FOREIGN KEY (`id_educational_level`) REFERENCES `educational_level` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_pap_ibfk_3` FOREIGN KEY (`id_educational_center`) REFERENCES `educational_center` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_pap_ibfk_4` FOREIGN KEY (`id_gender`) REFERENCES `gender` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_pap_ibfk_5` FOREIGN KEY (`id_township`) REFERENCES `township` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_pap_ibfk_6` FOREIGN KEY (`id_educational_category`) REFERENCES `educational_category` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_pap_ibfk_7` FOREIGN KEY (`id_scientist_category`) REFERENCES `scientist_category` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
