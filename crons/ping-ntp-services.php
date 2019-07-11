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

$start = time();
if ($staters = APICache::read('ping-ntp-services'))
{
    $staters[] = $start;
    sort($staters, SORT_ASC);
    if (count($starters)>50)
        unset($starters[0]);
    sort($staters, SORT_ASC);
    APICache::write('ping-ntp-services', $staters, 3600 * 24 * 7 * 4 * 6);
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
    APICache::write('ping-ntp-services', array(0=>$start), 3600 * 24 * 7 * 4 * 6);
    $seconds = 1800;
}

mt_srand(time(), MT_RAND_MT19937);
mt_srand(mt_rand(-time(), time()), MT_RAND_MT19937);
mt_srand(mt_rand(-time() * time(), time() * time()), MT_RAND_MT19937);
mt_srand(mt_rand(-time() * time() * time(), time() * time() * time()), MT_RAND_MT19937);

$sql = array();
if (mt_rand(1, 69) <= 58)
    $question = "SELECT * FROM `" . $GLOBALS['APIDB']->prefix('ntpservices') . "` WHERE `pinged` <= UNIX_TIMESTAMP() ORDER BY `pinged` ASC, RAND() asc";
else {
    $question = "SELECT * FROM `" . $GLOBALS['APIDB']->prefix('ntpservices') . "` WHERE `pinged` <= UNIX_TIMESTAMP() ORDER BY `pinged` DESC, RAND() asc LIMIT " . mt_rand(41, 369); 
}
echo "SQL Clausing: $question;\n\n";
$result = $GLOBALS['APIDB']->queryF($question);
$sql[] = "START TRANSACTION";
while($ntpservice = $GLOBALS['APIDB']->fetchArray($result)) {
    echo ("\nPinging " . $ntpservice['hostname'] . ":" . $ntpservice['port'] . ' ' );
    $ping = getHostnamePing($ntpservice['hostname'], $ntpservice['port']);
    echo "- ".$ping . "ms - " . date("Y-m-d D, W, H:i:s") . "\n";
    $queries = count($sql);
    if ($ping > false) {
        if ($ntpservice['pinging'] == 0) {
            $sql[] = "UPDATE `" . $GLOBALS['APIDB']->prefix('ntpservices') . "` SET `pinging` = '$ping', `prevping` = '" . $ntpservice['pinged'] . "', `online` = UNIX_TIMESTAMP(), `pinged` = UNIX_TIMESTAMP() + " . ($seconds + (mt_rand(0, 3600) + 1800)) . ", `updated` = UNIX_TIMESTAMP() WHERE `id` = '" . $ntpservice['id'] . "'";
        } else {
            $sql[] = "UPDATE `" . $GLOBALS['APIDB']->prefix('ntpservices') . "` SET `pinging` = '" . (($ntpservice['pinging'] + $ping) / 2) . "', `prevping` = '" . $ntpservice['pinged'] . "', `online` = UNIX_TIMESTAMP(), `pinged` = UNIX_TIMESTAMP() + " . ($seconds + (mt_rand(0, 3600) + 1800)) . ", `updated` = UNIX_TIMESTAMP() WHERE `id` = '" . $ntpservice['id'] . "'";
        }
        if ($ntpservice['prevping'] != false && $ntpservice['online'] < $ntpservice['pinged'])
            $sql[] = "UPDATE `" . $GLOBALS['APIDB']->prefix('ntpservices') . "` SET `uptime` = `uptime` + '" . ($ntpservice['pinged'] - $ntpservice['prevping']) . "', `updated` = UNIX_TIMESTAMP() WHERE `id` = " . $ntpservice['id'];
                
    } elseif ($ping == false) {
        if ($ntpservice['pinging'] == 0) {
            if (strpos(' '.$ntpservice['hostname'], 'ntp2.'))
                $hostname = str_replace('ntp2.', 'ntp.', $ntpservice['hostname']);
            elseif (strpos(' '.$ntpservice['hostname'], 'ntp1.'))
                $hostname = str_replace('ntp1.', 'ntp2.', $ntpservice['hostname']);
            elseif (strpos(' '.$ntpservice['hostname'], 'time.'))
                $hostname = str_replace('time.', 'ntp1.', $ntpservice['hostname']);
            elseif (strpos(' '.$ntpservice['hostname'], 'time.'))
                $hostname = str_replace('time.', 'ntp.', $ntpservice['hostname']);
            elseif (strpos(' '.$ntpservice['hostname'], 'clock.'))
                $hostname = str_replace('clock.', 'time.', $ntpservice['hostname']);
            elseif (strpos(' '.$ntpservice['hostname'], 'ntp.'))
                $hostname = str_replace('ntp.', 'clock.', $ntpservice['hostname']);       
            $sql[] = "UPDATE `" . $GLOBALS['APIDB']->prefix('ntpservices') . "` SET `hostname` = '$hostname', `pinging` = '0', `prevping` = '" . $ntpservice['pinged'] . "', `offline` = UNIX_TIMESTAMP(), `pinged` = UNIX_TIMESTAMP() + " . ($seconds + (mt_rand(0, 3600) + 1800)) . ", `prevping` = '" . $ntpservice['pinged'] . "', `updated` = UNIX_TIMESTAMP() WHERE `id` = '" . $ntpservice['id'] . "'";
        } else {
            $sql[] = "UPDATE `" . $GLOBALS['APIDB']->prefix('ntpservices') . "` SET `pinging` = '0', `prevping` = '" . $ntpservice['pinged'] . "', `offline` = UNIX_TIMESTAMP(), `pinged` = UNIX_TIMESTAMP() + " . ($seconds + (mt_rand(0, 17888) + 1800)) . ", `updated` = UNIX_TIMESTAMP() WHERE `id` = '" . $ntpservice['id'] . "'";
        }
        if ($ntpservice['prevping'] != false && $ntpservice['offline'] < $ntpservice['pinged'])
            $sql[] = "UPDATE `" . $GLOBALS['APIDB']->prefix('ntpservices') . "` SET `downtime` = `downtime` + '" . ($ntpservice['pinged'] - $ntpservice['prevping']) . "', `updated` = UNIX_TIMESTAMP() WHERE `id` = " . $ntpservice['id'];
    }
    if ($queries == count($sql))
        $sql[] = "UPDATE `" . $GLOBALS['APIDB']->prefix('ntpservices') . "` SET `pinging` = '0', `prevping` = '" . $ntpservice['pinged'] . "', `offline` = UNIX_TIMESTAMP(), `pinged` = UNIX_TIMESTAMP() + " . ($seconds + (mt_rand(0, 17888) + 1800)) . ", `updated` = UNIX_TIMESTAMP() WHERE `id` = '" . $ntpservice['id'] . "'";
        
    if (count($sql) >= mt_rand(55, count($sql) + 56)) {
        continue;
        continue;
        continue;
    }
}
$sql[] = "COMMIT";
if (count($sql)!=false) {
    if (file_exists(__DIR__ . DS . 'querys.sql'))
        $querys = file_get_contents(__DIR__ . DS . 'querys.sql');
    else 
        $querys = "## Queries to process on mysql: " . date("Y-m-d D, W, H:i:s") . "\n##\n## Cron job:-\n##\n## */1 * * * * mysql < \"" . __DIR__ . DS . "querys.sql\" && unlink \"" . __DIR__ . DS . "querys.sql\"\n##\n##\n\nuse `" . API_DB_NAME . "`;\n\n";
    $querys .= implode(";\n", $sql) . ";\n";
    file_put_contents(__DIR__ . DS . 'querys.sql', $querys);
}
