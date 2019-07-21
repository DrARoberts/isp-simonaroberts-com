<?php
error_reporting(E_ALL);
ini_set('display_errors', true);

    require_once __DIR__ . DIRECTORY_SEPARATOR . 'apiconfig.php';
    
    error_reporting(E_ALL);
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
    if (isset($_SESSION[$_REQUEST['key']]) && is_array($_SESSION[$_REQUEST['key']]) && !empty($_SESSION[$_REQUEST['key']]))
        $GLOBALS['claim'] = $_SESSION[$_REQUEST['key']];
    
    if (!isset($GLOBALS['claim'])) {
        $unixtimes = array();
        for($step=1; $step < 96 * 8; $step++) {
            if (!isset($_SESSION[$_REQUEST['key']])) {
                $unixtimes = array();
                for($ut = time() - ((($step - 1)) * (1800 / 8)); $ut >= time() - (($step) * (1800 / 8)); $ut-- ) 
                    $unixtimes[] = $ut;
                $sql = "SELECT * FROM `" . $GLOBALS['APIDB']->prefix('claimableservices') . "` WHERE (md5(concat(`id`, '" . API_URL . "', 'editing', '" . implode("')) LIKE  '" . $inner['key'] . "' OR md5(concat(`id`, '" . API_URL . "', 'editing', '", $unixtimes) . "')) LIKE  '" . $inner['key'] . "') AND `finished` = 0";
                $result = $GLOBALS['APIDB']->fetchArray($GLOBALS['APIDB']->queryF($sql));
                if (is_array($result) && count($result) > 0) {
                    $GLOBALS['claim'] = $_SESSION[$_REQUEST['key']] = $result;
                    continue;
                    continue;
                    continue;
                    continue;
                }
            }
        }
    }
    
    if (is_array($GLOBALS['claim']) && !empty($GLOBALS['claim'])) {
        
        if (!$GLOBALS['claimant'] = APICache::read('claimant-'.md5($GLOBALS['claim']['id'].API_URL.'claim'))) {
            $GLOBALS['claimant'] = array('modals' => array($modal), 'id' => $GLOBALS['claim']['id']);
            APICache::write('claimant-'.md5($GLOBALS['claim']['id'].API_URL.'claim'), $GLOBALS['claimant'], 3600 * 24 * 7);
        }
            
        if ($GLOBALS['claim']['finished'] != 0)
            die(include(__DIR__ . DS . 'include' . DS . 'data' . DS . $modal . '-inactive.php'));
            
        if (!isset($_GET['mode'])) {
            $_SESSION['return-url'] = API_URL . '/v1/' . $_REQUEST['key'] . "/editing.html";
            die(include(__DIR__ . DS . 'include' . DS . 'data' . DS . $modal.'-editing.php'));
        }
        
        if ($_SERVER['REQUEST_METHOD'] == "POST" && count($_POST) > 0) {
            switch ($inner['type'])
            {
                case "modal":
                    if (count($inner['modal'])>0 && in_array($modal, $inner['modal'])) {
                        $GLOBALS['claimant']['modals'] = $inner['modal'];
                    } elseif (count($inner['modal'])>0 && !in_array($modal, $inner['modal'])) {
                        $GLOBALS['claimant']['modals'] = $inner['modal'];
                        $redirecturl = API_URL . '/v1/' . $_REQUEST['key'] . "/claims/editing.html";
                    } else {
                        $redirecturl = API_URL . '/v1/' . $_REQUEST['key'] . "/editing.html";
                    }
                    break;
                case "countries":
                    if (count($inner['countries'])>0) {
                        $GLOBALS['claimant']['countries'] = $inner['countries'];
                    } else {
                        $redirecturl = API_URL . '/v1/' . $_REQUEST['key'] . "/countries/editing.html";
                    }
                    break;
            }
        }
        
        APICache::write('claimant-'.md5($GLOBALS['claim']['id'].API_URL.'claim'), $GLOBALS['claimant'], 3600 * 24 * 7);
        
        if (isset($redirecturl))
            die(header('Location: ' . $redirecturl));
        
        switch ($mode)
        {
            default:
                $_SESSION['return-url'] = API_URL . '/v1/' . $_REQUEST['key'] . "/" . $inner['mode'] . "/editing.html";
                die(include(__DIR__ . DS . 'include' . DS . 'data' . DS . $modal.'-'.$inner['mode'].'-editing.php'));
                break;
        }
        
    }
    
    die(include(__DIR__ . DS . 'include' . DS . 'data' . DS . $modal.'-missing.php'));
    