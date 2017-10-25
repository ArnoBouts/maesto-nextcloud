<?php

error_reporting(E_ERROR);

$mysql_database = getenv('MYSQL_DATABASE');
$mysql_user = getenv('MYSQL_USER');
$mysql_password = getenv('MYSQL_PASSWORD');
$mysql_host = getenv('MYSQL_HOST');

echo "Waiting for database...";

$database_ready = false;
while($database_ready != true) {


  $mysqli = new mysqli($mysql_host, $mysql_user, $mysql_password, $mysql_database);

  if ($mysqli->connect_errno) {
    echo ".";
    sleep(1);
  } else {
    echo "\nDatabase is ready.\n";
    $database_ready = true;
    $mysqli->close();
  }
}
?>
