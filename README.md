### Note

This repository is a fork of Mathieu BOUZARD's [original repository](https://gitlab.com/mathbou/docker-cgwire).
It was adapted because we needed to add CORS headers and the Kitsu container was already using Nginx.

# Docker-cgwire

Docker compose for [Kitsu](https://kitsu.cg-wire.com/) and [Zou](https://zou.cg-wire.com/)

#### Use local images (run this)

```bash
bash build.sh -l
```

#### Stop the containers

```bash
bash build.sh -d
```

#### Flags:

```
    -l, --local             Use local images
    -e, --env=ENV_FILE      Set custom env file. If not set ./env is used
    -d, --down              Compose down the stack
    -h, --help              Show this help
```

## LDAP

Add your [LDAP variables](https://zou.cg-wire.com/configuration/#ldap) to the env file.

```bash
bash ldap_sync.sh
```

#### LDAP flags

```
    -e, --env=ENV_FILE      Set custom env file, must be the same as the env used with build.sh
    -h, --help              Show this help
```

## DB Upgrade

**[- Be sure to backup your datas before upgrading. -]**

```bash
# bash db_upgrade [options] oldDbVersion newDbVersion

# PostgreSql 9.5 to 11

bash db_upgrade 9.5 11
```

Don't forget to update the DB_VERSION key in your 'env' file **after** the upgrade.

#### DB Upgrade flags

```
    -e, --env=ENV_FILE      Set custom env file, must be the same as the env used with build.sh
    -d, --dry-run
    -h, --help              Show this help
```

## Default credentials:

- login: admin@example.com
- password: mysecretpassword

## About authors

Those Dockerfiles are based on CG Wire work, a company based in France. They help small
to midsize CG studios to manage their production and build a pipeline
efficiently.

They apply software craftsmanship principles as much as possible. They love
coding and consider that strong quality and good developer experience matter a lot.
Through their diverse experiences, they allow studios to get better at doing
software and focus more on artistic work.

Visit [cg-wire.com](https://cg-wire.com) for more information.

[![CGWire Logo](https://zou.cg-wire.com/cgwire.png)](https://cgwire.com)

## Documentation

- [CORS documentation](https://developer.mozilla.org/fr/docs/Web/HTTP/CORS)

- [Mathieu BOUZARD's kitsu nginx config (for reference)](https://gitlab.com/mathbou/docker-cgwire/-/blob/kitsu/nginx.conf)

- [Why credentials are not supported when Access-Control-Allow-Origin \*](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS/Errors/CORSNotSupportingCredentials) (also see this [thread](https://stackoverflow.com/questions/19743396/cors-cannot-use-wildcard-in-access-control-allow-origin-when-credentials-flag-i))

- [How to bypass Access-Control-Allow-Origin \* and still allow all origins](https://stackoverflow.com/questions/14499320/how-to-properly-setup-nginx-access-control-allow-origin-into-response-header-bas)

- [Which CORS headers are needed when using an Authorization header? (used when sending requests to Kitsu)](https://www.sjoerdlangkemper.nl/2018/09/12/authorization-header-and-cors/)

- [Setting CORS headers in Nginx](https://enable-cors.org/server_nginx.html)

- [Setting up Nginx for multiple docker containers](https://www.bogotobogo.com/DevOps/Docker/Docker-Compose-Nginx-Reverse-Proxy-Multiple-Containers.php)
