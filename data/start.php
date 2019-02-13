<?php

$user = 'postgres';
if (sizeof($argv) > 1 && $argv[1] !== '') {
  $user = $argv[1];
}
$password = 'root';
if (sizeof($argv) > 2 && $argv[2] !== '') {
  $password = $argv[2];
}

// parametres par default
$parameters = array (
    'dbHost' => 'localhost',
    'dbName' => 'olympics',
    'dbUser' => $user,
    'dbPass' => $password
);

try {
  createDbAsAdmin($parameters['dbHost'], $parameters['dbUser'], $parameters['dbPass']);
} catch(\Exception $e) {
  echo "Erreur à la création \n";
}

// connexion à la bdd
$dsn = 'pgsql:host=' . $parameters['dbHost'] . ';dbname=' . $parameters['dbName'];
$db = new PDO(
  $dsn,
  $parameters['dbUser'],
  $parameters['dbPass']
);

// ajout extension postgis
$sql = "CREATE EXTENSION postgis;";
$db->exec($sql);

// requete pour restaurer la bdd
$sqlRestore = "psql -h " . $parameters['dbHost'] . " -U " . $parameters['dbUser'] . " olympics < olympics.pgsql";
// execution de la requete
exec($sqlRestore);


// create db as admin
function createDbAsAdmin($host, $user, $pswd) {
  // connexion au sgbd
  $db = new PDO(
    'pgsql:host=' . $host,
    $user,
    $pswd
  );
  // creation de la bdd
  $sql = "CREATE DATABASE olympics WITH ENCODING = 'UTF8';";
  $db->exec($sql);
}

