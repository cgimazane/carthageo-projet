# carthageo-projet
Sujet et données du projet Carthagéo 2019

## Création de la base

### Par le SGBD pgAdmin
* Se connecter à localhost
* Créer une base *olympics*
  + `CREATE DATABASE olympics;`
* Ouvrir la base olympics
  + Executer le fichier SQL `olympics.schema.sql`
  + Executer le fichier SQL `olympics.data.sql`

### En ligne de commande

* Ouvrir un terminal
* Lancer les commandes suivantes

```bash
psql -U postgres -h localhost -d postgres -c "CREATE DATABASE olympics;"
psql -U postgres -h localhost -d olympics -f "olympics.schema.sql"
psql -U postgres -h localhost -d olympics -f "olympics.data.sql"
```
