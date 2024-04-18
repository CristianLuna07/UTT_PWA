-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para newproject
CREATE DATABASE IF NOT EXISTS `newproject` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `newproject`;

-- Volcando estructura para tabla newproject.consumo_mensual
CREATE TABLE IF NOT EXISTS `consumo_mensual` (
  `id` int NOT NULL AUTO_INCREMENT,
  `año` int unsigned DEFAULT NULL,
  `verano` tinyint DEFAULT NULL,
  `mes` tinyint unsigned DEFAULT NULL,
  `rango_inf` int DEFAULT NULL,
  `rango_sup` int DEFAULT NULL,
  `basico` decimal(20,6) unsigned DEFAULT NULL,
  `intermedio` decimal(20,6) unsigned DEFAULT NULL,
  `excedente` decimal(20,6) unsigned DEFAULT NULL,
  `id_tarifa` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_tarifa` (`id_tarifa`),
  CONSTRAINT `consumo_mensual_ibfk_1` FOREIGN KEY (`id_tarifa`) REFERENCES `tarifas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla newproject.consumo_mensual: ~12 rows (aproximadamente)
DELETE FROM `consumo_mensual`;
INSERT INTO `consumo_mensual` (`id`, `año`, `verano`, `mes`, `rango_inf`, `rango_sup`, `basico`, `intermedio`, `excedente`, `id_tarifa`) VALUES
	(1, 2023, 0, 1, 75, 140, 0.945000, 1.153000, 3.367000, 1),
	(2, 2023, 0, 2, 75, 140, 0.951000, 1.160000, 3.388000, 1),
	(3, 2023, 0, 3, 75, 140, 0.957000, 1.167000, 3.409000, 1),
	(4, 2023, 0, 4, 75, 140, 0.963000, 1.174000, 3.430000, 1),
	(5, 2023, 0, 5, 75, 140, 0.969000, 1.181000, 3.452000, 1),
	(6, 2023, 0, 6, 75, 140, 0.975000, 1.188000, 3.474000, 1),
	(7, 2023, 0, 7, 75, 140, 0.981000, 1.195000, 3.496000, 1),
	(8, 2023, 0, 8, 75, 140, 0.987000, 1.203000, 3.518000, 1),
	(9, 2023, 0, 9, 75, 140, 0.993000, 1.211000, 3.540000, 1),
	(10, 2023, 0, 10, 75, 140, 0.999000, 1.219000, 3.562000, 1),
	(11, 2023, 0, 11, 75, 140, 1.005000, 1.227000, 3.584000, 1),
	(12, 2023, 0, 12, 75, 140, 1.011000, 1.235000, 3.607000, 1);

-- Volcando estructura para vista newproject.kwh_user
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `kwh_user` (
	`kwh` DOUBLE NULL
) ENGINE=MyISAM;

-- Volcando estructura para tabla newproject.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Volcando datos para la tabla newproject.migrations: ~8 rows (aproximadamente)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2021_08_22_012813_create_permission_tables', 1),
	(6, '2021_08_22_020736_create_blogs_table', 1),
	(7, '2023_08_04_020331_create_sensors_table', 1),
	(8, '2023_11_20_040028_create_sensores_table', 1);

-- Volcando estructura para tabla newproject.model_has_permissions
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Volcando datos para la tabla newproject.model_has_permissions: ~0 rows (aproximadamente)
DELETE FROM `model_has_permissions`;

-- Volcando estructura para tabla newproject.model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Volcando datos para la tabla newproject.model_has_roles: ~3 rows (aproximadamente)
DELETE FROM `model_has_roles`;
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\Models\\User', 1),
	(2, 'App\\Models\\User', 2),
	(2, 'App\\Models\\User', 3);

-- Volcando estructura para tabla newproject.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Volcando datos para la tabla newproject.password_resets: ~0 rows (aproximadamente)
DELETE FROM `password_resets`;

-- Volcando estructura para tabla newproject.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Volcando datos para la tabla newproject.permissions: ~12 rows (aproximadamente)
DELETE FROM `permissions`;
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'ver-user', 'web', '2023-11-27 14:39:49', '2023-11-27 14:39:49'),
	(2, 'crear-user', 'web', '2023-11-27 14:39:49', '2023-11-27 14:39:49'),
	(3, 'editar-user', 'web', '2023-11-27 14:39:49', '2023-11-27 14:39:49'),
	(4, 'borrar-user', 'web', '2023-11-27 14:39:49', '2023-11-27 14:39:49'),
	(5, 'ver-rol', 'web', '2023-11-27 14:39:49', '2023-11-27 14:39:49'),
	(6, 'crear-rol', 'web', '2023-11-27 14:39:49', '2023-11-27 14:39:49'),
	(7, 'editar-rol', 'web', '2023-11-27 14:39:49', '2023-11-27 14:39:49'),
	(8, 'borrar-rol', 'web', '2023-11-27 14:39:49', '2023-11-27 14:39:49'),
	(9, 'ver-sensor', 'web', '2023-11-27 14:39:49', '2023-11-27 14:39:49'),
	(10, 'crear-sensor', 'web', '2023-11-27 14:39:50', '2023-11-27 14:39:50'),
	(11, 'editar-sensor', 'web', '2023-11-27 14:39:50', '2023-11-27 14:39:50'),
	(12, 'borrar-sensor', 'web', '2023-11-27 14:39:50', '2023-11-27 14:39:50');

-- Volcando estructura para tabla newproject.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Volcando datos para la tabla newproject.personal_access_tokens: ~0 rows (aproximadamente)
DELETE FROM `personal_access_tokens`;

-- Volcando estructura para tabla newproject.reading
CREATE TABLE IF NOT EXISTS `reading` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code_sensor` varchar(191) NOT NULL,
  `kw_per_day` double NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`code_sensor`),
  KEY `reading_fk` (`code_sensor`),
  CONSTRAINT `reading_fk` FOREIGN KEY (`code_sensor`) REFERENCES `sensores` (`code_sensor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla newproject.reading: ~10 rows (aproximadamente)
DELETE FROM `reading`;
INSERT INTO `reading` (`id`, `code_sensor`, `kw_per_day`, `date`) VALUES
	(1, '1231', 0.9934, '2023-11-09 01:08:20'),
	(2, '12412', 0.7437, '2023-11-15 01:08:20'),
	(3, '12412', 0.9638, '2023-11-07 01:08:20'),
	(4, '12345', 0.8492, '2023-11-23 01:08:20'),
	(5, '12412', 0.5724, '2023-11-28 01:08:20'),
	(6, '56156', 0.9085, '2023-11-10 01:08:20'),
	(7, '12412', 0.6537, '2023-11-17 01:08:20'),
	(8, '1231', 0.6265, '2023-11-25 01:08:20'),
	(9, '1231', 0.4874, '2023-11-11 01:08:20'),
	(10, '1231', 0.8554, '2023-11-19 01:08:20');

-- Volcando estructura para tabla newproject.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Volcando datos para la tabla newproject.roles: ~2 rows (aproximadamente)
DELETE FROM `roles`;
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'Administrador', 'web', '2023-11-27 14:40:04', '2023-11-27 14:40:04'),
	(2, 'Usuario', 'web', '2023-11-30 11:37:10', '2023-11-30 11:37:10');

-- Volcando estructura para tabla newproject.role_has_permissions
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Volcando datos para la tabla newproject.role_has_permissions: ~13 rows (aproximadamente)
DELETE FROM `role_has_permissions`;
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(9, 2);

-- Volcando estructura para tabla newproject.sensores
CREATE TABLE IF NOT EXISTS `sensores` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code_sensor` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name_aparato` varchar(191) NOT NULL,
  `usuario` bigint unsigned DEFAULT NULL,
  `ubicacion` int unsigned DEFAULT NULL,
  `coordenadas` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`code_sensor`),
  UNIQUE KEY `idx_code_sensor` (`code_sensor`),
  KEY `usuario` (`usuario`),
  KEY `ubicacion_fk` (`ubicacion`),
  CONSTRAINT `sensores_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla newproject.sensores: ~6 rows (aproximadamente)
DELETE FROM `sensores`;
INSERT INTO `sensores` (`id`, `code_sensor`, `name_aparato`, `usuario`, `ubicacion`, `coordenadas`, `description`, `created_at`, `updated_at`) VALUES
	(1, '1231', 'Refrigerador', 1, 3, NULL, NULL, '2023-11-28 04:35:51', '2023-11-28 04:35:51'),
	(2, '12345', 'TV', 1, 1, NULL, NULL, '2023-11-28 04:37:04', '2024-01-29 00:54:46'),
	(3, '56156', 'Compu', 1, 2, NULL, NULL, '2023-11-28 04:58:53', '2024-01-29 00:54:50'),
	(9, '12412', 'Microwave', 1, 3, NULL, NULL, '2023-11-30 04:45:41', '2023-11-30 04:45:41'),
	(10, '0988', 'Compu3', 1, 1, NULL, NULL, '2023-11-30 20:17:30', '2024-01-29 00:55:05'),
	(12, 'FUK-U2', 'SIMON', 1, 3, NULL, NULL, '2024-01-29 00:53:48', '2024-01-29 00:54:35');

-- Volcando estructura para vista newproject.sensorreading
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `sensorreading` (
	`date` DATETIME NULL,
	`kwh` DOUBLE NOT NULL,
	`nombre` VARCHAR(191) NOT NULL COLLATE 'utf8mb4_0900_ai_ci'
) ENGINE=MyISAM;

-- Volcando estructura para procedimiento newproject.TarifaCiclo
DELIMITER //
CREATE PROCEDURE `TarifaCiclo`(IN userId INT)
BEGIN
    SELECT u.idtarifa, u.ciclo_facturacion
    FROM users u 
    WHERE u.id = userId;
END//
DELIMITER ;

-- Volcando estructura para tabla newproject.tarifas
CREATE TABLE IF NOT EXISTS `tarifas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Tarifa` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla newproject.tarifas: ~7 rows (aproximadamente)
DELETE FROM `tarifas`;
INSERT INTO `tarifas` (`id`, `Tarifa`) VALUES
	(1, '1'),
	(2, '1A'),
	(3, '1B'),
	(4, '1C'),
	(5, '1D'),
	(6, '1E'),
	(7, '1F');

-- Volcando estructura para procedimiento newproject.test5
DELIMITER //
CREATE PROCEDURE `test5`(
    IN consumo INT,
    IN tarifa VARCHAR(255),
    IN mes INT,
    IN ano INT,
    IN ciclo_fact INT
)
BEGIN
    SELECT
        Tarifas.Tarifa,
        Consumo_Mensual.Mes,
        SUM(
            CASE
                WHEN ciclo_fact = 1 THEN
                    CASE
                        WHEN consumo > (Consumo_Mensual.rango_sup + Consumo_Mensual.rango_inf) THEN
                            (Consumo_Mensual.rango_inf * Consumo_Mensual.basico) +
                            (Consumo_Mensual.rango_sup * Consumo_Mensual.intermedio) +
                            ((consumo - (Consumo_Mensual.rango_inf + Consumo_Mensual.rango_sup)) * Consumo_Mensual.excedente)
                        WHEN consumo = (Consumo_Mensual.rango_sup + Consumo_Mensual.rango_inf) THEN 
                            (Consumo_Mensual.rango_inf * Consumo_Mensual.basico) +
                            (Consumo_Mensual.rango_sup * Consumo_Mensual.intermedio)
                        WHEN consumo < (Consumo_Mensual.rango_sup + Consumo_Mensual.rango_inf) THEN 
                            CASE
                                WHEN consumo < Consumo_Mensual.rango_inf OR consumo = Consumo_Mensual.rango_inf THEN
                                    consumo * Consumo_Mensual.basico
                                WHEN consumo > Consumo_Mensual.rango_inf THEN
                                    (Consumo_Mensual.rango_inf * Consumo_Mensual.basico) + 
                                    ((consumo - Consumo_Mensual.rango_inf) * Consumo_Mensual.intermedio)
                                ELSE "ERROR 1: Consumo < (Consumo_Mensual.rango_sup + Consumo_Mensual.rango_inf)"
                            END
                        WHEN consumo = Consumo_Mensual.rango_inf THEN Consumo_Mensual.rango_inf * Consumo_Mensual.basico
                        WHEN consumo < Consumo_Mensual.rango_inf THEN consumo * Consumo_Mensual.basico
                    END
                WHEN ciclo_fact = 2 THEN
                    CASE
                        WHEN consumo > ((Consumo_Mensual.rango_sup + Consumo_Mensual.rango_inf)*2) THEN
                            ((Consumo_Mensual.rango_inf *2) * Consumo_Mensual.basico) +
                            ((Consumo_Mensual.rango_sup *2) * Consumo_Mensual.intermedio) +
                            ((consumo - ((Consumo_Mensual.rango_inf + Consumo_Mensual.rango_sup)*2)) * Consumo_Mensual.excedente)
                        WHEN consumo = ((Consumo_Mensual.rango_sup + Consumo_Mensual.rango_inf)*2) THEN 
                            ((Consumo_Mensual.rango_inf *2) * Consumo_Mensual.basico) +
                            ((Consumo_Mensual.rango_sup *2) * Consumo_Mensual.intermedio)
                        WHEN consumo < ((Consumo_Mensual.rango_sup + Consumo_Mensual.rango_inf)*2) AND consumo > Consumo_Mensual.rango_inf THEN 
                            CASE
                                WHEN consumo < (Consumo_Mensual.rango_inf*2) OR consumo = (Consumo_Mensual.rango_inf*2) THEN
                                    consumo * Consumo_Mensual.basico
                                WHEN consumo > (Consumo_Mensual.rango_inf *2) THEN
                                    ((Consumo_Mensual.rango_inf * Consumo_Mensual.basico)*2) + 
                                    ((consumo - (Consumo_Mensual.rango_inf *2)) * Consumo_Mensual.intermedio)
                                ELSE "ERROR 2: Consumo < (Consumo_Mensual.rango_sup + Consumo_Mensual.rango_inf)"
                            END
                        WHEN consumo = Consumo_Mensual.rango_inf THEN Consumo_Mensual.rango_inf * Consumo_Mensual.basico
                        WHEN consumo < Consumo_Mensual.rango_inf THEN consumo * Consumo_Mensual.basico
                    END
                ELSE "SOLO HAY 1 y 2 JAJA"
            END
        ) AS Total_Pagar
    FROM
        Tarifas
    JOIN
        Consumo_Mensual ON Tarifas.id = Consumo_Mensual.id_tarifa
    WHERE
        Consumo_Mensual.Año = ano
        AND Tarifas.Tarifa = tarifa
        AND Consumo_Mensual.Mes = mes
    GROUP BY
        Tarifas.Tarifa, Consumo_Mensual.Mes;
END//
DELIMITER ;

-- Volcando estructura para tabla newproject.ubicacion
CREATE TABLE IF NOT EXISTS `ubicacion` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `nombre` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla newproject.ubicacion: ~3 rows (aproximadamente)
DELETE FROM `ubicacion`;
INSERT INTO `ubicacion` (`id`, `fecha`, `nombre`) VALUES
	(1, '2024-01-27', 'Sala'),
	(2, '2024-01-27', 'Cuarto'),
	(3, '2024-01-26', 'Cocina');

-- Volcando estructura para vista newproject.ubicaciones
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `ubicaciones` (
	`nombre` VARCHAR(150) NOT NULL COLLATE 'utf8mb4_0900_ai_ci'
) ENGINE=MyISAM;

-- Volcando estructura para tabla newproject.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `idtarifa` int DEFAULT NULL,
  `ciclo_facturacion` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `FK1_tarifa` (`idtarifa`),
  CONSTRAINT `FK1_tarifa` FOREIGN KEY (`idtarifa`) REFERENCES `tarifas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Volcando datos para la tabla newproject.users: ~3 rows (aproximadamente)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `idtarifa`, `ciclo_facturacion`) VALUES
	(1, 'adminsuper', 'admin@hot.com', NULL, '$2y$10$FQBuv70eRVmKyRHfflVjrudYhzCIssGeT7FM4yyoLJIZ4D2RykEBO', NULL, '2023-11-27 14:40:04', '2023-11-27 14:40:04', 1, 1),
	(2, 'marco', 'marco@hot.com', NULL, '$2y$10$FniUEB9Q0/PZ7yDWZgc9..8.YbV4nOEeCfLHDbUacYvHQjZwPuPsa', NULL, '2023-11-30 11:34:53', '2023-11-30 11:34:53', 1, 2),
	(3, 'Armando', 'chuy@hot.com', NULL, '$2y$10$36.t.Ad0ynjEaUWrN3Fk5uiwA60AZ72mU04YxbECTffcSzQY84AEO', NULL, '2023-11-30 11:43:08', '2023-11-30 11:43:08', 1, 1);

-- Volcando estructura para vista newproject.kwh_user
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `kwh_user`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `kwh_user` AS select sum(`r`.`kw_per_day`) AS `kwh` from ((`reading` `r` join `sensores` `s` on((`s`.`id` = `r`.`id`))) join `users` `u` on((`u`.`id` = `s`.`usuario`))) where ((`u`.`id` = 1) and (`r`.`date` between '2023-11-01' and '2024-01-28'));

-- Volcando estructura para vista newproject.sensorreading
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `sensorreading`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `sensorreading` AS select `r`.`date` AS `date`,`r`.`kw_per_day` AS `kwh`,`s`.`name_aparato` AS `nombre` from (`reading` `r` join `sensores` `s` on((`s`.`id` = `r`.`id`)));

-- Volcando estructura para vista newproject.ubicaciones
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `ubicaciones`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `ubicaciones` AS select `ubicacion`.`nombre` AS `nombre` from `ubicacion`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
