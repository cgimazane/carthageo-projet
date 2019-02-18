# carthageo-projet
Sujet et données du projet Carthagéo 2019

https://www.overleaf.com/project/5c0567725c83d47ac7deb176

# Création de la base...

## ... En utilisant le SGBD pgAdmin
* Ouvrir le SGBD
* Se connecter à localhost
* Créer une base olympics
  * ```CREATE DATABASE olympics;```
* Ouvrir la base olympics
  * Executer le fichier SQL ```olympics.schema.sql```
  * Executer le fichier SQL ```olympics.data.sql```

## ... ou en ligne de commande

method en ligne de commande pour executer les fichiers SQL (user postgres)

```bash
psql -U postgres -h localhost -d postgres -c "CREATE DATABASE olympics;"
psql -U postgres -h localhost -d olympics -f "olympics.schema.sql"
psql -U postgres -h localhost -d olympics -f "olympics.data.sql"
```
