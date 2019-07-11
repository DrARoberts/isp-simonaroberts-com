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
require_once dirname(__DIR__) . DIRECTORY_SEPARATOR . 'class' . DIRECTORY_SEPARATOR . 'apimailer.php';

$start = time();
if ($staters = APICache::read('reports-ntp-services'))
{
    $staters[] = $start;
    sort($staters, SORT_ASC);
    if (count($starters)>50)
        unset($starters[0]);
    sort($staters, SORT_ASC);
    APICache::write('reports-ntp-services', $staters, 3600 * 24 * 7 * 4 * 6);
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
    APICache::write('reports-ntp-services', array(0=>$start), 3600 * 24 * 7 * 4 * 6);
    $seconds = 1800;
}

$sql = "SELECT * FROM `" . $GLOBALS['APIDB']->prefix('ntpservices') . "` WHERE `reportnext` = 0 AND  `reportlast` = 0 ORDER BY RAND() asc";
$result = $GLOBALS['APIDB']->queryF($sql);
while($ntpservice = $GLOBALS['APIDB']->fetchArray($result)) {
    if (!$GLOBALS['APIDB']->queryF($sql = "UPDATE `" . $GLOBALS['APIDB']->prefix('ntpservices') . "` SET `reportnext` = UNIX_TIMESTAMP() + '" . mt_rand(2 * 3600 * 24, 37 * 3600 * 24) . "', `reportlast` = '" . strtotime($ntpservice['created']) . "', `updated` = UNIX_TIMESTAMP() WHERE `id` = '" . $ntpservice['id'] . "'"))
        die("SQL Failed: $sql;");
    else
        echo("\nSQL Success: $sql;");
}

$sql = "SELECT * FROM `" . $GLOBALS['APIDB']->prefix('ntpservices') . "` WHERE `reportnext` <= UNIX_TIMESTAMP() AND  `emailed`  <= UNIX_TIMESTAMP() ORDER BY RAND() asc";
$result = $GLOBALS['APIDB']->queryF($sql);
while($ntpservice = $GLOBALS['APIDB']->fetchArray($result)) {
    if (!$GLOBALS['APIDB']->queryF($sql = "UPDATE `" . $GLOBALS['APIDB']->prefix('ntpservices') . "` SET `reportnext` = UNIX_TIMESTAMP() + '" . mt_rand(11 * 3600 * 24, 37 * 3600 * 24) . "', `reportlast` = '" . $ntpservice['reportnext'] . "', `updated` = UNIX_TIMESTAMP() WHERE `id` = '" . $ntpservice['id'] . "'"))
        die("SQL Failed: $sql;");
    else
        echo("\nSQL Success: $sql;");
    $tmpplate = array();
    
    $ntpservice['key'] = md5($ntpservice['id'].$ntpservice['nameemail'].$ntpservice['companyemail'].'ntpservice'.API_URL);
    $ntpservice['form'] = getHTMLForm('editntp', $ntpservice);
    $ntpservice['api_url'] = API_URL;
    $ntpservice['pinging'] = number_format($ntpservice['pinging'], 2) . 'ms';
    $tmpplate['admin'] = $ntpservice['state'];
    
    foreach(array('pinged', 'prevping', 'emailed', 'reportnext', 'reportlast', 'online', 'offline', 'updated') as $field)
        $ntpservice[$field] = date("Y-m-d, W, D, H:i:s", $ntpservice[$field]);
    foreach(array('uptime', 'downtime') as $field) {
        if ($ntpservice[$field]==1)
            $ntpservice[$field] = 0;
        $ntpservice[$field] = formatMSASTime($ntpservice[$field] * 1000);
    }
    require_once dirname(__DIR__) . DS . 'class' . DS . 'apimailer.php';
    $mailer = new APIMailer("chronolabscoop@users.sourceforge.net", "Chronolabs Coop (ntp.snails.email)");
    $body = file_get_contents(dirname(__DIR__) . DS . 'include' . DS . 'data' . DS . 'email__' . implode("_", $tmpplate) . ".html");
    $subject = sprintf("Report on %s - Network Transit Protocol (NTP)", $ntpservice['companyname']);
    foreach($ntpservice as $field => $value)
        $body = str_replace("%$field", $value, $body);

    if ($mailer->sendMail(array($ntpservice['companyemail'] => $ntpservice['companyname']), array($ntpservice['nameemail'] => $ntpservice['name']), array('chronolabcoop@outlook.com' => 'Chronolabs Coop (BCC)'), $subject, $body, array(dirname(__DIR__) . DS . 'assets' . DS . 'docs' . DS . 'Organisational Timing-bell.pdf', dirname(__DIR__) . DS . 'assets' . DS . 'docs' . DS . 'Organisational Timing-bell.docx', dirname(__DIR__) . DS . 'assets' . DS . 'docs' . DS . 'Organisational Timing-bell.odt'), array(), true )) {
        if (!$GLOBALS['APIDB']->queryF($sql = "UPDATE `" . $GLOBALS['APIDB']->prefix('ntpservices') . "` SET `uptime` = 0, `downtime` = 0, `emailed` = UNIX_TIMESTAMP(), `updated` = UNIX_TIMESTAMP() WHERE `id` = '" . $ntpservice['id'] . "'"))
            die("SQL Failed: $sql;");
        else
            echo("\nSQL Success: $sql;");
    } else {
        $binemail = array("webmaster", "hostmaster", "careers", "accounts", "hr", "sales", "staff", "dev", "library", "chair", "feedback", "council", "board", "ceo", "dean", "enquiry", "admin", "support", "it", "it.support", "contact", "dev", "post", "students", "general", "enquiries", "enquiry", "lectures", "teachers", "staff", "board", "abuse");
        $parts = explode("@", $ntpservice['companyemail']);
        foreach($binemail as $idpre => $pre)
            if ($pre == $parts[0])
                if ($idpre = count($binemail) - 1) {
                    $newpre = $binemail[0];
                } else {
                    $newpre = $binemail[$idpre + 1];
                }
        if (!$GLOBALS['APIDB']->queryF($sql = "UPDATE `" . $GLOBALS['APIDB']->prefix('ntpservices') . "` SET `companyemail` = '" . $GLOBALS['APIDB']->escape($newpre . '@' . $parts[1]) . "' WHERE `id` = '" . $ntpservice['id'] . "'"))
            die("SQL Failed: $sql;");
        else
            echo("\nSQL Success: $sql;");
    }
}

?>
