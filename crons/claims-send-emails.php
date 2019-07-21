<?php
/**
 * NTP.SNAILS.EMAIL - Pinging Cron
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

require_once dirname(__DIR__) . DIRECTORY_SEPARATOR . 'apiconfig.php';
require_once dirname(__DIR__) . DS . 'class' . DS . 'TwitterAPIExchange.php';

$start = time();
if ($staters = APICache::read(basename(__FILE__)))
{
    $staters[] = $start;
    sort($staters, SORT_ASC);
    if (count($starters)>50)
        unset($starters[0]);
    sort($staters, SORT_ASC);
    APICache::write(basename(__FILE__), $staters, 3600 * 24 * 7 * 4 * 6);
    $keys = array_key(array_reverse($starters));
    $avg = array();
    foreach(array_reverse($starters) as $key => $starting) {
        if (isset($keys[$key - 1])) {
            $avg[] = abs($starting - $starters[$keys[$key - 1]]);
        }
    }
    if (count($avg) > 0 ) {
        foreach($avg as $average)
            $seconds += $average;
        $seconds = $seconds / count($avg);
    } else 
        $seconds = 1800;
} else {
    APICache::write(basename(__FILE__), array(0=>$start), 3600 * 24 * 7 * 4 * 6);
    $seconds = 1800;
}


$sql = "SELECT `title`, `twitter-user` FROM `" . $GLOBALS['APIDB']->prefix('lists') . "` WHERE `hostname` LIKE '" . parse_url(API_URL, PHP_URL_HOST) . "'";
list($pagetitle, $twitteruser) = $GLOBALS['APIDB']->fetchRow($GLOBALS['APIDB']->queryF($sql));

$sql = "SELECT * FROM `" . $GLOBALS['APIDB']->prefix('claimableservices') . "` WHERE `companytwitterurls` NOT LIKE  '[\"\"]' AND `tweeted` < UNIX_TIMESTAMP() AND `finished` = 0 ORDER BY RAND() asc";
$result = $GLOBALS['APIDB']->queryF($sql);
while($claims = $GLOBALS['APIDB']->fetchArray($result)) {
    $uri = API_URL . '/v1/' . md5($claim['id'].API_URL.'claim') . "/claim.html";
    echo "\n\nSeaching: " . $claims['companyname'] . " ~ ";
    foreach(json_decode($claims['companytwitterurls'], true) as $twiturl) {
        if (!empty($twiturl)) {
            $screen_name = str_replace(array('http://', 'https://', 'twitter.com/', 'www.'), "", $twiturl);
            echo "@" . $screen_name . "; ";
            $url = 'https://api.twitter.com/1.1/users/lookup.json';
            $request_method = 'GET';
            $twitter_instance = new TwitterAPIExchange($GLOBALS['twitter']['settings']);
            $query = $twitter_instance->setGetfield(http_build_query(array('include_entities' => true, 'screen_name' => $screen_name)))->buildOauth($url, $request_method)->performRequest();
            unset($twitter_instance);
            $json = json_decode($query, true);
            foreach($json as $twituser) {
                $status = sprintf(TWEETS_CLAIM_REPLY, $screen_name, $pagetitle, $uri, $twitteruser);
                $url = 'https://api.twitter.com/1.1/statuses/update.json';
                $request_method = 'POST';
                $twitter_instance = new TwitterAPIExchange($GLOBALS['twitter']['settings']);
                $query = $twitter_instance->setPostfields(array('in_reply_to_status_id' => $twituser['status']['id'], 'auto_populate_reply_metadata' => true, 'status' => $status))->buildOauth($url, $request_method)->performRequest();
                unset($twitter_instance);
                $jjson = json_decode($query, true);
                if (!empty($jjson['id'])) {
                    $sql = "UPDATE `" . $GLOBALS['APIDB']->prefix('claimableservices') . "` SET `tweeted` = UNIX_TIMESTAMP() + (((RAND() * 11) + 1) * (3600 * 24)) WHERE `id` = " . $claims['id'];
                    if ($GLOBALS['APIDB']->queryF($sql))
                        echo "SQL Success!";
                    else
                        echo "SQL Failed!";
                }
            }
        }
    }
}

