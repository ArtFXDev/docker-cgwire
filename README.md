# Silex Docker

![](https://img.shields.io/badge/Docker-309cef?style=for-the-badge&logo=docker&logoColor=white)

Silex Docker is the repository for deploying the services of the pipeline.

## Introduction

To deploy Silex, the following services are needed:

- `nginx` -> this is the reverse proxy responsible for redirecting requests to the server to the appropriate services. It runs on the port `80`.

  You can modify the [`nginx.conf`](./nginx/nginx.conf) configuration file to change the DNS pointing to your server. By default it's `kitsu.(prod|preprod).silex.artfx.fr`

- `silex-front` -> the Silex frontend application: [silex-front](https://github.com/ArtFXDev/silex-front). It's bundled in the Nginx container itself.

- `kitsu` -> the CGWire web interface of Zou. It's bundled in the Nginx container itself.

- `zou` -> the CGWire REST api. It's pointing to our [fork](https://github.com/ArtFXDev/zou).

- `postgresql` -> the database used by Zou to store the pipeline data

- `redis` -> The queue system used by Zou

## Installation

### Prerequisites

The `build.sh` script need `jq` to be installed. On a debian based machine use:

```bash
$ sudo apt install jq
```

You'll also need `docker-compose`, install it on your platform [here](https://docs.docker.com/compose/install/).

### Install

Clone the repository and build the containers:

```bash
$ git clone https://github.com/ArtFXDev/silex-docker
$ bash build.sh --local # build and run local docker images
```

## Usage

To start the containers, just use:

```bash
$ bash build.sh --local # or -l for short
```

To shutdown all the containers and clean it, use the `--down / -d` option.

## Documentation

- [CORS documentation](https://developer.mozilla.org/fr/docs/Web/HTTP/CORS)

- [Mathieu BOUZARD's kitsu nginx config (for reference)](https://gitlab.com/mathbou/docker-cgwire/-/blob/kitsu/nginx.conf)

- [Why credentials are not supported when Access-Control-Allow-Origin \*](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS/Errors/CORSNotSupportingCredentials) (also see this [thread](https://stackoverflow.com/questions/19743396/cors-cannot-use-wildcard-in-access-control-allow-origin-when-credentials-flag-i))

- [How to bypass Access-Control-Allow-Origin \* and still allow all origins](https://stackoverflow.com/questions/14499320/how-to-properly-setup-nginx-access-control-allow-origin-into-response-header-bas)

- [Which CORS headers are needed when using an Authorization header? (used when sending requests to Kitsu)](https://www.sjoerdlangkemper.nl/2018/09/12/authorization-header-and-cors/)

- [Setting CORS headers in Nginx](https://enable-cors.org/server_nginx.html)

- [Setting up Nginx for multiple docker containers](https://www.bogotobogo.com/DevOps/Docker/Docker-Compose-Nginx-Reverse-Proxy-Multiple-Containers.php)

## Contributing

Pull requests and issues are welcome. For major changes, please open an issue first to discuss what you would like to change.

## Special Thanks

Visit [cg-wire.com](https://cg-wire.com) for more information.

[![CGWire Logo](https://zou.cg-wire.com/cgwire.png)](https://cgwire.com)

This repository is based on a repository from Mathieu BOUZARD:  [`docker-cgwire`](https://gitlab.com/mathbou/docker-cgwire).

## License

[Apache-2.0](./LICENSE.md) [@ArtFX](https://artfx.school/)

