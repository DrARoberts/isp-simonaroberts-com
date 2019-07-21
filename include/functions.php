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


if (!function_exists("formatRssTimestamp")) {
    function formatRssTimestamp($time)
    {
        $date = gmdate('D, d M Y H:i:s', (int)$time) . $TIME_ZONE;
        return $date;
    }
}

if (!function_exists("addClaim")) {

    function addClaim($hostnames, $name, $nameemail, $nameurl, $nametwitterurl, $companyname, $companyemails, $companyrbn, $companyrbntype, $companytype, $companyurl, $companytwitterurls, $keyhost, $keyisp, $keycarrier, $keyregistrar, $format) 
    {   
        $hostnames = json_encode(explode("\n", $hostnames));
        $companyemails = json_encode(explode("\n", $companyemails));
        $companytwitterurls = json_encode(explode("\n", $companytwitterurls));
        list($count) = $GLOBALS['APIDB']->fetchRow($GLOBALS['APIDB']->queryF("SELECT count(*) as `count` FROM `" . $GLOBALS['APIDB']->prefix('ntpservices') . "` WHERE `hostnames` = '" . $GLOBALS['APIDB']->escape($hostnames) . ""));
        if ($count == 0) {
            $sql = "INSERT INTO `" . $GLOBALS['APIDB']->prefix('claimableservices') . "` (`state`, `hostnames`, `name`, `nameemail`, `nameurl`, `nametwitterurl`, `companyname`, `companyemails`, `companyrbn`, `companyrbntype`, `companytype`, `companyurl`, `companytwitterurls`, `key-host`, `key-isp`, `key-carrier`, `key-registrar`) VALUES('bucky', '" . $GLOBALS['APIDB']->escape($hostnames) . "', '" . $GLOBALS['APIDB']->escape($name) . "', '" . $GLOBALS['APIDB']->escape($nameemail) . "', '" . $GLOBALS['APIDB']->escape($nameurl) . "', '" . $GLOBALS['APIDB']->escape($nametwitterurl) . "', '" . $GLOBALS['APIDB']->escape($companyname) . "', '" . $GLOBALS['APIDB']->escape($companyemails) . "', '" . $GLOBALS['APIDB']->escape($companyrbn) . "', '" . $GLOBALS['APIDB']->escape($companyrbntype) . "', '" . $GLOBALS['APIDB']->escape($companytype) . "', '" . $GLOBALS['APIDB']->escape($companyurl) . "', '" . $GLOBALS['APIDB']->escape($companytwitterurls) . "', '" . $GLOBALS['APIDB']->escape($keyhost) . "', '" . $GLOBALS['APIDB']->escape($keyisp) . "', '" . $GLOBALS['APIDB']->escape($keycarrier) . "', '" . $GLOBALS['APIDB']->escape($keyregistrar) . "')";
            if (file_exists(dirname(__DIR__) . DS . 'crons' . DS . 'querys.sql'))
                $querys = file_get_contents(dirname(__DIR__) . DS . 'crons' . DS . 'querys.sql');
            else
                $querys = "## Queries to process on mysql: " . date("Y-m-d D, W, H:i:s") . "\n##\n## Cron job:-\n##\n## */1 * * * * mysql < \"" . __DIR__ . DS . "querys.sql\" && unlink \"" . __DIR__ . DS . "querys.sql\"\n##\n##\n\nuse `" . API_DB_NAME . "`;\n\n";
            $querys .= $sql . ";\n";
            file_put_contents(dirname(__DIR__) . DS . 'crons' . DS . 'querys.sql', $querys);
        }
        return false;
    }
}

function checkEmail($email, $antispam = false)
{
    if (!$email || !preg_match('/^[^@]{1,64}@[^@]{1,255}$/', $email)) {
        return false;
    }
    $email_array      = explode('@', $email);
    $local_array      = explode('.', $email_array[0]);
    $local_arrayCount = count($local_array);
    for ($i = 0; $i < $local_arrayCount; ++$i) {
        if (!preg_match("/^(([A-Za-z0-9!#$%&'*+\/\=?^_`{|}~-][A-Za-z0-9!#$%&'*+\/\=?^_`{|}~\.-]{0,63})|(\"[^(\\|\")]{0,62}\"))$/", $local_array[$i])) {
            return false;
        }
    }
    if (!preg_match("/^\[?[0-9\.]+\]?$/", $email_array[1])) {
        $domain_array = explode('.', $email_array[1]);
        if (count($domain_array) < 2) {
            return false; // Not enough parts to domain
        }
        for ($i = 0; $i < count($domain_array); ++$i) {
            if (!preg_match("/^(([A-Za-z0-9][A-Za-z0-9-]{0,61}[A-Za-z0-9])|([A-Za-z0-9]+))$/", $domain_array[$i])) {
                return false;
            }
        }
    }
    if ($antispam) {
        $email = str_replace('@', ' at ', $email);
        $email = str_replace('.', ' dot ', $email);
    }
    
    return $email;
}


if (!function_exists("getHostsKeys")) {
    
    function getHostsKeys($mode, $format) 
    {

        switch ($mode) {
            case 'online':
                $sql = "SELECT *, md5(concat(`id`,'ntpservice','".API_URL."')) as `key` FROM `" . $GLOBALS['APIDB']->prefix('ntpservices') . "` WHERE `pinging` > 0 AND `uptime` > `downtime` AND `uptime` > 0 ORDER BY `pinging` DESC";
                break;
            case 'offline':
                $sql = "SELECT *, md5(concat(`id`,'ntpservice','".API_URL."')) as `key` FROM `" . $GLOBALS['APIDB']->prefix('ntpservices') . "` WHERE `pinging` = 0 AND `uptime` <= `downtime` ORDER BY `downtime` DESC";
                break;
        }
        $mb = 82;
        $results = array();
        $result = $GLOBALS['APIDB']->queryF($sql);
        while($row = $GLOBALS['APIDB']->fetchArray($result))
        {
            $key = nef($row['hostname']);
            unset($row['state']);
            unset($row['id']);
            $row['nameemail'] = checkEmail($row['nameemail'], true);
            $row['companyemail'] = checkEmail($row['companyemail'], true);
            foreach(array('pinged', 'prevping', 'emailed', 'reportnext', 'reportlast', 'online', 'offline', 'updated') as $field)
                if (!empty($row[$field]))
                    $row[$field] = date('Y-m-d, D, H:i:s', $row[$field]);
                else 
                    unset($row[$field]);
            foreach(array('uptime', 'downtime') as $field)
                if (!empty($row[$field]))
                    $row[$field] = formatMSASTime($row[$field]);
                else
                    unset($row[$field]);
            $mb = $mb + ((strlen(json_encode($row)) / (1024 * 1024 * 1024)) * 2);
            ini_set('memory_limit', floor($mb) . 'M');
            if (!isset($results[$key]))
                $results[$key] = $row;
            
        }
        return $results;
    }
}


if (!function_exists("getHostsLestatsKeys")) {
    
    function getHostsLestatsKeys($mode, $format) 
    {
        
        switch ($mode) {
            case 'pings':
                $sql = "SELECT md5(concat(`id`,'ntpservice','".API_URL."')) as `key`, `hostname`, `pinging` as `pinging-in-ms` FROM `" . $GLOBALS['APIDB']->prefix('ntpservices') . "` WHERE `pinging` > 0 ORDER BY `pinging` ASC";
                break;
            case 'uptime':
                $sql = "SELECT md5(concat(`id`,'ntpservice','".API_URL."')) as `key`, `hostname`, `uptime` FROM `" . $GLOBALS['APIDB']->prefix('ntpservices') . "` WHERE `uptime` > `downtime` AND `uptime` > 0  ORDER BY `uptime` DESC";
                break;
            case 'downtime':
                $sql = "SELECT md5(concat(`id`,'ntpservice','".API_URL."')) as `key`, `hostname`, `downtime` FROM `" . $GLOBALS['APIDB']->prefix('ntpservices') . "` WHERE `uptime` <= `downtime` ORDER BY `downtime` DESC";
                break;
            case 'nextping':
                $sql = "SELECT md5(concat(`id`,'ntpservice','".API_URL."')) as `key`, `hostname`, `pinged` FROM `" . $GLOBALS['APIDB']->prefix('ntpservices') . "` WHERE `pinged` > UNIX_TIMESTAMP() ORDER BY `pinged` ASC";
                break;
        }
        $mb = 82;
        $results = array();
        $result = $GLOBALS['APIDB']->queryF($sql);
        while($row = $GLOBALS['APIDB']->fetchArray($result))
        {
            $key = nef($row['hostname']);
            if (isset($row['uptime']))
                $row['uptime'] = formatMSASTime($row['uptime'] * 1000);
            if (isset($row['downtime']))
                $row['downtime'] = formatMSASTime($row['downtime'] * 1000);
            if (isset($row['pinged']))
                $row['pinged'] = date("Y-m-d W, D, H:i:s", $row['pinged']);
            $mb = $mb + ((strlen(json_encode($row)) / (1024 * 1024 * 1024)) * 2);
            ini_set('memory_limit', floor($mb) . 'M');
            if (!isset($results[$key]))
                $results[$key] = $row;
        }
        return $results;
    }
}


if (!function_exists('nef'))
{
    
    function nef($subject = '', $stripe ='-')
    {
        $replacements = array("one" => "1", "two" => "2", "three" => "3", "four" => "4", "five" => "5", "six" => "6", "seven" => "7", "eight" => "8", "nine" => "9", "zero" => "0");
        foreach($replacements as $replace => $search)
            $subject = str_replace($search, $replace, $subject);
        return sef($subject, $stripe);
    }
}

if (!function_exists('sef'))
{
    
    function sef($value = '', $stripe ='-')
    {
        return yonkOnlyAlphanumeric($value, $stripe);
    }
}


if (!function_exists('yonkOnlyAlphanumeric'))
{
    
    function yonkOnlyAlphanumeric($value = '', $stripe ='-')
    {
        $replacement_chars = array();
        $accepted = array("a","b","c","d","e","f","g","h","i","j","k","l","m","n","m","o","p","q",
            "r","s","t","u","v","w","x","y","z","0","9","8","7","6","5","4","3","2","1");
        for($i=0;$i<256;$i++){
            if (!in_array(strtolower(chr($i)),$accepted))
                $replacement_chars[] = chr($i);
        }
        $result = trim(str_replace($replacement_chars, $stripe, strtolower($value)));
        while(strpos($result, $stripe.$stripe, 0))
            $result = (str_replace($stripe.$stripe, $stripe, $result));
        while(substr($result, 0, strlen($stripe)) == $stripe)
            $result = substr($result, strlen($stripe), strlen($result) - strlen($stripe));
        while(substr($result, strlen($result) - strlen($stripe), strlen($stripe)) == $stripe)
            $result = substr($result, 0, strlen($result) - strlen($stripe));
        return($result);
    }
}
if (!function_exists("getHostsRSS")) {
    
    function getHostsRSS($mode, $items, $format) {
        $feed = array();
        $feed['link'] = API_URL;
        $feed['lastbuild'] = formatRssTimestamp(time());
        $feed['image_url'] = API_URL . '/assets/images/logo_500x500.png';
        $feed['image_width'] = 500;
        $feed['image_height'] = 500;
        switch ($mode) {
            case 'top':
                $feed['title'] = "Top NTP Services on: " . API_URL;
                $feed['desc'] = "This is the top NTP Services on: " . API_URL . " ~ they can variable and variate from time to time!";
                $sql = "SELECT md5(concat(`id`,'ntpservice','".API_URL."')) as `key`, `pinging`, `pinged`, `uptime`, `downtime`, sha1(concat((`uptime` / `pinging`), `id`,'ntpservice','".API_URL."')) as `guid`, `hostname`, `port`, `name`, `nameurl`, `companyname`, `companyurl`, `online` as `pubDate` FROM `" . $GLOBALS['APIDB']->prefix('ntpservices') . "` WHERE (`uptime` / `pinging`) > 0 HAVING (`pinged` > UNIX_TIMESTAMP() AND `pinging` > 0 AND `uptime` > 0) ORDER BY (`uptime` / `pinging`) DESC LIMIT $items";
                break;
            case 'worse':
                $feed['title'] = "Worse NTP Services on: " . API_URL;
                $feed['desc'] = "This is the worst NTP Services on: " . API_URL . " ~ they can variable and variate from time to time!";
                $sql = "SELECT md5(concat(`id`,'ntpservice','".API_URL."')) as `key`, `pinging`, `pinged`, `uptime`, `downtime`, sha1(concat((`downtime` * `pinging`), `id`,'ntpservice','".API_URL."')) as `guid`, `hostname`, `port`, `name`, `nameurl`, `companyname`, `companyurl`, `offline` as `pubDate` FROM `" . $GLOBALS['APIDB']->prefix('ntpservices') . "` WHERE (`downtime` * `pinging`) > 0 HAVING (`pinged` > UNIX_TIMESTAMP() AND `pinging` > 0  AND `downtime` > 0) ORDER BY (`downtime` * `pinging`) DESC LIMIT $items";
                break;
            case 'new':
                $feed['title'] = "New NTP Services on: " . API_URL;
                $feed['desc'] = "This is the new NTP Services on: " . API_URL . " ~ they can variable and variate from time to time!";
                $sql = "SELECT md5(concat(`id`,'ntpservice','".API_URL."')) as `key`, `pinging`, `pinged`, `uptime`, `downtime`, sha1(concat(`created`, `id`,'ntpservice','".API_URL."')) as `guid`, `hostname`, `port`, `name`, `nameurl`, `companyname`, `companyurl`, UNIX_TIMESTAMP() as `pubDate` FROM `" . $GLOBALS['APIDB']->prefix('ntpservices') . "` ORDER BY `created` DESC LIMIT $items";
                break;
        }
        
        $results = array();
        $result = $GLOBALS['APIDB']->queryF($sql);
        while($row = $GLOBALS['APIDB']->fetchArray($result))
        {
            $key = nef($row['hostname']);
            $row['title'] = $row['companyname'] . ' ~ [ ' . $row['hostname'] . ":" . $row['port'] . ' ] :: [ Ping: ' . number_format($row['pinging'], 4) . 'ms' . ' ]';
            if (isset($row['uptime']))
                $row['uptime'] = formatMSASTime($row['uptime']);
            if (isset($row['downtime']))
                $row['downtime'] = formatMSASTime($row['downtime']);
            if (isset($row['pinging']))
                $row['pinging'] = number_format($row['pinging'], 4) . 'ms';
            if (isset($row['pinged']))
                $row['pinged'] = date("Y-m-d W, D, H:i:s", $row['pinged']);
            if (isset($row['pubDate']))
                $row['pubDate'] = formatRssTimestamp($row['pubDate']);
            if (!isset($results[$key]))
                $results[$key] = $row;
        }
        if (count($results)) {
            $feeditem = file_get_contents(__DIR__ . DS . 'data' . DS . 'item.xml');
            $items = array();
            foreach($results as $key => $result) {
                $items[$key] = $feeditem;
                $keys = array_keys($result);
                sort($keys, SORT_DESC);
                foreach($keys as $field)
                    $items[$key] = str_replace("%$field", $result[$field], $items[$key]);
            }
            $feed['items'] = implode("\n\n", $items);
            $feedxml = file_get_contents(__DIR__ . DS . 'data' . DS . 'feed.xml');
            foreach($feed as $field => $value)
                $feedxml = str_replace("%$field", $value, $feedxml);
            ob_end_clean();
            header('Content-type: text/rss+xml');
            die(trim($feedxml));
        }
        return false;
    }
}

if (!function_exists("getURIData")) {
    
    /* function yonkURIData()
     *
     * 	Get a supporting domain system for the API
     * @author 		Simon Roberts (Chronolabs) simon@labs.coop
     *
     * @return 		float()
     */
    function getURIData($uri = '', $timeout = 25, $connectout = 25, $post = array(), $headers = array())
    {
        if (!function_exists("curl_init"))
        {
            die("Install PHP Curl Extension ie: $ sudo apt-get install php-curl -y");
        }
        $GLOBALS['php-curl'][md5($uri)] = array();
        if (!$btt = curl_init($uri)) {
            return false;
        }
        if (count($post)==0 || empty($post))
            curl_setopt($btt, CURLOPT_POST, false);
        else {
            $uploadfile = false;
            foreach($post as $field => $value)
                if (substr($value , 0, 1) == '@' && !file_exists(substr($value , 1, strlen($value) - 1)))
                    unset($post[$field]);
                else
                    $uploadfile = true;
            curl_setopt($btt, CURLOPT_POST, true);
            curl_setopt($btt, CURLOPT_POSTFIELDS, http_build_query($post));
            
            if (!empty($headers))
                foreach($headers as $key => $value)
                    if ($uploadfile==true && substr($value, 0, strlen('Content-Type:')) == 'Content-Type:')
                        unset($headers[$key]);
            if ($uploadfile==true)
                $headers[]  = 'Content-Type: multipart/form-data';
        }
        if (count($headers)==0 || empty($headers)) {
            curl_setopt($btt, CURLOPT_HEADER, false);
            curl_setopt($btt, CURLOPT_HTTPHEADER, array());
        } else {
            curl_setopt($btt, CURLOPT_HEADER, false);
            curl_setopt($btt, CURLOPT_HTTPHEADER, $headers);
        }
        curl_setopt($btt, CURLOPT_CONNECTTIMEOUT, $connectout);
        curl_setopt($btt, CURLOPT_TIMEOUT, $timeout);
        curl_setopt($btt, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($btt, CURLOPT_VERBOSE, false);
        curl_setopt($btt, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($btt, CURLOPT_SSL_VERIFYPEER, false);
        $data = curl_exec($btt);
        $GLOBALS['php-curl'][md5($uri)]['http']['uri'] = $uri;
        $GLOBALS['php-curl'][md5($uri)]['http']['posts'] = $post;
        $GLOBALS['php-curl'][md5($uri)]['http']['headers'] = $headers;
        $GLOBALS['php-curl'][md5($uri)]['http']['code'] = curl_getinfo($btt, CURLINFO_HTTP_CODE);
        $GLOBALS['php-curl'][md5($uri)]['header']['size'] = curl_getinfo($btt, CURLINFO_HEADER_SIZE);
        $GLOBALS['php-curl'][md5($uri)]['header']['value'] = curl_getinfo($btt, CURLINFO_HEADER_OUT);
        $GLOBALS['php-curl'][md5($uri)]['size']['download'] = curl_getinfo($btt, CURLINFO_SIZE_DOWNLOAD);
        $GLOBALS['php-curl'][md5($uri)]['size']['upload'] = curl_getinfo($btt, CURLINFO_SIZE_UPLOAD);
        $GLOBALS['php-curl'][md5($uri)]['content']['length']['download'] = curl_getinfo($btt, CURLINFO_CONTENT_LENGTH_DOWNLOAD);
        $GLOBALS['php-curl'][md5($uri)]['content']['length']['upload'] = curl_getinfo($btt, CURLINFO_CONTENT_LENGTH_UPLOAD);
        $GLOBALS['php-curl'][md5($uri)]['content']['type'] = curl_getinfo($btt, CURLINFO_CONTENT_TYPE);
        curl_close($btt);
        return $data;
    }
}

/**
 * validateMD5()
 * Validates an MD5 Checksum
 *
 * @param string $email
 * @return boolean
 */

if (!function_exists("validateMD5")) {
    function validateMD5($md5) {
        if(preg_match("/^[a-f0-9]{32}$/i", $md5)) {
            return true;
        } else {
            return false;
        }
    }
}

/**
 * validateEmail()
 * Validates an Email Address
 *
 * @param string $email
 * @return boolean
 */
if (!function_exists("validateEmail")) {
    function validateEmail($email) {
        if(preg_match("^[_a-zA-Z0-9-]+(\.[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.([0-9]{1,3})|([a-zA-Z]{2,3})|(aero|coop|info|mobi|asia|museum|name|edu))$", $email)) {
            return true;
        } else {
            return false;
        }
    }
}

/**
 * validateDomain()
 * Validates a Domain Name
 *
 * @param string $domain
 * @return boolean
 */
if (!function_exists("validateDomain")) {
    function validateDomain($domain) {
        if(!preg_match("/^([-a-z0-9]{2,100})\.([a-z\.]{2,8})$/i", $domain)) {
            return false;
        }
        return $domain;
    }
}

/**
 * validateIPv4()
 * Validates and IPv6 Address
 *
 * @param string $ip
 * @return boolean
 */
if (!function_exists("validateIPv4")) {
    function validateIPv4($ip) {
        if(filter_var($ip, FILTER_VALIDATE_IP, FILTER_FLAG_NO_RES_RANGE) === FALSE) // returns IP is valid
        {
            return false;
        } else {
            return true;
        }
    }
}
/**
 * validateIPv6()
 * Validates and IPv6 Address
 *
 * @param string $ip
 * @return boolean
 */
if (!function_exists("validateIPv6")) {
    function validateIPv6($ip) {
        if(filter_var($ip, FILTER_VALIDATE_IP, FILTER_FLAG_IPV6) === FALSE) // returns IP is valid
        {
            return false;
        } else {
            return true;
        }
    }
}

if (!function_exists("getHostnamePing")) {
    
    /* function getHostnamePing()
     *
     * @author 		Simon Roberts (Chronolabs) simon@ordinance.space
     *
     * @return 		float()
     */
    function getHostnamePing($hostname = '::1')
    {
        $result = array();
        ob_start();
        if (validateIPv6($hostname))
            exec('ping6  -c ' . mt_rand(5,13) . " $hostname", $result);
        else
            exec('ping -c ' . mt_rand(5,13) . " $hostname", $result);
        $output = implode("\n", $result) . ob_get_clean();
        ob_end_clean();
        if (!strpos($output, "100% packet loss") || !strpos($output, "not known") || !strpos($output, "name resolution")) {
            $parts = explode('\n', $output);
            $parts = explode("/", $parts[count($parts) - 1]);
            return (float)$parts[4];
        }
        if (strpos($output, "100% packet loss"))
        {
            if (getTimeFromNTP($hostname, 123) > 0) {
                $step = mt_rand(5,13);
                $odds = array();
                for($r=1;$r<=$step;$r++) {
                    $start = microtime(true) * 1000;
                    $val = getTimeFromNTP($hostname, 123);
                    $odds[$start][microtime(true) * 1000] = $val;
                }
                $avg = array();
                foreach($odds as $start => $odd)
                    foreach($odd as $finish => $value)
                        $avg[] = $finish - $start;
                $result = 0;
                foreach($avg as $id => $value)
                    if ($id>0)
                        $result = $result + $value /2;
                    else {
                        $result = $value;
                    }
                return $result;
            }
        }
        elseif (strpos($output, "not known") || !strpos($output, "name resolution"))
            return -1;
    }
}

/**
 * Returns UNIX timestamp from a NTP server (RFC 5905)
 *
 * @param  string  $host    Server host (default is pool.ntp.org)
 * @param  integer $timeout Timeout  in seconds (default is 10 seconds)
 * @return integer Number of seconds since January 1st 1970
 */
function getTimeFromNTP($host = 'ntp.snails.email', $port = 123, $timeout = 42)
{
    $socket = stream_socket_client('udp://' . $host . ':' . $port, $errno, $errstr, (int)$timeout);
    $msg = "\010" . str_repeat("\0", 47);
    fwrite($socket, $msg);
    $response = fread($socket, 48);
    fclose($socket);
    // unpack to unsigned long
    $data = unpack('N12', $response);
    // 9 =  Receive Timestamp (rec): Time at the server when the request arrived
    // from the client, in NTP timestamp format.
    $timestamp = sprintf('%u', $data[9]);
    // NTP = number of seconds since January 1st, 1900
    // Unix time = seconds since January 1st, 1970
    // remove 70 years in seconds to get unix timestamp from NTP time
    $timestamp -= 2208988800;
    return (integer)$timestamp;
}

if (!function_exists("getHostnameNTPPing")) {
    
    /* function getHostnamePing()
     *
     * @author 		Simon Roberts (Chronolabs) simon@ordinance.space
     *
     * @return 		float()
     */
    function getHostnameNTPPing($hostname = '::1', $port = 123)
    {
        $output = array();
        $ms = $num = 0;
        for($l=0; $l < mt_rand(7,19); $l++) {
            $start = microtime(true);
            $time = getTimeFromNTP($hostname, $port);
            if ($time<>0) {
                $ms += (microtime(true)) - ($start);
                $num++;
            }
        }
        if ($num>0)
            return $ms / $num;
        return false;
    }
}


if (!function_exists("formatMSASTime")) {
    
    /* function formatMSASTime()
     *
     * @author 		Simon Roberts (Chronolabs) simon@ordinance.space
     *
     * @return 		float()
     */
    function formatMSASTime($milliseconds = '')
    {
        $return = '';
        $milliseconds = $milliseconds;
        if (($milliseconds / (3600 * 24 * 7 * 4 * 12)) >= 1)
        {
            $scratch = (string)($milliseconds / (3600 * 24 * 7 * 4 * 12));
            $parts = explode(".", $scratch);
            $return .= $parts[0] . ' year' .($parts[0]>1?"s ":" ");
            $milliseconds = ((float)("0." . $parts[1])) * (3600 * 24 * 7 * 4 * 12);
        }
        if (($milliseconds / (3600 * 24 * 7 * 4)) >= 1)
        {
            $scratch = (string)($milliseconds / (3600 * 24 * 7 * 4));
            $parts = explode(".", $scratch);
            $return .= $parts[0] . ' month' .($parts[0]>1?"s ":" ");
            $milliseconds = ((float)("0." . $parts[1])) * (3600 * 24 * 7 * 4);
        }
        if (($milliseconds / (3600 * 24 * 7)) >= 1)
        {
            $scratch = (string)($milliseconds /(3600 * 24 * 7));
            $parts = explode(".", $scratch);
            $return .= $parts[0] . ' week' .($parts[0]>1?"s ":" ");
            $milliseconds = ((float)("0." . $parts[1])) * (3600 * 24 * 7);
        }
        if (($milliseconds / (3600*24)) >= 1)
        {
            $scratch = (string)($milliseconds / (3600 * 24));
            $parts = explode(".", $scratch);
            $return .= $parts[0] . ' day' .($parts[0]>1?"s ":" ");
            $milliseconds = ((float)("0." . $parts[1])) * (3600 * 24);
        }
        if (($milliseconds / 3600) >= 1)
        {
            $scratch = (string)($milliseconds / 3600);
            $parts = explode(".", $scratch);
            $return .= $parts[0] . ' hour' .($parts[0]>1?"s ":" ");
            $milliseconds = ((float)("0." . $parts[1])) * 3600;
        }
        if (($milliseconds / 60) >= 1)
        {
            $scratch = (string)($milliseconds / 60);
            $parts = explode(".", $scratch);
            $return .= $parts[0] . ' min' .($parts[0]>1?"s ":" ");
            $milliseconds = ((float)("0." . $parts[1])) * 60;
        }
        if (($milliseconds / 60) >= 1)
        {
            $scratch = (string)($milliseconds / 60);
            $parts = explode(".", $scratch);
            $return .= $parts[0] . ' sec' .($parts[0]>1?"s ":" ");
            $milliseconds = ((float)("0." . $parts[1])) * 60;
        }
        if (empty($return))
            $return = 'No Time Passed!';
        
        return $return = trim($return);
    }
}

if (!function_exists("getNTPConf")) {
    
    /* function getNTPConf()
     *
     * 	Get a supporting domain system for the API
     * @author 		Simon Roberts (Chronolabs) simon@labs.coop
     *
     * @return 		string()
     */
    function getNTPConf($mode = 'ntp.conf', $format = 'conf')
    {
        $authors = $links = $pools = $servers = array();
        $result = $GLOBALS['APIDB']->queryF($sql = "SELECT DISTINCT `name`, `nameemail`, `pinging` FROM `" . $GLOBALS['APIDB']->prefix('ntpservices') . '` WHERE `online` > `offline` AND `uptime` > `downtime` ORDER BY `pinging` ASC');
        while($row = $GLOBALS['APIDB']->fetchArray($result))
            if (!empty($row['name']) && !empty($row['nameemail']))
                if (!isset($authors[$row['nameemail']]))
                    $authors[$row['nameemail']] = sprintf("## @author          %s <%s>", $row['name'], $row['nameemail']);

                    $result = $GLOBALS['APIDB']->queryF("SELECT DISTINCT `companyname`, `companyemail`, `pinging` FROM `" . $GLOBALS['APIDB']->prefix('ntpservices') . '` WHERE  `online` > `offline` AND `uptime` > `downtime` ORDER BY `pinging` ASC');
        while($row = $GLOBALS['APIDB']->fetchArray($result))
            if (!empty($row['companyname']) && !empty($row['companyemail']))
                if (!isset($authors[$row['companyemail']]))
                    $authors[$row['companyemail']] = sprintf("## @author          %s <%s>", $row['companyname'], $row['companyemail']);
        $result = $GLOBALS['APIDB']->queryF("SELECT DISTINCT `name`, `nameurl`, `pinging` FROM `" . $GLOBALS['APIDB']->prefix('ntpservices') . '` WHERE  `online` > `offline` AND `uptime` > `downtime` ORDER BY `pinging` ASC');
        while($row = $GLOBALS['APIDB']->fetchArray($result))
            if (!empty($row['name']) && !empty($row['nameurl']))
                if (!isset($links[$row['nameurl']]))
                    $links[$row['nameurl']] = sprintf("## @link            %s %s", $row['name'], $row['nameurl']);
        $result = $GLOBALS['APIDB']->queryF("SELECT DISTINCT `companyname`, `companyurl`, `pinging` FROM `" . $GLOBALS['APIDB']->prefix('ntpservices') . '` WHERE  `online` > `offline` AND `uptime` > `downtime` ORDER BY `pinging` ASC');
        while($row = $GLOBALS['APIDB']->fetchArray($result))
            if (!empty($row['companyname']) && !empty($row['companyurl']))
                if (!isset($links[$row['companyurl']]))
                    $links[$row['companyurl']] = sprintf("## @link            %s %s", $row['companyname'], $row['companyurl']);
        $result = $GLOBALS['APIDB']->queryF("SELECT DISTINCT `hostname`, `port`, `pinging` FROM `" . $GLOBALS['APIDB']->prefix('ntpservices') . '` WHERE `typal` = "pool" AND  `online` > `offline` AND `uptime` > `downtime` ORDER BY `pinging` ASC');
        while($row = $GLOBALS['APIDB']->fetchArray($result))
            if (!empty($row['hostname']))
                if (!isset($pools[$row['hostname']]) && $row['port'] == '123')
                    $pools[$row['hostname']] = sprintf("pool %s iburst", $row['hostname']);
                elseif (!isset($pools[$row['hostname']]) && $row['port'] != '123')
                    $pools[$row['hostname'].":".$row['port']] = sprintf("pool %s:%s iburst", $row['hostname'], $row['port']);
        $result = $GLOBALS['APIDB']->queryF("SELECT DISTINCT `hostname`, `port`, `pinging` FROM `" . $GLOBALS['APIDB']->prefix('ntpservices') . '` WHERE `typal` = "server" AND  `online` > `offline` AND `uptime` > `downtime` ORDER BY `pinging` ASC');
        while($row = $GLOBALS['APIDB']->fetchArray($result))
            if (!empty($row['hostname']))
                if (!isset($servers[$row['hostname']]) && $row['port'] == '123')
                    $servers[$row['hostname']] = sprintf("server %s", $row['hostname']);
                elseif (!isset($pools[$row['hostname']]) && $row['port'] != '123')
                    $servers[$row['hostname'].":".$row['port']] = sprintf("server %s:%s", $row['hostname'], $row['port']);
    
        if (count($authors)==0)
            $authors['##'] = '## ';
        
        if (count($links)==0)
            $links['##'] = '## ';
                
        header("Context-Type: text/text");
        die(str_replace('\n\n## ', '\n## ', str_replace('%ip', $_SERVER['REMOTE_ADDR'], str_replace("%url", API_URL . $_SERVER['REQUEST_URI'], str_replace("YYYY/MM/DD HH:II:SS", date("Y-m-d W.Y, D, H:i:s"), str_replace('%servers', implode("\n", $servers), str_replace('%pools', implode("\n", $pools), str_replace('%links', implode("\n", $links), str_replace('%authors', implode("\n", $authors), file_get_contents(__DIR__ . DS . 'data' . DS . 'ntp.conf.txt'))))))))));
    
    }
}

if (!class_exists("XmlDomConstruct")) {
	/**
	 * class XmlDomConstruct
	 * 
	 * 	Extends the DOMDocument to implement personal (utility) methods.
	 *
	 * @author 		Simon Roberts (Chronolabs) simon@labs.coop
	 */
	class XmlDomConstruct extends DOMDocument {
	
		/**
		 * Constructs elements and texts from an array or string.
		 * The array can contain an element's name in the index part
		 * and an element's text in the value part.
		 *
		 * It can also creates an xml with the same element tagName on the same
		 * level.
		 *
		 * ex:
		 * <nodes>
		 *   <node>text</node>
		 *   <node>
		 *     <field>hello</field>
		 *     <field>world</field>
		 *   </node>
		 * </nodes>
		 *
		 * Array should then look like:
		 *
		 * Array (
		 *   "nodes" => Array (
		 *     "node" => Array (
		 *       0 => "text"
		 *       1 => Array (
		 *         "field" => Array (
		 *           0 => "hello"
		 *           1 => "world"
		 *         )
		 *       )
		 *     )
		 *   )
		 * )
		 *
		 * @param mixed $mixed An array or string.
		 *
		 * @param DOMElement[optional] $domElement Then element
		 * from where the array will be construct to.
		 * 
		 * @author 		Simon Roberts (Chronolabs) simon@labs.coop
		 *
		 */
		public function fromMixed($mixed, DOMElement $domElement = null) {
	
			$domElement = is_null($domElement) ? $this : $domElement;
	
			if (is_array($mixed)) {
				foreach( $mixed as $index => $mixedElement ) {
	
					if ( is_int($index) ) {
						if ( $index == 0 ) {
							$node = $domElement;
						} else {
							$node = $this->createElement($domElement->tagName);
							$domElement->parentNode->appendChild($node);
						}
					}
					 
					else {
						$node = $this->createElement($index);
						$domElement->appendChild($node);
					}
					 
					$this->fromMixed($mixedElement, $node);
					 
				}
			} else {
				$domElement->appendChild($this->createTextNode($mixed));
			}
			 
		}
		 
	}
}


function getHTMLForm($mode = '', $var = '')
{

    $form = array();
    switch ($mode)
    {
        case "subscribe":
            $form[] = "<form name='upload-aliases' method=\"POST\" enctype=\"multipart/form-data\" action=\"./uploading.php\">";
            $form[] = "\t<table class='upload-aliases' id='auth-key' style='vertical-align: top !important; min-width: 98%;'>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td style='width: 320px;'>";
            $form[] = "\t\t\t\t<label for='list'>CSV List of Aliases:&nbsp;<font style='color: rgb(250,0,0); font-size: 139%; font-weight: bold'>*</font></label>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>";
            $form[] = "\t\t\t\t<input type='textbox' name='list' id='list' size='255' value='@lists.sourceforge.net' />";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td style='width: 320px;'>";
            $form[] = "\t\t\t\t<label for='subject'>Email Subject:&nbsp;<font style='color: rgb(250,0,0); font-size: 139%; font-weight: bold'>*</font></label>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>";
            $form[] = "\t\t\t\t<input type='textbox' name='subject' id='subject' size='255' value='subscribe'/>&nbsp;&nbsp;";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>&nbsp;</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td style='width: 320px;'>";
            $form[] = "\t\t\t\t<label for='filename'>CSV List of Aliases:&nbsp;<font style='color: rgb(250,0,0); font-size: 139%; font-weight: bold'>*</font></label>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>";
            $form[] = "\t\t\t\t<input type='file' name='filename' id='filename' size='21' />&nbsp;&nbsp;";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>&nbsp;</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td style='width: auto; background-color: #feedcc; padding: 10px;' colspan='2'>";
            $form[] = "\t\t\t\tThe CSV must be a standard excel or linux format and have the four captioned top row fields of: Name, Email, Alias, Domain!<br/><br/>There is two example spreedsheets with the titles in place you can populate you can download these from: <a href='" . API_URL . "/assets/docs/csv-prop-spreedsheet.xlsx' target='_blank'>csv-prop-spreedsheet.xlsx</a> or <a href='" . API_URL . "/assets/docs/csv-prop-spreedsheet.ods' target='_blank'>csv-prop-spreedsheet.ods</a>; thanks for using the example spreedsheets to generate the correct titled CSV in the right formating!";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td>";
            $form[] = "\t\t\t\t<label for='format'>Output Format:&nbsp;<font style='color: rgb(250,0,0); font-size: 139%; font-weight: bold'>*</font></label>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td style='width: 320px;'>";
            $form[] = "\t\t\t\t<select name='format' id='format'/>";
            $form[] = "\t\t\t\t\t<option value='raw'>RAW PHP Output</option>";
            $form[] = "\t\t\t\t\t<option value='json' selected='selected'>JSON Output</option>";
            $form[] = "\t\t\t\t\t<option value='serial'>Serialisation Output</option>";
            $form[] = "\t\t\t\t\t<option value='xml'>XML Output</option>";
            $form[] = "\t\t\t\t</select>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>&nbsp;</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td colspan='3' style='padding-left:64px;'>";
            $form[] = "\t\t\t\t<input type='hidden' value='".$authkey."' name='authkey'>";
            $form[] = "\t\t\t\t<input type='hidden' value='subscribe' name='mode'>";
            $form[] = "\t\t\t\t<input type='submit' value='Upload *.csv and propogate email aliases!' name='submit' style='padding:11px; font-size:122%;'>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td colspan='3' style='padding-top: 8px; padding-bottom: 14px; padding-right:35px; text-align: right;'>";
            $form[] = "\t\t\t\t<font style='color: rgb(250,0,0); font-size: 139%; font-weight: bold;'>* </font><font  style='color: rgb(10,10,10); font-size: 99%; font-weight: bold'><em style='font-size: 76%'>~ Required Field for Form Submission</em></font>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t</table>";
            $form[] = "</form>";
            break;
        case "addclaim":
            $form[] = "<form name='add-claim' method=\"POST\" enctype=\"multipart/form-data\" action=\"" . API_URL . '/v1/addclaim.api">';
            $form[] = "\t<table class='add-ntp' id='auth-key' style='vertical-align: top !important; min-width: 98%;'>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td style='width: 499px;'>";
            $form[] = "\t\t\t\t<label for='hostnames'>ISP Hostname's:&nbsp;<font style='color: rgb(250,0,0); font-size: 139%; font-weight: bold'>*</font><br/><font style='color: rgb(50,110,166); font-size: 79%; font-weight: 400'>(Seperated by a new line!)</font></label>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>";
            $form[] = "\t\t\t\t<textarea name='hostnames' id='hostnames' cols='32' rows='4'></textarea>&nbsp;&nbsp;";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>&nbsp;</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td style='width: 499px;'>";
            $form[] = "\t\t\t\t<label for='name'>Telephantist's Name:&nbsp;<font style='color: rgb(250,0,0); font-size: 139%; font-weight: bold'>*</font></label>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>";
            $form[] = "\t\t\t\t<input type='textbox' name='name' id='name' maxlen='128' size='28' /><br/>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>&nbsp;</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td style='width: 499px;'>";
            $form[] = "\t\t\t\t<label for='nameurl'>Telephantist's URL:</label>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>";
            $form[] = "\t\t\t\t<input type='textbox' name='nameurl' id='nameurl' maxlen='250'  size='28'/><br/>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>&nbsp;</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td style='width: 499px;'>";
            $form[] = "\t\t\t\t<label for='nameurl'>Telephantist's Twitter URL:</label>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>";
            $form[] = "\t\t\t\t<input type='textbox' name='nametwitterurl' id='nametwittterurl' maxlen='250'  size='28'/><br/>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>&nbsp;</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td style='width: 499px;'>";
            $form[] = "\t\t\t\t<label for='nameemail'>Telephantist's eMail:&nbsp;<font style='color: rgb(250,0,0); font-size: 139%; font-weight: bold'>*</font></label>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>";
            $form[] = "\t\t\t\t<input type='textbox' name='nameemail' id='nameemail' maxlen='196'  size='28'/><br/>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>&nbsp;</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td style='width: 499px;'>";
            $form[] = "\t\t\t\t<label for='companyname'>Company's Name:</label>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>";
            $form[] = "\t\t\t\t<input type='textbox' name='companyname' id='companyname' maxlen='128'  size='28'/><br/>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>&nbsp;</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td style='width: 499px;'>";
            $form[] = "\t\t\t\t<label for='companyemails'>Company Emails:&nbsp;<font style='color: rgb(250,0,0); font-size: 139%; font-weight: bold'>*</font><br/><font style='color: rgb(50,110,166); font-size: 79%; font-weight: 400'>(Seperated by a new line!)</font></label>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>";
            $form[] = "\t\t\t\t<textarea name='companyemails' id='companyemails' cols='32' rows='4'></textarea>&nbsp;&nbsp;";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>&nbsp;</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td style='width: 499px;'>";
            $form[] = "\t\t\t\t<label for='companyrbn'>Company's Register Number:</label>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>";
            $form[] = "\t\t\t\t<input type='textbox' name='companyrbn' id='companyrbn' maxlen='128'  size='28'/><br/>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>&nbsp;</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td style='width: 499px;'>";
            $form[] = "\t\t\t\t<label for='companyrbntype'>Company's Register Number Type:</label>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>";
            $form[] = "\t\t\t\t<input type='textbox' name='companyrbntype' id='companyrbntype' maxlen='13'  size='8'/><br/>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>&nbsp;</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td style='width: 499px;'>";
            $form[] = "\t\t\t\t<label for='companytype'>Company's Type:</label>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>";
            $form[] = "\t\t\t\t<input type='textbox' name='companytype' id='companytype' maxlen='64'  size='28'/><br/>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>&nbsp;</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td style='width: 499px;'>";
            $form[] = "\t\t\t\t<label for='companyurl'>Company's URL:</label>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>";
            $form[] = "\t\t\t\t<input type='textbox' name='companyurl' id='companyurl' maxlen='250'  size='28'/><br/>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>&nbsp;</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td style='width: 499px;'>";
            $form[] = "\t\t\t\t<label for='companyurl'>Company's Twitter URL:<br/><font style='color: rgb(50,110,166); font-size: 79%; font-weight: 400'>(Seperated by a new line!)</font></label>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>";
            $form[] = "\t\t\t\t<textarea name='companytwitterurls' id='companytwitterurls' cols='32' rows='4'/></textarea><br/>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>&nbsp;</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td>";
            $form[] = "\t\t\t\t<label for='format'>Output Format:&nbsp;<font style='color: rgb(250,0,0); font-size: 139%; font-weight: bold'>*</font></label>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td style='width: 499px;'>";
            $form[] = "\t\t\t\t<select name='format' id='format'/>";
            $form[] = "\t\t\t\t\t<option value='raw'>RAW PHP Output</option>";
            $form[] = "\t\t\t\t\t<option value='json' selected='selected'>JSON Output</option>";
            $form[] = "\t\t\t\t\t<option value='serial'>Serialisation Output</option>";
            $form[] = "\t\t\t\t\t<option value='xml'>XML Output</option>";
            $form[] = "\t\t\t\t</select>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>&nbsp;</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td colspan='3' style='padding-left:64px;'>";
            $form[] = "\t\t\t\t<input type='hidden' value='addclaim' name='mode'>";
            $form[] = "\t\t\t\t<input type='submit' value='Add Resource Claimable Service' name='submit' style='padding:11px; font-size:122%;'>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td colspan='3' style='padding-top: 8px; padding-bottom: 14px; padding-right:35px; text-align: right;'>";
            $form[] = "\t\t\t\t<font style='color: rgb(250,0,0); font-size: 139%; font-weight: bold;'>* </font><font  style='color: rgb(10,10,10); font-size: 99%; font-weight: bold'><em style='font-size: 76%'>~ Required Field for Form Submission</em></font>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t</table>";
            $form[] = "</form>";
            break;
            
        case "editntp":
            $form[] = "<form name='edit-ntp' method=\"POST\" enctype=\"multipart/form-data\" action=\"" . API_URL . '/v1/'.$var['key'].'/editntp.api">';
            $form[] = "\t<table class='edit-ntp' id='auth-key' style='vertical-align: top !important; min-width: 98%;'>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td style='width: 499px;'>";
            $form[] = "\t\t\t\t<label for='hostname'>Hostname/IP Address:&nbsp;<font style='color: rgb(250,0,0); font-size: 139%; font-weight: bold'>*</font></label>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>";
            $form[] = "\t\t\t\t<input type='textbox' name='hostname' id='hostname' maxlen='250' size='28' value='".$var['hostname']."'/>&nbsp;&nbsp;";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>&nbsp;</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td style='width: 499px;'>";
            $form[] = "\t\t\t\t<label for='port'>Port:&nbsp;<font style='color: rgb(250,0,0); font-size: 139%; font-weight: bold'>*</font></label>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>";
            $form[] = "\t\t\t\t<input type='textbox' name='port' id='port' maxlen='5'  size='8' value='123'  value='".$var['port']."'/>&nbsp;&nbsp;";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>&nbsp;</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td style='width: 499px;'>";
            $form[] = "\t\t\t\t<label for='name'>Telephanist's Name:&nbsp;<font style='color: rgb(250,0,0); font-size: 139%; font-weight: bold'>*</font></label>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>";
            $form[] = "\t\t\t\t<input type='textbox' name='name' id='name' maxlen='128' size='28'  value='".$var['name']."'/><br/>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>&nbsp;</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td style='width: 499px;'>";
            $form[] = "\t\t\t\t<label for='nameurl'>Telephanist's URL:</label>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>";
            $form[] = "\t\t\t\t<input type='textbox' name='nameurl' id='nameurl' maxlen='250'  size='28' value='".$var['nameurl']."'/><br/>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>&nbsp;</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td style='width: 499px;'>";
            $form[] = "\t\t\t\t<label for='nameemail'>Telephanist's eMail:&nbsp;<font style='color: rgb(250,0,0); font-size: 139%; font-weight: bold'>*</font></label>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>";
            $form[] = "\t\t\t\t<input type='textbox' name='nameemail' id='nameemail' maxlen='196'  size='28'  value='".$var['nameemail']."'/><br/>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>&nbsp;</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td style='width: 499px;'>";
            $form[] = "\t\t\t\t<label for='companyname'>Company's Name:</label>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>";
            $form[] = "\t\t\t\t<input type='textbox' name='companyname' id='companyname' maxlen='128'  size='28' value='".$var['companyname']."'/><br/>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>&nbsp;</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td style='width: 499px;'>";
            $form[] = "\t\t\t\t<label for='companyemail'>Company's eMail:</label>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>";
            $form[] = "\t\t\t\t<input type='textbox' name='companyemail' id='companyemail' maxlen='196' size='28' value='".$var['companyemail']."'/><br/>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>&nbsp;</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td style='width: 499px;'>";
            $form[] = "\t\t\t\t<label for='companyrbn'>Company's Register Number:</label>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>";
            $form[] = "\t\t\t\t<input type='textbox' name='companyrbn' id='companyrbn' maxlen='128' size='28' value='".$var['companyrbn']."'/><br/>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>&nbsp;</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td style='width: 499px;'>";
            $form[] = "\t\t\t\t<label for='companyrbntype'>Company's Register Number Type:</label>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>";
            $form[] = "\t\t\t\t<input type='textbox' name='companyrbntype' id='companyrbntype' maxlen='13'  size='8' value='".$var['companyrbntype']."'/><br/>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>&nbsp;</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td style='width: 499px;'>";
            $form[] = "\t\t\t\t<label for='companytype'>Company's Type:</label>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>";
            $form[] = "\t\t\t\t<input type='textbox' name='companytype' id='companytype' maxlen='64'  size='28' value='".$var['companytype']."'/><br/>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>&nbsp;</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td style='width: 499px;'>";
            $form[] = "\t\t\t\t<label for='companyurl'>Company's URL:</label>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>";
            $form[] = "\t\t\t\t<input type='textbox' name='companyurl' id='companyurl' maxlen='250'  size='28' value='".$var['companyurl']."'/><br/>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>&nbsp;</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td>";
            $form[] = "\t\t\t\t<label for='format'>Output Format:&nbsp;<font style='color: rgb(250,0,0); font-size: 139%; font-weight: bold'>*</font></label>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td style='width: 499px;'>";
            $form[] = "\t\t\t\t<select name='format' id='format'/>";
            $form[] = "\t\t\t\t\t<option value='raw'>RAW PHP Output</option>";
            $form[] = "\t\t\t\t\t<option value='json' selected='selected'>JSON Output</option>";
            $form[] = "\t\t\t\t\t<option value='serial'>Serialisation Output</option>";
            $form[] = "\t\t\t\t\t<option value='xml'>XML Output</option>";
            $form[] = "\t\t\t\t</select>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t\t<td>&nbsp;</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td colspan='3' style='padding-left:64px;'>";
            $form[] = "\t\t\t\t<input type='hidden' value='editntp' name='mode'>";
            $form[] = "\t\t\t\t<input type='hidden' value='key' name='".$var['key']."'>";
            $form[] = "\t\t\t\t<input type='submit' value='Edit NTP Source in DB' name='submit' style='padding:11px; font-size:122%;'>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t\t\t<td colspan='3' style='padding-top: 8px; padding-bottom: 14px; padding-right:35px; text-align: right;'>";
            $form[] = "\t\t\t\t<font style='color: rgb(250,0,0); font-size: 139%; font-weight: bold;'>* </font><font  style='color: rgb(10,10,10); font-size: 99%; font-weight: bold'><em style='font-size: 76%'>~ Required Field for Form Submission</em></font>";
            $form[] = "\t\t\t</td>";
            $form[] = "\t\t</tr>";
            $form[] = "\t\t<tr>";
            $form[] = "\t</table>";
            $form[] = "</form>";
            break;
                    
    }
    return implode("\n", $form);

}


if (!function_exists("getBaseDomain")) {
    /**
     * Gets the base domain of a tld with subdomains, that is the root domain header for the network rout
     *
     * @param string $url
     *
     * @return string
     */
    function getBaseDomain($uri = '')
    {
        
        if (!defined('API_STRATA_API_URL'))
            define('API_STRATA_API_URL', 'http://strata.snails.email');
        
        static $fallout, $strata, $classes;

        if (empty($classes))
        {
            
            $attempts = 0;
            $attempts++;
            $classes = array_keys(json_decode(getURIData(API_STRATA_API_URL ."/v1/strata/json.api", 150, 100), true));
            
        }
        if (empty($fallout))
        {
            $fallout = array_keys(json_decode(getURIData(API_STRATA_API_URL ."/v1/fallout/json.api", 150, 100), true));
        }
        
        // Get Full Hostname
        $uri = strtolower($uri);
        $hostname = parse_url($uri, PHP_URL_HOST);
        if (!filter_var($hostname, FILTER_VALIDATE_IP, FILTER_FLAG_IPV6 || FILTER_FLAG_IPV4) === false)
            return $hostname;
        
        // break up domain, reverse
        $elements = explode('.', $hostname);
        $elements = array_reverse($elements);
        
        // Returns Base Domain
        if (in_array($elements[0], $classes))
            return $elements[1] . '.' . $elements[0];
        elseif (in_array($elements[0], $fallout) && in_array($elements[1], $classes))
            return $elements[2] . '.' . $elements[1] . '.' . $elements[0];
        elseif (in_array($elements[0], $fallout))
            return  $elements[1] . '.' . $elements[0];
        else
            return  $elements[1] . '.' . $elements[0];
    }
}
