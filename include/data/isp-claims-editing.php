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

global $modalhosts;
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
	<p>So you have filled out the wrong record claimant form huh? Well that fine this form will resubmit the claimant to a record position application on the other modal hosts! All you have to do is complete your information and it will be submited when you submit the form!</p>
    <h2><?php echo $GLOBALS['claim']['companyname']; ?> Record History Claim's</h2>
    <p>You need to deselect any other type of business modal that is not applicable; remember this record hostname is only for the ISP Data only, it wouldn't include hosting business information, domain registrar information or even telco carrier information.</p>
    <p style="text-align: center; font-size: 185.1831% !important; ">
        <form action="<?php echo API_URL . '/v1/' . $_REQUEST['key'] . "/closed/editing.html";; ?>" method="post">
    		<?php foreach($modalhosts as $hostmodal => $hosts)
    		    foreach($hosts as $hostname => $ssls) {
    		        foreach($ssls as $hostssl => $hosttitle) {
                switch($hostmodal) {
    		        case 'registrar':
?>			<div style="width: 100%; clear: both;">
            	<div style="width: 100%; clear: both;">
					<div style="float: left; margin-top: 8px; margin-left: 6px; margin-right: 9px;"><input type="checkbox" id="claim-registrar" name="claims[<?php echo $hostname; ?>]" value="<?php echo $hostmodal; ?>"<?php echo (in_array($hostmodal, $GLOBALS['claimant']['modals']))?'checked="checked"':''; ?><?php echo (!in_array($hostmodal, $GLOBALS['claimant']['modals'])?' disabled="disabled"':'');?>></input></div>
            		<div style="float: left; width: auto; margin-right: 11px"><label for="claim-registrar">Make Claim on <?php echo $hosttitle; ?>&nbsp;<font style="font-size: 64% !important; color: rgb(190, 40, 90);">(<a target="_blank" href="<?php echo ($hostssl=='Yes'?'https://':'http://'); ?><?php echo $hostname; ?>"><?php echo $hostname; ?></a>)</font></label></div>
            	</div>
    		</div>
<?php                 break;
                    case "host":
?>			<div style="width: 100%; clear: both;">
            	<div style="width: 100%; clear: both;">
					<div style="float: left; margin-top: 8px; margin-left: 6px; margin-right: 9px;"><input type="checkbox" id="claim-host" name="claims[<?php echo $hostname; ?>]" value="<?php echo $hostmodal; ?>"<?php echo (in_array($hostmodal, $GLOBALS['claimant']['modals']))?'checked="checked"':''; ?><?php echo (!in_array($hostmodal, $GLOBALS['claimant']['modals'])?' disabled="disabled"':'');?>></input></div>
            		<div style="float: left; width: auto; margin-right: 11px"><label for="claim-host">Make Claim on <?php echo $hosttitle; ?>&nbsp;<font style="font-size: 64% !important; color: rgb(190, 40, 90);">(<a target="_blank" href="<?php echo ($hostssl=='Yes'?'https://':'http://'); ?><?php echo $hostname; ?>"><?php echo $hostname; ?></a>)</font></label></div>
            	</div>
    		</div>
<?php                 break;
                    case "carrier":
?>			<div style="width: 100%; clear: both;">
            	<div style="width: 100%; clear: both;">
					<div style="float: left; margin-top: 8px; margin-left: 6px; margin-right: 9px;"><input type="checkbox" id="claim-carrier" name="claims[<?php echo $hostname; ?>]" value="<?php echo $hostmodal; ?>"<?php echo (in_array($hostmodal, $GLOBALS['claimant']['modals']))?'checked="checked"':''; ?><?php echo (!in_array($hostmodal, $GLOBALS['claimant']['modals'])?' disabled="disabled"':'');?>></input></div>
            		<div style="float: left; width: auto; margin-right: 11px"><label for="claim-carrier">Make Claim on <?php echo $hosttitle; ?>&nbsp;<font style="font-size: 64% !important; color: rgb(190, 40, 90);">(<a target="_blank" href="<?php echo ($hostssl=='Yes'?'https://':'http://'); ?><?php echo $hostname; ?>"><?php echo $hostname; ?></a>)</font></label></div>
            	</div>
    		</div>
<?php                 break;
                    case "isp":                      
?>			<div style="width: 100%; clear: both;">
               	<div style="width: 100%; clear: both;">
					<div style="float: left; margin-top: 8px; margin-left: 6px; margin-right: 9px;"><input type="checkbox" id="claim-isp" name="claims[<?php echo $hostname; ?>]" value="<?php echo $hostmodal; ?>"<?php echo (in_array($hostmodal, $GLOBALS['claimant']['modals']))?'checked="checked"':''; ?><?php echo (!in_array($hostmodal, $GLOBALS['claimant']['modals'])?' disabled="disabled"':'');?>></input></div>
               		<div style="float: left; width: auto; margin-right: 11px"><label for="claim-isp">Make Claim on <?php echo $hosttitle; ?>&nbsp;<font style="font-size: 64% !important; color: rgb(190, 40, 90);">(<a target="_blank" href="<?php echo ($hostssl=='Yes'?'https://':'http://'); ?><?php echo $hostname; ?>"><?php echo $hostname; ?></a>)</font></label></div>
               	</div>
       		</div>
<?php                 break;
    		    }
?>    		<input type="hidden" id="ssls" name="claims[ssl][<?php echo $hostname; ?>]" value="<?php echo $hostssl; ?>" ></input>
	<?php } 
    } ?><div style="margin-top: 19px; width: 100%"><?php 
			echo "\t\t\t<table class='add-claim' id='add-claim' style='vertical-align: top !important; min-width: 100%; margin-top: 32px; margin-bottom: 11px;'>";
            echo "\t\t\t\t<tr>";
            echo "\t\t\t\t\t<td style='width: 499px;'>";
            echo "\t\t\t\t\t\t<label for='hostnames'>ISP Hostname's:&nbsp;<font style='color: rgb(250,0,0); font-size: 139%; font-weight: bold'>*</font><br/><font style='color: rgb(50,110,166); font-size: 79%; font-weight: 400'>(Seperated by a new line!)</font></label>";
            echo "\t\t\t\t\t</td>";
            echo "\t\t\t\t\t<td>";
            echo "\t\t\t\t\t\t<textarea name='hostnames' id='hostnames' cols='32' rows='4'>" . implode("\n", json_decode($GLOBALS['claim']['hostnames'], true)) . "</textarea>&nbsp;&nbsp;";
            echo "\t\t\t\t\t</td>";
            echo "\t\t\t\t\t<td>&nbsp;</td>";
            echo "\t\t\t\t</tr>";
            echo "\t\t\t\t<tr>";
            echo "\t\t\t\t\t<td style='width: 499px;'>";
            echo "\t\t\t\t\t\t<label for='name'>Telephantist's Name:&nbsp;<font style='color: rgb(250,0,0); font-size: 139%; font-weight: bold'>*</font></label>";
            echo "\t\t\t\t\t</td>";
            echo "\t\t\t\t\t<td>";
            echo "\t\t\t\t\t\t<input type='textbox' name='claimant[name]' id='name' maxlen='128' size='28' value='" . $GLOBALS['claim']['name'] . "'/><br/>";
            echo "\t\t\t\t\t</td>";
            echo "\t\t\t\t\t<td>&nbsp;</td>";
            echo "\t\t\t\t</tr>";
            echo "\t\t\t\t<tr>";
            echo "\t\t\t\t\t<td style='width: 499px;'>";
            echo "\t\t\t\t\t\t<label for='nameurl'>Telephantist's URL:</label>";
            echo "\t\t\t\t\t</td>";
            echo "\t\t\t\t\t<td>";
            echo "\t\t\t\t\t\t<input type='textbox' name='claimant[nameurl]' id='nameurl' maxlen='250'  size='28' value='" . $GLOBALS['claim']['nameurl'] . "'/><br/>";
            echo "\t\t\t\t\t</td>";
            echo "\t\t\t\t\t<td>&nbsp;</td>";
            echo "\t\t\t\t</tr>";
            echo "\t\t\t\t<tr>";
            echo "\t\t\t\t\t<td style='width: 499px;'>";
            echo "\t\t\t\t\t\t<label for='nameurl'>Telephantist's Twitter URL:</label>";
            echo "\t\t\t\t\t</td>";
            echo "\t\t\t\t\t<td>";
            echo "\t\t\t\t\t\t<input type='textbox' name='claimant[nametwitterurl]' id='nametwittterurl' maxlen='250'  size='28' value='" . $GLOBALS['claim']['nametwitterurl'] . "'/><br/>";
            echo "\t\t\t\t\t</td>";
            echo "\t\t\t\t\t<td>&nbsp;</td>";
            echo "\t\t\t\t</tr>";
            echo "\t\t\t\t<tr>";
            echo "\t\t\t\t\t<td style='width: 499px;'>";
            echo "\t\t\t\t\t\t<label for='nameemail'>Telephantist's eMail:&nbsp;<font style='color: rgb(250,0,0); font-size: 139%; font-weight: bold'>*</font></label>";
            echo "\t\t\t\t\t</td>";
            echo "\t\t\t\t\t<td>";
            echo "\t\t\t\t\t\t<input type='textbox' name='claimant[nameemail]' id='nameemail' maxlen='196'  size='28' value='" . $GLOBALS['claim']['nameemail'] . "'/><br/>";
            echo "\t\t\t\t\t</td>";
            echo "\t\t\t\t\t<td>&nbsp;</td>";
            echo "\t\t\t\t</tr>";
            echo "\t\t\t\t<tr>";
            echo "\t\t\t\t\t<td style='width: 499px;'>";
            echo "\t\t\t\t\t\t<label for='companyname'>Company's Name:</label>";
            echo "\t\t\t\t\t</td>";
            echo "\t\t\t\t\t<td>";
            echo "\t\t\t\t\t\t<input type='textbox' name='claimant[companyname]' id='companyname' maxlen='128'  size='28' value='" . $GLOBALS['claim']['companyname'] . "'/><br/>";
            echo "\t\t\t\t\t</td>";
            echo "\t\t\t\t\t<td>&nbsp;</td>";
            echo "\t\t\t\t</tr>";
            echo "\t\t\t\t<tr>";
            echo "\t\t\t\t\t<td style='width: 499px;'>";
            echo "\t\t\t\t\t\t<label for='companyemails'>Company Emails:&nbsp;<font style='color: rgb(250,0,0); font-size: 139%; font-weight: bold'>*</font><br/><font style='color: rgb(50,110,166); font-size: 79%; font-weight: 400'>(Seperated by a new line!)</font></label>";
            echo "\t\t\t\t\t</td>";
            echo "\t\t\t\t\t<td>";
            echo "\t\t\t\t\t\t<textarea name='claimant[companyemails]' id='companyemails' cols='32' rows='4'>" . implode("\n", json_decode($GLOBALS['claim']['companyemails'], true)) . "</textarea>&nbsp;&nbsp;";
            echo "\t\t\t\t\t</td>";
            echo "\t\t\t\t\t<td>&nbsp;</td>";
            echo "\t\t\t\t</tr>";
            echo "\t\t\t\t<tr>";
            echo "\t\t\t\t\t<td style='width: 499px;'>";
            echo "\t\t\t\t\t\t<label for='companyrbn'>Company's Register Number:</label>";
            echo "\t\t\t\t\t</td>";
            echo "\t\t\t\t\t<td>";
            echo "\t\t\t\t\t\t<input type='textbox' name='claimant[companyrbn]' id='companyrbn' maxlen='128'  size='28' value='" . $GLOBALS['claim']['companyrbn'] . "'/><br/>";
            echo "\t\t\t\t\t</td>";
            echo "\t\t\t\t\t<td>&nbsp;</td>";
            echo "\t\t\t\t</tr>";
            echo "\t\t\t\t<tr>";
            echo "\t\t\t\t\t<td style='width: 499px;'>";
            echo "\t\t\t\t\t\t<label for='companyrbntype'>Company's Register Number Type:</label>";
            echo "\t\t\t\t\t</td>";
            echo "\t\t\t\t\t<td>";
            echo "\t\t\t\t\t\t<input type='textbox' name='claimant[companyrbntype]' id='companyrbntype' maxlen='13'  size='8' value='" . $GLOBALS['claim']['companyrbntype'] . "'/><br/>";
            echo "\t\t\t\t\t</td>";
            echo "\t\t\t\t\t<td>&nbsp;</td>";
            echo "\t\t\t\t</tr>";
            echo "\t\t\t\t<tr>";
            echo "\t\t\t\t\t<td style='width: 499px;'>";
            echo "\t\t\t\t\t\t<label for='companytype'>Company's Type:</label>";
            echo "\t\t\t\t\t</td>";
            echo "\t\t\t\t\t<td>";
            echo "\t\t\t\t\t\t<input type='textbox' name='claimant[companytype]' id='companytype' maxlen='64'  size='28' value='" . $GLOBALS['claim']['companytype'] . "'/><br/>";
            echo "\t\t\t\t\t</td>";
            echo "\t\t\t\t\t<td>&nbsp;</td>";
            echo "\t\t\t\t</tr>";
            echo "\t\t\t\t<tr>";
            echo "\t\t\t\t\t<td style='width: 499px;'>";
            echo "\t\t\t\t\t\t<label for='companyurl'>Company's URL:</label>";
            echo "\t\t\t\t\t</td>";
            echo "\t\t\t\t\t<td>";
            echo "\t\t\t\t\t\t<input type='textbox' name='claimant[companyurl]' id='companyurl' maxlen='250'  size='28' value='" . $GLOBALS['claim']['companyurl'] . "'/><br/>";
            echo "\t\t\t\t\t</td>";
            echo "\t\t\t\t\t<td>&nbsp;</td>";
            echo "\t\t\t\t</tr>";
            echo "\t\t\t\t<tr>";
            echo "\t\t\t\t\t<td style='width: 499px;'>";
            echo "\t\t\t\t\t\t<label for='companyurl'>Company's Twitter URL:<br/><font style='color: rgb(50,110,166); font-size: 79%; font-weight: 400'>(Seperated by a new line!)</font></label>";
            echo "\t\t\t\t\t</td>";
            echo "\t\t\t\t\t<td>";
            echo "\t\t\t\t\t\t<textarea name='claimant[companytwitterurls]' id='companytwitterurls' cols='32' rows='4'/>" . implode("\n", json_decode($GLOBALS['claim']['companytwitterurls'], true)) . "</textarea><br/>";
            echo "\t\t\t\t\t</td>";
            echo "\t\t\t\t\t<td>&nbsp;</td>";
            echo "\t\t\t\t</tr>";
            echo "\t\t\t\t\t<td colspan='3' style='padding-left:64px;'>";
            echo "\t\t\t\t\t\t<input type='hidden' value='addclaim' name='claimant[mode]'>";
            echo "\t\t\t\t\t\t<input type='hidden' value='json' name='claimant[format]'>";
            echo "\t\t\t\t\t\t<input type='hidden' value='" . $GLOBALS['claim']['key-session'] ."' name='claimant[key-session]'>";
            echo "\t\t\t\t\t\t<input type='hidden' value='" . $GLOBALS['claim']['key-isp'] ."' name='claimant[key-isp]'>";
            echo "\t\t\t\t\t\t<input type='hidden' value='" . $GLOBALS['claim']['key-host'] ."' name='claimant[key-host]'>";
            echo "\t\t\t\t\t\t<input type='hidden' value='" . $GLOBALS['claim']['key-carrier'] ."' name='claimant[key-carrier]'>";
            echo "\t\t\t\t\t\t<input type='hidden' value='" . $GLOBALS['claim']['key-registrar'] ."' name='claimant[key-registrar]'>";
            echo "\t\t\t\t\t</td>";
            echo "\t\t\t\t</tr>";
            echo "\t\t\t\t<tr>";
            echo "\t\t\t\t\t<td colspan='3' style='padding-top: 8px; padding-bottom: 14px; padding-right:35px; text-align: right;'>";
            echo "\t\t\t\t\t\t<font style='color: rgb(250,0,0); font-size: 139%; font-weight: bold;'>* </font><font  style='color: rgb(10,10,10); font-size: 99%; font-weight: bold'><em style='font-size: 76%'>~ Required Field for Form Submission</em></font>";
            echo "\t\t\t\t\t</td>";
            echo "\t\t\t\t</tr>";
            echo "\t\t\t\t<tr>";
            echo "\t\t\t</table>";
            ?>
            </div>
    		<div style="width: auto; clear: both; margin-left: auto; margin-right: auto; margin-top: 3px;">
    			<input type="submit" id="submit" name="submit" value="Close Claim & Save" ></input>
    			<input type="hidden" id="type" name="type" value="claims" ></input>
    		</div>
        </form>
    </p>
</div>
</html>
<?php 
