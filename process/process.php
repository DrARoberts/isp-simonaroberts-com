<?php
require dirname(__DIR__) . DIRECTORY_SEPARATOR . 'mainfile.php';
session_start();

$headers =  array(  'navigator.appName'     => 'Netscape', 
                    'navigator.appCodeName' => 'Mozilla', 
                    'navigator.appVersion'  => '5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/73.0.3683.86 Chrome/73.0.3683.86 Safari/537.36'
            );
$sh = explode("\n", file_get_contents('lodge.sh'));

$_SESSION['upto']  = 1;
$upto = $_SESSION['upto'];
for($y=$upto;$y<1160;$y++) {
    
    echo ($file = 'PublicTimeServer' . str_repeat("0", 6 - strlen($y)) . $y) . "\n\n";
    file_put_contents(__DIR__ . DS . $file, $buffer = getURIData("http://support.ntp.org/bin/view/Servers/$file"));
    die($buffer);
    if (file_exists(__DIR__ . DS . $file) && filesize(__DIR__ . DS . $file) > 0) {
        $parts = explode("ServerForm", strip_tags(file_get_contents(__DIR__ . DS . $file)));
        $parts = explode("Edit", $parts[1]);
        unlink($file);
        die($parts[0]);
        $hst = explode("Hostname", $parts[0]);
        $hsta = explode("IP Address", $hst[1]);
        $hostname = str_replace(array(" ", "\n", "<br/>", "<br />", "<br>"), "", $hsta[0]);
        $companyname = '';
        if (strpos($parts[0], "HostOrganization")) {
            $hst = explode("HostOrganization", $parts[0]);
            $hsta = explode("\nGeographicCoordinates", $hst[1]);
            $companyname = str_replace(array(" ", "\n", "<br/>", "<br />", "<br>"), "", $hsta[0]);
        }
        if (strlen($companyname)==0) {
            $hst = explode("ServerLocation", $parts[0]);
            $hsta = explode("GeographicCoordinates", $hst[1]);
            $companyname = $hsta[0];
        }
        $hst = explode("ServerContact\n", $parts[0]);
        $hsta = explode("\n", $hst[1]);
        $party = $hsta[0];
        $party = explode(" ", str_replace(array("(", ")", "{", "}", "[", "]", "<", ">"), " ", $party));
        $companyemail = "simonxaies@gmail.com";
        foreach($party as $dj)
            if (checkEmail($dj) == true)
                $companyemail = $dj;
            
        $hst = explode("@", $companyemail);
        $companyurl = "http://" . $hst[1];
        
        echo "$file = $hostname\n";
        $sh[] = die("wget \"http://ntp.snails.email:80/v1/addntp.api?format=xml&mode=addntp&hostname=$hostname&port=123&name=Dr.%20Simon%20A.%20Roberts&nameurl=" . urlencode("https://internetfounderwordpress.com") . "&nameemail=" . urlencode("simonxaies@gmail.com") . "&companyname=" . urlencode($companyname) . "&companyemail=" . urlencode($companyemail) . "&companyurl=" . urlencode($companyurl) . "\"");
     
        file_put_contents("lodge.sh", implode("\n", $sh));
    } else {
        if (file_exists("missing.php"))
            $missing = @include(__DIR__ . DS . "missing.php");
        if (!isset($missing))
            $missing = array();
        $missing[$file] = $file;
        file_put_contents(__DIR__ . DS . "missing.php", "<?php\n\nreturn " . var_export($missing) . ";\n\n?>");
    }
    $_SESSION['upto']  = $y;
}