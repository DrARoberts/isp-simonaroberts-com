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

$continents = array();
$countries = json_decode(getURIData('http://places.snails.email/v3/list/list/json.api', 180, 180, array()), true);
foreach($countries as $country)
    $continents[$country['Continent']] = $country['Continent'];
sort($continents, SORT_ASC);

$sql = "SELECT `title`, `modal` FROM `" . $GLOBALS['APIDB']->prefix('lists') . "` WHERE `hostname` LIKE '" . parse_url(API_URL, PHP_URL_HOST) . "'";
list($pagetitle, $modal) = $GLOBALS['APIDB']->fetchRow($GLOBALS['APIDB']->queryF($sql));

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
	<p>This is only of countries which your business has physical addresses assigned within; you must specify all countries your business has office and address in for later on in the assigning of the data.</p>
	<?php if (!isset($GLOBALS['claimant']['countries'])) { ?>
    <h2><?php echo $GLOBALS['claim']['companyname']; ?> Countries</h2>
    <p>You need to select any countries your ISP operates in only, this is only internet service provision in links in domestic + commerical + government environments.</p>
    <p style="text-align: center; font-size: 135.1831% !important; ">
        <form action="<?php echo API_URL . '/v1/' . $_REQUEST['key'] . "/departments/editing.html";; ?>" method="post">
        	<?php 
    	if (!isset($GLOBALS['claimant']['countries']) || empty($GLOBALS['claimant']['countries'])) {
        	foreach($continents as $continent) { ?>
        	<h3><?php echo $continent; ?></h3>
<div style="clear: both;">
        	<?php      foreach($countries as $country) { 
        	    if ($country['Continent'] == $continent) {
    ?>        	<div style="width: auto; margin-left: auto; margin-right: auto; float: left; margin-bottom: 11px; padding: 3px;">
                	<div style="width: auto; margin-left: 6px; margin-right: 6px;">
                		<div style="float: left; width: auto; margin-right: 9px"><label for="<?php echo strtolower(sef($country['Country'] ,'')); ?>"><?php echo $country['Country']; ?></label></div>
                		<div style="float: left;"><input type="check" id="<?php echo strtolower(sef($country['Country'] ,'')); ?>" name="countries[<?php echo $country['ISO2']; ?>]" value="<?php echo $country['ISO3']; ?>"<?php echo (in_array($country['ISO3'], $GLOBALS['claimant']['countries']))?'checked="checked"':''; ?>></input></div>
                	</div>
        		</div>
    		
    		<?php         }
        	       }
?>             </div>
<?php 
        	}

    	} else { ?>
    	    <h2>Selected Countries for <?php echo $GLOBALS['claim']['companyname']; ?></h2>
<?php 
        foreach($GLOBALS['claimant']['countries'] as $iso2 => $iso3) { ?>
        	<?php      foreach($countries as $country) { 
        	    if ($country['ISO3'] == $iso3) {
?>        	<div style="width: auto; margin-left: auto; margin-right: auto; float: left; margin-bottom: 11px; padding: 3px;">
            	<div style="width: auto; margin-left: 6px; margin-right: 6px;">
            		<div style="float: left; width: auto; margin-right: 9px"><label for="<?php echo strtolower(sef($country['Country'] ,'')); ?>"><?php echo $country['Country']; ?></label></div>
            		<div style="float: left;"><input type="check" id="<?php echo strtolower(sef($country['Country'] ,'')); ?>" name="countries[<?php echo $country['ISO2']; ?>]" value="<?php echo $country['ISO3']; ?>"<?php echo (in_array($country['ISO3'], $GLOBALS['claimant']['countries']))?'checked="checked"':''; ?>></input></div>
            	</div>
    		</div>
    		<?php         }
        	       }
                }
                foreach($continents as $continent) { ?>
        	<h3><?php echo $continent; ?></h3>
			<div style="clear: both;">
        	<?php      foreach($countries as $country) { 
        	    if ($country['Continent'] == $continent && !in_array($country['ISO3'], $GLOBALS['claimant']['countries'])) {
    ?>        	<div style="width: auto; margin-left: auto; margin-right: auto; float: left; margin-bottom: 11px; padding: 3px;">
                	<div style="width: auto; margin-left: 6px; margin-right: 6px;">
                		<div style="float: left; width: auto; margin-right: 9px"><label for="<?php echo strtolower(sef($country['Country'] ,'')); ?>"><?php echo $country['Country']; ?></label></div>
                		<div style="float: left;"><input type="check" id="<?php echo strtolower(sef($country['Country'] ,'')); ?>" name="countries[<?php echo $country['ISO2']; ?>]" value="<?php echo $country['ISO3']; ?>"<?php echo (in_array($country['ISO3'], $GLOBALS['claimant']['countries']))?'checked="checked"':''; ?>></input></div>
                	</div>
        		</div>
    		
    		<?php         }
        	       }
?>             </div>
<?php 
                } 
    	}
    	?>
    		<div style="width: auto; clear: both; margin-left: auto; margin-right: auto; margin-top: 16px;">
    			<input type="submit" id="submit" name="submit" value="Goto the Next Step (Departments)" ></input>
    			<input type="hidden" id="type" name="type" value="countries" ></input>
    		</div>
        </form>
    </p>
	<?php } ?>
</div>
</html>
<?php 
