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
    
    if (!isset($_SESSION['twitter']['user']['username'])) {
        require_once __DIR__ . DS . 'class' . DS . 'TwitterAPIExchange.php';
        $url = 'https://api.twitter.com/oauth/access_token';
        $request_method = 'POST';
        $twitter_instance = new TwitterAPIExchange($GLOBALS['twitter']['settings']);
        $query = $twitter_instance->setPostfields($inner)->buildOauth($url, $request_method)->performRequest();
        parse_str($query, $_SESSION['twitter']['access']);
        $_SESSION['twitter']['user']['username'] = $_SESSION['twitter']['access']['screen_name'];
        $_SESSION['twitter']['user']['user_id'] = $_SESSION['twitter']['access']['user_id'];
    }
    
    if (iiset($_SESSION['return-url']) && !empty($_SESSION['return-url']))
        header('Location: ' . $_SESSION['return-url']);
    else
        header('Location: ' . API_URL);
    exit(0);
    