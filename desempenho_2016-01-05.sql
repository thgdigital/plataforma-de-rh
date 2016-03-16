/*
MySQL Backup
Source Server Version: 5.6.17
Source Database: desempenho
Date: 05/01/2016 18:12:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `cargos`
-- ----------------------------
DROP TABLE IF EXISTS `cargos`;
CREATE TABLE `cargos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` text COLLATE utf8_unicode_ci NOT NULL,
  `departamento_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `cargos_departamento_id_foreign` (`departamento_id`),
  CONSTRAINT `cargos_departamento_id_foreign` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `competencias`
-- ----------------------------
DROP TABLE IF EXISTS `competencias`;
CREATE TABLE `competencias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` text COLLATE utf8_unicode_ci NOT NULL,
  `empresa_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `competencias_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `competencias_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `comportamentos`
-- ----------------------------
DROP TABLE IF EXISTS `comportamentos`;
CREATE TABLE `comportamentos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` text COLLATE utf8_unicode_ci NOT NULL,
  `compencia_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `comportamentos_compencia_id_foreign` (`compencia_id`),
  CONSTRAINT `comportamentos_compencia_id_foreign` FOREIGN KEY (`compencia_id`) REFERENCES `competencias` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `dados_users`
-- ----------------------------
DROP TABLE IF EXISTS `dados_users`;
CREATE TABLE `dados_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `cargo_id` int(10) unsigned NOT NULL,
  `empresa_id` int(10) unsigned NOT NULL,
  `departamento_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `dados_users_user_id_foreign` (`user_id`),
  KEY `dados_users_cargo_id_foreign` (`cargo_id`),
  KEY `dados_users_empresa_id_foreign` (`empresa_id`),
  KEY `dados_users_departamento_id_foreign` (`departamento_id`),
  CONSTRAINT `dados_users_cargo_id_foreign` FOREIGN KEY (`cargo_id`) REFERENCES `cargos` (`id`),
  CONSTRAINT `dados_users_departamento_id_foreign` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`),
  CONSTRAINT `dados_users_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  CONSTRAINT `dados_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `departamentos`
-- ----------------------------
DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE `departamentos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` text COLLATE utf8_unicode_ci NOT NULL,
  `empresa_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `departamentos_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `departamentos_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `empresas`
-- ----------------------------
DROP TABLE IF EXISTS `empresas`;
CREATE TABLE `empresas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `estado` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cidade` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telefone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `oauth_access_tokens`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_id` int(10) unsigned NOT NULL,
  `expire_time` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth_access_tokens_id_session_id_unique` (`id`,`session_id`),
  KEY `oauth_access_tokens_session_id_index` (`session_id`),
  CONSTRAINT `oauth_access_tokens_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `oauth_sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `oauth_access_token_scopes`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_token_scopes`;
CREATE TABLE `oauth_access_token_scopes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `access_token_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `scope_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `oauth_access_token_scopes_access_token_id_index` (`access_token_id`),
  KEY `oauth_access_token_scopes_scope_id_index` (`scope_id`),
  CONSTRAINT `oauth_access_token_scopes_access_token_id_foreign` FOREIGN KEY (`access_token_id`) REFERENCES `oauth_access_tokens` (`id`) ON DELETE CASCADE,
  CONSTRAINT `oauth_access_token_scopes_scope_id_foreign` FOREIGN KEY (`scope_id`) REFERENCES `oauth_scopes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `oauth_auth_codes`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_id` int(10) unsigned NOT NULL,
  `redirect_uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expire_time` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_session_id_index` (`session_id`),
  CONSTRAINT `oauth_auth_codes_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `oauth_sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `oauth_auth_code_scopes`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_auth_code_scopes`;
CREATE TABLE `oauth_auth_code_scopes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `auth_code_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `scope_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `oauth_auth_code_scopes_auth_code_id_index` (`auth_code_id`),
  KEY `oauth_auth_code_scopes_scope_id_index` (`scope_id`),
  CONSTRAINT `oauth_auth_code_scopes_auth_code_id_foreign` FOREIGN KEY (`auth_code_id`) REFERENCES `oauth_auth_codes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `oauth_auth_code_scopes_scope_id_foreign` FOREIGN KEY (`scope_id`) REFERENCES `oauth_scopes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `oauth_clients`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE `oauth_clients` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth_clients_id_secret_unique` (`id`,`secret`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `oauth_client_endpoints`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_endpoints`;
CREATE TABLE `oauth_client_endpoints` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `redirect_uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth_client_endpoints_client_id_redirect_uri_unique` (`client_id`,`redirect_uri`),
  CONSTRAINT `oauth_client_endpoints_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `oauth_clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `oauth_client_grants`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_grants`;
CREATE TABLE `oauth_client_grants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `grant_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `oauth_client_grants_client_id_index` (`client_id`),
  KEY `oauth_client_grants_grant_id_index` (`grant_id`),
  CONSTRAINT `oauth_client_grants_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `oauth_clients` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `oauth_client_grants_grant_id_foreign` FOREIGN KEY (`grant_id`) REFERENCES `oauth_grants` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `oauth_client_scopes`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_scopes`;
CREATE TABLE `oauth_client_scopes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `scope_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `oauth_client_scopes_client_id_index` (`client_id`),
  KEY `oauth_client_scopes_scope_id_index` (`scope_id`),
  CONSTRAINT `oauth_client_scopes_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `oauth_clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `oauth_client_scopes_scope_id_foreign` FOREIGN KEY (`scope_id`) REFERENCES `oauth_scopes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `oauth_grants`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_grants`;
CREATE TABLE `oauth_grants` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `oauth_grant_scopes`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_grant_scopes`;
CREATE TABLE `oauth_grant_scopes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grant_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `scope_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `oauth_grant_scopes_grant_id_index` (`grant_id`),
  KEY `oauth_grant_scopes_scope_id_index` (`scope_id`),
  CONSTRAINT `oauth_grant_scopes_grant_id_foreign` FOREIGN KEY (`grant_id`) REFERENCES `oauth_grants` (`id`) ON DELETE CASCADE,
  CONSTRAINT `oauth_grant_scopes_scope_id_foreign` FOREIGN KEY (`scope_id`) REFERENCES `oauth_scopes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `oauth_refresh_tokens`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `expire_time` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`access_token_id`),
  UNIQUE KEY `oauth_refresh_tokens_id_unique` (`id`),
  CONSTRAINT `oauth_refresh_tokens_access_token_id_foreign` FOREIGN KEY (`access_token_id`) REFERENCES `oauth_access_tokens` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `oauth_scopes`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_scopes`;
CREATE TABLE `oauth_scopes` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `oauth_sessions`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_sessions`;
CREATE TABLE `oauth_sessions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `owner_type` enum('client','user') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'user',
  `owner_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_redirect_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `oauth_sessions_client_id_owner_type_owner_id_index` (`client_id`,`owner_type`,`owner_id`),
  CONSTRAINT `oauth_sessions_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `oauth_clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `oauth_session_scopes`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_session_scopes`;
CREATE TABLE `oauth_session_scopes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` int(10) unsigned NOT NULL,
  `scope_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `oauth_session_scopes_session_id_index` (`session_id`),
  KEY `oauth_session_scopes_scope_id_index` (`scope_id`),
  CONSTRAINT `oauth_session_scopes_scope_id_foreign` FOREIGN KEY (`scope_id`) REFERENCES `oauth_scopes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `oauth_session_scopes_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `oauth_sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `respostas`
-- ----------------------------
DROP TABLE IF EXISTS `respostas`;
CREATE TABLE `respostas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `peso` int(11) NOT NULL,
  `empresa_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `respostas_empresa_id_foreign` (`empresa_id`),
  CONSTRAINT `respostas_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `resposta_comportamentos`
-- ----------------------------
DROP TABLE IF EXISTS `resposta_comportamentos`;
CREATE TABLE `resposta_comportamentos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comportamento_id` int(10) unsigned NOT NULL,
  `resposta_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `resposta_comportamentos_comportamento_id_foreign` (`comportamento_id`),
  KEY `resposta_comportamentos_resposta_id_foreign` (`resposta_id`),
  CONSTRAINT `resposta_comportamentos_resposta_id_foreign` FOREIGN KEY (`resposta_id`) REFERENCES `respostas` (`id`),
  CONSTRAINT `resposta_comportamentos_comportamento_id_foreign` FOREIGN KEY (`comportamento_id`) REFERENCES `comportamentos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `roles`
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `cargo_id` int(10) unsigned NOT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('0','1') COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `role_id` int(10) unsigned NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_cargo_id_foreign` (`cargo_id`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_cargo_id_foreign` FOREIGN KEY (`cargo_id`) REFERENCES `cargos` (`id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `cargos` VALUES ('1','Programador','Descrição do cargo do programador','1','2016-01-03 14:02:15','2016-01-03 14:02:15'), ('2','Front End','descrição do cargo do front end','1','2016-01-04 21:50:41','2016-01-04 21:52:13'), ('3','Diretor de artes','Descrição do diretor de artes','7','2016-01-04 22:07:32','2016-01-04 22:07:32'), ('4','Comunicação','Cargo da comunicção','7','2016-01-04 22:08:37','2016-01-04 22:08:37');
INSERT INTO `departamentos` VALUES ('1','TI','Descrição do cargo do programador','1','2016-01-03 13:59:30','2016-01-04 20:06:26'), ('5','Comercial','Este e o departamento do comercial','1','2016-01-04 17:07:24','2016-01-04 17:50:57'), ('6','Administrativo','Departamento da administração','1','2016-01-04 17:08:37','2016-01-04 17:08:37'), ('7','Designer','Departamento do designer','1','2016-01-04 17:08:38','2016-01-04 17:50:30');
INSERT INTO `empresas` VALUES ('1','ConQuist','RJ','Rio de Janeiro','(21) 99999-9999','webmaster@conquist.com.br','2016-01-03 15:49:37','2016-01-03 15:49:37');
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table','1'), ('2014_10_12_100000_create_password_resets_table','1'), ('2016_01_03_142211_create_empresas_table','1'), ('2016_01_03_144010_create_departamentos_table','1'), ('2016_01_03_145132_create_cargos_table','1'), ('2016_01_03_151218_add_empresa_to_users_table','1'), ('2016_01_03_152857_create_roles_table','2'), ('2016_01_03_153101_add_role_to_users_table','2'), ('2016_01_03_153930_add_cidade_to_empresas_table','3'), ('2014_04_24_110151_create_oauth_scopes_table','4'), ('2014_04_24_110304_create_oauth_grants_table','4'), ('2014_04_24_110403_create_oauth_grant_scopes_table','4'), ('2014_04_24_110459_create_oauth_clients_table','4'), ('2014_04_24_110557_create_oauth_client_endpoints_table','4'), ('2014_04_24_110705_create_oauth_client_scopes_table','4'), ('2014_04_24_110817_create_oauth_client_grants_table','4'), ('2014_04_24_111002_create_oauth_sessions_table','4'), ('2014_04_24_111109_create_oauth_session_scopes_table','4'), ('2014_04_24_111254_create_oauth_auth_codes_table','4'), ('2014_04_24_111403_create_oauth_auth_code_scopes_table','4'), ('2014_04_24_111518_create_oauth_access_tokens_table','4'), ('2014_04_24_111657_create_oauth_access_token_scopes_table','4'), ('2014_04_24_111810_create_oauth_refresh_tokens_table','4'), ('2016_01_05_005649_create_dados_users_table','5'), ('2016_01_05_010620_add_departamento_to_users_table','6'), ('2016_01_05_155557_create_competencias_table','7'), ('2016_01_05_161547_create_comportamentos_table','8'), ('2016_01_05_162742_create_respostas_table','9'), ('2016_01_05_170027_create_resposta_comportamentos_table','10');
INSERT INTO `oauth_access_tokens` VALUES ('0cmvIsVS9gt3iyHSiPRxmVUUxZmkWmANlUkwKiDe','190','1452016489','2016-01-05 14:54:49','2016-01-05 14:54:49'), ('0DGubxV7w6VdiXxQaMSLUODuP5lSQud7up7raWG4','104','1451939926','2016-01-04 17:38:46','2016-01-04 17:38:46'), ('0lDD85a4YOT1uktsSm5rdGOx1fnFPXU2iVlnmIjY','144','1451952761','2016-01-04 21:12:41','2016-01-04 21:12:41'), ('0N1WKnvsHirwe4wpUPZDWsSlnMhd5HL3qJpOW7pZ','158','1451954718','2016-01-04 21:45:18','2016-01-04 21:45:18'), ('0ouVFFq3R8uEWdPvvcNgUPuSXHcjdB2cZcbngB3C','182','1451971828','2016-01-05 02:30:29','2016-01-05 02:30:29'), ('0RYb61zbspfQ6PGXGOLUtOE29nB5dyb8Oj3NgUuO','34','1451880165','2016-01-04 01:02:45','2016-01-04 01:02:45'), ('1DICQtUiJw3QCl0hAgSO10WSi71S2gZE9QMU8Q2y','35','1451880167','2016-01-04 01:02:47','2016-01-04 01:02:47'), ('1fLzjJ4hXsbvmgiRd7zWysXuE3FlJSGkFQE2mMnS','187','1452016278','2016-01-05 14:51:18','2016-01-05 14:51:18'), ('1GqAjmzQYeVW4fELqzd5oe1XR1XeC9MrNj9QPzt8','154','1451954407','2016-01-04 21:40:07','2016-01-04 21:40:07'), ('1REFTrbptAtixpOsNFndanhi65GE5TPg0FcfSO2f','115','1451944087','2016-01-04 18:48:07','2016-01-04 18:48:07'), ('1tOqxIEA7frrmViY5545MaEojBDx3u7Jv38emUgU','37','1451880312','2016-01-04 01:05:12','2016-01-04 01:05:12'), ('2d6awvptBF3SL3DMMMJOwH5uOpp7PJ6c36V50CEm','72','1451914198','2016-01-04 10:29:58','2016-01-04 10:29:58'), ('2Uox88xIZ1kVsmfUSYFwaxY8IlJq6CU6TTz3dKE6','111','1451943772','2016-01-04 18:42:52','2016-01-04 18:42:52'), ('2UqiJH9HxLJ3JI2TidWZDOyNxreD9BkQ3jjyUhU7','65','1451911461','2016-01-04 09:44:21','2016-01-04 09:44:21'), ('2VNvF6QQhhJqjhNyZmfnD0CCqwbCMCVn2u7kCqwZ','84','1451925943','2016-01-04 13:45:43','2016-01-04 13:45:43'), ('353rosYMsxGxTXNAm69aanNigLJkXeOxZTJFZuro','82','1451925238','2016-01-04 13:33:58','2016-01-04 13:33:58'), ('3eodv5PS4VWrvgZPB64dUZPYGMiQ4rKAoH3888ia','17','1451876828','2016-01-04 00:07:08','2016-01-04 00:07:08'), ('3F6Jlf5d18XDcHdhNfnEvQX4QlU2MOrxVgtT0QYL','125','1451947708','2016-01-04 19:48:28','2016-01-04 19:48:28'), ('3gPZkEHKcQU4qX60s0wTlTJ7if7RogXbzSMXSiiF','156','1451954409','2016-01-04 21:40:09','2016-01-04 21:40:09'), ('3pZuW5Smnhuk4gwXzPieWBf1NgLrPRmdJC0qTWfQ','172','1451962262','2016-01-04 23:51:02','2016-01-04 23:51:02'), ('3SEQzqJzOonLV7dJ4qj3Au7R3zngRL2Cr0vTTvXG','103','1451939206','2016-01-04 17:26:46','2016-01-04 17:26:46'), ('4sJSm2IOw82lWdRUAvQmLszlWolQWhdVMb2suZaM','141','1451951069','2016-01-04 20:44:29','2016-01-04 20:44:29'), ('4WUtoWAhREVYCVeUeocVVnLcMWkf03A8jnWnrvr9','137','1451950637','2016-01-04 20:37:17','2016-01-04 20:37:17'), ('4YfMmDPI4ywjlWlI3l18sSvLxMyVcDuiCFZrwSvB','1','1451857458','2016-01-03 18:44:18','2016-01-03 18:44:18'), ('64yXZcniLsHlr11LhhxHvQ9JKaeIH2Y8oL3a8yf6','100','1451938858','2016-01-04 17:20:58','2016-01-04 17:20:58'), ('66t25vSkkfabDVZMIlSEgVdgnYra9frZGA0No7wa','74','1451915698','2016-01-04 10:54:59','2016-01-04 10:54:59'), ('6CTwRsTSHYb0lfnX6DQC8zNwbtTmRYS6J5OPKsTH','28','1451879180','2016-01-04 00:46:20','2016-01-04 00:46:20'), ('6qfr9BrP9Ds60MTT6ObpMNqxH8mB7n8Qx6LJbL35','180','1451968936','2016-01-05 01:42:16','2016-01-05 01:42:16'), ('6y2XWrdtxSBIDqbfR5L6drjBOitmQ2quM75bDWR6','29','1451879316','2016-01-04 00:48:36','2016-01-04 00:48:36'), ('788u0OsxLhOLMxmCjWoGQx61KxLUhRcUgn759HPZ','58','1451908608','2016-01-04 08:56:48','2016-01-04 08:56:48'), ('7ayM8Ak5lzJbLjngd6sDGN5fEJ2POkh1w7vnXYk4','87','1451928269','2016-01-04 14:24:29','2016-01-04 14:24:29'), ('7gnwqQyJnrsGQeqAjEgNpt1lAWyFjZWPTowadacB','181','1451971657','2016-01-05 02:27:37','2016-01-05 02:27:37'), ('7x3wXOIn3k6WXnQoVFYEIpMJFIdaK04nf41rRg8f','174','1451963058','2016-01-05 00:04:18','2016-01-05 00:04:18'), ('86HBWhQe7f5RdOqGLWHn5UqYhJ1CxHpv3joyfzyE','76','1451916573','2016-01-04 11:09:33','2016-01-04 11:09:33'), ('8a4lqPojfkRv77Dj7teLgSrh3SkDRU9gCo0m8lrw','46','978312483','2000-12-31 22:28:04','2000-12-31 22:28:04'), ('8DRMyEA49fUhUxlEs0HaECXRjJ03jsDr8SYxHQDL','106','1451940402','2016-01-04 17:46:42','2016-01-04 17:46:42'), ('8hAHnMdFZGiFKyKq7mW1JPn8bpkXGbjQW2g7sQJB','166','1451957626','2016-01-04 22:33:46','2016-01-04 22:33:46'), ('8PmCoQ8HylCpbxThBEQo7zE0kyExJzkxCecpiD84','53','1451906639','2016-01-04 08:23:59','2016-01-04 08:23:59'), ('8TGxRUNqj2nI67fz1NbUNyy0n3Q05GE2hJY03Dx2','50','978313612','2000-12-31 22:46:52','2000-12-31 22:46:52'), ('8WsdUjhG0nvjRhXZSNdbC5XCY74eFNbKltgTkeFK','188','1452016338','2016-01-05 14:52:18','2016-01-05 14:52:18'), ('8XMIagE5kAjLLoYj8w0DjfhMKZvSzIx1Msg9FBKj','66','1451911753','2016-01-04 09:49:13','2016-01-04 09:49:13'), ('8y2Oj5Esh6bJuGwvtPF7V3xNA5z03ztlMrQ1MzLC','140','1451951068','2016-01-04 20:44:28','2016-01-04 20:44:28'), ('9Bh516euurpeJKcaTCTXEZCe4EFgWd44C6xEQAmg','153','1451954174','2016-01-04 21:36:15','2016-01-04 21:36:15'), ('9M4IjGmAiFU4WWzx1iyfCOdJOPOboJzQ3zMfwHW6','30','1451879416','2016-01-04 00:50:16','2016-01-04 00:50:16'), ('9rgKihw7X7lENBqnyq4FC2q38MCPlQ4ThJLvCsGm','14','1451875774','2016-01-03 23:49:34','2016-01-03 23:49:34'), ('a4tUHAyC4rm8X3VCY4zNaDyqrJ00HnVGppkesRA0','92','1451935418','2016-01-04 16:23:38','2016-01-04 16:23:38'), ('aIk2FP2dR9pIRcnNve668axvDjL0s15kfiBFepvK','143','1451952433','2016-01-04 21:07:14','2016-01-04 21:07:14'), ('AiKR87oy85GubkPUbDjurP2YXK2niKC0MBDKrI8W','102','1451939086','2016-01-04 17:24:46','2016-01-04 17:24:46'), ('AmAfff0GN0blPH1T1vFXHHasYGzAc0awQtJzoPVW','38','1451881323','2016-01-04 01:22:03','2016-01-04 01:22:03'), ('AtFwCdRcGVUw9tfd3UTO34r5VPuBrsr0YvmBEjS7','52','978313922','2000-12-31 22:52:02','2000-12-31 22:52:02'), ('aYdVyalMUfIRbel4uMrvFR7bjsjEFd0sPoTF6Bek','138','1451950744','2016-01-04 20:39:04','2016-01-04 20:39:04'), ('b6UgndSOFn2gSSO2r2c0FrQML8mbfOkgVPEN0oFv','108','1451941785','2016-01-04 18:09:45','2016-01-04 18:09:45'), ('bgDmQIDUuS3aWHw6b4gtFIAg0vqJ9MOmYa2ki54O','97','1451936834','2016-01-04 16:47:14','2016-01-04 16:47:14'), ('BghdDmIn0VbLpG6gKNtDgvyZueg0iJFr62SWwf1D','151','1451953541','2016-01-04 21:25:41','2016-01-04 21:25:41'), ('cLq6X44MwluFbLUBAKn4ZsYxaJILzjuyutBW65ZX','99','1451938415','2016-01-04 17:13:35','2016-01-04 17:13:35'), ('CLSwfYCwUi7qyZbuqhHEY7P6kYLligRx0pkXubBb','162','1451956467','2016-01-04 22:14:27','2016-01-04 22:14:27'), ('cq0wVdJSdAeQDiEvIdUhw34NFUTVrZkHeSIzIjnV','59','1451908834','2016-01-04 09:00:35','2016-01-04 09:00:35'), ('Cw5SmgAmlhg6aeUMG6t13PScsYLY90MtmqRhE1Pe','183','1451972136','2016-01-05 02:35:36','2016-01-05 02:35:36'), ('d7DVU0stPQ5S2iprExw95jgvK8RG1SrkdpPWRhBD','83','1451925845','2016-01-04 13:44:05','2016-01-04 13:44:05'), ('DeUnnA2ooq44ppEUleVmlo3qltfWdNBzdtrUcCPf','49','978313087','2000-12-31 22:38:07','2000-12-31 22:38:07'), ('dGh2gpkNV2Qpk6VmFQllCtDsKqRk6ZUxcdZLaSEO','150','1451953386','2016-01-04 21:23:06','2016-01-04 21:23:06'), ('dgQpS3zODpvZ5RcuRQoImKQuMWXLcgQKuW2Kj2PN','86','1451927267','2016-01-04 14:07:48','2016-01-04 14:07:48'), ('dJPnO5wsihOrOtaKXN1GZeRCzfpK0ha8vQq7aXRJ','40','1451881816','2016-01-04 01:30:16','2016-01-04 01:30:16'), ('dnXiMGX7KRMOq5BhhxgWd6f29Bl2vvSdvlXYY0Fk','91','1451935333','2016-01-04 16:22:13','2016-01-04 16:22:13'), ('dvzqQbdbTyh6MY0k0m5B6cUxGP7Yfs3hW7l38Uao','68','1451912286','2016-01-04 09:58:06','2016-01-04 09:58:06'), ('DXQnbEOgyAk2iI7ShgBUmR1qOnNnAaZ4KcXfFKIf','62','1451910335','2016-01-04 09:25:35','2016-01-04 09:25:35'), ('EffXoXNXYjOLC6C90q2XUkeZf3FJXgKRWY4saWie','33','1451880077','2016-01-04 01:01:17','2016-01-04 01:01:17'), ('eK1VHm4lsw1FRHcgoPELqwqYtiamTXRQrYgRws3f','113','1451943961','2016-01-04 18:46:01','2016-01-04 18:46:01'), ('EThfFqhRxj2V1amEtrkfLvfyAAyOL6F8ZCr9ypFy','139','1451950955','2016-01-04 20:42:35','2016-01-04 20:42:35'), ('EykilZJSzPt8iLOg5SjUiViZVN3Xs5ILNykJLaEq','186','1452016202','2016-01-05 14:50:02','2016-01-05 14:50:02'), ('F1QjilS5PTHI1rM5Wwuo4j005SviZ2HjquAI6SMX','96','1451936198','2016-01-04 16:36:38','2016-01-04 16:36:38'), ('f2CAqBPFUYN93Mz6MiA4WqMqPl3imLkFB6jZDXU7','7','1451860452','2016-01-03 19:34:12','2016-01-03 19:34:12'), ('F7pKxWEJfPjzr5wNCBzWMAlVKRqoNGWGhKVq6z0S','3','1451858401','2016-01-03 19:00:01','2016-01-03 19:00:01'), ('feOUTG9jqW3nt3XuiFy5CXjZnDxHi0dLNKE9GyOS','90','1451935154','2016-01-04 16:19:14','2016-01-04 16:19:14'), ('fNET5UNpR01o8yZ6hA9ctHdQ8Kc54NJ3rnLJnf9N','184','1452002522','2016-01-05 11:02:05','2016-01-05 11:02:05'), ('FtYOMRc0cO6wzsI7v0ia4Bvkf6VsG12Uvy5vFumX','149','1451953254','2016-01-04 21:20:54','2016-01-04 21:20:54'), ('g27SYzH4Svs3RwNDXbBJmZhwI1wm0lDFLdrrZjOI','130','1451948325','2016-01-04 19:58:46','2016-01-04 19:58:46'), ('gjha3jToIL0HFWqp1QzNvQiDOJH92bATDlGOrnbG','63','1451910584','2016-01-04 09:29:44','2016-01-04 09:29:44'), ('glYnlSYUGKFjNwKdU2ErbL834uWw3BMkv5Qu0CIa','88','1451928396','2016-01-04 14:26:36','2016-01-04 14:26:36'), ('gM9Ck6bojVb6dKMKq8MEF30RTznRtQ5HOST8hHMq','12','1451873754','2016-01-03 23:15:54','2016-01-03 23:15:54'), ('gotIq0Tkxt8xL898zbweOos4Nl3zKctO5tBWBSpF','73','1451915525','2016-01-04 10:52:05','2016-01-04 10:52:05'), ('gS10RKNQkJ5nhpOQAE2futQezNmDYzsDvrJiMlFh','135','1451949831','2016-01-04 20:23:51','2016-01-04 20:23:51'), ('h9xD9nTPBGPeSNRLhQxn2QvVVcQ8irNvsksxKAL4','51','978313751','2000-12-31 22:49:11','2000-12-31 22:49:11'), ('HDL4hC3iAcmtvj85z5GtvhaI0n4w6pBoApYpzuj7','128','1451948249','2016-01-04 19:57:29','2016-01-04 19:57:29'), ('HENxPfwM0wqrTUvHdTagMFfVD7MXthSidqjuBDjZ','22','1451877911','2016-01-04 00:25:11','2016-01-04 00:25:11'), ('Hf3tQQ72OrH2VRR3RqlRJIVHuUrU7tBtjNgG7xSl','146','1451952864','2016-01-04 21:14:24','2016-01-04 21:14:24'), ('hpCpWqsge6bAa8LkRHS9IhznwZ0o4s0rwsM3ULff','24','1451878177','2016-01-04 00:29:37','2016-01-04 00:29:37'), ('IV2pQwUQzRTn6UnPT80azc926Wr5QF5Ks7AQ7VlS','79','1451924646','2016-01-04 13:24:07','2016-01-04 13:24:07'), ('iwdbu5XU5yPkGKPEwWMJ8IDF7h08Rrf6zMcoQrT6','133','1451948752','2016-01-04 20:05:53','2016-01-04 20:05:53'), ('JaSMjbmwu2wj3QO6xdfABOfNcGznxNins1onVXR1','43','978311351','2000-12-31 22:09:12','2000-12-31 22:09:12'), ('jIeeVOLLpVT7IKMdYHAsL9IIQkWktLqp8oqF1RgC','178','1451967931','2016-01-05 01:25:32','2016-01-05 01:25:32'), ('JjUfWE6INjtOKVGRKutL2Q7GuRN7iJgH8eCdo75o','8','1451861553','2016-01-03 19:52:33','2016-01-03 19:52:33'), ('JqLxx0SPys5lFFQrLLQB0OnynDq3MrjeOCFRkZCu','20','1451877386','2016-01-04 00:16:26','2016-01-04 00:16:26'), ('Jtj7u5myv26oZhFvCgBialgw8DQ7mtSjzEx04YwQ','142','1451951430','2016-01-04 20:50:30','2016-01-04 20:50:30'), ('K094p1WfyiYD4L84jtJo7pjjvngLXnVWRacSwMWk','89','1451935043','2016-01-04 16:17:23','2016-01-04 16:17:23'), ('k0ETvMaUMPrMjF5QHtB5vNcu0VEMOivCZg8BLpcq','67','1451912092','2016-01-04 09:54:52','2016-01-04 09:54:52'), ('K3Sa8PXeH9j3p2yQko7kfldWsuKgJOjQgDzzF595','32','1451879960','2016-01-04 00:59:20','2016-01-04 00:59:20'), ('KCNfZHxjkURHwILRZD1QMpDdg1E7ZdWLGPaCQeYg','112','1451943894','2016-01-04 18:44:54','2016-01-04 18:44:54'), ('kE6K7jPiF3ej08fxtzzRl8EmWxkWNOSf7bQkT3m6','11','1451869638','2016-01-03 22:07:18','2016-01-03 22:07:18'), ('kte2mlvK99KccCEQWQUMk5IF3ML68XxNo2aiD5sj','164','1451957145','2016-01-04 22:25:45','2016-01-04 22:25:45');
INSERT INTO `oauth_access_tokens` VALUES ('L2D2hMv1FIRfjvveEzQmt7ra0jw9otpDwAMIDefm','77','1451924338','2016-01-04 13:18:58','2016-01-04 13:18:58'), ('l5ZvwpRzXicXjKerzOgw6wkxSDRD3ieNdZUucTPz','163','1451956557','2016-01-04 22:15:57','2016-01-04 22:15:57'), ('lAeUm9ktZykQnxsdjiYzHhDaiSmP3KafhCP3aMUI','21','1451877719','2016-01-04 00:21:59','2016-01-04 00:21:59'), ('LaSk4ny6ZFNgK4bH35QdixSxKypGcwFt3GP5br2x','155','1451954408','2016-01-04 21:40:08','2016-01-04 21:40:08'), ('lfzJH6upsMLV0k77Pn7BWV6CWPso6qxwWZIjbIyg','2','1451857602','2016-01-03 18:46:42','2016-01-03 18:46:42'), ('lHui9hUmoqjsnmM7dB0bhHbU6T9Yv8LCrB6Pzich','48','978312851','2000-12-31 22:34:11','2000-12-31 22:34:11'), ('lkxZNOgoMKoLEctsaadLnUm4DWBywje8HiOpVveD','9','1451862728','2016-01-03 20:12:08','2016-01-03 20:12:08'), ('lRMGf3kMI095VMo1oq8s6DD4oNXVgttbu9P7EOjw','105','1451939989','2016-01-04 17:39:49','2016-01-04 17:39:49'), ('LSHuxadVxqh2cKtUoEdzZMkWNCz7JzlfnmKneREf','177','1451965292','2016-01-05 00:41:32','2016-01-05 00:41:32'), ('lUIL5bCWa20spLikFAGl3sH89A2daDzsGzqgxuqA','159','1451954719','2016-01-04 21:45:19','2016-01-04 21:45:19'), ('mAwByx9m8c56lV1diSmnRAvVh6pjQIm05SgHHVdd','70','1451912971','2016-01-04 10:09:31','2016-01-04 10:09:31'), ('MGEAVskHIegwXydXLgowDZ5NiI1Q1gC4YdPkvT58','107','1451940585','2016-01-04 17:49:45','2016-01-04 17:49:45'), ('ml0OemQ43Zmkiqb3TeC5bISd6oFr83takmSW4TvE','175','1451963178','2016-01-05 00:06:18','2016-01-05 00:06:18'), ('moUKpoZF9iZ11sSb3xNHn6PUkUkQ8CrKnJ78KUzo','98','1451937998','2016-01-04 17:06:38','2016-01-04 17:06:38'), ('MPyDhxmRjcMy5z2QUMLO4L529FxRMqj4dWBe8844','85','1451926088','2016-01-04 13:48:08','2016-01-04 13:48:08'), ('Mqk2njkp7ZFyQKzqpzmu2664eYCpEVbYwspNzZI7','126','1451947709','2016-01-04 19:48:29','2016-01-04 19:48:29'), ('mSU7cRAAiI4hBGHmaRkmDg4A3syYDRCtNZXySRyR','26','1451878622','2016-01-04 00:37:02','2016-01-04 00:37:02'), ('mvRbaD3Pvt1viQxwojhyf76q5ZIGJWN7nuI5mFej','13','1451875627','2016-01-03 23:47:07','2016-01-03 23:47:07'), ('mx5nUemei5ShzftouBbI7xgzxPLMg7H2umfYzoPS','71','1451913534','2016-01-04 10:18:54','2016-01-04 10:18:54'), ('MyoCs75H78j7RXAegrVrPFLbt9k3AeUzxEtrWMkk','169','1451960526','2016-01-04 23:22:07','2016-01-04 23:22:07'), ('N06nvMd2mFNQH75xm37NXr0JmjNz3QY8GMlQ5XMr','132','1451948584','2016-01-04 20:03:04','2016-01-04 20:03:04'), ('N0pZZ25Z6S8zR2thCS6ki56UmGSqziuqNsB6XaYM','15','1451875901','2016-01-03 23:51:42','2016-01-03 23:51:42'), ('NCYqrR30smn40ZG7AhGG5C9X9hK46fqju3MKL671','110','1451942981','2016-01-04 18:29:41','2016-01-04 18:29:41'), ('NFa13OVOFdh6vzU3Cn2ot2tM5ScU8drZGP4V8IYt','5','1451859582','2016-01-03 19:19:42','2016-01-03 19:19:42'), ('nK09inumbYcha42eteYoGmje6SodMomAmOTfHQf7','45','978312374','2000-12-31 22:26:14','2000-12-31 22:26:14'), ('NKhvBu4hF2zWe5187y83Pro2tqxIt0vKDc5pksQP','54','1451907555','2016-01-04 08:39:15','2016-01-04 08:39:15'), ('Nv5ypoeS6SlKt1f1jFxNw6sps0unob4mw03YIwLW','75','1451916096','2016-01-04 11:01:36','2016-01-04 11:01:36'), ('OJgxWKOJALTqg0FynsNexqJk7OJq9fGQZ8MJf7uY','179','1451968345','2016-01-05 01:32:25','2016-01-05 01:32:25'), ('omcPCzeQvJ3omvv33SFKGjA7lXjNeEbqw3OgQMok','157','1451954550','2016-01-04 21:42:30','2016-01-04 21:42:30'), ('oyJXRKJ86gmsTwhEODzAg5rOfSyyXOcHlyJjGGJ9','176','1451964015','2016-01-05 00:20:16','2016-01-05 00:20:16'), ('OzacUkGOi6ZJxovKWhYsW62zwbmBJ9LOkOTj1omH','120','1451945295','2016-01-04 19:08:15','2016-01-04 19:08:15'), ('ozQUHETWShMWmKlZQXHMtZbAOWaCOlf9o92Ve7VA','6','1451859640','2016-01-03 19:20:40','2016-01-03 19:20:40'), ('Pc65ANOEQ4ffeLFCeftIGfcZs1Cp28gqChihgsth','185','1452014225','2016-01-05 14:17:05','2016-01-05 14:17:05'), ('phHvVN9EVmhTJkNMJdYmV56tAJJXFN8IMkxj0SY4','16','1451875975','2016-01-03 23:52:55','2016-01-03 23:52:55'), ('PjIksbwtwYXwLDjSxuWn0Fqesdm2VZpHA0dqiuSb','136','1451950636','2016-01-04 20:37:16','2016-01-04 20:37:16'), ('PLzcEHnx9lsZ7NuLzphSMf2bQ2qzc4hC5jXYWRM6','81','1451925194','2016-01-04 13:33:14','2016-01-04 13:33:14'), ('PnkAFZd4XAlb07ofpZzicdPsSht5tkqEV8kjlGyD','39','1451881814','2016-01-04 01:30:14','2016-01-04 01:30:14'), ('PYOPhfLllC9bHkpqVT3O6BPSitOx9UogmF7jxP9r','148','1451953253','2016-01-04 21:20:53','2016-01-04 21:20:53'), ('pYvMSABkzgS9JOgNtNWbBl9RJphVKDOQSso7cMRj','134','1451949469','2016-01-04 20:17:49','2016-01-04 20:17:49'), ('q93g2KPh3ptx5IyC0NlGDGJAplyylPEcMhb7IO3k','165','1451957146','2016-01-04 22:25:46','2016-01-04 22:25:46'), ('QcELudkg3sCqL515LmKtYomogDYu8HI65SXVl5pi','121','1451945933','2016-01-04 19:18:54','2016-01-04 19:18:54'), ('qPwRPg1S8EqOHtTVBRsWY98zj3MD4nMvPCLDUVK3','23','1451878085','2016-01-04 00:28:05','2016-01-04 00:28:05'), ('qTE7BkbSNEFSLBsmNLY4D1tpfeI9HTTSUvLbAIbO','124','1451947633','2016-01-04 19:47:13','2016-01-04 19:47:13'), ('qtzzRhh9WOCEPwNZr0HYz8D5CDfuqbq35DlN874F','167','1451958652','2016-01-04 22:50:53','2016-01-04 22:50:53'), ('QYBUP0JGVieeKNjVTqcQvbcTGxpNeH6AQipQkwOd','56','1451908020','2016-01-04 08:47:00','2016-01-04 08:47:00'), ('QZXFBbNc5jB3kxYAGlpdNYJfpme0KiluW8Tc98Qj','47','978312698','2000-12-31 22:31:38','2000-12-31 22:31:38'), ('R3NGZQfVgrTIpQH9AqOgdFeOcVzkEIeSfQ2GrLpy','131','1451948461','2016-01-04 20:01:02','2016-01-04 20:01:02'), ('r5e1v6axVRN0tjnOXrsjgE932EaiLBAYn2mMqXDH','189','1452016435','2016-01-05 14:53:55','2016-01-05 14:53:55'), ('R7rGxrXBDvdWBbpa9bfOZnNOEotDcDNWRGQfdkDW','60','1451909030','2016-01-04 09:03:50','2016-01-04 09:03:50'), ('RGFu1LOABaOshITWP7qGj5l28c7vm91yw1AGQtCx','109','1451942977','2016-01-04 18:29:37','2016-01-04 18:29:37'), ('rPnxkfhYnIClZFlZA225CUFFr3za4V9lp5OVSZVV','152','1451953916','2016-01-04 21:31:56','2016-01-04 21:31:56'), ('Rq9JWnErUdl4xuStijnfAkFrPyx8G0DYPVHaVfCy','18','1451876944','2016-01-04 00:09:04','2016-01-04 00:09:04'), ('RVIkudtcJDvESGzFQgG7DveeSHRP4ZM8KXah5Jkm','116','1451944281','2016-01-04 18:51:21','2016-01-04 18:51:21'), ('rVZLgaVubQ4JJwLpQji9Sft72jYBwsJModOPd9sX','78','1451924341','2016-01-04 13:19:01','2016-01-04 13:19:01'), ('S5Xb8hhJX4Cx1ZL8lEoEUuSd3DHHfS7avaDeVEgk','69','1451912822','2016-01-04 10:07:02','2016-01-04 10:07:02'), ('SD4KB3uwUTviXc1wIPZIDB1goxJ6GRTosg04CRkT','161','1451955963','2016-01-04 22:06:04','2016-01-04 22:06:04'), ('seTktkUz46kVZqlt0YRuuMUkcgq0N3YWysqJUSf1','61','1451909701','2016-01-04 09:15:01','2016-01-04 09:15:01'), ('Sk9co1Q7hK2BSFPxrrPua2mGE4Deu2yceFZ21H7i','171','1451961794','2016-01-04 23:43:14','2016-01-04 23:43:14'), ('sMO0PlotLbPpZBHL1leEpYmUjPlCKE4LVvrNHZkY','147','1451953127','2016-01-04 21:18:47','2016-01-04 21:18:47'), ('sntyNGPTXJNRgyeJx7qYRGdQQYMLeqaEwEiNJMXf','129','1451948324','2016-01-04 19:58:44','2016-01-04 19:58:44'), ('SofpzcQBvq2EtaF9e5c2hpcequyRK9tHa5pEWmxE','10','1451869266','2016-01-03 22:01:06','2016-01-03 22:01:06'), ('SSW5YBeVzlrsy5JmvFVx38ukOhlhPQmrmpd29Hfb','93','1451935556','2016-01-04 16:25:56','2016-01-04 16:25:56'), ('su5xaziGcC0OHxHTxED2TLSFhRTe8XinX4N0izog','80','1451924648','2016-01-04 13:24:08','2016-01-04 13:24:08'), ('SYXNXbGM5upavuX6liqzfOZDWYlDJWFSh6mBwIRG','64','1451910808','2016-01-04 09:33:28','2016-01-04 09:33:28'), ('T7Rw8T6phpiBs1P3vL0wUCMuUb7Z7stWr4uUeHoH','191','1452016945','2016-01-05 15:02:25','2016-01-05 15:02:25'), ('TDLXRvOfTtAbDmufqabOo5h8vBRp3LEQKRHsotw0','25','1451878620','2016-01-04 00:37:00','2016-01-04 00:37:00'), ('TtUbKWYzOoBmhGhDdeY1jiAb8h737EVSjroaAW9h','145','1451952864','2016-01-04 21:14:24','2016-01-04 21:14:24'), ('tzwsZjeCJ0ACaAZoLP16o52Jagg8UzoKgKpQ1CdG','127','1451948100','2016-01-04 19:55:00','2016-01-04 19:55:00'), ('uC7bpz912K6Z4nzI3N4awus1uv4ptwAjfoAABKkn','114','1451943963','2016-01-04 18:46:03','2016-01-04 18:46:03'), ('UiAnGTZg1OW30xJ13vyDL3yYE4oCI9W0uBdatRre','101','1451938983','2016-01-04 17:23:03','2016-01-04 17:23:03'), ('UM164i2KMHsZJ6vNnm4prnZP4KqizKThmOpI7IU5','42','1451884389','2016-01-04 02:13:09','2016-01-04 02:13:09'), ('urHyElia9jyvWoz6iiy9Bo8dWX4oyJOiq482HMU8','95','1451935737','2016-01-04 16:28:57','2016-01-04 16:28:57'), ('uZhSvkqt9Shooz2nPCrM7Rnw88wRbHsPr0rRYXYh','160','1451954916','2016-01-04 21:48:36','2016-01-04 21:48:36'), ('uzrEIC29FoKTHVWtlrrlnq58aJ53AGXlpG29yS60','170','1451960967','2016-01-04 23:29:28','2016-01-04 23:29:28'), ('VAXxi0F7n3ouHmNK8hOORqLjbxa9LMTOdlsb3dtX','44','978312148','2000-12-31 22:22:28','2000-12-31 22:22:28'), ('vFYqvgyoySoRmA1Wm35zgf8TO8LLQRxKcV2UhVgT','173','1451963056','2016-01-05 00:04:16','2016-01-05 00:04:16'), ('vQJIRdm0l6aXqfOQuXTi8sIrQ2hSIeiUhWdli47u','123','1451947358','2016-01-04 19:42:39','2016-01-04 19:42:39'), ('WgZEIy5SHmbDSN2Y19Tjx2bIg7PCwJzK3Rf4gb3j','119','1451945018','2016-01-04 19:03:38','2016-01-04 19:03:38'), ('WoLfdIIzGRYGv0PvFeWUhsM6yxj2TjT4r2E1TUm8','117','1451944360','2016-01-04 18:52:40','2016-01-04 18:52:40'), ('wsJJICRd0AVvFZAxwLuAs8M0FhN3mh55hphkLmec','31','1451879697','2016-01-04 00:54:57','2016-01-04 00:54:57'), ('WTirCEpN0oeeUTU5ytVGvXShwMwSI0pCUAJftrlM','192','1452027093','2016-01-05 17:51:33','2016-01-05 17:51:33'), ('WZbHPzn9Vrb27ifwYSUXTbBVaGxOvJZjMmMCd5pp','122','1451946779','2016-01-04 19:32:59','2016-01-04 19:32:59'), ('XHhOqijpEjO5o1idk5CV17AvPd9EDBRdgqZxag1e','36','1451880310','2016-01-04 01:05:10','2016-01-04 01:05:10'), ('xLXmRwPvAMBaAhlIOjFKnhp4JRcP41S4EKinXul0','94','1451935669','2016-01-04 16:27:50','2016-01-04 16:27:50'), ('xNGl6SN1ToEbIleF2ms6DiI6anzr7jBvA75ZzQPS','168','1451960006','2016-01-04 23:13:26','2016-01-04 23:13:26'), ('YGLqnoueF4Cr6aPbthyb2PmNdikIGUBYLm08A71d','27','1451878862','2016-01-04 00:41:02','2016-01-04 00:41:02'), ('YMPLONmOtPfAguMM0TkcYoHRQuvqrIQkIJdcZ301','41','1451882842','2016-01-04 01:47:22','2016-01-04 01:47:22'), ('YyeLUTrez0BZQ7kQz5ehVpjQY7gDLvstvAmFpYWj','118','1451944420','2016-01-04 18:53:40','2016-01-04 18:53:40'), ('zDREjvr0LUOzQLGxRpGBzIv2NNzx475lGX3sZq9j','57','1451908192','2016-01-04 08:49:52','2016-01-04 08:49:52'), ('ZsXdKQGMoLkOY6UCt0gB5czqihcqMMQxhVXfh9ON','55','1451907640','2016-01-04 08:40:40','2016-01-04 08:40:40'), ('zxaIvOXqjpS3ovZPiRFibkGlqyHRPgVuePuVAzAl','19','1451877034','2016-01-04 00:10:34','2016-01-04 00:10:34'), ('ZZs3I6bpOb83LTtkwfZgCFjZi9gEjaqQ49Wrv9sg','4','1451859485','2016-01-03 19:18:05','2016-01-03 19:18:05');
INSERT INTO `oauth_clients` VALUES ('1','secret','conquist','2016-01-03 00:00:00','2016-01-03 00:00:00');
INSERT INTO `oauth_sessions` VALUES ('1','1','user','2',NULL,'2016-01-03 18:44:18','2016-01-03 18:44:18'), ('2','1','user','2',NULL,'2016-01-03 18:46:42','2016-01-03 18:46:42'), ('3','1','user','2',NULL,'2016-01-03 19:00:01','2016-01-03 19:00:01'), ('4','1','user','2',NULL,'2016-01-03 19:18:05','2016-01-03 19:18:05'), ('5','1','user','2',NULL,'2016-01-03 19:19:42','2016-01-03 19:19:42'), ('6','1','user','2',NULL,'2016-01-03 19:20:40','2016-01-03 19:20:40'), ('7','1','user','2',NULL,'2016-01-03 19:34:12','2016-01-03 19:34:12'), ('8','1','user','2',NULL,'2016-01-03 19:52:33','2016-01-03 19:52:33'), ('9','1','user','2',NULL,'2016-01-03 20:12:08','2016-01-03 20:12:08'), ('10','1','user','2',NULL,'2016-01-03 22:01:06','2016-01-03 22:01:06'), ('11','1','user','2',NULL,'2016-01-03 22:07:18','2016-01-03 22:07:18'), ('12','1','user','2',NULL,'2016-01-03 23:15:54','2016-01-03 23:15:54'), ('13','1','user','2',NULL,'2016-01-03 23:47:07','2016-01-03 23:47:07'), ('14','1','user','2',NULL,'2016-01-03 23:49:34','2016-01-03 23:49:34'), ('15','1','user','2',NULL,'2016-01-03 23:51:41','2016-01-03 23:51:41'), ('16','1','user','2',NULL,'2016-01-03 23:52:55','2016-01-03 23:52:55'), ('17','1','user','2',NULL,'2016-01-04 00:07:08','2016-01-04 00:07:08'), ('18','1','user','2',NULL,'2016-01-04 00:09:04','2016-01-04 00:09:04'), ('19','1','user','2',NULL,'2016-01-04 00:10:34','2016-01-04 00:10:34'), ('20','1','user','2',NULL,'2016-01-04 00:16:26','2016-01-04 00:16:26'), ('21','1','user','2',NULL,'2016-01-04 00:21:59','2016-01-04 00:21:59'), ('22','1','user','2',NULL,'2016-01-04 00:25:11','2016-01-04 00:25:11'), ('23','1','user','2',NULL,'2016-01-04 00:28:05','2016-01-04 00:28:05'), ('24','1','user','2',NULL,'2016-01-04 00:29:37','2016-01-04 00:29:37'), ('25','1','user','2',NULL,'2016-01-04 00:37:00','2016-01-04 00:37:00'), ('26','1','user','2',NULL,'2016-01-04 00:37:02','2016-01-04 00:37:02'), ('27','1','user','2',NULL,'2016-01-04 00:41:02','2016-01-04 00:41:02'), ('28','1','user','2',NULL,'2016-01-04 00:46:20','2016-01-04 00:46:20'), ('29','1','user','2',NULL,'2016-01-04 00:48:36','2016-01-04 00:48:36'), ('30','1','user','2',NULL,'2016-01-04 00:50:16','2016-01-04 00:50:16'), ('31','1','user','2',NULL,'2016-01-04 00:54:57','2016-01-04 00:54:57'), ('32','1','user','2',NULL,'2016-01-04 00:59:20','2016-01-04 00:59:20'), ('33','1','user','2',NULL,'2016-01-04 01:01:17','2016-01-04 01:01:17'), ('34','1','user','2',NULL,'2016-01-04 01:02:45','2016-01-04 01:02:45'), ('35','1','user','2',NULL,'2016-01-04 01:02:47','2016-01-04 01:02:47'), ('36','1','user','2',NULL,'2016-01-04 01:05:10','2016-01-04 01:05:10'), ('37','1','user','2',NULL,'2016-01-04 01:05:12','2016-01-04 01:05:12'), ('38','1','user','2',NULL,'2016-01-04 01:22:03','2016-01-04 01:22:03'), ('39','1','user','2',NULL,'2016-01-04 01:30:14','2016-01-04 01:30:14'), ('40','1','user','2',NULL,'2016-01-04 01:30:16','2016-01-04 01:30:16'), ('41','1','user','2',NULL,'2016-01-04 01:47:22','2016-01-04 01:47:22'), ('42','1','user','2',NULL,'2016-01-04 02:13:09','2016-01-04 02:13:09'), ('43','1','user','2',NULL,'2000-12-31 22:09:11','2000-12-31 22:09:11'), ('44','1','user','2',NULL,'2000-12-31 22:22:28','2000-12-31 22:22:28'), ('45','1','user','2',NULL,'2000-12-31 22:26:14','2000-12-31 22:26:14'), ('46','1','user','2',NULL,'2000-12-31 22:28:04','2000-12-31 22:28:04'), ('47','1','user','2',NULL,'2000-12-31 22:31:38','2000-12-31 22:31:38'), ('48','1','user','2',NULL,'2000-12-31 22:34:11','2000-12-31 22:34:11'), ('49','1','user','2',NULL,'2000-12-31 22:38:07','2000-12-31 22:38:07'), ('50','1','user','2',NULL,'2000-12-31 22:46:52','2000-12-31 22:46:52'), ('51','1','user','2',NULL,'2000-12-31 22:49:11','2000-12-31 22:49:11'), ('52','1','user','2',NULL,'2000-12-31 22:52:02','2000-12-31 22:52:02'), ('53','1','user','2',NULL,'2016-01-04 08:23:59','2016-01-04 08:23:59'), ('54','1','user','2',NULL,'2016-01-04 08:39:15','2016-01-04 08:39:15'), ('55','1','user','2',NULL,'2016-01-04 08:40:40','2016-01-04 08:40:40'), ('56','1','user','2',NULL,'2016-01-04 08:47:00','2016-01-04 08:47:00'), ('57','1','user','2',NULL,'2016-01-04 08:49:52','2016-01-04 08:49:52'), ('58','1','user','2',NULL,'2016-01-04 08:56:48','2016-01-04 08:56:48'), ('59','1','user','2',NULL,'2016-01-04 09:00:34','2016-01-04 09:00:34'), ('60','1','user','2',NULL,'2016-01-04 09:03:50','2016-01-04 09:03:50'), ('61','1','user','2',NULL,'2016-01-04 09:15:01','2016-01-04 09:15:01'), ('62','1','user','2',NULL,'2016-01-04 09:25:35','2016-01-04 09:25:35'), ('63','1','user','2',NULL,'2016-01-04 09:29:44','2016-01-04 09:29:44'), ('64','1','user','2',NULL,'2016-01-04 09:33:28','2016-01-04 09:33:28'), ('65','1','user','2',NULL,'2016-01-04 09:44:21','2016-01-04 09:44:21'), ('66','1','user','2',NULL,'2016-01-04 09:49:13','2016-01-04 09:49:13'), ('67','1','user','2',NULL,'2016-01-04 09:54:52','2016-01-04 09:54:52'), ('68','1','user','2',NULL,'2016-01-04 09:58:06','2016-01-04 09:58:06'), ('69','1','user','2',NULL,'2016-01-04 10:07:02','2016-01-04 10:07:02'), ('70','1','user','2',NULL,'2016-01-04 10:09:31','2016-01-04 10:09:31'), ('71','1','user','2',NULL,'2016-01-04 10:18:54','2016-01-04 10:18:54'), ('72','1','user','2',NULL,'2016-01-04 10:29:58','2016-01-04 10:29:58'), ('73','1','user','2',NULL,'2016-01-04 10:52:05','2016-01-04 10:52:05'), ('74','1','user','2',NULL,'2016-01-04 10:54:59','2016-01-04 10:54:59'), ('75','1','user','2',NULL,'2016-01-04 11:01:36','2016-01-04 11:01:36'), ('76','1','user','2',NULL,'2016-01-04 11:09:33','2016-01-04 11:09:33'), ('77','1','user','2',NULL,'2016-01-04 13:18:58','2016-01-04 13:18:58'), ('78','1','user','2',NULL,'2016-01-04 13:19:01','2016-01-04 13:19:01'), ('79','1','user','2',NULL,'2016-01-04 13:24:06','2016-01-04 13:24:06'), ('80','1','user','2',NULL,'2016-01-04 13:24:08','2016-01-04 13:24:08'), ('81','1','user','2',NULL,'2016-01-04 13:33:14','2016-01-04 13:33:14'), ('82','1','user','2',NULL,'2016-01-04 13:33:58','2016-01-04 13:33:58'), ('83','1','user','2',NULL,'2016-01-04 13:44:05','2016-01-04 13:44:05'), ('84','1','user','2',NULL,'2016-01-04 13:45:43','2016-01-04 13:45:43'), ('85','1','user','2',NULL,'2016-01-04 13:48:08','2016-01-04 13:48:08'), ('86','1','user','2',NULL,'2016-01-04 14:07:47','2016-01-04 14:07:47'), ('87','1','user','2',NULL,'2016-01-04 14:24:29','2016-01-04 14:24:29'), ('88','1','user','2',NULL,'2016-01-04 14:26:36','2016-01-04 14:26:36'), ('89','1','user','2',NULL,'2016-01-04 16:17:23','2016-01-04 16:17:23'), ('90','1','user','2',NULL,'2016-01-04 16:19:14','2016-01-04 16:19:14'), ('91','1','user','2',NULL,'2016-01-04 16:22:13','2016-01-04 16:22:13'), ('92','1','user','2',NULL,'2016-01-04 16:23:38','2016-01-04 16:23:38'), ('93','1','user','2',NULL,'2016-01-04 16:25:56','2016-01-04 16:25:56'), ('94','1','user','2',NULL,'2016-01-04 16:27:50','2016-01-04 16:27:50'), ('95','1','user','2',NULL,'2016-01-04 16:28:57','2016-01-04 16:28:57'), ('96','1','user','2',NULL,'2016-01-04 16:36:38','2016-01-04 16:36:38'), ('97','1','user','2',NULL,'2016-01-04 16:47:14','2016-01-04 16:47:14'), ('98','1','user','2',NULL,'2016-01-04 17:06:38','2016-01-04 17:06:38'), ('99','1','user','2',NULL,'2016-01-04 17:13:35','2016-01-04 17:13:35'), ('100','1','user','2',NULL,'2016-01-04 17:20:58','2016-01-04 17:20:58');
INSERT INTO `oauth_sessions` VALUES ('101','1','user','2',NULL,'2016-01-04 17:23:03','2016-01-04 17:23:03'), ('102','1','user','2',NULL,'2016-01-04 17:24:46','2016-01-04 17:24:46'), ('103','1','user','2',NULL,'2016-01-04 17:26:46','2016-01-04 17:26:46'), ('104','1','user','2',NULL,'2016-01-04 17:38:46','2016-01-04 17:38:46'), ('105','1','user','2',NULL,'2016-01-04 17:39:49','2016-01-04 17:39:49'), ('106','1','user','2',NULL,'2016-01-04 17:46:42','2016-01-04 17:46:42'), ('107','1','user','2',NULL,'2016-01-04 17:49:45','2016-01-04 17:49:45'), ('108','1','user','2',NULL,'2016-01-04 18:09:45','2016-01-04 18:09:45'), ('109','1','user','2',NULL,'2016-01-04 18:29:37','2016-01-04 18:29:37'), ('110','1','user','2',NULL,'2016-01-04 18:29:41','2016-01-04 18:29:41'), ('111','1','user','2',NULL,'2016-01-04 18:42:52','2016-01-04 18:42:52'), ('112','1','user','2',NULL,'2016-01-04 18:44:54','2016-01-04 18:44:54'), ('113','1','user','2',NULL,'2016-01-04 18:46:01','2016-01-04 18:46:01'), ('114','1','user','2',NULL,'2016-01-04 18:46:03','2016-01-04 18:46:03'), ('115','1','user','2',NULL,'2016-01-04 18:48:07','2016-01-04 18:48:07'), ('116','1','user','2',NULL,'2016-01-04 18:51:21','2016-01-04 18:51:21'), ('117','1','user','2',NULL,'2016-01-04 18:52:40','2016-01-04 18:52:40'), ('118','1','user','2',NULL,'2016-01-04 18:53:40','2016-01-04 18:53:40'), ('119','1','user','2',NULL,'2016-01-04 19:03:38','2016-01-04 19:03:38'), ('120','1','user','2',NULL,'2016-01-04 19:08:15','2016-01-04 19:08:15'), ('121','1','user','2',NULL,'2016-01-04 19:18:54','2016-01-04 19:18:54'), ('122','1','user','2',NULL,'2016-01-04 19:32:59','2016-01-04 19:32:59'), ('123','1','user','2',NULL,'2016-01-04 19:42:38','2016-01-04 19:42:38'), ('124','1','user','2',NULL,'2016-01-04 19:47:13','2016-01-04 19:47:13'), ('125','1','user','2',NULL,'2016-01-04 19:48:28','2016-01-04 19:48:28'), ('126','1','user','2',NULL,'2016-01-04 19:48:29','2016-01-04 19:48:29'), ('127','1','user','2',NULL,'2016-01-04 19:55:00','2016-01-04 19:55:00'), ('128','1','user','2',NULL,'2016-01-04 19:57:29','2016-01-04 19:57:29'), ('129','1','user','2',NULL,'2016-01-04 19:58:44','2016-01-04 19:58:44'), ('130','1','user','2',NULL,'2016-01-04 19:58:46','2016-01-04 19:58:46'), ('131','1','user','2',NULL,'2016-01-04 20:01:02','2016-01-04 20:01:02'), ('132','1','user','2',NULL,'2016-01-04 20:03:04','2016-01-04 20:03:04'), ('133','1','user','2',NULL,'2016-01-04 20:05:52','2016-01-04 20:05:52'), ('134','1','user','2',NULL,'2016-01-04 20:17:49','2016-01-04 20:17:49'), ('135','1','user','2',NULL,'2016-01-04 20:23:51','2016-01-04 20:23:51'), ('136','1','user','2',NULL,'2016-01-04 20:37:16','2016-01-04 20:37:16'), ('137','1','user','2',NULL,'2016-01-04 20:37:17','2016-01-04 20:37:17'), ('138','1','user','2',NULL,'2016-01-04 20:39:04','2016-01-04 20:39:04'), ('139','1','user','2',NULL,'2016-01-04 20:42:35','2016-01-04 20:42:35'), ('140','1','user','2',NULL,'2016-01-04 20:44:28','2016-01-04 20:44:28'), ('141','1','user','2',NULL,'2016-01-04 20:44:29','2016-01-04 20:44:29'), ('142','1','user','2',NULL,'2016-01-04 20:50:30','2016-01-04 20:50:30'), ('143','1','user','2',NULL,'2016-01-04 21:07:13','2016-01-04 21:07:13'), ('144','1','user','2',NULL,'2016-01-04 21:12:41','2016-01-04 21:12:41'), ('145','1','user','2',NULL,'2016-01-04 21:14:24','2016-01-04 21:14:24'), ('146','1','user','2',NULL,'2016-01-04 21:14:24','2016-01-04 21:14:24'), ('147','1','user','2',NULL,'2016-01-04 21:18:47','2016-01-04 21:18:47'), ('148','1','user','2',NULL,'2016-01-04 21:20:53','2016-01-04 21:20:53'), ('149','1','user','2',NULL,'2016-01-04 21:20:54','2016-01-04 21:20:54'), ('150','1','user','2',NULL,'2016-01-04 21:23:06','2016-01-04 21:23:06'), ('151','1','user','2',NULL,'2016-01-04 21:25:41','2016-01-04 21:25:41'), ('152','1','user','2',NULL,'2016-01-04 21:31:56','2016-01-04 21:31:56'), ('153','1','user','2',NULL,'2016-01-04 21:36:15','2016-01-04 21:36:15'), ('154','1','user','2',NULL,'2016-01-04 21:40:07','2016-01-04 21:40:07'), ('155','1','user','2',NULL,'2016-01-04 21:40:08','2016-01-04 21:40:08'), ('156','1','user','2',NULL,'2016-01-04 21:40:09','2016-01-04 21:40:09'), ('157','1','user','2',NULL,'2016-01-04 21:42:30','2016-01-04 21:42:30'), ('158','1','user','2',NULL,'2016-01-04 21:45:18','2016-01-04 21:45:18'), ('159','1','user','2',NULL,'2016-01-04 21:45:19','2016-01-04 21:45:19'), ('160','1','user','2',NULL,'2016-01-04 21:48:36','2016-01-04 21:48:36'), ('161','1','user','2',NULL,'2016-01-04 22:06:04','2016-01-04 22:06:04'), ('162','1','user','2',NULL,'2016-01-04 22:14:27','2016-01-04 22:14:27'), ('163','1','user','2',NULL,'2016-01-04 22:15:57','2016-01-04 22:15:57'), ('164','1','user','2',NULL,'2016-01-04 22:25:45','2016-01-04 22:25:45'), ('165','1','user','2',NULL,'2016-01-04 22:25:46','2016-01-04 22:25:46'), ('166','1','user','2',NULL,'2016-01-04 22:33:46','2016-01-04 22:33:46'), ('167','1','user','2',NULL,'2016-01-04 22:50:53','2016-01-04 22:50:53'), ('168','1','user','2',NULL,'2016-01-04 23:13:26','2016-01-04 23:13:26'), ('169','1','user','2',NULL,'2016-01-04 23:22:07','2016-01-04 23:22:07'), ('170','1','user','2',NULL,'2016-01-04 23:29:28','2016-01-04 23:29:28'), ('171','1','user','2',NULL,'2016-01-04 23:43:14','2016-01-04 23:43:14'), ('172','1','user','2',NULL,'2016-01-04 23:51:02','2016-01-04 23:51:02'), ('173','1','user','2',NULL,'2016-01-05 00:04:16','2016-01-05 00:04:16'), ('174','1','user','2',NULL,'2016-01-05 00:04:18','2016-01-05 00:04:18'), ('175','1','user','2',NULL,'2016-01-05 00:06:18','2016-01-05 00:06:18'), ('176','1','user','2',NULL,'2016-01-05 00:20:16','2016-01-05 00:20:16'), ('177','1','user','2',NULL,'2016-01-05 00:41:32','2016-01-05 00:41:32'), ('178','1','user','2',NULL,'2016-01-05 01:25:32','2016-01-05 01:25:32'), ('179','1','user','2',NULL,'2016-01-05 01:32:25','2016-01-05 01:32:25'), ('180','1','user','2',NULL,'2016-01-05 01:42:16','2016-01-05 01:42:16'), ('181','1','user','2',NULL,'2016-01-05 02:27:37','2016-01-05 02:27:37'), ('182','1','user','2',NULL,'2016-01-05 02:30:29','2016-01-05 02:30:29'), ('183','1','user','2',NULL,'2016-01-05 02:35:36','2016-01-05 02:35:36'), ('184','1','user','2',NULL,'2016-01-05 11:02:04','2016-01-05 11:02:04'), ('185','1','user','2',NULL,'2016-01-05 14:17:05','2016-01-05 14:17:05'), ('186','1','user','2',NULL,'2016-01-05 14:50:02','2016-01-05 14:50:02'), ('187','1','user','2',NULL,'2016-01-05 14:51:18','2016-01-05 14:51:18'), ('188','1','user','2',NULL,'2016-01-05 14:52:18','2016-01-05 14:52:18'), ('189','1','user','2',NULL,'2016-01-05 14:53:55','2016-01-05 14:53:55'), ('190','1','user','2',NULL,'2016-01-05 14:54:49','2016-01-05 14:54:49'), ('191','1','user','2',NULL,'2016-01-05 15:02:25','2016-01-05 15:02:25'), ('192','1','user','2',NULL,'2016-01-05 17:51:33','2016-01-05 17:51:33');
INSERT INTO `roles` VALUES ('1','administrador','2016-01-03 14:11:32','2016-01-03 14:11:32'), ('2','usuario','2016-01-03 14:11:51','2016-01-03 14:11:51');
INSERT INTO `users` VALUES ('1','2','Thiago Santos','thiago.santos@conquist.com.br','$2y$10$.AmKJ0O6NLcVv7L.Tf9TBe7vawDgru4JnheDndbVhgy/gZNYnEaEe','1',NULL,'2016-01-03 18:32:59','1','2016-01-03 18:32:59');
