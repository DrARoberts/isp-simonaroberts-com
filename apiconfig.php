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
mt_srand(mt_rand(-time(), time()), MT_RAND_MT19937);
mt_srand(mt_rand(-microtime(true) * time(), microtime(true) * time()), MT_RAND_MT19937);
mt_srand(mt_rand(-microtime(true) * time() * time(), microtime(true) * time() * time()), MT_RAND_MT19937);
mt_srand(mt_rand(-microtime(true) * time() * time() * time(), microtime(true) * time() * time() * time()), MT_RAND_MT19937);
mt_srand(mt_rand(-microtime(true) * time() * time() * time() * time(), microtime(true) * time() * time() * time() * time()), MT_RAND_MT19937);
srand(mt_rand(-microtime(true) * time() * time() * time() * time(), microtime(true) * time() * time() * time() * time()));

/*
 * Gets twitter details for the hostname
 */
$sql = "SELECT `id`, `tweets-next`, `tweets-hour`, `tweets-average-hour`, `twitter-user`, `consumer-api-key`, `consumer-api-secret-key`, `access-token-key`, `access-token-secret-key` FROM `" . $GLOBALS['APIDB']->prefix('lists') . "` WHERE `hostname` LIKE '" . parse_url(API_URL, PHP_URL_HOST) . "'";
list($listid, $tweetnext, $tweetshour, $tweetsaveragehour, $twitteruser, $consumerkey, $consumersecretkey, $accesstoken, $accesstokensecret) = $GLOBALS['APIDB']->fetchRow($GLOBALS['APIDB']->queryF($sql));
$GLOBALS['twitter']['settings']['oauth_access_token'] = $accesstoken;
$GLOBALS['twitter']['settings']['oauth_access_token_secret'] = $accesstokensecret;
$GLOBALS['twitter']['settings']['consumer_key'] = $consumerkey;
$GLOBALS['twitter']['settings']['consumer_secret'] = $consumersecretkey;
$GLOBALS['twitter']['username'] = $twitteruser;
$GLOBALS['twitter']['listid'] = $listid;
$GLOBALS['twitter']['tweetsnext'] = $tweetsnext;
$GLOBALS['twitter']['tweetshour'] = $tweetshour;
$GLOBALS['twitter']['tweetsaveragehour'] = $tweetsaveragehour;

/*
 * Gets all list modals
 */
global $modalhosts, $modalsyndicate;
$modalsyndicate = $modalhosts = array();

$sql = "SELECT DISTINCT `modal`, `title`, `hostname`, `ssl` FROM `" . $GLOBALS['APIDB']->prefix('lists') . "` WHERE `state` = 'Online' ORDER BY RAND() ASC";
$result = $GLOBALS['APIDB']->queryF($sql);
while( $row = $GLOBALS['APIDB']->fetchArray($result))
    $modalhosts[$row['modal']][$row['hostname']][$row['ssl']] = $row['title'];

$sql = "SELECT DISTINCT `state`, `key`, `modal`, `title`, `hostname`, `ssl`, `callback-uri`, `auth-uri` FROM `" . $GLOBALS['APIDB']->prefix('lists') . "` WHERE (`state` IN ('Online', 'Query') AND `sydnicated` = 'Yes') OR `state` IN ('Ignore') ORDER BY RAND() ASC";
$result = $GLOBALS['APIDB']->queryF($sql);
while( $row = $GLOBALS['APIDB']->fetchArray($result)) {
    $modalsyndicate[$row['state']][$row['modal']][$row['hostname']][$row['ssl']][$row['key']]['title'] = $row['title'];
    $modalsyndicate[$row['state']][$row['modal']][$row['hostname']][$row['ssl']][$row['key']]['callback-uri'] = $row['callback-uri'];
    $modalsyndicate[$row['state']][$row['modal']][$row['hostname']][$row['ssl']][$row['key']]['auth-uri'] = $row['auth-uri'];
}

/*
 * Updates the key hasing fields as per list modals
 */
$keytables = array('lists', 'claimableservices', 'services');
$reserved = array('key-session');

foreach($keytables as $table) {
    $create = array();
    $sql = "SHOW FIELDS FROM `" . $GLOBALS['APIDB']->prefix($table) . '`';
    $results = $GLOBALS['APIDB']->queryF($sql);
    $keyfieldwords = array_keys($modalhosts);
    while($row = $GLOBALS['APIDB']->fetchArray($results)) {
        foreach($keyfieldwords as $id => $keyfield) {
            if ($row['Field'] == "key-$keyfield") {
                $lastfield = $row['Field'];
                unset($keyfieldwords[$id]);
            }
        }
    }
    if (!empty($keyfieldwords)) 
        foreach($keyfieldwords as $id => $keyfield) {
            if (!in_array("key-$keyfield", $reserved)) {
                $create["key-$keyfield"] = "varchar(128)";
                $create["key-$keyfield"]['default'] = "";
                if (!empty($lastfield))
                    $create[$field]['after'] = $lastfield;
            }
        }
    if (count($create) > 0)
        foreach($create as $field => $values) {
            if (isset($values['default']))
                @$GLOBALS['APIDB']->queryF("ALTER TABLE `" . $GLOBALS['APIDB']->prefix($table) . "` ADD COLUMN `$field` " . $values['type']. " NOT NULL DEFAULT '" . $values['default'] . (!empty($values['after'])?"  AFTER `" . $values['after'] . "`":""));
            else
                @$GLOBALS['APIDB']->queryF("ALTER TABLE `" . $GLOBALS['APIDB']->prefix($table) . "` ADD COLUMN `$field` " . $values['type'] . (!empty($values['after'])?"  AFTER `" . $values['after'] . "`":""));
        }
 }