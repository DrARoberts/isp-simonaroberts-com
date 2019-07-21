<?php

    require_once __DIR__ . DIRECTORY_SEPARATOR . 'apiconfig.php';
    
    error_reporting(E_ERROR);
    ini_set('display_errors', true);
    
    $odds = $inner = array();
    foreach($_GET as $key => $values) {
        if (!isset($inner[$key])) {
            $inner[$key] = $values;
        } elseif (!in_array(!is_array($values)?$values:md5(json_encode($values, true)), array_keys($odds[$key]))) {
            if (is_array($values)) {
                $odds[$key][md5(json_encode($inner[$key] = $values, true))] = $values;
            } else {
                $odds[$key][$inner[$key] = $values] = "$values--$key";
            }
        }
    }
    foreach($_POST as $key => $values) {
        if (!isset($inner[$key])) {
            $inner[$key] = $values;
        } elseif (!in_array(!is_array($values)?$values:md5(json_encode($values, true)), array_keys($odds[$key]))) {
            if (is_array($values)) {
                $odds[$key][md5(json_encode($inner[$key] = $values, true))] = $values;
            } else {
                $odds[$key][$inner[$key] = $values] = "$values--$key";
            }
        }
    }
    foreach(parse_url('http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'].(strpos($_SERVER['REQUEST_URI'], '?')?'&':'?').$_SERVER['QUERY_STRING'], PHP_URL_QUERY) as $key => $values) {
        if (!isset($inner[$key])) {
            $inner[$key] = $values;
        } elseif (!in_array(!is_array($values)?$values:md5(json_encode($values, true)), array_keys($odds[$key]))) {
            if (is_array($values)) {
                $odds[$key][md5(json_encode($inner[$key] = $values, true))] = $values;
            } else {
                $odds[$key][$inner[$key] = $values] = "$values--$key";
            }
        }
    }

    session_start();
    
    $sql = "SELECT `title`, `modal` FROM `" . $GLOBALS['APIDB']->prefix('lists') . "` WHERE `hostname` LIKE '" . parse_url(API_URL, PHP_URL_HOST) . "'";
    list($pagetitle, $modal) = $GLOBALS['APIDB']->fetchRow($GLOBALS['APIDB']->queryF($sql));
    
    $sql = "SELECT * FROM `" . $GLOBALS['APIDB']->prefix('claimableservices') . "` WHERE md5(concat(`id`, '" . API_URL . "', 'claim')) LIKE  '" . $inner['key'] . "' AND `finished` = 0";
    if ($result = $GLOBALS['APIDB']->queryF($sql)) {
        if ($GLOBALS['claim'] = $GLOBALS['APIDB']->fetchArray($result)) {
            if (isset($_SESSION['twitter']['user']['username']) && !empty($_SESSION['twitter']['user']['username']))
                if (strpos($GLOBALS['claims']['companytwitterurls'], 'twitter.com/'.$_SESSION['twitter']['user']['username'])) {
                    die(header("Location: " . API_URL . '/v1/' . md5($GLOBALS['claim']['id'].API_URL.'editing'.time()) . "/editing.html"));
                }
            
            if (!$claimant = APICache::read('claimant-'.md5($GLOBALS['claim']['id'].API_URL.'claim')))
                $claimant = array('modals'=>array($modal=>$modal));
            
            if (isset($_REQUEST['name']) && !empty($_REQUEST['name']) && isset($_REQUEST['email']) && !empty($_REQUEST['email'])) {
                $emails = explode("\n", $_REQUEST['email']);
                foreach($emails as $id => $email) {
                    if (empty($email))
                        unset($emails[$id]);
                    else
                        foreach(json_decode($GLOBALS['claim']['hostnames']) as $host) {
                            if (!empty($host)) {
                                if (!strpos($email, "@$host") && !strpos($email, ".$host"))
                                    unset($emails[$id]);
                            }
                        }
                }
                $emails = array_unique($emails);
                shuffle($emails);
                if (count($emails) > 0) {
                    $sql = "SELECT `title` FROM `" . $GLOBALS['APIDB']->prefix('lists') . "` WHERE `hostname` LIKE '" . parse_url(API_URL, PHP_URL_HOST) . "'";
                    list($pagetitle) = $GLOBALS['APIDB']->fetchRow($GLOBALS['APIDB']->queryF($sql));
                    require_once dirname(__DIR__) . DS . 'class' . DS . 'apimailer.php';
                    foreach($emails as $id => $email) {
                        $mailer = new APIMailer(API_LICENSE_EMAIL, API_LICENSE_COMPANY);
                        $body = file_get_contents(dirname(__DIR__) . DS . 'include' . DS . 'data' . DS . 'email__inviteforedit.html');
                        $subject = sprintf("%s - %s", $GLOBALS['claim']['companyname'], $pagetitle);
                        $body = str_replace("%api_url", API_URL, $body);
                        $body = str_replace("%pagetitle", $pagetitle, $body);
                        $body = str_replace("%companyname", $GLOBALS['claim']['companyname'], $body);
                        $body = str_replace("%name", $_REQUEST['name'], $body);
                        $body = str_replace("%key", md5($GLOBALS['claim']['id'].API_URL.'editing'.time()), $body);
                        $body = str_replace("%emailscount", count($emails), $body);
                        if ($mailer->sendMail(array($email => $email), array(), array(), $subject, $body, array(), array(), true )) {
                            $claimant['invites']['sent'][$email] = time();
                            if (!isset($GLOBALS['invites-emailed']))
                                $GLOBALS['invites-emailed'] = array();
                            $GLOBALS['invites-emailed'][$email] = $email;
                        }
                    }
                        
                }
            }
            APICache::write('claimant-'.md5($GLOBALS['claim']['id'].API_URL.'claim'), $claimants, 3600 * 24 * 7);
            if ($GLOBALS['claim']['finished'] != 0)
                die(include(__DIR__ . DS . 'include' . DS . 'data' . DS . 'claim-inactive.php'));
            else {
                $_SESSION['return-url'] = API_URL . '/v1/' . md5($GLOBALS['claim']['id'].API_URL.'claim') . "/claim.html";
                die(include(__DIR__ . DS . 'include' . DS . 'data' . DS . 'claim-active.php'));
            }
        }
    }
    die(include(__DIR__ . DS . 'include' . DS . 'data' . DS . 'claim-missing.php'));

    