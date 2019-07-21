<?php
/**
 * DNS Zone Propogation REST Services API
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
 * @since           1.0.3
 * @author          Dr. Simon Antony Roberts <simon@snails.email>
 * @version         1.0.3
 * @description		A REST API for the creation and management of emails/forwarders and domain name parks for email
 * @link            http://internetfounder.wordpress.com
 * @link            https://github.com/Chronolabs-Cooperative/Emails-API-PHP
 * @link            https://sourceforge.net/p/chronolabs-cooperative
 * @link            https://facebook.com/ChronolabsCoop
 * @link            https://twitter.com/ChronolabsCoop
 * 
 */



$sql = "SELECT `title` FROM `" . $GLOBALS['APIDB']->prefix('lists') . "` WHERE `hostname` LIKE '" . parse_url(API_URL, PHP_URL_HOST) . "'";
list($pagetitle) = $GLOBALS['APIDB']->fetchRow($GLOBALS['APIDB']->queryF($sql));

if (empty($_SESSION['twitter']['user']['username'])) { 
    require_once dirname(dirname(__DIR__)) . DS . 'class' . DS . 'TwitterAPIExchange.php';
    $url = 'https://api.twitter.com/oauth/request_token';
    $request_method = 'POST';
    $twitter_instance = new TwitterAPIExchange($GLOBALS['twitter']['settings']);
    $query = $twitter_instance->setPostfields(array('oauth_callback' => API_URL . '/kickback.php'))->buildOauth($url, $request_method)->performRequest();
    parse_str($query, $_SESSION['twitter']['request']);
}

    ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta property="og:title" content="<?php echo $pagetitle; ?>"/>
<meta property="og:type" content="api<?php echo API_TYPE; ?>"/>
<meta property="og:image" content="<?php echo API_URL; ?>/assets/images/logo_500x500.png"/>
<meta property="og:url" content="<?php echo (isset($_SERVER["HTTPS"])?"https://":"http://").$_SERVER["HTTP_HOST"].$_SERVER["REQUEST_URI"]; ?>" />
<meta property="og:site_name" content="<?php echo API_VERSION; ?> - <?php echo API_LICENSE_COMPANY; ?>"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="rating" content="general" />
<meta http-equiv="author" content="wishcraft@users.sourceforge.net" />
<meta http-equiv="copyright" content="<?php echo API_LICENSE_COMPANY; ?> &copy; <?php echo date("Y"); ?>" />
<meta http-equiv="generator" content="Chronolabs Cooperative (<?php echo $place['iso3']; ?>)" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?php echo $pagetitle; ?> || <?php echo API_LICENSE_COMPANY; ?></title>
<link rel="stylesheet" href="<?php echo API_URL; ?>/assets/css/style.css" type="text/css" />
<!-- Custom Fonts -->
<link href="<?php echo API_URL; ?>/assets/media/Labtop/style.css" rel="stylesheet" type="text/css">
<link href="<?php echo API_URL; ?>/assets/media/Labtop Bold/style.css" rel="stylesheet" type="text/css">
<link href="<?php echo API_URL; ?>/assets/media/Labtop Bold Italic/style.css" rel="stylesheet" type="text/css">
<link href="<?php echo API_URL; ?>/assets/media/Labtop Italic/style.css" rel="stylesheet" type="text/css">
<link href="<?php echo API_URL; ?>/assets/media/Labtop Superwide Boldish/style.css" rel="stylesheet" type="text/css">
<link href="<?php echo API_URL; ?>/assets/media/Labtop Thin/style.css" rel="stylesheet" type="text/css">
<link href="<?php echo API_URL; ?>/assets/media/Labtop Unicase/style.css" rel="stylesheet" type="text/css">
<link href="<?php echo API_URL; ?>/assets/media/LHF Matthews Thin/style.css" rel="stylesheet" type="text/css">
<link href="<?php echo API_URL; ?>/assets/media/Life BT Bold/style.css" rel="stylesheet" type="text/css">
<link href="<?php echo API_URL; ?>/assets/media/Life BT Bold Italic/style.css" rel="stylesheet" type="text/css">
<link href="<?php echo API_URL; ?>/assets/media/Prestige Elite/style.css" rel="stylesheet" type="text/css">
<link href="<?php echo API_URL; ?>/assets/media/Prestige Elite Bold/style.css" rel="stylesheet" type="text/css">
<link href="<?php echo API_URL; ?>/assets/media/Prestige Elite Normal/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<?php echo API_URL; ?>/assets/css/gradients.php" type="text/css" />
<link rel="stylesheet" href="<?php echo API_URL; ?>/assets/css/shadowing.php" type="text/css" />

</head>
<body>
<div class="main">
	<img style="float: right; margin: 11px; width: auto; height: auto; clear: none;" src="<?php echo API_URL; ?>/assets/images/logo_350x350.png" />
    <h1><?php echo $GLOBALS['claim']['companyname']; ?> -- <?php echo $pagetitle; ?></h1>
    <?php if (count(json_decode($GLOBALS['claim']['companytwitterurls']), true) && $GLOBALS['claim']['companytwitterurls'] != '[""]') { ?>
    <h2>Twitter Authentication for Actioning Claim</h2>
    <p>You need to have access to one of the following Twitter Accounts and be able to Authenticate them on this machine you are on now which will immediately take you to start editing the record for the <?php echo $pagetitle; ?>.</p>
    <p style="text-align: center; font-size: 245.02% !important; "><?php foreach(json_decode($GLOBALS['claim']['companytwitterurls'], true) as $twiturl) {
        if (!empty($twiturl)) {
            $screen_name = str_replace(array('http://', 'https://', 'twitter.com', '/', 'www.'), "", $twiturl); ?><a href="https://api.twitter.com/oauth/authorize?oauth_token=<?php echo $_SESSION['twitter']['request']['oauth_token']; ?>&screen_name=<?php echo $screen_name; ?>">@<?php echo $screen_name; ?></a>&nbsp;<?php 
        }
    }?></p>
	<?php } ?>
	<?php if (count(json_decode($GLOBALS['claim']['hostnames']), true) && $GLOBALS['claim']['hostnames'] != '[""]') { ?>
    <h2>Email Authentication for Actioning Claim</h2>
    <p>You need to have access to and email address on one of the following netbios hostnames it can be a subdomain on it, you will be emailed a ticket and URL that will allow you to capture and edit the record for till finished for the <?php echo $pagetitle; ?>.</p>
    <p>You can have more than one person edit the record and is better if you contact more than one person with the invite editing url so you get large comphrensive data!</p>
    <?php foreach(json_decode($GLOBALS['claim']['hostnames'], true) as $host) {
        if (!empty($host)) {
            ?><p style="text-align: center; font-size: 185.1831% !important; "><strong>username@<?php echo $host; ?></strong>&nbsp;<em>or</em>&nbsp;<strong>username@*.<?php echo $host; ?></strong></p><?php 
        }
    }?>
    <p style="text-align: center; font-size: 185.1831% !important; ">
        <form action="<?php echo $_SESSION['return-url']; ?>" method="post">
        <?php if (isset($GLOBALS['invites-emailed'])) { ?>
        	<div style="width: 100%; clear: both;">
            	<div style="width: 100%; clear: both;">
            		<div style="float: left; width: 444px; margin-right: 11px"><label for="emails">Email Sent To Just Now:</label></div>
            		<div style="float: left;" id="emails"><?php foreach($GLOBALS['invites-emailed'] as $email) { ?><?php echo $email; ?>;&nbsp;<?php } ?></div>
            	</div>
    		</div>
    		<?php } ?>
        	<div style="width: 100%; clear: both;">
            	<div style="width: 100%; clear: both;">
            		<div style="float: left; width: 444px; margin-right: 11px"><label for="name">Email Sent By the Name/Person:</label></div>
            		<div style="float: left;"><input type="text" id="name" name="name" size="42" value="<?php echo $_REQUEST['name']; ?>"></input></div>
            	</div>
    		</div>
        	<div style="width: 100%; clear: both;">
            	<div style="width: 100%; clear: both;">
            		<div style="float: left; width: 444px; margin-right: 11px"><label for="email">Email's for editing invite URL:<br/><span style="font-size: 75% !important;">(Seperated by a New Line)</span></label></div>
            		<div style="float: left;"><textarea id="email" name="email" cols="42" rows="11"></textarea></div>
            	</div>
    		</div>
    		<div style="width: 100%; clear: both; margin-left: 455px;">
    			<input type="submit" id="submit" name="submit" value="Email me the Invite Editing URL!" ></input>
    		</div>
        </form>
    </p>
	<?php } ?>
</div>
</html>
<?php 
