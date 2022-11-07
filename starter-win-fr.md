---
lang: fr
layout: default
permalink: /starter-win/
---
# Installer l'environnement de développement sous Windows

Nous allons installer sur le poste de travail une mini application dénommée `cyk-demo`. Cette application gère une base de données d'acteurs et de films.

Les étapes principales sont les suivantes : 

1 - Télécharger le code source `cyk-demo` avec le logiciel Git

2 - Installez les serveurs en local avec le logiciel Docker

3 - Installer l'application `cyk-demo` avec l'outil en ligne de commande `cyk`

## Etape 1 - Télécharger le code source `cyk-demo` avec Git

<a name="install_git"></a>

### Etape 1.1 Installer Git pour Windows

Aller au [site de téléchargement de Git](https://git-scm.com)
La page de téléchargement devrait se présenter ainsi :

![Page de téléchargement de Git pour Windows](/images/git_download_win.png)

Téléchargez et installer Git pour Windows

### Etape 1.2 - Créer un dossier disque hébergeant l'application

Positionnez-vous au préalable dans le dossier où vous souhaitez créer le dossier application qui portera le nom de `cyk-demo`

```console
C:\Users\john> git clone https://github.com/pchaneyo/cyk-demo.git

Cloning into 'cyk-demo'...
remote: Enumerating objects: 19, done.
remote: Counting objects: 100% (19/19), done.
remote: Compressing objects: 100% (11/11), done.
Receiving objects: 100% (19/19), 10.30 MiB | 3.99 MiB/seused 0
Receiving objects: 100% (19/19), 12.94 MiB | 4.69 MiB/s, done.
Resolving deltas: 100% (6/6), done.
```
## Etape 2 - Installez les serveurs en local avec le logiciel Docker

<a name="install_nodejs"></a>

### Etape 2.1 Installer NodeJS

Aller au [site de NodeJS](https://www.nodejs.org)
La page de téléchargement se présente comme suit :

![Page d'accueil de nodejs.org](/images/nodejs_homepage.png)

- Choisissez la version 16 LTS (Long Term Support)
- Téléchargez et lancez le programme d'installation
- Il n'est pas nécessaire d'installer l'option pour compiler les modules natifs
  
Ouvrez un terminal et tapez la commande

```console
C:\Users\phili> node -v

v16.11.0
```
Cela devrait afficher la version du logiciel Node installé.

### Etape 2.2 - Installer la commande cyk par NPM

#### Positionnez-vous d'abord dans le dossier `cyk-demo`:

```console
C:\Users\john> cd cyk-demo

C:\Users\john\cyk-demo>
```
#### Installez ensuite la commande cyk avec l'outil NPM

```console
C:\Users\john\cyk-demo> npm install @cyklang/cli -g

changed 18 packages, and audited 19 packages in 16s

2 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities
```

L'option `-g` (global) permet de disposer de la commande `cyk` à tout endroit. Vous devez être administrateur de votre système pour pouvoir l'utiliser.
Sans l'option `-g` la commande `cyk` sera installée dans le répertoire en cours seulement

### Vérifiez que la commande cyk a été bien installée

```console
C:\Users\john\cyk-demo> cyk -h

Usage: cyk [options] [command]

cyklang CLI

Options:
  -V, --version              output the version number
  -h, --help                 display help for command

Commands:
  init                       initialize a folder with files necessary for a cyklang project
  asset                      manage assets
  a                          manage assets
  module                     manage modules
  m                          manage modules
  user [options]             manage users in cyk_user table
  u [options]                manage users in cyk_user table
  query
  q
  table [options]            import/export table rows
  t [options]                import/export table rows
  test [options] <files...>  test script
  run [options] <files...>   run module
  help [command]             display help for command

```


<a name="install_docker"></a>

### Etape 2.3 Installer Docker Desktop

Aller sur le [site de Docker](https://www.docker.com) :

![Page d'accueil de Docker](/images/docker_homepage.png)


Téléchargez et installez Docker Desktop
Après la procédure d'installation, l'ordinateur doit redémarrer pour terminer la configuration de l'environnement.


### Etape 2.4 - Initialisez les variables d'environnement avec la commande `cyk init`

```console
C:\Users\john\cyk-demo> cyk init
? Postgresql Port 5432
? NodeJS Port 3000
? Admin User Login cyk
? Admin User Password cyk
? Admin Use Email my-email@my-domain
? confirm: Yes
created .env
created docker-compose.yml

```

`cyk init` demande interactivement les paramètres suivants :
- Le port d'écoute du serveur de base de données Postgresql
- Le port d'écoute du serveur Node
- L'identifiant de l'utilisateur administrateur
- Le mot de passe de cet utilisateur
- L'adresse email de cet utilisateur



La commande `cyk init` crée dans le répertoire courant :
- le fichier .env 
- le fichier docker-compose.yml

### Etape 2.5 - Démarrez les containers Docker

#### Lancez d'abord Docker Desktop


#### Lancez Docker Compose

```console
C:\Users\john\cyk-demo> docker compose up -d


```

L'option `-d` (detach) permet de redonner la main directement et de ne pas bloquer l'interpréteur de commandes.

Testez que le serveur est bien installé dans un navigateur avec le lien :

[http://localhost:3000](http://localhost:3000)

Si vous voyez l'écran suivant, bravo ! Vous avez correctement installé les containers Docker.

![Index par défaut](/images/index_default.png)

## Etape 3 -  Installer l'application `cyk-demo` avec l'outil en ligne de commande `cyk`

### Etape 3.1 Listez le contenu du dossier avec la commande DIR

```console
C:\Users\john\cyk-demo> dir

 Le volume dans le lecteur C s’appelle Windows
 Le numéro de série du volume est 8C0F-24DD

 Répertoire de C:\Users\phili\Projects\cyk-demo

31/10/2022  16:09    <DIR>          .
31/10/2022  16:09    <DIR>          ..
31/10/2022  16:09               881 .env
31/10/2022  12:05                20 .gitignore
31/10/2022  12:02            11 903 actor_select.xml
31/10/2022  05:56    <DIR>          data
31/10/2022  12:02             2 639 db_init.xml
31/10/2022  16:09             1 084 docker-compose.yml
31/10/2022  12:02            10 786 film.xml
31/10/2022  07:42    <DIR>          node_modules
31/10/2022  07:42            11 919 package-lock.json
31/10/2022  07:42                57 package.json
               8 fichier(s)           39 289 octets
               4 Rép(s)  47 970 877 440 octets libres
```

### Etape 3.2 Insérez les XML dans la base de données

```console
C:\Users\john\cyk-demo> cyk module upload db_init.xml actor_select.xml film.xml

DBREMOTE_URL http://localhost:3000
module update db_init access undefined description undefined
module db_init updated
module update actor_select access undefined description actor module
module actor_select updated
module update film access undefined description film module
module film updated
```

### Etape 3.3 - Créez les tables et les requêtes de la base de données

```console
C:\Users\john\cyk-demo> cyk run db_init.xml

DBREMOTE_URL http://localhost:3000
Module db_init has been executed
```

### Etape 3.4 - Chargez les tables de la base de données

```console
C:\Users\john\cyk-demo> cyk table import -d data actor film film_actor


```

### Etape 3.5 - Associer l'utilisateur au module film

#### Etape 3.5.1  Lister les utilisateurs

```console
C:\Users\john\cyk-demo> cyk user list

DBREMOTE_URL http://localhost:3000
order_by user_name
colws 0
                                List of users
ID | user_name |     user_email     | user_access | user_appli | user_disable
---+-----------+--------------------+-------------+------------+-------------
 1 | cyk       | my-email@my-domain | admin       |            | false
---+-----------+--------------------+-------------+------------+-------------
Number of lines : 1
```

#### Etape 3.5.2  Modifier le champ user_appli de l'utilisateur

```console
C:\Users\john\cyk-demo> cyk user update -i 1 -m film

DBREMOTE_URL http://localhost:3000

C:\Users\john\cyk-demo> cyk user list

DBREMOTE_URL http://localhost:3000
order_by user_name
colws 0
                                List of users
ID | user_name |     user_email     | user_access | user_appli | user_disable
---+-----------+--------------------+-------------+------------+-------------
 1 | cyk       | my-email@my-domain | admin       | film       | false
---+-----------+--------------------+-------------+------------+-------------
Number of lines : 1

```

Après la connexion, l'utilisateur cyk executera maintenant le module film

![Film module](/images/module_film_form.png)







