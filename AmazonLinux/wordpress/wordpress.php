<?php
require './vendor/autoload.php';

$input = file_get_contents("./config.yaml");
$config = \Symfony\Component\Yaml\Yaml::parse($input);
$home = '/home/ec2-user/environment/public/wordpress/';

foreach($config['sites'] as $site) {
    $prefix = getenv('C9_PID');
    $url = 'https://' . $prefix . '.vfs.cloud9.ap-southeast-1.amazonaws.com/' . $site['directory_name'];
    $path = $home . $site['directory_name'];
    if(!file_exists($path)) {
        mkdir($path, 0700, true);   
    }
    chdir($path);
    $index_file = $home . $site['directory_name'] . '/index.php';
    if(!file_exists($index_file)) {
        execute('wp core download --locale=ja');    
    }
    $config_file = $home . $site['directory_name'] . '/wp-config.php';
    if(!file_exists($config_file)) {
        execute("wp config create \
        --dbname={$site['db_name']} \
        --dbuser={$site['db_user']} \
        --dbpass={$site['db_password']} \
        --dbhost=localhost \
        --dbprefix={$site['db_prefix']}"
        );
    }

    execute("wp core install \
    --url=$url \
    --title='{$site['site_title']}' \
    --admin_user='{$site['admin_user']}' \
    --admin_password='{$site['admin_password']}' \
    --admin_email='{$site['admin_email']}'");
    foreach($site['plugins'] as $plugin) {
        execute("wp plugin install {$plugin} --activate");
    }
}

function execute($command){
    exec($command, $out, $res);
    if($res != 0){
        // print_r($out);
        // exit;
    }
}