<?php

require_once __DIR__ . '/../../vendor/autoload.php';

$dotenv = new Dotenv\Dotenv(__DIR__ . '/../..');
$dotenv->load();

function check_recaptcha($gRecaptchaResponse) { 
    // https://github.com/google/recaptcha#usage
    $recaptcha = new \ReCaptcha\ReCaptcha(getenv('RECAPTCHA_SECRET'));
    $resp = $recaptcha->verify($gRecaptchaResponse, $remoteIp);
    return $resp->isSuccess();
}
function create_file_contents($post_id, $commenter_name, $comment_title, $comment) {
    $date = date('Y-m-d H:i:s O');
    return <<<COMMENT
---
post_id '$post_id'
author: $commenter_name
title:  $comment_title
date:   '$date'
---

$comment

COMMENT;
}
function get_authenticated_github_client() {
    $client = new \Github\Client();
    if($client->authenticate(getenv('GITHUB_API_TOKEN'), null, \Github\Client::AUTH_HTTP_TOKEN)->getStatusCode() === 200) {
        return $client;
    }
    return false;
}

function create_comment_file($client, $post_id, $committer_name, $file_contents) {
    // https://github.com/KnpLabs/php-github-api/blob/master/doc/repo/contents.md#create-a-file
    $committer = [ $committer_name, getenv('COMMENTER_EMAIL') ];
    $commitMessage = 'New Comment Added From User On Website';
    $hash = substr(hash('sha512', $file_contents), 0, 40);
    $branch = 'comment-' . $hash;
    $path = "_comments/" . date('Y-m-d_Hi') . "_" . array_reverse(explode("/", $post_id))[0] . "_$hash.txt";
    $client->api('repo')->contents()->create(getenv('GITHUB_USER'), getenv('GITHUB_REPO'), $path, $content, $commitMessage, $branch, $committer);
    return $branch;
}

function send_comment_pull_request($client, $pull_request_branch, $commenter_name) {
    // https://github.com/KnpLabs/php-github-api/blob/master/doc/pull_requests.md#create-a-pull-request
    if() {
        $pullRequest = $client->api('pull_request')->create(getenv('GITHUB_TARGET_USER'), getenv('GITHUB_REPO'), array(
            'base'  => getenv('GITHUB_BRANCH'),
            'head'  => $pull_request_branch,
            'title' => "Comment Pull request for $commenter_name",
            'body'  => 'This pull request contains a bunch of enhancements and bug-fixes, happily shared with you'
        ));
    };
}

function make_request() {
    return [
        'g-recaptcha-response' => $_POST['g-recaptcha-response'],
        'post_id' => $_POST['post_id'],
        'commenter_name' => $_POST['commenter_name'],
        'comment_title' => $_POST['comment_title'],
        'comment' => $_POST['comment'],
    ];
}

function post_exists($post_id) {
    return in_array($post_id, json_decode(file_get_contents("post_ids.json")));
}

function verify_request($request) {
    $errors = [];
    if(!check_recaptcha($request['g-recaptcha-response'])) {
        $errors[] = 'CAPTCHA dings dongs da wo igeeh muesch zum luege öb computer bisch isch falsch gsii.';
    }

    if(empty($request['post_id']) || !post_exists($post_id)) { 
        $errors[] = "Kolleg de biitrag gids gar niiid, aso chasch au ke kommentar mache";
    }

    if(empty($request['commenter_name'])) {
        $errors[] = 'Muesch scho en Name iigeh, chad au irgend en scheiss sii';
    }

    if(empty($request['comment_title'])) {
        $errors[] = 'Gib nu en Titel ii';
    }

    if(empty($request['comment'])) { 
        $errors[] = 'Ja schriib nu öppis is Kommentarfeld, schüsch macht das ganze hiä nid so vill Sinn!';
    }
}

function yaml_quote($str) {
    return "'" . str_replace('\'', '\'\'', $str) . "'";
}


function sanitize_request() { 
    return [
        'g-recaptcha-response' => $request['g-recaptcha-response'],
        'post_id' => $request['post_id'],
        'commenter_name' => yaml_quote(substr(strtok($request['commenter_name'], 0, 40)));
        'comment_title' => yaml_quote(substr(strtok($request['comment_title'], 0, 60))),
        'comment' => $request['comment'],
    ];
}

function api_error($reason) {
    echo "Es gid grad technischi problem mit de kommentar funktion, schriib üs doch es mail...\n";
    echo "Reason: $reason";
    exit();
}


$request = make_request();
$errors = verify_request($request)
if (count($errors) > 0) {
    echo "So es paar Sache bim Kommentar mache hesch hert verkackt: \n"
    foreach($errors as $error) {
        echo "$error\n";
    }
    exit();
}
$request = sanitize_request($request);


$client = get_authenticated_github_client();
if(!$client) { 
    api_error("authentifizierig bi github fehlgschlage");
}

$comment_file_contents = create_file_contents($request['post_id'], $request['commenter_name'], , $request['comment_title'], $request['comment']);

if($branch = create_comment_file($client, $request['post_id'],  $request['commenter_name'], $comment_file_contents)) {
    send_comment_pull_request($client, $branch, $request['commenter_name']);
    echo "Ok das hed klapped, mr schaltid de kommentar denn nächschtens mal frii";
} else { 
    api_error("cha ke kommentar datei uf github lade");
}
