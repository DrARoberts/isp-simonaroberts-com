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
require_once dirname(__DIR__) . DIRECTORY_SEPARATOR . 'class'. DIRECTORY_SEPARATOR . 'cache'. DIRECTORY_SEPARATOR . 'apicache.php';

$start = time();
if ($staters = APICache::read('ntp-mining-services'))
{
    $staters[] = $start;
    sort($staters, SORT_ASC);
    if (count($starters)>50)
        unset($starters[0]);
    sort($staters, SORT_ASC);
    APICache::write('ntp-mining-services', $staters, 3600 * 24 * 7 * 4 * 6);
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
    APICache::write('ntp-mining-services', array(0=>$start), 3600 * 24 * 7 * 4 * 6);
    $seconds = 1800;
}

if (!$ipseg = json_decode(file_get_contents(__DIR__ . DS . 'ntp-mining-services-ip-segments.json'), true))
    $ipseg = array("a" => 1, "b" => 0, "c" => 0, "d" => 0);

foreach($ipseg as $key => $value)
    ${$key} = $value;

$d++;
if ($d == 256) {
    $d = 0;
    $c++;
}
if ($c == 256) {
    $c = 0;
    $b++;
}
if ($b == 256) {
    $b = 0;
    $a++;
}
if ($a == 256) {
    $a = 1;
}

foreach($ipseg as $key => $value)
    $ipseg[$key] = ${$key};

file_put_contents(__DIR__ . DS . 'ntp-mining-services-ip-segments.json', json_encode($ipseg));
$timestampee = getTimeFromNTP($ip = $ipseg['a'] . '.' . $ipseg['b'] . '.' . $ipseg['c'] . '.' . $ipseg['d'], 123, 199);
$hostname = gethostbyaddr($ip);
        
if ($timestampee > 0 && is_numeric($timestampee) && !empty($hostname)) {
       $whois = json_decode(getURIData("http://whois.snails.email/v2/$ip/json.api", 120, 120, array(), array()), true);
       if (!empty($hostname)) {
           if ($json = json_decode(getURIData("http://ntp.snails.email:80/v1/addntp.api", 120, 120, array("format" => 'json', "mode" => 'addntp', "hostname" => $hostname, "port" => 123, "name" => $whois['whois-arin-net']['organization'], "nameemail" => $whois['whois-arin-net']['emails']['orgabuseemail'], "nameurl" => "http://" . $whois['whois-arin-net']['domains']['orgabuseemail'], "companyname" => $whois['whois-arin-net']['orgname'], "companyurl" => "http://" . $whois['whois-arin-net']['domains']['orgtechemail'], "companyemail" => $whois['whois-arin-net']['emails']['orgtechemail']), array())))
               echo("\n\nURL CALL Success: " . print_r($json, true));
           else
               echo("\n\nURL Call Failed!!");
       }
} else 
    die("\n\nNo DNS Found at $ip");
?>
