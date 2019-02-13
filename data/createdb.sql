-- remove
DROP DATABASE olympics;
DROP ROLE carthageo;

-- create
CREATE ROLE carthageo WITH PASSWORD 'carthageo' LOGIN SUPERUSER;
CREATE DATABASE olympics WITH ENCODING = 'UTF8' OWNER carthageo;

-- TODO connexion à la base olympics
-- create extension
-- \c olympics
-- CREATE EXTENSION postgis;

