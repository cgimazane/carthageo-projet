<?php

//parametres
$parameters = array (
    'dbHost' => 'localhost',
    'dbName' => 'olympics',
    'dbUser' => 'postgres',
    'dbPass' => 'root'
);

//connexion au sgbd
$db = new PDO("pgsql:host=".$parameters['dbHost'],$parameters['dbUser'],$parameters['dbPass']);

//creation de la bdd
$db->exec("CREATE DATABASE olympics WITH ENCODING = 'UTF8';");

//connexion à la bdd
$dsn = "pgsql:host=".$parameters['dbHost'].";dbname=".$parameters['dbName'];
$db = new PDO($dsn,$parameters['dbUser'],$parameters['dbPass']);

//ajout extension postgis
$db->exec("CREATE EXTENSION postgis;");

//requete pour restaurer la bdd
$sqlRestore = "psql -h ".$parameters['dbHost']." -U ".$parameters['dbUser']." olympics < olympics.pgsql";

//execution de la requete
exec($sqlRestore);
