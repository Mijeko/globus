-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               10.4.19-MariaDB-log - mariadb.org binary distribution
-- Операционная система:         Win64
-- HeidiSQL Версия:              12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Дамп структуры базы данных globus
CREATE DATABASE IF NOT EXISTS `globus` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `globus`;

-- Дамп структуры для таблица globus.b_admin_notify
CREATE TABLE IF NOT EXISTS `b_admin_notify` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENABLE_CLOSE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `PUBLIC_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NOTIFY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  PRIMARY KEY (`ID`),
  KEY `IX_AD_TAG` (`TAG`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_admin_notify: ~1 rows (приблизительно)
DELETE FROM `b_admin_notify`;
INSERT INTO `b_admin_notify` (`ID`, `MODULE_ID`, `TAG`, `MESSAGE`, `ENABLE_CLOSE`, `PUBLIC_SECTION`, `NOTIFY_TYPE`) VALUES
	(1, 'MAIN', 'SITE_CHECKER', 'Обнаружены ошибки в работе сайта. <a href="/bitrix/admin/site_checker.php?lang=ru&start_test=Y">Проверить и исправить.</a>', 'Y', 'N', 'M');

-- Дамп структуры для таблица globus.b_admin_notify_lang
CREATE TABLE IF NOT EXISTS `b_admin_notify_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOTIFY_ID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_ADM_NTFY_LANG` (`NOTIFY_ID`,`LID`),
  KEY `IX_ADM_NTFY_LID` (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_admin_notify_lang: ~0 rows (приблизительно)
DELETE FROM `b_admin_notify_lang`;

-- Дамп структуры для таблица globus.b_agent
CREATE TABLE IF NOT EXISTS `b_agent` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT 100,
  `NAME` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_EXEC` datetime DEFAULT NULL,
  `NEXT_EXEC` datetime NOT NULL,
  `DATE_CHECK` datetime DEFAULT NULL,
  `AGENT_INTERVAL` int(11) DEFAULT 86400,
  `IS_PERIOD` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `USER_ID` int(11) DEFAULT NULL,
  `RUNNING` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RETRY_COUNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_act_next_exec` (`ACTIVE`,`NEXT_EXEC`),
  KEY `ix_agent_user_id` (`USER_ID`),
  KEY `ix_agent_name` (`NAME`(100))
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_agent: ~38 rows (приблизительно)
DELETE FROM `b_agent`;
INSERT INTO `b_agent` (`ID`, `MODULE_ID`, `SORT`, `NAME`, `ACTIVE`, `LAST_EXEC`, `NEXT_EXEC`, `DATE_CHECK`, `AGENT_INTERVAL`, `IS_PERIOD`, `USER_ID`, `RUNNING`, `RETRY_COUNT`) VALUES
	(1, 'main', 100, '\\Bitrix\\Main\\Analytics\\CounterDataTable::submitData();', 'Y', '2023-02-11 21:21:57', '2023-02-11 21:22:57', NULL, 60, 'N', NULL, 'N', 0),
	(2, 'main', 100, 'CCaptchaAgent::DeleteOldCaptcha(3600);', 'Y', '2023-02-11 20:27:19', '2023-02-11 21:27:19', NULL, 3600, 'N', NULL, 'N', 0),
	(3, 'main', 100, 'CSiteCheckerTest::CommonTest();', 'Y', '2023-02-11 18:19:20', '2023-02-12 18:19:20', NULL, 86400, 'N', NULL, 'N', 0),
	(4, 'main', 100, 'CEvent::CleanUpAgent();', 'Y', '2023-02-11 18:19:20', '2023-02-12 18:19:20', NULL, 86400, 'N', NULL, 'N', 0),
	(5, 'main', 100, 'CUser::CleanUpHitAuthAgent();', 'Y', '2023-02-11 18:19:20', '2023-02-12 18:19:20', NULL, 86400, 'N', NULL, 'N', 0),
	(6, 'main', 100, 'CUndo::CleanUpOld();', 'Y', '2023-02-11 18:19:21', '2023-02-12 18:19:21', NULL, 86400, 'N', NULL, 'N', 0),
	(7, 'main', 100, 'CUserCounter::DeleteOld();', 'Y', '2023-02-11 18:19:21', '2023-02-12 18:19:21', NULL, 86400, 'N', NULL, 'N', 0),
	(8, 'main', 100, '\\Bitrix\\Main\\UI\\Viewer\\FilePreviewTable::deleteOldAgent(22, 20);', 'Y', '2023-02-11 18:19:21', '2023-02-12 18:19:21', NULL, 86400, 'N', NULL, 'N', 0),
	(9, 'main', 100, 'CUser::AuthActionsCleanUpAgent();', 'Y', '2023-02-11 18:19:21', '2023-02-12 18:19:21', NULL, 86400, 'N', NULL, 'N', 0),
	(10, 'main', 100, 'CUser::CleanUpAgent();', 'Y', '2023-02-11 18:19:21', '2023-02-12 18:19:21', NULL, 86400, 'N', NULL, 'N', 0),
	(11, 'main', 100, 'CUser::DeactivateAgent();', 'Y', '2023-02-11 18:19:21', '2023-02-12 18:19:21', NULL, 86400, 'N', NULL, 'N', 0),
	(12, 'main', 100, 'CEventLog::CleanUpAgent();', 'Y', '2023-02-11 18:19:21', '2023-02-12 18:19:21', NULL, 86400, 'N', NULL, 'N', 0),
	(13, 'clouds', 100, 'CCloudStorage::CleanUp();', 'Y', '2023-02-11 18:19:21', '2023-02-12 18:19:21', NULL, 86400, 'N', NULL, 'N', 0),
	(14, 'forum', 100, 'CForumStat::CleanUp();', 'Y', '2023-02-11 18:19:21', '2023-02-12 18:19:21', NULL, 86400, 'N', NULL, 'N', 0),
	(15, 'forum', 100, 'CForumFiles::CleanUp();', 'Y', '2023-02-11 18:19:21', '2023-02-12 18:19:21', NULL, 86400, 'N', NULL, 'N', 0),
	(16, 'landing', 100, 'Bitrix\\Landing\\Agent::clearRecycle();', 'Y', '2023-02-11 20:20:06', '2023-02-11 22:20:06', NULL, 7200, 'N', NULL, 'N', 0),
	(17, 'landing', 100, 'Bitrix\\Landing\\Agent::clearFiles(30);', 'Y', '2023-02-11 20:27:19', '2023-02-11 21:27:19', NULL, 3600, 'N', NULL, 'N', 0),
	(18, 'landing', 100, 'Bitrix\\Landing\\Agent::sendRestStatistic();', 'Y', '2023-02-11 18:19:21', '2023-02-12 18:19:21', NULL, 86400, 'N', NULL, 'N', 0),
	(19, 'landing', 100, 'Bitrix\\Landing\\Agent::clearTempFiles();', 'Y', '2023-02-11 18:19:21', '2023-02-12 18:19:21', NULL, 86400, 'N', NULL, 'N', 0),
	(20, 'messageservice', 100, '\\Bitrix\\MessageService\\Queue::cleanUpAgent();', 'Y', '2023-02-11 18:19:21', '2023-02-12 00:00:00', NULL, 86400, 'Y', NULL, 'N', 0),
	(21, 'rest', 100, 'Bitrix\\Rest\\Marketplace\\Client::getNumUpdates();', 'Y', '2023-02-11 18:19:21', '2023-02-12 18:19:21', NULL, 86400, 'N', NULL, 'N', 0),
	(22, 'rest', 100, '\\Bitrix\\Rest\\EventOfflineTable::cleanProcessAgent();', 'Y', '2023-02-11 18:19:21', '2023-02-12 18:19:21', NULL, 86400, 'N', NULL, 'N', 0),
	(23, 'rest', 100, '\\Bitrix\\Rest\\LogTable::cleanUpAgent();', 'Y', '2023-02-11 18:19:21', '2023-02-12 18:19:21', NULL, 86400, 'N', NULL, 'N', 0),
	(24, 'rest', 100, '\\Bitrix\\Rest\\Configuration\\Helper::sendStatisticAgent();', 'Y', '2023-02-11 18:19:21', '2023-02-12 18:19:21', NULL, 86400, 'N', NULL, 'N', 0),
	(25, 'rest', 100, '\\Bitrix\\Rest\\UsageStatTable::sendAgent();', 'Y', '2023-02-11 20:27:19', '2023-02-11 21:27:19', NULL, 3600, 'N', NULL, 'N', 0),
	(26, 'rest', 100, '\\Bitrix\\Rest\\UsageStatTable::cleanUpAgent();', 'Y', '2023-02-11 20:27:19', '2023-02-11 21:27:19', NULL, 3600, 'N', NULL, 'N', 0),
	(27, 'rest', 100, '\\Bitrix\\Rest\\Marketplace\\Notification::checkAgent();', 'Y', '2023-02-11 18:19:21', '2023-02-12 18:19:21', NULL, 86400, 'N', NULL, 'N', 0),
	(28, 'rest', 100, '\\Bitrix\\Rest\\Marketplace\\Immune::load();', 'Y', '2023-02-11 18:19:31', '2023-02-12 18:19:31', NULL, 86400, 'N', NULL, 'N', 0),
	(29, 'rest', 100, '\\Bitrix\\Rest\\Configuration\\Structure::clearContentAgent();', 'Y', '2023-02-11 18:19:31', '2023-02-12 18:19:31', NULL, 86400, 'N', NULL, 'N', 0),
	(30, 'rest', 100, '\\Bitrix\\Rest\\Helper::recoveryAgents();', 'Y', '2023-02-10 14:22:45', '2023-02-17 14:22:45', NULL, 604800, 'N', NULL, 'N', 0),
	(31, 'search', 10, 'CSearchSuggest::CleanUpAgent();', 'Y', '2023-02-11 18:19:31', '2023-02-12 18:19:31', NULL, 86400, 'N', NULL, 'N', 0),
	(32, 'search', 10, 'CSearchStatistic::CleanUpAgent();', 'Y', '2023-02-11 18:19:31', '2023-02-12 18:19:31', NULL, 86400, 'N', NULL, 'N', 0),
	(33, 'security', 100, 'CSecuritySession::CleanUpAgent();', 'Y', '2023-02-11 21:15:38', '2023-02-11 21:45:38', NULL, 1800, 'N', NULL, 'N', 0),
	(34, 'security', 100, 'CSecurityIPRule::CleanUpAgent();', 'Y', '2023-02-11 20:27:19', '2023-02-11 21:27:19', NULL, 3600, 'N', NULL, 'N', 0),
	(35, 'seo', 100, 'Bitrix\\Seo\\Engine\\YandexDirect::updateAgent();', 'Y', '2023-02-11 20:27:19', '2023-02-11 21:27:19', NULL, 3600, 'N', NULL, 'N', 0),
	(36, 'seo', 100, 'Bitrix\\Seo\\Adv\\LogTable::clean();', 'Y', '2023-02-11 18:19:31', '2023-02-12 18:19:31', NULL, 86400, 'N', NULL, 'N', 0),
	(37, 'seo', 100, 'Bitrix\\Seo\\Adv\\Auto::checkQuantityAgent();', 'Y', '2023-02-11 20:27:19', '2023-02-11 21:27:19', NULL, 3600, 'N', NULL, 'N', 0),
	(38, 'subscribe', 100, 'CSubscription::CleanUp();', 'Y', '2023-02-11 18:19:31', '2023-02-12 03:00:00', NULL, 86400, 'Y', NULL, 'N', 0);

-- Дамп структуры для таблица globus.b_app_password
CREATE TABLE IF NOT EXISTS `b_app_password` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `APPLICATION_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DIGEST_PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `DATE_LOGIN` datetime DEFAULT NULL,
  `LAST_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SYSCOMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_app_password_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_app_password: ~0 rows (приблизительно)
DELETE FROM `b_app_password`;

-- Дамп структуры для таблица globus.b_b24connector_buttons
CREATE TABLE IF NOT EXISTS `b_b24connector_buttons` (
  `ID` int(11) NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `ADD_DATE` datetime NOT NULL,
  `ADD_BY` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SCRIPT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_b24connector_buttons: ~0 rows (приблизительно)
DELETE FROM `b_b24connector_buttons`;

-- Дамп структуры для таблица globus.b_b24connector_button_site
CREATE TABLE IF NOT EXISTS `b_b24connector_button_site` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BUTTON_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BUTTON_ID` (`BUTTON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_b24connector_button_site: ~0 rows (приблизительно)
DELETE FROM `b_b24connector_button_site`;

-- Дамп структуры для таблица globus.b_bitrixcloud_option
CREATE TABLE IF NOT EXISTS `b_bitrixcloud_option` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL,
  `PARAM_KEY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAM_VALUE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_bitrixcloud_option_1` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_bitrixcloud_option: ~3 rows (приблизительно)
DELETE FROM `b_bitrixcloud_option`;
INSERT INTO `b_bitrixcloud_option` (`ID`, `NAME`, `SORT`, `PARAM_KEY`, `PARAM_VALUE`) VALUES
	(1, 'backup_quota', 0, '0', '0'),
	(2, 'backup_total_size', 0, '0', '0'),
	(3, 'backup_last_backup_time', 0, '0', '1676013764'),
	(4, 'monitoring_expire_time', 0, '0', '1676127062');

-- Дамп структуры для таблица globus.b_blog
CREATE TABLE IF NOT EXISTS `b_blog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `OWNER_ID` int(11) DEFAULT NULL,
  `SOCNET_GROUP_ID` int(11) DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REAL_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `ENABLE_COMMENTS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ENABLE_IMG_VERIF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ENABLE_RSS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_POST_ID` int(11) DEFAULT NULL,
  `LAST_POST_DATE` datetime DEFAULT NULL,
  `AUTO_GROUPS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL_NOTIFY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_HTML` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SEARCH_INDEX` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `USE_SOCNET` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `EDITOR_USE_FONT` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `EDITOR_USE_LINK` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `EDITOR_USE_IMAGE` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `EDITOR_USE_VIDEO` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `EDITOR_USE_FORMAT` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_BLOG_4` (`URL`),
  KEY `IX_BLOG_BLOG_1` (`GROUP_ID`,`ACTIVE`),
  KEY `IX_BLOG_BLOG_2` (`OWNER_ID`),
  KEY `IX_BLOG_BLOG_5` (`LAST_POST_DATE`),
  KEY `IX_BLOG_BLOG_6` (`SOCNET_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_blog: ~0 rows (приблизительно)
DELETE FROM `b_blog`;

-- Дамп структуры для таблица globus.b_blog_category
CREATE TABLE IF NOT EXISTS `b_blog_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_CAT_1` (`BLOG_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_blog_category: ~0 rows (приблизительно)
DELETE FROM `b_blog_category`;

-- Дамп структуры для таблица globus.b_blog_comment
CREATE TABLE IF NOT EXISTS `b_blog_comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `AUTHOR_ID` int(11) DEFAULT NULL,
  `ICON_ID` int(11) DEFAULT NULL,
  `AUTHOR_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_IP` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_IP1` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_TEXT` text COLLATE utf8_unicode_ci NOT NULL,
  `PUBLISH_STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `HAS_PROPS` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SHARE_DEST` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_COMM_1` (`BLOG_ID`,`POST_ID`),
  KEY `IX_BLOG_COMM_2` (`AUTHOR_ID`),
  KEY `IX_BLOG_COMM_3` (`DATE_CREATE`,`AUTHOR_ID`),
  KEY `IX_BLOG_COMM_4` (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_blog_comment: ~0 rows (приблизительно)
DELETE FROM `b_blog_comment`;

-- Дамп структуры для таблица globus.b_blog_group
CREATE TABLE IF NOT EXISTS `b_blog_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_GROUP_1` (`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_blog_group: ~0 rows (приблизительно)
DELETE FROM `b_blog_group`;

-- Дамп структуры для таблица globus.b_blog_image
CREATE TABLE IF NOT EXISTS `b_blog_image` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FILE_ID` int(11) NOT NULL DEFAULT 0,
  `BLOG_ID` int(11) NOT NULL DEFAULT 0,
  `POST_ID` int(11) NOT NULL DEFAULT 0,
  `USER_ID` int(11) NOT NULL DEFAULT 0,
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE_SIZE` int(11) NOT NULL DEFAULT 0,
  `IS_COMMENT` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `COMMENT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_IMAGE_1` (`POST_ID`,`BLOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_blog_image: ~0 rows (приблизительно)
DELETE FROM `b_blog_image`;

-- Дамп структуры для таблица globus.b_blog_post
CREATE TABLE IF NOT EXISTS `b_blog_post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  `AUTHOR_ID` int(11) NOT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW_TEXT_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DETAIL_TEXT` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `DETAIL_TEXT_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DATE_CREATE` datetime NOT NULL,
  `DATE_PUBLISH` datetime NOT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PUBLISH_STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `CATEGORY_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ATRIBUTE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENABLE_TRACKBACK` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ENABLE_COMMENTS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ATTACH_IMG` int(11) DEFAULT NULL,
  `NUM_COMMENTS` int(11) NOT NULL DEFAULT 0,
  `NUM_COMMENTS_ALL` int(11) NOT NULL DEFAULT 0,
  `NUM_TRACKBACKS` int(11) NOT NULL DEFAULT 0,
  `VIEWS` int(11) DEFAULT NULL,
  `FAVORITE_SORT` int(11) DEFAULT NULL,
  `PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MICRO` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `HAS_IMAGES` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_PROPS` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_TAGS` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_COMMENT_IMAGES` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_SOCNET_ALL` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEO_TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEO_TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEO_DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `BACKGROUND_CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_POST_1` (`BLOG_ID`,`PUBLISH_STATUS`,`DATE_PUBLISH`),
  KEY `IX_BLOG_POST_2` (`BLOG_ID`,`DATE_PUBLISH`,`PUBLISH_STATUS`),
  KEY `IX_BLOG_POST_3` (`BLOG_ID`,`CATEGORY_ID`),
  KEY `IX_BLOG_POST_4` (`PUBLISH_STATUS`,`DATE_PUBLISH`),
  KEY `IX_BLOG_POST_5` (`DATE_PUBLISH`,`AUTHOR_ID`),
  KEY `IX_BLOG_POST_CODE` (`BLOG_ID`,`CODE`),
  KEY `IX_BLOG_POST_6` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_blog_post: ~0 rows (приблизительно)
DELETE FROM `b_blog_post`;

-- Дамп структуры для таблица globus.b_blog_post_category
CREATE TABLE IF NOT EXISTS `b_blog_post_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  `CATEGORY_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_POST_CATEGORY` (`POST_ID`,`CATEGORY_ID`),
  KEY `IX_BLOG_POST_CATEGORY_CAT_ID` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_blog_post_category: ~0 rows (приблизительно)
DELETE FROM `b_blog_post_category`;

-- Дамп структуры для таблица globus.b_blog_post_param
CREATE TABLE IF NOT EXISTS `b_blog_post_param` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POST_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_PP_1` (`POST_ID`,`USER_ID`),
  KEY `IX_BLOG_PP_2` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_blog_post_param: ~0 rows (приблизительно)
DELETE FROM `b_blog_post_param`;

-- Дамп структуры для таблица globus.b_blog_site_path
CREATE TABLE IF NOT EXISTS `b_blog_site_path` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `PATH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_SITE_PATH_2` (`SITE_ID`,`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_blog_site_path: ~0 rows (приблизительно)
DELETE FROM `b_blog_site_path`;

-- Дамп структуры для таблица globus.b_blog_socnet
CREATE TABLE IF NOT EXISTS `b_blog_socnet` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_SOCNET` (`BLOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_blog_socnet: ~0 rows (приблизительно)
DELETE FROM `b_blog_socnet`;

-- Дамп структуры для таблица globus.b_blog_socnet_rights
CREATE TABLE IF NOT EXISTS `b_blog_socnet_rights` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POST_ID` int(11) NOT NULL,
  `ENTITY_TYPE` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `ENTITY` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_SR_1` (`POST_ID`),
  KEY `IX_BLOG_SR_2` (`ENTITY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_blog_socnet_rights: ~0 rows (приблизительно)
DELETE FROM `b_blog_socnet_rights`;

-- Дамп структуры для таблица globus.b_blog_trackback
CREATE TABLE IF NOT EXISTS `b_blog_trackback` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci NOT NULL,
  `BLOG_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_DATE` datetime NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_TRBK_1` (`BLOG_ID`,`POST_ID`),
  KEY `IX_BLOG_TRBK_2` (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_blog_trackback: ~0 rows (приблизительно)
DELETE FROM `b_blog_trackback`;

-- Дамп структуры для таблица globus.b_blog_user
CREATE TABLE IF NOT EXISTS `b_blog_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `AVATAR` int(11) DEFAULT NULL,
  `INTERESTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `DATE_REG` datetime NOT NULL,
  `ALLOW_POST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_USER_1` (`USER_ID`),
  KEY `IX_BLOG_USER_2` (`ALIAS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_blog_user: ~0 rows (приблизительно)
DELETE FROM `b_blog_user`;

-- Дамп структуры для таблица globus.b_blog_user2blog
CREATE TABLE IF NOT EXISTS `b_blog_user2blog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_USER2GROUP_1` (`BLOG_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_blog_user2blog: ~0 rows (приблизительно)
DELETE FROM `b_blog_user2blog`;

-- Дамп структуры для таблица globus.b_blog_user2user_group
CREATE TABLE IF NOT EXISTS `b_blog_user2user_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  `USER_GROUP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_USER2GROUP_1` (`USER_ID`,`BLOG_ID`,`USER_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_blog_user2user_group: ~0 rows (приблизительно)
DELETE FROM `b_blog_user2user_group`;

-- Дамп структуры для таблица globus.b_blog_user_group
CREATE TABLE IF NOT EXISTS `b_blog_user_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_USER_GROUP_1` (`BLOG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_blog_user_group: ~2 rows (приблизительно)
DELETE FROM `b_blog_user_group`;
INSERT INTO `b_blog_user_group` (`ID`, `BLOG_ID`, `NAME`) VALUES
	(1, NULL, 'all'),
	(2, NULL, 'registered');

-- Дамп структуры для таблица globus.b_blog_user_group_perms
CREATE TABLE IF NOT EXISTS `b_blog_user_group_perms` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `USER_GROUP_ID` int(11) NOT NULL,
  `PERMS_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `POST_ID` int(11) DEFAULT NULL,
  `PERMS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `AUTOSET` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_UG_PERMS_1` (`BLOG_ID`,`USER_GROUP_ID`,`PERMS_TYPE`,`POST_ID`),
  KEY `IX_BLOG_UG_PERMS_2` (`USER_GROUP_ID`,`PERMS_TYPE`,`POST_ID`),
  KEY `IX_BLOG_UG_PERMS_3` (`POST_ID`,`USER_GROUP_ID`,`PERMS_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_blog_user_group_perms: ~0 rows (приблизительно)
DELETE FROM `b_blog_user_group_perms`;

-- Дамп структуры для таблица globus.b_cache_tag
CREATE TABLE IF NOT EXISTS `b_cache_tag` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SALT` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RELATIVE_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_cache_tag_0` (`SITE_ID`,`CACHE_SALT`,`RELATIVE_PATH`(50)),
  KEY `ix_b_cache_tag_1` (`TAG`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_cache_tag: ~12 rows (приблизительно)
DELETE FROM `b_cache_tag`;
INSERT INTO `b_cache_tag` (`ID`, `SITE_ID`, `CACHE_SALT`, `RELATIVE_PATH`, `TAG`) VALUES
	(5, NULL, NULL, '0:1676123947', '**'),
	(33, 's1', '/fc1', '/s1/bitrix/news.list/fc1', 'iblock_id_1'),
	(34, 's1', '/f3e', '/s1/bitrix/news.list/f3e', 'iblock_id_1'),
	(40, 's1', '/f3e', '/s1/bitrix/news.list/f3e', 'iblock_id_2'),
	(47, 's1', '/737', '/s1/bitrix/news.list/737', 'iblock_id_1'),
	(54, 's1', '/737', '/s1/bitrix/news.list/737', 'iblock_id_3'),
	(58, 's1', '/fb5', '/s1/bitrix/news.list/fb5', 'iblock_id_1'),
	(67, 's1', '/fb5', '/s1/bitrix/news.list/fb5', 'iblock_id_4'),
	(72, 's1', '/fb5', '/s1/bitrix/news.list/fb5', 'iblock_id_5'),
	(87, 's1', '/8f3', '/s1/bitrix/catalog.section.list/8f3', 'iblock_id_6'),
	(88, 's1', '/8f3', '/s1/bitrix/news.list/8f3', 'iblock_id_1'),
	(89, 's1', '/8f3', '/s1/bitrix/news.list/8f3', 'iblock_id_6');

-- Дамп структуры для таблица globus.b_captcha
CREATE TABLE IF NOT EXISTS `b_captcha` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  UNIQUE KEY `UX_B_CAPTCHA` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_captcha: ~0 rows (приблизительно)
DELETE FROM `b_captcha`;

-- Дамп структуры для таблица globus.b_checklist
CREATE TABLE IF NOT EXISTS `b_checklist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_CREATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TESTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMPANY_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PICTURE` int(11) DEFAULT NULL,
  `TOTAL` int(11) DEFAULT NULL,
  `SUCCESS` int(11) DEFAULT NULL,
  `FAILED` int(11) DEFAULT NULL,
  `PENDING` int(11) DEFAULT NULL,
  `SKIP` int(11) DEFAULT NULL,
  `STATE` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `REPORT_COMMENT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `REPORT` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `EMAIL` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHONE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SENDED_TO_BITRIX` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_checklist: ~0 rows (приблизительно)
DELETE FROM `b_checklist`;

-- Дамп структуры для таблица globus.b_clouds_copy_queue
CREATE TABLE IF NOT EXISTS `b_clouds_copy_queue` (
  `ID` int(32) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL,
  `OP` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `SOURCE_BUCKET_ID` int(11) NOT NULL,
  `SOURCE_FILE_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `TARGET_BUCKET_ID` int(11) NOT NULL,
  `TARGET_FILE_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_SIZE` int(11) NOT NULL DEFAULT -1,
  `FILE_POS` int(11) NOT NULL DEFAULT 0,
  `FAIL_COUNTER` int(11) NOT NULL DEFAULT 0,
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ERROR_MESSAGE` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_clouds_copy_queue: ~0 rows (приблизительно)
DELETE FROM `b_clouds_copy_queue`;

-- Дамп структуры для таблица globus.b_clouds_delete_queue
CREATE TABLE IF NOT EXISTS `b_clouds_delete_queue` (
  `ID` int(32) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL,
  `BUCKET_ID` int(11) NOT NULL,
  `FILE_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_clouds_delete_queue_1` (`BUCKET_ID`,`FILE_PATH`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_clouds_delete_queue: ~0 rows (приблизительно)
DELETE FROM `b_clouds_delete_queue`;

-- Дамп структуры для таблица globus.b_clouds_file_bucket
CREATE TABLE IF NOT EXISTS `b_clouds_file_bucket` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SORT` int(11) DEFAULT 500,
  `READ_ONLY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `SERVICE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BUCKET` varchar(63) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOCATION` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CNAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_COUNT` int(11) DEFAULT 0,
  `FILE_SIZE` double DEFAULT 0,
  `LAST_FILE_ID` int(11) DEFAULT NULL,
  `PREFIX` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_RULES` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `FAILOVER_ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `FAILOVER_BUCKET_ID` int(11) DEFAULT NULL,
  `FAILOVER_COPY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `FAILOVER_DELETE` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `FAILOVER_DELETE_DELAY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_clouds_file_bucket: ~0 rows (приблизительно)
DELETE FROM `b_clouds_file_bucket`;

-- Дамп структуры для таблица globus.b_clouds_file_hash
CREATE TABLE IF NOT EXISTS `b_clouds_file_hash` (
  `ID` int(32) NOT NULL AUTO_INCREMENT,
  `BUCKET_ID` int(11) NOT NULL,
  `FILE_PATH` varchar(760) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `FILE_MTIME` datetime DEFAULT NULL,
  `FILE_HASH` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_clouds_file_hash` (`BUCKET_ID`,`FILE_PATH`(190))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_clouds_file_hash: ~0 rows (приблизительно)
DELETE FROM `b_clouds_file_hash`;

-- Дамп структуры для таблица globus.b_clouds_file_resize
CREATE TABLE IF NOT EXISTS `b_clouds_file_resize` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL,
  `ERROR_CODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `FILE_ID` int(11) DEFAULT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `FROM_PATH` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_PATH` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_file_resize_ts` (`TIMESTAMP_X`),
  KEY `ix_b_file_resize_path` (`TO_PATH`(100)),
  KEY `ix_b_file_resize_file` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_clouds_file_resize: ~0 rows (приблизительно)
DELETE FROM `b_clouds_file_resize`;

-- Дамп структуры для таблица globus.b_clouds_file_save
CREATE TABLE IF NOT EXISTS `b_clouds_file_save` (
  `ID` int(32) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL,
  `BUCKET_ID` int(11) NOT NULL,
  `SUBDIR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_EXTERNAL_ID` (`EXTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_clouds_file_save: ~0 rows (приблизительно)
DELETE FROM `b_clouds_file_save`;

-- Дамп структуры для таблица globus.b_clouds_file_upload
CREATE TABLE IF NOT EXISTS `b_clouds_file_upload` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `FILE_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `TMP_FILE` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BUCKET_ID` int(11) NOT NULL,
  `PART_SIZE` int(11) NOT NULL,
  `PART_NO` int(11) NOT NULL,
  `PART_FAIL_COUNTER` int(11) NOT NULL,
  `NEXT_STEP` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_clouds_file_upload: ~0 rows (приблизительно)
DELETE FROM `b_clouds_file_upload`;

-- Дамп структуры для таблица globus.b_component_params
CREATE TABLE IF NOT EXISTS `b_component_params` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `COMPONENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TEMPLATE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REAL_PATH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SEF_MODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SEF_FOLDER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `START_CHAR` int(11) NOT NULL,
  `END_CHAR` int(11) NOT NULL,
  `PARAMETERS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_comp_params_name` (`COMPONENT_NAME`),
  KEY `ix_comp_params_path` (`SITE_ID`,`REAL_PATH`),
  KEY `ix_comp_params_sname` (`SITE_ID`,`COMPONENT_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_component_params: ~15 rows (приблизительно)
DELETE FROM `b_component_params`;
INSERT INTO `b_component_params` (`ID`, `SITE_ID`, `COMPONENT_NAME`, `TEMPLATE_NAME`, `REAL_PATH`, `SEF_MODE`, `SEF_FOLDER`, `START_CHAR`, `END_CHAR`, `PARAMETERS`) VALUES
	(17, 's1', 'bitrix:menu', 'upper', '/local/templates/globus/include/parts/header.php', 'N', NULL, 6, 798, 'a:11:{s:18:"COMPONENT_TEMPLATE";s:8:".default";s:14:"ROOT_MENU_TYPE";s:5:"upper";s:15:"MENU_CACHE_TYPE";s:1:"N";s:15:"MENU_CACHE_TIME";s:4:"3600";s:21:"MENU_CACHE_USE_GROUPS";s:1:"Y";s:19:"MENU_CACHE_GET_VARS";s:0:"";s:9:"MAX_LEVEL";s:1:"1";s:15:"CHILD_MENU_TYPE";s:4:"left";s:7:"USE_EXT";s:1:"N";s:5:"DELAY";s:1:"N";s:18:"ALLOW_MULTI_SELECT";s:1:"N";}'),
	(18, 's1', 'bitrix:menu', 'header-addr', '/local/templates/globus/include/parts/header.php', 'N', NULL, 2243, 3218, 'a:11:{s:18:"COMPONENT_TEMPLATE";s:11:"header-addr";s:14:"ROOT_MENU_TYPE";s:11:"header-addr";s:15:"MENU_CACHE_TYPE";s:1:"N";s:15:"MENU_CACHE_TIME";s:4:"3600";s:21:"MENU_CACHE_USE_GROUPS";s:1:"Y";s:19:"MENU_CACHE_GET_VARS";s:0:"";s:9:"MAX_LEVEL";s:1:"1";s:15:"CHILD_MENU_TYPE";s:4:"left";s:7:"USE_EXT";s:1:"N";s:5:"DELAY";s:1:"N";s:18:"ALLOW_MULTI_SELECT";s:1:"N";}'),
	(19, 's1', 'bitrix:menu', 'header-phone', '/local/templates/globus/include/parts/header.php', 'N', NULL, 3424, 3846, 'a:11:{s:18:"COMPONENT_TEMPLATE";s:12:"header-phone";s:14:"ROOT_MENU_TYPE";s:13:"header-phones";s:15:"MENU_CACHE_TYPE";s:1:"N";s:15:"MENU_CACHE_TIME";s:4:"3600";s:21:"MENU_CACHE_USE_GROUPS";s:1:"Y";s:19:"MENU_CACHE_GET_VARS";N;s:9:"MAX_LEVEL";s:1:"1";s:15:"CHILD_MENU_TYPE";s:4:"left";s:7:"USE_EXT";s:1:"N";s:5:"DELAY";s:1:"N";s:18:"ALLOW_MULTI_SELECT";s:1:"N";}'),
	(20, 's1', 'bitrix:menu', 'main', '/local/templates/globus/include/parts/header.php', 'N', NULL, 4143, 4988, 'a:11:{s:18:"COMPONENT_TEMPLATE";s:8:".default";s:14:"ROOT_MENU_TYPE";s:3:"top";s:15:"MENU_CACHE_TYPE";s:1:"N";s:15:"MENU_CACHE_TIME";s:4:"3600";s:21:"MENU_CACHE_USE_GROUPS";s:1:"Y";s:19:"MENU_CACHE_GET_VARS";s:0:"";s:9:"MAX_LEVEL";s:1:"1";s:15:"CHILD_MENU_TYPE";s:4:"left";s:7:"USE_EXT";s:1:"N";s:5:"DELAY";s:1:"N";s:18:"ALLOW_MULTI_SELECT";s:1:"N";}'),
	(21, 's1', 'bitrix:breadcrumb', 'main', '/local/templates/globus/header.php', 'N', NULL, 746, 828, 'a:0:{}'),
	(25, 's1', 'bitrix:menu', 'footer', '/local/templates/globus/footer.php', 'N', NULL, 313, 1052, 'a:11:{s:18:"COMPONENT_TEMPLATE";s:8:".default";s:14:"ROOT_MENU_TYPE";s:6:"footer";s:15:"MENU_CACHE_TYPE";s:1:"N";s:15:"MENU_CACHE_TIME";s:4:"3600";s:21:"MENU_CACHE_USE_GROUPS";s:1:"Y";s:19:"MENU_CACHE_GET_VARS";s:0:"";s:9:"MAX_LEVEL";s:1:"1";s:15:"CHILD_MENU_TYPE";s:4:"left";s:7:"USE_EXT";s:1:"N";s:5:"DELAY";s:1:"N";s:18:"ALLOW_MULTI_SELECT";s:1:"N";}'),
	(29, 's1', 'bitrix:news', 'main', '/news/index.php', 'Y', '/news/', 120, 2436, 'a:68:{s:18:"COMPONENT_TEMPLATE";s:4:"main";s:11:"IBLOCK_TYPE";s:7:"content";s:9:"IBLOCK_ID";s:1:"1";s:10:"NEWS_COUNT";s:2:"20";s:10:"USE_SEARCH";s:1:"N";s:7:"USE_RSS";s:1:"N";s:10:"USE_RATING";s:1:"N";s:14:"USE_CATEGORIES";s:1:"N";s:10:"USE_REVIEW";s:1:"N";s:10:"USE_FILTER";s:1:"N";s:8:"SORT_BY1";s:11:"ACTIVE_FROM";s:11:"SORT_ORDER1";s:4:"DESC";s:8:"SORT_BY2";s:4:"SORT";s:11:"SORT_ORDER2";s:3:"ASC";s:11:"CHECK_DATES";s:1:"Y";s:8:"SEF_MODE";s:1:"Y";s:9:"AJAX_MODE";s:1:"N";s:16:"AJAX_OPTION_JUMP";s:1:"N";s:17:"AJAX_OPTION_STYLE";s:1:"Y";s:19:"AJAX_OPTION_HISTORY";s:1:"N";s:22:"AJAX_OPTION_ADDITIONAL";s:0:"";s:10:"CACHE_TYPE";s:1:"A";s:10:"CACHE_TIME";s:8:"36000000";s:12:"CACHE_FILTER";s:1:"N";s:12:"CACHE_GROUPS";s:1:"Y";s:17:"SET_LAST_MODIFIED";s:1:"N";s:9:"SET_TITLE";s:1:"Y";s:25:"INCLUDE_IBLOCK_INTO_CHAIN";s:1:"Y";s:18:"ADD_SECTIONS_CHAIN";s:1:"Y";s:17:"ADD_ELEMENT_CHAIN";s:1:"N";s:15:"USE_PERMISSIONS";s:1:"N";s:20:"STRICT_SECTION_CHECK";s:1:"N";s:12:"DISPLAY_DATE";s:1:"Y";s:15:"DISPLAY_PICTURE";s:1:"Y";s:20:"DISPLAY_PREVIEW_TEXT";s:1:"Y";s:9:"USE_SHARE";s:1:"N";s:20:"PREVIEW_TRUNCATE_LEN";s:0:"";s:23:"LIST_ACTIVE_DATE_FORMAT";s:5:"d.m.Y";s:15:"LIST_FIELD_CODE";a:2:{i:0;s:0:"";i:1;s:0:"";}s:18:"LIST_PROPERTY_CODE";a:2:{i:0;s:0:"";i:1;s:0:"";}s:24:"HIDE_LINK_WHEN_NO_DETAIL";s:1:"N";s:12:"DISPLAY_NAME";s:1:"Y";s:13:"META_KEYWORDS";s:1:"-";s:16:"META_DESCRIPTION";s:1:"-";s:13:"BROWSER_TITLE";s:1:"-";s:24:"DETAIL_SET_CANONICAL_URL";s:1:"N";s:25:"DETAIL_ACTIVE_DATE_FORMAT";s:5:"d.m.Y";s:17:"DETAIL_FIELD_CODE";a:2:{i:0;s:0:"";i:1;s:0:"";}s:20:"DETAIL_PROPERTY_CODE";a:2:{i:0;s:0:"";i:1;s:0:"";}s:24:"DETAIL_DISPLAY_TOP_PAGER";s:1:"N";s:27:"DETAIL_DISPLAY_BOTTOM_PAGER";s:1:"Y";s:18:"DETAIL_PAGER_TITLE";s:16:"Страница";s:21:"DETAIL_PAGER_TEMPLATE";s:0:"";s:21:"DETAIL_PAGER_SHOW_ALL";s:1:"Y";s:14:"PAGER_TEMPLATE";s:4:"main";s:17:"DISPLAY_TOP_PAGER";s:1:"N";s:20:"DISPLAY_BOTTOM_PAGER";s:1:"Y";s:11:"PAGER_TITLE";s:14:"Новости";s:17:"PAGER_SHOW_ALWAYS";s:1:"N";s:20:"PAGER_DESC_NUMBERING";s:1:"N";s:31:"PAGER_DESC_NUMBERING_CACHE_TIME";s:5:"36000";s:14:"PAGER_SHOW_ALL";s:1:"N";s:22:"PAGER_BASE_LINK_ENABLE";s:1:"N";s:14:"SET_STATUS_404";s:1:"N";s:8:"SHOW_404";s:1:"N";s:11:"MESSAGE_404";s:0:"";s:10:"SEF_FOLDER";s:6:"/news/";s:17:"SEF_URL_TEMPLATES";a:3:{s:4:"news";s:0:"";s:7:"section";s:20:"#SECTION_CODE_PATH#/";s:6:"detail";s:35:"#SECTION_CODE_PATH#/#ELEMENT_CODE#/";}}'),
	(32, 's1', 'bitrix:news', 'vacancy', '/vacancy/index.php', 'Y', '/vacancy/', 120, 2473, 'a:68:{s:18:"COMPONENT_TEMPLATE";s:7:"vacancy";s:11:"IBLOCK_TYPE";s:7:"content";s:9:"IBLOCK_ID";s:1:"2";s:10:"NEWS_COUNT";s:2:"20";s:10:"USE_SEARCH";s:1:"N";s:7:"USE_RSS";s:1:"N";s:10:"USE_RATING";s:1:"N";s:14:"USE_CATEGORIES";s:1:"N";s:10:"USE_REVIEW";s:1:"N";s:10:"USE_FILTER";s:1:"N";s:8:"SORT_BY1";s:11:"ACTIVE_FROM";s:11:"SORT_ORDER1";s:4:"DESC";s:8:"SORT_BY2";s:4:"SORT";s:11:"SORT_ORDER2";s:3:"ASC";s:11:"CHECK_DATES";s:1:"Y";s:8:"SEF_MODE";s:1:"Y";s:10:"SEF_FOLDER";s:9:"/vacancy/";s:9:"AJAX_MODE";s:1:"N";s:16:"AJAX_OPTION_JUMP";s:1:"N";s:17:"AJAX_OPTION_STYLE";s:1:"Y";s:19:"AJAX_OPTION_HISTORY";s:1:"N";s:22:"AJAX_OPTION_ADDITIONAL";s:0:"";s:10:"CACHE_TYPE";s:1:"A";s:10:"CACHE_TIME";s:8:"36000000";s:12:"CACHE_FILTER";s:1:"N";s:12:"CACHE_GROUPS";s:1:"Y";s:17:"SET_LAST_MODIFIED";s:1:"N";s:9:"SET_TITLE";s:1:"Y";s:25:"INCLUDE_IBLOCK_INTO_CHAIN";s:1:"Y";s:18:"ADD_SECTIONS_CHAIN";s:1:"Y";s:17:"ADD_ELEMENT_CHAIN";s:1:"N";s:15:"USE_PERMISSIONS";s:1:"N";s:20:"STRICT_SECTION_CHECK";s:1:"N";s:12:"DISPLAY_DATE";s:1:"Y";s:15:"DISPLAY_PICTURE";s:1:"Y";s:20:"DISPLAY_PREVIEW_TEXT";s:1:"Y";s:9:"USE_SHARE";s:1:"N";s:20:"PREVIEW_TRUNCATE_LEN";s:0:"";s:23:"LIST_ACTIVE_DATE_FORMAT";s:5:"d.m.Y";s:15:"LIST_FIELD_CODE";a:2:{i:0;s:0:"";i:1;s:0:"";}s:18:"LIST_PROPERTY_CODE";a:5:{i:0;s:5:"MONEY";i:1;s:8:"REQUIRED";i:2;s:12:"REQUIREMENTS";i:3;s:5:"RULES";i:4;s:0:"";}s:24:"HIDE_LINK_WHEN_NO_DETAIL";s:1:"N";s:12:"DISPLAY_NAME";s:1:"Y";s:13:"META_KEYWORDS";s:1:"-";s:16:"META_DESCRIPTION";s:1:"-";s:13:"BROWSER_TITLE";s:1:"-";s:24:"DETAIL_SET_CANONICAL_URL";s:1:"N";s:25:"DETAIL_ACTIVE_DATE_FORMAT";s:5:"d.m.Y";s:17:"DETAIL_FIELD_CODE";a:2:{i:0;s:0:"";i:1;s:0:"";}s:20:"DETAIL_PROPERTY_CODE";a:2:{i:0;s:0:"";i:1;s:0:"";}s:24:"DETAIL_DISPLAY_TOP_PAGER";s:1:"N";s:27:"DETAIL_DISPLAY_BOTTOM_PAGER";s:1:"Y";s:18:"DETAIL_PAGER_TITLE";s:16:"Страница";s:21:"DETAIL_PAGER_TEMPLATE";s:0:"";s:21:"DETAIL_PAGER_SHOW_ALL";s:1:"Y";s:14:"PAGER_TEMPLATE";s:8:".default";s:17:"DISPLAY_TOP_PAGER";s:1:"N";s:20:"DISPLAY_BOTTOM_PAGER";s:1:"Y";s:11:"PAGER_TITLE";s:14:"Новости";s:17:"PAGER_SHOW_ALWAYS";s:1:"N";s:20:"PAGER_DESC_NUMBERING";s:1:"N";s:31:"PAGER_DESC_NUMBERING_CACHE_TIME";s:5:"36000";s:14:"PAGER_SHOW_ALL";s:1:"N";s:22:"PAGER_BASE_LINK_ENABLE";s:1:"N";s:14:"SET_STATUS_404";s:1:"N";s:8:"SHOW_404";s:1:"N";s:11:"MESSAGE_404";s:0:"";s:17:"SEF_URL_TEMPLATES";a:3:{s:4:"news";s:0:"";s:7:"section";s:0:"";s:6:"detail";s:13:"#ELEMENT_ID#/";}}'),
	(35, 's1', 'bitrix:news', 'child', '/child/index.php', 'Y', '/child/', 118, 2403, 'a:68:{s:18:"COMPONENT_TEMPLATE";s:5:"child";s:11:"IBLOCK_TYPE";s:7:"content";s:9:"IBLOCK_ID";s:1:"3";s:10:"NEWS_COUNT";s:2:"20";s:10:"USE_SEARCH";s:1:"N";s:7:"USE_RSS";s:1:"N";s:10:"USE_RATING";s:1:"N";s:14:"USE_CATEGORIES";s:1:"N";s:10:"USE_REVIEW";s:1:"N";s:10:"USE_FILTER";s:1:"N";s:8:"SORT_BY1";s:11:"ACTIVE_FROM";s:11:"SORT_ORDER1";s:4:"DESC";s:8:"SORT_BY2";s:4:"SORT";s:11:"SORT_ORDER2";s:3:"ASC";s:11:"CHECK_DATES";s:1:"Y";s:8:"SEF_MODE";s:1:"Y";s:10:"SEF_FOLDER";s:7:"/child/";s:9:"AJAX_MODE";s:1:"N";s:16:"AJAX_OPTION_JUMP";s:1:"N";s:17:"AJAX_OPTION_STYLE";s:1:"Y";s:19:"AJAX_OPTION_HISTORY";s:1:"N";s:22:"AJAX_OPTION_ADDITIONAL";s:0:"";s:10:"CACHE_TYPE";s:1:"A";s:10:"CACHE_TIME";s:8:"36000000";s:12:"CACHE_FILTER";s:1:"N";s:12:"CACHE_GROUPS";s:1:"Y";s:17:"SET_LAST_MODIFIED";s:1:"N";s:9:"SET_TITLE";s:1:"Y";s:25:"INCLUDE_IBLOCK_INTO_CHAIN";s:1:"Y";s:18:"ADD_SECTIONS_CHAIN";s:1:"Y";s:17:"ADD_ELEMENT_CHAIN";s:1:"N";s:15:"USE_PERMISSIONS";s:1:"N";s:20:"STRICT_SECTION_CHECK";s:1:"N";s:12:"DISPLAY_DATE";s:1:"Y";s:15:"DISPLAY_PICTURE";s:1:"Y";s:20:"DISPLAY_PREVIEW_TEXT";s:1:"Y";s:9:"USE_SHARE";s:1:"N";s:20:"PREVIEW_TRUNCATE_LEN";s:0:"";s:23:"LIST_ACTIVE_DATE_FORMAT";s:5:"d.m.Y";s:15:"LIST_FIELD_CODE";a:2:{i:0;s:0:"";i:1;s:0:"";}s:18:"LIST_PROPERTY_CODE";a:2:{i:0;s:4:"LINK";i:1;s:0:"";}s:24:"HIDE_LINK_WHEN_NO_DETAIL";s:1:"N";s:12:"DISPLAY_NAME";s:1:"Y";s:13:"META_KEYWORDS";s:1:"-";s:16:"META_DESCRIPTION";s:1:"-";s:13:"BROWSER_TITLE";s:1:"-";s:24:"DETAIL_SET_CANONICAL_URL";s:1:"N";s:25:"DETAIL_ACTIVE_DATE_FORMAT";s:5:"d.m.Y";s:17:"DETAIL_FIELD_CODE";a:2:{i:0;s:0:"";i:1;s:0:"";}s:20:"DETAIL_PROPERTY_CODE";a:2:{i:0;s:0:"";i:1;s:0:"";}s:24:"DETAIL_DISPLAY_TOP_PAGER";s:1:"N";s:27:"DETAIL_DISPLAY_BOTTOM_PAGER";s:1:"Y";s:18:"DETAIL_PAGER_TITLE";s:16:"Страница";s:21:"DETAIL_PAGER_TEMPLATE";s:0:"";s:21:"DETAIL_PAGER_SHOW_ALL";s:1:"Y";s:14:"PAGER_TEMPLATE";s:8:".default";s:17:"DISPLAY_TOP_PAGER";s:1:"N";s:20:"DISPLAY_BOTTOM_PAGER";s:1:"Y";s:11:"PAGER_TITLE";s:14:"Новости";s:17:"PAGER_SHOW_ALWAYS";s:1:"N";s:20:"PAGER_DESC_NUMBERING";s:1:"N";s:31:"PAGER_DESC_NUMBERING_CACHE_TIME";s:5:"36000";s:14:"PAGER_SHOW_ALL";s:1:"N";s:22:"PAGER_BASE_LINK_ENABLE";s:1:"N";s:14:"SET_STATUS_404";s:1:"N";s:8:"SHOW_404";s:1:"N";s:11:"MESSAGE_404";s:0:"";s:17:"SEF_URL_TEMPLATES";a:3:{s:4:"news";s:0:"";s:7:"section";s:0:"";s:6:"detail";s:13:"#ELEMENT_ID#/";}}'),
	(54, 's1', 'bitrix:main.include', '.default', '/about/index.php', 'N', NULL, 205, 593, 'a:4:{s:18:"COMPONENT_TEMPLATE";s:8:".default";s:14:"AREA_FILE_SHOW";s:4:"file";s:4:"PATH";s:31:"/local/include/about-letter.php";s:13:"EDIT_TEMPLATE";s:0:"";}'),
	(55, 's1', 'bitrix:main.include', '.default', '/about/index.php', 'N', NULL, 670, 1056, 'a:4:{s:18:"COMPONENT_TEMPLATE";s:8:".default";s:14:"AREA_FILE_SHOW";s:4:"file";s:4:"PATH";s:29:"/local/include/about-sign.php";s:13:"EDIT_TEMPLATE";s:0:"";}'),
	(56, 's1', 'bitrix:news.list', 'history-combinate', '/about/index.php', 'N', NULL, 1191, 2914, 'a:52:{s:18:"COMPONENT_TEMPLATE";s:17:"history-combinate";s:11:"IBLOCK_TYPE";s:7:"content";s:9:"IBLOCK_ID";s:1:"4";s:10:"NEWS_COUNT";s:2:"20";s:8:"SORT_BY1";s:2:"ID";s:11:"SORT_ORDER1";s:3:"ASC";s:8:"SORT_BY2";s:4:"SORT";s:11:"SORT_ORDER2";s:3:"ASC";s:11:"FILTER_NAME";s:0:"";s:10:"FIELD_CODE";a:4:{i:0;s:4:"NAME";i:1;s:11:"DETAIL_TEXT";i:2;s:14:"DETAIL_PICTURE";i:3;s:0:"";}s:13:"PROPERTY_CODE";a:2:{i:0;s:0:"";i:1;s:0:"";}s:11:"CHECK_DATES";s:1:"Y";s:10:"DETAIL_URL";s:0:"";s:9:"AJAX_MODE";s:1:"N";s:16:"AJAX_OPTION_JUMP";s:1:"N";s:17:"AJAX_OPTION_STYLE";s:1:"Y";s:19:"AJAX_OPTION_HISTORY";s:1:"N";s:22:"AJAX_OPTION_ADDITIONAL";s:0:"";s:10:"CACHE_TYPE";s:1:"A";s:10:"CACHE_TIME";s:8:"36000000";s:12:"CACHE_FILTER";s:1:"N";s:12:"CACHE_GROUPS";s:1:"Y";s:20:"PREVIEW_TRUNCATE_LEN";s:0:"";s:18:"ACTIVE_DATE_FORMAT";s:5:"d.m.Y";s:9:"SET_TITLE";s:1:"N";s:17:"SET_BROWSER_TITLE";s:1:"N";s:17:"SET_META_KEYWORDS";s:1:"N";s:20:"SET_META_DESCRIPTION";s:1:"N";s:17:"SET_LAST_MODIFIED";s:1:"N";s:25:"INCLUDE_IBLOCK_INTO_CHAIN";s:1:"N";s:18:"ADD_SECTIONS_CHAIN";s:1:"N";s:24:"HIDE_LINK_WHEN_NO_DETAIL";s:1:"N";s:14:"PARENT_SECTION";s:0:"";s:19:"PARENT_SECTION_CODE";s:0:"";s:19:"INCLUDE_SUBSECTIONS";s:1:"Y";s:20:"STRICT_SECTION_CHECK";s:1:"N";s:12:"DISPLAY_DATE";s:1:"Y";s:12:"DISPLAY_NAME";s:1:"Y";s:15:"DISPLAY_PICTURE";s:1:"Y";s:20:"DISPLAY_PREVIEW_TEXT";s:1:"Y";s:14:"PAGER_TEMPLATE";s:8:".default";s:17:"DISPLAY_TOP_PAGER";s:1:"N";s:20:"DISPLAY_BOTTOM_PAGER";s:1:"Y";s:11:"PAGER_TITLE";s:14:"Новости";s:17:"PAGER_SHOW_ALWAYS";s:1:"N";s:20:"PAGER_DESC_NUMBERING";s:1:"N";s:31:"PAGER_DESC_NUMBERING_CACHE_TIME";s:5:"36000";s:14:"PAGER_SHOW_ALL";s:1:"N";s:22:"PAGER_BASE_LINK_ENABLE";s:1:"N";s:14:"SET_STATUS_404";s:1:"N";s:8:"SHOW_404";s:1:"N";s:11:"MESSAGE_404";s:0:"";}'),
	(57, 's1', 'bitrix:news.list', 'manufactory', '/about/index.php', 'N', NULL, 5419, 9711, 'a:52:{s:18:"COMPONENT_TEMPLATE";s:8:".default";s:11:"IBLOCK_TYPE";s:7:"content";s:9:"IBLOCK_ID";s:1:"5";s:10:"NEWS_COUNT";s:2:"20";s:8:"SORT_BY1";s:11:"ACTIVE_FROM";s:11:"SORT_ORDER1";s:4:"DESC";s:8:"SORT_BY2";s:4:"SORT";s:11:"SORT_ORDER2";s:3:"ASC";s:11:"FILTER_NAME";s:0:"";s:10:"FIELD_CODE";a:4:{i:0;s:4:"NAME";i:1;s:11:"DETAIL_TEXT";i:2;s:14:"DETAIL_PICTURE";i:3;s:0:"";}s:13:"PROPERTY_CODE";a:2:{i:0;s:0:"";i:1;s:0:"";}s:11:"CHECK_DATES";s:1:"Y";s:10:"DETAIL_URL";s:0:"";s:9:"AJAX_MODE";s:1:"N";s:16:"AJAX_OPTION_JUMP";s:1:"N";s:17:"AJAX_OPTION_STYLE";s:1:"Y";s:19:"AJAX_OPTION_HISTORY";s:1:"N";s:22:"AJAX_OPTION_ADDITIONAL";s:0:"";s:10:"CACHE_TYPE";s:1:"A";s:10:"CACHE_TIME";s:8:"36000000";s:12:"CACHE_FILTER";s:1:"N";s:12:"CACHE_GROUPS";s:1:"Y";s:20:"PREVIEW_TRUNCATE_LEN";s:0:"";s:18:"ACTIVE_DATE_FORMAT";s:5:"d.m.Y";s:9:"SET_TITLE";s:1:"N";s:17:"SET_BROWSER_TITLE";s:1:"N";s:17:"SET_META_KEYWORDS";s:1:"Y";s:20:"SET_META_DESCRIPTION";s:1:"Y";s:17:"SET_LAST_MODIFIED";s:1:"N";s:25:"INCLUDE_IBLOCK_INTO_CHAIN";s:1:"Y";s:18:"ADD_SECTIONS_CHAIN";s:1:"Y";s:24:"HIDE_LINK_WHEN_NO_DETAIL";s:1:"N";s:14:"PARENT_SECTION";s:0:"";s:19:"PARENT_SECTION_CODE";s:0:"";s:19:"INCLUDE_SUBSECTIONS";s:1:"Y";s:20:"STRICT_SECTION_CHECK";s:1:"N";s:12:"DISPLAY_DATE";s:1:"Y";s:12:"DISPLAY_NAME";s:1:"Y";s:15:"DISPLAY_PICTURE";s:1:"Y";s:20:"DISPLAY_PREVIEW_TEXT";s:1:"Y";s:14:"PAGER_TEMPLATE";s:8:".default";s:17:"DISPLAY_TOP_PAGER";s:1:"N";s:20:"DISPLAY_BOTTOM_PAGER";s:1:"Y";s:11:"PAGER_TITLE";s:14:"Новости";s:17:"PAGER_SHOW_ALWAYS";s:1:"N";s:20:"PAGER_DESC_NUMBERING";s:1:"N";s:31:"PAGER_DESC_NUMBERING_CACHE_TIME";s:5:"36000";s:14:"PAGER_SHOW_ALL";s:1:"N";s:22:"PAGER_BASE_LINK_ENABLE";s:1:"N";s:14:"SET_STATUS_404";s:1:"N";s:8:"SHOW_404";s:1:"N";s:11:"MESSAGE_404";s:0:"";}'),
	(59, 's1', 'bitrix:catalog.section.list', 'menu-school', '/menu/school/index.php', 'N', NULL, 124, 1357, 'a:19:{s:18:"COMPONENT_TEMPLATE";s:8:".default";s:11:"IBLOCK_TYPE";s:9:"documents";s:9:"IBLOCK_ID";s:1:"6";s:10:"SECTION_ID";s:26:"={$_REQUEST["SECTION_ID"]}";s:12:"SECTION_CODE";s:0:"";s:14:"COUNT_ELEMENTS";s:1:"Y";s:21:"COUNT_ELEMENTS_FILTER";s:10:"CNT_ACTIVE";s:9:"TOP_DEPTH";s:1:"2";s:14:"SECTION_FIELDS";a:2:{i:0;s:0:"";i:1;s:0:"";}s:19:"SECTION_USER_FIELDS";a:2:{i:0;s:0:"";i:1;s:0:"";}s:11:"FILTER_NAME";s:14:"sectionsFilter";s:9:"VIEW_MODE";s:4:"LINE";s:16:"SHOW_PARENT_NAME";s:1:"Y";s:11:"SECTION_URL";s:0:"";s:10:"CACHE_TYPE";s:1:"A";s:10:"CACHE_TIME";s:8:"36000000";s:12:"CACHE_GROUPS";s:1:"Y";s:12:"CACHE_FILTER";s:1:"N";s:18:"ADD_SECTIONS_CHAIN";s:1:"Y";}'),
	(61, 's1', 'bitrix:news.list', 'catalog-menu', '/local/templates/globus/components/bitrix/catalog.section.list/menu-school/component_epilog.php', 'N', NULL, 497, 2165, 'a:52:{s:18:"COMPONENT_TEMPLATE";s:12:"catalog-menu";s:11:"IBLOCK_TYPE";s:9:"documents";s:9:"IBLOCK_ID";s:1:"6";s:10:"NEWS_COUNT";s:3:"300";s:8:"SORT_BY1";s:11:"ACTIVE_FROM";s:11:"SORT_ORDER1";s:4:"DESC";s:8:"SORT_BY2";s:4:"SORT";s:11:"SORT_ORDER2";s:3:"ASC";s:11:"FILTER_NAME";s:0:"";s:10:"FIELD_CODE";a:2:{i:0;s:0:"";i:1;s:0:"";}s:13:"PROPERTY_CODE";a:2:{i:0;s:0:"";i:1;s:0:"";}s:11:"CHECK_DATES";s:1:"Y";s:10:"DETAIL_URL";s:0:"";s:9:"AJAX_MODE";s:1:"N";s:16:"AJAX_OPTION_JUMP";s:1:"N";s:17:"AJAX_OPTION_STYLE";s:1:"Y";s:19:"AJAX_OPTION_HISTORY";s:1:"N";s:22:"AJAX_OPTION_ADDITIONAL";s:0:"";s:10:"CACHE_TYPE";s:1:"A";s:10:"CACHE_TIME";s:8:"36000000";s:12:"CACHE_FILTER";s:1:"N";s:12:"CACHE_GROUPS";s:1:"Y";s:20:"PREVIEW_TRUNCATE_LEN";s:0:"";s:18:"ACTIVE_DATE_FORMAT";s:5:"d.m.Y";s:9:"SET_TITLE";s:1:"N";s:17:"SET_BROWSER_TITLE";s:1:"N";s:17:"SET_META_KEYWORDS";s:1:"N";s:20:"SET_META_DESCRIPTION";s:1:"N";s:17:"SET_LAST_MODIFIED";s:1:"N";s:25:"INCLUDE_IBLOCK_INTO_CHAIN";s:1:"N";s:18:"ADD_SECTIONS_CHAIN";s:1:"N";s:24:"HIDE_LINK_WHEN_NO_DETAIL";s:1:"N";s:14:"PARENT_SECTION";s:3:"123";s:19:"PARENT_SECTION_CODE";s:0:"";s:19:"INCLUDE_SUBSECTIONS";s:1:"Y";s:20:"STRICT_SECTION_CHECK";s:1:"N";s:12:"DISPLAY_DATE";s:1:"Y";s:12:"DISPLAY_NAME";s:1:"Y";s:15:"DISPLAY_PICTURE";s:1:"Y";s:20:"DISPLAY_PREVIEW_TEXT";s:1:"Y";s:14:"PAGER_TEMPLATE";s:0:"";s:17:"DISPLAY_TOP_PAGER";s:1:"N";s:20:"DISPLAY_BOTTOM_PAGER";s:1:"N";s:11:"PAGER_TITLE";s:14:"Новости";s:17:"PAGER_SHOW_ALWAYS";s:1:"N";s:20:"PAGER_DESC_NUMBERING";s:1:"N";s:31:"PAGER_DESC_NUMBERING_CACHE_TIME";s:5:"36000";s:14:"PAGER_SHOW_ALL";s:1:"N";s:22:"PAGER_BASE_LINK_ENABLE";s:1:"N";s:14:"SET_STATUS_404";s:1:"N";s:8:"SHOW_404";s:1:"N";s:11:"MESSAGE_404";s:0:"";}');

-- Дамп структуры для таблица globus.b_composite_log
CREATE TABLE IF NOT EXISTS `b_composite_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `HOST` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `URI` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED` datetime NOT NULL,
  `TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `AJAX` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `USER_ID` int(11) NOT NULL DEFAULT 0,
  `PAGE_ID` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `IX_B_COMPOSITE_LOG_PAGE_ID` (`PAGE_ID`),
  KEY `IX_B_COMPOSITE_LOG_HOST` (`HOST`),
  KEY `IX_B_COMPOSITE_LOG_TYPE` (`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_composite_log: ~0 rows (приблизительно)
DELETE FROM `b_composite_log`;

-- Дамп структуры для таблица globus.b_composite_page
CREATE TABLE IF NOT EXISTS `b_composite_page` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CACHE_KEY` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `HOST` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `URI` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED` datetime NOT NULL,
  `CHANGED` datetime NOT NULL,
  `LAST_VIEWED` datetime NOT NULL,
  `VIEWS` int(11) NOT NULL DEFAULT 0,
  `REWRITES` int(11) NOT NULL DEFAULT 0,
  `SIZE` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `IX_B_COMPOSITE_PAGE_CACHE_KEY` (`CACHE_KEY`(100)),
  KEY `IX_B_COMPOSITE_PAGE_VIEWED` (`LAST_VIEWED`),
  KEY `IX_B_COMPOSITE_PAGE_HOST` (`HOST`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_composite_page: ~0 rows (приблизительно)
DELETE FROM `b_composite_page`;

-- Дамп структуры для таблица globus.b_consent_agreement
CREATE TABLE IF NOT EXISTS `b_consent_agreement` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_INSERT` datetime NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATA_PROVIDER` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AGREEMENT_TEXT` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `LABEL_TEXT` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECURITY_CODE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USE_URL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_AGREEMENT_TEXT_HTML` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_AGREEMENT_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_consent_agreement: ~0 rows (приблизительно)
DELETE FROM `b_consent_agreement`;

-- Дамп структуры для таблица globus.b_consent_field
CREATE TABLE IF NOT EXISTS `b_consent_field` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AGREEMENT_ID` int(11) NOT NULL,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_FIELD_AG_ID` (`AGREEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_consent_field: ~0 rows (приблизительно)
DELETE FROM `b_consent_field`;

-- Дамп структуры для таблица globus.b_consent_user_consent
CREATE TABLE IF NOT EXISTS `b_consent_user_consent` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `AGREEMENT_ID` int(11) NOT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORIGIN_ID` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORIGINATOR_ID` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_USER_CONSENT` (`AGREEMENT_ID`),
  KEY `IX_CONSENT_USER_CONSENT_USER_ORIGIN` (`USER_ID`,`ORIGIN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_consent_user_consent: ~0 rows (приблизительно)
DELETE FROM `b_consent_user_consent`;

-- Дамп структуры для таблица globus.b_consent_user_consent_item
CREATE TABLE IF NOT EXISTS `b_consent_user_consent_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_CONSENT_ID` int(11) NOT NULL,
  `VALUE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_USER_ITEM_AG_ID` (`USER_CONSENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_consent_user_consent_item: ~0 rows (приблизительно)
DELETE FROM `b_consent_user_consent_item`;

-- Дамп структуры для таблица globus.b_counter_data
CREATE TABLE IF NOT EXISTS `b_counter_data` (
  `ID` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `DATA` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_counter_data: ~0 rows (приблизительно)
DELETE FROM `b_counter_data`;

-- Дамп структуры для таблица globus.b_culture
CREATE TABLE IF NOT EXISTS `b_culture` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT 1,
  `CHARSET` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SHORT_DATE_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'n/j/Y',
  `MEDIUM_DATE_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'M j, Y',
  `LONG_DATE_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'F j, Y',
  `FULL_DATE_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'l, F j, Y',
  `DAY_MONTH_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'F j',
  `DAY_SHORT_MONTH_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'M j',
  `DAY_OF_WEEK_MONTH_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'l, F j',
  `SHORT_DAY_OF_WEEK_MONTH_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'D, F j',
  `SHORT_DAY_OF_WEEK_SHORT_MONTH_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'D, M j',
  `SHORT_TIME_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'g:i a',
  `LONG_TIME_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'g:i:s a',
  `AM_VALUE` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'am',
  `PM_VALUE` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'pm',
  `NUMBER_THOUSANDS_SEPARATOR` varchar(10) COLLATE utf8_unicode_ci DEFAULT ',',
  `NUMBER_DECIMAL_SEPARATOR` varchar(10) COLLATE utf8_unicode_ci DEFAULT '.',
  `NUMBER_DECIMALS` tinyint(4) DEFAULT 2,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_culture: ~2 rows (приблизительно)
DELETE FROM `b_culture`;
INSERT INTO `b_culture` (`ID`, `CODE`, `NAME`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `DIRECTION`, `SHORT_DATE_FORMAT`, `MEDIUM_DATE_FORMAT`, `LONG_DATE_FORMAT`, `FULL_DATE_FORMAT`, `DAY_MONTH_FORMAT`, `DAY_SHORT_MONTH_FORMAT`, `DAY_OF_WEEK_MONTH_FORMAT`, `SHORT_DAY_OF_WEEK_MONTH_FORMAT`, `SHORT_DAY_OF_WEEK_SHORT_MONTH_FORMAT`, `SHORT_TIME_FORMAT`, `LONG_TIME_FORMAT`, `AM_VALUE`, `PM_VALUE`, `NUMBER_THOUSANDS_SEPARATOR`, `NUMBER_DECIMAL_SEPARATOR`, `NUMBER_DECIMALS`) VALUES
	(1, 'ru', 'ru', 'DD.MM.YYYY', 'DD.MM.YYYY HH:MI:SS', '#NAME# #LAST_NAME#', 1, 'UTF-8', 'Y', 'd.m.Y', 'j M Y', 'j F Y', 'l, j F Y', 'j F', 'j M', 'l, j F', 'D, j F', 'D, j M', 'H:i', 'H:i:s', 'am', 'pm', ' ', ',', 2),
	(2, 'en', 'en', 'MM/DD/YYYY', 'MM/DD/YYYY H:MI:SS T', '#NAME# #LAST_NAME#', 0, 'UTF-8', 'Y', 'n/j/Y', 'M j, Y', 'F j, Y', 'l, F j, Y', 'F j', 'M j', 'l, F j', 'D, F j', 'D, M j', 'g:i a', 'g:i:s a', 'am', 'pm', ',', '.', 2);

-- Дамп структуры для таблица globus.b_entity_usage
CREATE TABLE IF NOT EXISTS `b_entity_usage` (
  `USER_ID` int(11) NOT NULL,
  `CONTEXT` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID_INT` int(11) NOT NULL DEFAULT 0,
  `PREFIX` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `LAST_USE_DATE` datetime NOT NULL,
  PRIMARY KEY (`USER_ID`,`CONTEXT`,`ENTITY_ID`,`ITEM_ID`),
  KEY `IX_ENTITY_USAGE_ITEM_ID_INT` (`ITEM_ID_INT`),
  KEY `IX_ENTITY_USAGE_LAST_USE_DATE` (`LAST_USE_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_entity_usage: ~0 rows (приблизительно)
DELETE FROM `b_entity_usage`;

-- Дамп структуры для таблица globus.b_event
CREATE TABLE IF NOT EXISTS `b_event` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_ID` int(11) DEFAULT NULL,
  `LID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `C_FIELDS` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `SUCCESS_EXEC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DUPLICATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_success` (`SUCCESS_EXEC`),
  KEY `ix_b_event_date_exec` (`DATE_EXEC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_event: ~0 rows (приблизительно)
DELETE FROM `b_event`;

-- Дамп структуры для таблица globus.b_event_attachment
CREATE TABLE IF NOT EXISTS `b_event_attachment` (
  `EVENT_ID` int(11) NOT NULL,
  `FILE_ID` int(11) NOT NULL,
  `IS_FILE_COPIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`EVENT_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_event_attachment: ~0 rows (приблизительно)
DELETE FROM `b_event_attachment`;

-- Дамп структуры для таблица globus.b_event_log
CREATE TABLE IF NOT EXISTS `b_event_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `SEVERITY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `AUDIT_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REMOTE_ADDR` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_AGENT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_URI` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `GUEST_ID` int(11) DEFAULT NULL,
  `DESCRIPTION` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_event_log_time` (`TIMESTAMP_X`),
  KEY `ix_b_event_log_audit_type_time` (`AUDIT_TYPE_ID`,`TIMESTAMP_X`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_event_log: ~10 rows (приблизительно)
DELETE FROM `b_event_log`;
INSERT INTO `b_event_log` (`ID`, `TIMESTAMP_X`, `SEVERITY`, `AUDIT_TYPE_ID`, `MODULE_ID`, `ITEM_ID`, `REMOTE_ADDR`, `USER_AGENT`, `REQUEST_URI`, `SITE_ID`, `USER_ID`, `GUEST_ID`, `DESCRIPTION`) VALUES
	(1, '2023-02-10 08:06:33', 'UNKNOWN', 'MENU_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0', '/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&new=Y&lang=ru&site=s1&back_url=%2F%3Fbitrix_include_areas%3DY%26clear_cache%3DY&path=&name=upper&siteTemplateId=globus', NULL, 1, NULL, 'a:2:{s:9:"menu_name";s:28:"Меню выше шапки";s:4:"path";s:0:"";}'),
	(2, '2023-02-10 08:15:11', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0', '/bitrix/admin/public_file_edit_src.php?bxsender=core_window_cdialog&lang=ru&site=ru&back_url=%2F%3Fbitrix_include_areas%3DY%26clear_cache%3DY&path=%2Fbitrix%2Ftemplates%2F.default%2Fcomponents%2Fbitrix%2Fmenu%2Fmain%2Ftemplate.php&siteTemplateId=.default', 's1', 1, NULL, 'a:1:{s:4:"path";s:66:"bitrix/templates/.default/components/bitrix/menu/main/template.php";}'),
	(3, '2023-02-10 08:15:26', 'UNKNOWN', 'MENU_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0', '/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&new=Y&lang=ru&site=s1&back_url=%2F%3Fbitrix_include_areas%3DY%26clear_cache%3DY&path=&name=top&siteTemplateId=globus', NULL, 1, NULL, 'a:2:{s:9:"menu_name";s:23:"Верхнее меню";s:4:"path";s:0:"";}'),
	(4, '2023-02-10 08:38:52', 'UNKNOWN', 'MENU_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0', '/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&new=Y&lang=ru&site=s1&back_url=%2F%3Fbitrix_include_areas%3DY%26clear_cache%3DY&path=&name=header-addr&siteTemplateId=globus', NULL, 1, NULL, 'a:2:{s:9:"menu_name";N;s:4:"path";s:0:"";}'),
	(5, '2023-02-10 08:45:35', 'UNKNOWN', 'MENU_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0', '/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&new=Y&lang=ru&site=s1&back_url=%2F%3Fbitrix_include_areas%3DY%26clear_cache%3DY&path=&name=header-phones&siteTemplateId=globus', NULL, 1, NULL, 'a:2:{s:9:"menu_name";N;s:4:"path";s:0:"";}'),
	(6, '2023-02-10 08:53:22', 'UNKNOWN', 'MENU_EDIT', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0', '/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&lang=ru&site=s1&back_url=%2F%3Fbitrix_include_areas%3DY%26clear_cache%3DY&path=%2F&name=top&siteTemplateId=globus', NULL, 1, NULL, 'a:2:{s:9:"menu_name";s:23:"Верхнее меню";s:4:"path";s:0:"";}'),
	(7, '2023-02-10 09:09:26', 'UNKNOWN', 'MENU_ADD', 'main', 'UNKNOWN', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0', '/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&new=Y&lang=ru&site=s1&back_url=%2Fnews%2F%3Fbitrix_include_areas%3DY%26clear_cache%3DY&path=%2Fnews&name=footer&siteTemplateId=globus', NULL, 1, NULL, 'a:2:{s:9:"menu_name";s:26:"Меню в подвале";s:4:"path";s:4:"news";}'),
	(8, '2023-02-11 11:19:20', 'WARNING', 'SITE_CHECKER_ERROR', 'main', 'CSiteCheckerTest::CommonTest();', '-', '-', '/', 's1', NULL, NULL, ''),
	(9, '2023-02-11 13:44:27', 'UNKNOWN', 'IBLOCK_EDIT', 'iblock', '6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0', '/bitrix/admin/iblock_edit.php?type=documents&lang=ru&admin=Y', NULL, 1, NULL, 'a:1:{s:4:"NAME";s:24:"Меню для школ";}'),
	(10, '2023-02-11 13:57:32', 'UNKNOWN', 'IBLOCK_EDIT', 'iblock', '6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0', '/bitrix/admin/iblock_edit.php?type=documents&lang=ru&admin=Y', NULL, 1, NULL, 'a:1:{s:4:"NAME";s:24:"Меню для школ";}');

-- Дамп структуры для таблица globus.b_event_message
CREATE TABLE IF NOT EXISTS `b_event_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EMAIL_FROM` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EMAIL_FROM#',
  `EMAIL_TO` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EMAIL_TO#',
  `SUBJECT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE_PHP` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `BODY_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `BCC` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `REPLY_TO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CC` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_REPLY_TO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRIORITY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD1_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD1_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD2_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD2_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_TEMPLATE_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADDITIONAL_FIELD` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_event_message_name` (`EVENT_NAME`(50))
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_event_message: ~28 rows (приблизительно)
DELETE FROM `b_event_message`;
INSERT INTO `b_event_message` (`ID`, `TIMESTAMP_X`, `EVENT_NAME`, `LID`, `ACTIVE`, `EMAIL_FROM`, `EMAIL_TO`, `SUBJECT`, `MESSAGE`, `MESSAGE_PHP`, `BODY_TYPE`, `BCC`, `REPLY_TO`, `CC`, `IN_REPLY_TO`, `PRIORITY`, `FIELD1_NAME`, `FIELD1_VALUE`, `FIELD2_NAME`, `FIELD2_VALUE`, `SITE_TEMPLATE_ID`, `ADDITIONAL_FIELD`, `LANGUAGE_ID`) VALUES
	(1, '2023-02-10 03:17:09', 'NEW_USER', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#DEFAULT_EMAIL_FROM#', '#SITE_NAME#: Зарегистрировался новый пользователь', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНа сайте #SERVER_NAME# успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: #USER_ID#\n\nИмя: #NAME#\nФамилия: #LAST_NAME#\nE-Mail: #EMAIL#\n\nLogin: #LOGIN#\n\nПисьмо сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nНа сайте <?=$arParams["SERVER_NAME"];?> успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: <?=$arParams["USER_ID"];?>\n\n\nИмя: <?=$arParams["NAME"];?>\n\nФамилия: <?=$arParams["LAST_NAME"];?>\n\nE-Mail: <?=$arParams["EMAIL"];?>\n\n\nLogin: <?=$arParams["LOGIN"];?>\n\n\nПисьмо сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
	(2, '2023-02-10 03:17:09', 'USER_INFO', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Регистрационная информация', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n<?=$arParams["NAME"];?> <?=$arParams["LAST_NAME"];?>,\n\n<?=$arParams["MESSAGE"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams["USER_ID"];?>\n\nСтатус профиля: <?=$arParams["STATUS"];?>\n\nLogin: <?=$arParams["LOGIN"];?>\n\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://<?=$arParams["SERVER_NAME"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams["CHECKWORD"];?>&USER_LOGIN=<?=$arParams["URL_LOGIN"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
	(3, '2023-02-10 03:17:09', 'USER_PASS_REQUEST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Запрос на смену пароля', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n<?=$arParams["NAME"];?> <?=$arParams["LAST_NAME"];?>,\n\n<?=$arParams["MESSAGE"];?>\n\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams["SERVER_NAME"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams["CHECKWORD"];?>&USER_LOGIN=<?=$arParams["URL_LOGIN"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams["USER_ID"];?>\n\nСтатус профиля: <?=$arParams["STATUS"];?>\n\nLogin: <?=$arParams["LOGIN"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
	(4, '2023-02-10 03:17:09', 'USER_PASS_CHANGED', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение смены пароля', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n<?=$arParams["NAME"];?> <?=$arParams["LAST_NAME"];?>,\n\n<?=$arParams["MESSAGE"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams["USER_ID"];?>\n\nСтатус профиля: <?=$arParams["STATUS"];?>\n\nLogin: <?=$arParams["LOGIN"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
	(5, '2023-02-10 03:17:09', 'NEW_USER_CONFIRM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение регистрации нового пользователя', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере #SERVER_NAME#.\n\nВаш код для подтверждения регистрации: #CONFIRM_CODE#\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#&confirm_code=#CONFIRM_CODE#\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере <?=$arParams["SERVER_NAME"];?>.\n\nВаш код для подтверждения регистрации: <?=$arParams["CONFIRM_CODE"];?>\n\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://<?=$arParams["SERVER_NAME"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams["USER_ID"];?>&confirm_code=<?=$arParams["CONFIRM_CODE"];?>\n\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://<?=$arParams["SERVER_NAME"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams["USER_ID"];?>\n\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
	(6, '2023-02-10 03:17:09', 'USER_INVITE', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Приглашение на сайт', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\nЗдравствуйте, #NAME# #LAST_NAME#!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: #ID#\nLogin: #LOGIN#\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth.php?change_password=yes&USER_LOGIN=#URL_LOGIN#&USER_CHECKWORD=#CHECKWORD#\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\nЗдравствуйте, <?=$arParams["NAME"];?> <?=$arParams["LAST_NAME"];?>!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams["ID"];?>\n\nLogin: <?=$arParams["LOGIN"];?>\n\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams["SERVER_NAME"];?>/auth.php?change_password=yes&USER_LOGIN=<?=$arParams["URL_LOGIN"];?>&USER_CHECKWORD=<?=$arParams["CHECKWORD"];?>\n\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
	(7, '2023-02-10 03:17:09', 'FEEDBACK_FORM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: Сообщение из формы обратной связи', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: #AUTHOR#\nE-mail автора: #AUTHOR_EMAIL#\n\nТекст сообщения:\n#TEXT#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\nE-mail автора: <?=$arParams["AUTHOR_EMAIL"];?>\n\n\nТекст сообщения:\n<?=$arParams["TEXT"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
	(8, '2023-02-10 03:17:09', 'MAIN_MAIL_CONFIRM_CODE', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#MESSAGE_SUBJECT#', '<? EventMessageThemeCompiler::includeComponent(\'bitrix:main.mail.confirm\', \'\', $arParams); ?>', '<? EventMessageThemeCompiler::includeComponent(\'bitrix:main.mail.confirm\', \'\', $arParams); ?>', 'html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mail_join', NULL, NULL),
	(9, '2023-02-10 03:17:09', 'EVENT_LOG_NOTIFICATION', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', 'Оповещение журнала событий: #NAME#', 'Зафиксированы события в журнале, соответствующие параметрам оповещения:\n\nТип события: #AUDIT_TYPE_ID#\nОбъект: #ITEM_ID#\nПользователь: #USER_ID# \nIP-адрес: #REMOTE_ADDR#\nБраузер: #USER_AGENT#\nСтраница: #REQUEST_URI# \n\nКоличество записей: #EVENT_COUNT# \n\n#ADDITIONAL_TEXT#\n\nПерейти в журнал событий:\nhttp://#SERVER_NAME#/bitrix/admin/event_log.php?set_filter=Y&find_audit_type_id=#AUDIT_TYPE_ID#', 'Зафиксированы события в журнале, соответствующие параметрам оповещения:\n\nТип события: <?=$arParams["AUDIT_TYPE_ID"];?>\n\nОбъект: <?=$arParams["ITEM_ID"];?>\n\nПользователь: <?=$arParams["USER_ID"];?> \nIP-адрес: <?=$arParams["REMOTE_ADDR"];?>\n\nБраузер: <?=$arParams["USER_AGENT"];?>\n\nСтраница: <?=$arParams["REQUEST_URI"];?> \n\nКоличество записей: <?=$arParams["EVENT_COUNT"];?> \n\n<?=$arParams["ADDITIONAL_TEXT"];?>\n\n\nПерейти в журнал событий:\nhttp://<?=$arParams["SERVER_NAME"];?>/bitrix/admin/event_log.php?set_filter=Y&find_audit_type_id=<?=$arParams["AUDIT_TYPE_ID"];?>', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
	(10, '2023-02-10 03:17:09', 'USER_CODE_REQUEST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Запрос кода авторизации', 'Используйте для авторизации код:\n\n#CHECKWORD#\n\nПосле авторизации вы сможете изменить свой пароль в редактировании профиля.\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nЛогин: #LOGIN#\n\nСообщение создано автоматически.', 'Используйте для авторизации код:\n\n<?=$arParams["CHECKWORD"];?>\n\n\nПосле авторизации вы сможете изменить свой пароль в редактировании профиля.\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams["USER_ID"];?>\n\nСтатус профиля: <?=$arParams["STATUS"];?>\n\nЛогин: <?=$arParams["LOGIN"];?>\n\n\nСообщение создано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
	(11, '2023-02-10 03:17:26', 'NEW_BLOG_MESSAGE', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #BLOG_NAME# : #MESSAGE_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовое сообщение в блоге "#BLOG_NAME#"\n\nТема:\n#MESSAGE_TITLE#\n\nАвтор: #AUTHOR#\nДата: #MESSAGE_DATE#\n\nТекст сообщения:\n#MESSAGE_TEXT#\n\nАдрес сообщения:\n#MESSAGE_PATH#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nНовое сообщение в блоге "<?=$arParams["BLOG_NAME"];?>"\n\nТема:\n<?=$arParams["MESSAGE_TITLE"];?>\n\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\nДата: <?=$arParams["MESSAGE_DATE"];?>\n\n\nТекст сообщения:\n<?=$arParams["MESSAGE_TEXT"];?>\n\n\nАдрес сообщения:\n<?=$arParams["MESSAGE_PATH"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(12, '2023-02-10 03:17:26', 'NEW_BLOG_COMMENT', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE# : #COMMENT_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий в блоге "#BLOG_NAME#" на сообщение "#MESSAGE_TITLE#"\n\nТема:\n#COMMENT_TITLE#\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nНовый комментарий в блоге "<?=$arParams["BLOG_NAME"];?>" на сообщение "<?=$arParams["MESSAGE_TITLE"];?>"\n\nТема:\n<?=$arParams["COMMENT_TITLE"];?>\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\nДата: <?=$arParams["COMMENT_DATE"];?>\n\n\nТекст сообщения:\n<?=$arParams["COMMENT_TEXT"];?>\n\n\nАдрес сообщения:\n<?=$arParams["COMMENT_PATH"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(13, '2023-02-10 03:17:26', 'NEW_BLOG_COMMENT2COMMENT', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE# : #COMMENT_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге "#BLOG_NAME#" на сообщение "#MESSAGE_TITLE#".\n\nТема:\n#COMMENT_TITLE#\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге "<?=$arParams["BLOG_NAME"];?>" на сообщение "<?=$arParams["MESSAGE_TITLE"];?>".\n\nТема:\n<?=$arParams["COMMENT_TITLE"];?>\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\nДата: <?=$arParams["COMMENT_DATE"];?>\n\n\nТекст сообщения:\n<?=$arParams["COMMENT_TEXT"];?>\n\n\nАдрес сообщения:\n<?=$arParams["COMMENT_PATH"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(14, '2023-02-10 03:17:26', 'NEW_BLOG_COMMENT_WITHOUT_TITLE', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий в блоге "#BLOG_NAME#" на сообщение "#MESSAGE_TITLE#"\n\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nНовый комментарий в блоге "<?=$arParams["BLOG_NAME"];?>" на сообщение "<?=$arParams["MESSAGE_TITLE"];?>"\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\nДата: <?=$arParams["COMMENT_DATE"];?>\n\n\nТекст сообщения:\n<?=$arParams["COMMENT_TEXT"];?>\n\n\nАдрес сообщения:\n<?=$arParams["COMMENT_PATH"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(15, '2023-02-10 03:17:26', 'NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге "#BLOG_NAME#" на сообщение "#MESSAGE_TITLE#".\n\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге "<?=$arParams["BLOG_NAME"];?>" на сообщение "<?=$arParams["MESSAGE_TITLE"];?>".\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\nДата: <?=$arParams["COMMENT_DATE"];?>\n\n\nТекст сообщения:\n<?=$arParams["COMMENT_TEXT"];?>\n\n\nАдрес сообщения:\n<?=$arParams["COMMENT_PATH"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(16, '2023-02-10 03:17:26', 'BLOG_YOUR_BLOG_TO_USER', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] Ваш блог "#BLOG_NAME#" был добавлен в друзья к #USER#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВаш блог "#BLOG_NAME#" был добавлен в друзья к #USER#.\n\nПрофиль пользователя: #USER_URL#\n\nАдрес вашего блога: #BLOG_ADR#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nВаш блог "<?=$arParams["BLOG_NAME"];?>" был добавлен в друзья к <?=$arParams["USER"];?>.\n\nПрофиль пользователя: <?=$arParams["USER_URL"];?>\n\n\nАдрес вашего блога: <?=$arParams["BLOG_ADR"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(17, '2023-02-10 03:17:26', 'BLOG_YOU_TO_BLOG', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] Вы были добавлены в друзья блога "#BLOG_NAME#"', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы были добавлены в друзья блога "#BLOG_NAME#".\n\nАдрес блога: #BLOG_ADR#\n\nВаш профиль: #USER_URL#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nВы были добавлены в друзья блога "<?=$arParams["BLOG_NAME"];?>".\n\nАдрес блога: <?=$arParams["BLOG_ADR"];?>\n\n\nВаш профиль: <?=$arParams["USER_URL"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(18, '2023-02-10 03:17:26', 'BLOG_BLOG_TO_YOU', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] К вам в друзья был добавлен блог "#BLOG_NAME#"', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nК вам в друзья был добавлен блог "#BLOG_NAME#".\n\nАдрес блога: #BLOG_ADR#\n\nВаш профиль: #USER_URL#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nК вам в друзья был добавлен блог "<?=$arParams["BLOG_NAME"];?>".\n\nАдрес блога: <?=$arParams["BLOG_ADR"];?>\n\n\nВаш профиль: <?=$arParams["USER_URL"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(19, '2023-02-10 03:17:26', 'BLOG_USER_TO_YOUR_BLOG', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] В ваш блог "#BLOG_NAME#" был добавлен друг #USER#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВ ваш блог "#BLOG_NAME#" был добавлен друг #USER#.\n\nПрофиль пользователя: #USER_URL#\n\nАдрес вашего блога: #BLOG_ADR#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nВ ваш блог "<?=$arParams["BLOG_NAME"];?>" был добавлен друг <?=$arParams["USER"];?>.\n\nПрофиль пользователя: <?=$arParams["USER_URL"];?>\n\n\nАдрес вашего блога: <?=$arParams["BLOG_ADR"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(20, '2023-02-10 03:17:26', 'BLOG_SONET_NEW_POST', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#POST_TITLE#', '<?EventMessageThemeCompiler::includeComponent("bitrix:socialnetwork.blog.post.mail","",Array("EMAIL_TO" => "{#EMAIL_TO#}","RECIPIENT_ID" => "{#RECIPIENT_ID#}","POST_ID" => "{#POST_ID#}","URL" => "{#URL#}"));?>', '<?EventMessageThemeCompiler::includeComponent("bitrix:socialnetwork.blog.post.mail","",Array("EMAIL_TO" => "{$arParams[\'EMAIL_TO\']}","RECIPIENT_ID" => "{$arParams[\'RECIPIENT_ID\']}","POST_ID" => "{$arParams[\'POST_ID\']}","URL" => "{$arParams[\'URL\']}"));?>', 'html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mail_user', NULL, NULL),
	(21, '2023-02-10 03:17:26', 'BLOG_SONET_NEW_COMMENT', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', 'Re: #POST_TITLE#', '<?EventMessageThemeCompiler::includeComponent("bitrix:socialnetwork.blog.post.comment.mail","",Array("COMMENT_ID" => "{#COMMENT_ID#}","RECIPIENT_ID" => "{#RECIPIENT_ID#}","EMAIL_TO" => "{#EMAIL_TO#}","POST_ID" => "{#POST_ID#}","URL" => "{#URL#}"));?>', '<?EventMessageThemeCompiler::includeComponent("bitrix:socialnetwork.blog.post.comment.mail","",Array("COMMENT_ID" => "{$arParams[\'COMMENT_ID\']}","RECIPIENT_ID" => "{$arParams[\'RECIPIENT_ID\']}","EMAIL_TO" => "{$arParams[\'EMAIL_TO\']}","POST_ID" => "{$arParams[\'POST_ID\']}","URL" => "{$arParams[\'URL\']}"));?>', 'html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mail_user', NULL, NULL),
	(22, '2023-02-10 03:17:26', 'BLOG_SONET_POST_SHARE', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#POST_TITLE#', '<?EventMessageThemeCompiler::includeComponent("bitrix:socialnetwork.blog.post_share.mail","",Array("EMAIL_TO" => "{#EMAIL_TO#}","RECIPIENT_ID" => "{#RECIPIENT_ID#}","POST_ID" => "{#POST_ID#}","URL" => "{#URL#}"));?>', '<?EventMessageThemeCompiler::includeComponent("bitrix:socialnetwork.blog.post_share.mail","",Array("EMAIL_TO" => "{$arParams[\'EMAIL_TO\']}","RECIPIENT_ID" => "{$arParams[\'RECIPIENT_ID\']}","POST_ID" => "{$arParams[\'POST_ID\']}","URL" => "{$arParams[\'URL\']}"));?>', 'html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mail_user', NULL, NULL),
	(23, '2023-02-10 03:17:26', 'BLOG_POST_BROADCAST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: #MESSAGE_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНа сайте добавлено новое сообщение.\n\nТема:\n#MESSAGE_TITLE#\n\nАвтор: #AUTHOR#\n\nТекст сообщения:\n#MESSAGE_TEXT#\n\nАдрес сообщения:\n#MESSAGE_PATH#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nНа сайте добавлено новое сообщение.\n\nТема:\n<?=$arParams["MESSAGE_TITLE"];?>\n\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\n\nТекст сообщения:\n<?=$arParams["MESSAGE_TEXT"];?>\n\n\nАдрес сообщения:\n<?=$arParams["MESSAGE_PATH"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(24, '2023-02-10 03:17:37', 'NEW_FORUM_MESSAGE', 's1', 'Y', '#FROM_EMAIL#', '#RECIPIENT#', '#SITE_NAME#: [F] #TOPIC_TITLE# : #FORUM_NAME#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовое сообщение на форуме #SERVER_NAME#.\n\nТема:\n#TOPIC_TITLE#\n\nАвтор: #AUTHOR#\nДата : #MESSAGE_DATE#\nТекст сообщения:\n\n#MESSAGE_TEXT#\n\nАдрес сообщения:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nНовое сообщение на форуме <?=$arParams["SERVER_NAME"];?>.\n\nТема:\n<?=$arParams["TOPIC_TITLE"];?>\n\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\nДата : <?=$arParams["MESSAGE_DATE"];?>\n\nТекст сообщения:\n\n<?=$arParams["MESSAGE_TEXT"];?>\n\n\nАдрес сообщения:\nhttp://<?=$arParams["SERVER_NAME"];?><?=$arParams["PATH2FORUM"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(25, '2023-02-10 03:17:37', 'NEW_FORUM_PRIV', 's1', 'Y', '#FROM_EMAIL#', '#TO_EMAIL#', '#SITE_NAME#: [private] #SUBJECT#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте #SERVER_NAME#.\n\nТема: #SUBJECT#\n\nАвтор: #FROM_NAME# #FROM_EMAIL#\nДата : #MESSAGE_DATE#\nСообщение:\n\n#MESSAGE#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте <?=$arParams["SERVER_NAME"];?>.\n\nТема: <?=$arParams["SUBJECT"];?>\n\n\nАвтор: <?=$arParams["FROM_NAME"];?> <?=$arParams["FROM_EMAIL"];?>\n\nДата : <?=$arParams["MESSAGE_DATE"];?>\n\nСообщение:\n\n<?=$arParams["MESSAGE"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(26, '2023-02-10 03:17:37', 'NEW_FORUM_PRIVATE_MESSAGE', 's1', 'Y', '#FROM_EMAIL#', '#TO_EMAIL#', '#SITE_NAME#: [private] #SUBJECT#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте #SERVER_NAME#.\n\nТема: #SUBJECT#\n\nАвтор: #FROM_NAME#\nДата: #MESSAGE_DATE#\nСообщение:\n\n#MESSAGE#\n\nСсылка на сообщение: #MESSAGE_LINK#Сообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте <?=$arParams["SERVER_NAME"];?>.\n\nТема: <?=$arParams["SUBJECT"];?>\n\n\nАвтор: <?=$arParams["FROM_NAME"];?>\n\nДата: <?=$arParams["MESSAGE_DATE"];?>\n\nСообщение:\n\n<?=$arParams["MESSAGE"];?>\n\n\nСсылка на сообщение: <?=$arParams["MESSAGE_LINK"];?>Сообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(27, '2023-02-10 03:17:37', 'EDIT_FORUM_MESSAGE', 's1', 'Y', '#FROM_EMAIL#', '#RECIPIENT#', '#SITE_NAME#: [F] #TOPIC_TITLE# : #FORUM_NAME#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nИзменение сообщения на форуме #SERVER_NAME#.\n\nТема:\n#TOPIC_TITLE#\n\nАвтор: #AUTHOR#\nДата : #MESSAGE_DATE#\nТекст сообщения:\n\n#MESSAGE_TEXT#\n\nАдрес сообщения:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nИзменение сообщения на форуме <?=$arParams["SERVER_NAME"];?>.\n\nТема:\n<?=$arParams["TOPIC_TITLE"];?>\n\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\nДата : <?=$arParams["MESSAGE_DATE"];?>\n\nТекст сообщения:\n\n<?=$arParams["MESSAGE_TEXT"];?>\n\n\nАдрес сообщения:\nhttp://<?=$arParams["SERVER_NAME"];?><?=$arParams["PATH2FORUM"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(28, '2023-02-10 03:17:37', 'FORUM_NEW_MESSAGE_MAIL', 's1', 'Y', '#FROM_EMAIL#', '#RECIPIENT#', '#TOPIC_TITLE#', '#MESSAGE_TEXT#\n\n------------------------------------------  \nВы получили это сообщение, так как выподписаны на форум #FORUM_NAME#.\n\nОтветить на сообщение можно по электронной почте или через форму на сайте:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nНаписать новое сообщение: #FORUM_EMAIL#\n\nАвтор сообщения: #AUTHOR#\n\nСообщение сгенерировано автоматически на сайте #SITE_NAME#.\n', '<?=$arParams["MESSAGE_TEXT"];?>\n\n\n------------------------------------------  \nВы получили это сообщение, так как выподписаны на форум <?=$arParams["FORUM_NAME"];?>.\n\nОтветить на сообщение можно по электронной почте или через форму на сайте:\nhttp://<?=$arParams["SERVER_NAME"];?><?=$arParams["PATH2FORUM"];?>\n\n\nНаписать новое сообщение: <?=$arParams["FORUM_EMAIL"];?>\n\n\nАвтор сообщения: <?=$arParams["AUTHOR"];?>\n\n\nСообщение сгенерировано автоматически на сайте <?=$arParams["SITE_NAME"];?>.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(29, '2023-02-10 03:18:18', 'VIRUS_DETECTED', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Обнаружен вирус', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте!\n\nВы получили это сообщение, так как модуль проактивной защиты сервера #SERVER_NAME# обнаружил код, похожий на вирус.\n\n1. Подозрительный код был вырезан из html.\n2. Проверьте журнал вторжений и убедитесь, что код действительно вредоносный, а не является кодом какого-либо счетчика или фреймворка.\n (ссылка: http://#SERVER_NAME#/bitrix/admin/event_log.php?lang=ru&set_filter=Y&find_type=audit_type_id&find_audit_type[]=SECURITY_VIRUS )\n3. В случае, если код не является опасным, добавьте его в исключения на странице настройки антивируса.\n (ссылка: http://#SERVER_NAME#/bitrix/admin/security_antivirus.php?lang=ru&tabControl_active_tab=exceptions )\n4. Если код является вирусным, то необходимо выполнить следующие действия:\n\n а) Смените пароли доступа к сайту у администраторов и ответственных сотрудников.\n б) Смените пароли доступа по ssh и ftp.\n в) Проверьте и вылечите компьютеры администраторов, имевших доступ к сайту по ssh или ftp.\n г) В программах доступа к сайту по ssh и ftp отключите сохранение паролей.\n д) Удалите вредоносный код из зараженных файлов. Например, восстановите поврежденные файлы из самой свежей резервной копии.\n\n---------------------------------------------------------------------\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nЗдравствуйте!\n\nВы получили это сообщение, так как модуль проактивной защиты сервера <?=$arParams["SERVER_NAME"];?> обнаружил код, похожий на вирус.\n\n1. Подозрительный код был вырезан из html.\n2. Проверьте журнал вторжений и убедитесь, что код действительно вредоносный, а не является кодом какого-либо счетчика или фреймворка.\n (ссылка: http://<?=$arParams["SERVER_NAME"];?>/bitrix/admin/event_log.php?lang=ru&set_filter=Y&find_type=audit_type_id&find_audit_type[]=SECURITY_VIRUS )\n3. В случае, если код не является опасным, добавьте его в исключения на странице настройки антивируса.\n (ссылка: http://<?=$arParams["SERVER_NAME"];?>/bitrix/admin/security_antivirus.php?lang=ru&tabControl_active_tab=exceptions )\n4. Если код является вирусным, то необходимо выполнить следующие действия:\n\n а) Смените пароли доступа к сайту у администраторов и ответственных сотрудников.\n б) Смените пароли доступа по ssh и ftp.\n в) Проверьте и вылечите компьютеры администраторов, имевших доступ к сайту по ssh или ftp.\n г) В программах доступа к сайту по ssh и ftp отключите сохранение паролей.\n д) Удалите вредоносный код из зараженных файлов. Например, восстановите поврежденные файлы из самой свежей резервной копии.\n\n---------------------------------------------------------------------\nСообщение сгенерировано автоматически.\n', 'text', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(30, '2023-02-10 03:18:21', 'SUBSCRIBE_CONFIRM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение подписки', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был подписан\nна список рассылки сервера #SERVER_NAME#.\n\nДополнительная информация о подписке:\n\nАдрес подписки (email) ............ #EMAIL#\nДата добавления/редактирования .... #DATE_SUBSCR#\n\nВаш код для подтверждения подписки: #CONFIRM_CODE#\n\nДля подтверждения подписки перейдите по следующей ссылке:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#\n\nВы также можете ввести код для подтверждения подписки на странице:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#\n\nВнимание! Вы не будете получать сообщения рассылки, пока не подтвердите\nсвою подписку.\n\n---------------------------------------------------------------------\nСохраните это письмо, так как оно содержит информацию для авторизации.\nИспользуя код подтверждения подписки, вы cможете изменить параметры\nподписки или отписаться от рассылки.\n\nИзменить параметры:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#\n\nОтписаться:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#&action=unsubscribe\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был подписан\nна список рассылки сервера <?=$arParams["SERVER_NAME"];?>.\n\nДополнительная информация о подписке:\n\nАдрес подписки (email) ............ <?=$arParams["EMAIL"];?>\n\nДата добавления/редактирования .... <?=$arParams["DATE_SUBSCR"];?>\n\n\nВаш код для подтверждения подписки: <?=$arParams["CONFIRM_CODE"];?>\n\n\nДля подтверждения подписки перейдите по следующей ссылке:\nhttp://<?=$arParams["SERVER_NAME"];?><?=$arParams["SUBSCR_SECTION"];?>subscr_edit.php?ID=<?=$arParams["ID"];?>&CONFIRM_CODE=<?=$arParams["CONFIRM_CODE"];?>\n\n\nВы также можете ввести код для подтверждения подписки на странице:\nhttp://<?=$arParams["SERVER_NAME"];?><?=$arParams["SUBSCR_SECTION"];?>subscr_edit.php?ID=<?=$arParams["ID"];?>\n\n\nВнимание! Вы не будете получать сообщения рассылки, пока не подтвердите\nсвою подписку.\n\n---------------------------------------------------------------------\nСохраните это письмо, так как оно содержит информацию для авторизации.\nИспользуя код подтверждения подписки, вы cможете изменить параметры\nподписки или отписаться от рассылки.\n\nИзменить параметры:\nhttp://<?=$arParams["SERVER_NAME"];?><?=$arParams["SUBSCR_SECTION"];?>subscr_edit.php?ID=<?=$arParams["ID"];?>&CONFIRM_CODE=<?=$arParams["CONFIRM_CODE"];?>\n\n\nОтписаться:\nhttp://<?=$arParams["SERVER_NAME"];?><?=$arParams["SUBSCR_SECTION"];?>subscr_edit.php?ID=<?=$arParams["ID"];?>&CONFIRM_CODE=<?=$arParams["CONFIRM_CODE"];?>&action=unsubscribe\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.\n', 'text', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(31, '2023-02-10 03:18:27', 'VOTE_FOR', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [V] #VOTE_TITLE#', '#USER_NAME# принял участие в опросе "#VOTE_TITLE#":\n#VOTE_STATISTIC#\n\nhttp://#SERVER_NAME##URL#\nСообщение сгенерировано автоматически.', '<?=$arParams["USER_NAME"];?> принял участие в опросе "<?=$arParams["VOTE_TITLE"];?>":\n<?=$arParams["VOTE_STATISTIC"];?>\n\n\nhttp://<?=$arParams["SERVER_NAME"];?><?=$arParams["URL"];?>\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Дамп структуры для таблица globus.b_event_message_attachment
CREATE TABLE IF NOT EXISTS `b_event_message_attachment` (
  `EVENT_MESSAGE_ID` int(11) NOT NULL,
  `FILE_ID` int(11) NOT NULL,
  PRIMARY KEY (`EVENT_MESSAGE_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_event_message_attachment: ~0 rows (приблизительно)
DELETE FROM `b_event_message_attachment`;

-- Дамп структуры для таблица globus.b_event_message_site
CREATE TABLE IF NOT EXISTS `b_event_message_site` (
  `EVENT_MESSAGE_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`EVENT_MESSAGE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_event_message_site: ~28 rows (приблизительно)
DELETE FROM `b_event_message_site`;
INSERT INTO `b_event_message_site` (`EVENT_MESSAGE_ID`, `SITE_ID`) VALUES
	(1, 's1'),
	(2, 's1'),
	(3, 's1'),
	(4, 's1'),
	(5, 's1'),
	(6, 's1'),
	(7, 's1'),
	(8, 's1'),
	(9, 's1'),
	(10, 's1'),
	(11, 's1'),
	(12, 's1'),
	(13, 's1'),
	(14, 's1'),
	(15, 's1'),
	(16, 's1'),
	(17, 's1'),
	(18, 's1'),
	(19, 's1'),
	(20, 's1'),
	(21, 's1'),
	(22, 's1'),
	(23, 's1'),
	(24, 's1'),
	(25, 's1'),
	(26, 's1'),
	(27, 's1'),
	(28, 's1'),
	(29, 's1'),
	(30, 's1'),
	(31, 's1');

-- Дамп структуры для таблица globus.b_event_type
CREATE TABLE IF NOT EXISTS `b_event_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT 150,
  `EVENT_TYPE` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'email',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_1` (`EVENT_NAME`,`LID`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_event_type: ~62 rows (приблизительно)
DELETE FROM `b_event_type`;
INSERT INTO `b_event_type` (`ID`, `LID`, `EVENT_NAME`, `NAME`, `DESCRIPTION`, `SORT`, `EVENT_TYPE`) VALUES
	(1, 'ru', 'NEW_USER', 'Зарегистрировался новый пользователь', '\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n', 1, 'email'),
	(2, 'ru', 'USER_INFO', 'Информация о пользователе', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 2, 'email'),
	(3, 'ru', 'NEW_USER_CONFIRM', 'Подтверждение регистрации нового пользователя', '\n\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n#CONFIRM_CODE# - Код подтверждения\n', 3, 'email'),
	(4, 'ru', 'USER_PASS_REQUEST', 'Запрос на смену пароля', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 4, 'email'),
	(5, 'ru', 'USER_PASS_CHANGED', 'Подтверждение смены пароля', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 5, 'email'),
	(6, 'ru', 'USER_INVITE', 'Приглашение на сайт нового пользователя', '#ID# - ID пользователя\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#PASSWORD# - пароль пользователя \n#CHECKWORD# - Контрольная строка для смены пароля\n#XML_ID# - ID пользователя для связи с внешними источниками\n', 6, 'email'),
	(7, 'ru', 'FEEDBACK_FORM', 'Отправка сообщения через форму обратной связи', '#AUTHOR# - Автор сообщения\n#AUTHOR_EMAIL# - Email автора сообщения\n#TEXT# - Текст сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 7, 'email'),
	(8, 'ru', 'MAIN_MAIL_CONFIRM_CODE', 'Подтверждение email-адреса отправителя', '\n\n#EMAIL_TO# - Email-адрес для подтверждения\n#MESSAGE_SUBJECT# - Тема сообщения\n#CONFIRM_CODE# - Код подтверждения', 8, 'email'),
	(9, 'ru', 'EVENT_LOG_NOTIFICATION', 'Оповещение журнала событий', '#EMAIL# - Email получателя\n#ADDITIONAL_TEXT# - Дополнительный текст действия\n#NAME# - Название оповещения\n#AUDIT_TYPE_ID# - Тип события\n#ITEM_ID# - Объект\n#USER_ID# - Пользователь\n#REMOTE_ADDR# - IP-адрес\n#USER_AGENT# - Браузер\n#REQUEST_URI# - Страница\n#EVENT_COUNT# - Количество записей', 9, 'email'),
	(10, 'ru', 'USER_CODE_REQUEST', 'Запрос кода авторизации', '#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#LOGIN# - Логин\n#CHECKWORD# - Код для авторизации\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - Email пользователя\n', 10, 'email'),
	(11, 'ru', 'SMS_USER_CONFIRM_NUMBER', 'Подтверждение номера телефона по СМС', '#USER_PHONE# - номер телефона\n#CODE# - код подтверждения\n', 100, 'sms'),
	(12, 'ru', 'SMS_USER_RESTORE_PASSWORD', 'Восстановление пароля через СМС', '#USER_PHONE# - номер телефона\n#CODE# - код для восстановления\n', 100, 'sms'),
	(13, 'ru', 'SMS_EVENT_LOG_NOTIFICATION', 'Оповещение журнала событий', '#PHONE_NUMBER# - Номер телефона получателя\n#ADDITIONAL_TEXT# - Дополнительный текст действия\n#NAME# - Название оповещения\n#AUDIT_TYPE_ID# - Тип события\n#ITEM_ID# - Объект\n#USER_ID# - Пользователь\n#REMOTE_ADDR# - IP-адрес\n#USER_AGENT# - Браузер\n#REQUEST_URI# - Страница\n#EVENT_COUNT# - Количество записей', 100, 'sms'),
	(14, 'en', 'NEW_USER', 'New user was registered', '\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#USER_IP# - User IP\n#USER_HOST# - User Host\n', 1, 'email'),
	(15, 'en', 'USER_INFO', 'Account Information', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 2, 'email'),
	(16, 'en', 'NEW_USER_CONFIRM', 'New user registration confirmation', '\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - E-mail\n#NAME# - First name\n#LAST_NAME# - Last name\n#USER_IP# - User IP\n#USER_HOST# - User host\n#CONFIRM_CODE# - Confirmation code\n', 3, 'email'),
	(17, 'en', 'USER_PASS_REQUEST', 'Password Change Request', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 4, 'email'),
	(18, 'en', 'USER_PASS_CHANGED', 'Password Change Confirmation', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 5, 'email'),
	(19, 'en', 'USER_INVITE', 'Invitation of a new site user', '#ID# - User ID\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#PASSWORD# - User password \n#CHECKWORD# - Password check string\n#XML_ID# - User ID to link with external data sources\n\n', 6, 'email'),
	(20, 'en', 'FEEDBACK_FORM', 'Sending a message using a feedback form', '#AUTHOR# - Message author\n#AUTHOR_EMAIL# - Author\'s e-mail address\n#TEXT# - Message text\n#EMAIL_FROM# - Sender\'s e-mail address\n#EMAIL_TO# - Recipient\'s e-mail address', 7, 'email'),
	(21, 'en', 'MAIN_MAIL_CONFIRM_CODE', 'Confirm sender\'s email address', '\n\n#EMAIL_TO# - confirmation email address\n#MESSAGE_SUBJECT# - Message subject\n#CONFIRM_CODE# - Confirmation code', 8, 'email'),
	(22, 'en', 'EVENT_LOG_NOTIFICATION', 'Event log notification', '#EMAIL# - Recipient email\n#ADDITIONAL_TEXT# - Action additional text\n#NAME# - Notification name\n#AUDIT_TYPE_ID# - Event type\n#ITEM_ID# - Object\n#USER_ID# - User\n#REMOTE_ADDR# - IP address\n#USER_AGENT# - Browser\n#REQUEST_URI# - Page URL\n#EVENT_COUNT# - Number of events', 9, 'email'),
	(23, 'en', 'USER_CODE_REQUEST', 'Request for verification code', '#USER_ID# - user ID\n#STATUS# - Login status\n#LOGIN# - Login\n#CHECKWORD# - Verification code\n#NAME# - First name\n#LAST_NAME# - Last name\n#EMAIL# - User email\n', 10, 'email'),
	(24, 'en', 'SMS_USER_CONFIRM_NUMBER', 'Verify phone number using SMS', '#USER_PHONE# - phone number\n#CODE# - confirmation code', 100, 'sms'),
	(25, 'en', 'SMS_USER_RESTORE_PASSWORD', 'Recover password using SMS', '#USER_PHONE# - phone number\n#CODE# - recovery confirmation code', 100, 'sms'),
	(26, 'en', 'SMS_EVENT_LOG_NOTIFICATION', 'Event log notification', '#PHONE_NUMBER# - Recipient phone number\n#ADDITIONAL_TEXT# - Action additional text\n#NAME# - Notification name\n#AUDIT_TYPE_ID# - Event type\n#ITEM_ID# - Object\n#USER_ID# - User\n#REMOTE_ADDR# - IP address\n#USER_AGENT# - Browser\n#REQUEST_URI# - Page URL\n#EVENT_COUNT# - Number of events', 100, 'sms'),
	(27, 'ru', 'NEW_BLOG_MESSAGE', 'Новое сообщение в блоге', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#MESSAGE_TEXT# - Текст сообщения\n#MESSAGE_DATE# - Дата сообщения\n#MESSAGE_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 100, 'email'),
	(28, 'ru', 'NEW_BLOG_COMMENT', 'Новый комментарий в блоге', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 100, 'email'),
	(29, 'ru', 'NEW_BLOG_COMMENT2COMMENT', 'Новый комментарий на ваш комментарий в блоге', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 100, 'email'),
	(30, 'ru', 'NEW_BLOG_COMMENT_WITHOUT_TITLE', 'Новый комментарий в блоге (без темы)', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 100, 'email'),
	(31, 'ru', 'NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE', 'Новый комментарий на ваш комментарий в блоге (без темы)', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 100, 'email'),
	(32, 'ru', 'BLOG_YOUR_BLOG_TO_USER', 'Ваш блог был добавлен в друзья', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', 100, 'email'),
	(33, 'ru', 'BLOG_YOU_TO_BLOG', 'Вы были добавлены в друзья блога', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', 100, 'email'),
	(34, 'ru', 'BLOG_BLOG_TO_YOU', 'К вам в друзья был добавлен блог', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', 100, 'email'),
	(35, 'ru', 'BLOG_USER_TO_YOUR_BLOG', 'В ваш блог был добавлен друг', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', 100, 'email'),
	(36, 'ru', 'BLOG_SONET_NEW_POST', 'Добавлено новое сообщение', '#EMAIL_TO# - Email получателя письма\n#POST_ID# - ID сообщения\n#RECIPIENT_ID# - ID получателя\n#URL_ID# - URL страницы сообщения\n', 100, 'email'),
	(37, 'ru', 'BLOG_SONET_NEW_COMMENT', 'Добавлен новый комментарий', '#EMAIL_TO# - Email получателя письма\n#COMMENT_ID# - ID комментария\n#POST_ID# - ID сообщения\n#RECIPIENT_ID# - ID получателя\n#URL_ID# - URL страницы сообщения\n', 100, 'email'),
	(38, 'ru', 'BLOG_SONET_POST_SHARE', 'Добавлен новый получатель сообщения', '#EMAIL_TO# - Email получателя письма\n#POST_ID# - ID сообщения\n#RECIPIENT_ID# - ID получателя\n#URL_ID# - URL страницы сообщения\n', 100, 'email'),
	(39, 'ru', 'BLOG_POST_BROADCAST', 'Добавлено новое сообщение', '\n#MESSAGE_TITLE# - Тема сообщения\n#MESSAGE_TEXT# - Текст сообщения\n#MESSAGE_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_TO# - Email получателя письма', 100, 'email'),
	(40, 'en', 'NEW_BLOG_MESSAGE', 'New blog message', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#MESSAGE_TEXT# - Message text\n#MESSAGE_DATE# - Message date\n#MESSAGE_PATH# - URL to message\n#AUTHOR# - Message author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 100, 'email'),
	(41, 'en', 'NEW_BLOG_COMMENT', 'New comment in blog', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TITLE# - Comment title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 100, 'email'),
	(42, 'en', 'NEW_BLOG_COMMENT2COMMENT', 'New comment for your in blog', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TITLE# - Comment title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 100, 'email'),
	(43, 'en', 'NEW_BLOG_COMMENT_WITHOUT_TITLE', 'New comment in blog (without subject)', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 100, 'email'),
	(44, 'en', 'NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE', 'New comment for your in blog (without subject)', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 100, 'email'),
	(45, 'en', 'BLOG_YOUR_BLOG_TO_USER', 'Your blog has been added to friends', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail', 100, 'email'),
	(46, 'en', 'BLOG_YOU_TO_BLOG', 'You have been added to blog friends', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail', 100, 'email'),
	(47, 'en', 'BLOG_BLOG_TO_YOU', 'A blog has been added to your friends', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail', 100, 'email'),
	(48, 'en', 'BLOG_USER_TO_YOUR_BLOG', 'A friend has been added to your blog', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail', 100, 'email'),
	(49, 'en', 'BLOG_SONET_NEW_POST', 'New post added', '#EMAIL_TO# - Recipient email\n#POST_ID# - Post ID\n#URL_ID# - Post URL', 100, 'email'),
	(50, 'en', 'BLOG_SONET_NEW_COMMENT', 'Comment added', '#EMAIL_TO# - Recipient email\n#COMMENT_ID# - Comment ID\n#POST_ID# - Post ID\n#URL_ID# - Post URL', 100, 'email'),
	(51, 'en', 'BLOG_SONET_POST_SHARE', 'New recipient added', '#EMAIL_TO# - Recipient email\n#POST_ID# - Post ID\n#URL_ID# - Post URL', 100, 'email'),
	(52, 'en', 'BLOG_POST_BROADCAST', 'New post added', '\n#MESSAGE_TITLE# - Post subject\n#MESSAGE_TEXT# - Post text \n#MESSAGE_PATH# - Post URL\n#AUTHOR# - Post author\n#EMAIL_TO# - E-mail recipient', 100, 'email'),
	(53, 'ru', 'NEW_FORUM_MESSAGE', 'Новое сообщение на форуме', '\n			#FORUM_ID# - ID форума\n			#FORUM_NAME# - Название форума\n			#TOPIC_ID# - ID темы\n			#MESSAGE_ID# - ID сообщения\n			#TOPIC_TITLE# - Тема сообщения\n			#MESSAGE_TEXT# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#AUTHOR# - Автор сообщения\n			#RECIPIENT# - Получатель сообщения\n			#TAPPROVED# - Тема сообщения показывается\n			#MAPPROVED# - Тело сообщения показывается\n			#PATH2FORUM# - Адрес сообщения\n			#FROM_EMAIL# - E-Mail для поля From письма', 100, 'email'),
	(54, 'ru', 'NEW_FORUM_PRIV', 'Приватное письмо посетителю форума', '\n			#FROM_NAME# - Автор сообщения\n			#FROM_EMAIL# - E-Mail автора сообщения\n			#TO_NAME# - Имя получателя сообщения\n			#TO_EMAIL# - E-Mail получателя сообщения\n			#SUBJECT# - Тема сообщения\n			#MESSAGE# - Тело сообщения\n			#MESSAGE_DATE# - Дата сообщения', 100, 'email'),
	(55, 'ru', 'NEW_FORUM_PRIVATE_MESSAGE', 'Приватное сообщение', '\n			#FROM_NAME# - Имя автора сообщения\n			#FROM_USER_ID# - ID автора сообщения\n			#FROM_EMAIL# - E-Mail автора сообщения\n			#TO_NAME# - Имя получателя сообщения\n			#TO_USER_ID# - ID получателя сообщения\n			#TO_EMAIL# - E-Mail получателя сообщения\n			#SUBJECT# - Тема сообщения\n			#MESSAGE# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#MESSAGE_LINK# - Ссылка на сообщение', 100, 'email'),
	(56, 'ru', 'EDIT_FORUM_MESSAGE', 'Изменение сообщения на форуме', '\n			#FORUM_ID# - ID форума\n			#FORUM_NAME# - Название форума\n			#TOPIC_ID# - ID темы\n			#MESSAGE_ID# - ID сообщения\n			#TOPIC_TITLE# - Тема сообщения\n			#MESSAGE_TEXT# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#AUTHOR# - Автор сообщения\n			#RECIPIENT# - Получатель сообщения\n			#TAPPROVED# - Тема сообщения показывается\n			#MAPPROVED# - Тело сообщения показывается\n			#PATH2FORUM# - Адрес сообщения\n			#FROM_EMAIL# - E-Mail для поля From письма', 100, 'email'),
	(57, 'en', 'NEW_FORUM_MESSAGE', 'New forum message', '\n			#FORUM_ID# - Forum ID\n			#FORUM_NAME# - Forum name\n			#TOPIC_ID# - Topic ID\n			#MESSAGE_ID# - Message ID\n			#TOPIC_TITLE# - Topic title\n			#MESSAGE_TEXT# - Message text\n			#MESSAGE_DATE# - Message date\n			#AUTHOR# - Message author\n			#RECIPIENT# - E-Mail recipient\n			#TAPPROVED# - Message topic is approved\n			#MAPPROVED# - Message is approved\n			#PATH2FORUM# - Message Url\n			#FROM_EMAIL# - E-Mail for From field of the EMail', 100, 'email'),
	(58, 'en', 'NEW_FORUM_PRIV', 'Private message for forum user', '\n			#FROM_NAME# - Name of the sender\n			#FROM_EMAIL# - E-Mail of the sender\n			#TO_NAME# - Name of recipient\n			#TO_EMAIL# - E-Mail of recipient\n			#SUBJECT# - Topic\n			#MESSAGE# - Message\n			#MESSAGE_DATE# - Date', 100, 'email'),
	(59, 'en', 'NEW_FORUM_PRIVATE_MESSAGE', 'Private message for forum user', '\n			#FROM_NAME# - Name of the sender\n			#FROM_USER_ID# - ID of the sender\n			#FROM_EMAIL# - E-Mail of the sender\n			#TO_NAME# - Name of recipient\n			#TO_USER_ID# - ID of recipient\n			#TO_EMAIL# - E-Mail of recipient\n			#SUBJECT# - Topic\n			#MESSAGE# - Message\n			#MESSAGE_DATE# - Date\n			#MESSAGE_LINK# - Link to message', 100, 'email'),
	(60, 'en', 'EDIT_FORUM_MESSAGE', 'Changing forum message', '\n			#FORUM_ID# - Forum ID\n			#FORUM_NAME# - Forum name\n			#TOPIC_ID# - Topic ID\n			#MESSAGE_ID# - Message ID\n			#TOPIC_TITLE# - Topic title\n			#MESSAGE_TEXT# - Message text\n			#MESSAGE_DATE# - Message date\n			#AUTHOR# - Message author\n			#RECIPIENT# - E-Mail recipient\n			#TAPPROVED# - Message topic is approved\n			#MAPPROVED# - Message is approved\n			#PATH2FORUM# - Message Url\n			#FROM_EMAIL# - E-Mail for From field of the EMail', 100, 'email'),
	(61, 'ru', 'FORUM_NEW_MESSAGE_MAIL', 'Новое сообщение на форуме в режиме общения по E-Mail', '#FORUM_NAME# - Название форума\n#AUTHOR# - Автор сообщения\n#FROM_EMAIL# - E-Mail для поля From письма\n#RECIPIENT# - Получатель сообщения\n#TOPIC_TITLE# - Тема сообщения\n#MESSAGE_TEXT# - Текст сообщения\n#PATH2FORUM# - Адрес сообщения\n#MESSAGE_DATE# - Дата сообщения\n#FORUM_EMAIL# - Е-Mail адрес для добавления сообщений на форум\n#FORUM_ID# - ID форума\n#TOPIC_ID# - ID темы \n#MESSAGE_ID# - ID сообщения\n#TAPPROVED# - Тема опубликована\n#MAPPROVED# - Сообщение опубликовано\n', 100, 'email'),
	(62, 'en', 'FORUM_NEW_MESSAGE_MAIL', 'New message at the forum (e-mail messaging mode)', '#FORUM_NAME# - Forum name\n#AUTHOR# - Message author\n#FROM_EMAIL# - E-Mail in the &amp;From&amp; field\n#RECIPIENT# - Message recipient\n#TOPIC_TITLE# - Message subject\n#MESSAGE_TEXT# - Message text\n#PATH2FORUM# - Message URL\n#MESSAGE_DATE# - Message date\n#FORUM_EMAIL# - E-Mail to add messages to the forum \n#FORUM_ID# - Forum ID\n#TOPIC_ID# - Topic ID \n#MESSAGE_ID# - Message ID\n#TAPPROVED# - Topic approved and published\n#MAPPROVED# - Message approved and published\n', 100, 'email'),
	(63, 'ru', 'VIRUS_DETECTED', 'Обнаружен вирус', '#EMAIL# - E-Mail администратора сайта (из настроек главного модуля)', 100, 'email'),
	(64, 'en', 'VIRUS_DETECTED', 'Virus detected', '#EMAIL# - Site administrator\'s e-mail address (from the Kernel module settings)', 100, 'email'),
	(65, 'ru', 'SUBSCRIBE_CONFIRM', 'Подтверждение подписки', '#ID# - идентификатор подписки\n#EMAIL# - адрес подписки\n#CONFIRM_CODE# - код подтверждения\n#SUBSCR_SECTION# - раздел, где находится страница редактирования подписки (задается в настройках)\n#USER_NAME# - имя подписчика (может отсутствовать)\n#DATE_SUBSCR# - дата добавления/изменения адреса\n', 100, 'email'),
	(66, 'en', 'SUBSCRIBE_CONFIRM', 'Confirmation of subscription', '#ID# - subscription ID\n#EMAIL# - subscription email\n#CONFIRM_CODE# - confirmation code\n#SUBSCR_SECTION# - section with subscription edit page (specifies in the settings)\n#USER_NAME# - subscriber\'s name (optional)\n#DATE_SUBSCR# - date of adding/change of address\n', 100, 'email'),
	(67, 'ru', 'VOTE_FOR', 'Новый голос', '#ID# - ID результата голосования\n#TIME# - время голосования\n#VOTE_TITLE# - наименование опроса\n#VOTE_DESCRIPTION# - описание опроса\n#VOTE_ID# - ID опроса\n#CHANNEL# - наименование группы опроса\n#CHANNEL_ID# - ID группы опроса\n#VOTER_ID# - ID проголосовавшего посетителя\n#USER_NAME# - ФИО пользователя\n#LOGIN# - логин\n#USER_ID# - ID пользователя\n#STAT_GUEST_ID# - ID посетителя модуля статистики\n#SESSION_ID# - ID сессии модуля статистики\n#IP# - IP адрес\n#VOTE_STATISTIC# - Сводная статистика опроса типа ( - Вопрос - Ответ )\n#URL# - Путь к опросу\n', 100, 'email'),
	(68, 'en', 'VOTE_FOR', 'New vote', '#ID# - Vote result ID\n#TIME# - Time of vote\n#VOTE_TITLE# - Poll name\n#VOTE_DESCRIPTION# - Poll description\n#VOTE_ID# - Poll ID\n#CHANNEL# - Poll group name\n#CHANNEL_ID# - Poll group ID\n#VOTER_ID# - Voter\'s user ID\n#USER_NAME# - User full name\n#LOGIN# - login\n#USER_ID# - User ID\n#STAT_GUEST_ID# - Visitor ID in web analytics module\n#SESSION_ID# - Session ID in web analytics module\n#IP# - IP address\n#VOTE_STATISTIC# - Summary statistics of this poll type ( - Question - Answer)\n#URL# - Poll URL', 100, 'email');

-- Дамп структуры для таблица globus.b_favorite
CREATE TABLE IF NOT EXISTS `b_favorite` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `C_SORT` int(11) NOT NULL DEFAULT 100,
  `MODIFIED_BY` int(11) DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENTS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `CODE_ID` int(11) DEFAULT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `MENU_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_favorite: ~0 rows (приблизительно)
DELETE FROM `b_favorite`;

-- Дамп структуры для таблица globus.b_file
CREATE TABLE IF NOT EXISTS `b_file` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HEIGHT` int(11) DEFAULT NULL,
  `WIDTH` int(11) DEFAULT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `CONTENT_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'IMAGE',
  `SUBDIR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ORIGINAL_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HANDLER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FILE_EXTERNAL_ID` (`EXTERNAL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_file: ~11 rows (приблизительно)
DELETE FROM `b_file`;
INSERT INTO `b_file` (`ID`, `TIMESTAMP_X`, `MODULE_ID`, `HEIGHT`, `WIDTH`, `FILE_SIZE`, `CONTENT_TYPE`, `SUBDIR`, `FILE_NAME`, `ORIGINAL_NAME`, `DESCRIPTION`, `HANDLER_ID`, `EXTERNAL_ID`) VALUES
	(1, '2023-02-10 09:50:49', 'iblock', 480, 780, 88853, 'image/jpeg', 'iblock/1ec', '2gkb3fmobueeuc85chgu7ls0tnjb8xp8.jpg', 'dog-groomed.jpg', '', NULL, '471adcb0407d1de95303787b15fb8794'),
	(2, '2023-02-10 09:50:49', 'iblock', 258, 466, 108907, 'image/jpeg', 'iblock/36e', 'szbedd40o180cnlo32juysf64yw4dpsr.jpg', 'dogcat.jpg', '', NULL, '7c70e452fbeb8674c4347b0c6c1ea112'),
	(3, '2023-02-10 10:53:03', 'iblock', 480, 780, 88853, 'image/jpeg', 'iblock/1ec', '2gkb3fmobueeuc85chgu7ls0tnjb8xp8.jpg', 'dog-groomed.jpg', '', NULL, '5707459c5cbb11cafc79a269f8a12fbc'),
	(4, '2023-02-11 11:55:03', 'iblock', 270, 407, 243730, 'image/png', 'iblock/f13', '5j78hiktaycwkvnzp133w5d95ilpd5oo.png', 'image-22-11-22-12-27-10.png', '', NULL, '4bebed75c8e9610cb81b45a3da276297'),
	(5, '2023-02-11 12:00:53', 'iblock', 480, 780, 88853, 'image/jpeg', 'iblock/1ec', '2gkb3fmobueeuc85chgu7ls0tnjb8xp8.jpg', 'dog-groomed.jpg', '', NULL, '70fc228261d4e7fda2b0e1763dc38e59'),
	(6, '2023-02-11 12:11:09', 'iblock', 383, 574, 422411, 'image/png', 'iblock/799', 'fbvtslegbw2n8tieovbw4akvsg5zggx3.png', '1.png', '', NULL, 'a4a69355ea2e7c5a27c60991a708b51c'),
	(7, '2023-02-11 12:11:16', 'iblock', 383, 576, 351859, 'image/png', 'iblock/6b9', '8e0g9fqr4kj7pp1ceh1jht2b5yv9omvk.png', '2.png', '', NULL, '1a6f95aaf86cf23af2d267ffbab61b72'),
	(8, '2023-02-11 12:11:22', 'iblock', 383, 574, 390995, 'image/png', 'iblock/bd3', 'u4qfclth9xvi1zb0zejaabct61pb1ae7.png', '3.png', '', NULL, 'c8e2fd5df4985fc638488e18f7d89d7e'),
	(9, '2023-02-11 12:11:28', 'iblock', 383, 576, 380419, 'image/png', 'iblock/594', '8zslrgkyt4eoenhtvm69q6hkx2mnhj90.png', '4.png', '', NULL, '1d98136bbefc312eae47ccb03b72dc0e'),
	(10, '2023-02-11 13:58:06', 'iblock', 406, 291, 122738, 'image/png', 'iblock/538', '0cz8yyan9n1dhxk7ycsk9r4uutmeuznp.png', '1.png', '', NULL, 'e7699060b03cdc79e43f6347f5cccd71'),
	(11, '2023-02-11 13:46:15', 'iblock', 0, 0, 1077817, 'application/pdf', 'iblock/3c9', 'tlmp6clixb8616hv5zhbwct1ei5y438c.pdf', 'efd80651b0b59c773b9119df748cbe26f61c9568-1.pdf', '', NULL, 'c932a49b55951483d14c1880111b6846');

-- Дамп структуры для таблица globus.b_file_duplicate
CREATE TABLE IF NOT EXISTS `b_file_duplicate` (
  `DUPLICATE_ID` int(11) NOT NULL,
  `ORIGINAL_ID` int(11) NOT NULL,
  `COUNTER` int(11) NOT NULL DEFAULT 1,
  `ORIGINAL_DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`DUPLICATE_ID`,`ORIGINAL_ID`),
  KEY `ix_file_duplicate_duplicate` (`ORIGINAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_file_duplicate: ~1 rows (приблизительно)
DELETE FROM `b_file_duplicate`;
INSERT INTO `b_file_duplicate` (`DUPLICATE_ID`, `ORIGINAL_ID`, `COUNTER`, `ORIGINAL_DELETED`) VALUES
	(3, 1, 1, 'N'),
	(5, 1, 1, 'N');

-- Дамп структуры для таблица globus.b_file_hash
CREATE TABLE IF NOT EXISTS `b_file_hash` (
  `FILE_ID` int(11) NOT NULL,
  `FILE_SIZE` bigint(20) NOT NULL,
  `FILE_HASH` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`FILE_ID`),
  KEY `ix_file_hash_size_hash` (`FILE_SIZE`,`FILE_HASH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_file_hash: ~9 rows (приблизительно)
DELETE FROM `b_file_hash`;
INSERT INTO `b_file_hash` (`FILE_ID`, `FILE_SIZE`, `FILE_HASH`) VALUES
	(1, 88853, 'ff27743973b60b11f064f5a616390c37'),
	(2, 108907, '8906067a5873a5c5126681311b1f7077'),
	(10, 122738, '663e2c3248096ee46aa23f1d2e877762'),
	(4, 243730, '428b015016505f4ef4f36a71c2dff070'),
	(7, 351859, 'd5853ca0052dba387915324baab1a10b'),
	(9, 380419, '6875f68507b4af7c170f0095b9b44b90'),
	(8, 390995, 'b6e2577296b717b8f763947289a7d976'),
	(6, 422411, '489bde03a69c1fbdf466efd2ecadc8b9'),
	(11, 1077817, '889c4e8b975fb3d9e1d44a0bda11ee97');

-- Дамп структуры для таблица globus.b_file_preview
CREATE TABLE IF NOT EXISTS `b_file_preview` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FILE_ID` int(11) NOT NULL,
  `PREVIEW_ID` int(11) DEFAULT NULL,
  `PREVIEW_IMAGE_ID` int(11) DEFAULT NULL,
  `CREATED_AT` datetime NOT NULL,
  `TOUCHED_AT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FILE_PL_TOUCH` (`TOUCHED_AT`),
  KEY `IX_B_FILE_PL_FILE` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_file_preview: ~0 rows (приблизительно)
DELETE FROM `b_file_preview`;

-- Дамп структуры для таблица globus.b_file_search
CREATE TABLE IF NOT EXISTS `b_file_search` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SESS_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `F_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `B_DIR` int(11) NOT NULL DEFAULT 0,
  `F_SIZE` int(11) NOT NULL DEFAULT 0,
  `F_TIME` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_file_search: ~0 rows (приблизительно)
DELETE FROM `b_file_search`;

-- Дамп структуры для таблица globus.b_filters
CREATE TABLE IF NOT EXISTS `b_filters` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `FILTER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FIELDS` text COLLATE utf8_unicode_ci NOT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRESET` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRESET_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `SORT_FIELD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_filters: ~0 rows (приблизительно)
DELETE FROM `b_filters`;

-- Дамп структуры для таблица globus.b_finder_dest
CREATE TABLE IF NOT EXISTS `b_finder_dest` (
  `USER_ID` int(11) NOT NULL,
  `CODE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_USER_ID` int(11) DEFAULT NULL,
  `CODE_TYPE` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTEXT` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_USE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`CODE`,`CONTEXT`),
  KEY `IX_FINDER_DEST` (`CODE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_finder_dest: ~0 rows (приблизительно)
DELETE FROM `b_finder_dest`;

-- Дамп структуры для таблица globus.b_form
CREATE TABLE IF NOT EXISTS `b_form` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `BUTTON` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `C_SORT` int(18) DEFAULT 100,
  `FIRST_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE_ID` int(18) DEFAULT NULL,
  `USE_CAPTCHA` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `FORM_TEMPLATE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `USE_DEFAULT_TEMPLATE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SHOW_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MAIL_EVENT_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SHOW_RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRINT_RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_RESULT_TEMPLATE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_RESULT_TEMPLATE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `USE_RESTRICTIONS` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `RESTRICT_USER` int(5) DEFAULT 0,
  `RESTRICT_TIME` int(10) DEFAULT 0,
  `RESTRICT_STATUS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_EVENT1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_EVENT2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_EVENT3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_SID` (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_form: ~0 rows (приблизительно)
DELETE FROM `b_form`;

-- Дамп структуры для таблица globus.b_form_2_group
CREATE TABLE IF NOT EXISTS `b_form_2_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `GROUP_ID` int(18) NOT NULL DEFAULT 0,
  `PERMISSION` int(5) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_form_2_group: ~0 rows (приблизительно)
DELETE FROM `b_form_2_group`;

-- Дамп структуры для таблица globus.b_form_2_mail_template
CREATE TABLE IF NOT EXISTS `b_form_2_mail_template` (
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `MAIL_TEMPLATE_ID` int(18) NOT NULL DEFAULT 0,
  PRIMARY KEY (`FORM_ID`,`MAIL_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_form_2_mail_template: ~0 rows (приблизительно)
DELETE FROM `b_form_2_mail_template`;

-- Дамп структуры для таблица globus.b_form_2_site
CREATE TABLE IF NOT EXISTS `b_form_2_site` (
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`FORM_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_form_2_site: ~0 rows (приблизительно)
DELETE FROM `b_form_2_site`;

-- Дамп структуры для таблица globus.b_form_answer
CREATE TABLE IF NOT EXISTS `b_form_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FIELD_ID` int(18) NOT NULL DEFAULT 0,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `C_SORT` int(18) NOT NULL DEFAULT 100,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD_TYPE` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `FIELD_WIDTH` int(18) DEFAULT NULL,
  `FIELD_HEIGHT` int(18) DEFAULT NULL,
  `FIELD_PARAM` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_form_answer: ~0 rows (приблизительно)
DELETE FROM `b_form_answer`;

-- Дамп структуры для таблица globus.b_form_crm
CREATE TABLE IF NOT EXISTS `b_form_crm` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `AUTH_HASH` varchar(32) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_form_crm: ~0 rows (приблизительно)
DELETE FROM `b_form_crm`;

-- Дамп структуры для таблица globus.b_form_crm_field
CREATE TABLE IF NOT EXISTS `b_form_crm_field` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `LINK_ID` int(18) NOT NULL DEFAULT 0,
  `FIELD_ID` int(18) DEFAULT 0,
  `FIELD_ALT` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `CRM_FIELD` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `ix_b_form_crm_field_1` (`LINK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_form_crm_field: ~0 rows (приблизительно)
DELETE FROM `b_form_crm_field`;

-- Дамп структуры для таблица globus.b_form_crm_link
CREATE TABLE IF NOT EXISTS `b_form_crm_link` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `CRM_ID` int(18) NOT NULL DEFAULT 0,
  `LINK_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_form_crm_link_1` (`FORM_ID`,`CRM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_form_crm_link: ~0 rows (приблизительно)
DELETE FROM `b_form_crm_link`;

-- Дамп структуры для таблица globus.b_form_field
CREATE TABLE IF NOT EXISTS `b_form_field` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TITLE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `C_SORT` int(18) NOT NULL DEFAULT 100,
  `ADDITIONAL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `REQUIRED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IN_FILTER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IN_RESULTS_TABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IN_EXCEL_TABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `FIELD_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE_ID` int(18) DEFAULT NULL,
  `COMMENTS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_TITLE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESULTS_TABLE_TITLE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`),
  KEY `IX_SID` (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_form_field: ~0 rows (приблизительно)
DELETE FROM `b_form_field`;

-- Дамп структуры для таблица globus.b_form_field_filter
CREATE TABLE IF NOT EXISTS `b_form_field_filter` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FIELD_ID` int(18) NOT NULL DEFAULT 0,
  `PARAMETER_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_form_field_filter: ~0 rows (приблизительно)
DELETE FROM `b_form_field_filter`;

-- Дамп структуры для таблица globus.b_form_field_validator
CREATE TABLE IF NOT EXISTS `b_form_field_validator` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `FIELD_ID` int(18) NOT NULL DEFAULT 0,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'y',
  `C_SORT` int(18) DEFAULT 100,
  `VALIDATOR_SID` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `PARAMS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_form_field_validator: ~0 rows (приблизительно)
DELETE FROM `b_form_field_validator`;

-- Дамп структуры для таблица globus.b_form_menu
CREATE TABLE IF NOT EXISTS `b_form_menu` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MENU` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_form_menu: ~0 rows (приблизительно)
DELETE FROM `b_form_menu`;

-- Дамп структуры для таблица globus.b_form_result
CREATE TABLE IF NOT EXISTS `b_form_result` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `STATUS_ID` int(18) NOT NULL DEFAULT 0,
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `USER_ID` int(18) DEFAULT NULL,
  `USER_AUTH` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `STAT_GUEST_ID` int(18) DEFAULT NULL,
  `STAT_SESSION_ID` int(18) DEFAULT NULL,
  `SENT_TO_CRM` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`),
  KEY `IX_STATUS_ID` (`STATUS_ID`),
  KEY `IX_SENT_TO_CRM` (`SENT_TO_CRM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_form_result: ~0 rows (приблизительно)
DELETE FROM `b_form_result`;

-- Дамп структуры для таблица globus.b_form_result_answer
CREATE TABLE IF NOT EXISTS `b_form_result_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `RESULT_ID` int(18) NOT NULL DEFAULT 0,
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `FIELD_ID` int(18) NOT NULL DEFAULT 0,
  `ANSWER_ID` int(18) DEFAULT NULL,
  `ANSWER_TEXT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ANSWER_TEXT_SEARCH` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `ANSWER_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ANSWER_VALUE_SEARCH` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TEXT` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TEXT_SEARCH` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_DATE` datetime DEFAULT NULL,
  `USER_FILE_ID` int(18) DEFAULT NULL,
  `USER_FILE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_IS_IMAGE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_HASH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_SUFFIX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_SIZE` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RESULT_ID` (`RESULT_ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`),
  KEY `IX_ANSWER_ID` (`ANSWER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_form_result_answer: ~0 rows (приблизительно)
DELETE FROM `b_form_result_answer`;

-- Дамп структуры для таблица globus.b_form_status
CREATE TABLE IF NOT EXISTS `b_form_status` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `C_SORT` int(18) NOT NULL DEFAULT 100,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CSS` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'statusgreen',
  `HANDLER_OUT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HANDLER_IN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MAIL_EVENT_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_form_status: ~0 rows (приблизительно)
DELETE FROM `b_form_status`;

-- Дамп структуры для таблица globus.b_form_status_2_group
CREATE TABLE IF NOT EXISTS `b_form_status_2_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `STATUS_ID` int(18) NOT NULL DEFAULT 0,
  `GROUP_ID` int(18) NOT NULL DEFAULT 0,
  `PERMISSION` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_STATUS_GROUP` (`STATUS_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_form_status_2_group: ~0 rows (приблизительно)
DELETE FROM `b_form_status_2_group`;

-- Дамп структуры для таблица globus.b_form_status_2_mail_template
CREATE TABLE IF NOT EXISTS `b_form_status_2_mail_template` (
  `STATUS_ID` int(18) NOT NULL DEFAULT 0,
  `MAIL_TEMPLATE_ID` int(18) NOT NULL DEFAULT 0,
  PRIMARY KEY (`STATUS_ID`,`MAIL_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_form_status_2_mail_template: ~0 rows (приблизительно)
DELETE FROM `b_form_status_2_mail_template`;

-- Дамп структуры для таблица globus.b_forum
CREATE TABLE IF NOT EXISTS `b_forum` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `FORUM_GROUP_ID` int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(10) NOT NULL DEFAULT 150,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_HTML` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_ANCHOR` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_BIU` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_IMG` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_VIDEO` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_QUOTE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_CODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_FONT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_SMILES` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_UPLOAD` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_TABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_ALIGN` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_UPLOAD_EXT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ALLOW_MOVE_TOPIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_TOPIC_TITLED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_NL2BR` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_SIGNATURE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `PATH2FORUM_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ASK_GUEST_EMAIL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `USE_CAPTCHA` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `INDEXATION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DEDUPLICATION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `MODERATION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ORDER_BY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `ORDER_DIRECTION` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DESC',
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ru',
  `TOPICS` int(11) NOT NULL DEFAULT 0,
  `POSTS` int(11) NOT NULL DEFAULT 0,
  `LAST_POSTER_ID` int(11) DEFAULT NULL,
  `LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_POST_DATE` datetime DEFAULT NULL,
  `LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `POSTS_UNAPPROVED` int(11) DEFAULT 0,
  `ABS_LAST_POSTER_ID` int(11) DEFAULT NULL,
  `ABS_LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ABS_LAST_POST_DATE` datetime DEFAULT NULL,
  `ABS_LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `EVENT1` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'forum',
  `EVENT2` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'message',
  `EVENT3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HTML` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_SORT` (`SORT`),
  KEY `IX_FORUM_ACTIVE` (`ACTIVE`),
  KEY `IX_FORUM_GROUP_ID` (`FORUM_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_forum: ~0 rows (приблизительно)
DELETE FROM `b_forum`;

-- Дамп структуры для таблица globus.b_forum2site
CREATE TABLE IF NOT EXISTS `b_forum2site` (
  `FORUM_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `PATH2FORUM_MESSAGE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`FORUM_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_forum2site: ~0 rows (приблизительно)
DELETE FROM `b_forum2site`;

-- Дамп структуры для таблица globus.b_forum_dictionary
CREATE TABLE IF NOT EXISTS `b_forum_dictionary` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_forum_dictionary: ~4 rows (приблизительно)
DELETE FROM `b_forum_dictionary`;
INSERT INTO `b_forum_dictionary` (`ID`, `TITLE`, `TYPE`) VALUES
	(1, '[ru] Словарь слов', 'W'),
	(2, '[ru] Словарь транслита', 'T'),
	(3, '[en] Bad words', 'W'),
	(4, '[en] Transliteration', 'T');

-- Дамп структуры для таблица globus.b_forum_email
CREATE TABLE IF NOT EXISTS `b_forum_email` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EMAIL_FORUM_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `FORUM_ID` int(11) NOT NULL,
  `SOCNET_GROUP_ID` int(11) DEFAULT NULL,
  `MAIL_FILTER_ID` int(11) NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USE_EMAIL` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL_GROUP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUBJECT_SUF` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USE_SUBJECT` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TEMPLATES_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NOT_MEMBER_POST` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_EMAIL_FORUM_SOC` (`FORUM_ID`,`SOCNET_GROUP_ID`),
  KEY `IX_B_FORUM_EMAIL_FILTER_ID` (`MAIL_FILTER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_forum_email: ~0 rows (приблизительно)
DELETE FROM `b_forum_email`;

-- Дамп структуры для таблица globus.b_forum_file
CREATE TABLE IF NOT EXISTS `b_forum_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(18) DEFAULT NULL,
  `TOPIC_ID` int(20) DEFAULT NULL,
  `MESSAGE_ID` int(20) DEFAULT NULL,
  `FILE_ID` int(18) NOT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `HITS` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_FILE_FILE` (`FILE_ID`),
  KEY `IX_FORUM_FILE_FORUM` (`FORUM_ID`),
  KEY `IX_FORUM_FILE_TOPIC` (`TOPIC_ID`),
  KEY `IX_FORUM_FILE_MESSAGE` (`MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_forum_file: ~0 rows (приблизительно)
DELETE FROM `b_forum_file`;

-- Дамп структуры для таблица globus.b_forum_filter
CREATE TABLE IF NOT EXISTS `b_forum_filter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DICTIONARY_ID` int(11) DEFAULT NULL,
  `WORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATTERN` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `REPLACEMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `USE_IT` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATTERN_CREATE` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_FILTER_2` (`USE_IT`),
  KEY `IX_B_FORUM_FILTER_3` (`PATTERN_CREATE`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_forum_filter: ~151 rows (приблизительно)
DELETE FROM `b_forum_filter`;
INSERT INTO `b_forum_filter` (`ID`, `DICTIONARY_ID`, `WORDS`, `PATTERN`, `REPLACEMENT`, `DESCRIPTION`, `USE_IT`, `PATTERN_CREATE`) VALUES
	(1, 1, '*пизд*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(2, 1, '*пизж*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ЖжGg]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(3, 1, '*сра%', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([СсCc]+)([РрPpRr]+)([АаAa]+)([[Цц]+([Аа]+|[Оо]+)]+|[[Тт]+([Ьь]+|)[Сс]+[Яя]+]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(4, 1, 'анобляд*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([АаAa]+)([НнNn]+)([ОоOo]+)([БбBb]+)([ЛлLl]+)([Яя]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(5, 1, 'взъеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвVv]+)([ЗзZz3]+)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(6, 1, 'бля', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([БбBb]+)([ЛлLl]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(7, 1, 'долбоеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ДдDd]+)([ОоOo]+)([ЛлLl]+)([БбBb]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(8, 1, 'дуроеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ДдDd]+)([УуUu]+)([РрPpRr]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(9, 1, 'еби', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(10, 1, 'ебисти*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([СсCc]+)([ТтTt]+)([ИиIi]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(11, 1, 'ебическ*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([Чч]+)([ЁёЕеEe]+)([СсCc]+)([КкKk]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(12, 1, 'еблив*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([ИиIi]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(13, 1, 'ебло*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([ОоOo]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(14, 1, 'еблыс*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([Ыы]+)([СсCc]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(15, 1, 'ебля', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(16, 1, 'ебс', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([СсCc]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(17, 1, 'ебукент*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([КкKk]+)([ЁёЕеEe]+)([НнNn]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(18, 1, 'ебурген*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([РрPpRr]+)([Гг]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(19, 1, 'коноебит*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([КкKk]+)([ОоOo]+)([НнNn]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(20, 1, 'мозгоеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([МмMm]+)([ОоOo]+)([ЗзZz3]+)([Гг]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(21, 1, 'мудоеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([МмMm]+)([УуUu]+)([ДдDd]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(22, 1, 'однохуйствен*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ДдDd]+)([НнNn]+)([ОоOo]+)([ХхXx]+)([УуUu]+)([ЙйИиYy]+)([СсCc]+)([ТтTt]+)([ВвVv]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(23, 1, 'охуе*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(24, 1, 'охуи*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([ИиIi]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(25, 1, 'охуя*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([Яя]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(26, 1, 'разъеба*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([ЗзZz3]+)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(27, 1, 'распиздон*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([СсCc]+)([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ДдDd]+)([ОоOo]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(28, 1, 'расхуюж*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([СсCc]+)([ХхXx]+)([УуUu]+)([Юю]+|[[Йй]+[Оо]+]+)([ЖжGg]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(29, 1, 'худоебин*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ДдDd]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(30, 1, 'хуе', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(31, 1, 'хуебрат*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([БбBb]+)([РрPpRr]+)([АаAa]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(32, 1, 'хуеглот*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([Гг]+)([ЛлLl]+)([ОоOo]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(33, 1, 'хуеплёт*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ПпPp]+)([ЛлLl]+)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(34, 1, 'хует*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(35, 1, 'хуила', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ИиIi]+)([ЛлLl]+)([АаAa]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(36, 1, 'хул?', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЛлLl]+).?)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(37, 1, 'хуя', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(38, 1, '^бляд*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([БбBb]+)([ЛлLl]+)([Яя]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(39, 1, '^пидор*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ПпPp]+)([ИиIi]+)([ДдDd]+)([ОоOo]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(40, 1, '^хуев*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(41, 1, '^хуем*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([МмMm]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(42, 1, '^хуй*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЙйИиYy]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(43, 1, '^хуяк*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([КкKk]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(44, 1, '^хуям*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([МмMm]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(45, 1, '^хуяр*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(46, 1, '^хуяч*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([Чч]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(47, 1, '^ъебал*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([ЛлLl]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(48, 1, '^ъебан*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(49, 1, '^ъебар*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(50, 1, '^ъебат*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(51, 1, '^ъебен*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(52, 1, '^ъеби', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(53, 1, '^ъебис*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([СсCc]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(54, 1, '^ъебит*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(55, 1, '^ъёбля*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([БбBb]+)([ЛлLl]+)([Яя]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(56, 1, '^ъёбну*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([БбBb]+)([НнNn]+)([УуUu]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(57, 1, '^ъебу', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([УуUu]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(58, 1, '^ъебуч*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([Чч]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(59, 1, '^ъебыв*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([Ыы]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(60, 1, '/(?<=[s.,;:!?-#*|[]()])(?![Вв][ЕеЁё][Бб])(([ВвЗзСс]+|[Ввы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)|)([ЬьЪъ]+|)([ЁёЕеEe]+|[Йй]+[Оо]+|[Yy]+[Oo]+)([BbБб]+))(?=[s.,;:!?-#*|[]()])/is', '', '', '', 'Y', 'PTTRN'),
	(61, 3, 'angry', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+n+g+r+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(62, 3, 'ass', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(63, 3, 'asshole', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+s+s+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(64, 3, 'banger', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+n+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(65, 3, 'bastard', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+s+t+a+r+d+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(66, 3, 'batter', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+t+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(67, 3, 'bicho', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+c+h+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(68, 3, 'bisexual', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+s+e+x+u+a+l+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(69, 3, 'bitch', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+t+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(70, 3, 'blumpkin', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+l+u+m+p+k+i+n+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(71, 3, 'booger', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+o+o+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(72, 3, 'bugger*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+g+g+e+r+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(73, 3, 'bukakke', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+k+a+k+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(74, 3, 'bull', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(75, 3, 'bulldyke', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+d+y+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(76, 3, 'bullshit', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+s+h+i+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(77, 3, 'bunny', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+n+n+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(78, 3, 'bunnyfuck', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+n+n+y+f+u+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(79, 3, 'chocha', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+h+o+c+h+a+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(80, 3, 'chode', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+h+o+d+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(81, 3, 'clap', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+l+a+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(82, 3, 'coconuts', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+c+o+n+u+t+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(83, 3, 'cohones', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+h+o+n+e+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(84, 3, 'cojones', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+j+o+n+e+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(85, 3, 'coon', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+n+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(86, 3, 'cootch', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+t+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(87, 3, 'cooter', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(88, 3, 'cornhole', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+r+n+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(89, 3, 'cracka', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+r+a+c+k+a+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(90, 3, 'crap', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+r+a+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(91, 3, 'cum', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+m+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(92, 3, 'cunnilingus', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+n+n+i+l+i+n+g+u+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(93, 3, 'cunt*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+n+t+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(94, 3, 'damn*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+a+m+n+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(95, 3, 'dark*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+a+r+k+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(96, 3, 'dick', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(97, 3, 'dickhead', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+c+k+h+e+a+d+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(98, 3, 'diddle', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+d+d+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(99, 3, 'dildo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+l+d+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(100, 3, 'dilhole', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+l+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(101, 3, 'dingleberry', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+n+g+l+e+b+e+r+r+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(102, 3, 'doodle', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+o+o+d+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(103, 3, 'dork', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+o+r+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(104, 3, 'dumpster', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+u+m+p+s+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(105, 3, 'faggot', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+a+g+g+o+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(106, 3, 'fart', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+a+r+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(107, 3, 'frig', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+r+i+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(108, 3, 'fuck*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+u+c+k+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(109, 3, 'fucker', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+u+c+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(110, 3, 'giz', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+i+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(111, 3, 'goatse', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+o+a+t+s+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(112, 3, 'gook', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+o+o+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(113, 3, 'gringo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+r+i+n+g+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(114, 3, 'hobo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(h+o+b+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(115, 3, 'honky', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(h+o+n+k+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(116, 3, 'jackass', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+a+c+k+a+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(117, 3, 'jackoff', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+a+c+k+o+f+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(118, 3, 'jerkoff', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+e+r+k+o+f+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(119, 3, 'jiggaboo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+i+g+g+a+b+o+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(120, 3, 'jizz', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+i+z+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(121, 3, 'kike', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(k+i+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(122, 3, 'mayo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(m+a+y+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(123, 3, 'moose', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(m+o+o+s+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(124, 3, 'nigg*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(n+i+g+g+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(125, 3, 'paki', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+a+k+i+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(126, 3, 'pecker', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+e+c+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(127, 3, 'piss', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+i+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(128, 3, 'poonanni', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+o+o+n+a+n+n+i+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(129, 3, 'poontang', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+o+o+n+t+a+n+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(130, 3, 'prick', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+r+i+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(131, 3, 'punch', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+u+n+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(132, 3, 'queef', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(q+u+e+e+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(133, 3, 'rogue', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(r+o+g+u+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(134, 3, 'sanchez', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+a+n+c+h+e+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(135, 3, 'schlong', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+c+h+l+o+n+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(136, 3, 'shit', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+h+i+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(137, 3, 'skank', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+k+a+n+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(138, 3, 'spaz', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+p+a+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(139, 3, 'spic', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+p+i+c+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(140, 3, 'teabag*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+e+a+b+a+g+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(141, 3, 'tits', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+i+t+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(142, 3, 'twat', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+w+a+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(143, 3, 'twot', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+w+o+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(144, 3, 'vart', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(v+a+r+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(145, 3, 'wanker', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+a+n+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(146, 3, 'waste', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+a+s+t+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(147, 3, 'wetback', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+e+t+b+a+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(148, 3, 'whore', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+h+o+r+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(149, 3, 'wigger', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+i+g+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(150, 3, 'wog', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+o+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(151, 3, 'wop', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+o+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL');

-- Дамп структуры для таблица globus.b_forum_group
CREATE TABLE IF NOT EXISTS `b_forum_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT 150,
  `PARENT_ID` int(11) DEFAULT NULL,
  `LEFT_MARGIN` int(11) DEFAULT NULL,
  `RIGHT_MARGIN` int(11) DEFAULT NULL,
  `DEPTH_LEVEL` int(11) DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_forum_group: ~0 rows (приблизительно)
DELETE FROM `b_forum_group`;

-- Дамп структуры для таблица globus.b_forum_group_lang
CREATE TABLE IF NOT EXISTS `b_forum_group_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FORUM_GROUP_ID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_GROUP` (`FORUM_GROUP_ID`,`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_forum_group_lang: ~0 rows (приблизительно)
DELETE FROM `b_forum_group_lang`;

-- Дамп структуры для таблица globus.b_forum_letter
CREATE TABLE IF NOT EXISTS `b_forum_letter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DICTIONARY_ID` int(11) DEFAULT 0,
  `LETTER` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REPLACEMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_forum_letter: ~37 rows (приблизительно)
DELETE FROM `b_forum_letter`;
INSERT INTO `b_forum_letter` (`ID`, `DICTIONARY_ID`, `LETTER`, `REPLACEMENT`) VALUES
	(1, 2, 'а', 'АаAa'),
	(2, 2, 'б', 'БбBb'),
	(3, 2, 'в', 'ВвVv'),
	(4, 2, 'г', 'Гг'),
	(5, 2, 'д', 'ДдDd'),
	(6, 2, 'е', 'ЁёЕеEe'),
	(7, 2, 'ё', 'ЁёЕеEe, [Йй]+[Оо]+'),
	(8, 2, 'ж', 'ЖжGg'),
	(9, 2, 'з', 'ЗзZz3'),
	(10, 2, 'и', 'ИиIi'),
	(11, 2, 'й', 'ЙйИиYy'),
	(12, 2, 'к', 'КкKk'),
	(13, 2, 'л', 'ЛлLl'),
	(14, 2, 'м', 'МмMm'),
	(15, 2, 'н', 'НнNn'),
	(16, 2, 'о', 'ОоOo'),
	(17, 2, 'п', 'ПпPp'),
	(18, 2, 'р', 'РрPpRr'),
	(19, 2, 'с', 'СсCc'),
	(20, 2, 'т', 'ТтTt'),
	(21, 2, 'у', 'УуUu'),
	(22, 2, 'ф', 'ФфFf'),
	(23, 2, 'х', 'ХхXx'),
	(24, 2, 'ц', 'ЦцCc'),
	(25, 2, 'ч', 'Чч'),
	(26, 2, 'ш', 'Шш'),
	(27, 2, 'щ', 'Щщ'),
	(28, 2, 'ь', 'ЪъЬь"\','),
	(29, 2, 'ы', 'Ыы'),
	(30, 2, 'ъ', 'ЪъЬь"\','),
	(31, 2, 'э', 'Ээ'),
	(32, 2, 'ю', 'Юю, [Йй]+[Оо]+'),
	(33, 2, 'я', 'Яя'),
	(34, 2, '%', '[Цц]+([Аа]+|[Оо]+), [Тт]+([Ьь]+|)[Сс]+[Яя]+'),
	(35, 2, '^', ',ВвЗзСс,ВвЫы,ДдОо,ЗзАа,ИиЗзСс,НнАа,НнЕе,ОоТт,([Пп]*[Ее]+[Рр]+[Ее]+)'),
	(36, 2, 'тся', '%'),
	(37, 2, 'ться', '%');

-- Дамп структуры для таблица globus.b_forum_message
CREATE TABLE IF NOT EXISTS `b_forum_message` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` bigint(20) NOT NULL,
  `USE_SMILES` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NEW_TOPIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `APPROVED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SOURCE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'WEB',
  `POST_DATE` datetime NOT NULL,
  `POST_MESSAGE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_MESSAGE_HTML` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_MESSAGE_FILTER` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_MESSAGE_CHECK` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ATTACH_IMG` int(11) DEFAULT NULL,
  `PARAM1` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAM2` int(11) DEFAULT NULL,
  `AUTHOR_ID` int(10) DEFAULT NULL,
  `AUTHOR_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_REAL_IP` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GUEST_ID` int(10) DEFAULT NULL,
  `EDITOR_ID` int(10) DEFAULT NULL,
  `EDITOR_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDITOR_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_REASON` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_DATE` datetime DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HTML` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `MAIL_HEADER` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVICE_TYPE` tinyint(4) DEFAULT NULL,
  `SERVICE_DATA` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_MESSAGE_FORUM` (`FORUM_ID`,`APPROVED`),
  KEY `IX_FORUM_MESSAGE_FORUM_TOPIC` (`FORUM_ID`,`TOPIC_ID`),
  KEY `IX_FORUM_MESSAGE_TOPIC` (`TOPIC_ID`,`APPROVED`),
  KEY `IX_FORUM_MESSAGE_AUTHOR` (`AUTHOR_ID`,`APPROVED`,`FORUM_ID`),
  KEY `IX_FORUM_MESSAGE_APPROVED` (`APPROVED`),
  KEY `IX_FORUM_MESSAGE_PARAM2` (`PARAM2`),
  KEY `IX_FORUM_MESSAGE_XML_ID` (`XML_ID`),
  KEY `IX_FORUM_MESSAGE_DATE_AUTHOR_ID` (`POST_DATE`,`AUTHOR_ID`),
  KEY `IX_FORUM_MESSAGE_AUTHOR_TOPIC_ID` (`AUTHOR_ID`,`TOPIC_ID`),
  KEY `IX_FORUM_MESSAGE_AUTHOR_FORUM_ID` (`AUTHOR_ID`,`FORUM_ID`,`ID`,`APPROVED`,`TOPIC_ID`),
  KEY `IX_FORUM_MESSAGE_SERVICE_TYPE` (`SERVICE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_forum_message: ~0 rows (приблизительно)
DELETE FROM `b_forum_message`;

-- Дамп структуры для таблица globus.b_forum_perms
CREATE TABLE IF NOT EXISTS `b_forum_perms` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `PERMISSION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_PERMS_FORUM` (`FORUM_ID`,`GROUP_ID`),
  KEY `IX_FORUM_PERMS_GROUP` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_forum_perms: ~0 rows (приблизительно)
DELETE FROM `b_forum_perms`;

-- Дамп структуры для таблица globus.b_forum_pm_folder
CREATE TABLE IF NOT EXISTS `b_forum_pm_folder` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `SORT` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_PM_FOLDER_USER_IST` (`USER_ID`,`ID`,`SORT`,`TITLE`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_forum_pm_folder: ~4 rows (приблизительно)
DELETE FROM `b_forum_pm_folder`;
INSERT INTO `b_forum_pm_folder` (`ID`, `TITLE`, `USER_ID`, `SORT`) VALUES
	(1, 'SYSTEM_FOLDER_1', 0, 0),
	(2, 'SYSTEM_FOLDER_2', 0, 0),
	(3, 'SYSTEM_FOLDER_3', 0, 0),
	(4, 'SYSTEM_FOLDER_4', 0, 0);

-- Дамп структуры для таблица globus.b_forum_points
CREATE TABLE IF NOT EXISTS `b_forum_points` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MIN_POINTS` int(11) NOT NULL,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_P_MP` (`MIN_POINTS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_forum_points: ~0 rows (приблизительно)
DELETE FROM `b_forum_points`;

-- Дамп структуры для таблица globus.b_forum_points2post
CREATE TABLE IF NOT EXISTS `b_forum_points2post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MIN_NUM_POSTS` int(11) NOT NULL,
  `POINTS_PER_POST` decimal(18,4) NOT NULL DEFAULT 0.0000,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_P2P_MNP` (`MIN_NUM_POSTS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_forum_points2post: ~0 rows (приблизительно)
DELETE FROM `b_forum_points2post`;

-- Дамп структуры для таблица globus.b_forum_points_lang
CREATE TABLE IF NOT EXISTS `b_forum_points_lang` (
  `POINTS_ID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`POINTS_ID`,`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_forum_points_lang: ~0 rows (приблизительно)
DELETE FROM `b_forum_points_lang`;

-- Дамп структуры для таблица globus.b_forum_private_message
CREATE TABLE IF NOT EXISTS `b_forum_private_message` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `AUTHOR_ID` int(11) DEFAULT 0,
  `RECIPIENT_ID` int(11) DEFAULT 0,
  `POST_DATE` datetime DEFAULT NULL,
  `POST_SUBJ` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_MESSAGE` text COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `FOLDER_ID` int(11) NOT NULL,
  `IS_READ` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_IS_READ` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USE_SMILES` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_PM_AFR` (`AUTHOR_ID`,`FOLDER_ID`,`IS_READ`),
  KEY `IX_B_FORUM_PM_UFP` (`USER_ID`,`FOLDER_ID`,`POST_DATE`),
  KEY `IX_B_FORUM_PM_POST_DATE` (`POST_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_forum_private_message: ~0 rows (приблизительно)
DELETE FROM `b_forum_private_message`;

-- Дамп структуры для таблица globus.b_forum_rank
CREATE TABLE IF NOT EXISTS `b_forum_rank` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MIN_NUM_POSTS` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_forum_rank: ~0 rows (приблизительно)
DELETE FROM `b_forum_rank`;

-- Дамп структуры для таблица globus.b_forum_rank_lang
CREATE TABLE IF NOT EXISTS `b_forum_rank_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RANK_ID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_RANK` (`RANK_ID`,`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_forum_rank_lang: ~0 rows (приблизительно)
DELETE FROM `b_forum_rank_lang`;

-- Дамп структуры для таблица globus.b_forum_service_deleted_message
CREATE TABLE IF NOT EXISTS `b_forum_service_deleted_message` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` bigint(20) NOT NULL,
  `MESSAGE_ID` bigint(20) NOT NULL,
  `NEW_TOPIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `APPROVED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `PARAM1` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAM2` int(11) DEFAULT NULL,
  `AUTHOR_ID` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_MESSAGE_DELETED_ID` (`MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_forum_service_deleted_message: ~0 rows (приблизительно)
DELETE FROM `b_forum_service_deleted_message`;

-- Дамп структуры для таблица globus.b_forum_service_statistic_queue
CREATE TABLE IF NOT EXISTS `b_forum_service_statistic_queue` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENTITY_ID` int(10) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_SERVICE_STATISTIC` (`ENTITY_TYPE`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_forum_service_statistic_queue: ~0 rows (приблизительно)
DELETE FROM `b_forum_service_statistic_queue`;

-- Дамп структуры для таблица globus.b_forum_stat
CREATE TABLE IF NOT EXISTS `b_forum_stat` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) DEFAULT NULL,
  `IP_ADDRESS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHPSESSID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORUM_ID` smallint(5) NOT NULL DEFAULT 0,
  `TOPIC_ID` int(10) DEFAULT NULL,
  `SHOW_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_STAT_SITE_ID` (`SITE_ID`,`LAST_VISIT`),
  KEY `IX_B_FORUM_STAT_TOPIC_ID` (`TOPIC_ID`,`LAST_VISIT`),
  KEY `IX_B_FORUM_STAT_FORUM_ID` (`FORUM_ID`,`LAST_VISIT`),
  KEY `IX_B_FORUM_STAT_PHPSESSID` (`PHPSESSID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_forum_stat: ~0 rows (приблизительно)
DELETE FROM `b_forum_stat`;

-- Дамп структуры для таблица globus.b_forum_subscribe
CREATE TABLE IF NOT EXISTS `b_forum_subscribe` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) NOT NULL,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` int(10) DEFAULT NULL,
  `START_DATE` datetime NOT NULL,
  `LAST_SEND` int(10) DEFAULT NULL,
  `NEW_TOPIC_ONLY` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ru',
  `SOCNET_GROUP_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_SUBSCRIBE_USER` (`USER_ID`,`FORUM_ID`,`TOPIC_ID`,`SOCNET_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_forum_subscribe: ~0 rows (приблизительно)
DELETE FROM `b_forum_subscribe`;

-- Дамп структуры для таблица globus.b_forum_topic
CREATE TABLE IF NOT EXISTS `b_forum_topic` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` bigint(20) DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE_SEO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ICON` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `APPROVED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(10) NOT NULL DEFAULT 150,
  `VIEWS` int(10) NOT NULL DEFAULT 0,
  `USER_START_ID` int(10) DEFAULT NULL,
  `USER_START_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `START_DATE` datetime NOT NULL,
  `POSTS` int(10) NOT NULL DEFAULT 0,
  `POSTS_SERVICE` int(10) NOT NULL DEFAULT 0,
  `LAST_POSTER_ID` int(10) DEFAULT NULL,
  `LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_POST_DATE` datetime NOT NULL,
  `LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `POSTS_UNAPPROVED` int(11) DEFAULT 0,
  `ABS_LAST_POSTER_ID` int(10) DEFAULT NULL,
  `ABS_LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ABS_LAST_POST_DATE` datetime DEFAULT NULL,
  `ABS_LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HTML` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SOCNET_GROUP_ID` int(10) DEFAULT NULL,
  `OWNER_ID` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_TOPIC_FORUM` (`FORUM_ID`,`APPROVED`),
  KEY `IX_FORUM_TOPIC_APPROVED` (`APPROVED`),
  KEY `IX_FORUM_TOPIC_ABS_L_POST_DATE` (`ABS_LAST_POST_DATE`),
  KEY `IX_FORUM_TOPIC_LAST_POST_DATE` (`LAST_POST_DATE`),
  KEY `IX_FORUM_TOPIC_USER_START_ID` (`USER_START_ID`),
  KEY `IX_FORUM_TOPIC_LAST_POSTER_ID` (`LAST_POSTER_ID`),
  KEY `IX_FORUM_TOPIC_DATE_USER_START_ID` (`START_DATE`,`USER_START_ID`),
  KEY `IX_FORUM_TOPIC_XML_ID` (`XML_ID`),
  KEY `IX_FORUM_TOPIC_TITLE_SEO` (`FORUM_ID`,`TITLE_SEO`),
  KEY `IX_FORUM_TOPIC_TITLE_SEO2` (`TITLE_SEO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_forum_topic: ~0 rows (приблизительно)
DELETE FROM `b_forum_topic`;

-- Дамп структуры для таблица globus.b_forum_user
CREATE TABLE IF NOT EXISTS `b_forum_user` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) NOT NULL,
  `ALIAS` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AVATAR` int(10) DEFAULT NULL,
  `NUM_POSTS` int(10) DEFAULT 0,
  `INTERESTS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_POST` int(10) DEFAULT NULL,
  `ALLOW_POST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_VISIT` datetime NOT NULL,
  `DATE_REG` date NOT NULL,
  `REAL_IP_ADDRESS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SIGNATURE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SHOW_NAME` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `RANK_ID` int(11) DEFAULT NULL,
  `POINTS` int(11) NOT NULL DEFAULT 0,
  `HIDE_FROM_ONLINE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SUBSC_GROUP_MESSAGE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SUBSC_GET_MY_MESSAGE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_FORUM_USER_USER6` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_forum_user: ~0 rows (приблизительно)
DELETE FROM `b_forum_user`;

-- Дамп структуры для таблица globus.b_forum_user_forum
CREATE TABLE IF NOT EXISTS `b_forum_user_forum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `FORUM_ID` int(11) DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `MAIN_LAST_VISIT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_USER_FORUM_ID1` (`USER_ID`,`FORUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_forum_user_forum: ~0 rows (приблизительно)
DELETE FROM `b_forum_user_forum`;

-- Дамп структуры для таблица globus.b_forum_user_points
CREATE TABLE IF NOT EXISTS `b_forum_user_points` (
  `FROM_USER_ID` int(11) NOT NULL,
  `TO_USER_ID` int(11) NOT NULL,
  `POINTS` int(11) NOT NULL DEFAULT 0,
  `DATE_UPDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`FROM_USER_ID`,`TO_USER_ID`),
  KEY `IX_B_FORUM_USER_POINTS_TO_USER` (`TO_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_forum_user_points: ~0 rows (приблизительно)
DELETE FROM `b_forum_user_points`;

-- Дамп структуры для таблица globus.b_forum_user_topic
CREATE TABLE IF NOT EXISTS `b_forum_user_topic` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TOPIC_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `FORUM_ID` int(11) DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  PRIMARY KEY (`TOPIC_ID`,`USER_ID`),
  KEY `ID` (`ID`),
  KEY `IX_B_FORUM_USER_FORUM_ID2` (`USER_ID`,`FORUM_ID`,`TOPIC_ID`),
  KEY `IX_B_FORUM_USER_FORUM_ID3` (`FORUM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_forum_user_topic: ~0 rows (приблизительно)
DELETE FROM `b_forum_user_topic`;

-- Дамп структуры для таблица globus.b_geoip_handlers
CREATE TABLE IF NOT EXISTS `b_geoip_handlers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT 100,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `CLASS_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_geoip_handlers: ~2 rows (приблизительно)
DELETE FROM `b_geoip_handlers`;
INSERT INTO `b_geoip_handlers` (`ID`, `SORT`, `ACTIVE`, `CLASS_NAME`, `CONFIG`) VALUES
	(1, 100, 'N', '\\Bitrix\\Main\\Service\\GeoIp\\MaxMind', NULL),
	(2, 110, 'Y', '\\Bitrix\\Main\\Service\\GeoIp\\SypexGeo', NULL);

-- Дамп структуры для таблица globus.b_group
CREATE TABLE IF NOT EXISTS `b_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `C_SORT` int(11) NOT NULL DEFAULT 100,
  `ANONYMOUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IS_SYSTEM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECURITY_POLICY` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `STRING_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_group: ~4 rows (приблизительно)
DELETE FROM `b_group`;
INSERT INTO `b_group` (`ID`, `TIMESTAMP_X`, `ACTIVE`, `C_SORT`, `ANONYMOUS`, `IS_SYSTEM`, `NAME`, `DESCRIPTION`, `SECURITY_POLICY`, `STRING_ID`) VALUES
	(1, NULL, 'Y', 1, 'N', 'Y', 'Администраторы', 'Полный доступ к управлению сайтом.', NULL, NULL),
	(2, NULL, 'Y', 2, 'Y', 'Y', 'Все пользователи (в том числе неавторизованные)', 'Все пользователи, включая неавторизованных.', NULL, NULL),
	(3, NULL, 'Y', 3, 'N', 'Y', 'Пользователи, имеющие право голосовать за рейтинг', 'В эту группу пользователи добавляются автоматически.', NULL, 'RATING_VOTE'),
	(4, NULL, 'Y', 4, 'N', 'Y', 'Пользователи имеющие право голосовать за авторитет', 'В эту группу пользователи добавляются автоматически.', NULL, 'RATING_VOTE_AUTHORITY');

-- Дамп структуры для таблица globus.b_group_collection_task
CREATE TABLE IF NOT EXISTS `b_group_collection_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `COLLECTION_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`,`COLLECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_group_collection_task: ~0 rows (приблизительно)
DELETE FROM `b_group_collection_task`;

-- Дамп структуры для таблица globus.b_group_subordinate
CREATE TABLE IF NOT EXISTS `b_group_subordinate` (
  `ID` int(11) NOT NULL,
  `AR_SUBGROUP_ID` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_group_subordinate: ~0 rows (приблизительно)
DELETE FROM `b_group_subordinate`;

-- Дамп структуры для таблица globus.b_group_task
CREATE TABLE IF NOT EXISTS `b_group_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_group_task: ~0 rows (приблизительно)
DELETE FROM `b_group_task`;

-- Дамп структуры для таблица globus.b_hlblock_entity
CREATE TABLE IF NOT EXISTS `b_hlblock_entity` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `TABLE_NAME` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_hlblock_entity: ~0 rows (приблизительно)
DELETE FROM `b_hlblock_entity`;

-- Дамп структуры для таблица globus.b_hlblock_entity_lang
CREATE TABLE IF NOT EXISTS `b_hlblock_entity_lang` (
  `ID` int(11) unsigned NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_hlblock_entity_lang: ~0 rows (приблизительно)
DELETE FROM `b_hlblock_entity_lang`;

-- Дамп структуры для таблица globus.b_hlblock_entity_rights
CREATE TABLE IF NOT EXISTS `b_hlblock_entity_rights` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `HL_ID` int(11) unsigned NOT NULL,
  `TASK_ID` int(11) unsigned NOT NULL,
  `ACCESS_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_hlblock_entity_rights: ~0 rows (приблизительно)
DELETE FROM `b_hlblock_entity_rights`;

-- Дамп структуры для таблица globus.b_hot_keys
CREATE TABLE IF NOT EXISTS `b_hot_keys` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `KEYS_STRING` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_b_hot_keys_co_u` (`CODE_ID`,`USER_ID`),
  KEY `ix_hot_keys_user` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_hot_keys: ~24 rows (приблизительно)
DELETE FROM `b_hot_keys`;
INSERT INTO `b_hot_keys` (`ID`, `KEYS_STRING`, `CODE_ID`, `USER_ID`) VALUES
	(1, 'Ctrl+Alt+85', 139, 0),
	(2, 'Ctrl+Alt+80', 17, 0),
	(3, 'Ctrl+Alt+70', 120, 0),
	(4, 'Ctrl+Alt+68', 117, 0),
	(5, 'Ctrl+Alt+81', 3, 0),
	(6, 'Ctrl+Alt+75', 106, 0),
	(7, 'Ctrl+Alt+79', 133, 0),
	(8, 'Ctrl+Alt+70', 121, 0),
	(9, 'Ctrl+Alt+69', 118, 0),
	(10, 'Ctrl+Shift+83', 87, 0),
	(11, 'Ctrl+Shift+88', 88, 0),
	(12, 'Ctrl+Shift+76', 89, 0),
	(13, 'Ctrl+Alt+85', 139, 1),
	(14, 'Ctrl+Alt+80', 17, 1),
	(15, 'Ctrl+Alt+70', 120, 1),
	(16, 'Ctrl+Alt+68', 117, 1),
	(17, 'Ctrl+Alt+81', 3, 1),
	(18, 'Ctrl+Alt+75', 106, 1),
	(19, 'Ctrl+Alt+79', 133, 1),
	(20, 'Ctrl+Alt+70', 121, 1),
	(21, 'Ctrl+Alt+69', 118, 1),
	(22, 'Ctrl+Shift+83', 87, 1),
	(23, 'Ctrl+Shift+88', 88, 1),
	(24, 'Ctrl+Shift+76', 89, 1);

-- Дамп структуры для таблица globus.b_hot_keys_code
CREATE TABLE IF NOT EXISTS `b_hot_keys_code` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CLASS_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE_OBJ` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_CUSTOM` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ID`),
  KEY `ix_hot_keys_code_cn` (`CLASS_NAME`),
  KEY `ix_hot_keys_code_url` (`URL`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_hot_keys_code: ~79 rows (приблизительно)
DELETE FROM `b_hot_keys_code`;
INSERT INTO `b_hot_keys_code` (`ID`, `CLASS_NAME`, `CODE`, `NAME`, `COMMENTS`, `TITLE_OBJ`, `URL`, `IS_CUSTOM`) VALUES
	(3, 'CAdminTabControl', 'NextTab();', 'HK_DB_CADMINTC', 'HK_DB_CADMINTC_C', 'tab-container', '', 0),
	(5, 'btn_new', 'var d=BX (\'btn_new\'); if (d) location.href = d.href;', 'HK_DB_BUT_ADD', 'HK_DB_BUT_ADD_C', 'btn_new', '', 0),
	(6, 'btn_excel', 'var d=BX(\'btn_excel\'); if (d) location.href = d.href;', 'HK_DB_BUT_EXL', 'HK_DB_BUT_EXL_C', 'btn_excel', '', 0),
	(7, 'btn_settings', 'var d=BX(\'btn_settings\'); if (d) location.href = d.href;', 'HK_DB_BUT_OPT', 'HK_DB_BUT_OPT_C', 'btn_settings', '', 0),
	(8, 'btn_list', 'var d=BX(\'btn_list\'); if (d) location.href = d.href;', 'HK_DB_BUT_LST', 'HK_DB_BUT_LST_C', 'btn_list', '', 0),
	(9, 'Edit_Save_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'save\'}}, true );  if (d) d.click();', 'HK_DB_BUT_SAVE', 'HK_DB_BUT_SAVE_C', 'Edit_Save_Button', '', 0),
	(10, 'btn_delete', 'var d=BX(\'btn_delete\'); if (d) location.href = d.href;', 'HK_DB_BUT_DEL', 'HK_DB_BUT_DEL_C', 'btn_delete', '', 0),
	(12, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'find\'}}, true ); if (d) d.focus();', 'HK_DB_FLT_FND', 'HK_DB_FLT_FND_C', 'find', '', 0),
	(13, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'set_filter\'}}, true );  if (d) d.click();', 'HK_DB_FLT_BUT_F', 'HK_DB_FLT_BUT_F_C', 'set_filter', '', 0),
	(14, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'del_filter\'}}, true );  if (d) d.click();', 'HK_DB_FLT_BUT_CNL', 'HK_DB_FLT_BUT_CNL_C', 'del_filter', '', 0),
	(15, 'bx-panel-admin-button-help-icon-id', 'var d=BX(\'bx-panel-admin-button-help-icon-id\'); if (d) location.href = d.href;', 'HK_DB_BUT_HLP', 'HK_DB_BUT_HLP_C', 'bx-panel-admin-button-help-icon-id', '', 0),
	(17, 'Global', 'BXHotKeys.ShowSettings();', 'HK_DB_SHW_L', 'HK_DB_SHW_L_C', 'bx-panel-hotkeys', '', 0),
	(19, 'Edit_Apply_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'apply\'}}, true );  if (d) d.click();', 'HK_DB_BUT_APPL', 'HK_DB_BUT_APPL_C', 'Edit_Apply_Button', '', 0),
	(20, 'Edit_Cancel_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'cancel\'}}, true );  if (d) d.click();', 'HK_DB_BUT_CANCEL', 'HK_DB_BUT_CANCEL_C', 'Edit_Cancel_Button', '', 0),
	(54, 'top_panel_org_fav', '', '-=AUTONAME=-', NULL, 'top_panel_org_fav', NULL, 0),
	(55, 'top_panel_module_settings', '', '-=AUTONAME=-', NULL, 'top_panel_module_settings', '', 0),
	(56, 'top_panel_interface_settings', '', '-=AUTONAME=-', NULL, 'top_panel_interface_settings', '', 0),
	(57, 'top_panel_help', '', '-=AUTONAME=-', NULL, 'top_panel_help', '', 0),
	(58, 'top_panel_bizproc_tasks', '', '-=AUTONAME=-', NULL, 'top_panel_bizproc_tasks', '', 0),
	(59, 'top_panel_add_fav', '', '-=AUTONAME=-', NULL, 'top_panel_add_fav', NULL, 0),
	(60, 'top_panel_create_page', '', '-=AUTONAME=-', NULL, 'top_panel_create_page', '', 0),
	(62, 'top_panel_create_folder', '', '-=AUTONAME=-', NULL, 'top_panel_create_folder', '', 0),
	(63, 'top_panel_edit_page', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page', '', 0),
	(64, 'top_panel_page_prop', '', '-=AUTONAME=-', NULL, 'top_panel_page_prop', '', 0),
	(65, 'top_panel_edit_page_html', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page_html', '', 0),
	(67, 'top_panel_edit_page_php', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page_php', '', 0),
	(68, 'top_panel_del_page', '', '-=AUTONAME=-', NULL, 'top_panel_del_page', '', 0),
	(69, 'top_panel_folder_prop', '', '-=AUTONAME=-', NULL, 'top_panel_folder_prop', '', 0),
	(70, 'top_panel_access_folder_new', '', '-=AUTONAME=-', NULL, 'top_panel_access_folder_new', '', 0),
	(71, 'main_top_panel_struct_panel', '', '-=AUTONAME=-', NULL, 'main_top_panel_struct_panel', '', 0),
	(72, 'top_panel_cache_page', '', '-=AUTONAME=-', NULL, 'top_panel_cache_page', '', 0),
	(73, 'top_panel_cache_comp', '', '-=AUTONAME=-', NULL, 'top_panel_cache_comp', '', 0),
	(74, 'top_panel_cache_not', '', '-=AUTONAME=-', NULL, 'top_panel_cache_not', '', 0),
	(75, 'top_panel_edit_mode', '', '-=AUTONAME=-', NULL, 'top_panel_edit_mode', '', 0),
	(76, 'top_panel_templ_site_css', '', '-=AUTONAME=-', NULL, 'top_panel_templ_site_css', '', 0),
	(77, 'top_panel_templ_templ_css', '', '-=AUTONAME=-', NULL, 'top_panel_templ_templ_css', '', 0),
	(78, 'top_panel_templ_site', '', '-=AUTONAME=-', NULL, 'top_panel_templ_site', '', 0),
	(81, 'top_panel_debug_time', '', '-=AUTONAME=-', NULL, 'top_panel_debug_time', '', 0),
	(82, 'top_panel_debug_incl', '', '-=AUTONAME=-', NULL, 'top_panel_debug_incl', '', 0),
	(83, 'top_panel_debug_sql', '', '-=AUTONAME=-', NULL, 'top_panel_debug_sql', NULL, 0),
	(84, 'top_panel_debug_compr', '', '-=AUTONAME=-', NULL, 'top_panel_debug_compr', '', 0),
	(85, 'MTP_SHORT_URI1', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI1', '', 0),
	(86, 'MTP_SHORT_URI_LIST', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI_LIST', '', 0),
	(87, 'FMST_PANEL_STICKER_ADD', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKER_ADD', '', 0),
	(88, 'FMST_PANEL_STICKERS_SHOW', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKERS_SHOW', '', 0),
	(89, 'FMST_PANEL_CUR_STICKER_LIST', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_CUR_STICKER_LIST', '', 0),
	(90, 'FMST_PANEL_ALL_STICKER_LIST', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_ALL_STICKER_LIST', '', 0),
	(91, 'top_panel_menu', 'var d=BX("bx-panel-menu"); if (d) d.click();', '-=AUTONAME=-', NULL, 'bx-panel-menu', '', 0),
	(92, 'top_panel_admin', 'var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-admin-tab', '', 0),
	(93, 'admin_panel_site', 'var d=BX(\'bx-panel-view-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-view-tab', '', 0),
	(94, 'admin_panel_admin', 'var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-admin-tab', '', 0),
	(96, 'top_panel_folder_prop_new', '', '-=AUTONAME=-', NULL, 'top_panel_folder_prop_new', '', 0),
	(97, 'main_top_panel_structure', '', '-=AUTONAME=-', NULL, 'main_top_panel_structure', '', 0),
	(98, 'top_panel_clear_cache', '', '-=AUTONAME=-', NULL, 'top_panel_clear_cache', '', 0),
	(99, 'top_panel_templ', '', '-=AUTONAME=-', NULL, 'top_panel_templ', '', 0),
	(100, 'top_panel_debug', '', '-=AUTONAME=-', NULL, 'top_panel_debug', '', 0),
	(101, 'MTP_SHORT_URI', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI', '', 0),
	(102, 'FMST_PANEL_STICKERS', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKERS', '', 0),
	(103, 'top_panel_settings', '', '-=AUTONAME=-', NULL, 'top_panel_settings', '', 0),
	(104, 'top_panel_fav', '', '-=AUTONAME=-', NULL, 'top_panel_fav', '', 0),
	(106, 'Global', 'location.href=\'/bitrix/admin/hot_keys_list.php?lang=ru\';', 'HK_DB_SHW_HK', '', '', '', 0),
	(107, 'top_panel_edit_new', '', '-=AUTONAME=-', NULL, 'top_panel_edit_new', '', 0),
	(108, 'FLOW_PANEL_CREATE_WITH_WF', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_CREATE_WITH_WF', '', 0),
	(109, 'FLOW_PANEL_EDIT_WITH_WF', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_EDIT_WITH_WF', '', 0),
	(110, 'FLOW_PANEL_HISTORY', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_HISTORY', '', 0),
	(111, 'top_panel_create_new', '', '-=AUTONAME=-', NULL, 'top_panel_create_new', '', 0),
	(112, 'top_panel_create_folder_new', '', '-=AUTONAME=-', NULL, 'top_panel_create_folder_new', '', 0),
	(116, 'bx-panel-toggle', '', '-=AUTONAME=-', NULL, 'bx-panel-toggle', '', 0),
	(117, 'bx-panel-small-toggle', '', '-=AUTONAME=-', NULL, 'bx-panel-small-toggle', '', 0),
	(118, 'bx-panel-expander', 'var d=BX(\'bx-panel-expander\'); if (d) BX.fireEvent(d, \'click\');', '-=AUTONAME=-', NULL, 'bx-panel-expander', '', 0),
	(119, 'bx-panel-hider', 'var d=BX(\'bx-panel-hider\'); if (d) d.click();', '-=AUTONAME=-', NULL, 'bx-panel-hider', '', 0),
	(120, 'search-textbox-input', 'var d=BX(\'search-textbox-input\'); if (d) { d.click(); d.focus();}', '-=AUTONAME=-', '', 'search', '', 0),
	(121, 'bx-search-input', 'var d=BX(\'bx-search-input\'); if (d) { d.click(); d.focus(); }', '-=AUTONAME=-', '', 'bx-search-input', '', 0),
	(133, 'bx-panel-logout', 'var d=BX(\'bx-panel-logout\'); if (d) location.href = d.href;', '-=AUTONAME=-', '', 'bx-panel-logout', '', 0),
	(135, 'CDialog', 'var d=BX(\'cancel\'); if (d) d.click();', 'HK_DB_D_CANCEL', '', 'cancel', '', 0),
	(136, 'CDialog', 'var d=BX(\'close\'); if (d) d.click();', 'HK_DB_D_CLOSE', '', 'close', '', 0),
	(137, 'CDialog', 'var d=BX(\'savebtn\'); if (d) d.click();', 'HK_DB_D_SAVE', '', 'savebtn', '', 0),
	(138, 'CDialog', 'var d=BX(\'btn_popup_save\'); if (d) d.click();', 'HK_DB_D_EDIT_SAVE', '', 'btn_popup_save', '', 0),
	(139, 'Global', 'location.href=\'/bitrix/admin/user_admin.php?lang=\'+phpVars.LANGUAGE_ID;', 'HK_DB_SHW_U', '', '', '', 0);

-- Дамп структуры для таблица globus.b_iblock
CREATE TABLE IF NOT EXISTS `b_iblock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `API_CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REST_ON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT 500,
  `LIST_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CANONICAL_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `RSS_TTL` int(11) NOT NULL DEFAULT 24,
  `RSS_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `RSS_FILE_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RSS_FILE_LIMIT` int(11) DEFAULT NULL,
  `RSS_FILE_DAYS` int(11) DEFAULT NULL,
  `RSS_YANDEX_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEX_ELEMENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `INDEX_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `WORKFLOW` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `BIZPROC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SECTION_CHOOSER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RIGHTS_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_PROPERTY` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROPERTY_INDEX` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT 1,
  `LAST_CONV_ELEMENT` int(11) NOT NULL DEFAULT 0,
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTIONS_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENTS_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_iblock_api_code` (`API_CODE`),
  KEY `ix_iblock` (`IBLOCK_TYPE_ID`,`LID`,`ACTIVE`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_iblock: ~6 rows (приблизительно)
DELETE FROM `b_iblock`;
INSERT INTO `b_iblock` (`ID`, `TIMESTAMP_X`, `IBLOCK_TYPE_ID`, `LID`, `CODE`, `API_CODE`, `REST_ON`, `NAME`, `ACTIVE`, `SORT`, `LIST_PAGE_URL`, `DETAIL_PAGE_URL`, `SECTION_PAGE_URL`, `CANONICAL_PAGE_URL`, `PICTURE`, `DESCRIPTION`, `DESCRIPTION_TYPE`, `RSS_TTL`, `RSS_ACTIVE`, `RSS_FILE_ACTIVE`, `RSS_FILE_LIMIT`, `RSS_FILE_DAYS`, `RSS_YANDEX_ACTIVE`, `XML_ID`, `TMP_ID`, `INDEX_ELEMENT`, `INDEX_SECTION`, `WORKFLOW`, `BIZPROC`, `SECTION_CHOOSER`, `LIST_MODE`, `RIGHTS_MODE`, `SECTION_PROPERTY`, `PROPERTY_INDEX`, `VERSION`, `LAST_CONV_ELEMENT`, `SOCNET_GROUP_ID`, `EDIT_FILE_BEFORE`, `EDIT_FILE_AFTER`, `SECTIONS_NAME`, `SECTION_NAME`, `ELEMENTS_NAME`, `ELEMENT_NAME`) VALUES
	(1, '2023-02-10 09:25:21', 'content', 's1', '', NULL, 'N', 'Новости', 'Y', 500, '', '/news/#SECTION_CODE_PATH#/#ELEMENT_CODE#/', '/news/#SECTION_CODE_PATH#/', '', NULL, '', 'text', 24, 'Y', 'N', NULL, NULL, 'N', NULL, NULL, 'Y', 'Y', 'N', 'N', 'L', '', 'S', 'N', 'N', 1, 0, NULL, '', '', 'Разделы', 'Раздел', 'Элементы', 'Элемент'),
	(2, '2023-02-10 09:59:36', 'content', 's1', '', NULL, 'N', 'Вакансии', 'Y', 500, '#SITE_DIR#/content/index.php?ID=#IBLOCK_ID#', '#SITE_DIR#/content/detail.php?ID=#ELEMENT_ID#', '#SITE_DIR#/content/list.php?SECTION_ID=#SECTION_ID#', '', NULL, '', 'text', 24, 'Y', 'N', NULL, NULL, 'N', NULL, NULL, 'Y', 'Y', 'N', 'N', 'L', '', 'S', 'N', 'N', 1, 0, NULL, '', '', 'Разделы', 'Раздел', 'Элементы', 'Элемент'),
	(3, '2023-02-10 10:50:37', 'content', 's1', '', NULL, 'N', 'Детям', 'Y', 500, '#SITE_DIR#/content/index.php?ID=#IBLOCK_ID#', '#SITE_DIR#/content/detail.php?ID=#ELEMENT_ID#', '#SITE_DIR#/content/list.php?SECTION_ID=#SECTION_ID#', '', NULL, '', 'text', 24, 'Y', 'N', NULL, NULL, 'N', NULL, NULL, 'Y', 'Y', 'N', 'N', 'L', '', 'S', 'N', 'N', 1, 0, NULL, '', '', 'Разделы', 'Раздел', 'Элементы', 'Элемент'),
	(4, '2023-02-11 11:43:58', 'content', 's1', '', NULL, 'N', 'История о комбинате', 'Y', 500, '#SITE_DIR#/content/index.php?ID=#IBLOCK_ID#', '#SITE_DIR#/content/detail.php?ID=#ELEMENT_ID#', '#SITE_DIR#/content/list.php?SECTION_ID=#SECTION_ID#', '', NULL, '', 'text', 24, 'Y', 'N', NULL, NULL, 'N', NULL, NULL, 'Y', 'Y', 'N', 'N', 'L', '', 'S', 'N', 'N', 1, 0, NULL, '', '', 'Разделы', 'Раздел', 'Элементы', 'Элемент'),
	(5, '2023-02-11 12:06:50', 'content', 's1', '', NULL, 'N', 'Фото: наше производство', 'Y', 500, '#SITE_DIR#/content/index.php?ID=#IBLOCK_ID#', '#SITE_DIR#/content/detail.php?ID=#ELEMENT_ID#', '#SITE_DIR#/content/list.php?SECTION_ID=#SECTION_ID#', '', NULL, '', 'text', 24, 'Y', 'N', NULL, NULL, 'N', NULL, NULL, 'Y', 'Y', 'N', 'N', 'L', '', 'S', 'N', 'N', 1, 0, NULL, '', '', 'Разделы', 'Раздел', 'Элементы', 'Элемент'),
	(6, '2023-02-11 13:28:22', 'documents', 's1', '', NULL, 'N', 'Меню для школ', 'Y', 500, '#SITE_DIR#/documents/index.php?ID=#IBLOCK_ID#', '#SITE_DIR#/documents/detail.php?ID=#ELEMENT_ID#', '#SITE_DIR#/documents/list.php?SECTION_ID=#SECTION_ID#', '', NULL, '', 'text', 24, 'Y', 'N', NULL, NULL, 'N', NULL, '21407132afeefcf712b97c093c92385e', 'Y', 'Y', 'N', 'N', 'L', '', 'S', 'N', 'N', 1, 0, NULL, '', '', 'Разделы', 'Раздел', 'Элементы', 'Элемент');

-- Дамп структуры для таблица globus.b_iblock_cache
CREATE TABLE IF NOT EXISTS `b_iblock_cache` (
  `CACHE_KEY` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `CACHE` longtext COLLATE utf8_unicode_ci NOT NULL,
  `CACHE_DATE` datetime NOT NULL,
  PRIMARY KEY (`CACHE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_iblock_cache: ~0 rows (приблизительно)
DELETE FROM `b_iblock_cache`;

-- Дамп структуры для таблица globus.b_iblock_element
CREATE TABLE IF NOT EXISTS `b_iblock_element` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL DEFAULT 0,
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT 500,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PREVIEW_PICTURE` int(18) DEFAULT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW_TEXT_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `DETAIL_TEXT` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_TEXT_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_STATUS_ID` int(18) DEFAULT 1,
  `WF_PARENT_ELEMENT_ID` int(11) DEFAULT NULL,
  `WF_NEW` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_LOCKED_BY` int(18) DEFAULT NULL,
  `WF_DATE_LOCK` datetime DEFAULT NULL,
  `WF_COMMENTS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_SECTIONS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_LAST_HISTORY_ID` int(11) DEFAULT NULL,
  `SHOW_COUNTER` int(18) DEFAULT NULL,
  `SHOW_COUNTER_START` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_element_4` (`IBLOCK_ID`,`XML_ID`,`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_3` (`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_code` (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_iblock_element: ~10 rows (приблизительно)
DELETE FROM `b_iblock_element`;
INSERT INTO `b_iblock_element` (`ID`, `TIMESTAMP_X`, `MODIFIED_BY`, `DATE_CREATE`, `CREATED_BY`, `IBLOCK_ID`, `IBLOCK_SECTION_ID`, `ACTIVE`, `ACTIVE_FROM`, `ACTIVE_TO`, `SORT`, `NAME`, `PREVIEW_PICTURE`, `PREVIEW_TEXT`, `PREVIEW_TEXT_TYPE`, `DETAIL_PICTURE`, `DETAIL_TEXT`, `DETAIL_TEXT_TYPE`, `SEARCHABLE_CONTENT`, `WF_STATUS_ID`, `WF_PARENT_ELEMENT_ID`, `WF_NEW`, `WF_LOCKED_BY`, `WF_DATE_LOCK`, `WF_COMMENTS`, `IN_SECTIONS`, `XML_ID`, `CODE`, `TAGS`, `TMP_ID`, `WF_LAST_HISTORY_ID`, `SHOW_COUNTER`, `SHOW_COUNTER_START`) VALUES
	(1, '2023-02-10 16:50:49', 1, '2023-02-10 16:16:19', 1, 1, NULL, 'Y', '2023-02-10 16:50:00', NULL, 500, 'Вкусная и полезная еда', 1, 'С другой стороны, семантический разбор внешних противодействий напрямую зависит от первоочередных требований. Противоположная точка зрения подразумевает, что элементы политического процесса ограничены исключительно образом мышления. ', 'text', 2, '<div>\r\n	 Наше дело не так однозначно, как может показаться.\r\n</div>\r\n<div>\r\n <br>\r\n</div>\r\n <br>\r\n <br>\r\n<div>\r\n	 Наше дело не так однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений. Приятно, граждане, наблюдать, как независимые государства подвергнуты целой серии независимых исследований. <br>\r\n	 Наше дело не так однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений. Приятно, граждане, наблюдать, как независимые государства подвергнуты целой серии независимых исследований.\r\n</div>\r\n <br>\r\n<ul>\r\n	<li>Наше дело не так однозначно; </li>\r\n	<li>\r\n	Наше дело не так однозначно;</li>\r\n	<li>\r\n	Наше дело не так однозначно;</li>\r\n	<li>\r\n	Наше дело не так однозначно.</li>\r\n</ul>', 'html', 'ВКУСНАЯ И ПОЛЕЗНАЯ ЕДА\r\nС ДРУГОЙ СТОРОНЫ, СЕМАНТИЧЕСКИЙ РАЗБОР ВНЕШНИХ ПРОТИВОДЕЙСТВИЙ НАПРЯМУЮ ЗАВИСИТ ОТ ПЕРВООЧЕРЕДНЫХ ТРЕБОВАНИЙ. ПРОТИВОПОЛОЖНАЯ ТОЧКА ЗРЕНИЯ ПОДРАЗУМЕВАЕТ, ЧТО ЭЛЕМЕНТЫ ПОЛИТИЧЕСКОГО ПРОЦЕССА ОГРАНИЧЕНЫ ИСКЛЮЧИТЕЛЬНО ОБРАЗОМ МЫШЛЕНИЯ. \r\nНАШЕ ДЕЛО НЕ ТАК ОДНОЗНАЧНО, КАК МОЖЕТ ПОКАЗАТЬСЯ. \r\n\r\n\r\n\r\n\r\nНАШЕ ДЕЛО НЕ ТАК ОДНОЗНАЧНО, КАК МОЖЕТ ПОКАЗАТЬСЯ: \r\nПОНИМАНИЕ СУТИ РЕСУРСОСБЕРЕГАЮЩИХ ТЕХНОЛОГИЙ ПРЕДСТАВЛЯЕТ СОБОЙ ИНТЕРЕСНЫЙ ЭКСПЕРИМЕНТ ПРОВЕРКИ КАК САМОДОСТАТОЧНЫХ, ТАК И ВНЕШНЕ ЗАВИСИМЫХ КОНЦЕПТУАЛЬНЫХ РЕШЕНИЙ. ПРИЯТНО, ГРАЖДАНЕ, НАБЛЮДАТЬ, КАК НЕЗАВИСИМЫЕ ГОСУДАРСТВА ПОДВЕРГНУТЫ ЦЕЛОЙ СЕРИИ НЕЗАВИСИМЫХ ИССЛЕДОВАНИЙ. \r\nНАШЕ ДЕЛО НЕ ТАК ОДНОЗНАЧНО, КАК МОЖЕТ ПОКАЗАТЬСЯ: \r\nПОНИМАНИЕ СУТИ РЕСУРСОСБЕРЕГАЮЩИХ ТЕХНОЛОГИЙ ПРЕДСТАВЛЯЕТ СОБОЙ ИНТЕРЕСНЫЙ ЭКСПЕРИМЕНТ ПРОВЕРКИ КАК САМОДОСТАТОЧНЫХ, ТАК И ВНЕШНЕ ЗАВИСИМЫХ КОНЦЕПТУАЛЬНЫХ РЕШЕНИЙ. ПРИЯТНО, ГРАЖДАНЕ, НАБЛЮДАТЬ, КАК НЕЗАВИСИМЫЕ ГОСУДАРСТВА ПОДВЕРГНУТЫ ЦЕЛОЙ СЕРИИ НЕЗАВИСИМЫХ ИССЛЕДОВАНИЙ. \r\n\r\n\r\n- НАШЕ ДЕЛО НЕ ТАК ОДНОЗНАЧНО; \r\n- НАШЕ ДЕЛО НЕ ТАК ОДНОЗНАЧНО; \r\n- НАШЕ ДЕЛО НЕ ТАК ОДНОЗНАЧНО; \r\n- НАШЕ ДЕЛО НЕ ТАК ОДНОЗНАЧНО.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '1', 'vkusnaya-i-poleznaya-eda', '', '0', NULL, NULL, NULL),
	(3, '2023-02-10 17:11:49', 1, '2023-02-10 17:11:49', 1, 2, NULL, 'Y', NULL, NULL, 500, 'Кондитер', NULL, '', 'text', NULL, 'Требуются повара-кондитеры в школьные столовые города.  Подберём для вас наиболее удобный вариант рядом с домом.', 'html', 'КОНДИТЕР\r\n\r\nТРЕБУЮТСЯ ПОВАРА-КОНДИТЕРЫ В ШКОЛЬНЫЕ \r\nСТОЛОВЫЕ ГОРОДА.  ПОДБЕРЁМ ДЛЯ ВАС НАИБОЛЕЕ УДОБНЫЙ ВАРИАНТ РЯДОМ С ДОМОМ.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '3', 'konditer', '', '0', NULL, NULL, NULL),
	(4, '2023-02-10 17:53:03', 1, '2023-02-10 17:52:13', 1, 3, NULL, 'Y', NULL, NULL, 500, 'Мультфильм о веселой панде', 3, 'Наше дело не так однозначно, как может технологий представляет собой интерес эксперимент проверки.  ', 'text', NULL, '', 'text', 'МУЛЬТФИЛЬМ О ВЕСЕЛОЙ ПАНДЕ\r\nНАШЕ ДЕЛО НЕ ТАК ОДНОЗНАЧНО, КАК МОЖЕТ ТЕХНОЛОГИЙ ПРЕДСТАВЛЯЕТ СОБОЙ ИНТЕРЕС ЭКСПЕРИМЕНТ ПРОВЕРКИ.  \r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '4', 'multfilm-o-veseloy-pande', '', '0', NULL, NULL, NULL),
	(6, '2023-02-11 18:55:03', 1, '2023-02-11 18:54:57', 1, 4, NULL, 'Y', NULL, NULL, 500, '1959-1985 гг.', NULL, '', 'text', 4, 'История «КШП – Глобус» начинается с основания комбинатов школьного питания в г. Барнауле. Первым свою работу начал комбинат Октябрьского района в 1959 году. \r\nПозже были открыты комбинаты школьного питания в поселке Южном, Центральном районе, Ленинском районе, Железнодорожном районе, в Индустриальный районе.', 'html', '1959-1985 ГГ.\r\n\r\nИСТОРИЯ «КШП – ГЛОБУС» НАЧИНАЕТСЯ С ОСНОВАНИЯ \r\nКОМБИНАТОВ ШКОЛЬНОГО ПИТАНИЯ В Г. БАРНАУЛЕ. ПЕРВЫМ СВОЮ РАБОТУ НАЧАЛ КОМБИНАТ ОКТЯБРЬСКОГО РАЙОНА В 1959 ГОДУ.  ПОЗЖЕ БЫЛИ ОТКРЫТЫ КОМБИНАТЫ ШКОЛЬНОГО ПИТАНИЯ В ПОСЕЛКЕ ЮЖНОМ, ЦЕНТРАЛЬНОМ РАЙОНЕ, ЛЕНИНСКОМ РАЙОНЕ, ЖЕЛЕЗНОДОРОЖНОМ РАЙОНЕ, В ИНДУСТРИАЛЬНЫЙ РАЙОНЕ.', 1, NULL, NULL, NULL, NULL, NULL, 'N', '6', '1959-1985-gg', '', '0', NULL, NULL, NULL),
	(7, '2023-02-11 19:00:53', 1, '2023-02-11 19:00:53', 1, 4, NULL, 'Y', NULL, NULL, 500, '2005 г.', NULL, '', 'text', 5, '12 июля 2005 года произошло слияние комбинатов в единый комбинат школьного питания «Муниципальное унитарное предприятие Комбинат школьного питания города Барнаула».', 'html', '2005 Г.\r\n\r\n12 ИЮЛЯ 2005 ГОДА ПРОИЗОШЛО СЛИЯНИЕ КОМБИНАТОВ \r\nВ ЕДИНЫЙ КОМБИНАТ ШКОЛЬНОГО ПИТАНИЯ «МУНИЦИПАЛЬНОЕ УНИТАРНОЕ ПРЕДПРИЯТИЕ КОМБИНАТ ШКОЛЬНОГО ПИТАНИЯ ГОРОДА БАРНАУЛА».', 1, NULL, NULL, NULL, NULL, NULL, 'N', '7', '2005-g', '', '0', NULL, NULL, NULL),
	(8, '2023-02-11 19:11:09', 1, '2023-02-11 19:11:09', 1, 5, NULL, 'Y', NULL, NULL, 500, '1', 6, '', 'text', NULL, '', 'text', '1\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '8', '', '', '0', NULL, NULL, NULL),
	(9, '2023-02-11 19:11:16', 1, '2023-02-11 19:11:16', 1, 5, NULL, 'Y', NULL, NULL, 500, '2', 7, '', 'text', NULL, '', 'text', '2\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '9', '', '', '0', NULL, NULL, NULL),
	(10, '2023-02-11 19:11:22', 1, '2023-02-11 19:11:22', 1, 5, NULL, 'Y', NULL, NULL, 500, '3', 8, '', 'text', NULL, '', 'text', '3\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '10', '', '', '0', NULL, NULL, NULL),
	(11, '2023-02-11 19:11:28', 1, '2023-02-11 19:11:28', 1, 5, NULL, 'Y', NULL, NULL, 500, '4', 9, '', 'text', NULL, '', 'text', '4\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'N', '11', '', '', '0', NULL, NULL, NULL),
	(12, '2023-02-11 20:58:06', 1, '2023-02-11 20:46:15', 1, 6, 1, 'Y', '2023-02-11 20:58:00', NULL, 500, '1', 10, '', 'text', NULL, '', 'text', '1\r\n\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '12', '1', '', '0', NULL, NULL, NULL);

-- Дамп структуры для таблица globus.b_iblock_element_iprop
CREATE TABLE IF NOT EXISTS `b_iblock_element_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ELEMENT_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_element_iprop_0` (`IPROP_ID`),
  KEY `ix_b_iblock_element_iprop_1` (`IBLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_iblock_element_iprop: ~0 rows (приблизительно)
DELETE FROM `b_iblock_element_iprop`;

-- Дамп структуры для таблица globus.b_iblock_element_lock
CREATE TABLE IF NOT EXISTS `b_iblock_element_lock` (
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `DATE_LOCK` datetime DEFAULT NULL,
  `LOCKED_BY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_iblock_element_lock: ~0 rows (приблизительно)
DELETE FROM `b_iblock_element_lock`;

-- Дамп структуры для таблица globus.b_iblock_element_property
CREATE TABLE IF NOT EXISTS `b_iblock_element_property` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_PROPERTY_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  `VALUE_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `VALUE_ENUM` int(11) DEFAULT NULL,
  `VALUE_NUM` decimal(18,4) DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_property_1` (`IBLOCK_ELEMENT_ID`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_property_2` (`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_enum` (`VALUE_ENUM`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_num` (`VALUE_NUM`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_val` (`VALUE`(50),`IBLOCK_PROPERTY_ID`,`IBLOCK_ELEMENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_iblock_element_property: ~14 rows (приблизительно)
DELETE FROM `b_iblock_element_property`;
INSERT INTO `b_iblock_element_property` (`ID`, `IBLOCK_PROPERTY_ID`, `IBLOCK_ELEMENT_ID`, `VALUE`, `VALUE_TYPE`, `VALUE_ENUM`, `VALUE_NUM`, `DESCRIPTION`) VALUES
	(1, 1, 3, 'Приготовление блюд по меню, согласно технологическим картам (выпечка, напитки, первые, вторые блюда, гарниры)', 'text', NULL, 0.0000, ''),
	(2, 1, 3, 'Приготовление заготовок на следующий день', 'text', NULL, 0.0000, ''),
	(3, 1, 3, 'Ссоблюдение санитарных норм и правил, правил личной гигиены', 'text', NULL, 0.0000, ''),
	(4, 2, 3, 'Среднее профессиональное образование', 'text', NULL, 0.0000, ''),
	(5, 2, 3, 'Медицинская книжка с допуском к работе', 'text', NULL, 0.0000, ''),
	(6, 2, 3, 'Можно без опыта работы', 'text', NULL, 0.0000, ''),
	(7, 3, 3, 'Официальное трудоустройство', 'text', NULL, 0.0000, ''),
	(8, 3, 3, 'Своевременная выплата заработной платы 2 раза в месяц', 'text', NULL, 0.0000, ''),
	(9, 3, 3, 'Отпуск летом во время школьных каникул', 'text', NULL, 0.0000, ''),
	(10, 3, 3, 'Льготное питание', 'text', NULL, 0.0000, ''),
	(11, 3, 3, 'Столовые во всех районах города', 'text', NULL, 0.0000, ''),
	(12, 4, 3, 'от 25 800 до 33 500 руб. на руки', 'text', NULL, 0.0000, ''),
	(13, 5, 4, 'https://www.youtube.com/watch?v=q_nj340pkQo', 'text', NULL, 0.0000, ''),
	(14, 6, 12, '11', 'text', NULL, 11.0000, NULL);

-- Дамп структуры для таблица globus.b_iblock_element_right
CREATE TABLE IF NOT EXISTS `b_iblock_element_right` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL,
  `RIGHT_ID` int(11) NOT NULL,
  `IS_INHERITED` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RIGHT_ID`,`ELEMENT_ID`,`SECTION_ID`),
  KEY `ix_b_iblock_element_right_1` (`ELEMENT_ID`,`IBLOCK_ID`),
  KEY `ix_b_iblock_element_right_2` (`IBLOCK_ID`,`RIGHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_iblock_element_right: ~0 rows (приблизительно)
DELETE FROM `b_iblock_element_right`;

-- Дамп структуры для таблица globus.b_iblock_fields
CREATE TABLE IF NOT EXISTS `b_iblock_fields` (
  `IBLOCK_ID` int(18) NOT NULL,
  `FIELD_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `IS_REQUIRED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_iblock_fields: ~192 rows (приблизительно)
DELETE FROM `b_iblock_fields`;
INSERT INTO `b_iblock_fields` (`IBLOCK_ID`, `FIELD_ID`, `IS_REQUIRED`, `DEFAULT_VALUE`) VALUES
	(1, 'ACTIVE', 'Y', 'Y'),
	(1, 'ACTIVE_FROM', 'N', '=now'),
	(1, 'ACTIVE_TO', 'N', ''),
	(1, 'CODE', 'Y', 'a:8:{s:6:"UNIQUE";s:1:"Y";s:15:"TRANSLITERATION";s:1:"Y";s:9:"TRANS_LEN";i:100;s:10:"TRANS_CASE";s:1:"L";s:11:"TRANS_SPACE";s:1:"-";s:11:"TRANS_OTHER";s:1:"-";s:9:"TRANS_EAT";s:1:"Y";s:10:"USE_GOOGLE";s:1:"N";}'),
	(1, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(1, 'DETAIL_TEXT', 'N', ''),
	(1, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
	(1, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
	(1, 'IBLOCK_SECTION', 'N', 'a:1:{s:22:"KEEP_IBLOCK_SECTION_ID";s:1:"N";}'),
	(1, 'LOG_ELEMENT_ADD', 'N', NULL),
	(1, 'LOG_ELEMENT_DELETE', 'N', NULL),
	(1, 'LOG_ELEMENT_EDIT', 'N', NULL),
	(1, 'LOG_SECTION_ADD', 'N', NULL),
	(1, 'LOG_SECTION_DELETE', 'N', NULL),
	(1, 'LOG_SECTION_EDIT', 'N', NULL),
	(1, 'NAME', 'Y', ''),
	(1, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:"FROM_DETAIL";s:1:"N";s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"DELETE_WITH_DETAIL";s:1:"N";s:18:"UPDATE_WITH_DETAIL";s:1:"N";s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(1, 'PREVIEW_TEXT', 'N', ''),
	(1, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
	(1, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
	(1, 'SECTION_CODE', 'N', 'a:8:{s:6:"UNIQUE";s:1:"N";s:15:"TRANSLITERATION";s:1:"N";s:9:"TRANS_LEN";i:100;s:10:"TRANS_CASE";s:1:"L";s:11:"TRANS_SPACE";s:1:"-";s:11:"TRANS_OTHER";s:1:"-";s:9:"TRANS_EAT";s:1:"Y";s:10:"USE_GOOGLE";s:1:"N";}'),
	(1, 'SECTION_DESCRIPTION', 'N', ''),
	(1, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
	(1, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
	(1, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(1, 'SECTION_NAME', 'Y', ''),
	(1, 'SECTION_PICTURE', 'N', 'a:20:{s:11:"FROM_DETAIL";s:1:"N";s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"DELETE_WITH_DETAIL";s:1:"N";s:18:"UPDATE_WITH_DETAIL";s:1:"N";s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(1, 'SECTION_XML_ID', 'N', ''),
	(1, 'SORT', 'N', '0'),
	(1, 'TAGS', 'N', ''),
	(1, 'XML_ID', 'Y', ''),
	(1, 'XML_IMPORT_START_TIME', 'N', NULL),
	(2, 'ACTIVE', 'Y', 'Y'),
	(2, 'ACTIVE_FROM', 'N', ''),
	(2, 'ACTIVE_TO', 'N', ''),
	(2, 'CODE', 'Y', 'a:8:{s:6:"UNIQUE";s:1:"Y";s:15:"TRANSLITERATION";s:1:"Y";s:9:"TRANS_LEN";i:100;s:10:"TRANS_CASE";s:1:"L";s:11:"TRANS_SPACE";s:1:"-";s:11:"TRANS_OTHER";s:1:"-";s:9:"TRANS_EAT";s:1:"Y";s:10:"USE_GOOGLE";s:1:"N";}'),
	(2, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(2, 'DETAIL_TEXT', 'N', ''),
	(2, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
	(2, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
	(2, 'IBLOCK_SECTION', 'N', 'a:1:{s:22:"KEEP_IBLOCK_SECTION_ID";s:1:"N";}'),
	(2, 'LOG_ELEMENT_ADD', 'N', NULL),
	(2, 'LOG_ELEMENT_DELETE', 'N', NULL),
	(2, 'LOG_ELEMENT_EDIT', 'N', NULL),
	(2, 'LOG_SECTION_ADD', 'N', NULL),
	(2, 'LOG_SECTION_DELETE', 'N', NULL),
	(2, 'LOG_SECTION_EDIT', 'N', NULL),
	(2, 'NAME', 'Y', ''),
	(2, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:"FROM_DETAIL";s:1:"N";s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"DELETE_WITH_DETAIL";s:1:"N";s:18:"UPDATE_WITH_DETAIL";s:1:"N";s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(2, 'PREVIEW_TEXT', 'N', ''),
	(2, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
	(2, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
	(2, 'SECTION_CODE', 'N', 'a:8:{s:6:"UNIQUE";s:1:"N";s:15:"TRANSLITERATION";s:1:"N";s:9:"TRANS_LEN";i:100;s:10:"TRANS_CASE";s:1:"L";s:11:"TRANS_SPACE";s:1:"-";s:11:"TRANS_OTHER";s:1:"-";s:9:"TRANS_EAT";s:1:"Y";s:10:"USE_GOOGLE";s:1:"N";}'),
	(2, 'SECTION_DESCRIPTION', 'N', ''),
	(2, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
	(2, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
	(2, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(2, 'SECTION_NAME', 'Y', ''),
	(2, 'SECTION_PICTURE', 'N', 'a:20:{s:11:"FROM_DETAIL";s:1:"N";s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"DELETE_WITH_DETAIL";s:1:"N";s:18:"UPDATE_WITH_DETAIL";s:1:"N";s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(2, 'SECTION_XML_ID', 'N', ''),
	(2, 'SORT', 'N', '0'),
	(2, 'TAGS', 'N', ''),
	(2, 'XML_ID', 'Y', ''),
	(2, 'XML_IMPORT_START_TIME', 'N', NULL),
	(3, 'ACTIVE', 'Y', 'Y'),
	(3, 'ACTIVE_FROM', 'N', ''),
	(3, 'ACTIVE_TO', 'N', ''),
	(3, 'CODE', 'Y', 'a:8:{s:6:"UNIQUE";s:1:"Y";s:15:"TRANSLITERATION";s:1:"Y";s:9:"TRANS_LEN";i:100;s:10:"TRANS_CASE";s:1:"L";s:11:"TRANS_SPACE";s:1:"-";s:11:"TRANS_OTHER";s:1:"-";s:9:"TRANS_EAT";s:1:"Y";s:10:"USE_GOOGLE";s:1:"N";}'),
	(3, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(3, 'DETAIL_TEXT', 'N', ''),
	(3, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
	(3, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
	(3, 'IBLOCK_SECTION', 'N', 'a:1:{s:22:"KEEP_IBLOCK_SECTION_ID";s:1:"N";}'),
	(3, 'LOG_ELEMENT_ADD', 'N', NULL),
	(3, 'LOG_ELEMENT_DELETE', 'N', NULL),
	(3, 'LOG_ELEMENT_EDIT', 'N', NULL),
	(3, 'LOG_SECTION_ADD', 'N', NULL),
	(3, 'LOG_SECTION_DELETE', 'N', NULL),
	(3, 'LOG_SECTION_EDIT', 'N', NULL),
	(3, 'NAME', 'Y', ''),
	(3, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:"FROM_DETAIL";s:1:"N";s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"DELETE_WITH_DETAIL";s:1:"N";s:18:"UPDATE_WITH_DETAIL";s:1:"N";s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(3, 'PREVIEW_TEXT', 'N', ''),
	(3, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
	(3, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
	(3, 'SECTION_CODE', 'N', 'a:8:{s:6:"UNIQUE";s:1:"N";s:15:"TRANSLITERATION";s:1:"N";s:9:"TRANS_LEN";i:100;s:10:"TRANS_CASE";s:1:"L";s:11:"TRANS_SPACE";s:1:"-";s:11:"TRANS_OTHER";s:1:"-";s:9:"TRANS_EAT";s:1:"Y";s:10:"USE_GOOGLE";s:1:"N";}'),
	(3, 'SECTION_DESCRIPTION', 'N', ''),
	(3, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
	(3, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
	(3, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(3, 'SECTION_NAME', 'Y', ''),
	(3, 'SECTION_PICTURE', 'N', 'a:20:{s:11:"FROM_DETAIL";s:1:"N";s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"DELETE_WITH_DETAIL";s:1:"N";s:18:"UPDATE_WITH_DETAIL";s:1:"N";s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(3, 'SECTION_XML_ID', 'N', ''),
	(3, 'SORT', 'N', '0'),
	(3, 'TAGS', 'N', ''),
	(3, 'XML_ID', 'Y', ''),
	(3, 'XML_IMPORT_START_TIME', 'N', NULL),
	(4, 'ACTIVE', 'Y', 'Y'),
	(4, 'ACTIVE_FROM', 'N', ''),
	(4, 'ACTIVE_TO', 'N', ''),
	(4, 'CODE', 'Y', 'a:8:{s:6:"UNIQUE";s:1:"Y";s:15:"TRANSLITERATION";s:1:"Y";s:9:"TRANS_LEN";i:100;s:10:"TRANS_CASE";s:1:"L";s:11:"TRANS_SPACE";s:1:"-";s:11:"TRANS_OTHER";s:1:"-";s:9:"TRANS_EAT";s:1:"Y";s:10:"USE_GOOGLE";s:1:"N";}'),
	(4, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(4, 'DETAIL_TEXT', 'N', ''),
	(4, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
	(4, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
	(4, 'IBLOCK_SECTION', 'N', 'a:1:{s:22:"KEEP_IBLOCK_SECTION_ID";s:1:"N";}'),
	(4, 'LOG_ELEMENT_ADD', 'N', NULL),
	(4, 'LOG_ELEMENT_DELETE', 'N', NULL),
	(4, 'LOG_ELEMENT_EDIT', 'N', NULL),
	(4, 'LOG_SECTION_ADD', 'N', NULL),
	(4, 'LOG_SECTION_DELETE', 'N', NULL),
	(4, 'LOG_SECTION_EDIT', 'N', NULL),
	(4, 'NAME', 'Y', ''),
	(4, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:"FROM_DETAIL";s:1:"N";s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"DELETE_WITH_DETAIL";s:1:"N";s:18:"UPDATE_WITH_DETAIL";s:1:"N";s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(4, 'PREVIEW_TEXT', 'N', ''),
	(4, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
	(4, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
	(4, 'SECTION_CODE', 'N', 'a:8:{s:6:"UNIQUE";s:1:"N";s:15:"TRANSLITERATION";s:1:"N";s:9:"TRANS_LEN";i:100;s:10:"TRANS_CASE";s:1:"L";s:11:"TRANS_SPACE";s:1:"-";s:11:"TRANS_OTHER";s:1:"-";s:9:"TRANS_EAT";s:1:"Y";s:10:"USE_GOOGLE";s:1:"N";}'),
	(4, 'SECTION_DESCRIPTION', 'N', ''),
	(4, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
	(4, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
	(4, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(4, 'SECTION_NAME', 'Y', ''),
	(4, 'SECTION_PICTURE', 'N', 'a:20:{s:11:"FROM_DETAIL";s:1:"N";s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"DELETE_WITH_DETAIL";s:1:"N";s:18:"UPDATE_WITH_DETAIL";s:1:"N";s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(4, 'SECTION_XML_ID', 'N', ''),
	(4, 'SORT', 'N', '0'),
	(4, 'TAGS', 'N', ''),
	(4, 'XML_ID', 'Y', ''),
	(4, 'XML_IMPORT_START_TIME', 'N', NULL),
	(5, 'ACTIVE', 'Y', 'Y'),
	(5, 'ACTIVE_FROM', 'N', ''),
	(5, 'ACTIVE_TO', 'N', ''),
	(5, 'CODE', 'N', 'a:8:{s:6:"UNIQUE";s:1:"N";s:15:"TRANSLITERATION";s:1:"N";s:9:"TRANS_LEN";i:100;s:10:"TRANS_CASE";s:1:"L";s:11:"TRANS_SPACE";s:1:"-";s:11:"TRANS_OTHER";s:1:"-";s:9:"TRANS_EAT";s:1:"Y";s:10:"USE_GOOGLE";s:1:"N";}'),
	(5, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(5, 'DETAIL_TEXT', 'N', ''),
	(5, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
	(5, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
	(5, 'IBLOCK_SECTION', 'N', 'a:1:{s:22:"KEEP_IBLOCK_SECTION_ID";s:1:"N";}'),
	(5, 'LOG_ELEMENT_ADD', 'N', NULL),
	(5, 'LOG_ELEMENT_DELETE', 'N', NULL),
	(5, 'LOG_ELEMENT_EDIT', 'N', NULL),
	(5, 'LOG_SECTION_ADD', 'N', NULL),
	(5, 'LOG_SECTION_DELETE', 'N', NULL),
	(5, 'LOG_SECTION_EDIT', 'N', NULL),
	(5, 'NAME', 'Y', ''),
	(5, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:"FROM_DETAIL";s:1:"N";s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"DELETE_WITH_DETAIL";s:1:"N";s:18:"UPDATE_WITH_DETAIL";s:1:"N";s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(5, 'PREVIEW_TEXT', 'N', ''),
	(5, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
	(5, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
	(5, 'SECTION_CODE', 'N', 'a:8:{s:6:"UNIQUE";s:1:"N";s:15:"TRANSLITERATION";s:1:"N";s:9:"TRANS_LEN";i:100;s:10:"TRANS_CASE";s:1:"L";s:11:"TRANS_SPACE";s:1:"-";s:11:"TRANS_OTHER";s:1:"-";s:9:"TRANS_EAT";s:1:"Y";s:10:"USE_GOOGLE";s:1:"N";}'),
	(5, 'SECTION_DESCRIPTION', 'N', ''),
	(5, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
	(5, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
	(5, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(5, 'SECTION_NAME', 'Y', ''),
	(5, 'SECTION_PICTURE', 'N', 'a:20:{s:11:"FROM_DETAIL";s:1:"N";s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"DELETE_WITH_DETAIL";s:1:"N";s:18:"UPDATE_WITH_DETAIL";s:1:"N";s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(5, 'SECTION_XML_ID', 'N', ''),
	(5, 'SORT', 'N', '0'),
	(5, 'TAGS', 'N', ''),
	(5, 'XML_ID', 'Y', ''),
	(5, 'XML_IMPORT_START_TIME', 'N', NULL),
	(6, 'ACTIVE', 'Y', 'Y'),
	(6, 'ACTIVE_FROM', 'Y', '=now'),
	(6, 'ACTIVE_TO', 'N', ''),
	(6, 'CODE', 'N', 'a:8:{s:6:"UNIQUE";s:1:"Y";s:15:"TRANSLITERATION";s:1:"Y";s:9:"TRANS_LEN";i:100;s:10:"TRANS_CASE";s:1:"L";s:11:"TRANS_SPACE";s:1:"-";s:11:"TRANS_OTHER";s:1:"-";s:9:"TRANS_EAT";s:1:"Y";s:10:"USE_GOOGLE";s:1:"N";}'),
	(6, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(6, 'DETAIL_TEXT', 'N', ''),
	(6, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
	(6, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
	(6, 'IBLOCK_SECTION', 'N', 'a:1:{s:22:"KEEP_IBLOCK_SECTION_ID";s:1:"N";}'),
	(6, 'LOG_ELEMENT_ADD', 'N', NULL),
	(6, 'LOG_ELEMENT_DELETE', 'N', NULL),
	(6, 'LOG_ELEMENT_EDIT', 'N', NULL),
	(6, 'LOG_SECTION_ADD', 'N', NULL),
	(6, 'LOG_SECTION_DELETE', 'N', NULL),
	(6, 'LOG_SECTION_EDIT', 'N', NULL),
	(6, 'NAME', 'Y', ''),
	(6, 'PREVIEW_PICTURE', 'N', 'a:20:{s:11:"FROM_DETAIL";s:1:"N";s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"DELETE_WITH_DETAIL";s:1:"N";s:18:"UPDATE_WITH_DETAIL";s:1:"N";s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(6, 'PREVIEW_TEXT', 'N', ''),
	(6, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
	(6, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
	(6, 'SECTION_CODE', 'N', 'a:8:{s:6:"UNIQUE";s:1:"N";s:15:"TRANSLITERATION";s:1:"N";s:9:"TRANS_LEN";i:100;s:10:"TRANS_CASE";s:1:"L";s:11:"TRANS_SPACE";s:1:"-";s:11:"TRANS_OTHER";s:1:"-";s:9:"TRANS_EAT";s:1:"Y";s:10:"USE_GOOGLE";s:1:"N";}'),
	(6, 'SECTION_DESCRIPTION', 'N', ''),
	(6, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
	(6, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
	(6, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(6, 'SECTION_NAME', 'Y', ''),
	(6, 'SECTION_PICTURE', 'N', 'a:20:{s:11:"FROM_DETAIL";s:1:"N";s:5:"SCALE";s:1:"N";s:5:"WIDTH";s:0:"";s:6:"HEIGHT";s:0:"";s:13:"IGNORE_ERRORS";s:1:"N";s:6:"METHOD";s:8:"resample";s:11:"COMPRESSION";i:95;s:18:"DELETE_WITH_DETAIL";s:1:"N";s:18:"UPDATE_WITH_DETAIL";s:1:"N";s:18:"USE_WATERMARK_TEXT";s:1:"N";s:14:"WATERMARK_TEXT";s:0:"";s:19:"WATERMARK_TEXT_FONT";s:0:"";s:20:"WATERMARK_TEXT_COLOR";s:0:"";s:19:"WATERMARK_TEXT_SIZE";s:0:"";s:23:"WATERMARK_TEXT_POSITION";s:2:"tl";s:18:"USE_WATERMARK_FILE";s:1:"N";s:14:"WATERMARK_FILE";s:0:"";s:20:"WATERMARK_FILE_ALPHA";s:0:"";s:23:"WATERMARK_FILE_POSITION";s:2:"tl";s:20:"WATERMARK_FILE_ORDER";N;}'),
	(6, 'SECTION_XML_ID', 'N', ''),
	(6, 'SORT', 'N', '0'),
	(6, 'TAGS', 'N', ''),
	(6, 'XML_ID', 'Y', ''),
	(6, 'XML_IMPORT_START_TIME', 'N', NULL);

-- Дамп структуры для таблица globus.b_iblock_group
CREATE TABLE IF NOT EXISTS `b_iblock_group` (
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `PERMISSION` char(1) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `ux_iblock_group_1` (`IBLOCK_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_iblock_group: ~12 rows (приблизительно)
DELETE FROM `b_iblock_group`;
INSERT INTO `b_iblock_group` (`IBLOCK_ID`, `GROUP_ID`, `PERMISSION`) VALUES
	(1, 1, 'X'),
	(1, 2, 'R'),
	(2, 1, 'X'),
	(2, 2, 'R'),
	(3, 1, 'X'),
	(3, 2, 'R'),
	(4, 1, 'X'),
	(4, 2, 'R'),
	(5, 1, 'X'),
	(5, 2, 'R'),
	(6, 1, 'X'),
	(6, 2, 'R');

-- Дамп структуры для таблица globus.b_iblock_iblock_iprop
CREATE TABLE IF NOT EXISTS `b_iblock_iblock_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_iblock_iprop_0` (`IPROP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_iblock_iblock_iprop: ~0 rows (приблизительно)
DELETE FROM `b_iblock_iblock_iprop`;

-- Дамп структуры для таблица globus.b_iblock_iproperty
CREATE TABLE IF NOT EXISTS `b_iblock_iproperty` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `TEMPLATE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_iblock_iprop_0` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_iblock_iproperty: ~0 rows (приблизительно)
DELETE FROM `b_iblock_iproperty`;

-- Дамп структуры для таблица globus.b_iblock_messages
CREATE TABLE IF NOT EXISTS `b_iblock_messages` (
  `IBLOCK_ID` int(18) NOT NULL,
  `MESSAGE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_TEXT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_iblock_messages: ~60 rows (приблизительно)
DELETE FROM `b_iblock_messages`;
INSERT INTO `b_iblock_messages` (`IBLOCK_ID`, `MESSAGE_ID`, `MESSAGE_TEXT`) VALUES
	(1, 'ELEMENT_ADD', 'Добавить элемент'),
	(1, 'ELEMENT_DELETE', 'Удалить элемент'),
	(1, 'ELEMENT_EDIT', 'Изменить элемент'),
	(1, 'ELEMENT_NAME', 'Элемент'),
	(1, 'ELEMENTS_NAME', 'Элементы'),
	(1, 'SECTION_ADD', 'Добавить раздел'),
	(1, 'SECTION_DELETE', 'Удалить раздел'),
	(1, 'SECTION_EDIT', 'Изменить раздел'),
	(1, 'SECTION_NAME', 'Раздел'),
	(1, 'SECTIONS_NAME', 'Разделы'),
	(2, 'ELEMENT_ADD', 'Добавить элемент'),
	(2, 'ELEMENT_DELETE', 'Удалить элемент'),
	(2, 'ELEMENT_EDIT', 'Изменить элемент'),
	(2, 'ELEMENT_NAME', 'Элемент'),
	(2, 'ELEMENTS_NAME', 'Элементы'),
	(2, 'SECTION_ADD', 'Добавить раздел'),
	(2, 'SECTION_DELETE', 'Удалить раздел'),
	(2, 'SECTION_EDIT', 'Изменить раздел'),
	(2, 'SECTION_NAME', 'Раздел'),
	(2, 'SECTIONS_NAME', 'Разделы'),
	(3, 'ELEMENT_ADD', 'Добавить элемент'),
	(3, 'ELEMENT_DELETE', 'Удалить элемент'),
	(3, 'ELEMENT_EDIT', 'Изменить элемент'),
	(3, 'ELEMENT_NAME', 'Элемент'),
	(3, 'ELEMENTS_NAME', 'Элементы'),
	(3, 'SECTION_ADD', 'Добавить раздел'),
	(3, 'SECTION_DELETE', 'Удалить раздел'),
	(3, 'SECTION_EDIT', 'Изменить раздел'),
	(3, 'SECTION_NAME', 'Раздел'),
	(3, 'SECTIONS_NAME', 'Разделы'),
	(4, 'ELEMENT_ADD', 'Добавить элемент'),
	(4, 'ELEMENT_DELETE', 'Удалить элемент'),
	(4, 'ELEMENT_EDIT', 'Изменить элемент'),
	(4, 'ELEMENT_NAME', 'Элемент'),
	(4, 'ELEMENTS_NAME', 'Элементы'),
	(4, 'SECTION_ADD', 'Добавить раздел'),
	(4, 'SECTION_DELETE', 'Удалить раздел'),
	(4, 'SECTION_EDIT', 'Изменить раздел'),
	(4, 'SECTION_NAME', 'Раздел'),
	(4, 'SECTIONS_NAME', 'Разделы'),
	(5, 'ELEMENT_ADD', 'Добавить элемент'),
	(5, 'ELEMENT_DELETE', 'Удалить элемент'),
	(5, 'ELEMENT_EDIT', 'Изменить элемент'),
	(5, 'ELEMENT_NAME', 'Элемент'),
	(5, 'ELEMENTS_NAME', 'Элементы'),
	(5, 'SECTION_ADD', 'Добавить раздел'),
	(5, 'SECTION_DELETE', 'Удалить раздел'),
	(5, 'SECTION_EDIT', 'Изменить раздел'),
	(5, 'SECTION_NAME', 'Раздел'),
	(5, 'SECTIONS_NAME', 'Разделы'),
	(6, 'ELEMENT_ADD', 'Добавить элемент'),
	(6, 'ELEMENT_DELETE', 'Удалить элемент'),
	(6, 'ELEMENT_EDIT', 'Изменить элемент'),
	(6, 'ELEMENT_NAME', 'Элемент'),
	(6, 'ELEMENTS_NAME', 'Элементы'),
	(6, 'SECTION_ADD', 'Добавить раздел'),
	(6, 'SECTION_DELETE', 'Удалить раздел'),
	(6, 'SECTION_EDIT', 'Изменить раздел'),
	(6, 'SECTION_NAME', 'Раздел'),
	(6, 'SECTIONS_NAME', 'Разделы');

-- Дамп структуры для таблица globus.b_iblock_offers_tmp
CREATE TABLE IF NOT EXISTS `b_iblock_offers_tmp` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PRODUCT_IBLOCK_ID` int(11) unsigned NOT NULL,
  `OFFERS_IBLOCK_ID` int(11) unsigned NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_iblock_offers_tmp: ~0 rows (приблизительно)
DELETE FROM `b_iblock_offers_tmp`;

-- Дамп структуры для таблица globus.b_iblock_property
CREATE TABLE IF NOT EXISTS `b_iblock_property` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `IBLOCK_ID` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT 500,
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROPERTY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `ROW_COUNT` int(11) NOT NULL DEFAULT 1,
  `COL_COUNT` int(11) NOT NULL DEFAULT 30,
  `LIST_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'L',
  `MULTIPLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_TYPE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MULTIPLE_CNT` int(11) DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_IBLOCK_ID` int(18) DEFAULT NULL,
  `WITH_DESCRIPTION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCHABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `FILTRABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IS_REQUIRED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT 1,
  `USER_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TYPE_SETTINGS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `HINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_property_1` (`IBLOCK_ID`),
  KEY `ix_iblock_property_3` (`LINK_IBLOCK_ID`),
  KEY `ix_iblock_property_2` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_iblock_property: ~5 rows (приблизительно)
DELETE FROM `b_iblock_property`;
INSERT INTO `b_iblock_property` (`ID`, `TIMESTAMP_X`, `IBLOCK_ID`, `NAME`, `ACTIVE`, `SORT`, `CODE`, `DEFAULT_VALUE`, `PROPERTY_TYPE`, `ROW_COUNT`, `COL_COUNT`, `LIST_TYPE`, `MULTIPLE`, `XML_ID`, `FILE_TYPE`, `MULTIPLE_CNT`, `TMP_ID`, `LINK_IBLOCK_ID`, `WITH_DESCRIPTION`, `SEARCHABLE`, `FILTRABLE`, `IS_REQUIRED`, `VERSION`, `USER_TYPE`, `USER_TYPE_SETTINGS`, `HINT`) VALUES
	(1, '2023-02-10 10:09:30', 2, 'Обязанности', 'Y', 500, 'REQUIRED', '', 'S', 1, 30, 'L', 'Y', NULL, '', 5, NULL, 0, 'N', 'N', 'N', 'N', 1, NULL, NULL, ''),
	(2, '2023-02-10 10:09:30', 2, 'Требования', 'Y', 500, 'REQUIREMENTS', '', 'S', 1, 30, 'L', 'Y', NULL, '', 5, NULL, 0, 'N', 'N', 'N', 'N', 1, NULL, NULL, ''),
	(3, '2023-02-10 10:09:30', 2, 'Условия', 'Y', 500, 'RULES', '', 'S', 1, 30, 'L', 'Y', NULL, '', 5, NULL, 0, 'N', 'N', 'N', 'N', 1, NULL, NULL, ''),
	(4, '2023-02-10 10:09:30', 2, 'Зарплата', 'Y', 500, 'MONEY', '', 'S', 1, 30, 'L', 'N', NULL, '', 5, NULL, 0, 'N', 'N', 'N', 'N', 1, NULL, NULL, ''),
	(5, '2023-02-10 10:50:37', 3, 'Ссылка на видео', 'Y', 500, 'LINK', '', 'S', 1, 30, 'L', 'N', NULL, '', 5, NULL, 0, 'N', 'N', 'N', 'N', 1, NULL, NULL, ''),
	(6, '2023-02-11 13:44:27', 6, 'Файл', 'Y', 500, 'FILE', '', 'F', 1, 30, 'L', 'N', NULL, '', 5, NULL, 0, 'N', 'N', 'N', 'Y', 1, NULL, NULL, '');

-- Дамп структуры для таблица globus.b_iblock_property_enum
CREATE TABLE IF NOT EXISTS `b_iblock_property_enum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROPERTY_ID` int(11) NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT 500,
  `XML_ID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_iblock_property_enum` (`PROPERTY_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_iblock_property_enum: ~0 rows (приблизительно)
DELETE FROM `b_iblock_property_enum`;

-- Дамп структуры для таблица globus.b_iblock_property_feature
CREATE TABLE IF NOT EXISTS `b_iblock_property_feature` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROPERTY_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FEATURE_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `IS_ENABLED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_iblock_property_feature` (`PROPERTY_ID`,`MODULE_ID`,`FEATURE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_iblock_property_feature: ~0 rows (приблизительно)
DELETE FROM `b_iblock_property_feature`;

-- Дамп структуры для таблица globus.b_iblock_right
CREATE TABLE IF NOT EXISTS `b_iblock_right` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `DO_INHERIT` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `OP_SREAD` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `OP_EREAD` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_iblock_right_iblock_id` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`),
  KEY `ix_b_iblock_right_group_code` (`GROUP_CODE`,`IBLOCK_ID`),
  KEY `ix_b_iblock_right_entity` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `ix_b_iblock_right_op_eread` (`ID`,`OP_EREAD`,`GROUP_CODE`),
  KEY `ix_b_iblock_right_op_sread` (`ID`,`OP_SREAD`,`GROUP_CODE`),
  KEY `ix_b_iblock_right_task_id` (`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_iblock_right: ~0 rows (приблизительно)
DELETE FROM `b_iblock_right`;

-- Дамп структуры для таблица globus.b_iblock_rss
CREATE TABLE IF NOT EXISTS `b_iblock_rss` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `NODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NODE_VALUE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_iblock_rss: ~0 rows (приблизительно)
DELETE FROM `b_iblock_rss`;

-- Дамп структуры для таблица globus.b_iblock_section
CREATE TABLE IF NOT EXISTS `b_iblock_section` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL,
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `GLOBAL_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT 500,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `LEFT_MARGIN` int(18) DEFAULT NULL,
  `RIGHT_MARGIN` int(18) DEFAULT NULL,
  `DEPTH_LEVEL` int(18) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_section_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_section_depth_level` (`IBLOCK_ID`,`DEPTH_LEVEL`),
  KEY `ix_iblock_section_code` (`IBLOCK_ID`,`CODE`),
  KEY `ix_iblock_section_left_margin2` (`IBLOCK_ID`,`LEFT_MARGIN`),
  KEY `ix_iblock_section_right_margin2` (`IBLOCK_ID`,`RIGHT_MARGIN`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_iblock_section: ~2 rows (приблизительно)
DELETE FROM `b_iblock_section`;
INSERT INTO `b_iblock_section` (`ID`, `TIMESTAMP_X`, `MODIFIED_BY`, `DATE_CREATE`, `CREATED_BY`, `IBLOCK_ID`, `IBLOCK_SECTION_ID`, `ACTIVE`, `GLOBAL_ACTIVE`, `SORT`, `NAME`, `PICTURE`, `LEFT_MARGIN`, `RIGHT_MARGIN`, `DEPTH_LEVEL`, `DESCRIPTION`, `DESCRIPTION_TYPE`, `SEARCHABLE_CONTENT`, `CODE`, `XML_ID`, `TMP_ID`, `DETAIL_PICTURE`, `SOCNET_GROUP_ID`) VALUES
	(1, '2023-02-11 13:28:10', 1, '2023-02-11 20:28:10', 1, 6, NULL, 'Y', 'Y', 500, 'Младшие классы (1-4 класс)', NULL, 1, 2, 1, '', 'text', 'МЛАДШИЕ КЛАССЫ (1-4 КЛАСС)\r\n', '', NULL, NULL, NULL, NULL),
	(2, '2023-02-11 13:28:22', 1, '2023-02-11 20:28:22', 1, 6, NULL, 'Y', 'Y', 500, 'Старшие классы (5-11 класс)', NULL, 3, 4, 1, '', 'text', 'СТАРШИЕ КЛАССЫ (5-11 КЛАСС)\r\n', '', NULL, NULL, NULL, NULL);

-- Дамп структуры для таблица globus.b_iblock_section_element
CREATE TABLE IF NOT EXISTS `b_iblock_section_element` (
  `IBLOCK_SECTION_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `ADDITIONAL_PROPERTY_ID` int(18) DEFAULT NULL,
  UNIQUE KEY `ux_iblock_section_element` (`IBLOCK_SECTION_ID`,`IBLOCK_ELEMENT_ID`,`ADDITIONAL_PROPERTY_ID`),
  KEY `UX_IBLOCK_SECTION_ELEMENT2` (`IBLOCK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_iblock_section_element: ~1 rows (приблизительно)
DELETE FROM `b_iblock_section_element`;
INSERT INTO `b_iblock_section_element` (`IBLOCK_SECTION_ID`, `IBLOCK_ELEMENT_ID`, `ADDITIONAL_PROPERTY_ID`) VALUES
	(1, 12, NULL);

-- Дамп структуры для таблица globus.b_iblock_section_iprop
CREATE TABLE IF NOT EXISTS `b_iblock_section_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`SECTION_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_section_iprop_0` (`IPROP_ID`),
  KEY `ix_b_iblock_section_iprop_1` (`IBLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_iblock_section_iprop: ~0 rows (приблизительно)
DELETE FROM `b_iblock_section_iprop`;

-- Дамп структуры для таблица globus.b_iblock_section_property
CREATE TABLE IF NOT EXISTS `b_iblock_section_property` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `PROPERTY_ID` int(11) NOT NULL,
  `SMART_FILTER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAY_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAY_EXPANDED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_HINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`SECTION_ID`,`PROPERTY_ID`),
  KEY `ix_b_iblock_section_property_1` (`PROPERTY_ID`),
  KEY `ix_b_iblock_section_property_2` (`SECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_iblock_section_property: ~0 rows (приблизительно)
DELETE FROM `b_iblock_section_property`;

-- Дамп структуры для таблица globus.b_iblock_section_right
CREATE TABLE IF NOT EXISTS `b_iblock_section_right` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `RIGHT_ID` int(11) NOT NULL,
  `IS_INHERITED` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RIGHT_ID`,`SECTION_ID`),
  KEY `ix_b_iblock_section_right_1` (`SECTION_ID`,`IBLOCK_ID`),
  KEY `ix_b_iblock_section_right_2` (`IBLOCK_ID`,`RIGHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_iblock_section_right: ~0 rows (приблизительно)
DELETE FROM `b_iblock_section_right`;

-- Дамп структуры для таблица globus.b_iblock_sequence
CREATE TABLE IF NOT EXISTS `b_iblock_sequence` (
  `IBLOCK_ID` int(18) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SEQ_VALUE` int(11) DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_iblock_sequence: ~0 rows (приблизительно)
DELETE FROM `b_iblock_sequence`;

-- Дамп структуры для таблица globus.b_iblock_site
CREATE TABLE IF NOT EXISTS `b_iblock_site` (
  `IBLOCK_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_iblock_site: ~6 rows (приблизительно)
DELETE FROM `b_iblock_site`;
INSERT INTO `b_iblock_site` (`IBLOCK_ID`, `SITE_ID`) VALUES
	(1, 's1'),
	(2, 's1'),
	(3, 's1'),
	(4, 's1'),
	(5, 's1'),
	(6, 's1');

-- Дамп структуры для таблица globus.b_iblock_type
CREATE TABLE IF NOT EXISTS `b_iblock_type` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SECTIONS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_RSS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(18) NOT NULL DEFAULT 500,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_iblock_type: ~1 rows (приблизительно)
DELETE FROM `b_iblock_type`;
INSERT INTO `b_iblock_type` (`ID`, `SECTIONS`, `EDIT_FILE_BEFORE`, `EDIT_FILE_AFTER`, `IN_RSS`, `SORT`) VALUES
	('content', 'Y', '', '', 'N', 500),
	('documents', 'Y', '', '', 'N', 500),
	('rest_entity', 'Y', NULL, NULL, 'N', 1000);

-- Дамп структуры для таблица globus.b_iblock_type_lang
CREATE TABLE IF NOT EXISTS `b_iblock_type_lang` (
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_iblock_type_lang: ~5 rows (приблизительно)
DELETE FROM `b_iblock_type_lang`;
INSERT INTO `b_iblock_type_lang` (`IBLOCK_TYPE_ID`, `LID`, `NAME`, `SECTION_NAME`, `ELEMENT_NAME`) VALUES
	('rest_entity', 'ru', 'Хранилище данных для приложений', 'Разделы', 'Элементы'),
	('content', 'ru', 'Контент', 'Разделы', 'Элементы'),
	('content', 'en', 'Content', 'Sections', 'Elements'),
	('documents', 'ru', 'Документы', 'Разделы', 'Элементы'),
	('documents', 'en', 'Documents', 'Sections', 'Elements');

-- Дамп структуры для таблица globus.b_landing
CREATE TABLE IF NOT EXISTS `b_landing` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INITIATOR_APP_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RULE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `PUBLIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SYS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `VIEWS` int(18) NOT NULL DEFAULT 0,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TPL_ID` int(18) DEFAULT NULL,
  `TPL_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_ID` int(18) NOT NULL,
  `SITEMAP` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `FOLDER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `FOLDER_ID` int(18) DEFAULT NULL,
  `SEARCH_CONTENT` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(18) NOT NULL DEFAULT 1,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  `DATE_PUBLIC` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_LAND_CODE` (`CODE`),
  KEY `IX_B_LAND_ACTIVE` (`ACTIVE`),
  KEY `IX_B_LAND_DELETED` (`DELETED`),
  KEY `IX_B_LAND_SYS` (`SYS`),
  KEY `IX_B_LAND_XML_ID` (`XML_ID`),
  KEY `IX_B_LAND_SITE_ID` (`SITE_ID`),
  KEY `IX_B_LAND_SITEMAP` (`SITEMAP`),
  KEY `IX_B_LAND_FOLDER` (`FOLDER`),
  KEY `IX_B_LAND_FOLDER_ID` (`FOLDER_ID`),
  FULLTEXT KEY `IX_B_LANDING_SEARCH` (`SEARCH_CONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_landing: ~0 rows (приблизительно)
DELETE FROM `b_landing`;

-- Дамп структуры для таблица globus.b_landing_binding
CREATE TABLE IF NOT EXISTS `b_landing_binding` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `BINDING_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `BINDING_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_BINDING` (`BINDING_ID`,`BINDING_TYPE`),
  KEY `IX_B_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `IX_B_BINDING_TYPE` (`BINDING_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_landing_binding: ~0 rows (приблизительно)
DELETE FROM `b_landing_binding`;

-- Дамп структуры для таблица globus.b_landing_block
CREATE TABLE IF NOT EXISTS `b_landing_block` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(18) DEFAULT NULL,
  `LID` int(18) NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_ORIGINAL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TPL_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INITIATOR_APP_CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ANCHOR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) DEFAULT 500,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `PUBLIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DESIGNED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACCESS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'X',
  `SOURCE_PARAMS` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `SEARCH_CONTENT` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `ASSETS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `FAVORITE_META` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_BLOCK_LID` (`LID`),
  KEY `IX_B_BLOCK_CODE` (`CODE`),
  KEY `IX_B_BLOCK_ACTIVE` (`ACTIVE`),
  KEY `IX_B_BLOCK_PUBLIC` (`PUBLIC`,`DATE_CREATE`),
  KEY `IX_B_BLOCK_DELETED` (`DELETED`),
  FULLTEXT KEY `IX_B_BLOCK_SEARCH` (`SEARCH_CONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_landing_block: ~0 rows (приблизительно)
DELETE FROM `b_landing_block`;

-- Дамп структуры для таблица globus.b_landing_block_last_used
CREATE TABLE IF NOT EXISTS `b_landing_block_last_used` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `IX_B_BLOCK_LU_USER` (`USER_ID`),
  KEY `IX_B_BLOCK_LU_CODE` (`CODE`),
  KEY `IX_B_BLOCK_LU_USER_CODE` (`USER_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_landing_block_last_used: ~0 rows (приблизительно)
DELETE FROM `b_landing_block_last_used`;

-- Дамп структуры для таблица globus.b_landing_chat
CREATE TABLE IF NOT EXISTS `b_landing_chat` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CHAT_ID` int(18) NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `AVATAR` int(18) DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CHAT` (`CHAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_landing_chat: ~0 rows (приблизительно)
DELETE FROM `b_landing_chat`;

-- Дамп структуры для таблица globus.b_landing_chat_binding
CREATE TABLE IF NOT EXISTS `b_landing_chat_binding` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `INTERNAL_CHAT_ID` int(18) NOT NULL,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CHAT` (`INTERNAL_CHAT_ID`),
  KEY `IX_B_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_landing_chat_binding: ~0 rows (приблизительно)
DELETE FROM `b_landing_chat_binding`;

-- Дамп структуры для таблица globus.b_landing_cookies_agreement
CREATE TABLE IF NOT EXISTS `b_landing_cookies_agreement` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SITE_ID` int(18) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SITE` (`SITE_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_landing_cookies_agreement: ~0 rows (приблизительно)
DELETE FROM `b_landing_cookies_agreement`;

-- Дамп структуры для таблица globus.b_landing_demo
CREATE TABLE IF NOT EXISTS `b_landing_demo` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `APP_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TYPE` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `TPL_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `SHOW_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW2X` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW3X` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MANIFEST` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANG` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_TEMPLATE_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_DEMO_ACTIVE` (`ACTIVE`),
  KEY `IX_B_DEMO_SHOW_IN_LIST` (`SHOW_IN_LIST`),
  KEY `IX_B_DEMO_XML_ID` (`XML_ID`),
  KEY `IX_B_DEMO_APP_CODE` (`APP_CODE`),
  KEY `IX_B_DEMO_TEMPLATE_ID` (`SITE_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_landing_demo: ~0 rows (приблизительно)
DELETE FROM `b_landing_demo`;

-- Дамп структуры для таблица globus.b_landing_designer_repo
CREATE TABLE IF NOT EXISTS `b_landing_designer_repo` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) DEFAULT 100,
  `HTML` text COLLATE utf8_unicode_ci NOT NULL,
  `MANIFEST` text COLLATE utf8_unicode_ci NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_XML_ID` (`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_landing_designer_repo: ~0 rows (приблизительно)
DELETE FROM `b_landing_designer_repo`;

-- Дамп структуры для таблица globus.b_landing_domain
CREATE TABLE IF NOT EXISTS `b_landing_domain` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PREV_DOMAIN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROTOCOL` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `PROVIDER` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FAIL_COUNT` int(2) DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_DOMAIN_ACTIVE` (`ACTIVE`),
  KEY `IX_B_DOMAIN_DOMAIN` (`DOMAIN`),
  KEY `IX_B_DOMAIN_PROVIDER` (`PROVIDER`),
  KEY `IX_B_DOMAIN_XML_ID` (`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_landing_domain: ~0 rows (приблизительно)
DELETE FROM `b_landing_domain`;

-- Дамп структуры для таблица globus.b_landing_entity_lock
CREATE TABLE IF NOT EXISTS `b_landing_entity_lock` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `LOCK_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `IX_TYPE` (`LOCK_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_landing_entity_lock: ~0 rows (приблизительно)
DELETE FROM `b_landing_entity_lock`;

-- Дамп структуры для таблица globus.b_landing_entity_rights
CREATE TABLE IF NOT EXISTS `b_landing_entity_rights` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `ACCESS_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ROLE_ID` int(18) DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `IX_ROLE` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_landing_entity_rights: ~0 rows (приблизительно)
DELETE FROM `b_landing_entity_rights`;

-- Дамп структуры для таблица globus.b_landing_file
CREATE TABLE IF NOT EXISTS `b_landing_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_ID` int(18) NOT NULL,
  `TEMP` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `IX_FILE` (`FILE_ID`),
  KEY `IX_TEMP` (`TEMP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_landing_file: ~0 rows (приблизительно)
DELETE FROM `b_landing_file`;

-- Дамп структуры для таблица globus.b_landing_filter_block
CREATE TABLE IF NOT EXISTS `b_landing_filter_block` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FILTER_ID` int(18) NOT NULL,
  `BLOCK_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_FILTER_BLOCK` (`FILTER_ID`,`BLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_landing_filter_block: ~0 rows (приблизительно)
DELETE FROM `b_landing_filter_block`;

-- Дамп структуры для таблица globus.b_landing_filter_entity
CREATE TABLE IF NOT EXISTS `b_landing_filter_entity` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `SOURCE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER_HASH` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_FILTER_HASH` (`FILTER_HASH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_landing_filter_entity: ~0 rows (приблизительно)
DELETE FROM `b_landing_filter_entity`;

-- Дамп структуры для таблица globus.b_landing_folder
CREATE TABLE IF NOT EXISTS `b_landing_folder` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(18) DEFAULT NULL,
  `SITE_ID` int(18) NOT NULL,
  `INDEX_ID` int(18) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FOLDER_SITE_ID` (`SITE_ID`),
  KEY `IX_B_FOLDER_ACTIVE` (`ACTIVE`),
  KEY `IX_B_FOLDER_DELETED` (`DELETED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_landing_folder: ~0 rows (приблизительно)
DELETE FROM `b_landing_folder`;

-- Дамп структуры для таблица globus.b_landing_hook_data
CREATE TABLE IF NOT EXISTS `b_landing_hook_data` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `HOOK` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `PUBLIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `K_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `K_HOOK_CODE` (`HOOK`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_landing_hook_data: ~0 rows (приблизительно)
DELETE FROM `b_landing_hook_data`;

-- Дамп структуры для таблица globus.b_landing_placement
CREATE TABLE IF NOT EXISTS `b_landing_placement` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(18) DEFAULT NULL,
  `PLACEMENT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PLACEMENT_HANDLER` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_landing_placement: ~0 rows (приблизительно)
DELETE FROM `b_landing_placement`;

-- Дамп структуры для таблица globus.b_landing_repo
CREATE TABLE IF NOT EXISTS `b_landing_repo` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `APP_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTIONS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_TEMPLATE_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MANIFEST` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` text COLLATE utf8_unicode_ci NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_REPO_ACTIVE` (`ACTIVE`),
  KEY `IX_B_REPO_XML_ID` (`XML_ID`),
  KEY `IX_B_REPO_APP_CODE` (`APP_CODE`),
  KEY `IX_B_REPO_TEMPLATE_ID` (`SITE_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_landing_repo: ~0 rows (приблизительно)
DELETE FROM `b_landing_repo`;

-- Дамп структуры для таблица globus.b_landing_role
CREATE TABLE IF NOT EXISTS `b_landing_role` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCESS_CODES` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADDITIONAL_RIGHTS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `IX_B_ROLE_TYPE` (`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_landing_role: ~0 rows (приблизительно)
DELETE FROM `b_landing_role`;

-- Дамп структуры для таблица globus.b_landing_site
CREATE TABLE IF NOT EXISTS `b_landing_site` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'PAGE',
  `TPL_ID` int(18) DEFAULT NULL,
  `TPL_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DOMAIN_ID` int(18) NOT NULL,
  `SMN_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANDING_ID_INDEX` int(18) DEFAULT NULL,
  `LANDING_ID_404` int(18) DEFAULT NULL,
  `LANDING_ID_503` int(18) DEFAULT NULL,
  `LANG` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SPECIAL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `VERSION` int(18) DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SITE_CODE` (`CODE`),
  KEY `IX_B_SITE_ACTIVE` (`ACTIVE`),
  KEY `IX_B_SITE_DELETED` (`DELETED`),
  KEY `IX_B_SITE_XML_ID` (`XML_ID`),
  KEY `IX_B_SITE_SPECIAL` (`SPECIAL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_landing_site: ~0 rows (приблизительно)
DELETE FROM `b_landing_site`;

-- Дамп структуры для таблица globus.b_landing_syspage
CREATE TABLE IF NOT EXISTS `b_landing_syspage` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `SITE_ID` int(18) NOT NULL,
  `TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LANDING_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_SITE_ID` (`SITE_ID`),
  KEY `IX_LANDING_ID` (`LANDING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_landing_syspage: ~0 rows (приблизительно)
DELETE FROM `b_landing_syspage`;

-- Дамп структуры для таблица globus.b_landing_template
CREATE TABLE IF NOT EXISTS `b_landing_template` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(18) DEFAULT 100,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` text COLLATE utf8_unicode_ci NOT NULL,
  `AREA_COUNT` int(2) NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_landing_template: ~7 rows (приблизительно)
DELETE FROM `b_landing_template`;
INSERT INTO `b_landing_template` (`ID`, `ACTIVE`, `TITLE`, `SORT`, `XML_ID`, `CONTENT`, `AREA_COUNT`, `CREATED_BY_ID`, `MODIFIED_BY_ID`, `DATE_CREATE`, `DATE_MODIFY`) VALUES
	(1, 'Y', '#EMPTY#', 100, 'empty', '#CONTENT#', 0, 1, 1, '2023-02-10 03:17:52', '2023-02-10 03:17:52'),
	(2, 'Y', '#SIDEBAR_LEFT#', 200, 'sidebar_left', '<div class="landing-layout-flex">\n								<div class="landing-sidebar g-max-width-100x g-overflow-hidden">#AREA_1#</div>\n								<div class="landing-main g-max-width-100x">#CONTENT#</div>\n							</div>', 1, 1, 1, '2023-02-10 03:17:52', '2023-02-10 03:17:52'),
	(3, 'Y', '#SIDEBAR_RIGHT#', 300, 'sidebar_right', '<div class="landing-layout-flex sidebar-right">\n								<div class="landing-sidebar g-max-width-100x">#AREA_1#</div>\n								<div class="landing-main g-max-width-100x">#CONTENT#</div>\n							</div>', 1, 1, 1, '2023-02-10 03:17:52', '2023-02-10 03:17:52'),
	(4, 'Y', '#HEADER_ONLY#', 400, 'header_only', '<div class="landing-header">#AREA_1#</div> \n								<div class="landing-main">#CONTENT#</div>', 1, 1, 1, '2023-02-10 03:17:52', '2023-02-10 03:17:52'),
	(5, 'Y', '#HEADER_FOOTER#', 500, 'header_footer', '<div class="landing-header">#AREA_1#</div> \n								<div class="landing-main">#CONTENT#</div> \n							<div class="landing-footer">#AREA_2#</div>', 2, 1, 1, '2023-02-10 03:17:52', '2023-02-10 03:17:52'),
	(6, 'Y', '#WITHOUT_LEFT#', 600, 'without_left', '<div class="landing-header">#AREA_1#</div>\n								<div class="landing-layout-flex without-left">\n									<div class="landing-sidebar g-max-width-100x">#AREA_2#</div>\n									<div class="landing-main g-max-width-100x">#CONTENT#</div>\n								</div>\n							<div class="landing-footer">#AREA_3#</div>', 3, 1, 1, '2023-02-10 03:17:52', '2023-02-10 03:17:52'),
	(7, 'Y', '#WITHOUT_RIGHT#', 700, 'without_right', '<div class="landing-header">#AREA_1#</div>\n								<div class="landing-layout-flex">\n									<div class="landing-sidebar g-max-width-100x">#AREA_2#</div>\n									<div class="landing-main g-max-width-100x">#CONTENT#</div>\n								</div>\n							<div class="landing-footer">#AREA_3#</div>', 3, 1, 1, '2023-02-10 03:17:52', '2023-02-10 03:17:52');

-- Дамп структуры для таблица globus.b_landing_template_ref
CREATE TABLE IF NOT EXISTS `b_landing_template_ref` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `AREA` int(2) NOT NULL,
  `LANDING_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `K_LANDING_ID` (`LANDING_ID`),
  KEY `K_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_landing_template_ref: ~0 rows (приблизительно)
DELETE FROM `b_landing_template_ref`;

-- Дамп структуры для таблица globus.b_landing_update_block
CREATE TABLE IF NOT EXISTS `b_landing_update_block` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_BLOCK_ID` int(18) DEFAULT 0,
  `PARAMS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_landing_update_block: ~0 rows (приблизительно)
DELETE FROM `b_landing_update_block`;

-- Дамп структуры для таблица globus.b_landing_urlchecker_host
CREATE TABLE IF NOT EXISTS `b_landing_urlchecker_host` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `STATUS_ID` int(18) NOT NULL,
  `HOST` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `IX_B_CHECKER_STATUS_HOST` (`STATUS_ID`,`HOST`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_landing_urlchecker_host: ~0 rows (приблизительно)
DELETE FROM `b_landing_urlchecker_host`;

-- Дамп структуры для таблица globus.b_landing_urlchecker_status
CREATE TABLE IF NOT EXISTS `b_landing_urlchecker_status` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `HASH` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `STATUS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `IX_B_CHECKER_HASH` (`HASH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_landing_urlchecker_status: ~0 rows (приблизительно)
DELETE FROM `b_landing_urlchecker_status`;

-- Дамп структуры для таблица globus.b_landing_urlchecker_whitelist
CREATE TABLE IF NOT EXISTS `b_landing_urlchecker_whitelist` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `IX_B_CHECKER_DOMAIN` (`DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_landing_urlchecker_whitelist: ~0 rows (приблизительно)
DELETE FROM `b_landing_urlchecker_whitelist`;

-- Дамп структуры для таблица globus.b_landing_urlrewrite
CREATE TABLE IF NOT EXISTS `b_landing_urlrewrite` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `SITE_ID` int(18) NOT NULL,
  `RULE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LANDING_ID` int(18) NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_SITE_RULE` (`SITE_ID`,`RULE`),
  KEY `IX_LANDING_ID` (`LANDING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_landing_urlrewrite: ~0 rows (приблизительно)
DELETE FROM `b_landing_urlrewrite`;

-- Дамп структуры для таблица globus.b_landing_view
CREATE TABLE IF NOT EXISTS `b_landing_view` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `LID` int(18) NOT NULL,
  `USER_ID` int(18) NOT NULL,
  `VIEWS` int(18) NOT NULL,
  `FIRST_VIEW` datetime NOT NULL,
  `LAST_VIEW` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_VIEW_LIDUID` (`LID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_landing_view: ~0 rows (приблизительно)
DELETE FROM `b_landing_view`;

-- Дамп структуры для таблица globus.b_lang
CREATE TABLE IF NOT EXISTS `b_lang` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT 100,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DIR` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT NULL,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DOC_ROOT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DOMAIN_LIMITED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SERVER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CULTURE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_lang: ~0 rows (приблизительно)
DELETE FROM `b_lang`;
INSERT INTO `b_lang` (`LID`, `SORT`, `DEF`, `ACTIVE`, `NAME`, `DIR`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `LANGUAGE_ID`, `DOC_ROOT`, `DOMAIN_LIMITED`, `SERVER_NAME`, `SITE_NAME`, `EMAIL`, `CULTURE_ID`) VALUES
	('s1', 1, 'Y', 'Y', 'Сайт по умолчанию', '/', NULL, NULL, NULL, NULL, NULL, 'ru', '', 'N', '', '', '', 1);

-- Дамп структуры для таблица globus.b_language
CREATE TABLE IF NOT EXISTS `b_language` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT 100,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT NULL,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CULTURE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_language: ~2 rows (приблизительно)
DELETE FROM `b_language`;
INSERT INTO `b_language` (`LID`, `SORT`, `DEF`, `ACTIVE`, `NAME`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `DIRECTION`, `CULTURE_ID`) VALUES
	('en', 2, 'N', 'Y', 'English', NULL, NULL, NULL, NULL, NULL, NULL, 2),
	('ru', 1, 'Y', 'Y', 'Russian', NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- Дамп структуры для таблица globus.b_lang_domain
CREATE TABLE IF NOT EXISTS `b_lang_domain` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`LID`,`DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_lang_domain: ~0 rows (приблизительно)
DELETE FROM `b_lang_domain`;

-- Дамп структуры для таблица globus.b_list_rubric
CREATE TABLE IF NOT EXISTS `b_list_rubric` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT 100,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `AUTO` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DAYS_OF_MONTH` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DAYS_OF_WEEK` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMES_OF_DAY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEMPLATE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_EXECUTED` datetime DEFAULT NULL,
  `VISIBLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `FROM_FIELD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_list_rubric: ~0 rows (приблизительно)
DELETE FROM `b_list_rubric`;

-- Дамп структуры для таблица globus.b_log_notification
CREATE TABLE IF NOT EXISTS `b_log_notification` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUDIT_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `REMOTE_ADDR` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_AGENT` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_URI` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CHECK_INTERVAL` int(11) DEFAULT NULL,
  `ALERT_COUNT` int(11) DEFAULT NULL,
  `DATE_CHECKED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_log_notification: ~0 rows (приблизительно)
DELETE FROM `b_log_notification`;

-- Дамп структуры для таблица globus.b_log_notification_action
CREATE TABLE IF NOT EXISTS `b_log_notification_action` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NOTIFICATION_ID` int(10) unsigned NOT NULL,
  `NOTIFICATION_TYPE` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `RECIPIENT` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADDITIONAL_TEXT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_log_notification_action_notification_id` (`NOTIFICATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_log_notification_action: ~0 rows (приблизительно)
DELETE FROM `b_log_notification_action`;

-- Дамп структуры для таблица globus.b_main_mail_blacklist
CREATE TABLE IF NOT EXISTS `b_main_mail_blacklist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `CATEGORY_ID` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B_MAIN_MAIL_BLACKLIST_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_main_mail_blacklist: ~0 rows (приблизительно)
DELETE FROM `b_main_mail_blacklist`;

-- Дамп структуры для таблица globus.b_main_mail_sender
CREATE TABLE IF NOT EXISTS `b_main_mail_sender` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `IS_CONFIRMED` tinyint(4) NOT NULL DEFAULT 0,
  `IS_PUBLIC` tinyint(4) NOT NULL DEFAULT 0,
  `OPTIONS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_MAIN_MAIL_SENDER_USER_ID` (`USER_ID`,`IS_CONFIRMED`,`IS_PUBLIC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_main_mail_sender: ~0 rows (приблизительно)
DELETE FROM `b_main_mail_sender`;

-- Дамп структуры для таблица globus.b_main_mail_sender_send_counter
CREATE TABLE IF NOT EXISTS `b_main_mail_sender_send_counter` (
  `DATE_STAT` date NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CNT` int(11) NOT NULL,
  PRIMARY KEY (`DATE_STAT`,`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_main_mail_sender_send_counter: ~0 rows (приблизительно)
DELETE FROM `b_main_mail_sender_send_counter`;

-- Дамп структуры для таблица globus.b_medialib_collection
CREATE TABLE IF NOT EXISTS `b_medialib_collection` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DATE_UPDATE` datetime NOT NULL,
  `OWNER_ID` int(11) DEFAULT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEMS_COUNT` int(11) DEFAULT NULL,
  `ML_TYPE` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_medialib_collection: ~0 rows (приблизительно)
DELETE FROM `b_medialib_collection`;

-- Дамп структуры для таблица globus.b_medialib_collection_item
CREATE TABLE IF NOT EXISTS `b_medialib_collection_item` (
  `COLLECTION_ID` int(11) NOT NULL,
  `ITEM_ID` int(11) NOT NULL,
  PRIMARY KEY (`ITEM_ID`,`COLLECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_medialib_collection_item: ~0 rows (приблизительно)
DELETE FROM `b_medialib_collection_item`;

-- Дамп структуры для таблица globus.b_medialib_item
CREATE TABLE IF NOT EXISTS `b_medialib_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_TYPE` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `SOURCE_ID` int(11) NOT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_medialib_item: ~0 rows (приблизительно)
DELETE FROM `b_medialib_item`;

-- Дамп структуры для таблица globus.b_medialib_type
CREATE TABLE IF NOT EXISTS `b_medialib_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SYSTEM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_medialib_type: ~3 rows (приблизительно)
DELETE FROM `b_medialib_type`;
INSERT INTO `b_medialib_type` (`ID`, `NAME`, `CODE`, `EXT`, `SYSTEM`, `DESCRIPTION`) VALUES
	(1, 'image_name', 'image', 'jpg,jpeg,gif,png', 'Y', 'image_desc'),
	(2, 'video_name', 'video', 'flv,mp4,wmv', 'Y', 'video_desc'),
	(3, 'sound_name', 'sound', 'mp3,wma,aac', 'Y', 'sound_desc');

-- Дамп структуры для таблица globus.b_messageservice_message
CREATE TABLE IF NOT EXISTS `b_messageservice_message` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `SENDER_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `AUTHOR_ID` int(18) NOT NULL DEFAULT 0,
  `MESSAGE_FROM` varchar(260) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE_TO` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_HEADERS` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE_BODY` longtext COLLATE utf8_unicode_ci NOT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `NEXT_EXEC` datetime DEFAULT NULL,
  `SUCCESS_EXEC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `EXEC_ERROR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STATUS_ID` int(18) NOT NULL DEFAULT 0,
  `EXTERNAL_ID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXTERNAL_STATUS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `B_MESSAGESERVICE_MESSAGE_1` (`DATE_EXEC`),
  KEY `B_MESSAGESERVICE_MESSAGE_2` (`SUCCESS_EXEC`),
  KEY `B_MESSAGESERVICE_MESSAGE_3` (`SENDER_ID`,`EXTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_messageservice_message: ~0 rows (приблизительно)
DELETE FROM `b_messageservice_message`;

-- Дамп структуры для таблица globus.b_messageservice_rest_app
CREATE TABLE IF NOT EXISTS `b_messageservice_rest_app` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `APP_ID` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `HANDLER` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_ADD` datetime DEFAULT NULL,
  `AUTHOR_ID` int(18) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `B_MESSAGESERVICE_REST_APP_1` (`APP_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_messageservice_rest_app: ~0 rows (приблизительно)
DELETE FROM `b_messageservice_rest_app`;

-- Дамп структуры для таблица globus.b_messageservice_rest_app_lang
CREATE TABLE IF NOT EXISTS `b_messageservice_rest_app_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(18) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APP_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_messageservice_rest_app_lang: ~0 rows (приблизительно)
DELETE FROM `b_messageservice_rest_app_lang`;

-- Дамп структуры для таблица globus.b_mobileapp_app
CREATE TABLE IF NOT EXISTS `b_mobileapp_app` (
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SHORT_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci NOT NULL,
  `FILES` text COLLATE utf8_unicode_ci NOT NULL,
  `LAUNCH_ICONS` text COLLATE utf8_unicode_ci NOT NULL,
  `LAUNCH_SCREENS` text COLLATE utf8_unicode_ci NOT NULL,
  `FOLDER` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_mobileapp_app: ~0 rows (приблизительно)
DELETE FROM `b_mobileapp_app`;

-- Дамп структуры для таблица globus.b_mobileapp_config
CREATE TABLE IF NOT EXISTS `b_mobileapp_config` (
  `APP_CODE` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `PLATFORM` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  PRIMARY KEY (`APP_CODE`,`PLATFORM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_mobileapp_config: ~0 rows (приблизительно)
DELETE FROM `b_mobileapp_config`;

-- Дамп структуры для таблица globus.b_module
CREATE TABLE IF NOT EXISTS `b_module` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_ACTIVE` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_module: ~28 rows (приблизительно)
DELETE FROM `b_module`;
INSERT INTO `b_module` (`ID`, `DATE_ACTIVE`) VALUES
	('b24connector', NULL),
	('bitrix.sitecorporate', NULL),
	('bitrix.siteinfoportal', NULL),
	('bitrix.sitepersonal', NULL),
	('bitrixcloud', NULL),
	('blog', NULL),
	('clouds', NULL),
	('fileman', NULL),
	('form', NULL),
	('forum', NULL),
	('highloadblock', NULL),
	('iblock', NULL),
	('landing', NULL),
	('main', NULL),
	('messageservice', NULL),
	('mobileapp', NULL),
	('perfmon', NULL),
	('photogallery', NULL),
	('rest', NULL),
	('scale', NULL),
	('search', NULL),
	('security', NULL),
	('seo', NULL),
	('socialservices', NULL),
	('subscribe', NULL),
	('translate', NULL),
	('ui', NULL),
	('vote', NULL);

-- Дамп структуры для таблица globus.b_module_group
CREATE TABLE IF NOT EXISTS `b_module_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `G_ACCESS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_GROUP_MODULE` (`MODULE_ID`,`GROUP_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_module_group: ~0 rows (приблизительно)
DELETE FROM `b_module_group`;

-- Дамп структуры для таблица globus.b_module_to_module
CREATE TABLE IF NOT EXISTS `b_module_to_module` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT 100,
  `FROM_MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TO_MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TO_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_CLASS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_METHOD_ARG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `UNIQUE_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_module_to_module_unique_id` (`UNIQUE_ID`),
  KEY `ix_module_to_module` (`FROM_MODULE_ID`(20),`MESSAGE_ID`(20),`TO_MODULE_ID`(20),`TO_CLASS`(20),`TO_METHOD`(20))
) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_module_to_module: ~321 rows (приблизительно)
DELETE FROM `b_module_to_module`;
INSERT INTO `b_module_to_module` (`ID`, `TIMESTAMP_X`, `SORT`, `FROM_MODULE_ID`, `MESSAGE_ID`, `TO_MODULE_ID`, `TO_PATH`, `TO_CLASS`, `TO_METHOD`, `TO_METHOD_ARG`, `VERSION`, `UNIQUE_ID`) VALUES
	(1, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'main', '/modules/main/tools/prop_userid.php', 'CIBlockPropertyUserID', 'GetUserTypeDescription', '', 1, '2b30c309bf87645959b9bfbed51b49c6'),
	(2, NULL, 100, 'main', 'OnUserDelete', 'main', '/modules/main/classes/mysql/favorites.php', 'CFavorites', 'OnUserDelete', '', 1, 'f437e170e4daf957766b0b0579f08fb4'),
	(3, NULL, 100, 'main', 'OnLanguageDelete', 'main', '/modules/main/classes/mysql/favorites.php', 'CFavorites', 'OnLanguageDelete', '', 1, '9211999c5cfc3a4d374e4f957d5079f6'),
	(4, NULL, 100, 'main', 'OnUserDelete', 'main', '', 'CUserOptions', 'OnUserDelete', '', 1, '9ef4e969f975b6425c7113444d210a90'),
	(5, NULL, 100, 'main', 'OnChangeFile', 'main', '', 'CMain', 'OnChangeFileComponent', '', 1, '332179402f77c4d41c6c2e524acde4d0'),
	(6, NULL, 100, 'main', 'OnUserTypeRightsCheck', 'main', '', 'CUser', 'UserTypeRightsCheck', '', 1, 'e1aae03ea8eb08e7bbb6d8d42cbc2ebe'),
	(7, NULL, 100, 'main', 'OnUserLogin', 'main', '', 'UpdateTools', 'CheckUpdates', '', 1, 'a2986b9f6e9a99c0351c2ba858dafc85'),
	(8, NULL, 100, 'main', 'OnModuleUpdate', 'main', '', 'UpdateTools', 'SetUpdateResult', '', 1, 'f9b70c6a75b6341063b23bde5d32e582'),
	(9, NULL, 100, 'main', 'OnUpdateCheck', 'main', '', 'UpdateTools', 'SetUpdateError', '', 1, 'a0aecef95a192ec3dd134f71f0f4f175'),
	(10, NULL, 100, 'main', 'OnPanelCreate', 'main', '', 'CUndo', 'CheckNotifyMessage', '', 1, '6476f96ffba6ab2b4a7dbe644f42edf6'),
	(11, NULL, 100, 'main', 'OnAfterAddRating', 'main', '', 'CRatingsComponentsMain', 'OnAfterAddRating', '', 1, '6122bee2ad083f8f72e35655cee48859'),
	(12, NULL, 100, 'main', 'OnAfterUpdateRating', 'main', '', 'CRatingsComponentsMain', 'OnAfterUpdateRating', '', 1, 'f8f806e33dc35737bdbe6b9bc42626a4'),
	(13, NULL, 100, 'main', 'OnSetRatingsConfigs', 'main', '', 'CRatingsComponentsMain', 'OnSetRatingConfigs', '', 1, '9244ca7fd6964757ca191c9407cb1218'),
	(14, NULL, 100, 'main', 'OnGetRatingsConfigs', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingConfigs', '', 1, 'd8ae8e1f8889b1fbb6af276fb14c8411'),
	(15, NULL, 100, 'main', 'OnGetRatingsObjects', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingObject', '', 1, '129315715250c195ee115002b445a156'),
	(16, NULL, 100, 'main', 'OnGetRatingContentOwner', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingContentOwner', '', 1, 'bf1f5deaa1532fe9a28acd6d19d23a80'),
	(17, NULL, 100, 'main', 'OnAfterAddRatingRule', 'main', '', 'CRatingRulesMain', 'OnAfterAddRatingRule', '', 1, '298e763431f7f7d6c3af9798663f410d'),
	(18, NULL, 100, 'main', 'OnAfterUpdateRatingRule', 'main', '', 'CRatingRulesMain', 'OnAfterUpdateRatingRule', '', 1, '4ecdc4a15e24c49f0fa8f44064bf1511'),
	(19, NULL, 100, 'main', 'OnGetRatingRuleObjects', 'main', '', 'CRatingRulesMain', 'OnGetRatingRuleObjects', '', 1, '6ac10928b76183004ba0e88ace0a1b5b'),
	(20, NULL, 100, 'main', 'OnGetRatingRuleConfigs', 'main', '', 'CRatingRulesMain', 'OnGetRatingRuleConfigs', '', 1, '06769c4f6bbba4fad79c1619a874ee97'),
	(21, NULL, 100, 'main', 'OnAfterUserAdd', 'main', '', 'CRatings', 'OnAfterUserRegister', '', 1, 'ecb9ae0476db69da6c95b06bcb3aebbb'),
	(22, NULL, 100, 'main', 'OnUserDelete', 'main', '', 'CRatings', 'OnUserDelete', '', 1, '9fe6984fd29b7ab9508ac02c23690094'),
	(23, NULL, 100, 'main', 'OnAfterGroupAdd', 'main', '', 'CGroupAuthProvider', 'OnAfterGroupAdd', '', 1, '02f2fe70b9068a6b307192321fe74430'),
	(24, NULL, 100, 'main', 'OnBeforeGroupUpdate', 'main', '', 'CGroupAuthProvider', 'OnBeforeGroupUpdate', '', 1, 'ef0f2e4d0ae7bbf59d0798e8078143f9'),
	(25, NULL, 100, 'main', 'OnBeforeGroupDelete', 'main', '', 'CGroupAuthProvider', 'OnBeforeGroupDelete', '', 1, 'd3ec9527c0e77709402a05ae4249afca'),
	(26, NULL, 100, 'main', 'OnAfterSetUserGroup', 'main', '', 'CGroupAuthProvider', 'OnAfterSetUserGroup', '', 1, '0de6c5b48e9382f6e857d79f76d95f25'),
	(27, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'main', '', 'CEventMain', 'GetAuditTypes', '', 1, 'ac0b8b7a5e703131a3bd41b4399bc032'),
	(28, NULL, 100, 'main', 'OnEventLogGetAuditHandlers', 'main', '', 'CEventMain', 'MakeMainObject', '', 1, '1ddb38ccf35a8a9da5d3b2bc80591ad6'),
	(29, NULL, 100, 'perfmon', 'OnGetTableSchema', 'main', '', 'CTableSchema', 'OnGetTableSchema', '', 1, 'c1f65f88d449e8b8a3b7af9d54ef3f50'),
	(30, NULL, 100, 'sender', 'OnConnectorList', 'main', '', '\\Bitrix\\Main\\SenderEventHandler', 'onConnectorListUser', '', 1, '8af99568465a1ccdb6a84e868cf5aad8'),
	(31, NULL, 110, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeString', 'GetUserTypeDescription', '', 1, '09f8200652932044934bd3c522e920c5'),
	(32, NULL, 120, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeInteger', 'GetUserTypeDescription', '', 1, '71ef247b3eb3b07e4bd6940791b89497'),
	(33, NULL, 130, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDouble', 'GetUserTypeDescription', '', 1, '4fe2008255fe567423cc0c2f080ca741'),
	(34, NULL, 140, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDateTime', 'GetUserTypeDescription', '', 1, '686c0679e60bee52dbcc27f5502277b6'),
	(35, NULL, 145, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDate', 'GetUserTypeDescription', '', 1, '7e19b5fc5fc48b1cd317a6ac44d84236'),
	(36, NULL, 150, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeBoolean', 'GetUserTypeDescription', '', 1, '4d5e1dd2369089f2db9480549241205f'),
	(37, NULL, 155, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeUrl', 'GetUserTypeDescription', '', 1, '79fcd650625b296abf13216cd5af2428'),
	(38, NULL, 160, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeFile', 'GetUserTypeDescription', '', 1, '67b9a4fbc45240a7887b73e3a246eba0'),
	(39, NULL, 170, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeEnum', 'GetUserTypeDescription', '', 1, 'fbebdb289fe38c1fbfeda4d3d8ee43ef'),
	(40, NULL, 180, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeIBlockSection', 'GetUserTypeDescription', '', 1, '2065f8305645790970bac0b99f127f47'),
	(41, NULL, 190, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeIBlockElement', 'GetUserTypeDescription', '', 1, '65bda5818e3545f1683a3ff5271cc891'),
	(42, NULL, 200, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeStringFormatted', 'GetUserTypeDescription', '', 1, '47e3cf1c280e01dbaed43f9989a6747b'),
	(43, NULL, 210, 'main', 'OnUserTypeBuildList', 'main', '', '\\Bitrix\\Main\\UrlPreview\\UrlPreviewUserType', 'getUserTypeDescription', '', 1, '719d15ee5f60f6348d2bd6a8911aeed1'),
	(44, NULL, 100, 'main', 'OnBeforeEndBufferContent', 'main', '', '\\Bitrix\\Main\\Analytics\\Counter', 'onBeforeEndBufferContent', '', 1, 'ff5eb984fe6ce3e8d769bf3ba646b902'),
	(45, NULL, 100, 'main', 'OnBeforeRestartBuffer', 'main', '', '\\Bitrix\\Main\\Analytics\\Counter', 'onBeforeRestartBuffer', '', 1, '0782f5a6df6dd52d834caea88c3ba3a7'),
	(46, NULL, 100, 'main', 'OnFileDelete', 'main', '', '\\Bitrix\\Main\\UI\\Viewer\\FilePreviewTable', 'onFileDelete', '', 1, '54c80cd94412db221338aeb59902f059'),
	(47, NULL, 100, 'socialnetwork', 'OnSocNetLogDelete', 'main', '', 'CUserCounter', 'OnSocNetLogDelete', '', 1, '33e603755a0bc07abd51a1f8ed52966e'),
	(48, NULL, 100, 'socialnetwork', 'OnSocNetLogCommentDelete', 'main', '', 'CUserCounter', 'OnSocNetLogCommentDelete', '', 1, '51ee2214895be904a880046f43e84138'),
	(49, NULL, 100, 'main', 'OnAdminInformerInsertItems', 'main', '', 'CMpNotifications', 'OnAdminInformerInsertItemsHandlerMP', '', 1, 'c89c0e94ac1110c334a24c70e1773daa'),
	(50, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'main', '', '\\Bitrix\\Main\\Rest\\Handlers', 'onRestServiceBuildDescription', '', 1, 'c0b0c358a21b648d4f9c5d29d17a5ab2'),
	(51, NULL, 100, 'main', 'OnBeforeUserTypeAdd', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'OnBeforeUserTypeAdd', '', 1, 'e204684efc0764af9431ca94b950619a'),
	(52, NULL, 100, 'main', 'OnAfterUserTypeAdd', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'onAfterUserTypeAdd', '', 1, '50932fb244caf7af686fac906caf3e73'),
	(53, NULL, 100, 'main', 'OnBeforeUserTypeDelete', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'OnBeforeUserTypeDelete', '', 1, 'd22a86deba0ff4bd031d022e331033b4'),
	(54, NULL, 100, 'main', 'OnAuthProvidersBuildList', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\AccessAuthProvider', 'getProviders', '', 1, '3a2839dac113bf47bce01812903e768a'),
	(55, NULL, 100, 'iblock', 'OnBeforeIBlockSectionUpdate', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\AccessEventHandler', 'onBeforeIBlockSectionUpdate', '', 1, 'dde505dba68c59bd4661b7680c329485'),
	(56, NULL, 100, 'iblock', 'OnBeforeIBlockSectionAdd', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\AccessEventHandler', 'onBeforeIBlockSectionAdd', '', 1, 'd3a665b1890dabbba32ff01e3e46ec57'),
	(57, NULL, 100, 'iblock', 'OnBeforeIBlockSectionDelete', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\AccessEventHandler', 'onBeforeIBlockSectionDelete', '', 1, '157add4b02621a60fabf1369c3e7ea9b'),
	(58, NULL, 100, 'sale', 'OnSaleBasketItemSaved', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogBasket', '', 2, 'fa4fc3924ff2585e92f8bdabaf287864'),
	(59, NULL, 100, 'sale', 'OnSaleOrderSaved', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogOrder', '', 2, '6b358bb17b30da91b105fb1451ed9aaa'),
	(60, NULL, 100, 'sale', 'OnSaleOrderPaid', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogOrderPayment', '', 2, '8f5ca6e1c5136cb4bbf30474f0ff4183'),
	(61, NULL, 1000, 'sale', 'onBuildDiscountConditionInterfaceControls', 'main', '', '\\Bitrix\\Main\\Discount\\UserConditionControl', 'onBuildDiscountConditionInterfaceControls', '', 1, '9f0d91c081704e52b52f540b3acaf52e'),
	(62, NULL, 100, 'main', 'OnBeforePhpMail', 'main', '', '\\Bitrix\\Main\\Mail\\Sender', 'applyCustomSmtp', '', 2, '10fbf5b8dec05a02d8d7010e594f16ec'),
	(63, NULL, 100, 'main', 'OnBuildFilterFactoryMethods', 'main', '', '\\Bitrix\\Main\\Filter\\FactoryMain', 'onBuildFilterFactoryMethods', '', 2, '19f10c2686a955bd8b8116ea1f1ad829'),
	(64, NULL, 100, 'main', 'onGetUserFieldValues', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'onGetUserFieldValues', '', 2, '7f9a5e25d638a6bff29f0bf4666da1a9'),
	(65, NULL, 100, 'main', 'onUpdateUserFieldValues', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'onUpdateUserFieldValues', '', 2, 'd78761f994d74258421d271810f03ebf'),
	(66, NULL, 100, 'main', 'onDeleteUserFieldValues', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'onDeleteUserFieldValues', '', 2, '074b2e25238a00ffc809ad12b609db2c'),
	(67, NULL, 100, 'main', 'OnAfterUserTypeAdd', 'main', '', '\\Bitrix\\Main\\ORM\\Entity', 'onUserTypeChange', '', 2, '37b1b1538fa6a6c5f41c9ce4afbf2789'),
	(68, NULL, 100, 'main', 'OnAfterUserTypeUpdate', 'main', '', '\\Bitrix\\Main\\ORM\\Entity', 'onUserTypeChange', '', 2, '6a53bbd6e85686f4aa8a69d3d75f7e37'),
	(69, NULL, 100, 'main', 'OnAfterUserTypeDelete', 'main', '', '\\Bitrix\\Main\\ORM\\Entity', 'onUserTypeChange', '', 2, '010cc1e3107418a1fd9f9a4cde7d93b9'),
	(70, NULL, 100, 'main', 'OnBuildGlobalMenu', 'b24connector', '', '\\Bitrix\\B24Connector\\Helper', 'onBuildGlobalMenu', '', 1, '9c4452a442bacc2d4d70635962485be1'),
	(71, NULL, 100, 'main', 'OnBeforeProlog', 'b24connector', '', '\\Bitrix\\B24Connector\\Helper', 'onBeforeProlog', '', 1, '641053ff6ee8ff57518d7c30724530e5'),
	(72, NULL, 100, 'main', 'OnBeforeProlog', 'bitrix.sitecorporate', '', 'CSiteCorporate', 'ShowPanel', '', 1, 'bc7c322534797a9ed3493c40e1b8fdac'),
	(73, NULL, 100, 'main', 'OnBeforeProlog', 'bitrix.siteinfoportal', '', 'CSiteInfoportal', 'ShowPanel', '', 1, '7ffb3da30f1bec7fe0c7456a8ec3b8d7'),
	(74, NULL, 100, 'main', 'OnBeforeProlog', 'bitrix.sitepersonal', '', 'CSitePersonal', 'ShowPanel', '', 1, '5a8bf3ea4b17f8d011b8f398c05ac89b'),
	(75, NULL, 100, 'main', 'OnAdminInformerInsertItems', 'bitrixcloud', '', 'CBitrixCloudBackup', 'OnAdminInformerInsertItems', '', 1, '5499039afdd0fdb38d4b245c8b886dcb'),
	(76, NULL, 100, 'mobileapp', 'OnBeforeAdminMobileMenuBuild', 'bitrixcloud', '', 'CBitrixCloudMobile', 'OnBeforeAdminMobileMenuBuild', '', 1, '5828a8cdb2cc45e2724ef1c76139df88'),
	(77, NULL, 100, 'search', 'OnReindex', 'blog', '', 'CBlogSearch', 'OnSearchReindex', '', 1, '6c23ebfcdfc99d14541ad083b0ee7430'),
	(78, NULL, 100, 'main', 'OnUserDelete', 'blog', '', '\\Bitrix\\Blog\\BlogUser', 'onUserDelete', '', 1, '470dc0caadb6eee3cf6bd32a89d2aa38'),
	(79, NULL, 100, 'main', 'OnSiteDelete', 'blog', '', 'CBlogSitePath', 'DeleteBySiteID', '', 1, '33b1b3449b56990b745b251f3976521d'),
	(80, NULL, 100, 'socialnetwork', 'OnSocNetGroupDelete', 'blog', '', 'CBlogSoNetPost', 'OnGroupDelete', '', 1, '4fa06723b7108652d8f6846f17c4bfda'),
	(81, NULL, 100, 'socialnetwork', 'OnSocNetFeaturesAdd', 'blog', '', 'CBlogSearch', 'SetSoNetFeatureIndexSearch', '', 1, '5e642b195637a47eda278a2f769d72ae'),
	(82, NULL, 100, 'socialnetwork', 'OnSocNetFeaturesUpdate', 'blog', '', 'CBlogSearch', 'SetSoNetFeatureIndexSearch', '', 1, '94116bd773c35830e32cabd264e1deac'),
	(83, NULL, 100, 'socialnetwork', 'OnBeforeSocNetFeaturesPermsAdd', 'blog', '', 'CBlogSearch', 'OnBeforeSocNetFeaturesPermsAdd', '', 1, 'ef99702762ccf8958b3bd05a0bc2bd21'),
	(84, NULL, 100, 'socialnetwork', 'OnSocNetFeaturesPermsAdd', 'blog', '', 'CBlogSearch', 'SetSoNetFeaturePermIndexSearch', '', 1, '7e78a43487928787ac0665eb1eade0d5'),
	(85, NULL, 100, 'socialnetwork', 'OnBeforeSocNetFeaturesPermsUpdate', 'blog', '', 'CBlogSearch', 'OnBeforeSocNetFeaturesPermsUpdate', '', 1, '13116dc44040b680c93a2b7f60ff2845'),
	(86, NULL, 100, 'socialnetwork', 'OnSocNetFeaturesPermsUpdate', 'blog', '', 'CBlogSearch', 'SetSoNetFeaturePermIndexSearch', '', 1, '06ae1cde11216c73393f8720c0f31ea9'),
	(87, NULL, 200, 'main', 'OnAfterAddRating', 'blog', '', 'CRatingsComponentsBlog', 'OnAfterAddRating', '', 1, '6dd70a97fa5c2f15e619721007813bd0'),
	(88, NULL, 200, 'main', 'OnAfterUpdateRating', 'blog', '', 'CRatingsComponentsBlog', 'OnAfterUpdateRating', '', 1, 'a2f4b906bc5e1e984c28ef37728d7007'),
	(89, NULL, 200, 'main', 'OnSetRatingsConfigs', 'blog', '', 'CRatingsComponentsBlog', 'OnSetRatingConfigs', '', 1, '4461c77de3ca9dec12cd66c9554555a0'),
	(90, NULL, 200, 'main', 'OnGetRatingsConfigs', 'blog', '', 'CRatingsComponentsBlog', 'OnGetRatingConfigs', '', 1, '6708964800c60ed28bb3ac095494d0f8'),
	(91, NULL, 200, 'main', 'OnGetRatingsObjects', 'blog', '', 'CRatingsComponentsBlog', 'OnGetRatingObject', '', 1, '29df09132203259924e883921fed0971'),
	(92, NULL, 200, 'main', 'OnGetRatingContentOwner', 'blog', '', 'CRatingsComponentsBlog', 'OnGetRatingContentOwner', '', 1, 'a47b921e59710bdca16e2284d11e8aa0'),
	(93, NULL, 100, 'im', 'OnGetNotifySchema', 'blog', '', 'CBlogNotifySchema', 'OnGetNotifySchema', '', 1, 'cd6910b2ee2dd66f257a68a6406b9f79'),
	(94, NULL, 100, 'im', 'OnAnswerNotify', 'blog', '', 'CBlogNotifySchema', 'CBlogEventsIMCallback', '', 1, '890d3be770eab6025cc54e120d3b51f5'),
	(95, NULL, 100, 'main', 'OnAfterRegisterModule', 'main', '/modules/blog/install/index.php', 'blog', 'installUserFields', '', 1, 'bfd07861166a9d51c1d21d18b291a1dc'),
	(96, NULL, 100, 'conversion', 'OnGetCounterTypes', 'blog', '', '\\Bitrix\\Blog\\Internals\\ConversionHandlers', 'onGetCounterTypes', '', 1, 'e5df84e19828b3b95901e7b2a5d55cb1'),
	(97, NULL, 100, 'conversion', 'OnGetRateTypes', 'blog', '', '\\Bitrix\\Blog\\Internals\\ConversionHandlers', 'onGetRateTypes', '', 1, '75028a7a2551f7c677c09c367ed1a54c'),
	(98, NULL, 100, 'blog', 'OnPostAdd', 'blog', '', '\\Bitrix\\Blog\\Internals\\ConversionHandlers', 'onPostAdd', '', 1, 'a3b637f0c0945089c95d5c08e1166938'),
	(99, NULL, 100, 'mail', 'onReplyReceivedBLOG_POST', 'blog', '', '\\Bitrix\\Blog\\Internals\\MailHandler', 'handleReplyReceivedBlogPost', '', 2, '5e3d8ad3f14c5b994981074e43a02cd7'),
	(100, NULL, 100, 'mail', 'onForwardReceivedBLOG_POST', 'blog', '', '\\Bitrix\\Blog\\Internals\\MailHandler', 'handleForwardReceivedBlogPost', '', 2, '6002badd4ffa13790a43d45c5c29fca3'),
	(101, NULL, 100, 'socialnetwork', 'onLogIndexGetContent', 'blog', '', '\\Bitrix\\Blog\\Integration\\Socialnetwork\\Log', 'onIndexGetContent', '', 2, '3fba13b74a731f896448388c082c24a4'),
	(102, NULL, 100, 'socialnetwork', 'onLogCommentIndexGetContent', 'blog', '', '\\Bitrix\\Blog\\Integration\\Socialnetwork\\LogComment', 'onIndexGetContent', '', 2, '57ce8e76c004b1447554d8ec64c48783'),
	(103, NULL, 100, 'socialnetwork', 'onContentViewed', 'blog', '', '\\Bitrix\\Blog\\Integration\\Socialnetwork\\ContentViewHandler', 'onContentViewed', '', 2, 'd33a4b2ae579a2c9b5ddcea17bc62806'),
	(104, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'clouds', '', 'CCloudStorage', 'GetAuditTypes', '', 1, 'da69722ba95497cf263381b46e24df40'),
	(105, NULL, 90, 'main', 'OnBeforeProlog', 'clouds', '', 'CCloudStorage', 'OnBeforeProlog', '', 1, 'f8c39ff182ad873715f10a7091f928a4'),
	(106, NULL, 100, 'main', 'OnAdminListDisplay', 'clouds', '', 'CCloudStorage', 'OnAdminListDisplay', '', 1, '8ddf4f578e7229a63cba4d2124c7643c'),
	(107, NULL, 100, 'main', 'OnBuildGlobalMenu', 'clouds', '', 'CCloudStorage', 'OnBuildGlobalMenu', '', 1, 'd6d308843a6521ad50bfa230a2fcef8f'),
	(108, NULL, 100, 'main', 'OnFileSave', 'clouds', '', 'CCloudStorage', 'OnFileSave', '', 1, '1e4f94a842d6166359ed1789a6f21245'),
	(109, NULL, 100, 'main', 'OnAfterFileSave', 'clouds', '', 'CCloudStorage', 'OnAfterFileSave', '', 1, 'c36bae07a3080f9b5bc5d422ec96933f'),
	(110, NULL, 100, 'main', 'OnGetFileSRC', 'clouds', '', 'CCloudStorage', 'OnGetFileSRC', '', 1, '7ec03b3b7ad3f2f54c1e438a1172e5a8'),
	(111, NULL, 100, 'main', 'OnFileCopy', 'clouds', '', 'CCloudStorage', 'OnFileCopy', '', 1, '6880b56c76f7d3c5d09f887fca6341ca'),
	(112, NULL, 100, 'main', 'OnPhysicalFileDelete', 'clouds', '', 'CCloudStorage', 'OnFileDelete', '', 1, '3151c487c747a57d7817f68e97fd1c94'),
	(113, NULL, 100, 'main', 'OnMakeFileArray', 'clouds', '', 'CCloudStorage', 'OnMakeFileArray', '', 1, '713ea8a7a25764b1af60f7a1ec3032d5'),
	(114, NULL, 100, 'main', 'OnBeforeResizeImage', 'clouds', '', 'CCloudStorage', 'OnBeforeResizeImage', '', 1, '705cd310c52f9c7e8e0c8a0578a22667'),
	(115, NULL, 100, 'main', 'OnAfterResizeImage', 'clouds', '', 'CCloudStorage', 'OnAfterResizeImage', '', 1, 'a403ad2328227153475df0c478a465cc'),
	(116, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_AmazonS3', 'GetObjectInstance', '', 1, 'a4eb7ed1f50b5931474c565f448a4069'),
	(117, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_GoogleStorage', 'GetObjectInstance', '', 1, '1e559e2225608e8d40eeede5b7526f2a'),
	(118, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_OpenStackStorage', 'GetObjectInstance', '', 1, '5ad09feff5dab28ab571ad034ccdf2ea'),
	(119, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_RackSpaceCloudFiles', 'GetObjectInstance', '', 1, 'cc976773610cf809bb56871ac7dd9f01'),
	(120, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_ClodoRU', 'GetObjectInstance', '', 1, 'faadad31436e94c420ed787e4424714b'),
	(121, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_Selectel', 'GetObjectInstance', '', 1, '5e63a8eebed42bd099b4a9ef62e8d52b'),
	(122, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_HotBox', 'GetObjectInstance', '', 1, '1913169adcd6d6f3b7fb5f3b70ba1fd8'),
	(123, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_Yandex', 'GetObjectInstance', '', 1, '12bd1d4f0d145d5b1681955612fe61c8'),
	(124, NULL, 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_S3', 'GetObjectInstance', '', 1, '4af3f0ba1f50ed9be6efcdb55dfbee4e'),
	(125, NULL, 100, 'perfmon', 'OnGetTableSchema', 'clouds', '', 'clouds', 'OnGetTableSchema', '', 1, 'd31a1f80f07441976eb1711db4902a71'),
	(126, NULL, 100, 'main', 'OnGroupDelete', 'fileman', '', 'CFileman', 'OnGroupDelete', '', 1, 'd10f791d422ba0e7551ab267db50404c'),
	(127, NULL, 100, 'main', 'OnPanelCreate', 'fileman', '', 'CFileman', 'OnPanelCreate', '', 1, 'b00a6174fb1763684c299ccf5e054c65'),
	(128, NULL, 100, 'main', 'OnModuleUpdate', 'fileman', '', 'CFileman', 'OnModuleUpdate', '', 1, '58ae853e2b7c230b5cdb51129efd8a05'),
	(129, NULL, 100, 'main', 'OnModuleInstalled', 'fileman', '', 'CFileman', 'ClearComponentsListCache', '', 1, '7bdbd354eab11f376fa257a998587277'),
	(130, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyMapGoogle', 'GetUserTypeDescription', '', 1, 'd9d06fd05f80b33379359ebd8e36e655'),
	(131, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyMapYandex', 'GetUserTypeDescription', '', 1, '20ca1d02998884b5abec68b32fdb561d'),
	(132, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyVideo', 'GetUserTypeDescription', '', 1, '991c32062e05844708a5cf7aba37bf9a'),
	(133, NULL, 100, 'main', 'OnUserTypeBuildList', 'fileman', '', 'CUserTypeVideo', 'GetUserTypeDescription', '', 1, '41bc5efb49ebf8d165acd4e4d556f60c'),
	(134, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'fileman', '', 'CEventFileman', 'GetAuditTypes', '', 1, 'e0a610651ffec1fbddb2f261223fb2e9'),
	(135, NULL, 100, 'main', 'OnEventLogGetAuditHandlers', 'fileman', '', 'CEventFileman', 'MakeFilemanObject', '', 1, 'fbfef1ef99530f6eae191da293f9566c'),
	(136, NULL, 154, 'main', 'OnUserTypeBuildList', 'fileman', '', '\\Bitrix\\Fileman\\UserField\\Address', 'getUserTypeDescription', '', 1, 'f0583a376e38d3d2675513b1a367ed3c'),
	(137, NULL, 100, 'sender', 'OnConnectorList', 'form', '', '\\Bitrix\\Form\\SenderEventHandler', 'onConnectorListForm', '', 1, '182217f1803d20e2899086e379ada21c'),
	(138, NULL, 100, 'main', 'OnAfterUserUpdate', 'forum', '', 'CForumUser', 'OnAfterUserUpdate', '', 1, '18ca0a9757a229b6290603235dfff0d1'),
	(139, NULL, 100, 'main', 'OnGroupDelete', 'forum', '', 'CForumNew', 'OnGroupDelete', '', 1, '63f10ce39f269a9f1add6a0600aa05b9'),
	(140, NULL, 100, 'main', 'OnBeforeLangDelete', 'forum', '', 'CForumNew', 'OnBeforeLangDelete', '', 1, '201c2a343960654a90382521e253328f'),
	(141, NULL, 100, 'main', 'OnFileDelete', 'forum', '', 'CForumFiles', 'OnFileDelete', '', 1, 'a00aa95408b2665018cb63e21cef4684'),
	(142, NULL, 100, 'search', 'OnReindex', 'forum', '', 'CForumNew', 'OnReindex', '', 1, '3fe2c3077963069fee2360611d840816'),
	(143, NULL, 100, 'main', 'OnUserDelete', 'forum', '', 'CForumUser', 'OnUserDelete', '', 1, 'eb0cb7958d708be629eba740bcabd8c4'),
	(144, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'main', '/modules/forum/tools/prop_topicid.php', 'CIBlockPropertyTopicID', 'GetUserTypeDescription', '', 1, 'd5b04b52654500981293dbcf10ca1ef9'),
	(145, NULL, 100, 'iblock', 'OnBeforeIBlockElementDelete', 'forum', '', 'CForumTopic', 'OnBeforeIBlockElementDelete', '', 1, '929cf569dd703b922e4a96a0a023f120'),
	(146, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'forum', '', 'CForumEventLog', 'GetAuditTypes', '', 1, '30a759001702af8052ea65e700c519c7'),
	(147, NULL, 100, 'main', 'OnEventLogGetAuditHandlers', 'forum', '', 'CEventForum', 'MakeForumObject', '', 1, '78ecc0524ac5d4fb0545c8a3fa28b3bd'),
	(148, NULL, 100, 'socialnetwork', 'OnSocNetGroupDelete', 'forum', '', 'CForumUser', 'OnSocNetGroupDelete', '', 1, '94cfb4cf5460746b7b31a5b93a3805f6'),
	(149, NULL, 100, 'socialnetwork', 'OnSocNetLogFormatEvent', 'forum', '', 'CForumMessage', 'OnSocNetLogFormatEvent', '', 1, '28c7a91a467c1190a064f597487abd5c'),
	(150, NULL, 100, 'mail', 'OnGetFilterList', 'forum', '', 'CForumEMail', 'OnGetSocNetFilterList', '', 1, 'e42fc61795fed0c5f397259bb6f1f6b9'),
	(151, NULL, 100, 'main', 'OnAfterAddRating', 'forum', '', 'CRatingsComponentsForum', 'OnAfterAddRating', '', 1, 'db966e6ee1f8b98f83e57411f4757858'),
	(152, NULL, 100, 'main', 'OnAfterUpdateRating', 'forum', '', 'CRatingsComponentsForum', 'OnAfterUpdateRating', '', 1, 'f5f6a93c1fe6d7dc61fbb5bf25f9965f'),
	(153, NULL, 100, 'main', 'OnSetRatingsConfigs', 'forum', '', 'CRatingsComponentsForum', 'OnSetRatingConfigs', '', 1, '84556c2f1f7f23189f90603f45ad3942'),
	(154, NULL, 100, 'main', 'OnGetRatingsConfigs', 'forum', '', 'CRatingsComponentsForum', 'OnGetRatingConfigs', '', 1, '7ead6be47d7bb2e297a2af57f85dc7ee'),
	(155, NULL, 100, 'main', 'OnGetRatingsObjects', 'forum', '', 'CRatingsComponentsForum', 'OnGetRatingObject', '', 1, '99f4b68c8e6c1598377e0016b31234bb'),
	(156, NULL, 100, 'main', 'OnGetRatingContentOwner', 'forum', '', 'CRatingsComponentsForum', 'OnGetRatingContentOwner', '', 1, '5ef51ecf36931b3a32f4fea00dc49c8c'),
	(157, NULL, 100, 'im', 'OnGetNotifySchema', 'forum', '', 'CForumNotifySchema', 'OnGetNotifySchema', '', 1, 'ad425ff862192078c050ea34d60f8d63'),
	(158, NULL, 100, 'main', 'OnAfterRegisterModule', 'main', '/modules/forum/install/index.php', 'forum', 'InstallUserFields', '', 1, '205fd3e33648d7e1ed6f4b7f0298f603'),
	(159, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'forum', '', 'CForumRestService', 'OnRestServiceBuildDescription', '', 1, '506b2a93cea64d73c9e7c187fdde2840'),
	(160, NULL, 100, 'conversion', 'OnGetCounterTypes', 'forum', '', '\\Bitrix\\Forum\\Internals\\ConversionHandlers', 'onGetCounterTypes', '', 1, 'fa69bf6ff10a0fb9b2e91098f0c0bab3'),
	(161, NULL, 100, 'conversion', 'OnGetRateTypes', 'forum', '', '\\Bitrix\\Forum\\Internals\\ConversionHandlers', 'onGetRateTypes', '', 1, '9eb2b6d8edde63385655c1001d9e0c31'),
	(162, NULL, 100, 'forum', 'onAfterTopicAdd', 'forum', '', '\\Bitrix\\Forum\\Internals\\ConversionHandlers', 'onTopicAdd', '', 1, 'ea61a319e93c2c3a9bfc9a63840b2155'),
	(163, NULL, 100, 'forum', 'onAfterMessageAdd', 'forum', '', '\\Bitrix\\Forum\\Internals\\ConversionHandlers', 'onMessageAdd', '', 1, '3cc5f27501dad77acdecb1c8a4e978de'),
	(164, NULL, 100, 'socialnetwork', 'onLogIndexGetContent', 'forum', '', '\\Bitrix\\Forum\\Integration\\Socialnetwork\\Log', 'onIndexGetContent', '', 2, '909a8b84bf80774a6a89bfbbd2258ce8'),
	(165, NULL, 100, 'socialnetwork', 'onLogCommentIndexGetContent', 'forum', '', '\\Bitrix\\Forum\\Integration\\Socialnetwork\\LogComment', 'onIndexGetContent', '', 2, 'e6aaa86c7daeae2bc002e513f06ccffa'),
	(166, NULL, 100, 'socialnetwork', 'onContentViewed', 'forum', '', '\\Bitrix\\Forum\\Integration\\Socialnetwork\\ContentViewHandler', 'onContentViewed', '', 2, '5db6b373f6612f36c2ff6783dd4d6154'),
	(167, NULL, 100, 'main', 'OnBeforeUserTypeAdd', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'OnBeforeUserTypeAdd', '', 1, 'f9dcff287cf7753e5c56974d37975507'),
	(168, NULL, 100, 'main', 'OnAfterUserTypeAdd', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'onAfterUserTypeAdd', '', 1, 'd1fa2865e72eca144b964b6fb1eefc15'),
	(169, NULL, 100, 'main', 'OnBeforeUserTypeDelete', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'OnBeforeUserTypeDelete', '', 1, '1bf13707e1a45b8320c2ecd35534cbb4'),
	(170, NULL, 100, 'main', 'OnUserTypeBuildList', 'highloadblock', '', 'CUserTypeHlblock', 'GetUserTypeDescription', '', 1, '2ac4a2154f4fd85d67b50f412ed5ed48'),
	(171, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'highloadblock', '', 'CIBlockPropertyDirectory', 'GetUserTypeDescription', '', 1, 'a6f7df502db8a04590e43188d7cbfc99'),
	(172, NULL, 100, 'main', 'OnGroupDelete', 'iblock', '', 'CIBlock', 'OnGroupDelete', '', 1, 'f2320df213f38adf32364d3169d5b197'),
	(173, NULL, 100, 'main', 'OnBeforeLangDelete', 'iblock', '', 'CIBlock', 'OnBeforeLangDelete', '', 1, '46aef774958db327c1170a12d3a70ee5'),
	(174, NULL, 100, 'main', 'OnLangDelete', 'iblock', '', 'CIBlock', 'OnLangDelete', '', 1, '861f6ee2ca56bf63c3af07db0553606b'),
	(175, NULL, 100, 'main', 'OnUserTypeRightsCheck', 'iblock', '', 'CIBlockSection', 'UserTypeRightsCheck', '', 1, '2a6d446893d46f04f2c151f458d2908c'),
	(176, NULL, 100, 'search', 'OnReindex', 'iblock', '', 'CIBlock', 'OnSearchReindex', '', 1, 'c6c8111f129e0eb19e558106e354e6f6'),
	(177, NULL, 100, 'search', 'OnSearchGetURL', 'iblock', '', 'CIBlock', 'OnSearchGetURL', '', 1, '0ae9fc756bfb1273309240cd8f535672'),
	(178, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'iblock', '', 'CIBlock', 'GetAuditTypes', '', 1, '182d19c163e3a5a965bca170c3fb0e83'),
	(179, NULL, 100, 'main', 'OnEventLogGetAuditHandlers', 'iblock', '', 'CEventIBlock', 'MakeIBlockObject', '', 1, 'f7a182e8d9b204970d111e4703b9f523'),
	(180, NULL, 200, 'main', 'OnGetRatingContentOwner', 'iblock', '', 'CRatingsComponentsIBlock', 'OnGetRatingContentOwner', '', 1, '6da245944e376d586a3fa2aaee02c70b'),
	(181, NULL, 100, 'main', 'OnTaskOperationsChanged', 'iblock', '', 'CIBlockRightsStorage', 'OnTaskOperationsChanged', '', 1, '01b3f9984fa07b1dfb4bc35d107d5672'),
	(182, NULL, 100, 'main', 'OnGroupDelete', 'iblock', '', 'CIBlockRightsStorage', 'OnGroupDelete', '', 1, '2dbbccdee3f2e7bd86446bec02be1d54'),
	(183, NULL, 100, 'main', 'OnUserDelete', 'iblock', '', 'CIBlockRightsStorage', 'OnUserDelete', '', 1, '78f090ee29030c54788098b0782d28f9'),
	(184, NULL, 100, 'perfmon', 'OnGetTableSchema', 'iblock', '', 'iblock', 'OnGetTableSchema', '', 1, '4b71a345c136beed338aa7137943d80b'),
	(185, NULL, 100, 'sender', 'OnConnectorList', 'iblock', '', '\\Bitrix\\Iblock\\SenderEventHandler', 'onConnectorListIblock', '', 1, '3de75587a47352dd3cb6d10866f69385'),
	(186, NULL, 10, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyDate', 'GetUserTypeDescription', '', 1, 'fa608e2c397b6793c54ad296619a22e2'),
	(187, NULL, 20, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyDateTime', 'GetUserTypeDescription', '', 1, '78554c9e3c38ac383d51f0ee4d013120'),
	(188, NULL, 30, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyXmlID', 'GetUserTypeDescription', '', 1, '952fe5f2ea67493fb9f9b924ce1b992b'),
	(189, NULL, 40, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyFileMan', 'GetUserTypeDescription', '', 1, 'fd688441d5e8203751fb47374931e011'),
	(190, NULL, 50, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyHTML', 'GetUserTypeDescription', '', 1, '27645f81ce5d6d9f19a47cc171860beb'),
	(191, NULL, 60, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyElementList', 'GetUserTypeDescription', '', 1, 'c53e9314ae43c30267b32310a02d7df4'),
	(192, NULL, 70, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySequence', 'GetUserTypeDescription', '', 1, '3ff9528d1264fc77697248957aafdab5'),
	(193, NULL, 80, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyElementAutoComplete', 'GetUserTypeDescription', '', 1, '0d233a1e7a0d6a52a52e13df88291024'),
	(194, NULL, 90, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySKU', 'GetUserTypeDescription', '', 1, '8678bc826ced4f66640fba3775b18516'),
	(195, NULL, 100, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySectionAutoComplete', 'GetUserTypeDescription', '', 1, '26ff6f651cb94a1fe4ce9827566f0730'),
	(196, NULL, 100, 'main', 'onVirtualClassBuildList', 'iblock', '', 'Bitrix\\Iblock\\IblockTable', 'compileAllEntities', '', 2, '8a4e85071d25e6ba7f9ed315874c411b'),
	(197, NULL, 100, 'crm', 'onAfterCrmCompanyAdd', 'landing', '', '\\Bitrix\\Landing\\Connector\\Crm', 'onAfterCompanyChange', '', 2, '7e8fed841380d8075d45525f328e8940'),
	(198, NULL, 100, 'crm', 'onAfterCrmCompanyUpdate', 'landing', '', '\\Bitrix\\Landing\\Connector\\Crm', 'onAfterCompanyChange', '', 2, '688027a0f389137b02ac0a834f0a8495'),
	(199, NULL, 100, 'iblock', 'onAfterIBlockSectionDelete', 'landing', '', '\\Bitrix\\Landing\\Connector\\Iblock', 'onAfterIBlockSectionDelete', '', 2, 'ffe8a984ae7ff50064ac74e788a80118'),
	(200, NULL, 100, 'intranet', 'onBuildBindingMenu', 'landing', '', '\\Bitrix\\Landing\\Connector\\Intranet', 'onBuildBindingMenu', '', 2, 'd5464da9aea2308d3d5f13c2387c4c40'),
	(201, NULL, 100, 'landing', 'onBuildSourceList', 'landing', '', '\\Bitrix\\Landing\\Connector\\Landing', 'onSourceBuildHandler', '', 2, 'fc391addc82a816df68510b0ae3363a5'),
	(202, NULL, 100, 'main', 'onBeforeSiteDelete', 'landing', '', '\\Bitrix\\Landing\\Site', 'onBeforeMainSiteDelete', '', 2, '5faa9b5de931dbb101e2e0aef6fc594b'),
	(203, NULL, 100, 'main', 'onSiteDelete', 'landing', '', '\\Bitrix\\Landing\\Site', 'onMainSiteDelete', '', 2, 'af029bceca7ea9cc809515e95bd3a710'),
	(204, NULL, 100, 'main', 'onUserConsentProviderList', 'landing', '', '\\Bitrix\\Landing\\Site\\Cookies', 'onUserConsentProviderList', '', 2, 'f59a96e272348f934d62ba5d3ee79f21'),
	(205, NULL, 100, 'mobile', 'onMobileMenuStructureBuilt', 'landing', '', '\\Bitrix\\Landing\\Connector\\Mobile', 'onMobileMenuStructureBuilt', '', 2, '01fd8a44b83b5f7fcd2f36a626657ad0'),
	(206, NULL, 100, 'rest', 'onRestServiceBuildDescription', 'landing', '', '\\Bitrix\\Landing\\Publicaction', 'restBase', '', 2, '9af99ddecf2dd8c3c5b14721f23e8fef'),
	(207, NULL, 100, 'rest', 'onBeforeApplicationUninstall', 'landing', '', '\\Bitrix\\Landing\\Publicaction', 'beforeRestApplicationDelete', '', 2, 'ef1f080a088ad54298a4ba9bf2896313'),
	(208, NULL, 100, 'rest', 'onRestAppDelete', 'landing', '', '\\Bitrix\\Landing\\Publicaction', 'restApplicationDelete', '', 2, '031cfc016e3be91368376a391c351dea'),
	(209, NULL, 100, 'rest', 'onRestApplicationConfigurationGetManifest', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'getManifestList', '', 2, 'b88124aac7c2c8ddecf2ce127a9c6ef8'),
	(210, NULL, 100, 'rest', 'onRestApplicationConfigurationExport', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'onEventExportController', '', 2, '917b00a9f82e6b8f7899a6e8c3b22236'),
	(211, NULL, 100, 'rest', 'onRestApplicationConfigurationGetManifestSetting', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'onInitManifest', '', 2, '99fa9aa37a23a371cca0153c840c7802'),
	(212, NULL, 100, 'rest', 'onRestApplicationConfigurationEntity', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'getEntityList', '', 2, '820df699b9abf22ce0356fc9957be794'),
	(213, NULL, 100, 'rest', 'onRestApplicationConfigurationImport', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'onEventImportController', '', 2, 'e65daaed01b2c52e6098ee47ddb7f07a'),
	(214, NULL, 100, 'rest', 'onRestApplicationConfigurationFinish', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'onFinish', '', 2, '45343e5617dca2ad06a5d13050232caf'),
	(215, NULL, 100, 'seo', 'onExtensionInstall', 'landing', '', '\\Bitrix\\Landing\\Hook\\Page\\PixelFb', 'changeBusinessPixel', '', 2, '27bf01f04349ff82ede423de62df5384'),
	(216, NULL, 100, 'socialnetwork', 'onFillSocNetFeaturesList', 'landing', '', '\\Bitrix\\Landing\\Connector\\SocialNetwork', 'onFillSocNetFeaturesList', '', 2, '9825d91c89b53b69655aa98ea4f3a6cf'),
	(217, NULL, 100, 'socialnetwork', 'onFillSocNetMenu', 'landing', '', '\\Bitrix\\Landing\\Connector\\SocialNetwork', 'onFillSocNetMenu', '', 2, '14ecfb8fb4fc20f22ddb5ac64783461d'),
	(218, NULL, 100, 'socialnetwork', 'onSocNetGroupDelete', 'landing', '', '\\Bitrix\\Landing\\Connector\\SocialNetwork', 'onSocNetGroupDelete', '', 2, '78202f1461a8822a105a19f45502c327'),
	(219, NULL, 100, 'main', 'OnAfterEpilog', 'messageservice', '', '\\Bitrix\\MessageService\\Queue', 'run', '', 1, '6bcb21b0ccc5ac89d9531ddf8b94683c'),
	(220, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'messageservice', '', '\\Bitrix\\MessageService\\RestService', 'onRestServiceBuildDescription', '', 1, '7524628243223e572590eea87cc03f73'),
	(221, NULL, 100, 'rest', 'OnRestAppDelete', 'messageservice', '', '\\Bitrix\\MessageService\\RestService', 'onRestAppDelete', '', 1, '5febc41cd526ecba95dbb4843dd9c134'),
	(222, NULL, 100, 'rest', 'OnRestAppUpdate', 'messageservice', '', '\\Bitrix\\MessageService\\RestService', 'onRestAppUpdate', '', 1, '7e77b4d550c200a4ec06872af7857ee6'),
	(223, NULL, 100, 'pull', 'OnGetDependentModule', 'mobileapp', '', 'CMobileAppPullSchema', 'OnGetDependentModule', '', 1, '4833278dbe60d476fbccbaa54545cffa'),
	(224, NULL, 100, 'perfmon', 'OnGetTableSchema', 'perfmon', '', 'perfmon', 'OnGetTableSchema', '', 1, '3a4da255b44f05899b64e66a40c12662'),
	(225, NULL, 100, 'iblock', 'OnBeforeIBlockElementDelete', 'photogallery', '', 'CPhotogalleryElement', 'OnBeforeIBlockElementDelete', '', 1, 'dc9ea0b8411dfa54929a022d44bc5b1a'),
	(226, NULL, 100, 'iblock', 'OnAfterIBlockElementAdd', 'photogallery', '', 'CPhotogalleryElement', 'OnAfterIBlockElementAdd', '', 1, '7fc7f3cc71ad3188022388365d446ed2'),
	(227, NULL, 100, 'search', 'BeforeIndex', 'photogallery', '', 'CRatingsComponentsPhotogallery', 'BeforeIndex', '', 1, '06e2330d56c3b972e67707d665383704'),
	(228, NULL, 100, 'im', 'OnGetNotifySchema', 'photogallery', '', 'CPhotogalleryNotifySchema', 'OnGetNotifySchema', '', 1, '7ca75249042a033e858d90dc2473adac'),
	(229, NULL, 100, 'socialnetwork', 'OnSocNetGroupDelete', 'photogallery', '', '\\Bitrix\\Photogallery\\Integration\\Socialnetwork\\Group', 'onSocNetGroupDelete', '', 1, 'bded61c39d768685fa7dd112c63c702b'),
	(230, NULL, 49, 'main', 'OnBeforeProlog', 'rest', '', 'CRestEventHandlers', 'OnBeforeProlog', '', 2, '395c9c42c3cc9392de1e5887617afe6d'),
	(231, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', 'CBitrixRestEntity', 'OnRestServiceBuildDescription', '', 2, 'f63068b1eb62c36219518206e1e2827c'),
	(232, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\User', 'onRestServiceBuildDescription', '', 2, 'c9a03e9019564649e55f5409b661e050'),
	(233, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\Placement', 'onRestServiceBuildDescription', '', 2, '9751a266c2b6f6be5c34b1541bf7c194'),
	(234, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\Event', 'onRestServiceBuildDescription', '', 2, '842ad63f19aff6d810059c7e56739aae'),
	(235, NULL, 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\UserFieldType', 'onRestServiceBuildDescription', '', 2, '4caf68a5256aabe4abef37f24562e59b'),
	(236, NULL, 100, 'rest', 'onFindMethodDescription', 'rest', '', '\\Bitrix\\Rest\\Engine\\RestManager', 'onFindMethodDescription', '', 2, '4d0614f880674af333326dd5ba9b2828'),
	(237, NULL, 100, 'main', 'OnApplicationsBuildList', 'main', 'modules/rest/lib/apauth/application.php', '\\Bitrix\\Rest\\APAuth\\Application', 'onApplicationsBuildList', '', 2, '9c39129872987f8dcc8baacc0c446ed7'),
	(238, NULL, 100, 'im', 'OnAfterConfirmNotify', 'rest', '', '\\Bitrix\\Rest\\NotifyIm', 'receive', '', 2, '2ac9c19fe69d4e106deaa6f4a7a4371b'),
	(239, NULL, 100, 'rest', '\\Bitrix\\Rest\\APAuth\\Password::OnDelete', 'rest', '', '\\Bitrix\\Rest\\APAuth\\PermissionTable', 'onPasswordDelete', '', 2, 'f04447ca635f045ec1a64e593964fc90'),
	(240, NULL, 100, 'perfmon', 'OnGetTableSchema', 'rest', '', 'rest', 'OnGetTableSchema', '', 2, '47a76003c8f9f2d8c820f446e084ff39'),
	(241, NULL, 100, 'rest', 'OnRestApplicationConfigurationImport', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'onEventImportController', '', 2, '3fc1dd7e523b33f9d76c19e54d45c2fb'),
	(242, NULL, 100, 'rest', 'OnRestApplicationConfigurationExport', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'onEventExportController', '', 2, 'b90a349060c693506b740c4d36f75f5f'),
	(243, NULL, 100, 'rest', 'OnRestApplicationConfigurationClear', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'onEventClearController', '', 2, '75dccda637a740c033b2d014a84a8009'),
	(244, NULL, 100, 'rest', 'OnRestApplicationConfigurationEntity', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'getEntityList', '', 2, '8d83d219eaf2f415d55fb67e221b7c3d'),
	(245, NULL, 100, 'rest', 'OnRestApplicationConfigurationGetManifest', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'getManifestList', '', 2, '6ba35b1f4b01d1e358e1b3a79ac437d6'),
	(246, NULL, 100, 'rest', 'onRestCheckAuth', 'rest', '', '\\Bitrix\\Rest\\OAuth\\Auth', 'onRestCheckAuth', '', 2, '70e923729089b8cba69bb3b4311da11e'),
	(247, NULL, 100, 'rest', 'onRestCheckAuth', 'rest', '', '\\Bitrix\\Rest\\APAuth\\Auth', 'onRestCheckAuth', '', 2, '3550e6c95772564101770e0c9cb54470'),
	(248, NULL, 100, 'rest', 'onRestCheckAuth', 'rest', '', '\\Bitrix\\Rest\\SessionAuth\\Auth', 'onRestCheckAuth', '', 2, '8e33ae5a47b59d21df7d26f916d19e38'),
	(249, NULL, 100, 'main', 'OnAfterRegisterModule', 'rest', '', '\\Bitrix\\Rest\\Engine\\ScopeManager', 'onChangeRegisterModule', '', 2, '900fb8bbf0d59d1924bedae5da1b6eb1'),
	(250, NULL, 100, 'main', 'OnAfterUnRegisterModule', 'rest', '', '\\Bitrix\\Rest\\Engine\\ScopeManager', 'onChangeRegisterModule', '', 2, 'e97e569fe3fc7775aa4ece09cdf209bc'),
	(251, NULL, 100, 'main', 'OnAfterRegisterModule', 'rest', '', '\\Bitrix\\Rest\\Marketplace\\TagTable', 'onAfterRegisterModule', '', 2, '80afec537db1eeda99462f0676dbb835'),
	(252, NULL, 100, 'main', 'OnAfterUnRegisterModule', 'rest', '', '\\Bitrix\\Rest\\Marketplace\\TagTable', 'onAfterUnRegisterModule', '', 2, 'fe9cb5af7e8ca277ca29b4a5423bd08b'),
	(253, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'scale', '', '\\Bitrix\\Scale\\Logger', 'onEventLogGetAuditTypes', '', 1, 'd8192b7113f1652bdf8a37bcd4e38dea'),
	(254, NULL, 100, 'main', 'OnChangePermissions', 'search', '', 'CSearch', 'OnChangeFilePermissions', '', 1, '1c37aedc2ec89f94624291d097fe7adf'),
	(255, NULL, 100, 'main', 'OnChangeFile', 'search', '', 'CSearch', 'OnChangeFile', '', 1, 'd51170fc3433fde7eab8edc1c2b933a0'),
	(256, NULL, 100, 'main', 'OnGroupDelete', 'search', '', 'CSearch', 'OnGroupDelete', '', 1, '05382d7448b1ba259b89bf9e87e4eb44'),
	(257, NULL, 100, 'main', 'OnLangDelete', 'search', '', 'CSearch', 'OnLangDelete', '', 1, '15ebda82514af5a966b3466cd26992a4'),
	(258, NULL, 100, 'main', 'OnAfterUserUpdate', 'search', '', 'CSearchUser', 'OnAfterUserUpdate', '', 1, '9e0cea5039973193afc706ec8978d674'),
	(259, NULL, 100, 'main', 'OnUserDelete', 'search', '', 'CSearchUser', 'DeleteByUserID', '', 1, '524a910f381ba144bf50caa152222ed6'),
	(260, NULL, 100, 'cluster', 'OnGetTableList', 'search', '', 'search', 'OnGetTableList', '', 1, 'a40ffd36df151e2c0294b5639e81d665'),
	(261, NULL, 100, 'perfmon', 'OnGetTableSchema', 'search', '', 'search', 'OnGetTableSchema', '', 1, '9c8df2577e0cb80c68afa2030e193efb'),
	(262, NULL, 90, 'main', 'OnEpilog', 'search', '', 'CSearchStatistic', 'OnEpilog', '', 1, '6b3591ad78ac2a3ce6ad411f0aff47fe'),
	(263, NULL, 100, 'main', 'OnUserDelete', 'security', '', 'CSecurityUser', 'OnUserDelete', '', 1, '450a1c7509f5363a9bf7d1472f22f9cf'),
	(264, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'security', '', 'CSecurityFilter', 'GetAuditTypes', '', 1, '893bc94df887141b4f3579561ea37454'),
	(265, NULL, 100, 'main', 'OnEventLogGetAuditTypes', 'security', '', 'CSecurityAntiVirus', 'GetAuditTypes', '', 1, '9ba919b0537aa25fe47e438c2428b4d9'),
	(266, NULL, 100, 'main', 'OnAdminInformerInsertItems', 'security', '', 'CSecurityFilter', 'OnAdminInformerInsertItems', '', 1, 'c751923f396ccc4e102ed17e97cb8afb'),
	(267, NULL, 100, 'main', 'OnAdminInformerInsertItems', 'security', '', 'CSecuritySiteChecker', 'OnAdminInformerInsertItems', '', 1, '0c7cea553d58a72f7c5521d282898bc7'),
	(268, NULL, 5, 'main', 'OnBeforeProlog', 'security', '', 'CSecurityFilter', 'OnBeforeProlog', '', 1, 'bb70fedd18267b1c5290068ae80dbc4d'),
	(269, NULL, 9999, 'main', 'OnEndBufferContent', 'security', '', 'CSecurityXSSDetect', 'OnEndBufferContent', '', 1, 'd1886589ecd51b020420e6c1415edeaf'),
	(270, NULL, 1, 'main', 'OnBeforeLocalRedirect', 'security', '', 'CSecurityRedirect', 'BeforeLocalRedirect', '', 1, '2dbeb7fa7a8bec4d90e8940616976b3d'),
	(271, NULL, 1, 'main', 'OnEndBufferContent', 'security', '', 'CSecurityRedirect', 'EndBufferContent', '', 1, '099871646b4df8c1263e26f9bd91f3bd'),
	(272, NULL, 100, 'main', 'OnPanelCreate', 'seo', '', 'CSeoEventHandlers', 'SeoOnPanelCreate', '', 2, '79688b0b4a106b805d09e63ffe88f580'),
	(273, NULL, 100, 'fileman', 'OnIncludeHTMLEditorScript', 'seo', '', 'CSeoEventHandlers', 'OnIncludeHTMLEditorScript', '', 2, '7995eac5813e40f6b3e82b146631397e'),
	(274, NULL, 100, 'fileman', 'OnBeforeHTMLEditorScriptRuns', 'seo', '', 'CSeoEventHandlers', 'OnBeforeHTMLEditorScriptRuns', '', 2, '313b34609f1fa34d34cde1c2103c09ff'),
	(275, NULL, 100, 'iblock', 'OnAfterIBlockSectionAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'addSection', '', 2, 'c61de21b0b0873525fa5c39427324664'),
	(276, NULL, 100, 'iblock', 'OnAfterIBlockElementAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'addElement', '', 2, '1b167ab85d6d744bba456e559546f13e'),
	(277, NULL, 100, 'iblock', 'OnBeforeIBlockSectionDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeDeleteSection', '', 2, '148ce014df9dd9f99f17ebfc5d766e8a'),
	(278, NULL, 100, 'iblock', 'OnBeforeIBlockElementDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeDeleteElement', '', 2, '4b1e9896d9f0aa37a7039a321f25f9a5'),
	(279, NULL, 100, 'iblock', 'OnAfterIBlockSectionDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'deleteSection', '', 2, 'b699c1c0d6665f9cffe7ff76ab108a24'),
	(280, NULL, 100, 'iblock', 'OnAfterIBlockElementDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'deleteElement', '', 2, 'ff3a36654015c53890f4cf2204b030c4'),
	(281, NULL, 100, 'iblock', 'OnBeforeIBlockSectionUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeUpdateSection', '', 2, 'aa5f8c360ed88eb5e2884c57b6f1f2f3'),
	(282, NULL, 100, 'iblock', 'OnBeforeIBlockElementUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeUpdateElement', '', 2, 'a1022e0619263c0e91139fb3f9837085'),
	(283, NULL, 100, 'iblock', 'OnAfterIBlockSectionUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'updateSection', '', 2, '27930cffcd40b84666d0a22e1a953c41'),
	(284, NULL, 100, 'iblock', 'OnAfterIBlockElementUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'updateElement', '', 2, 'f0151e07363564774d45acba4100aebe'),
	(285, NULL, 100, 'forum', 'onAfterTopicAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'addTopic', '', 2, 'd4d54756116942c9ee0bda9b31e9d0e7'),
	(286, NULL, 100, 'forum', 'onAfterTopicUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'updateTopic', '', 2, '3e0a8569016a4c941f3eb4aa9fca6e8b'),
	(287, NULL, 100, 'forum', 'onAfterTopicDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'deleteTopic', '', 2, '7f4379c818231561b41589d3de41e36b'),
	(288, NULL, 100, 'main', 'OnAdminIBlockElementEdit', 'seo', '', '\\Bitrix\\Seo\\AdvTabEngine', 'eventHandler', '', 2, 'c894d167ef03c35375b8eb8f2551a798'),
	(289, NULL, 100, 'main', 'OnBeforeProlog', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'checkSession', '', 2, '5fdf8dd9fd70719e442efcb589175bf0'),
	(290, NULL, 100, 'sale', 'OnOrderSave', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onOrderSave', '', 2, '07d4ab0b1aa0aa130a0cbc06403f6eae'),
	(291, NULL, 100, 'sale', 'OnBasketOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onBasketOrder', '', 2, 'cf6298b090e92e955b32c358c1d14b25'),
	(292, NULL, 100, 'sale', 'onSalePayOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSalePayOrder', '', 2, '745afed820778e33d5cd3e91cbd622f1'),
	(293, NULL, 100, 'sale', 'onSaleDeductOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleDeductOrder', '', 2, '12861bd5c6c27ffa2abe5cac90ea58d8'),
	(294, NULL, 100, 'sale', 'onSaleDeliveryOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleDeliveryOrder', '', 2, 'ead8fb64fece572d1fabd3d6fd27af27'),
	(295, NULL, 100, 'sale', 'onSaleStatusOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleStatusOrder', '', 2, 'b7b9ac4bbf458d433e1cf3835ff4cb6c'),
	(296, NULL, 100, 'conversion', 'OnSetDayContextAttributes', 'seo', '', '\\Bitrix\\Seo\\ConversionHandler', 'onSetDayContextAttributes', '', 2, 'c19eb7659342fabc34b953f69e8b9eee'),
	(297, NULL, 100, 'conversion', 'OnGetAttributeTypes', 'seo', '', '\\Bitrix\\Seo\\ConversionHandler', 'onGetAttributeTypes', '', 2, '379294eefad289e474bf0c5ce2a281d8'),
	(298, NULL, 100, 'catalog', 'OnProductUpdate', 'seo', '', '\\Bitrix\\Seo\\Adv\\Auto', 'checkQuantity', '', 2, '0f4deda4d57adb4389d85a19e5bbcf2b'),
	(299, NULL, 100, 'catalog', 'OnProductSetAvailableUpdate', 'seo', '', '\\Bitrix\\Seo\\Adv\\Auto', 'checkQuantity', '', 2, '3d040ae51f0f6a4b2a08be0e6e1494d4'),
	(300, NULL, 100, 'bitrix24', 'onDomainChange', 'seo', '', '\\Bitrix\\Seo\\Service', 'changeRegisteredDomain', '', 2, 'fcb2dadb8b7ff1863c0ad86320e9e521'),
	(301, NULL, 100, 'main', 'OnUserDelete', 'socialservices', '', 'CSocServAuthDB', 'OnUserDelete', '', 1, '1f5b8fc024dfdf83952d6c723466cdf5'),
	(302, NULL, 100, 'main', 'OnAfterUserLogout', 'socialservices', '', 'CSocServEventHandlers', 'OnUserLogout', '', 1, '7e4c40a3ff7cd102879cef10653f97ac'),
	(303, NULL, 100, 'timeman', 'OnAfterTMReportDailyAdd', 'socialservices', '', 'CSocServAuthDB', 'OnAfterTMReportDailyAdd', '', 1, 'a16159f6a90f1b67cb9ec15b0c1bab3a'),
	(304, NULL, 100, 'timeman', 'OnAfterTMDayStart', 'socialservices', '', 'CSocServAuthDB', 'OnAfterTMDayStart', '', 1, '9567feb38890d6581a3204dc5e65e8b6'),
	(305, NULL, 100, 'timeman', 'OnTimeManShow', 'socialservices', '', 'CSocServEventHandlers', 'OnTimeManShow', '', 1, 'b728f3cea11d374f7638c29f84e8e15e'),
	(306, NULL, 100, 'main', 'OnFindExternalUser', 'socialservices', '', 'CSocServAuthDB', 'OnFindExternalUser', '', 1, '1ab251d15efc87c5b5cfe6396f5dec1b'),
	(307, NULL, 100, 'perfmon', 'OnGetTableSchema', 'socialservices', '', 'socialservices', 'OnGetTableSchema', '', 1, '56107bf1a0dcee0db660c0ec27c31c6c'),
	(308, NULL, 100, 'socialservices', 'OnFindSocialservicesUser', 'socialservices', '', 'CSocServAuthManager', 'checkOldUser', '', 1, 'c3d7460e4ef694f5bc53b6a6ad902407'),
	(309, NULL, 100, 'socialservices', 'OnFindSocialservicesUser', 'socialservices', '', 'CSocServAuthManager', 'checkAbandonedUser', '', 1, '331f99f0b265544c33777c299eab16f6'),
	(310, NULL, 100, 'main', 'OnBeforeLangDelete', 'subscribe', '', 'CRubric', 'OnBeforeLangDelete', '', 1, 'ee539731a3e52fe65cb52596ce0856d2'),
	(311, NULL, 100, 'main', 'OnUserDelete', 'subscribe', '', 'CSubscription', 'OnUserDelete', '', 1, '88c6e57a6f0f18341332db1879c0005b'),
	(312, NULL, 100, 'main', 'OnUserLogout', 'subscribe', '', 'CSubscription', 'OnUserLogout', '', 1, 'f4fa3b156b00fb4415c8612f8439f278'),
	(313, NULL, 100, 'main', 'OnGroupDelete', 'subscribe', '', 'CPosting', 'OnGroupDelete', '', 1, '990d63845f75e93e670ed85f1aa15152'),
	(314, NULL, 100, 'sender', 'OnConnectorList', 'subscribe', '', 'Bitrix\\Subscribe\\SenderEventHandler', 'onConnectorListSubscriber', '', 1, '8a1cffe1bd46a72108e48656a1bae99b'),
	(315, NULL, 100, 'perfmon', 'OnGetTableSchema', 'subscribe', '', 'subscribe', 'OnGetTableSchema', '', 1, '320b1fb657ce46ad23992d00b2f54916'),
	(316, NULL, 100, 'main', 'OnPanelCreate', 'translate', '', '\\Bitrix\\Translate\\Ui\\Panel', 'onPanelCreate', '', 1, '88ecb95eac2e28b80f234bfc8c1cd597'),
	(317, NULL, 100, 'perfmon', 'OnGetTableSchema', 'translate', '', 'translate', 'onGetTableSchema', '', 1, '00347f45b2f48480b1a521c32036beb5'),
	(320, NULL, 10, 'main', 'OnBeforeProlog', 'main', '/modules/vote/keepvoting.php', '', '', '', 1, '251d4d100c1545ca5847d8d6d626dea9'),
	(321, NULL, 200, 'main', 'OnUserTypeBuildList', 'vote', '', 'Bitrix\\Vote\\Uf\\VoteUserType', 'getUserTypeDescription', '', 1, 'e30dd2d26df22ce2dcffef84256cf160'),
	(322, NULL, 200, 'main', 'OnUserLogin', 'vote', '', 'Bitrix\\Vote\\User', 'onUserLogin', '', 1, '5047b245af7aede3f2474b40dfbc65be'),
	(323, NULL, 100, 'im', 'OnGetNotifySchema', 'vote', '', 'CVoteNotifySchema', 'OnGetNotifySchema', '', 1, '97ffe9642e64dc7d68f9ec9bc789be47'),
	(324, NULL, 100, 'main', 'OnBeforeProlog', 'main', '/modules/main/install/wizard_sol/panel_button.php', 'CWizardSolPanel', 'ShowPanel', '', 1, 'bbd7b8c1e518a0b3eae815eb91a95c11');

-- Дамп структуры для таблица globus.b_numerator
CREATE TABLE IF NOT EXISTS `b_numerator` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_AT` datetime DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `UPDATED_BY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_numerator: ~0 rows (приблизительно)
DELETE FROM `b_numerator`;

-- Дамп структуры для таблица globus.b_numerator_sequence
CREATE TABLE IF NOT EXISTS `b_numerator_sequence` (
  `NUMERATOR_ID` int(11) NOT NULL DEFAULT 0,
  `KEY` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `TEXT_KEY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NEXT_NUMBER` int(11) DEFAULT NULL,
  `LAST_INVOCATION_TIME` int(11) DEFAULT NULL,
  PRIMARY KEY (`NUMERATOR_ID`,`KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_numerator_sequence: ~0 rows (приблизительно)
DELETE FROM `b_numerator_sequence`;

-- Дамп структуры для таблица globus.b_operation
CREATE TABLE IF NOT EXISTS `b_operation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'module',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_operation: ~118 rows (приблизительно)
DELETE FROM `b_operation`;
INSERT INTO `b_operation` (`ID`, `NAME`, `MODULE_ID`, `DESCRIPTION`, `BINDING`) VALUES
	(1, 'edit_php', 'main', NULL, 'module'),
	(2, 'view_own_profile', 'main', NULL, 'module'),
	(3, 'edit_own_profile', 'main', NULL, 'module'),
	(4, 'view_all_users', 'main', NULL, 'module'),
	(5, 'view_groups', 'main', NULL, 'module'),
	(6, 'view_tasks', 'main', NULL, 'module'),
	(7, 'view_other_settings', 'main', NULL, 'module'),
	(8, 'view_subordinate_users', 'main', NULL, 'module'),
	(9, 'edit_subordinate_users', 'main', NULL, 'module'),
	(10, 'edit_all_users', 'main', NULL, 'module'),
	(11, 'edit_groups', 'main', NULL, 'module'),
	(12, 'edit_tasks', 'main', NULL, 'module'),
	(13, 'edit_other_settings', 'main', NULL, 'module'),
	(14, 'cache_control', 'main', NULL, 'module'),
	(15, 'lpa_template_edit', 'main', NULL, 'module'),
	(16, 'view_event_log', 'main', NULL, 'module'),
	(17, 'edit_ratings', 'main', NULL, 'module'),
	(18, 'manage_short_uri', 'main', NULL, 'module'),
	(19, 'fm_view_permission', 'main', NULL, 'file'),
	(20, 'fm_view_file', 'main', NULL, 'file'),
	(21, 'fm_view_listing', 'main', NULL, 'file'),
	(22, 'fm_edit_existent_folder', 'main', NULL, 'file'),
	(23, 'fm_create_new_file', 'main', NULL, 'file'),
	(24, 'fm_edit_existent_file', 'main', NULL, 'file'),
	(25, 'fm_create_new_folder', 'main', NULL, 'file'),
	(26, 'fm_delete_file', 'main', NULL, 'file'),
	(27, 'fm_delete_folder', 'main', NULL, 'file'),
	(28, 'fm_edit_in_workflow', 'main', NULL, 'file'),
	(29, 'fm_rename_file', 'main', NULL, 'file'),
	(30, 'fm_rename_folder', 'main', NULL, 'file'),
	(31, 'fm_upload_file', 'main', NULL, 'file'),
	(32, 'fm_add_to_menu', 'main', NULL, 'file'),
	(33, 'fm_download_file', 'main', NULL, 'file'),
	(34, 'fm_lpa', 'main', NULL, 'file'),
	(35, 'fm_edit_permission', 'main', NULL, 'file'),
	(36, 'bitrixcloud_monitoring', 'bitrixcloud', NULL, 'module'),
	(37, 'bitrixcloud_backup', 'bitrixcloud', NULL, 'module'),
	(38, 'bitrixcloud_cdn', 'bitrixcloud', NULL, 'module'),
	(39, 'clouds_browse', 'clouds', NULL, 'module'),
	(40, 'clouds_upload', 'clouds', NULL, 'module'),
	(41, 'clouds_config', 'clouds', NULL, 'module'),
	(42, 'fileman_view_all_settings', 'fileman', '', 'module'),
	(43, 'fileman_edit_menu_types', 'fileman', '', 'module'),
	(44, 'fileman_add_element_to_menu', 'fileman', '', 'module'),
	(45, 'fileman_edit_menu_elements', 'fileman', '', 'module'),
	(46, 'fileman_edit_existent_files', 'fileman', '', 'module'),
	(47, 'fileman_edit_existent_folders', 'fileman', '', 'module'),
	(48, 'fileman_admin_files', 'fileman', '', 'module'),
	(49, 'fileman_admin_folders', 'fileman', '', 'module'),
	(50, 'fileman_view_permissions', 'fileman', '', 'module'),
	(51, 'fileman_edit_all_settings', 'fileman', '', 'module'),
	(52, 'fileman_upload_files', 'fileman', '', 'module'),
	(53, 'fileman_view_file_structure', 'fileman', '', 'module'),
	(54, 'fileman_install_control', 'fileman', '', 'module'),
	(55, 'medialib_view_collection', 'fileman', '', 'medialib'),
	(56, 'medialib_new_collection', 'fileman', '', 'medialib'),
	(57, 'medialib_edit_collection', 'fileman', '', 'medialib'),
	(58, 'medialib_del_collection', 'fileman', '', 'medialib'),
	(59, 'medialib_access', 'fileman', '', 'medialib'),
	(60, 'medialib_new_item', 'fileman', '', 'medialib'),
	(61, 'medialib_edit_item', 'fileman', '', 'medialib'),
	(62, 'medialib_del_item', 'fileman', '', 'medialib'),
	(63, 'sticker_view', 'fileman', '', 'stickers'),
	(64, 'sticker_edit', 'fileman', '', 'stickers'),
	(65, 'sticker_new', 'fileman', '', 'stickers'),
	(66, 'sticker_del', 'fileman', '', 'stickers'),
	(67, 'hl_element_read', 'highloadblock', NULL, 'module'),
	(68, 'hl_element_write', 'highloadblock', NULL, 'module'),
	(69, 'hl_element_delete', 'highloadblock', NULL, 'module'),
	(70, 'section_read', 'iblock', NULL, 'iblock'),
	(71, 'element_read', 'iblock', NULL, 'iblock'),
	(72, 'section_element_bind', 'iblock', NULL, 'iblock'),
	(73, 'iblock_admin_display', 'iblock', NULL, 'iblock'),
	(74, 'element_edit', 'iblock', NULL, 'iblock'),
	(75, 'element_edit_price', 'iblock', NULL, 'iblock'),
	(76, 'element_delete', 'iblock', NULL, 'iblock'),
	(77, 'element_bizproc_start', 'iblock', NULL, 'iblock'),
	(78, 'section_edit', 'iblock', NULL, 'iblock'),
	(79, 'section_delete', 'iblock', NULL, 'iblock'),
	(80, 'section_section_bind', 'iblock', NULL, 'iblock'),
	(81, 'element_edit_any_wf_status', 'iblock', NULL, 'iblock'),
	(82, 'iblock_edit', 'iblock', NULL, 'iblock'),
	(83, 'iblock_delete', 'iblock', NULL, 'iblock'),
	(84, 'iblock_rights_edit', 'iblock', NULL, 'iblock'),
	(85, 'iblock_export', 'iblock', NULL, 'iblock'),
	(86, 'section_rights_edit', 'iblock', NULL, 'iblock'),
	(87, 'element_rights_edit', 'iblock', NULL, 'iblock'),
	(88, 'landing_read', 'landing', NULL, 'module'),
	(89, 'landing_edit', 'landing', NULL, 'module'),
	(90, 'landing_sett', 'landing', NULL, 'module'),
	(91, 'landing_public', 'landing', NULL, 'module'),
	(92, 'landing_delete', 'landing', NULL, 'module'),
	(93, 'security_filter_bypass', 'security', NULL, 'module'),
	(94, 'security_edit_user_otp', 'security', NULL, 'module'),
	(95, 'security_module_settings_read', 'security', NULL, 'module'),
	(96, 'security_panel_view', 'security', NULL, 'module'),
	(97, 'security_filter_settings_read', 'security', NULL, 'module'),
	(98, 'security_otp_settings_read', 'security', NULL, 'module'),
	(99, 'security_iprule_admin_settings_read', 'security', NULL, 'module'),
	(100, 'security_session_settings_read', 'security', NULL, 'module'),
	(101, 'security_redirect_settings_read', 'security', NULL, 'module'),
	(102, 'security_stat_activity_settings_read', 'security', NULL, 'module'),
	(103, 'security_iprule_settings_read', 'security', NULL, 'module'),
	(104, 'security_antivirus_settings_read', 'security', NULL, 'module'),
	(105, 'security_frame_settings_read', 'security', NULL, 'module'),
	(106, 'security_module_settings_write', 'security', NULL, 'module'),
	(107, 'security_filter_settings_write', 'security', NULL, 'module'),
	(108, 'security_otp_settings_write', 'security', NULL, 'module'),
	(109, 'security_iprule_admin_settings_write', 'security', NULL, 'module'),
	(110, 'security_session_settings_write', 'security', NULL, 'module'),
	(111, 'security_redirect_settings_write', 'security', NULL, 'module'),
	(112, 'security_stat_activity_settings_write', 'security', NULL, 'module'),
	(113, 'security_iprule_settings_write', 'security', NULL, 'module'),
	(114, 'security_file_verifier_sign', 'security', NULL, 'module'),
	(115, 'security_file_verifier_collect', 'security', NULL, 'module'),
	(116, 'security_file_verifier_verify', 'security', NULL, 'module'),
	(117, 'security_antivirus_settings_write', 'security', NULL, 'module'),
	(118, 'security_frame_settings_write', 'security', NULL, 'module'),
	(119, 'seo_settings', 'seo', '', 'module'),
	(120, 'seo_tools', 'seo', '', 'module');

-- Дамп структуры для таблица globus.b_option
CREATE TABLE IF NOT EXISTS `b_option` (
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MODULE_ID`,`NAME`),
  KEY `ix_option_name` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_option: ~121 rows (приблизительно)
DELETE FROM `b_option`;
INSERT INTO `b_option` (`MODULE_ID`, `NAME`, `VALUE`, `DESCRIPTION`, `SITE_ID`) VALUES
	('blog', 'socNetNewPerms', 'Y', NULL, NULL),
	('fileman', '~allowed_components', '', NULL, NULL),
	('fileman', '~script_files', 'php,php3,php4,php5,php6,phtml,pl,asp,aspx,cgi,exe,ico,shtm,shtml', NULL, NULL),
	('fileman', 'archive_step_time', '30', NULL, NULL),
	('fileman', 'default_edit', 'html', NULL, NULL),
	('fileman', 'default_edit_groups', '', NULL, NULL),
	('fileman', 'different_set', 'N', NULL, NULL),
	('fileman', 'editor_body_class', '', NULL, NULL),
	('fileman', 'editor_body_id', '', NULL, NULL),
	('fileman', 'google_map_api_key', '', NULL, NULL),
	('fileman', 'GROUP_DEFAULT_RIGHT', 'D', NULL, NULL),
	('fileman', 'GROUP_DEFAULT_TASK', '18', NULL, NULL),
	('fileman', 'hide_physical_struc', '', NULL, NULL),
	('fileman', 'log_menu', 'Y', NULL, NULL),
	('fileman', 'log_page', 'Y', NULL, NULL),
	('fileman', 'menutypes', 'a:6:{s:4:\\"left\\";s:19:\\"Левое меню\\";s:3:\\"top\\";s:23:\\"Верхнее меню\\";s:5:\\"upper\\";s:28:\\"Меню выше шапки\\";s:13:\\"header-phones\\";s:30:\\"Телефоны в шапке\\";s:11:\\"header-addr\\";s:26:\\"Адреса в шапке\\";s:6:\\"footer\\";s:26:\\"Меню в подвале\\";}', NULL, NULL),
	('fileman', 'ml_max_height', '1024', NULL, NULL),
	('fileman', 'ml_max_width', '1024', NULL, NULL),
	('fileman', 'ml_media_available_ext', 'jpg,jpeg,gif,png,flv,mp4,wmv,wma,mp3,ppt,aac', NULL, NULL),
	('fileman', 'ml_media_extentions', 'jpg,jpeg,gif,png,flv,mp4,wmv,wma,mp3,ppt', NULL, NULL),
	('fileman', 'ml_thumb_height', '105', NULL, NULL),
	('fileman', 'ml_thumb_width', '140', NULL, NULL),
	('fileman', 'ml_use_default', '1', NULL, NULL),
	('fileman', 'num_menu_param', '1', NULL, NULL),
	('fileman', 'propstypes', 'a:2:{s:11:\\"description\\";s:16:\\"Описание\\";s:8:\\"keywords\\";s:27:\\"Ключевые слова\\";}', NULL, NULL),
	('fileman', 'replace_new_lines', 'Y', NULL, NULL),
	('fileman', 'search_mask', '*.php', NULL, NULL),
	('fileman', 'search_max_open_file_size', '1024', NULL, NULL),
	('fileman', 'search_max_res_count', '', NULL, NULL),
	('fileman', 'search_time_step', '5', NULL, NULL),
	('fileman', 'show_inc_icons', 'N', NULL, NULL),
	('fileman', 'stickers_use_hotkeys', 'N', NULL, NULL),
	('fileman', 'use_code_editor', 'Y', NULL, NULL),
	('fileman', 'use_custom_spell', 'N', NULL, NULL),
	('fileman', 'use_editor_3', 'Y', NULL, NULL),
	('fileman', 'use_medialib', 'Y', NULL, NULL),
	('fileman', 'use_pspell', 'N', NULL, NULL),
	('fileman', 'use_separeted_dics', 'N', NULL, NULL),
	('fileman', 'use_translit', '1', NULL, NULL),
	('fileman', 'use_translit_google', '1', NULL, NULL),
	('fileman', 'user_dics_path', '/bitrix/modules/fileman/u_dics', NULL, NULL),
	('fileman', 'yandex_map_api_key', '', NULL, NULL),
	('forum', 'FILTER', 'N', NULL, NULL),
	('iblock', 'change_user_by_group_active_modify', 'N', NULL, NULL),
	('iblock', 'combined_list_mode', 'Y', NULL, NULL),
	('iblock', 'custom_edit_form_use_property_id', 'Y', NULL, NULL),
	('iblock', 'detail_image_size', '200', NULL, NULL),
	('iblock', 'event_log_iblock', 'Y', NULL, NULL),
	('iblock', 'excel_export_rights', 'N', NULL, NULL),
	('iblock', 'iblock_activity_dates', '', NULL, NULL),
	('iblock', 'iblock_activity_dates_period', '86400', NULL, NULL),
	('iblock', 'iblock_menu_max_sections', '50', NULL, NULL),
	('iblock', 'list_full_date_edit', 'N', NULL, NULL),
	('iblock', 'list_image_size', '50', NULL, NULL),
	('iblock', 'num_catalog_levels', '3', NULL, NULL),
	('iblock', 'path2rss', '/upload/', NULL, NULL),
	('iblock', 'property_features_enabled', 'Y', NULL, NULL),
	('iblock', 'show_xml_id', 'N', NULL, NULL),
	('iblock', 'use_htmledit', 'Y', NULL, NULL),
	('landing', 'pub_path_s1', '/lp/', NULL, NULL),
	('main', '~crypto_b_socialservices_user', 'a:2:{s:7:"OATOKEN";b:1;s:13:"REFRESH_TOKEN";b:1;}', NULL, NULL),
	('main', '~crypto_b_user_auth_code', 'a:1:{s:10:"OTP_SECRET";b:1;}', NULL, NULL),
	('main', '~crypto_b_user_phone_auth', 'a:1:{s:10:"OTP_SECRET";b:1;}', NULL, NULL),
	('main', '~new_license18_0_sign', 'Y', NULL, NULL),
	('main', 'admin_lid', 'ru', NULL, NULL),
	('main', 'admin_passwordh', 'FVkQe2YUBgUtCUVcBBcFCgsTAQ==', NULL, NULL),
	('main', 'control_file_duplicates', 'Y', NULL, NULL),
	('main', 'email_from', 'popugau@gmail.com', NULL, NULL),
	('main', 'GROUP_DEFAULT_TASK', '1', NULL, NULL),
	('main', 'last_mp_modules_result', 'a:4:{s:10:"check_date";i:1676114964;s:13:"update_module";a:0:{}s:10:"end_update";a:0:{}s:10:"new_module";a:0:{}}', NULL, NULL),
	('main', 'optimize_css_files', 'Y', NULL, NULL),
	('main', 'optimize_js_files', 'Y', NULL, NULL),
	('main', 'PARAM_MAX_SITES', '2', NULL, NULL),
	('main', 'PARAM_MAX_USERS', '0', NULL, NULL),
	('main', 'rating_assign_authority_group', '4', NULL, NULL),
	('main', 'rating_assign_authority_group_add', '2', NULL, NULL),
	('main', 'rating_assign_authority_group_delete', '2', NULL, NULL),
	('main', 'rating_assign_rating_group', '3', NULL, NULL),
	('main', 'rating_assign_rating_group_add', '1', NULL, NULL),
	('main', 'rating_assign_rating_group_delete', '1', NULL, NULL),
	('main', 'rating_assign_type', 'auto', NULL, NULL),
	('main', 'rating_authority_rating', '2', NULL, NULL),
	('main', 'rating_authority_weight_formula', 'Y', NULL, NULL),
	('main', 'rating_community_authority', '30', NULL, NULL),
	('main', 'rating_community_last_visit', '90', NULL, NULL),
	('main', 'rating_community_size', '1', NULL, NULL),
	('main', 'rating_count_vote', '10', NULL, NULL),
	('main', 'rating_normalization', '10', NULL, NULL),
	('main', 'rating_normalization_type', 'auto', NULL, NULL),
	('main', 'rating_self_vote', 'Y', NULL, NULL),
	('main', 'rating_start_authority', '3', NULL, NULL),
	('main', 'rating_text_like_d', 'Это нравится', NULL, NULL),
	('main', 'rating_text_like_n', 'Не нравится', NULL, NULL),
	('main', 'rating_text_like_y', 'Нравится', NULL, NULL),
	('main', 'rating_vote_show', 'Y', NULL, NULL),
	('main', 'rating_vote_template', 'like', NULL, NULL),
	('main', 'rating_vote_type', 'like', NULL, NULL),
	('main', 'rating_vote_weight', '10', NULL, NULL),
	('main', 'secure_logout', 'Y', NULL, NULL),
	('main', 'server_uniq_id', '2211f06a8942da2c4df3a85313d52664', NULL, NULL),
	('main', 'signer_default_key', '6574e7c9811b7cacd7b2f28320c3ed9257f9daa720e48e3c0222aa3f806212e3d589b1d635f404d278b6a3ac2c9950992a0caa8b2153968da58caf6a88947245', NULL, NULL),
	('main', 'update_site', 'www.1c-bitrix.ru', NULL, NULL),
	('main', 'update_site_ns', 'Y', NULL, NULL),
	('main', 'vendor', '1c_bitrix', NULL, NULL),
	('messageservice', 'clean_up_period', '14', NULL, NULL),
	('rest', 'app_immune', '["infoservice.migrator_amocrm","informunity.excel","integrations24ru.pipedrive","integrations24ru.asana","integrations24ru.sugar","bitrix.eshop","bitrix.1cdoc","bitrix.assistant","bitrix.denominationby","bitrix.propertiesbot","bitrix.giphybot","bitrix.1c","bitrix.restapi","bitrix.partnerlandingexport","bitrix.partnerapplication","bitrix.partnerlanding","bitrix.1ctotal","integrations24.pipedrive","integrations24ru.pipedrive","integrations24.zoho","integrations24.asana","integrations24ru.asana","integrations24.sugar","integrations24ru.sugar","integrations24.jira_migration","integrations24.qbinventory","integrations24.zohoinventory","SEVERCODE.trello_migrator","htmls.ms_migrator","integrations24.mns_kazakhstan_poisk_po_bin","integrations24.portal_nalog_gov_by","bitrix.khellouin_ru","bitrix.den_zashchitnika_otechestva_2_ru","bitrix.mezhdunarodnyy_zhenskiy_den_2_ua","bitrix.mezhdunarodnyy_zhenskiy_den_3_ua","bitrix.mezhdunarodnyy_zhenskiy_den_ua","bitrix.den_smekha_ua","bitrix.den_svyatogo_valentina_ua","bitrix.den_vsekh_vlyublyennykh_ua","bitrix.katolicheskaya_paskha_ua","bitrix.novyy_god_ua","bitrix.rozhdestvo_ua","bitrix.valentinov_den_ua","bitrix.pravoslavnaya_paskha_ua","bitrix.chernaya_pyatnitsa_ua","bitrix.khellouin_ua","bitrix.den_zashchitnika_otechestva_3_ru","bitrix.den_zashchitnika_otechestva_ru","bitrix.den_zashchitnika_otechestva_by","bitrix.den_zashchitnika_otechestva_2_by","bitrix.den_zashchitnika_otechestva_3_by","bitrix.den_zashchitnika_otechestva_kz","bitrix.den_zashchitnika_otechestva_2_kz","bitrix.den_zashchitnika_otechestva_3_kz","bitrix.pravoslavnaya_paskha_ru","bitrix.pravoslavnaya_paskha_by","bitrix.pravoslavnaya_paskha_kz","bitrix.den_smekha_ru","bitrix.den_smekha_by","bitrix.den_smekha_kz","bitrix.valentinov_den_ru","bitrix.valentinov_den_by","bitrix.valentinov_den_kz","bitrix.rozhdestvo_ru","bitrix.rozhdestvo_by","bitrix.rozhdestvo_kz","bitrix.novyy_god_ru","bitrix.novyy_god_by","bitrix.novyy_god_kz","bitrix.katolicheskaya_paskha_ru","bitrix.katolicheskaya_paskha_by","bitrix.katolicheskaya_paskha_kz","bitrix.den_vsekh_vlyublyennykh_ru","bitrix.den_vsekh_vlyublyennykh_by","bitrix.den_vsekh_vlyublyennykh_kz","bitrix.den_svyatogo_valentina_ru","bitrix.den_svyatogo_valentina_by","bitrix.den_svyatogo_valentina_kz","bitrix.mezhdunarodnyy_zhenskiy_den_ru","bitrix.mezhdunarodnyy_zhenskiy_den_by","bitrix.mezhdunarodnyy_zhenskiy_den_kz","bitrix.mezhdunarodnyy_zhenskiy_den_2_ru","bitrix.mezhdunarodnyy_zhenskiy_den_2_by","bitrix.mezhdunarodnyy_zhenskiy_den_2_kz","bitrix.mezhdunarodnyy_zhenskiy_den_3_ru","bitrix.mezhdunarodnyy_zhenskiy_den_3_by","bitrix.mezhdunarodnyy_zhenskiy_den_3_kz","bitrix.thanksgiving_day_en","bitrix.april_fools_day_en","bitrix.valentine_s_day_en","bitrix.valentine_s_day_2_en","bitrix.valentine_s_day_3_en","bitrix.chernaya_pyatnitsa_ru","bitrix.chernaya_pyatnitsa_by","bitrix.chernaya_pyatnitsa_kz","bitrix.khellouin_by","bitrix.khellouin_kz","bitrix.easter_en","bitrix.halloween_en","bitrix.christmas_en","bitrix.new_year_en","bitrix.black_friday_en","bitrix.kraytvirtualtravel_ru","bitrix.kraytvirtualtravel_by","bitrix.kraytvirtualtravel_kz","bitrix.kraytvirtualtravel_ua","bitrix.kraytnutritionist_ru","bitrix.kraytnutritionist_by","bitrix.delobotcorporatetraining_en","bitrix.delobotblackfriday_en","bitrix.delobotcleaningcompany_en","bitrix.delobotfitness_en","bitrix.delobotfooddelivery_en","bitrix.delobotvisagiste_en","bitrix.delobotpsychologist_en","bitrix.delobotflorist_en","bitrix.delobotdecoration_en","bitrix.delobotcarservice_en","bitrix.kraytagency_en","bitrix.kraytagriculture_en","bitrix.kraytarchitecture_en","bitrix.kraytbusiness_en","bitrix.kraytdelivery_en","bitrix.kraytevents_en","bitrix.kraythalloween_en","bitrix.kraytvetclinic_en","bitrix.kraytmasterforhour_en","bitrix.kraytinstagramcontacts_en","bitrix.kraytinstagramstock_en","bitrix.kraytinstagramtarget_en","bitrix.kraytonlinebabysitter_en","bitrix.kraytpetservice_en","bitrix.kraytsolarenergy_en","bitrix.kraytsportonline_en","bitrix.kraytsummersale_en","bitrix.krayttravelblog_en","bitrix.kraytvebinar_en","bitrix.kraytartificialintelligence_en","bitrix.kraytbakeryproducts_en","bitrix.kraytchildrensschool_en","bitrix.kraytfooddelivery_en","bitrix.kraytfurniture_en","bitrix.kraytvirtualtravel_en","bitrix.kraytyoutubechannel_en","bitrix.kraytknitting_en","bitrix.kraytnutritionist_en","bitrix.kraytnailservice_en","bitrix.kraytmedicine_en","bitrix.kraytprofipage_en","bitrix.kraytsale11_en","bitrix.delobotblackfriday_ua","bitrix.delobotcleaning_ua","bitrix.delobotcorporatetraining_ua","bitrix.delobotfitness_ua","bitrix.delobotfooddelivery_ua","bitrix.delobotvisagiste_ua","bitrix.kraytagency_ua","bitrix.kraytagriculture_ua","bitrix.kraytarchitecture_ua","bitrix.kraytbusiness_ua","bitrix.kraytevents_ua","bitrix.kraythalloween_ua","bitrix.kraytinstagramcontacts_ua","bitrix.kraytinstagramstock_ua","bitrix.kraytinstagramtarget_ua","bitrix.kraytpetservice_ua","bitrix.kraytsolarenergy_ua","bitrix.kraytsummersale_ua","bitrix.krayttravelblog_ua","bitrix.kraytvebinar_ua","bitrix.kraytvetclinic_ua","bitrix.kraytnutritionist_ua","bitrix.kraytnutritionist_kz","bitrix.kraytfurniture_by","bitrix.kraytfurniture_ru","bitrix.kraytfurniture_kz","bitrix.kraytfurniture_ua","bitrix.kraytmedicine_ru","bitrix.kraytmedicine_by","bitrix.kraytmedicine_kz","bitrix.kraytmedicine_ua","bitrix.kraytsale11_ru","bitrix.kraytsale11_by","bitrix.kraytsale11_kz","bitrix.kraytsale11_ua","bitrix.kraytnailservice_ru","bitrix.kraytnailservice_by","bitrix.kraytnailservice_kz","bitrix.kraytnailservice_ua","bitrix.kraytknitting_ru","bitrix.kraytknitting_by","bitrix.kraytknitting_kz","bitrix.kraytknitting_ua","bitrix.kraytfooddelivery_ru","bitrix.kraytfooddelivery_by","bitrix.kraytfooddelivery_kz","bitrix.kraytfooddelivery_ua","bitrix.kraytbakeryproducts_ru","bitrix.kraytbakeryproducts_by","bitrix.kraytbakeryproducts_kz","bitrix.kraytbakeryproducts_ua","bitrix.kraytschoolmusic_ru","bitrix.kraytschoolmusic_by","bitrix.kraytschoolmusic_kz","bitrix.kraytschoolmusic_ua","bitrix.kraytautomechanic_ru","bitrix.kraytautomechanic_by","bitrix.kraytautomechanic_kz","bitrix.kraytautomechanic_ua","bitrix.kraytpresents_ru","bitrix.kraytpresents_by","bitrix.kraytpresents_kz","bitrix.kraytpresents_ua","bitrix.kraytportfoliophotographer_ru","bitrix.kraytportfoliophotographer_by","bitrix.kraytportfoliophotographer_kz","bitrix.kraytportfoliophotographer_ua","bitrix.kraytcrm_ru","bitrix.delobotcleaningcompany_ru","bitrix.delobotblackfriday_ru","bitrix.delobotblackfriday_by","bitrix.delobotblackfriday_kz","bitrix.delobotcleaningcompany_by","bitrix.delobotcleaningcompany_kz","bitrix.delobotcorporatetraining_ru","bitrix.delobotcorporatetraining_by","bitrix.delobotcorporatetraining_kz","bitrix.delobotfitness_ru","bitrix.delobotfitness_by","bitrix.delobotfitness_kz","bitrix.delobotfooddelivery_ru","bitrix.delobotfooddelivery_by","bitrix.delobotfooddelivery_kz","bitrix.delobotvisagiste_ru","bitrix.delobotvisagiste_by","bitrix.delobotvisagiste_kz","bitrix.delobotgiftsforwomensday_ru","bitrix.delobotgiftsforwomensday_by","bitrix.delobotgiftsforwomensday_kz","bitrix.delobotgiftsforwomensday_ua","bitrix.delobotwebdesigner_ru","bitrix.delobotwebdesigner_by","bitrix.delobotwebdesigner_kz","bitrix.delobotwebdesigner_ua","bitrix.delobotatelier_ru","bitrix.delobotatelier_by","bitrix.delobotatelier_kz","bitrix.delobotatelier_ua","bitrix.delobotconstructioncompany_ru","bitrix.delobotconstructioncompany_by","bitrix.delobotconstructioncompany_ua","bitrix.delobotlanguageschool_ru","bitrix.delobotlanguageschool_by","bitrix.delobotlanguageschool_kz","bitrix.delobotlanguageschool_ua","bitrix.delobotcoffee_ru","bitrix.delobotcoffee_by","bitrix.delobotcoffee_kz","bitrix.delobotcoffee_ua","bitrix.kraytcrm_by","bitrix.kraytcrm_kz","bitrix.kraytcrm_ua","bitrix.kraytonlinebabysitter_ru","bitrix.kraytonlinebabysitter_by","bitrix.kraytonlinebabysitter_kz","bitrix.kraytonlinebabysitter_uaa","bitrix.kraytsportonline_ru","bitrix.kraytsportonline_by","bitrix.kraytsportonline_kz","bitrix.kraytsportonline_ua","bitrix.kraytmasterforhour_ru","bitrix.kraytmasterforhour_by","bitrix.kraytmasterforhour_kz","bitrix.kraytmasterforhour_ua","bitrix.kraytdelivery_ru","bitrix.kraytdelivery_by","bitrix.kraytdelivery_kz","bitrix.kraytdelivery_ua","bitrix.kraytrepairservice_ru","bitrix.kraytrepairservice_by","bitrix.kraytrepairservice_kz","bitrix.kraytrepairservice_ua","bitrix.kraytprofipage_ru","bitrix.kraytprofipage_by","bitrix.kraytprofipage_kz","bitrix.kraytprofipage_ua","bitrix.krayttutor_ru","bitrix.krayttutor_by","bitrix.krayttutor_kz","bitrix.krayttutor_ua","bitrix.kraytartificialintelligence_ru","bitrix.kraytartificialintelligence_by","bitrix.kraytartificialintelligence_kz","bitrix.kraytartificialintelligence_ua","bitrix.kraytyoutubechannel_ru","bitrix.kraytyoutubechannel_by","bitrix.kraytyoutubechannel_kz","bitrix.kraytyoutubechannel_ua","bitrix.kraytchildrensschool_ru","bitrix.kraytchildrensschool_by","bitrix.kraytchildrensschool_kz","bitrix.kraytchildrensschool_ua","bitrix.krayttravelagency_ru","bitrix.krayttravelagency_by","bitrix.krayttravelagency_kz","bitrix.krayttravelagency_ua","bitrix.krayttranslator_ru","bitrix.krayttranslator_by","bitrix.krayttranslator_kz","bitrix.krayttranslator_ua","bitrix.kraytstylist_ru","bitrix.kraytstylist_by","bitrix.kraytstylist_kz","bitrix.kraytstylist_ua","bitrix.kraytstretchingstudio_ru","bitrix.kraytstretchingstudio_by","bitrix.kraytstretchingstudio_kz","bitrix.kraytstretchingstudio_ua","bitrix.kraytsportschool_ru","bitrix.kraytsportschool_by","bitrix.kraytsportschool_kz","bitrix.kraytsportschool_ua","bitrix.kraytsitedesigner_ru","bitrix.kraytsitedesigner_by","bitrix.kraytsitedesigner_kz","bitrix.kraytsitedesigner_ua","bitrix.kraytsport_ru","bitrix.kraytsport_by","bitrix.kraytsport_kz","bitrix.kraytsport_ua","bitrix.kraytmobileapp_ru","bitrix.kraytmobileapp_by","bitrix.kraytmobileapp_kz","bitrix.kraytmobileapp_ua","bitrix.kraytrealestate_ru","bitrix.kraytrealestate_by","bitrix.kraytrealestate_kz","bitrix.kraytrealestate_ua","bitrix.delobotnewyearsale_ru","bitrix.delobotnewyearsale_by","bitrix.delobotnewyearsale_kz","bitrix.delobotnewyearsale_ua","bitrix.delobotyoga_ru","bitrix.delobotyoga_by","bitrix.delobotyoga_kz","bitrix.delobotyoga_ua","bitrix.delobotcake_ru","bitrix.delobotcake_by","bitrix.delobotcake_kz","bitrix.delobotcake_ua","bitrix.delobotveterinarian_ru","bitrix.delobotveterinarian_by","bitrix.delobotveterinarian_kz","bitrix.delobotveterinarian_ua","bitrix.delobotpsychologist_ru","bitrix.delobotpsychologist_by","bitrix.delobotpsychologist_kz","bitrix.delobotpsychologist_ua","bitrix.delobotdecoration_ru","bitrix.delobotdecoration_by","bitrix.delobotdecoration_kz","bitrix.delobotdecoration_ua","bitrix.delobotflorist_ru","bitrix.delobotflorist_by","bitrix.delobotflorist_kz","bitrix.delobotflorist_ua","bitrix.delobotcarservice_ru","bitrix.delobotcarservice_by","bitrix.delobotcarservice_kz","bitrix.delobotcarservice_ua","bitrix.delobotcargotransportation_ru","bitrix.delobotcargotransportation_by","bitrix.delobotcargotransportation_kz","bitrix.delobotcargotransportation_ua","bitrix.delobotrealtor_ru","bitrix.delobotrealtor_by","bitrix.delobotrealtor_kz","bitrix.delobotrealtor_ua","bitrix.delobotfurnituremanufacturing_ru","bitrix.delobotfurnituremanufacturing_by","bitrix.delobotfurnituremanufacturing_kz","bitrix.delobotfurnituremanufacturing_ua","bitrix.delobotorganizationofholidays_ru","bitrix.delobotorganizationofholidays_by","bitrix.delobotorganizationofholidays_kz","bitrix.delobotorganizationofholidays_ua","bitrix.delobotconcertannounce_ru","bitrix.delobotconcertannounce_by","bitrix.delobotconcertannounce_kz","bitrix.delobotconcertannounce_ua","bitrix.delobotphotographersservice_ru","bitrix.delobotphotographersservice_by","bitrix.delobotphotographersservice_kz","bitrix.delobotphotographersservice_ua","bitrix.kraytsecurityagency_ru","bitrix.kraytsecurityagency_by","bitrix.kraytsecurityagency_kz","bitrix.kraytsecurityagency_ua","bitrix.kraytrecordingstudio_ru","bitrix.kraytrecordingstudio_by","bitrix.kraytrecordingstudio_kz","bitrix.kraytrecordingstudio_ua","bitrix.kraytrealestateagent_ru","bitrix.kraytrealestateagent_by","bitrix.kraytrealestateagent_kz","bitrix.kraytrealestateagent_ua","bitrix.delobotdecorationhouses_ru","bitrix.delobotdecorationhouses_by","bitrix.delobotdecorationhouses_kz","bitrix.delobotdecorationhouses_ua","bitrix.delobotairconditioners_ru","bitrix.delobotairconditioners_by","bitrix.delobotairconditioners_kz","bitrix.delobotairconditioners_ua","bitrix.delobotdesignworkshop_ru","bitrix.delobotdesignworkshop_by","bitrix.delobotdesignworkshop_kz","bitrix.delobotdesignworkshop_ua","bitrix.delobotcitygreeningproject_ru","bitrix.delobotcitygreeningproject_by","bitrix.delobotcitygreeningproject_kz","bitrix.delobotcitygreeningproject_ua","bitrix.delobotecoproducts_ru","bitrix.delobotecoproducts_by","bitrix.delobotecoproducts_kz","bitrix.delobotecoproducts_ua","bitrix.delobotsoundrecordingservices_ru","bitrix.delobotsoundrecordingservices_by","bitrix.delobotsoundrecordingservices_kz","bitrix.delobotsoundrecordingservices_ua","bitrix.delobotsecurityservice_ru","bitrix.delobotsecurityservice_by","bitrix.delobotsecurityservice_kz","bitrix.delobotsecurityservice_ua","bitrix.delobotsportschool_ru","bitrix.delobotsportschool_by","bitrix.delobotsportschool_kz","bitrix.delobotsportschool_ua","bitrix.delobotfamilyleisure_ru","bitrix.delobotfamilyleisure_by","bitrix.delobotfamilyleisure_kz","bitrix.delobotfamilyleisure_ua","bitrix.delobotdoctortherapist_ru","bitrix.delobotdoctortherapist_by","bitrix.delobotdoctortherapist_kz","bitrix.delobotdoctortherapist_ua","bitrix.kraytagency_ru","bitrix.kraytagency_by","bitrix.kraytagency_kz","bitrix.kraytarchitecture_ru","bitrix.kraytarchitecture_by","bitrix.kraytarchitecture_kz","bitrix.kraytagriculture_ru","bitrix.kraytagriculture_by","bitrix.kraytagriculture_kz","bitrix.kraytbusiness_ru","bitrix.kraytbusiness_by","bitrix.kraytbusiness_kz","bitrix.kraytevents_ru","bitrix.kraytevents_by","bitrix.kraytevents_kz","bitrix.kraythalloween_ru","bitrix.kraythalloween_by","bitrix.kraythalloween_kz","bitrix.kraytinstagramtarget_ru","bitrix.kraytinstagramtarget_by","bitrix.kraytinstagramtarget_kz","bitrix.kraytinstagramcontacts_ru","bitrix.kraytinstagramcontacts_by","bitrix.kraytinstagramcontacts_kz","bitrix.kraytinstagramstock_ru","bitrix.kraytinstagramstock_by","bitrix.kraytinstagramstock_kz","bitrix.kraytpetservice_ru","bitrix.kraytpetservice_by","bitrix.kraytpetservice_kz","bitrix.kraytsolarenergy_ru","bitrix.kraytsolarenergy_by","bitrix.kraytsolarenergy_kz","bitrix.kraytsummersale_ru","bitrix.kraytsummersale_by","bitrix.kraytsummersale_kz","bitrix.krayttravelblog_ru","bitrix.krayttravelblog_by","bitrix.krayttravelblog_kz","bitrix.kraytvebinar_ru","bitrix.kraytvebinar_by","bitrix.kraytvebinar_kz","bitrix.kraytvetclinic_ru","bitrix.kraytvetclinic_by","bitrix.kraytvetclinic_kz","bitrix.kraytrestaurant_ru","bitrix.kraytrestaurant_by","bitrix.kraytrestaurant_kz","bitrix.kraytrestaurant_ua","bitrix.kraytweddingservices_ru","bitrix.kraytweddingservices_by","bitrix.kraytweddingservices_kz","bitrix.kraytweddingservices_ua","bitrix.kraytoptics_ru","bitrix.kraytoptics_by","bitrix.kraytoptics_kz","bitrix.kraytoptics_ua","bitrix.krayt3dprint_ru","bitrix.krayt3dprint_by","bitrix.krayt3dprint_kz","bitrix.krayt3dprint_ua","bitrix.kraytbusinesspremisesdesign_ru","bitrix.kraytbusinesspremisesdesign_by","bitrix.kraytbusinesspremisesdesign_kz","bitrix.kraytbusinesspremisesdesign_ua","bitrix.kraytcentersproject_ru","bitrix.kraytcentersproject_by","bitrix.kraytcentersproject_kz","bitrix.kraytcentersproject_ua","bitrix.kraytcitygreening_ru","bitrix.kraytcitygreening_by","bitrix.kraytcitygreening_kz","bitrix.kraytcitygreening_ua","bitrix.kraytclimatesystems_ru","bitrix.kraytclimatesystems_by","bitrix.kraytclimatesystems_kz","bitrix.kraytclimatesystems_ua","bitrix.kraytclinicmomandbaby_ru","bitrix.kraytclinicmomandbaby_by","bitrix.kraytclinicmomandbaby_kz","bitrix.kraytclinicmomandbaby_ua","bitrix.kraytdesignerclothing_ru","bitrix.kraytdesignerclothing_by","bitrix.kraytdesignerclothing_kz","bitrix.kraytdesignerclothing_ua","bitrix.kraytprivatedoctor_ru","bitrix.kraytprivatedoctor_by","bitrix.kraytprivatedoctor_kz","bitrix.kraytprivatedoctor_ua","bitrix.kraytprintinghouse_ru","bitrix.kraytprintinghouse_by","bitrix.kraytprintinghouse_kz","bitrix.kraytprintinghouse_ua","bitrix.kraytpersonalcoach_ru","bitrix.kraytpersonalcoach_by","bitrix.kraytpersonalcoach_kz","bitrix.kraytpersonalcoach_ua","bitrix.kraytperfumer_ru","bitrix.kraytperfumer_by","bitrix.kraytperfumer_kz","bitrix.kraytperfumer_ua","bitrix.kraytnewsblog_ru","bitrix.kraytnewsblog_by","bitrix.kraytnewsblog_kz","bitrix.kraytnewsblog_ua","bitrix.kraytmakeupstudio_ru","bitrix.kraytmakeupstudio_by","bitrix.kraytmakeupstudio_kz","bitrix.kraytmakeupstudio_ua","bitrix.kraytlawyer_ru","bitrix.kraytlawyer_by","bitrix.kraytlawyer_kz","bitrix.kraytlawyer_ua","bitrix.kraytlandscapedesign_ru","bitrix.kraytlandscapedesign_by","bitrix.kraytlandscapedesign_kz","bitrix.kraytlandscapedesign_ua","bitrix.kraytjewelryrepairshop_ru","bitrix.kraytjewelryrepairshop_by","bitrix.kraytjewelryrepairshop_kz","bitrix.kraytjewelryrepairshop_ua","bitrix.kraytinteriordesign_ru","bitrix.kraytinteriordesign_by","bitrix.kraytinteriordesign_kz","bitrix.kraytinsurancecompany_ru","bitrix.kraytinsurancecompany_kz","bitrix.kraytinsurancecompany_ua","bitrix.kraytillustrator_ru","bitrix.kraytillustrator_by","bitrix.kraytillustrator_kz","bitrix.kraytillustrator_ua","bitrix.kraytgiftsvalentineday_ru","bitrix.kraytgiftsvalentineday_by","bitrix.kraytgiftsvalentineday_kz","bitrix.kraytgiftsvalentineday_ua","bitrix.kraytfebruary23_ru","bitrix.kraytfebruary23_by","bitrix.kraytfebruary23_kz","bitrix.kraytfebruary23_ua","bitrix.kraytequipmentrepair_ru","bitrix.kraytequipmentrepair_by","bitrix.kraytequipmentrepair_kz","bitrix.kraytequipmentrepair_ua","bitrix.kraytdentistry_ru","bitrix.kraytdentistry_by","bitrix.kraytdentistry_kz","bitrix.kraytdentistry_ua","bitrix.kraytdancemarathon_ru","bitrix.kraytdancemarathon_by","bitrix.kraytdancemarathon_kz","bitrix.kraytdancemarathon_ua","bitrix.kraytcourseformothers_ru","bitrix.kraytcourseformothers_by","bitrix.kraytcourseformothers_kz","bitrix.kraytcourseformothers_ua","bitrix.kraytcosmetologist_ru","bitrix.kraytcosmetologist_by","bitrix.kraytcosmetologist_kz","bitrix.kraytcosmetologist_ua","bitrix.kraytconstructionofprivatehouses_ru","bitrix.kraytconstructionofprivatehouses_by","bitrix.kraytconstructionofprivatehouses_kz","bitrix.kraytconstructionofprivatehouses_ua","bitrix.kraytconfectionery_ru","bitrix.kraytconfectionery_by","bitrix.kraytconfectionery_kz","bitrix.kraytconfectionery_ua","bitrix.kraytcoffeehouse_ru","bitrix.kraytcoffeehouse_by","bitrix.kraytcoffeehouse_kz","bitrix.kraytcoffeehouse_ua","bitrix.kraytcleaningservice_ru","bitrix.kraytcleaningservice_by","bitrix.kraytcleaningservice_kz","bitrix.kraytcleaningservice_ua","bitrix.kraytbeautystudio_ru","bitrix.kraytbeautystudio_by","bitrix.kraytbeautystudio_kz","bitrix.kraytbeautystudio_ua","bitrix.kraytbarbershop_ru","bitrix.kraytbarbershop_by","bitrix.kraytartworkshop_by","bitrix.kraytbarbershop_kz","bitrix.kraytbarbershop_ua","bitrix.kraytartworkshop_ru","bitrix.kraytartworkshop_kz","bitrix.kraytartworkshop_ua","bitrix.kraytaprilfoolsdaygifts_ru","bitrix.kraytaprilfoolsdaygifts_by","bitrix.kraytaprilfoolsdaygifts_kz","bitrix.kraytaprilfoolsdaygifts_ua","bitrix.kraytwindowinstallation_ru","bitrix.kraytwindowinstallation_by","bitrix.kraytwindowinstallation_kz","bitrix.kraytwindowinstallation_ua","bitrix.kraytwindowdesign_ru","bitrix.kraytwindowdesign_by","bitrix.kraytwindowdesign_kz","bitrix.kraytwindowdesign_ua","bitrix.krayttelecommunications_ru","bitrix.krayttelecommunications_by","bitrix.krayttelecommunications_kz","bitrix.krayttelecommunications_ua","bitrix.kraytsportsnutritionorder_ru","bitrix.kraytsportsnutritionorder_by","bitrix.kraytsportsnutritionorder_kz","bitrix.kraytsportsnutritionorder_ua","bitrix.kraytreconstructionoffices_ru","bitrix.kraytreconstructionoffices_by","bitrix.kraytreconstructionoffices_kz","bitrix.kraytreconstructionoffices_ua","bitrix.kraytpremisestrade_ru","bitrix.kraytpremisestrade_by","bitrix.kraytpremisestrade_ua","bitrix.kraytinsulationhouses_ru","bitrix.kraytinsulationhouses_by","bitrix.kraytinsulationhouses_kz","bitrix.kraytinsulationhouses_ua","bitrix.kraytinstallsecuritysystems_ru","bitrix.kraytinstallsecuritysystems_by","bitrix.kraytinstallsecuritysystems_kz","bitrix.kraytinstallsecuritysystems_ua","bitrix.kraytinstallbathrooms_ru","bitrix.kraytinstallbathrooms_by","bitrix.kraytinstallbathrooms_kz","bitrix.kraytinstallbathrooms_ua","bitrix.kraythousedesign_ru","bitrix.kraythousedesign_by","bitrix.kraythousedesign_kz","bitrix.kraythousedesign_ua","bitrix.kraythospitalforfamily_ru","bitrix.kraythospitalforfamily_by","bitrix.kraythospitalforfamily_kz","bitrix.kraythospitalforfamily_ua","bitrix.kraythomedecoration_ru","bitrix.kraythomedecoration_by","bitrix.kraythomedecoration_kz","bitrix.kraythomedecoration_ua","bitrix.kraytfurniturettransformer_ru","bitrix.kraytfurniturettransformer_by","bitrix.kraytfurniturettransformer_kz","bitrix.kraytfurniturettransformer_ua","bitrix.kraytfloristics_ru","bitrix.kraytfloristics_by","bitrix.kraytfloristics_kz","bitrix.kraytfloristics_ua","bitrix.kraytfestiveevents_ru","bitrix.kraytfestiveevents_by","bitrix.kraytfestiveevents_kz","bitrix.kraytfestiveevents_ua","bitrix.kraytecogreen_ru","bitrix.kraytecogreen_by","bitrix.kraytecogreen_kz","bitrix.kraytecogreen_ua","bitrix.kraytdoorinstallation_ru","bitrix.kraytdoorinstallation_by","bitrix.kraytdoorinstallation_kz","bitrix.kraytdoorinstallation_ua","bitrix.kraytdoordesign_ru","bitrix.kraytdoordesign_by","bitrix.kraytdoordesign_kz","bitrix.kraytdoordesign_ua","bitrix.kraytdesigningpeopledisabilities_ru","bitrix.kraytdesigningpeopledisabilities_by","bitrix.kraytdesigningpeopledisabilities_kz","bitrix.kraytdesigningpeopledisabilities_ua","bitrix.delobotkindergarten_ru","bitrix.kraytvideostudio_ru","bitrix.kraytlegalservices_ru","bitrix.kraytaccountingservices_ru","bitrix.kraytbookannouncement_ru","bitrix.kraytcharity_ru","bitrix.kraytspa_ru","bitrix.kraythandmadecosmetics_ru","bitrix.delobotmusic_ru","bitrix.kraythotelforanimals_ru","bitrix.kraytcityguide_ru","bitrix.delobotfoodblog_ru","bitrix.delobotgamedeveloper_ru","bitrix.delobotrenovationoffices_ru","bitrix.delobotcourses_ru","bitrix.delobotcityb__beautification_ru","bitrix.delobotaidfund_ru","bitrix.delobotnewsblog_ru","bitrix.delobottransportservices_ru","bitrix.delobotguide_ru","bitrix.delobotnnturalcosmetic_ru","bitrix.delobotboutiqueforsale_ru","bitrix.delobotorganizationweddings_ru","bitrix.delobotbeautyandrecreationcenter_ru","bitrix.delobotwriter_ru","bitrix.kraytotel","bitrix.kraytigrovoyklub","bitrix.kraytbazaotdykha","bitrix.kraytkurspotiktoku","bitrix.kraytkadrovoeagenstvo","bitrix.kraytportfoliomodeli","bitrix.kraytminecraftserver","bitrix.kraytigrovayakompaniya","bitrix.delobotuslugivideoproizvodstva","bitrix.delobotportfolioaktera","bitrix.delobotpub","bitrix.delobotminihotel","bitrix.delobotcamping","bitrix.delobotcafe","bitrix.delobotizgotovlenieduxov","bitrix.delobotbuhgalterskoeobslujivanie","bitrix.delobotarendanedvizimosti","bitrix.delobotalternativnayaenergetika","bitrix.delobotagentstvoponaimy","bitrix.kraytpodarkikjenskomydny","bitrix.kraytinstagramcontacts_ru1","bitrix.kraytinstagramstock_ru1","bitrix.kraytinstagramtarget_ru1","bitrix.kraytkhimchistka","bitrix.krayt_detskaya_odezhda_na_zakaz","bitrix.krayt_retsepty_blyud","bitrix.krayt_detskaya_mebel","bitrix.krayt_biblioteka","bitrix.krayt_pitomnik_rasteniy","bitrix.delobot_lawyer","bitrix.delobot_oformlenie_dverey","bitrix.delobot_montaj_dverey","bitrix.delobot_manicure_and_pedicure","bitrix.delobot_printing_services","bitrix.delobot_plants","bitrix.delobot_nutritionist","bitrix.delobot_designer_tableware","bitrix.delobot_montaj_okon","bitrix.delobot_oformlenie_okon","bitrix.krayt_zhurnalist","bitrix.krayt_tato_salon","bitrix.krayt_massajist","bitrix.krayt_consulting","bitrix.krayt_elektromontazh","bitrix.krayt_rezyume_spetsialista","bitrix.kraytportfoliophotographer","bitrix.kraytbeautystudio_en","bitrix.kraytautomechanic_en","bitrix.kraytequipmentrepair_en","bitrix.delobot_furniture_for_children","bitrix.delobot_architectural_projects","bitrix.delobot_scientists_page","bitrix.delobot_tatoo_studio","bitrix.delobot_journalist_resume","bitrix.delobot_leather_goods","bitrix.delobot_dance_marathon","bitrix.krayt_art_gallery","bitrix.krayt_leather_products","bitrix.krayt_scientific_researcher","bitrix.krayt_bureau_of_architecture","bitrix.krayt_jewelry_designer","bitrix.krayt_food_photographer","bitrix.krayt_acting_studio","bitrix.krayt_farm","bitrix.krayt_fashion_blog","bitrix.krayt_birthday_cakes","bitrix.krayt_plussize_fashion","bitrix.krayt_diving","bitrix.krayt_it_services","bitrix.krayt_beauty_blog","bitrix.krayt_aquarium","bitrix.krayt_sport_blog","bitrix.delobot_online_library","bitrix.delobot_diving_center","bitrix.delobot_designer_jewelry","bitrix.delobot_nail_art_course","bitrix.delobot_art_galery","bitrix.delobot_fashion_for_everyone","bitrix.delobot_handmade_chocolate","bitrix.krayt_chocolate_shop","bitrix.krayt_advertising_agency","bitrix.krayt_asian_food","bitrix.krayt_avtorskiy_master_klass","bitrix.krayt_utilizatsiya_otkhodov","bitrix.krayt_italyanskaya_kukhnya","bitrix.krayt_kurs_po_nogtevomu_servisu","bitrix.krayt_begovoy_klub","bitrix.krayt_gornyy_turizm","bitrix.krayt_biznes_prostranstvo","bitrix.krayt_shkola_iskusstv","bitrix.krayt_onlayn_intensiv_inostrannogo_yazyka","bitrix.delobot_reklama_brenda","bitrix.delobot_italyanskiy_restoran","bitrix.delobot_modnaya_stranichka","bitrix.delobot_fotografiya_edy","bitrix.krayt_pishchevoe_proizvodstvo","bitrix.krayt_appetitnyy_blog","bitrix.krayt_uslugi_remonta","bitrix.krayt_onlayn_kurs_kreativnogo_prodyusera","bitrix.krayt_detskie_prazdniki","bitrix.krayt_svetotekhnika","bitrix.krayt_urbanistika","bitrix.krayt_otdykh_na_prirode","bitrix.krayt_sportivnye_ploshchadki","bitrix.krayt_oborudovanie_dlya_turizma","bitrix.krayt_meksikanskaya_kukhnya","bitrix.delobot_sports_blog_20","bitrix.delobot_aziatskie_blyuda","bitrix.delobot_beauty_blog","bitrix.delobot_meksikanskiy_restoran_2_0","bitrix.delobot_urban_project","bitrix.delobot_drawing_school","bitrix.delobot_tourism","bitrix.delobot_runnig_club","bitrix.delobot_lighting_company","bitrix.delobot_garbage_disposal","bitrix.delobot_master_class","bitrix.delobot_it_outsourcing","bitrix.krayt_rent_car","bitrix.krayt_aviation","bitrix.krayt_street_sport_club","bitrix.krayt_kofemaniya","bitrix.krayt_corporate_events","bitrix.krayt_cooking_school","bitrix.krayt_blacksmith_craft","bitrix.krayt_med_lab","bitrix.krayt_music_studio","bitrix.krayt_web_application_development","bitrix.krayt_tennis_club","bitrix.krayt_bank_services","bitrix.krayt_smart_furniture","bitrix.krayt_dom_pod_klyuch","bitrix.krayt_uslugi_mediatora","bitrix.krayt_child_club","bitrix.delobot_custom_made_cakes","bitrix.delobot_online_yoga_classes","bitrix.krayt_pevitsa","bitrix.krayt_ozelenenie_pomeshcheniy","bitrix.krayt_internet_agentstvo","bitrix.krayt_kinolog","bitrix.krayt_poleznye_sneki","bitrix.krayt_oformlenie_interera","bitrix.delobot_tourist_equipment","bitrix.delobot_creative_producer","bitrix.delobot_aviation_services","bitrix.delobot_blacksmith_services","bitrix.delobot_coffee_subscription","bitrix.delobot_construction_company","bitrix.delobot_business_premises","bitrix.delobot_pet_hotel","bitrix.delobot_food_industry","bitrix.delobot_cars_for_rent","bitrix.krayt_klub_dlya_geymerov","bitrix.krayt_relaks_uslugi","bitrix.krayt_sportivnyy_inventar","bitrix.krayt_universitet","bitrix.delobot_uslugi_kinologa","bitrix.delobot_business_training","bitrix.krayt_vebinar","bitrix.krayt_kurs_po_iskusstvennomu_intellektu","bitrix.delobot_vypechka_na_zakaz","bitrix.delobot_osennaya_rasprodazh","bitrix.krayt_onlayn_shkola_dlya_detey","bitrix.krayt_arkhitekturnaya_kompaniya","bitrix.krayt_den_blagodareniya","bitrix.krayt_uslugi_nyani","bitrix.krayt_uslugi_repetitora","bitrix.krayt_logoped","bitrix.krayt_chyernaya_pyatnitsa","bitrix.krayt_sladosti_na_rozhdestvo","bitrix.krayt_podarki_na_novyy_god","bitrix.delobot_laboratory","bitrix.delobot_street_sports_grounds","bitrix.delobot_about_webinar","bitrix.krayt_dostavka_gruza","bitrix.delobot_online_travel","bitrix.delobot_youtube_channel","bitrix.delobot_interior_design","bitrix.krayt_kursy_po_interesam","bitrix.krayt_zimnyaya_rasprodazha","bitrix.krayt_tsifrovye_kommunikatsii","bitrix.krayt_avtosalon","bitrix.krayt_uslugi_stroitelnoy_kompanii","bitrix.krayt_vysshee_uchebnoe_zavedenie","bitrix.krayt_veterinar","bitrix.krayt_akademiya_iskusstv","bitrix.krayt_master_po_domu","bitrix.krayt_onlayn_trenirovki","bitrix.krayt_apart_otel","bitrix.krayt_tsvety_i_bukety_na_zakaz","bitrix.krayt_biznes_forum","bitrix.krayt_uslugi_stomatologii","bitrix.krayt_uslugi_avtoservisa","bitrix.delobot_winter_sale","bitrix.krayt_christmas_treats","bitrix.krayt_eksperty_tochnogo_zemledeliya","bitrix.krayt_servis_ukhoda_za_domom","bitrix.delobot_repetitor","bitrix.delobot_babysitter_for_children","bitrix.delobot_speech_therapist_services","bitrix.empty_template","bitrix.krayt_gift_wrapping"]', NULL, NULL),
	('rest', 'entity_iblock_type', 'rest_entity', NULL, NULL),
	('rest', 'server_path', '/rest', NULL, NULL),
	('search', 'dbnode_id', 'N', NULL, NULL),
	('search', 'dbnode_status', 'ok', NULL, NULL),
	('search', 'version', 'v2.0', NULL, NULL),
	('security', 'ipcheck_disable_file', '/bitrix/modules/ipcheck_disable_987094235cdfd39a07967e7a3935e557', NULL, NULL),
	('security', 'redirect_sid', 'gt8uiqiw81wnl58jyp82iragjh0u9gy7', NULL, NULL),
	('socialservices', 'allow_encrypted_tokens', '1', NULL, NULL),
	('socialservices', 'bitrix24net_domain', 'http://local.globus.ru', NULL, NULL),
	('socialservices', 'bitrix24net_id', 'ext.63e5efbcb9d314.88546138', NULL, NULL),
	('socialservices', 'bitrix24net_secret', 'cFwuSWlfRA5sHxQgdmYElarxWhwJBWSX5ST1bqt1a1utK2J257', NULL, NULL),
	('socialservices', 'google_api_key', 'AIzaSyA7puwZwGDJgOjcAWsFsY7hQcrioC13A18', NULL, NULL),
	('socialservices', 'google_appid', '798910771106.apps.googleusercontent.com', NULL, NULL),
	('vote', 'VOTE_COMPATIBLE_OLD_TEMPLATE', 'N', NULL, NULL),
	('vote', 'VOTE_DIR', '', NULL, NULL);

-- Дамп структуры для таблица globus.b_option_site
CREATE TABLE IF NOT EXISTS `b_option_site` (
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MODULE_ID`,`NAME`,`SITE_ID`),
  KEY `ix_option_site_module_site` (`MODULE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_option_site: ~4 rows (приблизительно)
DELETE FROM `b_option_site`;
INSERT INTO `b_option_site` (`MODULE_ID`, `NAME`, `SITE_ID`, `VALUE`) VALUES
	('forum', 'FILTER_DICT_T', 'en', '4'),
	('forum', 'FILTER_DICT_T', 'ru', '2'),
	('forum', 'FILTER_DICT_W', 'en', '3'),
	('forum', 'FILTER_DICT_W', 'ru', '1');

-- Дамп структуры для таблица globus.b_perf_cache
CREATE TABLE IF NOT EXISTS `b_perf_cache` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `COMPONENT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `CACHE_SIZE` float DEFAULT NULL,
  `OP_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE_NAME` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `BASE_DIR` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `INIT_DIR` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_NAME` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_PATH` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_CACHE_0` (`HIT_ID`,`NN`),
  KEY `IX_B_PERF_CACHE_1` (`COMPONENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_perf_cache: ~0 rows (приблизительно)
DELETE FROM `b_perf_cache`;

-- Дамп структуры для таблица globus.b_perf_cluster
CREATE TABLE IF NOT EXISTS `b_perf_cluster` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `THREADS` int(11) DEFAULT NULL,
  `HITS` int(11) DEFAULT NULL,
  `ERRORS` int(11) DEFAULT NULL,
  `PAGES_PER_SECOND` float DEFAULT NULL,
  `PAGE_EXEC_TIME` float DEFAULT NULL,
  `PAGE_RESP_TIME` float DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_perf_cluster: ~0 rows (приблизительно)
DELETE FROM `b_perf_cluster`;

-- Дамп структуры для таблица globus.b_perf_component
CREATE TABLE IF NOT EXISTS `b_perf_component` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `CACHE_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `CACHE_COUNT_R` int(11) DEFAULT NULL,
  `CACHE_COUNT_W` int(11) DEFAULT NULL,
  `CACHE_COUNT_C` int(11) DEFAULT NULL,
  `COMPONENT_TIME` float DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_COMPONENT_0` (`HIT_ID`,`NN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_perf_component: ~0 rows (приблизительно)
DELETE FROM `b_perf_component`;

-- Дамп структуры для таблица globus.b_perf_error
CREATE TABLE IF NOT EXISTS `b_perf_error` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `ERRNO` int(18) DEFAULT NULL,
  `ERRSTR` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ERRFILE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ERRLINE` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_ERROR_0` (`HIT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_perf_error: ~0 rows (приблизительно)
DELETE FROM `b_perf_error`;

-- Дамп структуры для таблица globus.b_perf_history
CREATE TABLE IF NOT EXISTS `b_perf_history` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `TOTAL_MARK` float DEFAULT NULL,
  `ACCELERATOR_ENABLED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_perf_history: ~0 rows (приблизительно)
DELETE FROM `b_perf_history`;

-- Дамп структуры для таблица globus.b_perf_hit
CREATE TABLE IF NOT EXISTS `b_perf_hit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_HIT` datetime DEFAULT NULL,
  `IS_ADMIN` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_METHOD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVER_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVER_PORT` int(11) DEFAULT NULL,
  `SCRIPT_NAME` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_URI` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `INCLUDED_FILES` int(11) DEFAULT NULL,
  `MEMORY_PEAK_USAGE` int(11) DEFAULT NULL,
  `CACHE_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `CACHE_COUNT_R` int(11) DEFAULT NULL,
  `CACHE_COUNT_W` int(11) DEFAULT NULL,
  `CACHE_COUNT_C` int(11) DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENTS` int(11) DEFAULT NULL,
  `COMPONENTS_TIME` float DEFAULT NULL,
  `SQL_LOG` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAGE_TIME` float DEFAULT NULL,
  `PROLOG_TIME` float DEFAULT NULL,
  `PROLOG_BEFORE_TIME` float DEFAULT NULL,
  `AGENTS_TIME` float DEFAULT NULL,
  `PROLOG_AFTER_TIME` float DEFAULT NULL,
  `WORK_AREA_TIME` float DEFAULT NULL,
  `EPILOG_TIME` float DEFAULT NULL,
  `EPILOG_BEFORE_TIME` float DEFAULT NULL,
  `EVENTS_TIME` float DEFAULT NULL,
  `EPILOG_AFTER_TIME` float DEFAULT NULL,
  `MENU_RECALC` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_HIT_0` (`DATE_HIT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_perf_hit: ~0 rows (приблизительно)
DELETE FROM `b_perf_hit`;

-- Дамп структуры для таблица globus.b_perf_index_ban
CREATE TABLE IF NOT EXISTS `b_perf_index_ban` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BAN_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_perf_index_ban: ~0 rows (приблизительно)
DELETE FROM `b_perf_index_ban`;

-- Дамп структуры для таблица globus.b_perf_index_complete
CREATE TABLE IF NOT EXISTS `b_perf_index_complete` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BANNED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEX_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_index_complete_0` (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_perf_index_complete: ~0 rows (приблизительно)
DELETE FROM `b_perf_index_complete`;

-- Дамп структуры для таблица globus.b_perf_index_suggest
CREATE TABLE IF NOT EXISTS `b_perf_index_suggest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SQL_MD5` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_COUNT` int(11) DEFAULT NULL,
  `SQL_TIME` float DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_ALIAS` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_TEXT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_EXPLAIN` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_index_suggest_0` (`SQL_MD5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_perf_index_suggest: ~0 rows (приблизительно)
DELETE FROM `b_perf_index_suggest`;

-- Дамп структуры для таблица globus.b_perf_index_suggest_sql
CREATE TABLE IF NOT EXISTS `b_perf_index_suggest_sql` (
  `SUGGEST_ID` int(11) NOT NULL,
  `SQL_ID` int(11) NOT NULL,
  PRIMARY KEY (`SUGGEST_ID`,`SQL_ID`),
  KEY `ix_b_perf_index_suggest_sql_0` (`SQL_ID`,`SUGGEST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_perf_index_suggest_sql: ~0 rows (приблизительно)
DELETE FROM `b_perf_index_suggest_sql`;

-- Дамп структуры для таблица globus.b_perf_sql
CREATE TABLE IF NOT EXISTS `b_perf_sql` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `COMPONENT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `QUERY_TIME` float DEFAULT NULL,
  `NODE_ID` int(18) DEFAULT NULL,
  `MODULE_NAME` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_TEXT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_SQL_0` (`HIT_ID`,`NN`),
  KEY `IX_B_PERF_SQL_1` (`COMPONENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_perf_sql: ~0 rows (приблизительно)
DELETE FROM `b_perf_sql`;

-- Дамп структуры для таблица globus.b_perf_sql_backtrace
CREATE TABLE IF NOT EXISTS `b_perf_sql_backtrace` (
  `SQL_ID` int(18) NOT NULL,
  `NN` int(18) NOT NULL,
  `FILE_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINE_NO` int(18) DEFAULT NULL,
  `CLASS_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FUNCTION_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SQL_ID`,`NN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_perf_sql_backtrace: ~0 rows (приблизительно)
DELETE FROM `b_perf_sql_backtrace`;

-- Дамп структуры для таблица globus.b_perf_tab_column_stat
CREATE TABLE IF NOT EXISTS `b_perf_tab_column_stat` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL,
  `COLUMN_ROWS` float DEFAULT NULL,
  `VALUE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_tab_column_stat` (`TABLE_NAME`,`COLUMN_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_perf_tab_column_stat: ~0 rows (приблизительно)
DELETE FROM `b_perf_tab_column_stat`;

-- Дамп структуры для таблица globus.b_perf_tab_stat
CREATE TABLE IF NOT EXISTS `b_perf_tab_stat` (
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TABLE_SIZE` float DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL,
  PRIMARY KEY (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_perf_tab_stat: ~0 rows (приблизительно)
DELETE FROM `b_perf_tab_stat`;

-- Дамп структуры для таблица globus.b_perf_test
CREATE TABLE IF NOT EXISTS `b_perf_test` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `REFERENCE_ID` int(18) DEFAULT NULL,
  `NAME` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_TEST_0` (`REFERENCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_perf_test: ~0 rows (приблизительно)
DELETE FROM `b_perf_test`;

-- Дамп структуры для таблица globus.b_posting
CREATE TABLE IF NOT EXISTS `b_posting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `VERSION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_SENT` datetime DEFAULT NULL,
  `SENT_BCC` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `FROM_FIELD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TO_FIELD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BCC_FIELD` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL_FILTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUBJECT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BODY_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `BODY` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `DIRECT_SEND` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CHARSET` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MSG_CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUBSCR_FORMAT` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ERROR_EMAIL` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTO_SEND_TIME` datetime DEFAULT NULL,
  `BCC_TO_SEND` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_posting: ~0 rows (приблизительно)
DELETE FROM `b_posting`;

-- Дамп структуры для таблица globus.b_posting_email
CREATE TABLE IF NOT EXISTS `b_posting_email` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POSTING_ID` int(11) NOT NULL,
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SUBSCRIPTION_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_posting_email_status` (`POSTING_ID`,`STATUS`),
  KEY `ix_posting_email_email` (`POSTING_ID`,`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_posting_email: ~0 rows (приблизительно)
DELETE FROM `b_posting_email`;

-- Дамп структуры для таблица globus.b_posting_file
CREATE TABLE IF NOT EXISTS `b_posting_file` (
  `POSTING_ID` int(11) NOT NULL,
  `FILE_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_POSTING_POSTING_FILE` (`POSTING_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_posting_file: ~0 rows (приблизительно)
DELETE FROM `b_posting_file`;

-- Дамп структуры для таблица globus.b_posting_group
CREATE TABLE IF NOT EXISTS `b_posting_group` (
  `POSTING_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_POSTING_POSTING_GROUP` (`POSTING_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_posting_group: ~0 rows (приблизительно)
DELETE FROM `b_posting_group`;

-- Дамп структуры для таблица globus.b_posting_rubric
CREATE TABLE IF NOT EXISTS `b_posting_rubric` (
  `POSTING_ID` int(11) NOT NULL,
  `LIST_RUBRIC_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_POSTING_POSTING_RUBRIC` (`POSTING_ID`,`LIST_RUBRIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_posting_rubric: ~0 rows (приблизительно)
DELETE FROM `b_posting_rubric`;

-- Дамп структуры для таблица globus.b_rating
CREATE TABLE IF NOT EXISTS `b_rating` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CALCULATION_METHOD` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SUM',
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `POSITION` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `AUTHORITY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `CALCULATED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CONFIGS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_rating: ~2 rows (приблизительно)
DELETE FROM `b_rating`;
INSERT INTO `b_rating` (`ID`, `ACTIVE`, `NAME`, `ENTITY_ID`, `CALCULATION_METHOD`, `CREATED`, `LAST_MODIFIED`, `LAST_CALCULATED`, `POSITION`, `AUTHORITY`, `CALCULATED`, `CONFIGS`) VALUES
	(1, 'N', 'Рейтинг', 'USER', 'SUM', '2023-02-10 14:17:09', NULL, NULL, 'Y', 'N', 'N', 'a:3:{s:4:"MAIN";a:2:{s:4:"VOTE";a:1:{s:4:"USER";a:2:{s:11:"COEFFICIENT";s:1:"1";s:5:"LIMIT";s:2:"30";}}s:6:"RATING";a:1:{s:5:"BONUS";a:2:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:1:"1";}}}s:5:"FORUM";a:2:{s:4:"VOTE";a:2:{s:5:"TOPIC";a:3:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:3:"0.5";s:5:"LIMIT";s:2:"30";}s:4:"POST";a:3:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:3:"0.1";s:5:"LIMIT";s:2:"30";}}s:6:"RATING";a:1:{s:8:"ACTIVITY";a:9:{s:6:"ACTIVE";s:1:"Y";s:16:"TODAY_TOPIC_COEF";s:3:"0.4";s:15:"WEEK_TOPIC_COEF";s:3:"0.2";s:16:"MONTH_TOPIC_COEF";s:3:"0.1";s:14:"ALL_TOPIC_COEF";s:1:"0";s:15:"TODAY_POST_COEF";s:3:"0.2";s:14:"WEEK_POST_COEF";s:3:"0.1";s:15:"MONTH_POST_COEF";s:4:"0.05";s:13:"ALL_POST_COEF";s:1:"0";}}}s:4:"BLOG";a:2:{s:4:"VOTE";a:2:{s:4:"POST";a:3:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:3:"0.5";s:5:"LIMIT";s:2:"30";}s:7:"COMMENT";a:3:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:3:"0.1";s:5:"LIMIT";s:2:"30";}}s:6:"RATING";a:1:{s:8:"ACTIVITY";a:9:{s:6:"ACTIVE";s:1:"Y";s:15:"TODAY_POST_COEF";s:3:"0.4";s:14:"WEEK_POST_COEF";s:3:"0.2";s:15:"MONTH_POST_COEF";s:3:"0.1";s:13:"ALL_POST_COEF";s:1:"0";s:18:"TODAY_COMMENT_COEF";s:3:"0.2";s:17:"WEEK_COMMENT_COEF";s:3:"0.1";s:18:"MONTH_COMMENT_COEF";s:4:"0.05";s:16:"ALL_COMMENT_COEF";s:1:"0";}}}}'),
	(2, 'N', 'Авторитет', 'USER', 'SUM', '2023-02-10 14:17:09', NULL, NULL, 'Y', 'Y', 'N', 'a:3:{s:4:"MAIN";a:2:{s:4:"VOTE";a:1:{s:4:"USER";a:3:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:1:"1";s:5:"LIMIT";s:1:"0";}}s:6:"RATING";a:1:{s:5:"BONUS";a:2:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:1:"1";}}}s:5:"FORUM";a:2:{s:4:"VOTE";a:2:{s:5:"TOPIC";a:2:{s:11:"COEFFICIENT";s:1:"1";s:5:"LIMIT";s:2:"30";}s:4:"POST";a:2:{s:11:"COEFFICIENT";s:1:"1";s:5:"LIMIT";s:2:"30";}}s:6:"RATING";a:1:{s:8:"ACTIVITY";a:8:{s:16:"TODAY_TOPIC_COEF";s:2:"20";s:15:"WEEK_TOPIC_COEF";s:2:"10";s:16:"MONTH_TOPIC_COEF";s:1:"5";s:14:"ALL_TOPIC_COEF";s:1:"0";s:15:"TODAY_POST_COEF";s:3:"0.4";s:14:"WEEK_POST_COEF";s:3:"0.2";s:15:"MONTH_POST_COEF";s:3:"0.1";s:13:"ALL_POST_COEF";s:1:"0";}}}s:4:"BLOG";a:2:{s:4:"VOTE";a:2:{s:4:"POST";a:2:{s:11:"COEFFICIENT";s:1:"1";s:5:"LIMIT";s:2:"30";}s:7:"COMMENT";a:2:{s:11:"COEFFICIENT";s:1:"1";s:5:"LIMIT";s:2:"30";}}s:6:"RATING";a:1:{s:8:"ACTIVITY";a:8:{s:15:"TODAY_POST_COEF";s:3:"0.4";s:14:"WEEK_POST_COEF";s:3:"0.2";s:15:"MONTH_POST_COEF";s:3:"0.1";s:13:"ALL_POST_COEF";s:1:"0";s:18:"TODAY_COMMENT_COEF";s:3:"0.2";s:17:"WEEK_COMMENT_COEF";s:3:"0.1";s:18:"MONTH_COMMENT_COEF";s:4:"0.05";s:16:"ALL_COMMENT_COEF";s:1:"0";}}}}');

-- Дамп структуры для таблица globus.b_rating_component
CREATE TABLE IF NOT EXISTS `b_rating_component` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CALC_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXCEPTION_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `NEXT_CALCULATION` datetime DEFAULT NULL,
  `REFRESH_INTERVAL` int(11) NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_ID_1` (`RATING_ID`,`ACTIVE`,`NEXT_CALCULATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_rating_component: ~0 rows (приблизительно)
DELETE FROM `b_rating_component`;

-- Дамп структуры для таблица globus.b_rating_component_results
CREATE TABLE IF NOT EXISTS `b_rating_component_results` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID` (`ENTITY_TYPE_ID`),
  KEY `IX_COMPLEX_NAME` (`COMPLEX_NAME`),
  KEY `IX_RATING_ID_2` (`RATING_ID`,`COMPLEX_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_rating_component_results: ~0 rows (приблизительно)
DELETE FROM `b_rating_component_results`;

-- Дамп структуры для таблица globus.b_rating_prepare
CREATE TABLE IF NOT EXISTS `b_rating_prepare` (
  `ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_rating_prepare: ~0 rows (приблизительно)
DELETE FROM `b_rating_prepare`;

-- Дамп структуры для таблица globus.b_rating_results
CREATE TABLE IF NOT EXISTS `b_rating_results` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  `PREVIOUS_VALUE` decimal(18,4) DEFAULT NULL,
  `CURRENT_POSITION` int(11) DEFAULT 0,
  `PREVIOUS_POSITION` int(11) DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_3` (`RATING_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`),
  KEY `IX_RATING_4` (`RATING_ID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_rating_results: ~0 rows (приблизительно)
DELETE FROM `b_rating_results`;

-- Дамп структуры для таблица globus.b_rating_rule
CREATE TABLE IF NOT EXISTS `b_rating_rule` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NAME` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_MODULE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONDITION_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_CONFIG` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTION_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `ACTION_CONFIG` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVATE_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVATE_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DEACTIVATE_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEACTIVATE_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_APPLIED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_rating_rule: ~5 rows (приблизительно)
DELETE FROM `b_rating_rule`;
INSERT INTO `b_rating_rule` (`ID`, `ACTIVE`, `NAME`, `ENTITY_TYPE_ID`, `CONDITION_NAME`, `CONDITION_MODULE`, `CONDITION_CLASS`, `CONDITION_METHOD`, `CONDITION_CONFIG`, `ACTION_NAME`, `ACTION_CONFIG`, `ACTIVATE`, `ACTIVATE_CLASS`, `ACTIVATE_METHOD`, `DEACTIVATE`, `DEACTIVATE_CLASS`, `DEACTIVATE_METHOD`, `CREATED`, `LAST_MODIFIED`, `LAST_APPLIED`) VALUES
	(1, 'N', 'Добавление в группу пользователей, имеющих право голосовать за рейтинг', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:"AUTHORITY";a:2:{s:16:"RATING_CONDITION";i:1;s:12:"RATING_VALUE";i:1;}}', 'ADD_TO_GROUP', 'a:1:{s:12:"ADD_TO_GROUP";a:1:{s:8:"GROUP_ID";s:1:"3";}}', 'N', 'CRatingRulesMain', 'addToGroup', 'N', 'CRatingRulesMain ', 'addToGroup', '2023-02-10 14:17:09', '2023-02-10 14:17:09', NULL),
	(2, 'N', 'Удаление из группы пользователей, не имеющих права голосовать за рейтинг', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:"AUTHORITY";a:2:{s:16:"RATING_CONDITION";i:2;s:12:"RATING_VALUE";i:1;}}', 'REMOVE_FROM_GROUP', 'a:1:{s:17:"REMOVE_FROM_GROUP";a:1:{s:8:"GROUP_ID";s:1:"3";}}', 'N', 'CRatingRulesMain', 'removeFromGroup', 'N', 'CRatingRulesMain ', 'removeFromGroup', '2023-02-10 14:17:09', '2023-02-10 14:17:09', NULL),
	(3, 'N', 'Добавление в группу пользователей, имеющих право голосовать за авторитет', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:"AUTHORITY";a:2:{s:16:"RATING_CONDITION";i:1;s:12:"RATING_VALUE";i:2;}}', 'ADD_TO_GROUP', 'a:1:{s:12:"ADD_TO_GROUP";a:1:{s:8:"GROUP_ID";s:1:"4";}}', 'N', 'CRatingRulesMain', 'addToGroup', 'N', 'CRatingRulesMain ', 'addToGroup', '2023-02-10 14:17:09', '2023-02-10 14:17:09', NULL),
	(4, 'N', 'Удаление из группы пользователей, не имеющих права голосовать за авторитет', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:"AUTHORITY";a:2:{s:16:"RATING_CONDITION";i:2;s:12:"RATING_VALUE";i:2;}}', 'REMOVE_FROM_GROUP', 'a:1:{s:17:"REMOVE_FROM_GROUP";a:1:{s:8:"GROUP_ID";s:1:"4";}}', 'N', 'CRatingRulesMain', 'removeFromGroup', 'N', 'CRatingRulesMain ', 'removeFromGroup', '2023-02-10 14:17:09', '2023-02-10 14:17:09', NULL),
	(5, 'Y', 'Автоматическое голосование за авторитет пользователя', 'USER', 'VOTE', NULL, 'CRatingRulesMain', 'voteCheck', 'a:1:{s:4:"VOTE";a:6:{s:10:"VOTE_LIMIT";i:90;s:11:"VOTE_RESULT";i:10;s:16:"VOTE_FORUM_TOPIC";d:0.5;s:15:"VOTE_FORUM_POST";d:0.1;s:14:"VOTE_BLOG_POST";d:0.5;s:17:"VOTE_BLOG_COMMENT";d:0.1;}}', 'empty', 'a:0:{}', 'N', 'empty', 'empty', 'N', 'empty ', 'empty', '2023-02-10 14:17:09', '2023-02-10 14:17:09', NULL);

-- Дамп структуры для таблица globus.b_rating_rule_vetting
CREATE TABLE IF NOT EXISTS `b_rating_rule_vetting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RULE_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `ACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `APPLIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `RULE_ID` (`RULE_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_rating_rule_vetting: ~0 rows (приблизительно)
DELETE FROM `b_rating_rule_vetting`;

-- Дамп структуры для таблица globus.b_rating_user
CREATE TABLE IF NOT EXISTS `b_rating_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `BONUS` decimal(18,4) DEFAULT 0.0000,
  `VOTE_WEIGHT` decimal(18,4) DEFAULT 0.0000,
  `VOTE_COUNT` int(11) DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `RATING_ID` (`RATING_ID`,`ENTITY_ID`),
  KEY `IX_B_RAT_USER_2` (`ENTITY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_rating_user: ~0 rows (приблизительно)
DELETE FROM `b_rating_user`;
INSERT INTO `b_rating_user` (`ID`, `RATING_ID`, `ENTITY_ID`, `BONUS`, `VOTE_WEIGHT`, `VOTE_COUNT`) VALUES
	(1, 2, 1, 3.0000, 30.0000, 13);

-- Дамп структуры для таблица globus.b_rating_vote
CREATE TABLE IF NOT EXISTS `b_rating_vote` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `VALUE` decimal(18,4) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `USER_IP` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `REACTION` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RAT_VOTE_ID` (`RATING_VOTING_ID`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_3` (`OWNER_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_5` (`CREATED`,`VALUE`),
  KEY `IX_RAT_VOTE_ID_6` (`ACTIVE`),
  KEY `IX_RAT_VOTE_ID_7` (`RATING_VOTING_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_8` (`ENTITY_TYPE_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_9` (`CREATED`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_10` (`USER_ID`,`OWNER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_rating_vote: ~0 rows (приблизительно)
DELETE FROM `b_rating_vote`;

-- Дамп структуры для таблица globus.b_rating_vote_group
CREATE TABLE IF NOT EXISTS `b_rating_vote_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GROUP_ID` int(11) NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `RATING_ID` (`GROUP_ID`,`TYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_rating_vote_group: ~6 rows (приблизительно)
DELETE FROM `b_rating_vote_group`;
INSERT INTO `b_rating_vote_group` (`ID`, `GROUP_ID`, `TYPE`) VALUES
	(5, 1, 'A'),
	(1, 1, 'R'),
	(3, 1, 'R'),
	(2, 3, 'R'),
	(4, 3, 'R'),
	(6, 4, 'A');

-- Дамп структуры для таблица globus.b_rating_voting
CREATE TABLE IF NOT EXISTS `b_rating_voting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`ACTIVE`),
  KEY `IX_ENTITY_TYPE_ID_4` (`TOTAL_VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_rating_voting: ~0 rows (приблизительно)
DELETE FROM `b_rating_voting`;

-- Дамп структуры для таблица globus.b_rating_voting_prepare
CREATE TABLE IF NOT EXISTS `b_rating_voting_prepare` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_VOTING_ID` (`RATING_VOTING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_rating_voting_prepare: ~0 rows (приблизительно)
DELETE FROM `b_rating_voting_prepare`;

-- Дамп структуры для таблица globus.b_rating_voting_reaction
CREATE TABLE IF NOT EXISTS `b_rating_voting_reaction` (
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `REACTION` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TOTAL_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ENTITY_TYPE_ID`,`ENTITY_ID`,`REACTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_rating_voting_reaction: ~0 rows (приблизительно)
DELETE FROM `b_rating_voting_reaction`;

-- Дамп структуры для таблица globus.b_rating_weight
CREATE TABLE IF NOT EXISTS `b_rating_weight` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_FROM` decimal(18,4) NOT NULL,
  `RATING_TO` decimal(18,4) NOT NULL,
  `WEIGHT` decimal(18,4) DEFAULT 0.0000,
  `COUNT` int(11) DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_rating_weight: ~0 rows (приблизительно)
DELETE FROM `b_rating_weight`;
INSERT INTO `b_rating_weight` (`ID`, `RATING_FROM`, `RATING_TO`, `WEIGHT`, `COUNT`) VALUES
	(1, -1000000.0000, 1000000.0000, 1.0000, 10);

-- Дамп структуры для таблица globus.b_rest_ap
CREATE TABLE IF NOT EXISTS `b_rest_ap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_CREATE` datetime DEFAULT NULL,
  `DATE_LOGIN` datetime DEFAULT NULL,
  `LAST_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_rest_ap` (`USER_ID`,`PASSWORD`,`ACTIVE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_rest_ap: ~0 rows (приблизительно)
DELETE FROM `b_rest_ap`;

-- Дамп структуры для таблица globus.b_rest_app
CREATE TABLE IF NOT EXISTS `b_rest_app` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CLIENT_ID` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `INSTALLED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `URL` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `URL_DEMO` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_INSTALL` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` varchar(4) COLLATE utf8_unicode_ci DEFAULT '1',
  `SCOPE` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'F',
  `DATE_FINISH` date DEFAULT NULL,
  `IS_TRIALED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `SHARED_KEY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLIENT_SECRET` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APP_NAME` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCESS` varchar(2000) COLLATE utf8_unicode_ci DEFAULT '',
  `APPLICATION_TOKEN` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `MOBILE` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `USER_INSTALL` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_app1` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_rest_app: ~0 rows (приблизительно)
DELETE FROM `b_rest_app`;

-- Дамп структуры для таблица globus.b_rest_app_lang
CREATE TABLE IF NOT EXISTS `b_rest_app_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MENU_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_app_lang1` (`APP_ID`,`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_rest_app_lang: ~0 rows (приблизительно)
DELETE FROM `b_rest_app_lang`;

-- Дамп структуры для таблица globus.b_rest_app_log
CREATE TABLE IF NOT EXISTS `b_rest_app_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp(),
  `APP_ID` int(11) NOT NULL,
  `ACTION_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `USER_ADMIN` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_b_rest_app_log1` (`APP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_rest_app_log: ~0 rows (приблизительно)
DELETE FROM `b_rest_app_log`;

-- Дамп структуры для таблица globus.b_rest_ap_permission
CREATE TABLE IF NOT EXISTS `b_rest_ap_permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PASSWORD_ID` int(11) NOT NULL,
  `PERM` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_ap_perm1` (`PASSWORD_ID`,`PERM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_rest_ap_permission: ~0 rows (приблизительно)
DELETE FROM `b_rest_ap_permission`;

-- Дамп структуры для таблица globus.b_rest_configuration_storage
CREATE TABLE IF NOT EXISTS `b_rest_configuration_storage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` timestamp NULL DEFAULT NULL,
  `CONTEXT` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `DATA` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_rest_configuration_storage: ~0 rows (приблизительно)
DELETE FROM `b_rest_configuration_storage`;

-- Дамп структуры для таблица globus.b_rest_event
CREATE TABLE IF NOT EXISTS `b_rest_event` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(11) DEFAULT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EVENT_HANDLER` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) DEFAULT 0,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_CREATE` datetime DEFAULT NULL,
  `APPLICATION_TOKEN` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `CONNECTOR_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `INTEGRATION_ID` int(11) DEFAULT NULL,
  `OPTIONS` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_event_app_event` (`APP_ID`,`EVENT_NAME`(50),`EVENT_HANDLER`(180),`USER_ID`,`CONNECTOR_ID`(70)),
  KEY `ix_b_rest_event_event_name` (`EVENT_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_rest_event: ~0 rows (приблизительно)
DELETE FROM `b_rest_event`;

-- Дамп структуры для таблица globus.b_rest_event_offline
CREATE TABLE IF NOT EXISTS `b_rest_event_offline` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT current_timestamp(),
  `MESSAGE_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EVENT_DATA` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `EVENT_ADDITIONAL` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROCESS_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `CONNECTOR_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ERROR` int(3) DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_event_offline1` (`MESSAGE_ID`(50),`APP_ID`,`CONNECTOR_ID`(100),`PROCESS_ID`(50)),
  KEY `ix_b_rest_event_offline2` (`TIMESTAMP_X`),
  KEY `ix_b_rest_event_offline3` (`APP_ID`,`CONNECTOR_ID`),
  KEY `ix_b_rest_event_offline4` (`PROCESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_rest_event_offline: ~0 rows (приблизительно)
DELETE FROM `b_rest_event_offline`;

-- Дамп структуры для таблица globus.b_rest_integration
CREATE TABLE IF NOT EXISTS `b_rest_integration` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `ELEMENT_CODE` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD_ID` int(11) DEFAULT NULL,
  `APP_ID` int(11) DEFAULT NULL,
  `SCOPE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `QUERY` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `OUTGOING_EVENTS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `OUTGOING_NEEDED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OUTGOING_HANDLER_URL` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WIDGET_NEEDED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WIDGET_HANDLER_URL` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WIDGET_LIST` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `APPLICATION_TOKEN` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APPLICATION_NEEDED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APPLICATION_ONLY_API` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BOT_ID` int(11) DEFAULT NULL,
  `BOT_HANDLER_URL` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_rest_integration: ~0 rows (приблизительно)
DELETE FROM `b_rest_integration`;

-- Дамп структуры для таблица globus.b_rest_log
CREATE TABLE IF NOT EXISTS `b_rest_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp(),
  `CLIENT_ID` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PASSWORD_ID` int(11) DEFAULT NULL,
  `SCOPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_METHOD` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_URI` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_AUTH` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_DATA` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESPONSE_STATUS` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESPONSE_DATA` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_rest_log: ~0 rows (приблизительно)
DELETE FROM `b_rest_log`;

-- Дамп структуры для таблица globus.b_rest_owner_entity
CREATE TABLE IF NOT EXISTS `b_rest_owner_entity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OWNER_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER` int(11) NOT NULL,
  `ENTITY_TYPE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_b_rest_owner_entity` (`ENTITY_TYPE`,`ENTITY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_rest_owner_entity: ~0 rows (приблизительно)
DELETE FROM `b_rest_owner_entity`;

-- Дамп структуры для таблица globus.b_rest_placement
CREATE TABLE IF NOT EXISTS `b_rest_placement` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(11) DEFAULT NULL,
  `PLACEMENT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PLACEMENT_HANDLER` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ICON_ID` int(11) DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `GROUP_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_CREATE` datetime DEFAULT NULL,
  `ADDITIONAL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OPTIONS` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_placement1` (`APP_ID`,`PLACEMENT`(100),`PLACEMENT_HANDLER`(200)),
  KEY `ix_b_rest_placement3` (`PLACEMENT`(100),`ADDITIONAL`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_rest_placement: ~0 rows (приблизительно)
DELETE FROM `b_rest_placement`;

-- Дамп структуры для таблица globus.b_rest_placement_lang
CREATE TABLE IF NOT EXISTS `b_rest_placement_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PLACEMENT_ID` int(11) NOT NULL,
  `LANGUAGE_ID` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GROUP_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `b_rest_placement_lang_unique` (`PLACEMENT_ID`,`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_rest_placement_lang: ~0 rows (приблизительно)
DELETE FROM `b_rest_placement_lang`;

-- Дамп структуры для таблица globus.b_rest_stat
CREATE TABLE IF NOT EXISTS `b_rest_stat` (
  `STAT_DATE` date NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `METHOD_ID` int(11) NOT NULL,
  `HOUR_0` int(11) NOT NULL DEFAULT 0,
  `HOUR_1` int(11) NOT NULL DEFAULT 0,
  `HOUR_2` int(11) NOT NULL DEFAULT 0,
  `HOUR_3` int(11) NOT NULL DEFAULT 0,
  `HOUR_4` int(11) NOT NULL DEFAULT 0,
  `HOUR_5` int(11) NOT NULL DEFAULT 0,
  `HOUR_6` int(11) NOT NULL DEFAULT 0,
  `HOUR_7` int(11) NOT NULL DEFAULT 0,
  `HOUR_8` int(11) NOT NULL DEFAULT 0,
  `HOUR_9` int(11) NOT NULL DEFAULT 0,
  `HOUR_10` int(11) NOT NULL DEFAULT 0,
  `HOUR_11` int(11) NOT NULL DEFAULT 0,
  `HOUR_12` int(11) NOT NULL DEFAULT 0,
  `HOUR_13` int(11) NOT NULL DEFAULT 0,
  `HOUR_14` int(11) NOT NULL DEFAULT 0,
  `HOUR_15` int(11) NOT NULL DEFAULT 0,
  `HOUR_16` int(11) NOT NULL DEFAULT 0,
  `HOUR_17` int(11) NOT NULL DEFAULT 0,
  `HOUR_18` int(11) NOT NULL DEFAULT 0,
  `HOUR_19` int(11) NOT NULL DEFAULT 0,
  `HOUR_20` int(11) NOT NULL DEFAULT 0,
  `HOUR_21` int(11) NOT NULL DEFAULT 0,
  `HOUR_22` int(11) NOT NULL DEFAULT 0,
  `HOUR_23` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`APP_ID`,`STAT_DATE`,`METHOD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_rest_stat: ~0 rows (приблизительно)
DELETE FROM `b_rest_stat`;

-- Дамп структуры для таблица globus.b_rest_stat_app
CREATE TABLE IF NOT EXISTS `b_rest_stat_app` (
  `APP_ID` int(11) NOT NULL,
  `APP_CODE` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`APP_ID`),
  KEY `ix_b_rest_stat_app_code` (`APP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_rest_stat_app: ~0 rows (приблизительно)
DELETE FROM `b_rest_stat_app`;

-- Дамп структуры для таблица globus.b_rest_stat_method
CREATE TABLE IF NOT EXISTS `b_rest_stat_method` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `METHOD_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT 'M',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_stat_method` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_rest_stat_method: ~0 rows (приблизительно)
DELETE FROM `b_rest_stat_method`;

-- Дамп структуры для таблица globus.b_rest_usage_entity
CREATE TABLE IF NOT EXISTS `b_rest_usage_entity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `ENTITY_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUB_ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUB_ENTITY_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_b_rest_usage_entity` (`ENTITY_TYPE`,`ENTITY_ID`,`SUB_ENTITY_TYPE`,`SUB_ENTITY_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_rest_usage_entity: ~0 rows (приблизительно)
DELETE FROM `b_rest_usage_entity`;

-- Дамп структуры для таблица globus.b_rest_usage_stat
CREATE TABLE IF NOT EXISTS `b_rest_usage_stat` (
  `STAT_DATE` date NOT NULL,
  `ENTITY_ID` int(11) NOT NULL DEFAULT 0,
  `IS_SENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `HOUR_0` int(11) NOT NULL DEFAULT 0,
  `HOUR_1` int(11) NOT NULL DEFAULT 0,
  `HOUR_2` int(11) NOT NULL DEFAULT 0,
  `HOUR_3` int(11) NOT NULL DEFAULT 0,
  `HOUR_4` int(11) NOT NULL DEFAULT 0,
  `HOUR_5` int(11) NOT NULL DEFAULT 0,
  `HOUR_6` int(11) NOT NULL DEFAULT 0,
  `HOUR_7` int(11) NOT NULL DEFAULT 0,
  `HOUR_8` int(11) NOT NULL DEFAULT 0,
  `HOUR_9` int(11) NOT NULL DEFAULT 0,
  `HOUR_10` int(11) NOT NULL DEFAULT 0,
  `HOUR_11` int(11) NOT NULL DEFAULT 0,
  `HOUR_12` int(11) NOT NULL DEFAULT 0,
  `HOUR_13` int(11) NOT NULL DEFAULT 0,
  `HOUR_14` int(11) NOT NULL DEFAULT 0,
  `HOUR_15` int(11) NOT NULL DEFAULT 0,
  `HOUR_16` int(11) NOT NULL DEFAULT 0,
  `HOUR_17` int(11) NOT NULL DEFAULT 0,
  `HOUR_18` int(11) NOT NULL DEFAULT 0,
  `HOUR_19` int(11) NOT NULL DEFAULT 0,
  `HOUR_20` int(11) NOT NULL DEFAULT 0,
  `HOUR_21` int(11) NOT NULL DEFAULT 0,
  `HOUR_22` int(11) NOT NULL DEFAULT 0,
  `HOUR_23` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`STAT_DATE`,`ENTITY_ID`),
  KEY `ix_b_rest_usage` (`ENTITY_ID`,`STAT_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_rest_usage_stat: ~0 rows (приблизительно)
DELETE FROM `b_rest_usage_stat`;

-- Дамп структуры для таблица globus.b_search_content
CREATE TABLE IF NOT EXISTS `b_search_content` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_CHANGE` datetime NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CUSTOM_RANK` int(11) NOT NULL DEFAULT 0,
  `USER_ID` int(11) DEFAULT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENTITY_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `BODY` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAM1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAM2` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `UPD` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_FROM` datetime DEFAULT NULL,
  `DATE_TO` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SEARCH_CONTENT` (`MODULE_ID`,`ITEM_ID`),
  KEY `IX_B_SEARCH_CONTENT_1` (`MODULE_ID`,`PARAM1`(50),`PARAM2`(50)),
  KEY `IX_B_SEARCH_CONTENT_2` (`ENTITY_ID`(50),`ENTITY_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_search_content: ~12 rows (приблизительно)
DELETE FROM `b_search_content`;
INSERT INTO `b_search_content` (`ID`, `DATE_CHANGE`, `MODULE_ID`, `ITEM_ID`, `CUSTOM_RANK`, `USER_ID`, `ENTITY_TYPE_ID`, `ENTITY_ID`, `URL`, `TITLE`, `BODY`, `TAGS`, `PARAM1`, `PARAM2`, `UPD`, `DATE_FROM`, `DATE_TO`) VALUES
	(1, '2023-02-10 16:50:00', 'iblock', '1', 0, NULL, NULL, NULL, '=ID=1&EXTERNAL_ID=1&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=content&IBLOCK_ID=1&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=vkusnaya-i-poleznaya-eda', 'Вкусная и полезная еда', 'С другой стороны, семантический разбор внешних противодействий напрямую зависит от первоочередных требований. Противоположная точка зрения подразумевает, что элементы политического процесса ограничены исключительно образом мышления. \r\n\rНаше дело не так однозначно, как может показаться.\rНаше дело не так однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений. Приятно, граждане, наблюдать, как независимые государства подвергнуты целой серии независимых исследований. \rНаше дело не так однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений. Приятно, граждане, наблюдать, как независимые государства подвергнуты целой серии независимых исследований.\rНаше дело не так однозначно; \rНаше дело не так однозначно;\rНаше дело не так однозначно;\rНаше дело не так однозначно.', '', 'content', '1', NULL, '2023-02-10 16:50:00', NULL),
	(3, '2023-02-10 17:11:49', 'iblock', '3', 0, NULL, NULL, NULL, '=ID=3&EXTERNAL_ID=3&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=content&IBLOCK_ID=2&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=konditer', 'Кондитер', 'Требуются повара-кондитеры в школьные столовые города.  Подберём для вас наиболее удобный вариант рядом с домом.', '', 'content', '2', NULL, NULL, NULL),
	(4, '2023-02-10 17:53:03', 'iblock', '4', 0, NULL, NULL, NULL, '=ID=4&EXTERNAL_ID=4&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=content&IBLOCK_ID=3&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=multfilm-o-veseloy-pande', 'Мультфильм о веселой панде', 'Наше дело не так однозначно, как может технологий представляет собой интерес эксперимент проверки.', '', 'content', '3', NULL, NULL, NULL),
	(6, '2023-02-11 18:55:03', 'iblock', '6', 0, NULL, NULL, NULL, '=ID=6&EXTERNAL_ID=6&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=content&IBLOCK_ID=4&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=1959-1985-gg', '1959-1985 гг.', 'История «КШП – Глобус» начинается с основания комбинатов школьного питания в г. Барнауле. Первым свою работу начал комбинат Октябрьского района в 1959 году. \rПозже были открыты комбинаты школьного питания в поселке Южном, Центральном районе, Ленинском районе, Железнодорожном районе, в Индустриальный районе.', '', 'content', '4', NULL, NULL, NULL),
	(7, '2023-02-11 19:00:53', 'iblock', '7', 0, NULL, NULL, NULL, '=ID=7&EXTERNAL_ID=7&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=content&IBLOCK_ID=4&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=2005-g', '2005 г.', '12 июля 2005 года произошло слияние комбинатов в единый комбинат школьного питания «Муниципальное унитарное предприятие Комбинат школьного питания города Барнаула».', '', 'content', '4', NULL, NULL, NULL),
	(8, '2023-02-11 19:11:09', 'iblock', '8', 0, NULL, NULL, NULL, '=ID=8&EXTERNAL_ID=8&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=content&IBLOCK_ID=5&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=', '1', '', '', 'content', '5', NULL, NULL, NULL),
	(9, '2023-02-11 19:11:16', 'iblock', '9', 0, NULL, NULL, NULL, '=ID=9&EXTERNAL_ID=9&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=content&IBLOCK_ID=5&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=', '2', '', '', 'content', '5', NULL, NULL, NULL),
	(10, '2023-02-11 19:11:22', 'iblock', '10', 0, NULL, NULL, NULL, '=ID=10&EXTERNAL_ID=10&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=content&IBLOCK_ID=5&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=', '3', '', '', 'content', '5', NULL, NULL, NULL),
	(11, '2023-02-11 19:11:28', 'iblock', '11', 0, NULL, NULL, NULL, '=ID=11&EXTERNAL_ID=11&IBLOCK_SECTION_ID=&IBLOCK_TYPE_ID=content&IBLOCK_ID=5&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=', '4', '', '', 'content', '5', NULL, NULL, NULL),
	(12, '2023-02-11 20:28:10', 'iblock', 'S1', 0, NULL, NULL, NULL, '=ID=1&EXTERNAL_ID=&IBLOCK_TYPE_ID=documents&IBLOCK_ID=6&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=', 'Младшие классы (1-4 класс)', '', NULL, 'documents', '6', NULL, NULL, NULL),
	(13, '2023-02-11 20:28:22', 'iblock', 'S2', 0, NULL, NULL, NULL, '=ID=2&EXTERNAL_ID=&IBLOCK_TYPE_ID=documents&IBLOCK_ID=6&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=', 'Старшие классы (5-11 класс)', '', NULL, 'documents', '6', NULL, NULL, NULL),
	(14, '2023-02-11 20:58:00', 'iblock', '12', 0, NULL, NULL, NULL, '=ID=12&EXTERNAL_ID=12&IBLOCK_SECTION_ID=1&IBLOCK_TYPE_ID=documents&IBLOCK_ID=6&IBLOCK_CODE=&IBLOCK_EXTERNAL_ID=&CODE=1', '1', '', '', 'documents', '6', NULL, '2023-02-11 20:58:00', NULL);

-- Дамп структуры для таблица globus.b_search_content_freq
CREATE TABLE IF NOT EXISTS `b_search_content_freq` (
  `STEM` int(11) NOT NULL DEFAULT 0,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FREQ` float DEFAULT NULL,
  `TF` float DEFAULT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_FREQ` (`STEM`,`LANGUAGE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_search_content_freq: ~0 rows (приблизительно)
DELETE FROM `b_search_content_freq`;

-- Дамп структуры для таблица globus.b_search_content_param
CREATE TABLE IF NOT EXISTS `b_search_content_param` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `PARAM_NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `PARAM_VALUE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  KEY `IX_B_SEARCH_CONTENT_PARAM` (`SEARCH_CONTENT_ID`,`PARAM_NAME`),
  KEY `IX_B_SEARCH_CONTENT_PARAM_1` (`PARAM_NAME`,`PARAM_VALUE`(50),`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_search_content_param: ~0 rows (приблизительно)
DELETE FROM `b_search_content_param`;

-- Дамп структуры для таблица globus.b_search_content_right
CREATE TABLE IF NOT EXISTS `b_search_content_right` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_RIGHT` (`SEARCH_CONTENT_ID`,`GROUP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_search_content_right: ~24 rows (приблизительно)
DELETE FROM `b_search_content_right`;
INSERT INTO `b_search_content_right` (`SEARCH_CONTENT_ID`, `GROUP_CODE`) VALUES
	(1, 'G1'),
	(1, 'G2'),
	(3, 'G1'),
	(3, 'G2'),
	(4, 'G1'),
	(4, 'G2'),
	(6, 'G1'),
	(6, 'G2'),
	(7, 'G1'),
	(7, 'G2'),
	(8, 'G1'),
	(8, 'G2'),
	(9, 'G1'),
	(9, 'G2'),
	(10, 'G1'),
	(10, 'G2'),
	(11, 'G1'),
	(11, 'G2'),
	(12, 'G1'),
	(12, 'G2'),
	(13, 'G1'),
	(13, 'G2'),
	(14, 'G1'),
	(14, 'G2');

-- Дамп структуры для таблица globus.b_search_content_site
CREATE TABLE IF NOT EXISTS `b_search_content_site` (
  `SEARCH_CONTENT_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `URL` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_search_content_site: ~12 rows (приблизительно)
DELETE FROM `b_search_content_site`;
INSERT INTO `b_search_content_site` (`SEARCH_CONTENT_ID`, `SITE_ID`, `URL`) VALUES
	(1, 's1', ''),
	(3, 's1', ''),
	(4, 's1', ''),
	(6, 's1', ''),
	(7, 's1', ''),
	(8, 's1', ''),
	(9, 's1', ''),
	(10, 's1', ''),
	(11, 's1', ''),
	(12, 's1', ''),
	(13, 's1', ''),
	(14, 's1', '');

-- Дамп структуры для таблица globus.b_search_content_stem
CREATE TABLE IF NOT EXISTS `b_search_content_stem` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `STEM` int(11) NOT NULL,
  `TF` float NOT NULL,
  `PS` float NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_STEM` (`STEM`,`LANGUAGE_ID`,`TF`,`PS`,`SEARCH_CONTENT_ID`),
  KEY `IND_B_SEARCH_CONTENT_STEM` (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

-- Дамп данных таблицы globus.b_search_content_stem: ~126 rows (приблизительно)
DELETE FROM `b_search_content_stem`;
INSERT INTO `b_search_content_stem` (`SEARCH_CONTENT_ID`, `LANGUAGE_ID`, `STEM`, `TF`, `PS`) VALUES
	(1, 'ru', 1, 0.1508, 1),
	(1, 'ru', 2, 0.1508, 3),
	(1, 'ru', 3, 0.1508, 4),
	(1, 'ru', 4, 0.1508, 6),
	(1, 'ru', 5, 0.1508, 7),
	(1, 'ru', 6, 0.1508, 8),
	(1, 'ru', 7, 0.1508, 9),
	(1, 'ru', 8, 0.3017, 67.3333),
	(1, 'ru', 9, 0.1508, 11),
	(1, 'ru', 10, 0.1508, 12),
	(1, 'ru', 11, 0.1508, 13),
	(1, 'ru', 12, 0.1508, 15),
	(1, 'ru', 13, 0.1508, 16),
	(1, 'ru', 14, 0.1508, 22),
	(1, 'ru', 15, 0.1508, 23),
	(1, 'ru', 16, 0.1508, 24),
	(1, 'ru', 17, 0.1508, 25),
	(1, 'ru', 18, 0.1508, 27),
	(1, 'ru', 19, 0.1508, 28),
	(1, 'ru', 20, 0.1508, 29),
	(1, 'ru', 21, 0.1508, 30),
	(1, 'ru', 22, 0.1508, 31),
	(1, 'ru', 23, 0.1508, 32),
	(1, 'ru', 24, 0.1508, 33),
	(4, 'ru', 25, 0.2314, 5),
	(1, 'ru', 25, 0.4525, 113.571),
	(4, 'ru', 26, 0.2314, 6),
	(1, 'ru', 26, 0.4525, 114.571),
	(4, 'ru', 27, 0.2314, 9),
	(1, 'ru', 27, 0.4525, 117.571),
	(4, 'ru', 28, 0.2314, 11),
	(1, 'ru', 28, 0.3017, 69),
	(1, 'ru', 29, 0.3017, 70),
	(1, 'ru', 30, 0.2391, 83),
	(1, 'ru', 31, 0.2391, 84),
	(1, 'ru', 32, 0.2391, 85),
	(4, 'ru', 33, 0.2314, 12),
	(1, 'ru', 33, 0.2391, 86),
	(4, 'ru', 34, 0.2314, 13),
	(1, 'ru', 34, 0.2391, 87),
	(4, 'ru', 35, 0.2314, 14),
	(1, 'ru', 35, 0.2391, 88),
	(1, 'ru', 36, 0.2391, 89),
	(4, 'ru', 37, 0.2314, 16),
	(1, 'ru', 37, 0.2391, 90),
	(4, 'ru', 38, 0.2314, 17),
	(1, 'ru', 38, 0.2391, 91),
	(1, 'ru', 39, 0.2391, 93),
	(1, 'ru', 40, 0.2391, 97),
	(1, 'ru', 41, 0.2391, 98),
	(1, 'ru', 42, 0.2391, 99),
	(1, 'ru', 43, 0.2391, 105),
	(1, 'ru', 44, 0.2391, 106),
	(1, 'ru', 45, 0.2391, 107),
	(1, 'ru', 46, 0.3502, 111.5),
	(1, 'ru', 47, 0.2391, 110),
	(1, 'ru', 48, 0.2391, 111),
	(1, 'ru', 49, 0.2391, 112),
	(1, 'ru', 50, 0.2391, 113),
	(1, 'ru', 51, 0.2391, 115),
	(3, 'ru', 53, 0.2314, 1),
	(3, 'ru', 54, 0.2314, 2),
	(3, 'ru', 55, 0.2314, 3),
	(3, 'ru', 56, 0.2314, 5),
	(6, 'ru', 56, 0.3066, 32),
	(7, 'ru', 56, 0.3554, 21),
	(3, 'ru', 57, 0.2314, 6),
	(7, 'ru', 58, 0.2242, 26),
	(3, 'ru', 58, 0.2314, 7),
	(3, 'ru', 59, 0.2314, 13),
	(3, 'ru', 60, 0.2314, 15),
	(3, 'ru', 61, 0.2314, 16),
	(3, 'ru', 62, 0.2314, 17),
	(3, 'ru', 63, 0.2314, 18),
	(3, 'ru', 64, 0.2314, 19),
	(3, 'ru', 65, 0.2314, 21),
	(4, 'ru', 66, 0.2314, 1),
	(4, 'ru', 67, 0.2314, 3),
	(4, 'ru', 68, 0.2314, 4),
	(4, 'ru', 69, 0.2314, 15),
	(6, 'ru', 70, 0.1934, 1),
	(6, 'ru', 71, 0.1934, 2),
	(6, 'ru', 72, 0.1934, 8),
	(6, 'ru', 73, 0.1934, 9),
	(6, 'ru', 74, 0.1934, 10),
	(6, 'ru', 75, 0.1934, 11),
	(6, 'ru', 76, 0.1934, 13),
	(6, 'ru', 77, 0.1934, 14),
	(7, 'ru', 77, 0.2242, 14),
	(6, 'ru', 78, 0.4491, 27.5),
	(7, 'ru', 78, 0.5207, 17),
	(6, 'ru', 79, 0.3066, 33),
	(7, 'ru', 79, 0.3554, 22),
	(6, 'ru', 80, 0.1934, 24),
	(7, 'ru', 80, 0.2242, 27),
	(6, 'ru', 81, 0.1934, 30),
	(6, 'ru', 82, 0.1934, 32),
	(6, 'ru', 83, 0.1934, 33),
	(6, 'ru', 84, 0.1934, 35),
	(6, 'ru', 85, 0.5, 53.8),
	(6, 'ru', 86, 0.1934, 38),
	(6, 'ru', 87, 0.1934, 39),
	(7, 'ru', 87, 0.2242, 11),
	(6, 'ru', 88, 0.1934, 45),
	(6, 'ru', 89, 0.1934, 47),
	(6, 'ru', 90, 0.1934, 52),
	(6, 'ru', 91, 0.1934, 53),
	(6, 'ru', 92, 0.1934, 54),
	(6, 'ru', 93, 0.1934, 56),
	(6, 'ru', 94, 0.1934, 58),
	(6, 'ru', 95, 0.1934, 61),
	(7, 'ru', 96, 0.3554, 5.5),
	(7, 'ru', 97, 0.2242, 8),
	(7, 'ru', 98, 0.2242, 9),
	(7, 'ru', 99, 0.2242, 12),
	(7, 'ru', 100, 0.2242, 13),
	(7, 'ru', 101, 0.2242, 16),
	(7, 'ru', 102, 0.2242, 20),
	(7, 'ru', 103, 0.2242, 21),
	(7, 'ru', 104, 0.2242, 22),
	(12, 'ru', 105, 0.2314, 1),
	(12, 'ru', 106, 0.3667, 3),
	(13, 'ru', 106, 0.3667, 3),
	(12, 'ru', 107, 0.2314, 3),
	(13, 'ru', 108, 0.2314, 1),
	(13, 'ru', 109, 0.2314, 3);

-- Дамп структуры для таблица globus.b_search_content_text
CREATE TABLE IF NOT EXISTS `b_search_content_text` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SEARCH_CONTENT_MD5` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `SEARCHABLE_CONTENT` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_search_content_text: ~12 rows (приблизительно)
DELETE FROM `b_search_content_text`;
INSERT INTO `b_search_content_text` (`SEARCH_CONTENT_ID`, `SEARCH_CONTENT_MD5`, `SEARCHABLE_CONTENT`) VALUES
	(1, 'bda9a4a573f082c7e94c0bdb5a37ee36', 'ВКУСНАЯ И ПОЛЕЗНАЯ ЕДА\r\nС ДРУГОЙ СТОРОНЫ, СЕМАНТИЧЕСКИЙ РАЗБОР ВНЕШНИХ ПРОТИВОДЕЙСТВИЙ НАПРЯМУЮ ЗАВИСИТ ОТ ПЕРВООЧЕРЕДНЫХ ТРЕБОВАНИЙ. ПРОТИВОПОЛОЖНАЯ ТОЧКА ЗРЕНИЯ ПОДРАЗУМЕВАЕТ, ЧТО ЭЛЕМЕНТЫ ПОЛИТИЧЕСКОГО ПРОЦЕССА ОГРАНИЧЕНЫ ИСКЛЮЧИТЕЛЬНО ОБРАЗОМ МЫШЛЕНИЯ. \r\n\rНАШЕ ДЕЛО НЕ ТАК ОДНОЗНАЧНО, КАК МОЖЕТ ПОКАЗАТЬСЯ.\rНАШЕ ДЕЛО НЕ ТАК ОДНОЗНАЧНО, КАК МОЖЕТ ПОКАЗАТЬСЯ: ПОНИМАНИЕ СУТИ РЕСУРСОСБЕРЕГАЮЩИХ ТЕХНОЛОГИЙ ПРЕДСТАВЛЯЕТ СОБОЙ ИНТЕРЕСНЫЙ ЭКСПЕРИМЕНТ ПРОВЕРКИ КАК САМОДОСТАТОЧНЫХ, ТАК И ВНЕШНЕ ЗАВИСИМЫХ КОНЦЕПТУАЛЬНЫХ РЕШЕНИЙ. ПРИЯТНО, ГРАЖДАНЕ, НАБЛЮДАТЬ, КАК НЕЗАВИСИМЫЕ ГОСУДАРСТВА ПОДВЕРГНУТЫ ЦЕЛОЙ СЕРИИ НЕЗАВИСИМЫХ ИССЛЕДОВАНИЙ. \rНАШЕ ДЕЛО НЕ ТАК ОДНОЗНАЧНО, КАК МОЖЕТ ПОКАЗАТЬСЯ: ПОНИМАНИЕ СУТИ РЕСУРСОСБЕРЕГАЮЩИХ ТЕХНОЛОГИЙ ПРЕДСТАВЛЯЕТ СОБОЙ ИНТЕРЕСНЫЙ ЭКСПЕРИМЕНТ ПРОВЕРКИ КАК САМОДОСТАТОЧНЫХ, ТАК И ВНЕШНЕ ЗАВИСИМЫХ КОНЦЕПТУАЛЬНЫХ РЕШЕНИЙ. ПРИЯТНО, ГРАЖДАНЕ, НАБЛЮДАТЬ, КАК НЕЗАВИСИМЫЕ ГОСУДАРСТВА ПОДВЕРГНУТЫ ЦЕЛОЙ СЕРИИ НЕЗАВИСИМЫХ ИССЛЕДОВАНИЙ.\rНАШЕ ДЕЛО НЕ ТАК ОДНОЗНАЧНО; \rНАШЕ ДЕЛО НЕ ТАК ОДНОЗНАЧНО;\rНАШЕ ДЕЛО НЕ ТАК ОДНОЗНАЧНО;\rНАШЕ ДЕЛО НЕ ТАК ОДНОЗНАЧНО.\r\n'),
	(3, '216beeca8dfdb7969f307c49b5ab9a6e', 'КОНДИТЕР\r\nТРЕБУЮТСЯ ПОВАРА-КОНДИТЕРЫ В ШКОЛЬНЫЕ СТОЛОВЫЕ ГОРОДА.  ПОДБЕРЁМ ДЛЯ ВАС НАИБОЛЕЕ УДОБНЫЙ ВАРИАНТ РЯДОМ С ДОМОМ.\r\n'),
	(4, '1e9f84344a913fdcbd7d4d5f74c37f1f', 'МУЛЬТФИЛЬМ О ВЕСЕЛОЙ ПАНДЕ\r\nНАШЕ ДЕЛО НЕ ТАК ОДНОЗНАЧНО, КАК МОЖЕТ ТЕХНОЛОГИЙ ПРЕДСТАВЛЯЕТ СОБОЙ ИНТЕРЕС ЭКСПЕРИМЕНТ ПРОВЕРКИ.\r\n'),
	(6, '93bd395f442e4c2a776918010698d8ef', '1959-1985 ГГ.\r\nИСТОРИЯ «КШП – ГЛОБУС» НАЧИНАЕТСЯ С ОСНОВАНИЯ КОМБИНАТОВ ШКОЛЬНОГО ПИТАНИЯ В Г. БАРНАУЛЕ. ПЕРВЫМ СВОЮ РАБОТУ НАЧАЛ КОМБИНАТ ОКТЯБРЬСКОГО РАЙОНА В 1959 ГОДУ. \rПОЗЖЕ БЫЛИ ОТКРЫТЫ КОМБИНАТЫ ШКОЛЬНОГО ПИТАНИЯ В ПОСЕЛКЕ ЮЖНОМ, ЦЕНТРАЛЬНОМ РАЙОНЕ, ЛЕНИНСКОМ РАЙОНЕ, ЖЕЛЕЗНОДОРОЖНОМ РАЙОНЕ, В ИНДУСТРИАЛЬНЫЙ РАЙОНЕ.\r\n'),
	(7, '31b46adb9184927be09ad652e8f8800a', '2005 Г.\r\n12 ИЮЛЯ 2005 ГОДА ПРОИЗОШЛО СЛИЯНИЕ КОМБИНАТОВ В ЕДИНЫЙ КОМБИНАТ ШКОЛЬНОГО ПИТАНИЯ «МУНИЦИПАЛЬНОЕ УНИТАРНОЕ ПРЕДПРИЯТИЕ КОМБИНАТ ШКОЛЬНОГО ПИТАНИЯ ГОРОДА БАРНАУЛА».\r\n'),
	(8, '3ee4fd3682dd9dbdcafb6efb2f9da7af', '1\r\n\r\n'),
	(9, '63e312ea09a5501e2d3b41e2fa2849df', '2\r\n\r\n'),
	(10, '2c736291cde3f582fb3d0898341b2294', '3\r\n\r\n'),
	(11, 'e2baa8e372bc37d858e7ff8383057a40', '4\r\n\r\n'),
	(12, '49ab983d1d6b22e455d7d5f6e6d81878', 'МЛАДШИЕ КЛАССЫ (1-4 КЛАСС)\r\n\r\n'),
	(13, 'bc7f3644fcae12ccd678606aaa297085', 'СТАРШИЕ КЛАССЫ (5-11 КЛАСС)\r\n\r\n'),
	(14, '3ee4fd3682dd9dbdcafb6efb2f9da7af', '1\r\n\r\n');

-- Дамп структуры для таблица globus.b_search_content_title
CREATE TABLE IF NOT EXISTS `b_search_content_title` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `POS` int(11) NOT NULL,
  `WORD` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_TITLE` (`SITE_ID`,`WORD`,`SEARCH_CONTENT_ID`,`POS`),
  KEY `IND_B_SEARCH_CONTENT_TITLE` (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

-- Дамп данных таблицы globus.b_search_content_title: ~26 rows (приблизительно)
DELETE FROM `b_search_content_title`;
INSERT INTO `b_search_content_title` (`SEARCH_CONTENT_ID`, `SITE_ID`, `POS`, `WORD`) VALUES
	(8, 's1', 0, '1'),
	(14, 's1', 0, '1'),
	(12, 's1', 16, '1-4'),
	(6, 's1', 0, '1959-1985'),
	(9, 's1', 0, '2'),
	(7, 's1', 0, '2005'),
	(10, 's1', 0, '3'),
	(11, 's1', 0, '4'),
	(13, 's1', 16, '5-11'),
	(4, 's1', 13, 'ВЕСЕЛОЙ'),
	(1, 's1', 0, 'ВКУСНАЯ'),
	(7, 's1', 5, 'Г'),
	(6, 's1', 10, 'ГГ'),
	(1, 's1', 19, 'ЕДА'),
	(1, 's1', 8, 'И'),
	(12, 's1', 8, 'КЛАСС'),
	(13, 's1', 8, 'КЛАСС'),
	(12, 's1', 8, 'КЛАССЫ'),
	(13, 's1', 8, 'КЛАССЫ'),
	(3, 's1', 0, 'КОНДИТЕР'),
	(12, 's1', 0, 'МЛАДШИЕ'),
	(4, 's1', 0, 'МУЛЬТФИЛЬМ'),
	(4, 's1', 11, 'О'),
	(4, 's1', 21, 'ПАНДЕ'),
	(1, 's1', 10, 'ПОЛЕЗНАЯ'),
	(13, 's1', 0, 'СТАРШИЕ');

-- Дамп структуры для таблица globus.b_search_custom_rank
CREATE TABLE IF NOT EXISTS `b_search_custom_rank` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APPLIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RANK` int(11) NOT NULL DEFAULT 0,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `PARAM1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAM2` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_B_SEARCH_CUSTOM_RANK` (`SITE_ID`,`MODULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_search_custom_rank: ~0 rows (приблизительно)
DELETE FROM `b_search_custom_rank`;

-- Дамп структуры для таблица globus.b_search_phrase
CREATE TABLE IF NOT EXISTS `b_search_phrase` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL,
  `PAGES` int(11) NOT NULL,
  `SESSION_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO_404` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_SESS_ID` int(18) DEFAULT NULL,
  `EVENT1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_PK_B_SEARCH_PHRASE_SESS_PH` (`SESSION_ID`,`PHRASE`(50)),
  KEY `IND_PK_B_SEARCH_PHRASE_SESS_TG` (`SESSION_ID`,`TAGS`(50)),
  KEY `IND_PK_B_SEARCH_PHRASE_TIME` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_search_phrase: ~0 rows (приблизительно)
DELETE FROM `b_search_phrase`;

-- Дамп структуры для таблица globus.b_search_stem
CREATE TABLE IF NOT EXISTS `b_search_stem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STEM` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SEARCH_STEM` (`STEM`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_search_stem: ~109 rows (приблизительно)
DELETE FROM `b_search_stem`;
INSERT INTO `b_search_stem` (`ID`, `STEM`) VALUES
	(107, '1-4'),
	(97, '12'),
	(86, '1959'),
	(70, '1959-1985'),
	(96, '2005'),
	(109, '5-11'),
	(80, 'БАРНАУЛ'),
	(63, 'ВАРИАНТ'),
	(60, 'ВАС'),
	(67, 'ВЕСЕЛ'),
	(1, 'ВКУСН'),
	(8, 'ВНЕШН'),
	(71, 'ГГ'),
	(74, 'ГЛОБУС'),
	(87, 'ГОД'),
	(58, 'ГОРОД'),
	(47, 'ГОСУДАРСТВ'),
	(44, 'ГРАЖДАН'),
	(26, 'ДЕЛ'),
	(65, 'ДОМ'),
	(4, 'ДРУГ'),
	(3, 'ЕД'),
	(52, 'ЕДА2'),
	(101, 'ЕДИН'),
	(94, 'ЖЕЛЕЗНОДОРОЖН'),
	(11, 'ЗАВИС'),
	(40, 'ЗАВИСИМ'),
	(16, 'ЗРЕН'),
	(95, 'ИНДУСТРИАЛЬН'),
	(69, 'ИНТЕРЕС'),
	(36, 'ИНТЕРЕСН'),
	(22, 'ИСКЛЮЧИТЕЛЬН'),
	(51, 'ИССЛЕДОВАН'),
	(72, 'ИСТОР'),
	(98, 'ИЮЛ'),
	(106, 'КЛАСС'),
	(78, 'КОМБИНАТ'),
	(77, 'КОМБИНАТОВ'),
	(53, 'КОНДИТЕР'),
	(41, 'КОНЦЕПТУАЛЬН'),
	(73, 'КШП'),
	(93, 'ЛЕНИНСК'),
	(105, 'МЛАДШ'),
	(28, 'МОЖЕТ'),
	(66, 'МУЛЬТФИЛЬМ'),
	(102, 'МУНИЦИПАЛЬН'),
	(24, 'МЫШЛЕН'),
	(45, 'НАБЛЮДА'),
	(61, 'НАИБОЛ'),
	(10, 'НАПРЯМ'),
	(83, 'НАЧА'),
	(75, 'НАЧИНА'),
	(25, 'НАШ'),
	(46, 'НЕЗАВИСИМ'),
	(23, 'ОБРАЗ'),
	(21, 'ОГРАНИЧ'),
	(27, 'ОДНОЗНАЧН'),
	(84, 'ОКТЯБРЬСК'),
	(76, 'ОСНОВАН'),
	(89, 'ОТКРЫТ'),
	(68, 'ПАНД'),
	(81, 'ПЕРВ'),
	(12, 'ПЕРВООЧЕРЕДН'),
	(79, 'ПИТАН'),
	(55, 'ПОВАРА-КОНДИТЕР'),
	(59, 'ПОДБЕР'),
	(48, 'ПОДВЕРГНУТ'),
	(17, 'ПОДРАЗУМЕВА'),
	(88, 'ПОЗЖ'),
	(29, 'ПОКАЗА'),
	(2, 'ПОЛЕЗН'),
	(19, 'ПОЛИТИЧЕСК'),
	(30, 'ПОНИМАН'),
	(90, 'ПОСЕЛК'),
	(104, 'ПРЕДПРИЯТ'),
	(34, 'ПРЕДСТАВЛЯ'),
	(43, 'ПРИЯТН'),
	(38, 'ПРОВЕРК'),
	(99, 'ПРОИЗОШЛ'),
	(9, 'ПРОТИВОДЕЙСТВ'),
	(14, 'ПРОТИВОПОЛОЖН'),
	(20, 'ПРОЦЕСС'),
	(82, 'РАБОТ'),
	(7, 'РАЗБОР'),
	(85, 'РАЙОН'),
	(32, 'РЕСУРСОСБЕРЕГА'),
	(42, 'РЕШЕН'),
	(64, 'РЯД'),
	(39, 'САМОДОСТАТОЧН'),
	(6, 'СЕМАНТИЧЕСК'),
	(50, 'СЕР'),
	(100, 'СЛИЯН'),
	(35, 'СОБ'),
	(108, 'СТАРШ'),
	(57, 'СТОЛОВ'),
	(5, 'СТОРОН'),
	(31, 'СУТ'),
	(33, 'ТЕХНОЛОГ'),
	(15, 'ТОЧК'),
	(54, 'ТРЕБ'),
	(13, 'ТРЕБОВАН'),
	(62, 'УДОБН'),
	(103, 'УНИТАРН'),
	(49, 'ЦЕЛ'),
	(92, 'ЦЕНТРАЛЬН'),
	(56, 'ШКОЛЬН'),
	(37, 'ЭКСПЕРИМЕНТ'),
	(18, 'ЭЛЕМЕНТ'),
	(91, 'ЮЖН');

-- Дамп структуры для таблица globus.b_search_suggest
CREATE TABLE IF NOT EXISTS `b_search_suggest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER_MD5` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `RATE` float NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_B_SEARCH_SUGGEST` (`FILTER_MD5`,`PHRASE`(50),`RATE`),
  KEY `IND_B_SEARCH_SUGGEST_PHRASE` (`PHRASE`(50),`RATE`),
  KEY `IND_B_SEARCH_SUGGEST_TIME` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_search_suggest: ~0 rows (приблизительно)
DELETE FROM `b_search_suggest`;

-- Дамп структуры для таблица globus.b_search_tags
CREATE TABLE IF NOT EXISTS `b_search_tags` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`,`NAME`),
  KEY `IX_B_SEARCH_TAGS_0` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

-- Дамп данных таблицы globus.b_search_tags: ~0 rows (приблизительно)
DELETE FROM `b_search_tags`;

-- Дамп структуры для таблица globus.b_search_user_right
CREATE TABLE IF NOT EXISTS `b_search_user_right` (
  `USER_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_USER_RIGHT` (`USER_ID`,`GROUP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_search_user_right: ~0 rows (приблизительно)
DELETE FROM `b_search_user_right`;

-- Дамп структуры для таблица globus.b_security_sitecheck
CREATE TABLE IF NOT EXISTS `b_security_sitecheck` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TEST_DATE` datetime DEFAULT NULL,
  `RESULTS` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_security_sitecheck: ~0 rows (приблизительно)
DELETE FROM `b_security_sitecheck`;

-- Дамп структуры для таблица globus.b_sec_filter_mask
CREATE TABLE IF NOT EXISTS `b_sec_filter_mask` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT 10,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_sec_filter_mask: ~0 rows (приблизительно)
DELETE FROM `b_sec_filter_mask`;

-- Дамп структуры для таблица globus.b_sec_frame_mask
CREATE TABLE IF NOT EXISTS `b_sec_frame_mask` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT 10,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FRAME_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_sec_frame_mask: ~0 rows (приблизительно)
DELETE FROM `b_sec_frame_mask`;

-- Дамп структуры для таблица globus.b_sec_iprule
CREATE TABLE IF NOT EXISTS `b_sec_iprule` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RULE_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ADMIN_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT 500,
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_FROM_TIMESTAMP` int(11) DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `ACTIVE_TO_TIMESTAMP` int(11) DEFAULT NULL,
  `NAME` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_sec_iprule_active_to` (`ACTIVE_TO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_sec_iprule: ~0 rows (приблизительно)
DELETE FROM `b_sec_iprule`;

-- Дамп структуры для таблица globus.b_sec_iprule_excl_ip
CREATE TABLE IF NOT EXISTS `b_sec_iprule_excl_ip` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_IP` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT 500,
  `IP_START` bigint(18) DEFAULT NULL,
  `IP_END` bigint(18) DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_sec_iprule_excl_ip: ~0 rows (приблизительно)
DELETE FROM `b_sec_iprule_excl_ip`;

-- Дамп структуры для таблица globus.b_sec_iprule_excl_mask
CREATE TABLE IF NOT EXISTS `b_sec_iprule_excl_mask` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_MASK` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT 500,
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_MASK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_sec_iprule_excl_mask: ~0 rows (приблизительно)
DELETE FROM `b_sec_iprule_excl_mask`;

-- Дамп структуры для таблица globus.b_sec_iprule_incl_ip
CREATE TABLE IF NOT EXISTS `b_sec_iprule_incl_ip` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_IP` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT 500,
  `IP_START` bigint(18) DEFAULT NULL,
  `IP_END` bigint(18) DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_sec_iprule_incl_ip: ~0 rows (приблизительно)
DELETE FROM `b_sec_iprule_incl_ip`;

-- Дамп структуры для таблица globus.b_sec_iprule_incl_mask
CREATE TABLE IF NOT EXISTS `b_sec_iprule_incl_mask` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_MASK` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT 500,
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_MASK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_sec_iprule_incl_mask: ~0 rows (приблизительно)
DELETE FROM `b_sec_iprule_incl_mask`;

-- Дамп структуры для таблица globus.b_sec_recovery_codes
CREATE TABLE IF NOT EXISTS `b_sec_recovery_codes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USED` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `USING_DATE` datetime DEFAULT NULL,
  `USING_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_sec_recovery_codes_user_id` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_sec_recovery_codes: ~0 rows (приблизительно)
DELETE FROM `b_sec_recovery_codes`;

-- Дамп структуры для таблица globus.b_sec_redirect_url
CREATE TABLE IF NOT EXISTS `b_sec_redirect_url` (
  `IS_SYSTEM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT 500,
  `URL` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMETER_NAME` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_sec_redirect_url: ~0 rows (приблизительно)
DELETE FROM `b_sec_redirect_url`;

-- Дамп структуры для таблица globus.b_sec_session
CREATE TABLE IF NOT EXISTS `b_sec_session` (
  `SESSION_ID` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `SESSION_DATA` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SESSION_ID`),
  KEY `ix_b_sec_session_time` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_sec_session: ~0 rows (приблизительно)
DELETE FROM `b_sec_session`;

-- Дамп структуры для таблица globus.b_sec_user
CREATE TABLE IF NOT EXISTS `b_sec_user` (
  `USER_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SECRET` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ATTEMPTS` int(18) DEFAULT NULL,
  `INITIAL_DATE` datetime DEFAULT NULL,
  `SKIP_MANDATORY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DEACTIVATE_UNTIL` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_sec_user: ~0 rows (приблизительно)
DELETE FROM `b_sec_user`;

-- Дамп структуры для таблица globus.b_sec_virus
CREATE TABLE IF NOT EXISTS `b_sec_virus` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `INFO` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_sec_virus: ~0 rows (приблизительно)
DELETE FROM `b_sec_virus`;

-- Дамп структуры для таблица globus.b_sec_white_list
CREATE TABLE IF NOT EXISTS `b_sec_white_list` (
  `ID` int(11) NOT NULL,
  `WHITE_SUBSTR` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_sec_white_list: ~0 rows (приблизительно)
DELETE FROM `b_sec_white_list`;

-- Дамп структуры для таблица globus.b_seo_adv_autolog
CREATE TABLE IF NOT EXISTS `b_seo_adv_autolog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `CAMPAIGN_XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `BANNER_XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CAUSE_CODE` int(11) DEFAULT 0,
  `SUCCESS` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_adv_autolog1` (`ENGINE_ID`),
  KEY `ix_b_seo_adv_autolog2` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_seo_adv_autolog: ~0 rows (приблизительно)
DELETE FROM `b_seo_adv_autolog`;

-- Дамп структуры для таблица globus.b_seo_adv_banner
CREATE TABLE IF NOT EXISTS `b_seo_adv_banner` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) DEFAULT NULL,
  `AUTO_QUANTITY_OFF` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `AUTO_QUANTITY_ON` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_banner` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_banner1` (`CAMPAIGN_ID`),
  KEY `ix_b_seo_adv_banner2` (`AUTO_QUANTITY_OFF`,`AUTO_QUANTITY_ON`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_seo_adv_banner: ~0 rows (приблизительно)
DELETE FROM `b_seo_adv_banner`;

-- Дамп структуры для таблица globus.b_seo_adv_campaign
CREATE TABLE IF NOT EXISTS `b_seo_adv_campaign` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `SETTINGS` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_campaign` (`ENGINE_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_seo_adv_campaign: ~0 rows (приблизительно)
DELETE FROM `b_seo_adv_campaign`;

-- Дамп структуры для таблица globus.b_seo_adv_group
CREATE TABLE IF NOT EXISTS `b_seo_adv_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `CAMPAIGN_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_group` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_group1` (`CAMPAIGN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_seo_adv_group: ~0 rows (приблизительно)
DELETE FROM `b_seo_adv_group`;

-- Дамп структуры для таблица globus.b_seo_adv_link
CREATE TABLE IF NOT EXISTS `b_seo_adv_link` (
  `LINK_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `LINK_ID` int(18) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  PRIMARY KEY (`LINK_TYPE`,`LINK_ID`,`BANNER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_seo_adv_link: ~0 rows (приблизительно)
DELETE FROM `b_seo_adv_link`;

-- Дамп структуры для таблица globus.b_seo_adv_log
CREATE TABLE IF NOT EXISTS `b_seo_adv_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `REQUEST_URI` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `REQUEST_DATA` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESPONSE_TIME` float NOT NULL,
  `RESPONSE_STATUS` int(5) DEFAULT NULL,
  `RESPONSE_DATA` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_adv_log1` (`ENGINE_ID`),
  KEY `ix_b_seo_adv_log2` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_seo_adv_log: ~0 rows (приблизительно)
DELETE FROM `b_seo_adv_log`;

-- Дамп структуры для таблица globus.b_seo_adv_order
CREATE TABLE IF NOT EXISTS `b_seo_adv_order` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `ORDER_ID` int(11) NOT NULL,
  `SUM` float DEFAULT 0,
  `PROCESSED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_order` (`ENGINE_ID`,`CAMPAIGN_ID`,`BANNER_ID`,`ORDER_ID`),
  KEY `ix_b_seo_adv_order1` (`ORDER_ID`,`PROCESSED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_seo_adv_order: ~0 rows (приблизительно)
DELETE FROM `b_seo_adv_order`;

-- Дамп структуры для таблица globus.b_seo_adv_region
CREATE TABLE IF NOT EXISTS `b_seo_adv_region` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARENT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_region` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_region1` (`PARENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_seo_adv_region: ~0 rows (приблизительно)
DELETE FROM `b_seo_adv_region`;

-- Дамп структуры для таблица globus.b_seo_keywords
CREATE TABLE IF NOT EXISTS `b_seo_keywords` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEYWORDS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_keywords_url` (`URL`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_seo_keywords: ~0 rows (приблизительно)
DELETE FROM `b_seo_keywords`;

-- Дамп структуры для таблица globus.b_seo_search_engine
CREATE TABLE IF NOT EXISTS `b_seo_search_engine` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SORT` int(5) DEFAULT 100,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLIENT_SECRET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REDIRECT_URI` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_search_engine_code` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_seo_search_engine: ~3 rows (приблизительно)
DELETE FROM `b_seo_search_engine`;
INSERT INTO `b_seo_search_engine` (`ID`, `CODE`, `ACTIVE`, `SORT`, `NAME`, `CLIENT_ID`, `CLIENT_SECRET`, `REDIRECT_URI`, `SETTINGS`) VALUES
	(1, 'google', 'Y', 200, 'Google', '868942902147-qrrd6ce1ajfkpse8ieq4gkpdeanvtnno.apps.googleusercontent.com', 'EItMlJpZLC2WRPKB6QsA5bV9', 'urn:ietf:wg:oauth:2.0:oob', NULL),
	(2, 'yandex', 'Y', 300, 'Yandex', 'f848c7bfc1d34a94ba6d05439f81bbd7', 'da0e73b2d9cc4e809f3170e49cb9df01', 'https://oauth.yandex.ru/verification_code', NULL),
	(3, 'yandex_direct', 'Y', 400, 'Yandex.Direct', '', '', 'https://oauth.yandex.ru/verification_code', NULL);

-- Дамп структуры для таблица globus.b_seo_service_log
CREATE TABLE IF NOT EXISTS `b_seo_service_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_seo_service_log: ~0 rows (приблизительно)
DELETE FROM `b_seo_service_log`;

-- Дамп структуры для таблица globus.b_seo_service_queue
CREATE TABLE IF NOT EXISTS `b_seo_service_queue` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `SERVICE_TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` int(11) NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT 100,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SEO_SERVICE_QUEUE_TYPE` (`TYPE`),
  KEY `IX_B_SEO_SERVICE_SERVICE_TYPE_CLIENT_ID` (`SERVICE_TYPE`,`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_seo_service_queue: ~0 rows (приблизительно)
DELETE FROM `b_seo_service_queue`;

-- Дамп структуры для таблица globus.b_seo_service_rtg_queue
CREATE TABLE IF NOT EXISTS `b_seo_service_rtg_queue` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCOUNT_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUDIENCE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PARENT_ID` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_TYPE` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTION` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_AUTO_REMOVE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SEO_SRV_RTG_QUEUE_1` (`ACTION`,`DATE_AUTO_REMOVE`),
  KEY `IX_B_SEO_SRV_RTG_QUEUE_2` (`TYPE`,`ACTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_seo_service_rtg_queue: ~0 rows (приблизительно)
DELETE FROM `b_seo_service_rtg_queue`;

-- Дамп структуры для таблица globus.b_seo_service_subscription
CREATE TABLE IF NOT EXISTS `b_seo_service_subscription` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CALLBACK_SERVER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_AUTH` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_B_SEO_SERVICE_SUB_1` (`TYPE`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_seo_service_subscription: ~0 rows (приблизительно)
DELETE FROM `b_seo_service_subscription`;

-- Дамп структуры для таблица globus.b_seo_service_webhook
CREATE TABLE IF NOT EXISTS `b_seo_service_webhook` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SECURITY_CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SEO_SERVICE_WEBHOOK_1` (`TYPE`,`EXTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_seo_service_webhook: ~0 rows (приблизительно)
DELETE FROM `b_seo_service_webhook`;

-- Дамп структуры для таблица globus.b_seo_sitemap
CREATE TABLE IF NOT EXISTS `b_seo_sitemap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_RUN` datetime DEFAULT NULL,
  `SETTINGS` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_seo_sitemap: ~0 rows (приблизительно)
DELETE FROM `b_seo_sitemap`;

-- Дамп структуры для таблица globus.b_seo_sitemap_entity
CREATE TABLE IF NOT EXISTS `b_seo_sitemap_entity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `SITEMAP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_sitemap_entity_1` (`ENTITY_TYPE`,`ENTITY_ID`),
  KEY `ix_b_seo_sitemap_entity_2` (`SITEMAP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_seo_sitemap_entity: ~0 rows (приблизительно)
DELETE FROM `b_seo_sitemap_entity`;

-- Дамп структуры для таблица globus.b_seo_sitemap_iblock
CREATE TABLE IF NOT EXISTS `b_seo_sitemap_iblock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `SITEMAP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_sitemap_iblock_1` (`IBLOCK_ID`),
  KEY `ix_b_seo_sitemap_iblock_2` (`SITEMAP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_seo_sitemap_iblock: ~0 rows (приблизительно)
DELETE FROM `b_seo_sitemap_iblock`;

-- Дамп структуры для таблица globus.b_seo_sitemap_runtime
CREATE TABLE IF NOT EXISTS `b_seo_sitemap_runtime` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PID` int(11) NOT NULL,
  `PROCESSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ITEM_PATH` varchar(700) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEM_ID` int(11) DEFAULT NULL,
  `ITEM_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `ACTIVE_ELEMENT` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_seo_sitemap_runtime1` (`PID`,`PROCESSED`,`ITEM_TYPE`,`ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_seo_sitemap_runtime: ~0 rows (приблизительно)
DELETE FROM `b_seo_sitemap_runtime`;

-- Дамп структуры для таблица globus.b_seo_yandex_direct_stat
CREATE TABLE IF NOT EXISTS `b_seo_yandex_direct_stat` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `DATE_DAY` date NOT NULL,
  `CURRENCY` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUM` float DEFAULT 0,
  `SUM_SEARCH` float DEFAULT 0,
  `SUM_CONTEXT` float DEFAULT 0,
  `CLICKS` int(7) DEFAULT 0,
  `CLICKS_SEARCH` int(7) DEFAULT 0,
  `CLICKS_CONTEXT` int(7) DEFAULT 0,
  `SHOWS` int(7) DEFAULT 0,
  `SHOWS_SEARCH` int(7) DEFAULT 0,
  `SHOWS_CONTEXT` int(7) DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_seo_yandex_direct_stat` (`BANNER_ID`,`DATE_DAY`),
  KEY `ix_seo_yandex_direct_stat1` (`CAMPAIGN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_seo_yandex_direct_stat: ~0 rows (приблизительно)
DELETE FROM `b_seo_yandex_direct_stat`;

-- Дамп структуры для таблица globus.b_short_uri
CREATE TABLE IF NOT EXISTS `b_short_uri` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `URI` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `URI_CRC` int(11) NOT NULL,
  `SHORT_URI` varbinary(250) NOT NULL,
  `SHORT_URI_CRC` int(11) NOT NULL,
  `STATUS` int(11) NOT NULL DEFAULT 301,
  `MODIFIED` datetime NOT NULL,
  `LAST_USED` datetime DEFAULT NULL,
  `NUMBER_USED` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `ux_b_short_uri_1` (`SHORT_URI_CRC`),
  KEY `ux_b_short_uri_2` (`URI_CRC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_short_uri: ~0 rows (приблизительно)
DELETE FROM `b_short_uri`;

-- Дамп структуры для таблица globus.b_site_template
CREATE TABLE IF NOT EXISTS `b_site_template` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT 500,
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_site_template_site` (`SITE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_site_template: ~0 rows (приблизительно)
DELETE FROM `b_site_template`;
INSERT INTO `b_site_template` (`ID`, `SITE_ID`, `CONDITION`, `SORT`, `TEMPLATE`) VALUES
	(1, 's1', '', 1, 'globus');

-- Дамп структуры для таблица globus.b_smile
CREATE TABLE IF NOT EXISTS `b_smile` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `SET_ID` int(11) NOT NULL DEFAULT 0,
  `SORT` int(11) NOT NULL DEFAULT 150,
  `TYPING` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLICKABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IMAGE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `IMAGE_DEFINITION` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SD',
  `IMAGE_WIDTH` int(11) NOT NULL DEFAULT 0,
  `IMAGE_HEIGHT` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_smile: ~24 rows (приблизительно)
DELETE FROM `b_smile`;
INSERT INTO `b_smile` (`ID`, `TYPE`, `SET_ID`, `SORT`, `TYPING`, `CLICKABLE`, `HIDDEN`, `IMAGE`, `IMAGE_DEFINITION`, `IMAGE_WIDTH`, `IMAGE_HEIGHT`) VALUES
	(1, 'S', 2, 100, ':) :-)', 'Y', 'N', 'bx_smile_smile.png', 'UHD', 20, 20),
	(2, 'S', 2, 105, ';) ;-)', 'Y', 'N', 'bx_smile_wink.png', 'UHD', 20, 20),
	(3, 'S', 2, 110, ':D :-D', 'Y', 'N', 'bx_smile_biggrin.png', 'UHD', 20, 20),
	(4, 'S', 2, 115, '8-)', 'Y', 'N', 'bx_smile_cool.png', 'UHD', 20, 20),
	(5, 'S', 2, 120, ':facepalm:', 'Y', 'N', 'bx_smile_facepalm.png', 'UHD', 20, 20),
	(6, 'S', 2, 125, ':{} :-{}', 'Y', 'N', 'bx_smile_kiss.png', 'UHD', 20, 20),
	(7, 'S', 2, 130, ':( :-(', 'Y', 'N', 'bx_smile_sad.png', 'UHD', 20, 20),
	(8, 'S', 2, 135, ':| :-|', 'Y', 'N', 'bx_smile_neutral.png', 'UHD', 20, 20),
	(9, 'S', 2, 140, ':oops:', 'Y', 'N', 'bx_smile_redface.png', 'UHD', 20, 20),
	(10, 'S', 2, 145, ':cry: :~(', 'Y', 'N', 'bx_smile_cry.png', 'UHD', 20, 20),
	(11, 'S', 2, 150, ':evil: >:-<', 'Y', 'N', 'bx_smile_evil.png', 'UHD', 20, 20),
	(12, 'S', 2, 155, ':o :-o :shock:', 'Y', 'N', 'bx_smile_eek.png', 'UHD', 20, 20),
	(13, 'S', 2, 160, ':/ :-/', 'Y', 'N', 'bx_smile_confuse.png', 'UHD', 20, 20),
	(14, 'S', 2, 165, ':idea:', 'Y', 'N', 'bx_smile_idea.png', 'UHD', 20, 20),
	(15, 'S', 2, 170, ':?:', 'Y', 'N', 'bx_smile_question.png', 'UHD', 20, 20),
	(16, 'S', 2, 175, ':!:', 'Y', 'N', 'bx_smile_exclaim.png', 'UHD', 20, 20),
	(17, 'S', 2, 180, ':like:', 'Y', 'N', 'bx_smile_like.png', 'UHD', 20, 20),
	(18, 'I', 2, 175, 'ICON_NOTE', 'Y', 'N', 'bx_icon_1.gif', 'SD', 15, 15),
	(19, 'I', 2, 180, 'ICON_DIRRECTION', 'Y', 'N', 'bx_icon_2.gif', 'SD', 15, 15),
	(20, 'I', 2, 185, 'ICON_IDEA', 'Y', 'N', 'bx_icon_3.gif', 'SD', 15, 15),
	(21, 'I', 2, 190, 'ICON_ATTANSION', 'Y', 'N', 'bx_icon_4.gif', 'SD', 15, 15),
	(22, 'I', 2, 195, 'ICON_QUESTION', 'Y', 'N', 'bx_icon_5.gif', 'SD', 15, 15),
	(23, 'I', 2, 200, 'ICON_BAD', 'Y', 'N', 'bx_icon_6.gif', 'SD', 15, 15),
	(24, 'I', 2, 205, 'ICON_GOOD', 'Y', 'N', 'bx_icon_7.gif', 'SD', 15, 15);

-- Дамп структуры для таблица globus.b_smile_lang
CREATE TABLE IF NOT EXISTS `b_smile_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `SID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_SMILE_SL` (`TYPE`,`SID`,`LID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_smile_lang: ~38 rows (приблизительно)
DELETE FROM `b_smile_lang`;
INSERT INTO `b_smile_lang` (`ID`, `TYPE`, `SID`, `LID`, `NAME`) VALUES
	(1, 'P', 1, 'ru', 'Стандартная галерея'),
	(2, 'P', 1, 'en', 'Standard gallery'),
	(3, 'G', 2, 'ru', 'Основной набор'),
	(4, 'G', 2, 'en', 'Default pack'),
	(5, 'S', 1, 'ru', 'С улыбкой'),
	(6, 'S', 1, 'en', 'Smile'),
	(7, 'S', 2, 'ru', 'Шутливо'),
	(8, 'S', 2, 'en', 'Wink'),
	(9, 'S', 3, 'ru', 'Широкая улыбка'),
	(10, 'S', 3, 'en', 'Big grin'),
	(11, 'S', 4, 'ru', 'Здорово'),
	(12, 'S', 4, 'en', 'Cool'),
	(13, 'S', 5, 'ru', 'Разочарование'),
	(14, 'S', 5, 'en', 'Facepalm'),
	(15, 'S', 6, 'ru', 'Поцелуй'),
	(16, 'S', 6, 'en', 'Kiss'),
	(17, 'S', 7, 'ru', 'Печально'),
	(18, 'S', 7, 'en', 'Sad'),
	(19, 'S', 8, 'ru', 'Скептически'),
	(20, 'S', 8, 'en', 'Skeptic'),
	(21, 'S', 9, 'ru', 'Смущенный'),
	(22, 'S', 9, 'en', 'Embarrassed'),
	(23, 'S', 10, 'ru', 'Очень грустно'),
	(24, 'S', 10, 'en', 'Crying'),
	(25, 'S', 11, 'ru', 'Со злостью'),
	(26, 'S', 11, 'en', 'Angry'),
	(27, 'S', 12, 'ru', 'Удивленно'),
	(28, 'S', 12, 'en', 'Surprised'),
	(29, 'S', 13, 'ru', 'Смущенно'),
	(30, 'S', 13, 'en', 'Confused'),
	(31, 'S', 14, 'ru', 'Идея'),
	(32, 'S', 14, 'en', 'Idea'),
	(33, 'S', 15, 'ru', 'Вопрос'),
	(34, 'S', 15, 'en', 'Question'),
	(35, 'S', 16, 'ru', 'Восклицание'),
	(36, 'S', 16, 'en', 'Exclamation'),
	(37, 'S', 17, 'ru', 'Нравится'),
	(38, 'S', 17, 'en', 'Like');

-- Дамп структуры для таблица globus.b_smile_set
CREATE TABLE IF NOT EXISTS `b_smile_set` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'G',
  `PARENT_ID` int(11) NOT NULL DEFAULT 0,
  `STRING_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT 150,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_smile_set: ~2 rows (приблизительно)
DELETE FROM `b_smile_set`;
INSERT INTO `b_smile_set` (`ID`, `TYPE`, `PARENT_ID`, `STRING_ID`, `SORT`) VALUES
	(1, 'P', 0, 'bitrix', 150),
	(2, 'G', 1, 'bitrix_main', 150);

-- Дамп структуры для таблица globus.b_sms_template
CREATE TABLE IF NOT EXISTS `b_sms_template` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SENDER` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RECEIVER` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_sms_message_name` (`EVENT_NAME`(50))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_sms_template: ~3 rows (приблизительно)
DELETE FROM `b_sms_template`;
INSERT INTO `b_sms_template` (`ID`, `EVENT_NAME`, `ACTIVE`, `SENDER`, `RECEIVER`, `MESSAGE`, `LANGUAGE_ID`) VALUES
	(1, 'SMS_USER_CONFIRM_NUMBER', 'Y', '#DEFAULT_SENDER#', '#USER_PHONE#', 'Код подтверждения #CODE#', NULL),
	(2, 'SMS_USER_RESTORE_PASSWORD', 'Y', '#DEFAULT_SENDER#', '#USER_PHONE#', 'Код для восстановления пароля #CODE#', NULL),
	(3, 'SMS_EVENT_LOG_NOTIFICATION', 'Y', '#DEFAULT_SENDER#', '#PHONE_NUMBER#', '#NAME#: #ADDITIONAL_TEXT# (событий: #EVENT_COUNT#)', NULL);

-- Дамп структуры для таблица globus.b_sms_template_site
CREATE TABLE IF NOT EXISTS `b_sms_template_site` (
  `TEMPLATE_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`TEMPLATE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_sms_template_site: ~3 rows (приблизительно)
DELETE FROM `b_sms_template_site`;
INSERT INTO `b_sms_template_site` (`TEMPLATE_ID`, `SITE_ID`) VALUES
	(1, 's1'),
	(2, 's1'),
	(3, 's1');

-- Дамп структуры для таблица globus.b_sm_version_history
CREATE TABLE IF NOT EXISTS `b_sm_version_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `VERSIONS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_sm_version_history: ~0 rows (приблизительно)
DELETE FROM `b_sm_version_history`;

-- Дамп структуры для таблица globus.b_socialservices_ap
CREATE TABLE IF NOT EXISTS `b_socialservices_ap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT current_timestamp(),
  `USER_ID` int(11) NOT NULL,
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ENDPOINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIN` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  `SETTINGS` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_socialservices_ap1` (`USER_ID`,`DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_socialservices_ap: ~0 rows (приблизительно)
DELETE FROM `b_socialservices_ap`;

-- Дамп структуры для таблица globus.b_socialservices_contact
CREATE TABLE IF NOT EXISTS `b_socialservices_contact` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT current_timestamp(),
  `USER_ID` int(11) NOT NULL,
  `CONTACT_USER_ID` int(11) DEFAULT NULL,
  `CONTACT_XML_ID` int(11) DEFAULT NULL,
  `CONTACT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_LAST_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_PHOTO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  `NOTIFY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_contact1` (`USER_ID`),
  KEY `ix_b_socialservices_contact2` (`CONTACT_USER_ID`),
  KEY `ix_b_socialservices_contact3` (`TIMESTAMP_X`),
  KEY `ix_b_socialservices_contact4` (`LAST_AUTHORIZE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_socialservices_contact: ~0 rows (приблизительно)
DELETE FROM `b_socialservices_contact`;

-- Дамп структуры для таблица globus.b_socialservices_contact_connect
CREATE TABLE IF NOT EXISTS `b_socialservices_contact_connect` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT current_timestamp(),
  `CONTACT_ID` int(11) DEFAULT NULL,
  `LINK_ID` int(11) DEFAULT NULL,
  `CONTACT_PROFILE_ID` int(11) NOT NULL,
  `CONTACT_PORTAL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONNECT_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT 'P',
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_contact_connect1` (`CONTACT_ID`),
  KEY `ix_b_socialservices_contact_connect2` (`LINK_ID`),
  KEY `ix_b_socialservices_contact_connect3` (`LAST_AUTHORIZE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_socialservices_contact_connect: ~0 rows (приблизительно)
DELETE FROM `b_socialservices_contact_connect`;

-- Дамп структуры для таблица globus.b_socialservices_message
CREATE TABLE IF NOT EXISTS `b_socialservices_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `SOCSERV_USER_ID` int(11) NOT NULL,
  `PROVIDER` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `SUCCES_SENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_socialservices_message: ~0 rows (приблизительно)
DELETE FROM `b_socialservices_message`;

-- Дамп структуры для таблица globus.b_socialservices_user
CREATE TABLE IF NOT EXISTS `b_socialservices_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PHOTO` int(11) DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `XML_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `CAN_DELETE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `PERSONAL_WWW` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERMISSIONS` varchar(555) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OATOKEN` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `OATOKEN_EXPIRES` int(11) DEFAULT NULL,
  `OASECRET` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `REFRESH_TOKEN` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEND_ACTIVITY` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SITE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INITIALIZED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_SOCIALSERVICES_USER` (`XML_ID`,`EXTERNAL_AUTH_ID`),
  KEY `IX_B_SOCIALSERVICES_US_3` (`LOGIN`),
  KEY `IX_B_SOCIALSERVICES_US_4` (`USER_ID`,`EXTERNAL_AUTH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_socialservices_user: ~0 rows (приблизительно)
DELETE FROM `b_socialservices_user`;

-- Дамп структуры для таблица globus.b_socialservices_user_link
CREATE TABLE IF NOT EXISTS `b_socialservices_user_link` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `SOCSERV_USER_ID` int(11) NOT NULL,
  `LINK_USER_ID` int(11) DEFAULT NULL,
  `LINK_UID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LINK_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_LAST_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_PICTURE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_user_link_5` (`SOCSERV_USER_ID`),
  KEY `ix_b_socialservices_user_link_6` (`LINK_USER_ID`,`TIMESTAMP_X`),
  KEY `ix_b_socialservices_user_link_7` (`LINK_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_socialservices_user_link: ~0 rows (приблизительно)
DELETE FROM `b_socialservices_user_link`;

-- Дамп структуры для таблица globus.b_socialservices_zoom_meeting
CREATE TABLE IF NOT EXISTS `b_socialservices_zoom_meeting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE_ID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `CONFERENCE_URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFERENCE_EXTERNAL_ID` bigint(20) unsigned NOT NULL,
  `CONFERENCE_PASSWORD` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `JOINED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONFERENCE_CREATED` datetime DEFAULT NULL,
  `CONFERENCE_STARTED` datetime DEFAULT NULL,
  `CONFERENCE_ENDED` datetime DEFAULT NULL,
  `DURATION` int(11) DEFAULT NULL,
  `TITLE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SHORT_LINK` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_RECORDING` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SOCIALSERVICES_ZOOM_MEETING_1` (`CONFERENCE_EXTERNAL_ID`),
  KEY `IX_B_SOCIALSERVICES_ZOOM_MEETING_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_socialservices_zoom_meeting: ~0 rows (приблизительно)
DELETE FROM `b_socialservices_zoom_meeting`;

-- Дамп структуры для таблица globus.b_socialservices_zoom_meeting_recording
CREATE TABLE IF NOT EXISTS `b_socialservices_zoom_meeting_recording` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EXTERNAL_ID` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `MEETING_ID` int(11) NOT NULL,
  `START_DATE` datetime NOT NULL,
  `END_DATE` datetime NOT NULL,
  `FILE_TYPE` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_SIZE` int(11) NOT NULL,
  `PLAY_URL` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DOWNLOAD_URL` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RECORDING_TYPE` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `DOWNLOAD_TOKEN` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `PASSWORD` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SOCIALSERVICES_ZOOM_MEETING_RECORDING_1` (`MEETING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_socialservices_zoom_meeting_recording: ~0 rows (приблизительно)
DELETE FROM `b_socialservices_zoom_meeting_recording`;

-- Дамп структуры для таблица globus.b_sticker
CREATE TABLE IF NOT EXISTS `b_sticker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAGE_URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PAGE_TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `MODIFIED_BY` int(18) NOT NULL,
  `CREATED_BY` int(18) NOT NULL,
  `PERSONAL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CONTENT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `POS_TOP` int(11) DEFAULT NULL,
  `POS_LEFT` int(11) DEFAULT NULL,
  `WIDTH` int(11) DEFAULT NULL,
  `HEIGHT` int(11) DEFAULT NULL,
  `COLOR` int(11) DEFAULT NULL,
  `COLLAPSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `COMPLETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CLOSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `MARKER_TOP` int(11) DEFAULT NULL,
  `MARKER_LEFT` int(11) DEFAULT NULL,
  `MARKER_WIDTH` int(11) DEFAULT NULL,
  `MARKER_HEIGHT` int(11) DEFAULT NULL,
  `MARKER_ADJUST` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_sticker: ~0 rows (приблизительно)
DELETE FROM `b_sticker`;

-- Дамп структуры для таблица globus.b_sticker_group_task
CREATE TABLE IF NOT EXISTS `b_sticker_group_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_sticker_group_task: ~0 rows (приблизительно)
DELETE FROM `b_sticker_group_task`;

-- Дамп структуры для таблица globus.b_subscription
CREATE TABLE IF NOT EXISTS `b_subscription` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `DATE_UPDATE` datetime DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `CONFIRM_CODE` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONFIRMED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DATE_CONFIRM` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_SUBSCRIPTION_EMAIL` (`EMAIL`,`USER_ID`),
  KEY `IX_DATE_CONFIRM` (`CONFIRMED`,`DATE_CONFIRM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_subscription: ~0 rows (приблизительно)
DELETE FROM `b_subscription`;

-- Дамп структуры для таблица globus.b_subscription_rubric
CREATE TABLE IF NOT EXISTS `b_subscription_rubric` (
  `SUBSCRIPTION_ID` int(11) NOT NULL,
  `LIST_RUBRIC_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_SUBSCRIPTION_RUBRIC` (`SUBSCRIPTION_ID`,`LIST_RUBRIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_subscription_rubric: ~0 rows (приблизительно)
DELETE FROM `b_subscription_rubric`;

-- Дамп структуры для таблица globus.b_task
CREATE TABLE IF NOT EXISTS `b_task` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LETTER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SYS` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'module',
  PRIMARY KEY (`ID`),
  KEY `ix_task` (`MODULE_ID`,`BINDING`,`LETTER`,`SYS`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_task: ~54 rows (приблизительно)
DELETE FROM `b_task`;
INSERT INTO `b_task` (`ID`, `NAME`, `LETTER`, `MODULE_ID`, `SYS`, `DESCRIPTION`, `BINDING`) VALUES
	(1, 'main_denied', 'D', 'main', 'Y', NULL, 'module'),
	(2, 'main_change_profile', 'P', 'main', 'Y', NULL, 'module'),
	(3, 'main_view_all_settings', 'R', 'main', 'Y', NULL, 'module'),
	(4, 'main_view_all_settings_change_profile', 'T', 'main', 'Y', NULL, 'module'),
	(5, 'main_edit_subordinate_users', 'V', 'main', 'Y', NULL, 'module'),
	(6, 'main_full_access', 'W', 'main', 'Y', NULL, 'module'),
	(7, 'fm_folder_access_denied', 'D', 'main', 'Y', NULL, 'file'),
	(8, 'fm_folder_access_read', 'R', 'main', 'Y', NULL, 'file'),
	(9, 'fm_folder_access_write', 'W', 'main', 'Y', NULL, 'file'),
	(10, 'fm_folder_access_full', 'X', 'main', 'Y', NULL, 'file'),
	(11, 'fm_folder_access_workflow', 'U', 'main', 'Y', NULL, 'file'),
	(12, 'bitrixcloud_deny', 'D', 'bitrixcloud', 'Y', NULL, 'module'),
	(13, 'bitrixcloud_control', 'W', 'bitrixcloud', 'Y', NULL, 'module'),
	(14, 'clouds_denied', 'D', 'clouds', 'Y', NULL, 'module'),
	(15, 'clouds_browse', 'F', 'clouds', 'Y', NULL, 'module'),
	(16, 'clouds_upload', 'U', 'clouds', 'Y', NULL, 'module'),
	(17, 'clouds_full_access', 'W', 'clouds', 'Y', NULL, 'module'),
	(18, 'fileman_denied', 'D', 'fileman', 'Y', '', 'module'),
	(19, 'fileman_allowed_folders', 'F', 'fileman', 'Y', '', 'module'),
	(20, 'fileman_full_access', 'W', 'fileman', 'Y', '', 'module'),
	(21, 'medialib_denied', 'D', 'fileman', 'Y', '', 'medialib'),
	(22, 'medialib_view', 'F', 'fileman', 'Y', '', 'medialib'),
	(23, 'medialib_only_new', 'R', 'fileman', 'Y', '', 'medialib'),
	(24, 'medialib_edit_items', 'V', 'fileman', 'Y', '', 'medialib'),
	(25, 'medialib_editor', 'W', 'fileman', 'Y', '', 'medialib'),
	(26, 'medialib_full', 'X', 'fileman', 'Y', '', 'medialib'),
	(27, 'stickers_denied', 'D', 'fileman', 'Y', '', 'stickers'),
	(28, 'stickers_read', 'R', 'fileman', 'Y', '', 'stickers'),
	(29, 'stickers_edit', 'W', 'fileman', 'Y', '', 'stickers'),
	(30, 'hblock_denied', 'D', 'highloadblock', 'Y', NULL, 'module'),
	(31, 'hblock_read', 'R', 'highloadblock', 'Y', NULL, 'module'),
	(32, 'hblock_write', 'W', 'highloadblock', 'Y', NULL, 'module'),
	(33, 'iblock_deny', 'D', 'iblock', 'Y', NULL, 'iblock'),
	(34, 'iblock_read', 'R', 'iblock', 'Y', NULL, 'iblock'),
	(35, 'iblock_element_add', 'E', 'iblock', 'Y', NULL, 'iblock'),
	(36, 'iblock_admin_read', 'S', 'iblock', 'Y', NULL, 'iblock'),
	(37, 'iblock_admin_add', 'T', 'iblock', 'Y', NULL, 'iblock'),
	(38, 'iblock_limited_edit', 'U', 'iblock', 'Y', NULL, 'iblock'),
	(39, 'iblock_full_edit', 'W', 'iblock', 'Y', NULL, 'iblock'),
	(40, 'iblock_full', 'X', 'iblock', 'Y', NULL, 'iblock'),
	(41, 'landing_right_denied', 'D', 'landing', 'Y', NULL, 'module'),
	(42, 'landing_right_read', 'R', 'landing', 'Y', NULL, 'module'),
	(43, 'landing_right_edit', 'U', 'landing', 'Y', NULL, 'module'),
	(44, 'landing_right_sett', 'V', 'landing', 'Y', NULL, 'module'),
	(45, 'landing_right_public', 'W', 'landing', 'Y', NULL, 'module'),
	(46, 'landing_right_delete', 'X', 'landing', 'Y', NULL, 'module'),
	(47, 'security_denied', 'D', 'security', 'Y', NULL, 'module'),
	(48, 'security_filter', 'F', 'security', 'Y', NULL, 'module'),
	(49, 'security_otp', 'S', 'security', 'Y', NULL, 'module'),
	(50, 'security_view_all_settings', 'T', 'security', 'Y', NULL, 'module'),
	(51, 'security_full_access', 'W', 'security', 'Y', NULL, 'module'),
	(52, 'seo_denied', 'D', 'seo', 'Y', '', 'module'),
	(53, 'seo_edit', 'F', 'seo', 'Y', '', 'module'),
	(54, 'seo_full_access', 'W', 'seo', 'Y', '', 'module');

-- Дамп структуры для таблица globus.b_task_operation
CREATE TABLE IF NOT EXISTS `b_task_operation` (
  `TASK_ID` int(11) NOT NULL,
  `OPERATION_ID` int(11) NOT NULL,
  PRIMARY KEY (`TASK_ID`,`OPERATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_task_operation: ~230 rows (приблизительно)
DELETE FROM `b_task_operation`;
INSERT INTO `b_task_operation` (`TASK_ID`, `OPERATION_ID`) VALUES
	(2, 2),
	(2, 3),
	(3, 2),
	(3, 4),
	(3, 5),
	(3, 6),
	(3, 7),
	(4, 2),
	(4, 3),
	(4, 4),
	(4, 5),
	(4, 6),
	(4, 7),
	(5, 2),
	(5, 3),
	(5, 5),
	(5, 6),
	(5, 7),
	(5, 8),
	(5, 9),
	(6, 2),
	(6, 3),
	(6, 4),
	(6, 5),
	(6, 6),
	(6, 7),
	(6, 10),
	(6, 11),
	(6, 12),
	(6, 13),
	(6, 14),
	(6, 15),
	(6, 16),
	(6, 17),
	(6, 18),
	(8, 19),
	(8, 20),
	(8, 21),
	(9, 19),
	(9, 20),
	(9, 21),
	(9, 22),
	(9, 23),
	(9, 24),
	(9, 25),
	(9, 26),
	(9, 27),
	(9, 28),
	(9, 29),
	(9, 30),
	(9, 31),
	(9, 32),
	(9, 33),
	(9, 34),
	(10, 19),
	(10, 20),
	(10, 21),
	(10, 22),
	(10, 23),
	(10, 24),
	(10, 25),
	(10, 26),
	(10, 27),
	(10, 28),
	(10, 29),
	(10, 30),
	(10, 31),
	(10, 32),
	(10, 33),
	(10, 34),
	(10, 35),
	(11, 19),
	(11, 20),
	(11, 21),
	(11, 24),
	(11, 28),
	(13, 36),
	(13, 37),
	(13, 38),
	(15, 39),
	(16, 39),
	(16, 40),
	(17, 39),
	(17, 40),
	(17, 41),
	(19, 44),
	(19, 45),
	(19, 46),
	(19, 47),
	(19, 48),
	(19, 49),
	(19, 50),
	(19, 52),
	(19, 53),
	(20, 42),
	(20, 43),
	(20, 44),
	(20, 45),
	(20, 46),
	(20, 47),
	(20, 48),
	(20, 49),
	(20, 50),
	(20, 51),
	(20, 52),
	(20, 53),
	(20, 54),
	(22, 55),
	(23, 55),
	(23, 56),
	(23, 60),
	(24, 55),
	(24, 60),
	(24, 61),
	(24, 62),
	(25, 55),
	(25, 56),
	(25, 57),
	(25, 58),
	(25, 60),
	(25, 61),
	(25, 62),
	(26, 55),
	(26, 56),
	(26, 57),
	(26, 58),
	(26, 59),
	(26, 60),
	(26, 61),
	(26, 62),
	(28, 63),
	(29, 63),
	(29, 64),
	(29, 65),
	(29, 66),
	(31, 67),
	(32, 68),
	(32, 69),
	(34, 70),
	(34, 71),
	(35, 72),
	(36, 70),
	(36, 71),
	(36, 73),
	(37, 70),
	(37, 71),
	(37, 72),
	(37, 73),
	(38, 70),
	(38, 71),
	(38, 72),
	(38, 73),
	(38, 74),
	(38, 75),
	(38, 76),
	(38, 77),
	(39, 70),
	(39, 71),
	(39, 72),
	(39, 73),
	(39, 74),
	(39, 75),
	(39, 76),
	(39, 77),
	(39, 78),
	(39, 79),
	(39, 80),
	(39, 81),
	(40, 70),
	(40, 71),
	(40, 72),
	(40, 73),
	(40, 74),
	(40, 75),
	(40, 76),
	(40, 77),
	(40, 78),
	(40, 79),
	(40, 80),
	(40, 81),
	(40, 82),
	(40, 83),
	(40, 84),
	(40, 85),
	(40, 86),
	(40, 87),
	(42, 88),
	(43, 89),
	(44, 90),
	(45, 91),
	(46, 92),
	(48, 93),
	(49, 94),
	(50, 95),
	(50, 96),
	(50, 97),
	(50, 98),
	(50, 99),
	(50, 100),
	(50, 101),
	(50, 102),
	(50, 103),
	(50, 104),
	(50, 105),
	(51, 93),
	(51, 94),
	(51, 95),
	(51, 96),
	(51, 97),
	(51, 98),
	(51, 99),
	(51, 100),
	(51, 101),
	(51, 102),
	(51, 103),
	(51, 104),
	(51, 105),
	(51, 106),
	(51, 107),
	(51, 108),
	(51, 109),
	(51, 110),
	(51, 111),
	(51, 112),
	(51, 113),
	(51, 114),
	(51, 115),
	(51, 116),
	(51, 117),
	(51, 118),
	(53, 120),
	(54, 119),
	(54, 120);

-- Дамп структуры для таблица globus.b_translate_diff
CREATE TABLE IF NOT EXISTS `b_translate_diff` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FILE_ID` int(18) NOT NULL,
  `PATH_ID` int(18) NOT NULL,
  `LANG_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `AGAINST_LANG_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `EXCESS_COUNT` int(18) NOT NULL DEFAULT 0,
  `DEFICIENCY_COUNT` int(18) DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IXU_TRNSL_DIFF` (`FILE_ID`,`LANG_ID`,`AGAINST_LANG_ID`),
  KEY `IX_TRNSL_DIFF_PATH` (`PATH_ID`,`LANG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_translate_diff: ~0 rows (приблизительно)
DELETE FROM `b_translate_diff`;

-- Дамп структуры для таблица globus.b_translate_file
CREATE TABLE IF NOT EXISTS `b_translate_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `PATH_ID` int(18) NOT NULL,
  `LANG_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `FULL_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE_COUNT` int(18) NOT NULL DEFAULT 0,
  `INDEXED` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `INDEXED_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_TRNSL_FL_PATH` (`PATH_ID`,`LANG_ID`),
  KEY `IX_TRNSL_FULL_PATH` (`FULL_PATH`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_translate_file: ~0 rows (приблизительно)
DELETE FROM `b_translate_file`;

-- Дамп структуры для таблица globus.b_translate_path
CREATE TABLE IF NOT EXISTS `b_translate_path` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(18) NOT NULL DEFAULT 0,
  `DEPTH_LEVEL` int(18) NOT NULL DEFAULT 0,
  `SORT` int(18) NOT NULL DEFAULT 0,
  `PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `IS_LANG` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IS_DIR` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `OBLIGATORY_LANGS` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEXED` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `INDEXED_TIME` datetime DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ASSIGNMENT` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_TRNSL_PTH_NAME` (`PARENT_ID`,`NAME`),
  KEY `IX_TRNSL_PTH_PARENT` (`PARENT_ID`,`IS_DIR`,`IS_LANG`),
  KEY `IX_TRNSL_PTH_PATH` (`PATH`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_translate_path: ~0 rows (приблизительно)
DELETE FROM `b_translate_path`;

-- Дамп структуры для таблица globus.b_translate_path_lang
CREATE TABLE IF NOT EXISTS `b_translate_path_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_TRNSL_LNG_PATH` (`PATH`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_translate_path_lang: ~0 rows (приблизительно)
DELETE FROM `b_translate_path_lang`;

-- Дамп структуры для таблица globus.b_translate_path_tree
CREATE TABLE IF NOT EXISTS `b_translate_path_tree` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(18) NOT NULL,
  `PATH_ID` int(18) NOT NULL,
  `DEPTH_LEVEL` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_TRNSL_ANCESTOR` (`PARENT_ID`,`DEPTH_LEVEL`,`PATH_ID`),
  UNIQUE KEY `IX_TRNSL_DESCENDANT` (`PATH_ID`,`PARENT_ID`,`DEPTH_LEVEL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_translate_path_tree: ~0 rows (приблизительно)
DELETE FROM `b_translate_path_tree`;

-- Дамп структуры для таблица globus.b_translate_phrase
CREATE TABLE IF NOT EXISTS `b_translate_phrase` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FILE_ID` int(18) NOT NULL,
  `PATH_ID` int(18) NOT NULL,
  `LANG_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PHRASE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IXU_TRNSL_PHR_PATH_CODE` (`PATH_ID`,`LANG_ID`,`CODE`),
  KEY `IX_TRNSL_PHR_PATH` (`PATH_ID`,`CODE`),
  KEY `IX_TRNSL_FILE` (`FILE_ID`),
  FULLTEXT KEY `IXF_TRNSL_PHR` (`PHRASE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

-- Дамп данных таблицы globus.b_translate_phrase: ~0 rows (приблизительно)
DELETE FROM `b_translate_phrase`;

-- Дамп структуры для таблица globus.b_ui_entity_editor_config
CREATE TABLE IF NOT EXISTS `b_ui_entity_editor_config` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CATEGORY` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE_ID` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci NOT NULL,
  `COMMON` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ENTITY_TYPE_ID` (`ENTITY_TYPE_ID`),
  KEY `CATEGORY` (`CATEGORY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_ui_entity_editor_config: ~0 rows (приблизительно)
DELETE FROM `b_ui_entity_editor_config`;

-- Дамп структуры для таблица globus.b_ui_entity_editor_config_ac
CREATE TABLE IF NOT EXISTS `b_ui_entity_editor_config_ac` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ACCESS_CODE` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIG_ID` int(10) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ACCESS_CODE` (`ACCESS_CODE`),
  KEY `CONFIG_ID` (`CONFIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_ui_entity_editor_config_ac: ~0 rows (приблизительно)
DELETE FROM `b_ui_entity_editor_config_ac`;

-- Дамп структуры для таблица globus.b_undo
CREATE TABLE IF NOT EXISTS `b_undo` (
  `ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNDO_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNDO_HANDLER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `TIMESTAMP_X` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_undo: ~8 rows (приблизительно)
DELETE FROM `b_undo`;
INSERT INTO `b_undo` (`ID`, `MODULE_ID`, `UNDO_TYPE`, `UNDO_HANDLER`, `CONTENT`, `USER_ID`, `TIMESTAMP_X`) VALUES
	('10874a5adad91b953ea66b67fa3220c1c', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:71:"D:/OpenServer/domains/local.globus.ru/application/menu/school/index.php";s:7:"content";s:294:"<?php require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/header.php"); ?>\r\n<?php $APPLICATION->SetTitle(\'Меню для школ\'); ?>\r\n<?php\r\n$APPLICATION->IncludeComponent(\'bitrix:catalog.section.list\', \'.default\', array());\r\n?>\r\n<?php require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/footer.php"); ?>";}', 1, 1676122385),
	('10e125b35fdeaff4ea0a65c90e08fb1af', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:65:"D:/OpenServer/domains/local.globus.ru/application/about/index.php";s:7:"content";s:10113:"<?php require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/header.php"); ?>\n<?php $APPLICATION->SetTitle(\'О комбинате\'); ?>\n    <div class="about-banner">\n        <div class="about-banner-text">\n            <?php $APPLICATION->IncludeComponent(\n                "bitrix:main.include",\n                ".default",\n                array(\n                    "COMPONENT_TEMPLATE" => ".default",\n                    "AREA_FILE_SHOW" => "file",\n                    "PATH" => "/local/include/about-letter.php",\n                    "EDIT_TEMPLATE" => ""\n                ),\n                false\n            ); ?>\n        </div>\n        <div class="about-banner-sign">\n            <?php $APPLICATION->IncludeComponent(\n                "bitrix:main.include",\n                ".default",\n                array(\n                    "COMPONENT_TEMPLATE" => ".default",\n                    "AREA_FILE_SHOW" => "file",\n                    "PATH" => "/local/include/about-sign.php",\n                    "EDIT_TEMPLATE" => ""\n                ),\n                false\n            ); ?>\n        </div>\n        <div class="about-banner-image"><img src="<?= ASSETS_PATH; ?>/images/director.png"></div>\n    </div>\n\n<?php $APPLICATION->IncludeComponent(\'bitrix:news.list\', \'.default\', array()); ?>\n    <div class="company-history">\n        <div class="company-history-title">История комбината<br>школьного питания «Глобус»</div>\n        <div class="company-history-list">\n            <div class="company-history-list-side">\n                <div class="company-history-list-item">\n                    <div class="company-history-list-item__title">1998 г.</div>\n                    <div class="company-history-list-item-content">\n                        <div class="company-history-list-item__text">Наше дело не так однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений.</div>\n                        <img class="company-history-list-item__img" src="<?= ASSETS_PATH; ?>/images/company-history/1.png"></div>\n                </div>\n                <div class="company-history-list-item">\n                    <div class="company-history-list-item__title">2011 г.</div>\n                    <div class="company-history-list-item-content">\n                        <div class="company-history-list-item__text">Наше дело не так однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений.</div>\n                        <img class="company-history-list-item__img" src="<?= ASSETS_PATH; ?>/images/company-history/2.png"></div>\n                </div>\n                <div class="company-history-list-item">\n                    <div class="company-history-list-item__title">2021 г.</div>\n                    <div class="company-history-list-item-content">\n                        <div class="company-history-list-item__text">Наше дело не так однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений.</div>\n                        <img class="company-history-list-item__img" src="<?= ASSETS_PATH; ?>/images/company-history/3.png"></div>\n                </div>\n            </div>\n            <div class="company-history-list-side">\n                <div class="company-history-list-item">\n                    <div class="company-history-list-item__title">2001 г.</div>\n                    <div class="company-history-list-item-content">\n                        <div class="company-history-list-item__text">Наше дело не так однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений.</div>\n                        <img class="company-history-list-item__img" src="<?= ASSETS_PATH; ?>/images/company-history/4.png"></div>\n                </div>\n                <div class="company-history-list-item">\n                    <div class="company-history-list-item__title">2016 г.</div>\n                    <div class="company-history-list-item-content">\n                        <div class="company-history-list-item__text">Наше дело не так однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений.</div>\n                        <img class="company-history-list-item__img" src="<?= ASSETS_PATH; ?>/images/company-history/5.png"></div>\n                </div>\n            </div>\n        </div>\n    </div>\n    <div class="page">\n        <div class="page-title">Все наши направления</div>\n        <div class="page-text"><p>Наше дело не так однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений. Приятно, граждане, наблюдать, как независимые государства подвергнуты целой серии независимых исследований.</p>\n            <p>Однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений.</p></div>\n        <div class="menu-index-list">\n            <div class="menu-index-list-item-wrapper">\n                <div class="menu-index-list-item" style="background-image:url(<?= ASSETS_PATH; ?>/images/menu/index/1.png);">\n                    <div class="menu-index-list-item__title">Меню для школ</div>\n                    <a class="menu-index-list-item__link" href="">Подробнее</a></div>\n            </div>\n            <div class="menu-index-list-item-wrapper">\n                <div class="menu-index-list-item" style="background-image:url(<?= ASSETS_PATH; ?>/images/menu/index/1.png);">\n                    <div class="menu-index-list-item__title">Столовая Нива</div>\n                    <a class="menu-index-list-item__link" href="">Подробнее</a></div>\n            </div>\n            <div class="menu-index-list-item-wrapper">\n                <div class="menu-index-list-item" style="background-image:url(<?= ASSETS_PATH; ?>/images/menu/index/2.png);">\n                    <div class="menu-index-list-item__title">Кулинария</div>\n                    <a class="menu-index-list-item__link" href="">Подробнее</a></div>\n            </div>\n        </div>\n    </div>\n    <div class="page">\n        <div class="page-title">Производство</div>\n        <div class="page-text"><p>Наше дело не так однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений. Приятно, граждане, наблюдать, как независимые государства подвергнуты целой серии независимых исследований.</p>\n            <p>Однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений</p></div>\n        <div class="manufactory">\n            <div class="manufactory-item">\n                <div class="manufactory-img"><img src="<?= ASSETS_PATH; ?>/images/manufactory/1.png"></div>\n            </div>\n            <div class="manufactory-item">\n                <div class="manufactory-img"><img src="<?= ASSETS_PATH; ?>/images/manufactory/2.png"></div>\n            </div>\n            <div class="manufactory-item">\n                <div class="manufactory-img"><img src="<?= ASSETS_PATH; ?>/images/manufactory/3.png"></div>\n            </div>\n            <div class="manufactory-item">\n                <div class="manufactory-img"><img src="<?= ASSETS_PATH; ?>/images/manufactory/4.png"></div>\n            </div>\n        </div>\n    </div>\n<?php require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/footer.php"); ?>";}', 1, 1676115999),
	('11e9222afca8f482d8f3bd8f96a92737f', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:65:"D:/OpenServer/domains/local.globus.ru/application/about/index.php";s:7:"content";s:10552:"<?php require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/header.php"); ?>\r\n<?php $APPLICATION->SetTitle(\'О комбинате\'); ?>\r\n    <div class="about-banner">\r\n        <div class="about-banner-text">\r\n\r\n            <?php $APPLICATION->IncludeComponent(\'bitrix:main.include\', \'.default\', array()) ?>\r\n\r\n            <p>Работу в «Глобусе» я воспринимаю как некий жизненный этап, вызов. Когда-то я был под одну сторону процесса – разрабатывал концепции предприятий, обустраивал их. Теперь я по другую сторону, причем, ту, что находится в более уязвимом положении.</p>\r\n            <p>Буду работать, пока буду полезен, и пока мне будет интересно. Мне хочется показать, что школьное питание - это не помойка, а хорошая часть детства. Оно может быть и полезным, и вкусным. Я хочу, чтобы ученики и их родители начали уважать труд поваров. У них тяжелая работа, которая оказалась обесценена.</p>\r\n        </div>\r\n        <div class="about-banner-sign">\r\n            <p>Директор «КШП – Глобус»</p>\r\n            <p>Косых Сергей Владимирович</p></div>\r\n        <div class="about-banner-image"><img src="<?= ASSETS_PATH; ?>/images/director.png"></div>\r\n    </div>\r\n    <div class="company-history">\r\n        <div class="company-history-title">История комбината<br>школьного питания «Глобус»</div>\r\n        <div class="company-history-list">\r\n            <div class="company-history-list-side">\r\n                <div class="company-history-list-item">\r\n                    <div class="company-history-list-item__title">1998 г.</div>\r\n                    <div class="company-history-list-item-content">\r\n                        <div class="company-history-list-item__text">Наше дело не так однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений.</div>\r\n                        <img class="company-history-list-item__img" src="<?= ASSETS_PATH; ?>/images/company-history/1.png"></div>\r\n                </div>\r\n                <div class="company-history-list-item">\r\n                    <div class="company-history-list-item__title">2011 г.</div>\r\n                    <div class="company-history-list-item-content">\r\n                        <div class="company-history-list-item__text">Наше дело не так однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений.</div>\r\n                        <img class="company-history-list-item__img" src="<?= ASSETS_PATH; ?>/images/company-history/2.png"></div>\r\n                </div>\r\n                <div class="company-history-list-item">\r\n                    <div class="company-history-list-item__title">2021 г.</div>\r\n                    <div class="company-history-list-item-content">\r\n                        <div class="company-history-list-item__text">Наше дело не так однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений.</div>\r\n                        <img class="company-history-list-item__img" src="<?= ASSETS_PATH; ?>/images/company-history/3.png"></div>\r\n                </div>\r\n            </div>\r\n            <div class="company-history-list-side">\r\n                <div class="company-history-list-item">\r\n                    <div class="company-history-list-item__title">2001 г.</div>\r\n                    <div class="company-history-list-item-content">\r\n                        <div class="company-history-list-item__text">Наше дело не так однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений.</div>\r\n                        <img class="company-history-list-item__img" src="<?= ASSETS_PATH; ?>/images/company-history/4.png"></div>\r\n                </div>\r\n                <div class="company-history-list-item">\r\n                    <div class="company-history-list-item__title">2016 г.</div>\r\n                    <div class="company-history-list-item-content">\r\n                        <div class="company-history-list-item__text">Наше дело не так однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений.</div>\r\n                        <img class="company-history-list-item__img" src="<?= ASSETS_PATH; ?>/images/company-history/5.png"></div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <div class="page">\r\n        <div class="page-title">Все наши направления</div>\r\n        <div class="page-text"><p>Наше дело не так однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений. Приятно, граждане, наблюдать, как независимые государства подвергнуты целой серии независимых исследований.</p>\r\n            <p>Однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений.</p></div>\r\n        <div class="menu-index-list">\r\n            <div class="menu-index-list-item-wrapper">\r\n                <div class="menu-index-list-item" style="background-image:url(<?= ASSETS_PATH; ?>/images/menu/index/1.png);">\r\n                    <div class="menu-index-list-item__title">Меню для школ</div>\r\n                    <a class="menu-index-list-item__link" href="">Подробнее</a></div>\r\n            </div>\r\n            <div class="menu-index-list-item-wrapper">\r\n                <div class="menu-index-list-item" style="background-image:url(<?= ASSETS_PATH; ?>/images/menu/index/1.png);">\r\n                    <div class="menu-index-list-item__title">Столовая Нива</div>\r\n                    <a class="menu-index-list-item__link" href="">Подробнее</a></div>\r\n            </div>\r\n            <div class="menu-index-list-item-wrapper">\r\n                <div class="menu-index-list-item" style="background-image:url(<?= ASSETS_PATH; ?>/images/menu/index/2.png);">\r\n                    <div class="menu-index-list-item__title">Кулинария</div>\r\n                    <a class="menu-index-list-item__link" href="">Подробнее</a></div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <div class="page">\r\n        <div class="page-title">Производство</div>\r\n        <div class="page-text"><p>Наше дело не так однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений. Приятно, граждане, наблюдать, как независимые государства подвергнуты целой серии независимых исследований.</p>\r\n            <p>Однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений</p></div>\r\n        <div class="manufactory">\r\n            <div class="manufactory-item">\r\n                <div class="manufactory-img"><img src="<?= ASSETS_PATH; ?>/images/manufactory/1.png"></div>\r\n            </div>\r\n            <div class="manufactory-item">\r\n                <div class="manufactory-img"><img src="<?= ASSETS_PATH; ?>/images/manufactory/2.png"></div>\r\n            </div>\r\n            <div class="manufactory-item">\r\n                <div class="manufactory-img"><img src="<?= ASSETS_PATH; ?>/images/manufactory/3.png"></div>\r\n            </div>\r\n            <div class="manufactory-item">\r\n                <div class="manufactory-img"><img src="<?= ASSETS_PATH; ?>/images/manufactory/4.png"></div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n<?php require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/footer.php"); ?>";}', 1, 1676028124),
	('1574fc3b2e46cf417dff7d0ceac0fb146', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:65:"D:/OpenServer/domains/local.globus.ru/application/about/index.php";s:7:"content";s:12606:"<?php require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/header.php"); ?>\n<?php $APPLICATION->SetTitle(\'О комбинате\'); ?>\n    <div class="about-banner">\n        <div class="about-banner-text">\n            <?php $APPLICATION->IncludeComponent(\n                "bitrix:main.include",\n                ".default",\n                array(\n                    "COMPONENT_TEMPLATE" => ".default",\n                    "AREA_FILE_SHOW" => "file",\n                    "PATH" => "/local/include/about-letter.php",\n                    "EDIT_TEMPLATE" => ""\n                ),\n                false\n            ); ?>\n        </div>\n        <div class="about-banner-sign">\n            <?php $APPLICATION->IncludeComponent(\n                "bitrix:main.include",\n                ".default",\n                array(\n                    "COMPONENT_TEMPLATE" => ".default",\n                    "AREA_FILE_SHOW" => "file",\n                    "PATH" => "/local/include/about-sign.php",\n                    "EDIT_TEMPLATE" => ""\n                ),\n                false\n            ); ?>\n        </div>\n        <div class="about-banner-image"><img src="<?= ASSETS_PATH; ?>/images/director.png"></div>\n    </div>\n\n<?php $APPLICATION->IncludeComponent(\n    "bitrix:news.list",\n    "history-combinate",\n    array(\n        "COMPONENT_TEMPLATE" => "history-combinate",\n        "IBLOCK_TYPE" => "content",\n        "IBLOCK_ID" => "4",\n        "NEWS_COUNT" => "20",\n        "SORT_BY1" => "ID",\n        "SORT_ORDER1" => "ASC",\n        "SORT_BY2" => "SORT",\n        "SORT_ORDER2" => "ASC",\n        "FILTER_NAME" => "",\n        "FIELD_CODE" => array(\n            0 => "NAME",\n            1 => "DETAIL_TEXT",\n            2 => "DETAIL_PICTURE",\n            3 => "",\n        ),\n        "PROPERTY_CODE" => array(\n            0 => "",\n            1 => "",\n        ),\n        "CHECK_DATES" => "Y",\n        "DETAIL_URL" => "",\n        "AJAX_MODE" => "N",\n        "AJAX_OPTION_JUMP" => "N",\n        "AJAX_OPTION_STYLE" => "Y",\n        "AJAX_OPTION_HISTORY" => "N",\n        "AJAX_OPTION_ADDITIONAL" => "",\n        "CACHE_TYPE" => "A",\n        "CACHE_TIME" => "36000000",\n        "CACHE_FILTER" => "N",\n        "CACHE_GROUPS" => "Y",\n        "PREVIEW_TRUNCATE_LEN" => "",\n        "ACTIVE_DATE_FORMAT" => "d.m.Y",\n        "SET_TITLE" => "N",\n        "SET_BROWSER_TITLE" => "N",\n        "SET_META_KEYWORDS" => "Y",\n        "SET_META_DESCRIPTION" => "Y",\n        "SET_LAST_MODIFIED" => "N",\n        "INCLUDE_IBLOCK_INTO_CHAIN" => "Y",\n        "ADD_SECTIONS_CHAIN" => "Y",\n        "HIDE_LINK_WHEN_NO_DETAIL" => "N",\n        "PARENT_SECTION" => "",\n        "PARENT_SECTION_CODE" => "",\n        "INCLUDE_SUBSECTIONS" => "Y",\n        "STRICT_SECTION_CHECK" => "N",\n        "DISPLAY_DATE" => "Y",\n        "DISPLAY_NAME" => "Y",\n        "DISPLAY_PICTURE" => "Y",\n        "DISPLAY_PREVIEW_TEXT" => "Y",\n        "PAGER_TEMPLATE" => ".default",\n        "DISPLAY_TOP_PAGER" => "N",\n        "DISPLAY_BOTTOM_PAGER" => "Y",\n        "PAGER_TITLE" => "Новости",\n        "PAGER_SHOW_ALWAYS" => "N",\n        "PAGER_DESC_NUMBERING" => "N",\n        "PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",\n        "PAGER_SHOW_ALL" => "N",\n        "PAGER_BASE_LINK_ENABLE" => "N",\n        "SET_STATUS_404" => "N",\n        "SHOW_404" => "N",\n        "MESSAGE_404" => ""\n    ),\n    false\n); ?>\n\n    <div class="page">\n        <div class="page-title">Все наши направления</div>\n        <div class="page-text"><p>Наше дело не так однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений. Приятно, граждане, наблюдать, как независимые государства подвергнуты целой серии независимых исследований.</p>\n            <p>Однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений.</p></div>\n        <div class="menu-index-list">\n            <div class="menu-index-list-item-wrapper">\n                <div class="menu-index-list-item" style="background-image:url(<?= ASSETS_PATH; ?>/images/menu/index/1.png);">\n                    <div class="menu-index-list-item__title">Меню для школ</div>\n                    <a class="menu-index-list-item__link" href="">Подробнее</a></div>\n            </div>\n            <div class="menu-index-list-item-wrapper">\n                <div class="menu-index-list-item" style="background-image:url(<?= ASSETS_PATH; ?>/images/menu/index/1.png);">\n                    <div class="menu-index-list-item__title">Столовая Нива</div>\n                    <a class="menu-index-list-item__link" href="">Подробнее</a></div>\n            </div>\n            <div class="menu-index-list-item-wrapper">\n                <div class="menu-index-list-item" style="background-image:url(<?= ASSETS_PATH; ?>/images/menu/index/2.png);">\n                    <div class="menu-index-list-item__title">Кулинария</div>\n                    <a class="menu-index-list-item__link" href="">Подробнее</a></div>\n            </div>\n        </div>\n    </div>\n    <div class="page">\n        <div class="page-title">Производство</div>\n        <div class="page-text"><p>Наше дело не так однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений. Приятно, граждане, наблюдать, как независимые государства подвергнуты целой серии независимых исследований.</p>\n            <p>Однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений</p></div>\n\n\n        <?php $APPLICATION->IncludeComponent("bitrix:news.list", "manufactory", Array(\n            "COMPONENT_TEMPLATE" => ".default",\n            "IBLOCK_TYPE" => "content",    // Тип информационного блока (используется только для проверки)\n            "IBLOCK_ID" => "5",    // Код информационного блока\n            "NEWS_COUNT" => "20",    // Количество новостей на странице\n            "SORT_BY1" => "ACTIVE_FROM",    // Поле для первой сортировки новостей\n            "SORT_ORDER1" => "DESC",    // Направление для первой сортировки новостей\n            "SORT_BY2" => "SORT",    // Поле для второй сортировки новостей\n            "SORT_ORDER2" => "ASC",    // Направление для второй сортировки новостей\n            "FILTER_NAME" => "",    // Фильтр\n            "FIELD_CODE" => array(    // Поля\n                0 => "NAME",\n                1 => "DETAIL_TEXT",\n                2 => "DETAIL_PICTURE",\n                3 => "",\n            ),\n            "PROPERTY_CODE" => array(    // Свойства\n                0 => "",\n                1 => "",\n            ),\n            "CHECK_DATES" => "Y",    // Показывать только активные на данный момент элементы\n            "DETAIL_URL" => "",    // URL страницы детального просмотра (по умолчанию - из настроек инфоблока)\n            "AJAX_MODE" => "N",    // Включить режим AJAX\n            "AJAX_OPTION_JUMP" => "N",    // Включить прокрутку к началу компонента\n            "AJAX_OPTION_STYLE" => "Y",    // Включить подгрузку стилей\n            "AJAX_OPTION_HISTORY" => "N",    // Включить эмуляцию навигации браузера\n            "AJAX_OPTION_ADDITIONAL" => "",    // Дополнительный идентификатор\n            "CACHE_TYPE" => "A",    // Тип кеширования\n            "CACHE_TIME" => "36000000",    // Время кеширования (сек.)\n            "CACHE_FILTER" => "N",    // Кешировать при установленном фильтре\n            "CACHE_GROUPS" => "Y",    // Учитывать права доступа\n            "PREVIEW_TRUNCATE_LEN" => "",    // Максимальная длина анонса для вывода (только для типа текст)\n            "ACTIVE_DATE_FORMAT" => "d.m.Y",    // Формат показа даты\n            "SET_TITLE" => "N",    // Устанавливать заголовок страницы\n            "SET_BROWSER_TITLE" => "N",    // Устанавливать заголовок окна браузера\n            "SET_META_KEYWORDS" => "Y",    // Устанавливать ключевые слова страницы\n            "SET_META_DESCRIPTION" => "Y",    // Устанавливать описание страницы\n            "SET_LAST_MODIFIED" => "N",    // Устанавливать в заголовках ответа время модификации страницы\n            "INCLUDE_IBLOCK_INTO_CHAIN" => "Y",    // Включать инфоблок в цепочку навигации\n            "ADD_SECTIONS_CHAIN" => "Y",    // Включать раздел в цепочку навигации\n            "HIDE_LINK_WHEN_NO_DETAIL" => "N",    // Скрывать ссылку, если нет детального описания\n            "PARENT_SECTION" => "",    // ID раздела\n            "PARENT_SECTION_CODE" => "",    // Код раздела\n            "INCLUDE_SUBSECTIONS" => "Y",    // Показывать элементы подразделов раздела\n            "STRICT_SECTION_CHECK" => "N",    // Строгая проверка раздела для показа списка\n            "DISPLAY_DATE" => "Y",    // Выводить дату элемента\n            "DISPLAY_NAME" => "Y",    // Выводить название элемента\n            "DISPLAY_PICTURE" => "Y",    // Выводить изображение для анонса\n            "DISPLAY_PREVIEW_TEXT" => "Y",    // Выводить текст анонса\n            "PAGER_TEMPLATE" => ".default",    // Шаблон постраничной навигации\n            "DISPLAY_TOP_PAGER" => "N",    // Выводить над списком\n            "DISPLAY_BOTTOM_PAGER" => "Y",    // Выводить под списком\n            "PAGER_TITLE" => "Новости",    // Название категорий\n            "PAGER_SHOW_ALWAYS" => "N",    // Выводить всегда\n            "PAGER_DESC_NUMBERING" => "N",    // Использовать обратную навигацию\n            "PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",    // Время кеширования страниц для обратной навигации\n            "PAGER_SHOW_ALL" => "N",    // Показывать ссылку "Все"\n            "PAGER_BASE_LINK_ENABLE" => "N",    // Включить обработку ссылок\n            "SET_STATUS_404" => "N",    // Устанавливать статус 404\n            "SHOW_404" => "N",    // Показ специальной страницы\n            "MESSAGE_404" => "",    // Сообщение для показа (по умолчанию из компонента)\n        ),\n            false\n        ); ?>\n\n\n\n    </div>\n<?php require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/footer.php"); ?>";}', 1, 1676121747),
	('168d20bce5a59c55e1e3dc21a7cd569f4', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:144:"D:/OpenServer/domains/local.globus.ru/application/local/templates/globus/components/bitrix/catalog.section.list/menu-school/component_epilog.php";s:7:"content";s:2574:"<? if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) die(); ?>\n\n<div class="menu-catalog-container">\n\n    <?php foreach ($arResult[\'SECTIONS\'] as &$arSection) : ?>\n        <?php $this->AddEditAction($arSection[\'ID\'], $arSection[\'EDIT_LINK\'], $strSectionEdit); ?>\n        <?php $this->AddDeleteAction($arSection[\'ID\'], $arSection[\'DELETE_LINK\'], $strSectionDelete, $arSectionDeleteParams); ?>\n\n\n        <div class="menu-catalog-title"><?= $arSection[\'NAME\']; ?></div>\n\n        <?php $APPLICATION->IncludeComponent("bitrix:news.list", "catalog-menu", Array(\n\n	),\n	false\n); ?>\n\n\n        <div class="menu-catalog">\n\n            <?php if ($arSection[\'ELEMENTS\']): ?>\n                <?php foreach ($arSection[\'ELEMENTS\'] as $arElement): ?>\n                    <div class="menu-catalog-item-wrapper">\n                        <div class="menu-catalog-item">\n                            <div class="menu-catalog-item__date"><span>Дата:</span> <?= $arElement[\'ACTIVE_FROM\']; ?></div>\n                            <a href="<?= $arElement[\'DATA\'][\'FILE\'][\'SRC\'] ?>" target="_blank">\n                                <img class="menu-catalog-item__image" src="<?= $arElement[\'DATA\'][\'PREVIEW_PICTURE\'][\'SRC\'] ?>">\n                            </a>\n                        </div>\n                    </div>\n                <?php endforeach; ?>\n            <?php endif; ?>\n\n        </div>\n\n    <?php endforeach; ?>\n</div>\n\n\n<div class="requirements">\n    <div class="requirements-title">Требования к питанию</div>\n    <div class="requirements-desc">Основные требования к качеству питания в КШП «Глобус»</div>\n    <ol class="requirements-list">\n        <li class="requirements-list-item"><a class="requirements-list-link" href="">Сан.Пин 2.3/2.4.3590-20 «Санитарно-эпидемиологические требования к организации общественного питания»</a></li>\n        <li class="requirements-list-item"><a class="requirements-list-link" href="">МР 2.4.0179-20 «Рекомендации по организации питания для обучающихся образовательных организаций»</a></li>\n        <li class="requirements-list-item"><a class="requirements-list-link" href="">Приложение №6 к СанПиН 2.3/2.4.3590-20 «Перечень пищевой продукции, которая не допускается при организации питания детей»</a></li>\n    </ol>\n</div>\n";}', 1, 1676124601),
	('1bc123322cf6b2f80be4d0ccca9e2b995', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:65:"D:/OpenServer/domains/local.globus.ru/application/about/index.php";s:7:"content";s:10630:"<?php require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/header.php"); ?>\n<?php $APPLICATION->SetTitle(\'О комбинате\'); ?>\n    <div class="about-banner">\n        <div class="about-banner-text">\n            <?php $APPLICATION->IncludeComponent(\n                "bitrix:main.include",\n                ".default",\n                array(\n                    "COMPONENT_TEMPLATE" => ".default",\n                    "AREA_FILE_SHOW" => "file",\n                    "PATH" => "/local/include/about-letter.php",\n                    "EDIT_TEMPLATE" => ""\n                ),\n                false\n            ); ?>\n        </div>\n        <div class="about-banner-sign">\n            <?php $APPLICATION->IncludeComponent(\n                "bitrix:main.include",\n                ".default",\n                array(\n                    "COMPONENT_TEMPLATE" => ".default",\n                    "AREA_FILE_SHOW" => "file",\n                    "PATH" => "/local/include/about-sign.php",\n                    "EDIT_TEMPLATE" => ""\n                ),\n                false\n            ); ?>\n        </div>\n        <div class="about-banner-image"><img src="<?= ASSETS_PATH; ?>/images/director.png"></div>\n    </div>\n\n<?php $APPLICATION->IncludeComponent("bitrix:news.list", "history-combinate", Array(\n    "COMPONENT_TEMPLATE" => ".default",\n    "IBLOCK_TYPE" => "content",    // Тип информационного блока (используется только для проверки)\n    "IBLOCK_ID" => "4",    // Код информационного блока\n    "NEWS_COUNT" => "20",    // Количество новостей на странице\n    "SORT_BY1" => "ACTIVE_FROM",    // Поле для первой сортировки новостей\n    "SORT_ORDER1" => "DESC",    // Направление для первой сортировки новостей\n    "SORT_BY2" => "SORT",    // Поле для второй сортировки новостей\n    "SORT_ORDER2" => "ASC",    // Направление для второй сортировки новостей\n    "FILTER_NAME" => "",    // Фильтр\n    "FIELD_CODE" => array(    // Поля\n        0 => "",\n        1 => "",\n    ),\n    "PROPERTY_CODE" => array(    // Свойства\n        0 => "",\n        1 => "",\n    ),\n    "CHECK_DATES" => "Y",    // Показывать только активные на данный момент элементы\n    "DETAIL_URL" => "",    // URL страницы детального просмотра (по умолчанию - из настроек инфоблока)\n    "AJAX_MODE" => "N",    // Включить режим AJAX\n    "AJAX_OPTION_JUMP" => "N",    // Включить прокрутку к началу компонента\n    "AJAX_OPTION_STYLE" => "Y",    // Включить подгрузку стилей\n    "AJAX_OPTION_HISTORY" => "N",    // Включить эмуляцию навигации браузера\n    "AJAX_OPTION_ADDITIONAL" => "",    // Дополнительный идентификатор\n    "CACHE_TYPE" => "A",    // Тип кеширования\n    "CACHE_TIME" => "36000000",    // Время кеширования (сек.)\n    "CACHE_FILTER" => "N",    // Кешировать при установленном фильтре\n    "CACHE_GROUPS" => "Y",    // Учитывать права доступа\n    "PREVIEW_TRUNCATE_LEN" => "",    // Максимальная длина анонса для вывода (только для типа текст)\n    "ACTIVE_DATE_FORMAT" => "d.m.Y",    // Формат показа даты\n    "SET_TITLE" => "Y",    // Устанавливать заголовок страницы\n    "SET_BROWSER_TITLE" => "Y",    // Устанавливать заголовок окна браузера\n    "SET_META_KEYWORDS" => "Y",    // Устанавливать ключевые слова страницы\n    "SET_META_DESCRIPTION" => "Y",    // Устанавливать описание страницы\n    "SET_LAST_MODIFIED" => "N",    // Устанавливать в заголовках ответа время модификации страницы\n    "INCLUDE_IBLOCK_INTO_CHAIN" => "Y",    // Включать инфоблок в цепочку навигации\n    "ADD_SECTIONS_CHAIN" => "Y",    // Включать раздел в цепочку навигации\n    "HIDE_LINK_WHEN_NO_DETAIL" => "N",    // Скрывать ссылку, если нет детального описания\n    "PARENT_SECTION" => "",    // ID раздела\n    "PARENT_SECTION_CODE" => "",    // Код раздела\n    "INCLUDE_SUBSECTIONS" => "Y",    // Показывать элементы подразделов раздела\n    "STRICT_SECTION_CHECK" => "N",    // Строгая проверка раздела для показа списка\n    "DISPLAY_DATE" => "Y",    // Выводить дату элемента\n    "DISPLAY_NAME" => "Y",    // Выводить название элемента\n    "DISPLAY_PICTURE" => "Y",    // Выводить изображение для анонса\n    "DISPLAY_PREVIEW_TEXT" => "Y",    // Выводить текст анонса\n    "PAGER_TEMPLATE" => ".default",    // Шаблон постраничной навигации\n    "DISPLAY_TOP_PAGER" => "N",    // Выводить над списком\n    "DISPLAY_BOTTOM_PAGER" => "Y",    // Выводить под списком\n    "PAGER_TITLE" => "Новости",    // Название категорий\n    "PAGER_SHOW_ALWAYS" => "N",    // Выводить всегда\n    "PAGER_DESC_NUMBERING" => "N",    // Использовать обратную навигацию\n    "PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",    // Время кеширования страниц для обратной навигации\n    "PAGER_SHOW_ALL" => "N",    // Показывать ссылку "Все"\n    "PAGER_BASE_LINK_ENABLE" => "N",    // Включить обработку ссылок\n    "SET_STATUS_404" => "N",    // Устанавливать статус 404\n    "SHOW_404" => "N",    // Показ специальной страницы\n    "MESSAGE_404" => "",    // Сообщение для показа (по умолчанию из компонента)\n),\n    false\n); ?>\n\n    <div class="page">\n        <div class="page-title">Все наши направления</div>\n        <div class="page-text"><p>Наше дело не так однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений. Приятно, граждане, наблюдать, как независимые государства подвергнуты целой серии независимых исследований.</p>\n            <p>Однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений.</p></div>\n        <div class="menu-index-list">\n            <div class="menu-index-list-item-wrapper">\n                <div class="menu-index-list-item" style="background-image:url(<?= ASSETS_PATH; ?>/images/menu/index/1.png);">\n                    <div class="menu-index-list-item__title">Меню для школ</div>\n                    <a class="menu-index-list-item__link" href="">Подробнее</a></div>\n            </div>\n            <div class="menu-index-list-item-wrapper">\n                <div class="menu-index-list-item" style="background-image:url(<?= ASSETS_PATH; ?>/images/menu/index/1.png);">\n                    <div class="menu-index-list-item__title">Столовая Нива</div>\n                    <a class="menu-index-list-item__link" href="">Подробнее</a></div>\n            </div>\n            <div class="menu-index-list-item-wrapper">\n                <div class="menu-index-list-item" style="background-image:url(<?= ASSETS_PATH; ?>/images/menu/index/2.png);">\n                    <div class="menu-index-list-item__title">Кулинария</div>\n                    <a class="menu-index-list-item__link" href="">Подробнее</a></div>\n            </div>\n        </div>\n    </div>\n    <div class="page">\n        <div class="page-title">Производство</div>\n        <div class="page-text"><p>Наше дело не так однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений. Приятно, граждане, наблюдать, как независимые государства подвергнуты целой серии независимых исследований.</p>\n            <p>Однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений</p></div>\n        <div class="manufactory">\n            <div class="manufactory-item">\n                <div class="manufactory-img"><img src="<?= ASSETS_PATH; ?>/images/manufactory/1.png"></div>\n            </div>\n            <div class="manufactory-item">\n                <div class="manufactory-img"><img src="<?= ASSETS_PATH; ?>/images/manufactory/2.png"></div>\n            </div>\n            <div class="manufactory-item">\n                <div class="manufactory-img"><img src="<?= ASSETS_PATH; ?>/images/manufactory/3.png"></div>\n            </div>\n            <div class="manufactory-item">\n                <div class="manufactory-img"><img src="<?= ASSETS_PATH; ?>/images/manufactory/4.png"></div>\n            </div>\n        </div>\n    </div>\n<?php require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/footer.php"); ?>";}', 1, 1676116817),
	('1e63419e833ac4be2041e6b63746450f2', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:"absPath";s:65:"D:/OpenServer/domains/local.globus.ru/application/about/index.php";s:7:"content";s:9911:"<?php require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/header.php"); ?>\n<?php $APPLICATION->SetTitle(\'О комбинате\'); ?>\n    <div class="about-banner">\n        <div class="about-banner-text">\n            <?php $APPLICATION->IncludeComponent(\n                "bitrix:main.include",\n                ".default",\n                array(\n                    "COMPONENT_TEMPLATE" => ".default",\n                    "AREA_FILE_SHOW" => "file",\n                    "PATH" => "/local/include/about-letter.php",\n                    "EDIT_TEMPLATE" => ""\n                ),\n                false\n            ); ?>\n        </div>\n        <div class="about-banner-sign">\n            <?php $APPLICATION->IncludeComponent(\n                "bitrix:main.include",\n                ".default",\n                array(\n                    "COMPONENT_TEMPLATE" => ".default",\n                    "AREA_FILE_SHOW" => "file",\n                    "PATH" => "/local/include/about-sign.php",\n                    "EDIT_TEMPLATE" => ""\n                ),\n                false\n            ); ?>\n        </div>\n        <div class="about-banner-image"><img src="<?= ASSETS_PATH; ?>/images/director.png"></div>\n    </div>\n\n<?php $APPLICATION->IncludeComponent(\n	"bitrix:news.list", \n	"history-combinate", \n	array(\n		"COMPONENT_TEMPLATE" => "history-combinate",\n		"IBLOCK_TYPE" => "content",\n		"IBLOCK_ID" => "4",\n		"NEWS_COUNT" => "20",\n		"SORT_BY1" => "ACTIVE_FROM",\n		"SORT_ORDER1" => "DESC",\n		"SORT_BY2" => "SORT",\n		"SORT_ORDER2" => "ASC",\n		"FILTER_NAME" => "",\n		"FIELD_CODE" => array(\n			0 => "NAME",\n			1 => "DETAIL_TEXT",\n			2 => "DETAIL_PICTURE",\n			3 => "",\n		),\n		"PROPERTY_CODE" => array(\n			0 => "",\n			1 => "",\n		),\n		"CHECK_DATES" => "Y",\n		"DETAIL_URL" => "",\n		"AJAX_MODE" => "N",\n		"AJAX_OPTION_JUMP" => "N",\n		"AJAX_OPTION_STYLE" => "Y",\n		"AJAX_OPTION_HISTORY" => "N",\n		"AJAX_OPTION_ADDITIONAL" => "",\n		"CACHE_TYPE" => "A",\n		"CACHE_TIME" => "36000000",\n		"CACHE_FILTER" => "N",\n		"CACHE_GROUPS" => "Y",\n		"PREVIEW_TRUNCATE_LEN" => "",\n		"ACTIVE_DATE_FORMAT" => "d.m.Y",\n		"SET_TITLE" => "Y",\n		"SET_BROWSER_TITLE" => "Y",\n		"SET_META_KEYWORDS" => "Y",\n		"SET_META_DESCRIPTION" => "Y",\n		"SET_LAST_MODIFIED" => "N",\n		"INCLUDE_IBLOCK_INTO_CHAIN" => "Y",\n		"ADD_SECTIONS_CHAIN" => "Y",\n		"HIDE_LINK_WHEN_NO_DETAIL" => "N",\n		"PARENT_SECTION" => "",\n		"PARENT_SECTION_CODE" => "",\n		"INCLUDE_SUBSECTIONS" => "Y",\n		"STRICT_SECTION_CHECK" => "N",\n		"DISPLAY_DATE" => "Y",\n		"DISPLAY_NAME" => "Y",\n		"DISPLAY_PICTURE" => "Y",\n		"DISPLAY_PREVIEW_TEXT" => "Y",\n		"PAGER_TEMPLATE" => ".default",\n		"DISPLAY_TOP_PAGER" => "N",\n		"DISPLAY_BOTTOM_PAGER" => "Y",\n		"PAGER_TITLE" => "Новости",\n		"PAGER_SHOW_ALWAYS" => "N",\n		"PAGER_DESC_NUMBERING" => "N",\n		"PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",\n		"PAGER_SHOW_ALL" => "N",\n		"PAGER_BASE_LINK_ENABLE" => "N",\n		"SET_STATUS_404" => "N",\n		"SHOW_404" => "N",\n		"MESSAGE_404" => ""\n	),\n	false\n); ?>\n\n    <div class="page">\n        <div class="page-title">Все наши направления</div>\n        <div class="page-text"><p>Наше дело не так однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений. Приятно, граждане, наблюдать, как независимые государства подвергнуты целой серии независимых исследований.</p>\n            <p>Однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений.</p></div>\n        <div class="menu-index-list">\n            <div class="menu-index-list-item-wrapper">\n                <div class="menu-index-list-item" style="background-image:url(<?= ASSETS_PATH; ?>/images/menu/index/1.png);">\n                    <div class="menu-index-list-item__title">Меню для школ</div>\n                    <a class="menu-index-list-item__link" href="">Подробнее</a></div>\n            </div>\n            <div class="menu-index-list-item-wrapper">\n                <div class="menu-index-list-item" style="background-image:url(<?= ASSETS_PATH; ?>/images/menu/index/1.png);">\n                    <div class="menu-index-list-item__title">Столовая Нива</div>\n                    <a class="menu-index-list-item__link" href="">Подробнее</a></div>\n            </div>\n            <div class="menu-index-list-item-wrapper">\n                <div class="menu-index-list-item" style="background-image:url(<?= ASSETS_PATH; ?>/images/menu/index/2.png);">\n                    <div class="menu-index-list-item__title">Кулинария</div>\n                    <a class="menu-index-list-item__link" href="">Подробнее</a></div>\n            </div>\n        </div>\n    </div>\n    <div class="page">\n        <div class="page-title">Производство</div>\n        <div class="page-text"><p>Наше дело не так однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений. Приятно, граждане, наблюдать, как независимые государства подвергнуты целой серии независимых исследований.</p>\n            <p>Однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений</p></div>\n\n\n        <?php $APPLICATION->IncludeComponent(\n            "bitrix:news.list",\n            "history-combinate",\n            array(\n                "COMPONENT_TEMPLATE" => "history-combinate",\n                "IBLOCK_TYPE" => "content",\n                "IBLOCK_ID" => "4",\n                "NEWS_COUNT" => "20",\n                "SORT_BY1" => "ACTIVE_FROM",\n                "SORT_ORDER1" => "DESC",\n                "SORT_BY2" => "SORT",\n                "SORT_ORDER2" => "ASC",\n                "FILTER_NAME" => "",\n                "FIELD_CODE" => array(\n                    0 => "NAME",\n                    1 => "DETAIL_TEXT",\n                    2 => "DETAIL_PICTURE",\n                    3 => "",\n                ),\n                "PROPERTY_CODE" => array(\n                    0 => "",\n                    1 => "",\n                ),\n                "CHECK_DATES" => "Y",\n                "DETAIL_URL" => "",\n                "AJAX_MODE" => "N",\n                "AJAX_OPTION_JUMP" => "N",\n                "AJAX_OPTION_STYLE" => "Y",\n                "AJAX_OPTION_HISTORY" => "N",\n                "AJAX_OPTION_ADDITIONAL" => "",\n                "CACHE_TYPE" => "A",\n                "CACHE_TIME" => "36000000",\n                "CACHE_FILTER" => "N",\n                "CACHE_GROUPS" => "Y",\n                "PREVIEW_TRUNCATE_LEN" => "",\n                "ACTIVE_DATE_FORMAT" => "d.m.Y",\n                "SET_TITLE" => "Y",\n                "SET_BROWSER_TITLE" => "Y",\n                "SET_META_KEYWORDS" => "Y",\n                "SET_META_DESCRIPTION" => "Y",\n                "SET_LAST_MODIFIED" => "N",\n                "INCLUDE_IBLOCK_INTO_CHAIN" => "Y",\n                "ADD_SECTIONS_CHAIN" => "Y",\n                "HIDE_LINK_WHEN_NO_DETAIL" => "N",\n                "PARENT_SECTION" => "",\n                "PARENT_SECTION_CODE" => "",\n                "INCLUDE_SUBSECTIONS" => "Y",\n                "STRICT_SECTION_CHECK" => "N",\n                "DISPLAY_DATE" => "Y",\n                "DISPLAY_NAME" => "Y",\n                "DISPLAY_PICTURE" => "Y",\n                "DISPLAY_PREVIEW_TEXT" => "Y",\n                "PAGER_TEMPLATE" => ".default",\n                "DISPLAY_TOP_PAGER" => "N",\n                "DISPLAY_BOTTOM_PAGER" => "Y",\n                "PAGER_TITLE" => "Новости",\n                "PAGER_SHOW_ALWAYS" => "N",\n                "PAGER_DESC_NUMBERING" => "N",\n                "PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",\n                "PAGER_SHOW_ALL" => "N",\n                "PAGER_BASE_LINK_ENABLE" => "N",\n                "SET_STATUS_404" => "N",\n                "SHOW_404" => "N",\n                "MESSAGE_404" => ""\n            ),\n            false\n        ); ?>\n\n\n        <div class="manufactory">\n            <div class="manufactory-item">\n                <div class="manufactory-img"><img src="<?= ASSETS_PATH; ?>/images/manufactory/1.png"></div>\n            </div>\n            <div class="manufactory-item">\n                <div class="manufactory-img"><img src="<?= ASSETS_PATH; ?>/images/manufactory/2.png"></div>\n            </div>\n            <div class="manufactory-item">\n                <div class="manufactory-img"><img src="<?= ASSETS_PATH; ?>/images/manufactory/3.png"></div>\n            </div>\n            <div class="manufactory-item">\n                <div class="manufactory-img"><img src="<?= ASSETS_PATH; ?>/images/manufactory/4.png"></div>\n            </div>\n        </div>\n    </div>\n<?php require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/footer.php"); ?>";}', 1, 1676117259),
	('214a19e05644e8a5085fd27e9d37397bb', 'main', 'autosave', 'CAutoSave::_Restore', 'a:11:{s:9:"submitbtn";s:0:"";s:4:"mode";s:6:"public";s:4:"save";s:1:"Y";s:4:"site";s:2:"s1";s:8:"template";s:0:"";s:10:"templateID";s:6:"globus";s:9:"subdialog";s:0:"";s:8:"back_url";s:7:"/about/";s:5:"title";s:0:"";s:4:"path";s:16:"/about/index.php";s:11:"filesrc_pub";s:10214:"<?$APPLICATION->IncludeComponent(\n	"bitrix:main.include",\n	"",\nArray()\n);?><?php $APPLICATION->SetTitle(\'О комбинате\'); ?>\n<div class="about-banner">\n	<div class="about-banner-text">\n		 <?$APPLICATION->IncludeComponent(\n	"bitrix:main.include",\n	".default",\nArray()\n);?>\n		<p>\n			 Работу в «Глобусе» я воспринимаю как некий жизненный этап, вызов. Когда-то я был под одну сторону процесса – разрабатывал концепции предприятий, обустраивал их. Теперь я по другую сторону, причем, ту, что находится в более уязвимом положении.\n		</p>\n		<p>\n			 Буду работать, пока буду полезен, и пока мне будет интересно. Мне хочется показать, что школьное питание - это не помойка, а хорошая часть детства. Оно может быть и полезным, и вкусным. Я хочу, чтобы ученики и их родители начали уважать труд поваров. У них тяжелая работа, которая оказалась обесценена.\n		</p>\n	</div>\n	<div class="about-banner-sign">\n		<p>\n			 Директор «КШП – Глобус»\n		</p>\n		<p>\n			 Косых Сергей Владимирович\n		</p>\n	</div>\n	<div class="about-banner-image">\n <img src="<?= ASSETS_PATH; ?>/images/director.png">\n	</div>\n</div>\n<div class="company-history">\n	<div class="company-history-title">\n		 История комбината<br>\n		 школьного питания «Глобус»\n	</div>\n	<div class="company-history-list">\n		<div class="company-history-list-side">\n			<div class="company-history-list-item">\n				<div class="company-history-list-item__title">\n					 1998 г.\n				</div>\n				<div class="company-history-list-item-content">\n					<div class="company-history-list-item__text">\n						 Наше дело не так однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений.\n					</div>\n <img src="<?= ASSETS_PATH; ?>/images/company-history/1.png" class="company-history-list-item__img">\n				</div>\n			</div>\n			<div class="company-history-list-item">\n				<div class="company-history-list-item__title">\n					 2011 г.\n				</div>\n				<div class="company-history-list-item-content">\n					<div class="company-history-list-item__text">\n						 Наше дело не так однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений.\n					</div>\n <img src="<?= ASSETS_PATH; ?>/images/company-history/2.png" class="company-history-list-item__img">\n				</div>\n			</div>\n			<div class="company-history-list-item">\n				<div class="company-history-list-item__title">\n					 2021 г.\n				</div>\n				<div class="company-history-list-item-content">\n					<div class="company-history-list-item__text">\n						 Наше дело не так однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений.\n					</div>\n <img src="<?= ASSETS_PATH; ?>/images/company-history/3.png" class="company-history-list-item__img">\n				</div>\n			</div>\n		</div>\n		<div class="company-history-list-side">\n			<div class="company-history-list-item">\n				<div class="company-history-list-item__title">\n					 2001 г.\n				</div>\n				<div class="company-history-list-item-content">\n					<div class="company-history-list-item__text">\n						 Наше дело не так однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений.\n					</div>\n <img src="<?= ASSETS_PATH; ?>/images/company-history/4.png" class="company-history-list-item__img">\n				</div>\n			</div>\n			<div class="company-history-list-item">\n				<div class="company-history-list-item__title">\n					 2016 г.\n				</div>\n				<div class="company-history-list-item-content">\n					<div class="company-history-list-item__text">\n						 Наше дело не так однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений.\n					</div>\n <img src="<?= ASSETS_PATH; ?>/images/company-history/5.png" class="company-history-list-item__img">\n				</div>\n			</div>\n		</div>\n	</div>\n</div>\n<div class="page">\n	<div class="page-title">\n		 Все наши направления\n	</div>\n	<div class="page-text">\n		<p>\n			 Наше дело не так однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений. Приятно, граждане, наблюдать, как независимые государства подвергнуты целой серии независимых исследований.\n		</p>\n		<p>\n			 Однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений.\n		</p>\n	</div>\n	<div class="menu-index-list">\n		<div class="menu-index-list-item-wrapper">\n			<div class="menu-index-list-item" title="Код PHP: &lt;?= ASSETS_PATH; ?&gt;">\n <span class="bxhtmled-surrogate-inner"><span class="bxhtmled-right-side-item-icon"></span><span class="bxhtmled-comp-lable" unselectable="on" spellcheck="false">Код PHP</span></span>/images/menu/index/1.png);"&gt;\n				<div class="menu-index-list-item__title">\n					 Меню для школ\n				</div>\n <a class="menu-index-list-item__link" href="">Подробнее</a>\n			</div>\n		</div>\n		<div class="menu-index-list-item-wrapper">\n			<div class="menu-index-list-item" title="Код PHP: &lt;?= ASSETS_PATH; ?&gt;">\n <span class="bxhtmled-surrogate-inner"><span class="bxhtmled-right-side-item-icon"></span><span class="bxhtmled-comp-lable" unselectable="on" spellcheck="false">Код PHP</span></span>/images/menu/index/1.png);"&gt;\n				<div class="menu-index-list-item__title">\n					 Столовая Нива\n				</div>\n <a class="menu-index-list-item__link" href="">Подробнее</a>\n			</div>\n		</div>\n		<div class="menu-index-list-item-wrapper">\n			<div class="menu-index-list-item" title="Код PHP: &lt;?= ASSETS_PATH; ?&gt;">\n <span class="bxhtmled-surrogate-inner"><span class="bxhtmled-right-side-item-icon"></span><span class="bxhtmled-comp-lable" unselectable="on" spellcheck="false">Код PHP</span></span>/images/menu/index/2.png);"&gt;\n				<div class="menu-index-list-item__title">\n					 Кулинария\n				</div>\n <a class="menu-index-list-item__link" href="">Подробнее</a>\n			</div>\n		</div>\n	</div>\n</div>\n<div class="page">\n	<div class="page-title">\n		 Производство\n	</div>\n	<div class="page-text">\n		<p>\n			 Наше дело не так однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений. Приятно, граждане, наблюдать, как независимые государства подвергнуты целой серии независимых исследований.\n		</p>\n		<p>\n			 Однозначно, как может показаться: понимание сути ресурсосберегающих технологий представляет собой интересный эксперимент проверки как самодостаточных, так и внешне зависимых концептуальных решений\n		</p>\n	</div>\n	<div class="manufactory">\n		<div class="manufactory-item">\n			<div class="manufactory-img">\n <img src="<?= ASSETS_PATH; ?>/images/manufactory/1.png">\n			</div>\n		</div>\n		<div class="manufactory-item">\n			<div class="manufactory-img">\n <img src="<?= ASSETS_PATH; ?>/images/manufactory/2.png">\n			</div>\n		</div>\n		<div class="manufactory-item">\n			<div class="manufactory-img">\n <img src="<?= ASSETS_PATH; ?>/images/manufactory/3.png">\n			</div>\n		</div>\n		<div class="manufactory-item">\n			<div class="manufactory-img">\n <img src="<?= ASSETS_PATH; ?>/images/manufactory/4.png">\n			</div>\n		</div>\n	</div>\n</div>\n <br>";}', 1, 1676028083);

-- Дамп структуры для таблица globus.b_urlpreview_metadata
CREATE TABLE IF NOT EXISTS `b_urlpreview_metadata` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `URL` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `DATE_INSERT` datetime NOT NULL,
  `DATE_EXPIRE` datetime DEFAULT NULL,
  `TITLE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE_ID` int(11) DEFAULT NULL,
  `IMAGE` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMBED` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXTRA` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_URLPREVIEW_METADATA_URL` (`URL`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_urlpreview_metadata: ~0 rows (приблизительно)
DELETE FROM `b_urlpreview_metadata`;

-- Дамп структуры для таблица globus.b_urlpreview_route
CREATE TABLE IF NOT EXISTS `b_urlpreview_route` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROUTE` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CLASS` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMETERS` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_URLPREVIEW_ROUTE_ROUTE` (`ROUTE`(255))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_urlpreview_route: ~2 rows (приблизительно)
DELETE FROM `b_urlpreview_route`;
INSERT INTO `b_urlpreview_route` (`ID`, `ROUTE`, `MODULE`, `CLASS`, `PARAMETERS`) VALUES
	(1, '/knowledge/#knowledgeCode#/', 'landing', '\\Bitrix\\Landing\\Landing\\UrlPreview', 'a:3:{s:13:"knowledgeCode";s:14:"$knowledgeCode";s:5:"scope";s:9:"knowledge";s:12:"allowSlashes";s:1:"N";}'),
	(2, '/knowledge/group/#knowledgeCode#/', 'landing', '\\Bitrix\\Landing\\Landing\\UrlPreview', 'a:3:{s:13:"knowledgeCode";s:14:"$knowledgeCode";s:5:"scope";s:5:"group";s:12:"allowSlashes";s:1:"N";}');

-- Дамп структуры для таблица globus.b_user
CREATE TABLE IF NOT EXISTS `b_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `LOGIN` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CHECKWORD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_LOGIN` datetime DEFAULT NULL,
  `DATE_REGISTER` datetime NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PROFESSION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_WWW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_ICQ` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_GENDER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PHOTO` int(11) DEFAULT NULL,
  `PERSONAL_PHONE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_FAX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_MOBILE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PAGER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_STREET` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_MAILBOX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_CITY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_ZIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_COUNTRY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_NOTES` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_COMPANY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_DEPARTMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_POSITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_WWW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PHONE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_FAX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PAGER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_STREET` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_MAILBOX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_CITY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_ZIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_COUNTRY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PROFILE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_LOGO` int(11) DEFAULT NULL,
  `WORK_NOTES` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADMIN_NOTES` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `STORED_HASH` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDAY` date DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CHECKWORD_TIME` datetime DEFAULT NULL,
  `SECOND_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONFIRM_CODE` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIN_ATTEMPTS` int(11) DEFAULT NULL,
  `LAST_ACTIVITY_DATE` datetime DEFAULT NULL,
  `AUTO_TIME_ZONE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIME_ZONE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIME_ZONE_OFFSET` int(11) DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BX_USER_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BLOCKED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `PASSWORD_EXPIRED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_login` (`LOGIN`,`EXTERNAL_AUTH_ID`),
  KEY `ix_b_user_email` (`EMAIL`),
  KEY `ix_b_user_activity_date` (`LAST_ACTIVITY_DATE`),
  KEY `IX_B_USER_XML_ID` (`XML_ID`),
  KEY `ix_user_last_login` (`LAST_LOGIN`),
  KEY `ix_user_date_register` (`DATE_REGISTER`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_user: ~1 rows (приблизительно)
DELETE FROM `b_user`;
INSERT INTO `b_user` (`ID`, `TIMESTAMP_X`, `LOGIN`, `PASSWORD`, `CHECKWORD`, `ACTIVE`, `NAME`, `LAST_NAME`, `EMAIL`, `LAST_LOGIN`, `DATE_REGISTER`, `LID`, `PERSONAL_PROFESSION`, `PERSONAL_WWW`, `PERSONAL_ICQ`, `PERSONAL_GENDER`, `PERSONAL_BIRTHDATE`, `PERSONAL_PHOTO`, `PERSONAL_PHONE`, `PERSONAL_FAX`, `PERSONAL_MOBILE`, `PERSONAL_PAGER`, `PERSONAL_STREET`, `PERSONAL_MAILBOX`, `PERSONAL_CITY`, `PERSONAL_STATE`, `PERSONAL_ZIP`, `PERSONAL_COUNTRY`, `PERSONAL_NOTES`, `WORK_COMPANY`, `WORK_DEPARTMENT`, `WORK_POSITION`, `WORK_WWW`, `WORK_PHONE`, `WORK_FAX`, `WORK_PAGER`, `WORK_STREET`, `WORK_MAILBOX`, `WORK_CITY`, `WORK_STATE`, `WORK_ZIP`, `WORK_COUNTRY`, `WORK_PROFILE`, `WORK_LOGO`, `WORK_NOTES`, `ADMIN_NOTES`, `STORED_HASH`, `XML_ID`, `PERSONAL_BIRTHDAY`, `EXTERNAL_AUTH_ID`, `CHECKWORD_TIME`, `SECOND_NAME`, `CONFIRM_CODE`, `LOGIN_ATTEMPTS`, `LAST_ACTIVITY_DATE`, `AUTO_TIME_ZONE`, `TIME_ZONE`, `TIME_ZONE_OFFSET`, `TITLE`, `BX_USER_ID`, `LANGUAGE_ID`, `BLOCKED`, `PASSWORD_EXPIRED`) VALUES
	(1, NULL, 'admin', '$6$Ha5498dCIZqKO0ZV$6bJbbi9w3sN6Mg/zgqFCntsadVa3B1D6WeXSM6PQERlHohOHKq8k7WUB/8z2A1bWBFsjO8gKxc2pVxwemwHQo1', '$6$ZfIcSMgVOXWqNXZu$uHKqi7yI/1kdFb4hl9S/tpAgsCmEeYHmbzKPs9YPp80m15d3FytRy8Ic73IhbhDClk/nLfFt6moP5PLHiiHRe0', 'Y', 'admin', 'admin', 'popugau@gmail.com', '2023-02-11 18:29:23', '2023-02-10 14:18:54', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-10 14:18:54', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', 'N');

-- Дамп структуры для таблица globus.b_user_access
CREATE TABLE IF NOT EXISTS `b_user_access` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `PROVIDER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCESS_CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_ua_user_provider` (`USER_ID`,`PROVIDER_ID`),
  KEY `ix_ua_user_access` (`USER_ID`,`ACCESS_CODE`),
  KEY `ix_ua_access` (`ACCESS_CODE`),
  KEY `ix_ua_provider` (`PROVIDER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_user_access: ~6 rows (приблизительно)
DELETE FROM `b_user_access`;
INSERT INTO `b_user_access` (`ID`, `USER_ID`, `PROVIDER_ID`, `ACCESS_CODE`) VALUES
	(1, 0, 'group', 'G2'),
	(2, 1, 'group', 'G1'),
	(3, 1, 'group', 'G3'),
	(4, 1, 'group', 'G4'),
	(5, 1, 'group', 'G2'),
	(9, 1, 'user', 'U1');

-- Дамп структуры для таблица globus.b_user_access_check
CREATE TABLE IF NOT EXISTS `b_user_access_check` (
  `USER_ID` int(11) DEFAULT NULL,
  `PROVIDER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `ux_uac_user_provider` (`USER_ID`,`PROVIDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_user_access_check: ~0 rows (приблизительно)
DELETE FROM `b_user_access_check`;

-- Дамп структуры для таблица globus.b_user_auth_action
CREATE TABLE IF NOT EXISTS `b_user_auth_action` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `PRIORITY` int(11) NOT NULL DEFAULT 100,
  `ACTION` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTION_DATE` datetime NOT NULL,
  `APPLICATION_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_auth_action_user` (`USER_ID`,`PRIORITY`),
  KEY `ix_auth_action_date` (`ACTION_DATE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_user_auth_action: ~0 rows (приблизительно)
DELETE FROM `b_user_auth_action`;

-- Дамп структуры для таблица globus.b_user_auth_code
CREATE TABLE IF NOT EXISTS `b_user_auth_code` (
  `USER_ID` int(11) NOT NULL,
  `CODE_TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'email',
  `OTP_SECRET` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ATTEMPTS` int(11) DEFAULT 0,
  `DATE_SENT` datetime DEFAULT NULL,
  `DATE_RESENT` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`CODE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_user_auth_code: ~0 rows (приблизительно)
DELETE FROM `b_user_auth_code`;

-- Дамп структуры для таблица globus.b_user_counter
CREATE TABLE IF NOT EXISTS `b_user_counter` (
  `USER_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '**',
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CNT` int(11) NOT NULL DEFAULT 0,
  `LAST_DATE` datetime DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '3000-01-01 00:00:00',
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SENT` char(1) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`USER_ID`,`SITE_ID`,`CODE`),
  KEY `ix_buc_tag` (`TAG`),
  KEY `ix_buc_code` (`CODE`),
  KEY `ix_buc_ts` (`TIMESTAMP_X`),
  KEY `ix_buc_sent_userid` (`SENT`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_user_counter: ~0 rows (приблизительно)
DELETE FROM `b_user_counter`;

-- Дамп структуры для таблица globus.b_user_digest
CREATE TABLE IF NOT EXISTS `b_user_digest` (
  `USER_ID` int(11) NOT NULL,
  `DIGEST_HA1` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_user_digest: ~0 rows (приблизительно)
DELETE FROM `b_user_digest`;

-- Дамп структуры для таблица globus.b_user_field
CREATE TABLE IF NOT EXISTS `b_user_field` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `MULTIPLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `MANDATORY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_FILTER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `IS_SEARCHABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SETTINGS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_type_entity` (`ENTITY_ID`,`FIELD_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_user_field: ~7 rows (приблизительно)
DELETE FROM `b_user_field`;
INSERT INTO `b_user_field` (`ID`, `ENTITY_ID`, `FIELD_NAME`, `USER_TYPE_ID`, `XML_ID`, `SORT`, `MULTIPLE`, `MANDATORY`, `SHOW_FILTER`, `SHOW_IN_LIST`, `EDIT_IN_LIST`, `IS_SEARCHABLE`, `SETTINGS`) VALUES
	(1, 'BLOG_POST', 'UF_BLOG_POST_DOC', 'file', 'UF_BLOG_POST_DOC', 100, 'Y', 'N', 'N', 'N', 'Y', 'Y', 'a:0:{}'),
	(2, 'BLOG_COMMENT', 'UF_BLOG_COMMENT_DOC', 'file', 'UF_BLOG_COMMENT_DOC', 100, 'Y', 'N', 'N', 'N', 'Y', 'Y', 'a:0:{}'),
	(3, 'BLOG_POST', 'UF_BLOG_POST_URL_PRV', 'url_preview', 'UF_BLOG_POST_URL_PRV', 100, 'N', 'N', 'N', 'N', 'Y', 'Y', 'a:0:{}'),
	(4, 'BLOG_COMMENT', 'UF_BLOG_COMM_URL_PRV', 'url_preview', 'UF_BLOG_COMM_URL_PRV', 100, 'N', 'N', 'N', 'N', 'Y', 'Y', 'a:0:{}'),
	(5, 'BLOG_POST', 'UF_GRATITUDE', 'integer', 'UF_GRATITUDE', 100, 'N', 'N', 'N', 'N', 'Y', 'N', 'a:0:{}'),
	(6, 'FORUM_MESSAGE', 'UF_FORUM_MES_URL_PRV', 'url_preview', 'UF_FORUM_MES_URL_PRV', 100, 'N', 'N', 'N', 'N', 'Y', 'N', 'a:0:{}'),
	(7, 'FORUM_MESSAGE', 'UF_TASK_COMMENT_TYPE', 'integer', 'UF_TASK_COMMENT_TYPE', 100, 'N', 'N', 'N', 'N', 'Y', 'N', 'a:0:{}');

-- Дамп структуры для таблица globus.b_user_field_confirm
CREATE TABLE IF NOT EXISTS `b_user_field_confirm` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `DATE_CHANGE` timestamp NULL DEFAULT NULL,
  `FIELD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FIELD_VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIRM_CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ATTEMPTS` int(11) DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `ix_b_user_field_confirm1` (`USER_ID`,`CONFIRM_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_user_field_confirm: ~0 rows (приблизительно)
DELETE FROM `b_user_field_confirm`;

-- Дамп структуры для таблица globus.b_user_field_enum
CREATE TABLE IF NOT EXISTS `b_user_field_enum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_FIELD_ID` int(11) DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT 500,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_field_enum` (`USER_FIELD_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_user_field_enum: ~0 rows (приблизительно)
DELETE FROM `b_user_field_enum`;

-- Дамп структуры для таблица globus.b_user_field_lang
CREATE TABLE IF NOT EXISTS `b_user_field_lang` (
  `USER_FIELD_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `EDIT_FORM_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_COLUMN_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_FILTER_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ERROR_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HELP_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`USER_FIELD_ID`,`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_user_field_lang: ~0 rows (приблизительно)
DELETE FROM `b_user_field_lang`;

-- Дамп структуры для таблица globus.b_user_field_permission
CREATE TABLE IF NOT EXISTS `b_user_field_permission` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE_ID` tinyint(3) unsigned NOT NULL,
  `USER_FIELD_ID` int(10) unsigned NOT NULL,
  `ACCESS_CODE` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `PERMISSION_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ROLE_ID` (`ENTITY_TYPE_ID`),
  KEY `GROUP_ID` (`USER_FIELD_ID`),
  KEY `PERMISSION_ID` (`PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_user_field_permission: ~0 rows (приблизительно)
DELETE FROM `b_user_field_permission`;

-- Дамп структуры для таблица globus.b_user_group
CREATE TABLE IF NOT EXISTS `b_user_group` (
  `USER_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `DATE_ACTIVE_FROM` datetime DEFAULT NULL,
  `DATE_ACTIVE_TO` datetime DEFAULT NULL,
  UNIQUE KEY `ix_user_group` (`USER_ID`,`GROUP_ID`),
  KEY `ix_user_group_group` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_user_group: ~3 rows (приблизительно)
DELETE FROM `b_user_group`;
INSERT INTO `b_user_group` (`USER_ID`, `GROUP_ID`, `DATE_ACTIVE_FROM`, `DATE_ACTIVE_TO`) VALUES
	(1, 1, NULL, NULL),
	(1, 3, NULL, NULL),
	(1, 4, NULL, NULL);

-- Дамп структуры для таблица globus.b_user_hit_auth
CREATE TABLE IF NOT EXISTS `b_user_hit_auth` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `HASH` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  `VALID_UNTIL` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_USER_HIT_AUTH_1` (`HASH`),
  KEY `IX_USER_HIT_AUTH_2` (`USER_ID`),
  KEY `IX_USER_HIT_AUTH_3` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_user_hit_auth: ~0 rows (приблизительно)
DELETE FROM `b_user_hit_auth`;

-- Дамп структуры для таблица globus.b_user_index
CREATE TABLE IF NOT EXISTS `b_user_index` (
  `USER_ID` int(11) NOT NULL,
  `SEARCH_USER_CONTENT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCH_DEPARTMENT_CONTENT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCH_ADMIN_CONTENT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECOND_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_POSITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UF_DEPARTMENT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  FULLTEXT KEY `IXF_B_USER_INDEX_1` (`SEARCH_USER_CONTENT`),
  FULLTEXT KEY `IXF_B_USER_INDEX_2` (`SEARCH_DEPARTMENT_CONTENT`),
  FULLTEXT KEY `IXF_B_USER_INDEX_3` (`SEARCH_ADMIN_CONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_user_index: ~0 rows (приблизительно)
DELETE FROM `b_user_index`;
INSERT INTO `b_user_index` (`USER_ID`, `SEARCH_USER_CONTENT`, `SEARCH_DEPARTMENT_CONTENT`, `SEARCH_ADMIN_CONTENT`, `NAME`, `LAST_NAME`, `SECOND_NAME`, `WORK_POSITION`, `UF_DEPARTMENT_NAME`) VALUES
	(1, '001 nqzva nqzva ', '', '001 nqzva cbchtnh tznvy pbz cbchtnh@tznvy.pbz', 'admin', 'admin', '', '', '');

-- Дамп структуры для таблица globus.b_user_option
CREATE TABLE IF NOT EXISTS `b_user_option` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `CATEGORY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_category_name` (`USER_ID`,`CATEGORY`,`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_user_option: ~44 rows (приблизительно)
DELETE FROM `b_user_option`;
INSERT INTO `b_user_option` (`ID`, `USER_ID`, `CATEGORY`, `NAME`, `VALUE`, `COMMON`) VALUES
	(1, 0, 'intranet', '~gadgets_admin_index', 'a:1:{i:0;a:1:{s:7:"GADGETS";a:8:{s:20:"ADMIN_INFO@333333333";a:3:{s:6:"COLUMN";i:0;s:3:"ROW";i:0;s:4:"HIDE";s:1:"N";}s:19:"HTML_AREA@444444444";a:5:{s:6:"COLUMN";i:0;s:3:"ROW";i:1;s:4:"HIDE";s:1:"N";s:8:"USERDATA";a:1:{s:7:"content";s:797:"<table class="bx-gadgets-info-site-table" cellspacing="0"><tr>	<td class="bx-gadget-gray">Создатель сайта:</td>	<td>Группа компаний &laquo;1С-Битрикс&raquo;.</td>	<td class="bx-gadgets-info-site-logo" rowspan="5"><img src="/bitrix/components/bitrix/desktop/templates/admin/images/site_logo.png"></td></tr><tr>	<td class="bx-gadget-gray">Адрес сайта:</td>	<td><a href="http://www.1c-bitrix.ru">www.1c-bitrix.ru</a></td></tr><tr>	<td class="bx-gadget-gray">Сайт сдан:</td>	<td>12 декабря 2010 г.</td></tr><tr>	<td class="bx-gadget-gray">Ответственное лицо:</td>	<td>Иван Иванов</td></tr><tr>	<td class="bx-gadget-gray">E-mail:</td>	<td><a href="mailto:info@1c-bitrix.ru">info@1c-bitrix.ru</a></td></tr></table>";}s:8:"SETTINGS";a:1:{s:9:"TITLE_STD";s:34:"Информация о сайте";}}s:25:"ADMIN_CHECKLIST@777888999";a:3:{s:6:"COLUMN";i:0;s:3:"ROW";i:2;s:4:"HIDE";s:1:"N";}s:19:"RSSREADER@777777777";a:4:{s:6:"COLUMN";i:1;s:3:"ROW";i:3;s:4:"HIDE";s:1:"N";s:8:"SETTINGS";a:3:{s:9:"TITLE_STD";s:33:"Новости 1С-Битрикс";s:3:"CNT";i:10;s:7:"RSS_URL";s:45:"https://www.1c-bitrix.ru/about/life/news/rss/";}}s:24:"ADMIN_SECURITY@555555555";a:3:{s:6:"COLUMN";i:1;s:3:"ROW";i:0;s:4:"HIDE";s:1:"N";}s:25:"ADMIN_SITESPEED@666666777";a:3:{s:6:"COLUMN";i:1;s:3:"ROW";i:1;s:4:"HIDE";s:1:"N";}s:23:"ADMIN_PERFMON@666666666";a:3:{s:6:"COLUMN";i:1;s:3:"ROW";i:2;s:4:"HIDE";s:1:"N";}s:23:"ADMIN_MARKETPALCE@22549";a:3:{s:6:"COLUMN";i:1;s:3:"ROW";i:3;s:4:"HIDE";s:1:"N";}}}}', 'Y'),
	(2, 1, 'admin_panel', 'settings', 'a:2:{s:4:"edit";s:3:"off";s:9:"collapsed";s:3:"off";}', 'N'),
	(3, 1, 'hot_keys', 'user_defined', 'b:1;', 'N'),
	(4, 1, 'socialservices', 'networkPopup', 'a:1:{s:9:"showcount";s:1:"2";}', 'N'),
	(5, 1, 'fileman', 'code_editor', 'a:1:{s:5:"theme";s:5:"light";}', 'N'),
	(8, 1, 'favorite', 'favorite_menu', 'a:1:{s:5:"stick";s:1:"N";}', 'N'),
	(10, 1, 'admin_menu', 'pos', 'a:1:{s:8:"sections";s:184:"menu_system,menu_module_settings,menu_iblock,iblock_admin,menu_iblock_/content,menu_iblock_%2Fcontent%2F1,menu_iblock_%2Fcontent%2F2,menu_iblock_/documents,menu_iblock_%2Fdocuments%2F6";}', 'N'),
	(15, 1, 'bx.windowmanager.9.5', 'size_/bitrix/admin/component_props.php', 'a:2:{s:5:"width";s:4:"1302";s:6:"height";s:3:"475";}', 'N'),
	(35, 1, 'main.interface.grid', 'tbl_iblock_admin_9a0364b9e99bb480dd25e1f0284c8555', 'a:3:{s:5:"views";a:1:{s:7:"default";a:3:{s:7:"columns";s:0:"";s:13:"columns_sizes";a:2:{s:6:"expand";i:1;s:7:"columns";a:0:{}}s:15:"sticked_columns";a:0:{}}}s:7:"filters";a:0:{}s:12:"current_view";s:7:"default";}', 'N'),
	(44, 1, 'main.ui.filter', 'tbl_iblock_element_b095a8c351bd6c9eb4a0aa9a40ca8120', 'a:6:{s:14:"use_pin_preset";b:1;s:15:"deleted_presets";a:0:{}s:15:"default_presets";a:0:{}s:7:"default";s:14:"default_filter";s:6:"filter";s:14:"default_filter";s:7:"filters";a:1:{s:14:"default_filter";a:0:{}}}', 'N'),
	(49, 1, 'main.interface.grid', 'tbl_iblock_element_b095a8c351bd6c9eb4a0aa9a40ca8120', 'a:3:{s:5:"views";a:1:{s:7:"default";a:3:{s:7:"columns";s:0:"";s:13:"columns_sizes";a:2:{s:6:"expand";i:1;s:7:"columns";a:0:{}}s:15:"sticked_columns";a:0:{}}}s:7:"filters";a:0:{}s:12:"current_view";s:7:"default";}', 'N'),
	(50, 1, 'html_editor', 'type_selector_DETAIL_TEXT1', 'a:1:{s:4:"type";s:6:"editor";}', 'N'),
	(52, 1, 'html_editor', 'user_settings_', 'a:3:{s:14:"split_vertical";s:1:"1";s:4:"view";s:5:"split";s:13:"taskbar_shown";s:1:"1";}', 'N'),
	(60, 1, 'main.ui.filter', 'tbl_iblock_section_b095a8c351bd6c9eb4a0aa9a40ca8120', 'a:6:{s:14:"use_pin_preset";b:1;s:15:"deleted_presets";a:0:{}s:15:"default_presets";a:0:{}s:7:"default";s:14:"default_filter";s:6:"filter";s:14:"default_filter";s:7:"filters";a:1:{s:10:"tmp_filter";a:2:{s:6:"fields";a:1:{s:10:"SECTION_ID";s:1:"0";}s:11:"filter_rows";s:10:"SECTION_ID";}}}', 'N'),
	(66, 1, 'main.interface.grid', 'tbl_iblock_section_b095a8c351bd6c9eb4a0aa9a40ca8120', 'a:3:{s:5:"views";a:1:{s:7:"default";a:3:{s:7:"columns";s:0:"";s:13:"columns_sizes";a:2:{s:6:"expand";i:1;s:7:"columns";a:0:{}}s:15:"sticked_columns";a:0:{}}}s:7:"filters";a:0:{}s:12:"current_view";s:7:"default";}', 'N'),
	(103, 1, 'main.ui.filter', 'tbl_iblock_element_b7d3215a9c5d7a3446fc85e1a5877fc2', 'a:6:{s:14:"use_pin_preset";b:1;s:15:"deleted_presets";a:0:{}s:15:"default_presets";a:0:{}s:7:"default";s:14:"default_filter";s:6:"filter";s:14:"default_filter";s:7:"filters";a:1:{s:14:"default_filter";a:0:{}}}', 'N'),
	(108, 1, 'main.interface.grid', 'tbl_iblock_element_b7d3215a9c5d7a3446fc85e1a5877fc2', 'a:3:{s:5:"views";a:1:{s:7:"default";a:3:{s:7:"columns";s:0:"";s:13:"columns_sizes";a:2:{s:6:"expand";i:1;s:7:"columns";a:0:{}}s:15:"sticked_columns";a:0:{}}}s:7:"filters";a:0:{}s:12:"current_view";s:7:"default";}', 'N'),
	(116, 1, 'form', 'form_element_2', 'a:1:{s:4:"tabs";s:2007:"edit1--#--Элемент--,--ID--#--ID--,--DATE_CREATE--#--Создан--,--TIMESTAMP_X--#--Изменен--,--ACTIVE--#--Активность--,--NAME--#--*Название--,--CODE--#--Символьный код--,--SORT--#--Сортировка--,--IBLOCK_ELEMENT_PROP_VALUE--#----Значения свойств--,--PROPERTY_4--#--Зарплата--,--PROPERTY_1--#--Обязанности--,--PROPERTY_2--#--Требования--,--PROPERTY_3--#--Условия--;--edit5--#--Анонс--,--PREVIEW_PICTURE--#--Картинка для анонса--,--PREVIEW_TEXT--#--Описание для анонса--;--edit6--#--Подробно--,--DETAIL_PICTURE--#--Детальная картинка--,--DETAIL_TEXT--#--Детальное описание--;--edit14--#--SEO--,--IPROPERTY_TEMPLATES_ELEMENT_META_TITLE--#--Шаблон META TITLE--,--IPROPERTY_TEMPLATES_ELEMENT_META_KEYWORDS--#--Шаблон META KEYWORDS--,--IPROPERTY_TEMPLATES_ELEMENT_META_DESCRIPTION--#--Шаблон META DESCRIPTION--,--IPROPERTY_TEMPLATES_ELEMENT_PAGE_TITLE--#--Заголовок элемента--,--IPROPERTY_TEMPLATES_ELEMENTS_PREVIEW_PICTURE--#----Настройки для картинок анонса элементов--,--IPROPERTY_TEMPLATES_ELEMENT_PREVIEW_PICTURE_FILE_ALT--#--Шаблон ALT--,--IPROPERTY_TEMPLATES_ELEMENT_PREVIEW_PICTURE_FILE_TITLE--#--Шаблон TITLE--,--IPROPERTY_TEMPLATES_ELEMENT_PREVIEW_PICTURE_FILE_NAME--#--Шаблон имени файла--,--IPROPERTY_TEMPLATES_ELEMENTS_DETAIL_PICTURE--#----Настройки для детальных картинок элементов--,--IPROPERTY_TEMPLATES_ELEMENT_DETAIL_PICTURE_FILE_ALT--#--Шаблон ALT--,--IPROPERTY_TEMPLATES_ELEMENT_DETAIL_PICTURE_FILE_TITLE--#--Шаблон TITLE--,--IPROPERTY_TEMPLATES_ELEMENT_DETAIL_PICTURE_FILE_NAME--#--Шаблон имени файла--,--SEO_ADDITIONAL--#----Дополнительно--,--TAGS--#--Теги--;--edit2--#--Разделы--,--SECTIONS--#--Разделы--;--";}', 'N'),
	(117, 0, 'form', 'form_element_2', 'a:1:{s:4:"tabs";s:2007:"edit1--#--Элемент--,--ID--#--ID--,--DATE_CREATE--#--Создан--,--TIMESTAMP_X--#--Изменен--,--ACTIVE--#--Активность--,--NAME--#--*Название--,--CODE--#--Символьный код--,--SORT--#--Сортировка--,--IBLOCK_ELEMENT_PROP_VALUE--#----Значения свойств--,--PROPERTY_4--#--Зарплата--,--PROPERTY_1--#--Обязанности--,--PROPERTY_2--#--Требования--,--PROPERTY_3--#--Условия--;--edit5--#--Анонс--,--PREVIEW_PICTURE--#--Картинка для анонса--,--PREVIEW_TEXT--#--Описание для анонса--;--edit6--#--Подробно--,--DETAIL_PICTURE--#--Детальная картинка--,--DETAIL_TEXT--#--Детальное описание--;--edit14--#--SEO--,--IPROPERTY_TEMPLATES_ELEMENT_META_TITLE--#--Шаблон META TITLE--,--IPROPERTY_TEMPLATES_ELEMENT_META_KEYWORDS--#--Шаблон META KEYWORDS--,--IPROPERTY_TEMPLATES_ELEMENT_META_DESCRIPTION--#--Шаблон META DESCRIPTION--,--IPROPERTY_TEMPLATES_ELEMENT_PAGE_TITLE--#--Заголовок элемента--,--IPROPERTY_TEMPLATES_ELEMENTS_PREVIEW_PICTURE--#----Настройки для картинок анонса элементов--,--IPROPERTY_TEMPLATES_ELEMENT_PREVIEW_PICTURE_FILE_ALT--#--Шаблон ALT--,--IPROPERTY_TEMPLATES_ELEMENT_PREVIEW_PICTURE_FILE_TITLE--#--Шаблон TITLE--,--IPROPERTY_TEMPLATES_ELEMENT_PREVIEW_PICTURE_FILE_NAME--#--Шаблон имени файла--,--IPROPERTY_TEMPLATES_ELEMENTS_DETAIL_PICTURE--#----Настройки для детальных картинок элементов--,--IPROPERTY_TEMPLATES_ELEMENT_DETAIL_PICTURE_FILE_ALT--#--Шаблон ALT--,--IPROPERTY_TEMPLATES_ELEMENT_DETAIL_PICTURE_FILE_TITLE--#--Шаблон TITLE--,--IPROPERTY_TEMPLATES_ELEMENT_DETAIL_PICTURE_FILE_NAME--#--Шаблон имени файла--,--SEO_ADDITIONAL--#----Дополнительно--,--TAGS--#--Теги--;--edit2--#--Разделы--,--SECTIONS--#--Разделы--;--";}', 'Y'),
	(118, 1, 'html_editor', 'type_selector_DETAIL_TEXT2', 'a:1:{s:4:"type";s:4:"html";}', 'N'),
	(123, 1, 'main.ui.filter', 'tbl_iblock_section_5861fa2d67db16bf1dcab2250c88814c', 'a:6:{s:14:"use_pin_preset";b:1;s:15:"deleted_presets";a:0:{}s:15:"default_presets";a:0:{}s:7:"default";s:14:"default_filter";s:6:"filter";s:14:"default_filter";s:7:"filters";a:1:{s:10:"tmp_filter";a:2:{s:6:"fields";a:1:{s:10:"SECTION_ID";s:1:"0";}s:11:"filter_rows";s:10:"SECTION_ID";}}}', 'N'),
	(129, 1, 'main.interface.grid', 'tbl_iblock_section_5861fa2d67db16bf1dcab2250c88814c', 'a:3:{s:5:"views";a:1:{s:7:"default";a:3:{s:7:"columns";s:0:"";s:13:"columns_sizes";a:2:{s:6:"expand";i:1;s:7:"columns";a:0:{}}s:15:"sticked_columns";a:0:{}}}s:7:"filters";a:0:{}s:12:"current_view";s:7:"default";}', 'N'),
	(130, 1, 'main.ui.filter', 'tbl_iblock_element_5861fa2d67db16bf1dcab2250c88814c', 'a:6:{s:14:"use_pin_preset";b:1;s:15:"deleted_presets";a:0:{}s:15:"default_presets";a:0:{}s:7:"default";s:14:"default_filter";s:6:"filter";s:14:"default_filter";s:7:"filters";a:1:{s:14:"default_filter";a:0:{}}}', 'N'),
	(135, 1, 'main.interface.grid', 'tbl_iblock_element_5861fa2d67db16bf1dcab2250c88814c', 'a:3:{s:5:"views";a:1:{s:7:"default";a:3:{s:7:"columns";s:0:"";s:13:"columns_sizes";a:2:{s:6:"expand";i:1;s:7:"columns";a:0:{}}s:15:"sticked_columns";a:0:{}}}s:7:"filters";a:0:{}s:12:"current_view";s:7:"default";}', 'N'),
	(136, 1, 'form', 'form_element_3', 'a:1:{s:4:"tabs";s:1758:"edit1--#--Элемент--,--ID--#--ID--,--DATE_CREATE--#--Создан--,--TIMESTAMP_X--#--Изменен--,--ACTIVE--#--Активность--,--NAME--#--*Название--,--CODE--#--*Символьный код--,--SORT--#--Сортировка--,--IBLOCK_ELEMENT_PROP_VALUE--#----Значения свойств--,--PROPERTY_5--#--Ссылка на видео--;--edit5--#--Анонс--,--PREVIEW_PICTURE--#--Картинка для анонса--,--PREVIEW_TEXT--#--Описание для анонса--;--edit14--#--SEO--,--IPROPERTY_TEMPLATES_ELEMENT_META_TITLE--#--Шаблон META TITLE--,--IPROPERTY_TEMPLATES_ELEMENT_META_KEYWORDS--#--Шаблон META KEYWORDS--,--IPROPERTY_TEMPLATES_ELEMENT_META_DESCRIPTION--#--Шаблон META DESCRIPTION--,--IPROPERTY_TEMPLATES_ELEMENT_PAGE_TITLE--#--Заголовок элемента--,--IPROPERTY_TEMPLATES_ELEMENTS_PREVIEW_PICTURE--#----Настройки для картинок анонса элементов--,--IPROPERTY_TEMPLATES_ELEMENT_PREVIEW_PICTURE_FILE_ALT--#--Шаблон ALT--,--IPROPERTY_TEMPLATES_ELEMENT_PREVIEW_PICTURE_FILE_TITLE--#--Шаблон TITLE--,--IPROPERTY_TEMPLATES_ELEMENT_PREVIEW_PICTURE_FILE_NAME--#--Шаблон имени файла--,--IPROPERTY_TEMPLATES_ELEMENTS_DETAIL_PICTURE--#----Настройки для детальных картинок элементов--,--IPROPERTY_TEMPLATES_ELEMENT_DETAIL_PICTURE_FILE_ALT--#--Шаблон ALT--,--IPROPERTY_TEMPLATES_ELEMENT_DETAIL_PICTURE_FILE_TITLE--#--Шаблон TITLE--,--IPROPERTY_TEMPLATES_ELEMENT_DETAIL_PICTURE_FILE_NAME--#--Шаблон имени файла--,--SEO_ADDITIONAL--#----Дополнительно--,--TAGS--#--Теги--;--edit2--#--Разделы--,--SECTIONS--#--Разделы--;--";}', 'N'),
	(137, 0, 'form', 'form_element_3', 'a:1:{s:4:"tabs";s:1758:"edit1--#--Элемент--,--ID--#--ID--,--DATE_CREATE--#--Создан--,--TIMESTAMP_X--#--Изменен--,--ACTIVE--#--Активность--,--NAME--#--*Название--,--CODE--#--*Символьный код--,--SORT--#--Сортировка--,--IBLOCK_ELEMENT_PROP_VALUE--#----Значения свойств--,--PROPERTY_5--#--Ссылка на видео--;--edit5--#--Анонс--,--PREVIEW_PICTURE--#--Картинка для анонса--,--PREVIEW_TEXT--#--Описание для анонса--;--edit14--#--SEO--,--IPROPERTY_TEMPLATES_ELEMENT_META_TITLE--#--Шаблон META TITLE--,--IPROPERTY_TEMPLATES_ELEMENT_META_KEYWORDS--#--Шаблон META KEYWORDS--,--IPROPERTY_TEMPLATES_ELEMENT_META_DESCRIPTION--#--Шаблон META DESCRIPTION--,--IPROPERTY_TEMPLATES_ELEMENT_PAGE_TITLE--#--Заголовок элемента--,--IPROPERTY_TEMPLATES_ELEMENTS_PREVIEW_PICTURE--#----Настройки для картинок анонса элементов--,--IPROPERTY_TEMPLATES_ELEMENT_PREVIEW_PICTURE_FILE_ALT--#--Шаблон ALT--,--IPROPERTY_TEMPLATES_ELEMENT_PREVIEW_PICTURE_FILE_TITLE--#--Шаблон TITLE--,--IPROPERTY_TEMPLATES_ELEMENT_PREVIEW_PICTURE_FILE_NAME--#--Шаблон имени файла--,--IPROPERTY_TEMPLATES_ELEMENTS_DETAIL_PICTURE--#----Настройки для детальных картинок элементов--,--IPROPERTY_TEMPLATES_ELEMENT_DETAIL_PICTURE_FILE_ALT--#--Шаблон ALT--,--IPROPERTY_TEMPLATES_ELEMENT_DETAIL_PICTURE_FILE_TITLE--#--Шаблон TITLE--,--IPROPERTY_TEMPLATES_ELEMENT_DETAIL_PICTURE_FILE_NAME--#--Шаблон имени файла--,--SEO_ADDITIONAL--#----Дополнительно--,--TAGS--#--Теги--;--edit2--#--Разделы--,--SECTIONS--#--Разделы--;--";}', 'Y'),
	(168, 1, 'main.interface.grid', 'tbl_iblock_9a0364b9e99bb480dd25e1f0284c8555', 'a:3:{s:5:"views";a:1:{s:7:"default";a:3:{s:7:"columns";s:0:"";s:13:"columns_sizes";a:2:{s:6:"expand";i:1;s:7:"columns";a:0:{}}s:15:"sticked_columns";a:0:{}}}s:7:"filters";a:0:{}s:12:"current_view";s:7:"default";}', 'N'),
	(169, 1, 'main.ui.filter', 'tbl_iblock_section_68644bd953cc92c1153348f8217575c4', 'a:6:{s:14:"use_pin_preset";b:1;s:15:"deleted_presets";a:0:{}s:15:"default_presets";a:0:{}s:7:"default";s:14:"default_filter";s:6:"filter";s:14:"default_filter";s:7:"filters";a:1:{s:10:"tmp_filter";a:2:{s:6:"fields";a:1:{s:10:"SECTION_ID";s:1:"0";}s:11:"filter_rows";s:10:"SECTION_ID";}}}', 'N'),
	(175, 1, 'main.interface.grid', 'tbl_iblock_section_68644bd953cc92c1153348f8217575c4', 'a:3:{s:5:"views";a:1:{s:7:"default";a:3:{s:7:"columns";s:0:"";s:13:"columns_sizes";a:2:{s:6:"expand";i:1;s:7:"columns";a:0:{}}s:15:"sticked_columns";a:0:{}}}s:7:"filters";a:0:{}s:12:"current_view";s:7:"default";}', 'N'),
	(177, 1, 'main.ui.filter', 'tbl_iblock_element_68644bd953cc92c1153348f8217575c4', 'a:6:{s:14:"use_pin_preset";b:1;s:15:"deleted_presets";a:0:{}s:15:"default_presets";a:0:{}s:7:"default";s:14:"default_filter";s:6:"filter";s:14:"default_filter";s:7:"filters";a:1:{s:14:"default_filter";a:0:{}}}', 'N'),
	(182, 1, 'main.interface.grid', 'tbl_iblock_element_68644bd953cc92c1153348f8217575c4', 'a:3:{s:5:"views";a:1:{s:7:"default";a:4:{s:7:"columns";s:58:"NAME,ACTIVE,SORT,TIMESTAMP_X,DETAIL_PICTURE,DETAIL_TEXT,ID";s:13:"columns_sizes";a:2:{s:6:"expand";i:1;s:7:"columns";a:0:{}}s:15:"sticked_columns";a:0:{}s:12:"custom_names";N;}}s:7:"filters";a:0:{}s:12:"current_view";s:7:"default";}', 'N'),
	(183, 1, 'form', 'form_element_4', 'a:1:{s:4:"tabs";s:400:"edit1--#--Элемент--,--ID--#--ID--,--DATE_CREATE--#--Создан--,--TIMESTAMP_X--#--Изменен--,--ACTIVE--#--Активность--,--NAME--#--*Название--,--CODE--#--*Символьный код--,--SORT--#--Сортировка--;--edit6--#--Подробно--,--DETAIL_PICTURE--#--Детальная картинка--,--DETAIL_TEXT--#--Детальное описание--;--";}', 'N'),
	(184, 0, 'form', 'form_element_4', 'a:1:{s:4:"tabs";s:400:"edit1--#--Элемент--,--ID--#--ID--,--DATE_CREATE--#--Создан--,--TIMESTAMP_X--#--Изменен--,--ACTIVE--#--Активность--,--NAME--#--*Название--,--CODE--#--*Символьный код--,--SORT--#--Сортировка--;--edit6--#--Подробно--,--DETAIL_PICTURE--#--Детальная картинка--,--DETAIL_TEXT--#--Детальное описание--;--";}', 'Y'),
	(185, 1, 'html_editor', 'type_selector_DETAIL_TEXT4', 'a:1:{s:4:"type";s:4:"html";}', 'N'),
	(196, 1, 'main.ui.filter', 'tbl_iblock_section_dd5ef36e5a447af02ffc50723f333b15', 'a:6:{s:14:"use_pin_preset";b:1;s:15:"deleted_presets";a:0:{}s:15:"default_presets";a:0:{}s:7:"default";s:14:"default_filter";s:6:"filter";s:14:"default_filter";s:7:"filters";a:1:{s:10:"tmp_filter";a:2:{s:6:"fields";a:1:{s:10:"SECTION_ID";s:1:"0";}s:11:"filter_rows";s:10:"SECTION_ID";}}}', 'N'),
	(202, 1, 'main.interface.grid', 'tbl_iblock_section_dd5ef36e5a447af02ffc50723f333b15', 'a:3:{s:5:"views";a:1:{s:7:"default";a:3:{s:7:"columns";s:0:"";s:13:"columns_sizes";a:2:{s:6:"expand";i:1;s:7:"columns";a:0:{}}s:15:"sticked_columns";a:0:{}}}s:7:"filters";a:0:{}s:12:"current_view";s:7:"default";}', 'N'),
	(203, 1, 'main.ui.filter', 'tbl_iblock_element_dd5ef36e5a447af02ffc50723f333b15', 'a:6:{s:14:"use_pin_preset";b:1;s:15:"deleted_presets";a:0:{}s:15:"default_presets";a:0:{}s:7:"default";s:14:"default_filter";s:6:"filter";s:14:"default_filter";s:7:"filters";a:1:{s:14:"default_filter";a:0:{}}}', 'N'),
	(208, 1, 'main.interface.grid', 'tbl_iblock_element_dd5ef36e5a447af02ffc50723f333b15', 'a:3:{s:5:"views";a:1:{s:7:"default";a:3:{s:7:"columns";s:0:"";s:13:"columns_sizes";a:2:{s:6:"expand";i:1;s:7:"columns";a:0:{}}s:15:"sticked_columns";a:0:{}}}s:7:"filters";a:0:{}s:12:"current_view";s:7:"default";}', 'N'),
	(209, 1, 'form', 'form_element_5', 'a:1:{s:4:"tabs";s:205:"edit1--#--Элемент--,--ID--#--ID--,--ACTIVE--#--Активность--,--NAME--#--*Название--,--SORT--#--Сортировка--,--PREVIEW_PICTURE--#--Картинка для анонса--;--";}', 'N'),
	(210, 0, 'form', 'form_element_5', 'a:1:{s:4:"tabs";s:205:"edit1--#--Элемент--,--ID--#--ID--,--ACTIVE--#--Активность--,--NAME--#--*Название--,--SORT--#--Сортировка--,--PREVIEW_PICTURE--#--Картинка для анонса--;--";}', 'Y'),
	(218, 1, 'main.interface.grid', 'tbl_iblock_admin_21f64da1e5792c8295b964d159a14491', 'a:3:{s:5:"views";a:1:{s:7:"default";a:3:{s:7:"columns";s:0:"";s:13:"columns_sizes";a:2:{s:6:"expand";i:1;s:7:"columns";a:0:{}}s:15:"sticked_columns";a:0:{}}}s:7:"filters";a:0:{}s:12:"current_view";s:7:"default";}', 'N'),
	(221, 1, 'main.ui.filter', 'tbl_iblock_section_8182e9ea085d23d2ef27270309e7ea35', 'a:6:{s:14:"use_pin_preset";b:1;s:15:"deleted_presets";a:0:{}s:15:"default_presets";a:0:{}s:7:"default";s:14:"default_filter";s:6:"filter";s:14:"default_filter";s:7:"filters";a:1:{s:10:"tmp_filter";a:2:{s:6:"fields";a:1:{s:10:"SECTION_ID";s:1:"1";}s:11:"filter_rows";s:10:"SECTION_ID";}}}', 'N'),
	(227, 1, 'main.interface.grid', 'tbl_iblock_section_8182e9ea085d23d2ef27270309e7ea35', 'a:3:{s:5:"views";a:1:{s:7:"default";a:3:{s:7:"columns";s:0:"";s:13:"columns_sizes";a:2:{s:6:"expand";i:1;s:7:"columns";a:0:{}}s:15:"sticked_columns";a:0:{}}}s:7:"filters";a:0:{}s:12:"current_view";s:7:"default";}', 'N'),
	(251, 1, 'main.ui.filter', 'tbl_iblock_list_8182e9ea085d23d2ef27270309e7ea35', 'a:6:{s:14:"use_pin_preset";b:1;s:15:"deleted_presets";a:0:{}s:15:"default_presets";a:0:{}s:7:"default";s:14:"default_filter";s:6:"filter";s:14:"default_filter";s:7:"filters";a:1:{s:10:"tmp_filter";a:2:{s:6:"fields";a:1:{s:10:"SECTION_ID";s:1:"1";}s:11:"filter_rows";s:10:"SECTION_ID";}}}', 'N'),
	(256, 1, 'main.interface.grid', 'tbl_iblock_list_8182e9ea085d23d2ef27270309e7ea35', 'a:3:{s:5:"views";a:1:{s:7:"default";a:3:{s:7:"columns";s:0:"";s:13:"columns_sizes";a:2:{s:6:"expand";i:1;s:7:"columns";a:0:{}}s:15:"sticked_columns";a:0:{}}}s:7:"filters";a:0:{}s:12:"current_view";s:7:"default";}', 'N'),
	(257, 1, 'form', 'form_element_6', 'a:1:{s:4:"tabs";s:430:"edit1--#--Элемент--,--ID--#--ID--,--DATE_CREATE--#--Создан--,--TIMESTAMP_X--#--Изменен--,--ACTIVE--#--Активность--,--ACTIVE_FROM--#--*Начало активности--,--NAME--#--*Название--,--CODE--#--Символьный код--,--SORT--#--Сортировка--,--PROPERTY_6--#--*Файл--,--PREVIEW_PICTURE--#--Картинка для анонса--,--SECTIONS--#--Разделы--;--";}', 'N'),
	(258, 0, 'form', 'form_element_6', 'a:1:{s:4:"tabs";s:430:"edit1--#--Элемент--,--ID--#--ID--,--DATE_CREATE--#--Создан--,--TIMESTAMP_X--#--Изменен--,--ACTIVE--#--Активность--,--ACTIVE_FROM--#--*Начало активности--,--NAME--#--*Название--,--CODE--#--Символьный код--,--SORT--#--Сортировка--,--PROPERTY_6--#--*Файл--,--PREVIEW_PICTURE--#--Картинка для анонса--,--SECTIONS--#--Разделы--;--";}', 'Y');

-- Дамп структуры для таблица globus.b_user_password
CREATE TABLE IF NOT EXISTS `b_user_password` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CHANGE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_user_password_user_date` (`USER_ID`,`DATE_CHANGE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_user_password: ~0 rows (приблизительно)
DELETE FROM `b_user_password`;
INSERT INTO `b_user_password` (`ID`, `USER_ID`, `PASSWORD`, `DATE_CHANGE`) VALUES
	(1, 1, '$6$Ha5498dCIZqKO0ZV$6bJbbi9w3sN6Mg/zgqFCntsadVa3B1D6WeXSM6PQERlHohOHKq8k7WUB/8z2A1bWBFsjO8gKxc2pVxwemwHQo1', '2023-02-10 10:18:54');

-- Дамп структуры для таблица globus.b_user_phone_auth
CREATE TABLE IF NOT EXISTS `b_user_phone_auth` (
  `USER_ID` int(11) NOT NULL,
  `PHONE_NUMBER` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `OTP_SECRET` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ATTEMPTS` int(11) DEFAULT 0,
  `CONFIRMED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `DATE_SENT` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `ix_user_phone_auth_number` (`PHONE_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_user_phone_auth: ~0 rows (приблизительно)
DELETE FROM `b_user_phone_auth`;

-- Дамп структуры для таблица globus.b_user_profile_history
CREATE TABLE IF NOT EXISTS `b_user_profile_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `EVENT_TYPE` int(11) DEFAULT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `REMOTE_ADDR` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_AGENT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_URI` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `UPDATED_BY_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_profile_history_user` (`USER_ID`),
  KEY `ix_profile_history_date` (`DATE_INSERT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_user_profile_history: ~0 rows (приблизительно)
DELETE FROM `b_user_profile_history`;

-- Дамп структуры для таблица globus.b_user_profile_record
CREATE TABLE IF NOT EXISTS `b_user_profile_record` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `HISTORY_ID` int(11) NOT NULL,
  `FIELD` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATA` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_profile_record_history_field` (`HISTORY_ID`,`FIELD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_user_profile_record: ~0 rows (приблизительно)
DELETE FROM `b_user_profile_record`;

-- Дамп структуры для таблица globus.b_user_session
CREATE TABLE IF NOT EXISTS `b_user_session` (
  `SESSION_ID` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL,
  `SESSION_DATA` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SESSION_ID`),
  KEY `ix_user_session_time` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_user_session: ~0 rows (приблизительно)
DELETE FROM `b_user_session`;

-- Дамп структуры для таблица globus.b_user_stored_auth
CREATE TABLE IF NOT EXISTS `b_user_stored_auth` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `DATE_REG` datetime NOT NULL,
  `LAST_AUTH` datetime NOT NULL,
  `STORED_HASH` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TEMP_HASH` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IP_ADDR` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ux_user_hash` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_user_stored_auth: ~0 rows (приблизительно)
DELETE FROM `b_user_stored_auth`;
INSERT INTO `b_user_stored_auth` (`ID`, `USER_ID`, `DATE_REG`, `LAST_AUTH`, `STORED_HASH`, `TEMP_HASH`, `IP_ADDR`) VALUES
	(1, 1, '2023-02-10 14:18:54', '2023-02-10 14:18:54', '5dd03c432cf882c8340e6a13a8513f8c', 'N', 2130706433);

-- Дамп структуры для таблица globus.b_utm_blog_comment
CREATE TABLE IF NOT EXISTS `b_utm_blog_comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(11) NOT NULL,
  `FIELD_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE_INT` int(11) DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_utm_BLOG_COMMENT_2` (`VALUE_ID`),
  KEY `ix_utm_BLOG_COMMENT_3` (`FIELD_ID`,`VALUE_INT`,`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_utm_blog_comment: ~0 rows (приблизительно)
DELETE FROM `b_utm_blog_comment`;

-- Дамп структуры для таблица globus.b_utm_blog_post
CREATE TABLE IF NOT EXISTS `b_utm_blog_post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(11) NOT NULL,
  `FIELD_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE_INT` int(11) DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_utm_BLOG_POST_2` (`VALUE_ID`),
  KEY `ix_utm_BLOG_POST_3` (`FIELD_ID`,`VALUE_INT`,`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_utm_blog_post: ~0 rows (приблизительно)
DELETE FROM `b_utm_blog_post`;

-- Дамп структуры для таблица globus.b_utm_forum_message
CREATE TABLE IF NOT EXISTS `b_utm_forum_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(11) NOT NULL,
  `FIELD_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE_INT` int(11) DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_utm_FORUM_MESSAGE_2` (`VALUE_ID`),
  KEY `ix_utm_FORUM_MESSAGE_3` (`FIELD_ID`,`VALUE_INT`,`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_utm_forum_message: ~0 rows (приблизительно)
DELETE FROM `b_utm_forum_message`;

-- Дамп структуры для таблица globus.b_uts_blog_comment
CREATE TABLE IF NOT EXISTS `b_uts_blog_comment` (
  `VALUE_ID` int(11) NOT NULL,
  `UF_BLOG_COMMENT_DOC` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `UF_BLOG_COMM_URL_PRV` int(11) DEFAULT NULL,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_uts_blog_comment: ~0 rows (приблизительно)
DELETE FROM `b_uts_blog_comment`;

-- Дамп структуры для таблица globus.b_uts_blog_post
CREATE TABLE IF NOT EXISTS `b_uts_blog_post` (
  `VALUE_ID` int(11) NOT NULL,
  `UF_BLOG_POST_DOC` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `UF_BLOG_POST_URL_PRV` int(11) DEFAULT NULL,
  `UF_GRATITUDE` int(18) DEFAULT NULL,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_uts_blog_post: ~0 rows (приблизительно)
DELETE FROM `b_uts_blog_post`;

-- Дамп структуры для таблица globus.b_uts_forum_message
CREATE TABLE IF NOT EXISTS `b_uts_forum_message` (
  `VALUE_ID` int(11) NOT NULL,
  `UF_FORUM_MES_URL_PRV` int(11) DEFAULT NULL,
  `UF_TASK_COMMENT_TYPE` int(18) DEFAULT NULL,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_uts_forum_message: ~0 rows (приблизительно)
DELETE FROM `b_uts_forum_message`;

-- Дамп структуры для таблица globus.b_vote
CREATE TABLE IF NOT EXISTS `b_vote` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CHANNEL_ID` int(18) NOT NULL DEFAULT 0,
  `C_SORT` int(18) DEFAULT 100,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ANONYMITY` int(11) NOT NULL DEFAULT 0,
  `NOTIFY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `AUTHOR_ID` int(18) DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `DATE_START` datetime NOT NULL,
  `DATE_END` datetime NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COUNTER` int(11) NOT NULL DEFAULT 0,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `IMAGE_ID` int(18) DEFAULT NULL,
  `EVENT1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EVENT2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EVENT3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNIQUE_TYPE` int(18) NOT NULL DEFAULT 2,
  `KEEP_IP_SEC` int(18) DEFAULT NULL,
  `OPTIONS` int(18) DEFAULT 1,
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_CHANNEL_ID` (`CHANNEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_vote: ~0 rows (приблизительно)
DELETE FROM `b_vote`;

-- Дамп структуры для таблица globus.b_vote_answer
CREATE TABLE IF NOT EXISTS `b_vote_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TIMESTAMP_X` datetime NOT NULL,
  `QUESTION_ID` int(18) NOT NULL DEFAULT 0,
  `C_SORT` int(18) DEFAULT 100,
  `IMAGE_ID` int(18) DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `COUNTER` int(18) NOT NULL DEFAULT 0,
  `FIELD_TYPE` int(5) NOT NULL DEFAULT 0,
  `FIELD_WIDTH` int(18) DEFAULT NULL,
  `FIELD_HEIGHT` int(18) DEFAULT NULL,
  `FIELD_PARAM` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLOR` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_QUESTION_ID` (`QUESTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_vote_answer: ~0 rows (приблизительно)
DELETE FROM `b_vote_answer`;

-- Дамп структуры для таблица globus.b_vote_attached_object
CREATE TABLE IF NOT EXISTS `b_vote_attached_object` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OBJECT_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `CREATE_TIME` datetime NOT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_VOTE_AO_1` (`OBJECT_ID`),
  KEY `IX_VOTE_AO_2` (`MODULE_ID`,`ENTITY_TYPE`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_vote_attached_object: ~0 rows (приблизительно)
DELETE FROM `b_vote_attached_object`;

-- Дамп структуры для таблица globus.b_vote_channel
CREATE TABLE IF NOT EXISTS `b_vote_channel` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `SYMBOLIC_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `C_SORT` int(18) DEFAULT 100,
  `FIRST_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `TIMESTAMP_X` datetime NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VOTE_SINGLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `USE_CAPTCHA` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_vote_channel: ~0 rows (приблизительно)
DELETE FROM `b_vote_channel`;

-- Дамп структуры для таблица globus.b_vote_channel_2_group
CREATE TABLE IF NOT EXISTS `b_vote_channel_2_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CHANNEL_ID` int(18) NOT NULL DEFAULT 0,
  `GROUP_ID` int(18) NOT NULL DEFAULT 0,
  `PERMISSION` int(18) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `IX_VOTE_CHANNEL_ID_GROUP_ID` (`CHANNEL_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_vote_channel_2_group: ~0 rows (приблизительно)
DELETE FROM `b_vote_channel_2_group`;

-- Дамп структуры для таблица globus.b_vote_channel_2_site
CREATE TABLE IF NOT EXISTS `b_vote_channel_2_site` (
  `CHANNEL_ID` int(18) NOT NULL DEFAULT 0,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CHANNEL_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_vote_channel_2_site: ~0 rows (приблизительно)
DELETE FROM `b_vote_channel_2_site`;

-- Дамп структуры для таблица globus.b_vote_event
CREATE TABLE IF NOT EXISTS `b_vote_event` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `VOTE_ID` int(18) NOT NULL DEFAULT 0,
  `VOTE_USER_ID` int(18) NOT NULL DEFAULT 0,
  `DATE_VOTE` datetime NOT NULL,
  `STAT_SESSION_ID` int(18) DEFAULT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALID` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `VISIBLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `IX_USER_ID` (`VOTE_USER_ID`),
  KEY `IX_B_VOTE_EVENT_2` (`VOTE_ID`,`IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_vote_event: ~0 rows (приблизительно)
DELETE FROM `b_vote_event`;

-- Дамп структуры для таблица globus.b_vote_event_answer
CREATE TABLE IF NOT EXISTS `b_vote_event_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_QUESTION_ID` int(18) NOT NULL DEFAULT 0,
  `ANSWER_ID` int(18) NOT NULL DEFAULT 0,
  `MESSAGE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_EVENT_QUESTION_ID` (`EVENT_QUESTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_vote_event_answer: ~0 rows (приблизительно)
DELETE FROM `b_vote_event_answer`;

-- Дамп структуры для таблица globus.b_vote_event_question
CREATE TABLE IF NOT EXISTS `b_vote_event_question` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_ID` int(18) NOT NULL DEFAULT 0,
  `QUESTION_ID` int(18) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `IX_EVENT_ID` (`EVENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_vote_event_question: ~0 rows (приблизительно)
DELETE FROM `b_vote_event_question`;

-- Дамп структуры для таблица globus.b_vote_question
CREATE TABLE IF NOT EXISTS `b_vote_question` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TIMESTAMP_X` datetime NOT NULL,
  `VOTE_ID` int(18) NOT NULL DEFAULT 0,
  `C_SORT` int(18) DEFAULT 100,
  `IMAGE_ID` int(18) DEFAULT NULL,
  `QUESTION` text COLLATE utf8_unicode_ci NOT NULL,
  `QUESTION_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `FIELD_TYPE` int(5) NOT NULL DEFAULT 0,
  `REQUIRED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `COUNTER` int(11) NOT NULL DEFAULT 0,
  `DIAGRAM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DIAGRAM_TYPE` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'histogram',
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEMPLATE_NEW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_VOTE_ID` (`VOTE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_vote_question: ~0 rows (приблизительно)
DELETE FROM `b_vote_question`;

-- Дамп структуры для таблица globus.b_vote_user
CREATE TABLE IF NOT EXISTS `b_vote_user` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `COOKIE_ID` int(18) NOT NULL,
  `AUTH_USER_ID` int(18) DEFAULT NULL,
  `COUNTER` int(18) NOT NULL DEFAULT 0,
  `DATE_FIRST` datetime NOT NULL,
  `DATE_LAST` datetime NOT NULL,
  `LAST_IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_GUEST_ID` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_VOTE_COOKIE_USER` (`COOKIE_ID`,`AUTH_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы globus.b_vote_user: ~0 rows (приблизительно)
DELETE FROM `b_vote_user`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
