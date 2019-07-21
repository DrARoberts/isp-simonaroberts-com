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

    $sql = "SELECT `title`, `modal` FROM `" . $GLOBALS['APIDB']->prefix('lists') . "` WHERE `hostname` LIKE '" . parse_url(API_URL, PHP_URL_HOST) . "'";
    list($pagetitle, $modal) = $GLOBALS['APIDB']->fetchRow($GLOBALS['APIDB']->queryF($sql));
    
    session_start();
    for($ut=time(); $ut < time() - (48 *3600); $ut-- ) {
        $sql = "SELECT * FROM `" . $GLOBALS['APIDB']->prefix('claimableservices') . "` WHERE md5(concat(`id`, '" . API_URL . "', 'editing', '$ut')) LIKE  '" . $inner['key'] . "' AND `finished` = 0";
        if ($result = $GLOBALS['APIDB']->queryF($sql)) {
            if ($GLOBALS['claim'] = $GLOBALS['APIDB']->fetchArray($result)) {
                if ($GLOBALS['claim']['finished'] != 0)
                    die(include(__DIR__ . DS . 'include' . DS . 'data' . DS . $modal . '-inactive.php'));
                
                if (!isset($inner['mode'])) {
                    $_SESSION['return-url'] = API_URL . '/v1/' . md5($GLOBALS['claim']['id'].API_URL.'editing'.time()) . "/editing.html";
                    die(include(__DIR__ . DS . 'include' . DS . 'data' . DS . $modal.'-editing.php'));
                }
                
                if (!$GLOBALS['claimant'] = APICache::read('claimant-'.md5($GLOBALS['claim']['id'].API_URL.'claim')))
                    $GLOBALS['claimant'] = array();
                
                if ($_SERVER['REQUEST_METHOD'] == "POST") {
                    switch ($inner['type'])
                    {
                        case "modal":
                            if (count($inner['modal'])>0) {
                                $GLOBALS['claimant']['modals'] = $inner['modal'];
                            } else {
                                die(header('Location: ' . API_URL . '/v1/' . md5($GLOBALS['claim']['id'].API_URL.'editing'.time()) . "/editing.html"));
                            }
                            break;
                    }
                }
                    
                switch ($mode) 
                {
                    default:
                        $_SESSION['return-url'] = API_URL . '/v1/' . md5($GLOBALS['claim']['id'].API_URL.'editing'.time()) . "/" . $inner['mode'] . "/editing.html";
                        die(include(__DIR__ . DS . 'include' . DS . 'data' . DS . $modal.'-'.$inner['mode'].'-editing.php'));
                        break;
                }
                
                APICache::write('claimant-'.md5($GLOBALS['claim']['id'].API_URL.'claim'), $GLOBALS['claimant'], 3600 * 24 * 7);
                
            }
        }
    }
    die(include(__DIR__ . DS . 'include' . DS . 'data' . DS . $modal.'-missing.php'));
    