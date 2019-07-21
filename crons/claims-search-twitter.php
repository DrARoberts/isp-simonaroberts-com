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

$sql = "SELECT * FROM `" . $GLOBALS['APIDB']->prefix('claimableservices') . "` WHERE `companytwitterurls` LIKE  '[\"\"]' AND `finished` = 0 ORDER BY RAND() asc LIMIT " . mt_rand(5, 19);
$result = $GLOBALS['APIDB']->queryF($sql);
while($claims = $GLOBALS['APIDB']->fetchArray($result)) {
    $page=0;
    echo "Seaching: " . $claims['companyname'] . "\n";
    unset($twitter_instance);
    $twitter_instance = new TwitterAPIExchange($GLOBALS['twitter']['settings']);
    $query = $twitter_instance->setGetfield(http_build_query(array('count' => 10, 'page' => $page, 'q' => $claims['companyname'])))->buildOauth('https://api.twitter.com/1.1/users/search.json', 'GET')->performRequest();
    $json = json_decode($query, true);
    while(count($json)>0 && count($json['errors'])==0) {
        foreach($json as $id => $twituser) {
            foreach($twituser['entities']['url']['urls'] as $url)
                if (in_array(getBaseDomain($url['expanded_url']), json_decode($claims['hostnames'], true))) {
                    if (!is_array($claims['companytwitterurls']) && $claims['companytwitterurls'] != '[""]')
                        $claims['companytwitterurls'] = json_decode($claims['companytwitterurls'], true);
                    elseif (!is_array($claims['companytwitterurls']) && $claims['companytwitterurls'] == '[""]')
                        $claims['companytwitterurls'] = array();
                    $claims['companytwitterurls'][] = 'https://twitter.com/' . $twituser['screen_name'];
                }
        }
        $page++;
        unset($twitter_instance);
        $twitter_instance = new TwitterAPIExchange($GLOBALS['twitter']['settings']);
        $query = $twitter_instance->setGetfield(http_build_query(array('count' => 20, 'page' => $page, 'q' => $claims['companyname'])))->buildOauth('https://api.twitter.com/1.1/users/search.json', 'GET')->performRequest();
        $json = json_decode($query, true);
    }
    if (is_array($claims['companytwitterurls'])) {
        $sql = "UPDATE `" . $GLOBALS['APIDB']->prefix('claimableservices') . "` SET `companytwitterurls` = '" . $GLOBALS['APIDB']->escape(json_encode($claims['companytwitterurls'])) . "' WHERE `id` = " . $claims['id'];
        if ($GLOBALS['APIDB']->queryF($sql))
            echo "SQL Success: $sql;";
        else
            echo "SQL Failed: $sql;";
    }
}

