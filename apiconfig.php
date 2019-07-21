<?php
/**
 * Email Account Propogation REST Services API
 *
 * You may not change or alter any portion of this comment or credits
 * of supporting developers from this source code or any supporting source code
 * which is considered copyrighted (c) material of the original comment or credit authors.
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *
 * @copyright       Chronolabs Cooperative http://syd.au.snails.email
 * @license         ACADEMIC APL 2 (https://sourceforge.net/u/chronolabscoop/wiki/Academic%20Public%20License%2C%20version%202.0/)
 * @license         GNU GPL 3 (http://www.gnu.org/licenses/gpl.html)
 * @package         emails-api
 * @since           1.1.11
 * @author          Dr. Simon Antony Roberts <simon@snails.email>
 * @version         1.1.11
 * @description		A REST API for the creation and management of emails/forwarders and domain name parks for email
 * @link            http://internetfounder.wordpress.com
 * @link            https://github.com/Chronolabs-Cooperative/Emails-API-PHP
 * @link            https://sourceforge.net/p/chronolabs-cooperative
 * @link            https://facebook.com/ChronolabsCoop
 * @link            https://twitter.com/ChronolabsCoop
 * 
 */


if (!is_file(__DIR__ . DIRECTORY_SEPARATOR . 'mainfile.php') || !is_file(__DIR__ . DIRECTORY_SEPARATOR . 'include' . DIRECTORY_SEPARATOR . 'license.php'))
{
    header('Location: ' . "./install");
    exit(0);
}

require_once __DIR__ . DIRECTORY_SEPARATOR . 'mainfile.php';
require_once __DIR__ . DIRECTORY_SEPARATOR . 'include' . DIRECTORY_SEPARATOR . 'functions.php';

/**
 * Opens Access Origin Via networking Route NPN
 */
header('Access-Control-Allow-Origin: *');
header('Origin: *');

/**
 * Turns of GZ Lib Compression for Document Incompatibility
 */
ini_set("zlib.output_compression", 'Off');
ini_set("zlib.output_compression_level", -1);

/**
 * 
 * @var constants
 */
define('API_CACHE_SECONDS', 93);

// Seeds the random
mt_srand(mt_rand(time(), microtime(true) * time() * time()));
mt_srand(mt_rand(time(), microtime(true) * time() * time()));
mt_srand(mt_rand(time(), microtime(true) * time() * time()));
mt_srand(mt_rand(time(), microtime(true) * time() * time()));
srand(mt_rand(time(), microtime(true) * time() * time()));

$sql = "SELECT `twitter-user`, `consumer-api-key`, `consumer-api-secret-key`, `access-token-key`, `access-token-secret-key` FROM `" . $GLOBALS['APIDB']->prefix('lists') . "` WHERE `hostname` LIKE '" . parse_url(API_URL, PHP_URL_HOST) . "'";
list($twitteruser, $consumerkey, $consumersecretkey, $accesstoken, $accesstokensecret) = $GLOBALS['APIDB']->fetchRow($GLOBALS['APIDB']->queryF($sql));
$GLOBALS['twitter']['settings']['oauth_access_token'] = $accesstoken;
$GLOBALS['twitter']['settings']['oauth_access_token_secret'] = $accesstokensecret;
$GLOBALS['twitter']['settings']['consumer_key'] = $consumerkey;
$GLOBALS['twitter']['settings']['consumer_secret'] = $consumersecretkey;
$GLOBALS['twitter']['username'] = $twitteruser;


