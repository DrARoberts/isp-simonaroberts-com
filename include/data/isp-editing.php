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



$sql = "SELECT `title`, `modal` FROM `" . $GLOBALS['APIDB']->prefix('lists') . "` WHERE `hostname` LIKE '" . parse_url(API_URL, PHP_URL_HOST) . "'";
list($pagetitle, $modal) = $GLOBALS['APIDB']->fetchRow($GLOBALS['APIDB']->queryF($sql));

$othermodal = array();
$sql = "SELECT DISTINCT `modal` FROM `" . $GLOBALS['APIDB']->prefix('lists') . "` WHERE `modal` NOT LIKE '" . $modal . "' GROUP BY `modal` ORDER BY `modal` ASC";
$result = $GLOBALS['APIDB']->queryF($sql);
while( $row = $GLOBALS['APIDB']->fetchArray($result)) 
    $othermodal[$row['modal']] = $row['modal'];
    
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

    <h1><?php echo $GLOBALS['claim']['companyname']; ?> -- <?php echo $pagetitle; ?></h1>
	<p>Record Modal is the basis other than this record what is also included in your business models on the other services lists registrar's.</p>
    <h2><?php echo $GLOBALS['claim']['companyname']; ?> Modal's</h2>
    <p>You need to select any other type of business modal you have in your model; remember this record is only for the ISP Data only, it wouldn't include hosting business information, domain registrar information or even telco carrier information.</p>
    <p style="text-align: center; font-size: 185.1831% !important; ">
        <form action="<?php echo API_URL . '/v1/' . $_REQUEST['key'] . "/countries/editing.html";; ?>" method="post">
        	<div style="width: 100%; clear: both;">
            	<div style="width: 100%; clear: both;">
					<div style="float: left; margin-top: 8px; margin-left: 6px; margin-right: 9px;"><input type="checkbox" id="modal-<?php echo $modal; ?>" name="modal[]" value="<?php echo $modal; ?>"<?php echo (in_array($modal, $GLOBALS['claimant']['modals']))?'checked="checked"':''; ?><?php echo (!empty($GLOBALS['claim'][$modal."-key"])?' disabled="disabled"':'');?>></input></div>
            		<div style="float: left; width: auto; margin-right: 11px"><label for="modal-<?php echo $modal; ?>">ISP Provider as a Business&nbsp;<font style="font-size: 64% !important; color: rgb(190, 40, 90);">(That is you provide internet services and links to the internet)</font></label></div>
            	</div>
    		</div>
    		<?php foreach($othermodal as $modals) { 
    		    switch($modals) {
    		        case 'registrar':
?>			<div style="width: 100%; clear: both;">
            	<div style="width: 100%; clear: both;">
					<div style="float: left; margin-top: 8px; margin-left: 6px; margin-right: 9px;"><input type="checkbox" id="modal-registrar" name="modal[]" value="<?php echo $modals; ?>"<?php echo (in_array($modals, $GLOBALS['claimant']['modals']))?'checked="checked"':''; ?><?php echo (!empty($GLOBALS['claim'][$modals."-key"])?' disabled="disabled"':'');?>></input></div>
            		<div style="float: left; width: auto; margin-right: 11px"><label for="modal-registrar">Realm/TLD/gTLD Registrar as a Business&nbsp;<font style="font-size: 64% !important; color: rgb(190, 40, 90);">(That is you provide domain registrarion for the internet)</font></label></div>
            	</div>
    		</div>
<?php                 break;
                    case "host":
?>			<div style="width: 100%; clear: both;">
            	<div style="width: 100%; clear: both;">
					<div style="float: left; margin-top: 8px; margin-left: 6px; margin-right: 9px;"><input type="checkbox" id="modal-host" name="modal[]" value="<?php echo $modals; ?>"<?php echo (in_array($modals, $GLOBALS['claimant']['modals']))?'checked="checked"':''; ?><?php echo (!empty($GLOBALS['claim'][$modals."-key"])?' disabled="disabled"':'');?>></input></div>
            		<div style="float: left; width: auto; margin-right: 11px"><label for="modal-host">Website/Server Hosting&nbsp;<font style="font-size: 64% !important; color: rgb(190, 40, 90);">(That is you provide server space on the internet)</font></label></div>
            	</div>
    		</div>
<?php                 break;
                    case "carrier":
?>			<div style="width: 100%; clear: both;">
            	<div style="width: 100%; clear: both;">
					<div style="float: left; margin-top: 8px; margin-left: 6px; margin-right: 9px;"><input type="checkbox" id="modal-carrier" name="modal[]" value="<?php echo $modals; ?>"<?php echo (in_array($modals, $GLOBALS['claimant']['modals']))?'checked="checked"':''; ?><?php echo (!empty($GLOBALS['claim'][$modals."-key"])?' disabled="disabled"':'');?>></input></div>
            		<div style="float: left; width: auto; margin-right: 11px"><label for="modal-carrier">Telco Mobile Phone / Phone Services&nbsp;<font style="font-size: 64% !important; color: rgb(190, 40, 90);">(That is you provide telco phone carrier services)</font></label></div>
            	</div>
    		</div>
<?php                 break;
                    case "isp":                      
?>			<div style="width: 100%; clear: both;">
               	<div style="width: 100%; clear: both;">
					<div style="float: left; margin-top: 8px; margin-left: 6px; margin-right: 9px;"><input type="checkbox" id="modal-isp" name="modal[]" value="<?php echo $modals; ?>"<?php echo (in_array($modals, $GLOBALS['claimant']['modals']))?'checked="checked"':''; ?><?php echo (!empty($GLOBALS['claim'][$modals."-key"])?' disabled="disabled"':'');?>></input></div>
               		<div style="float: left; width: auto; margin-right: 11px"><label for="modal-isp">ISP Provider as a Business&nbsp;<font style="font-size: 64% !important; color: rgb(190, 40, 90);">(That is you provide internet services and links to the internet)</font></label></div>
               	</div>
       		</div>
<?php                 break;
    		    }
?>    		
	<?php } ?>
	
    		<div style="width: auto; clear: both; margin-left: auto; margin-right: auto; margin-top: 16px;">
    			<input type="submit" id="submit" name="submit" value="Goto the Next Step (Countries)" ></input>
    			<input type="hidden" id="type" name="type" value="modal" ></input>
    			<?php if (!empty($GLOBALS['claim'][$modal."-key"])) { ?><input type="hidden" id="modal" name="modal[]" value="<?php echo $modal;?>" ></input><?php } ?>
    			<?php foreach($othermodal as $modals) { ?><?php if (!empty($GLOBALS['claim'][$modals."-key"])) { ?><input type="hidden" id="modal" name="modal[]" value="<?php echo $modals;?>" ></input><?php } ?>
<?php } ?>
    		</div>
        </form>
    </p>
</div>
</html>
<?php 
