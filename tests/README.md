<a href="https://elest.io">
  <img src="https://elest.io/images/elestio.svg" alt="elest.io" width="150" height="75">
</a>

[![Discord](https://img.shields.io/static/v1.svg?logo=discord&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=Discord&message=community)](https://discord.gg/4T4JGaMYrD "Get instant assistance and engage in live discussions with both the community and team through our chat feature.")
[![Elestio examples](https://img.shields.io/static/v1.svg?logo=github&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=github&message=open%20source)](https://github.com/elestio-examples "Access the source code for all our repositories by viewing them.")
[![Blog](https://img.shields.io/static/v1.svg?color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=elest.io&message=Blog)](https://blog.elest.io "Latest news about elestio, open source software, and DevOps techniques.")

# Traduora, verified and packaged by Elestio

[Traduora](https://traduora.co/) offers translation management system for enterprises and language service providers to automate their translation workflows.

<img src="https://github.com/elestio-examples/traduora/raw/main/traduora.png" alt="traduora" width="800">

[![deploy](https://github.com/elestio-examples/traduora/raw/main/deploy-on-elestio.png)](https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/traduora)

You might want to deploy Traduora on elest.io if you want automated backups, reverse proxy with SSL termination, DOS protection, firewall, automated OS & Software updates, and a team of Linux experts and open source enthusiasts to ensure your services are always safe, and functional.

# Why use Elestio images?

- Elestio stays in sync with updates from the original source and quickly releases new versions of this image through our automated processes.
- Elestio images provide timely access to the most recent bug fixes and features.
- We regularly publishes container images that contain the most current distribution packages, ensuring that users have access to the latest versions of their software..
- Our team performs quality control checks to ensure the products we release meet our high standards.
- We take steps to ensure that all updates and changes are thoroughly tested and verified so as not to cause any issues or disruptions for our users.

# Usage

## Git clone

You can deploy it easily with the following command:

    git clone https://github.com/elestio-examples/traduora.git

Copy the .env file from tests folder to the project directory

    cp ./tests/.env ./.env

Edit the .env file with your own values.

Run the project with the following command

    docker-compose up -d

You can access the Web UI at: `http://your-domain:9090`

## Docker-compose

Here are some example snippets to help you get started creating a container.

    version: '3.7'

    services:

    traduora:
        image: elestio4test/traduora:latest
        ports:
            - "172.17.0.1:9090:8080"
        environment:
            TR_DB_USER: tr
            TR_DB_PASSWORD: ${ADMIN_PASSWORD}
            TR_DB_DATABASE: tr_dev
            TR_DB_HOST: mysqldb
            TR_DB_PORT: 3306
            NODE_ENV: "production"
            TR_SECRET: ${TR_SECRET}
            TR_VIRTUAL_HOST: ${TR_VIRTUAL_HOST}
            TR_MAIL_SENDER: ${TR_MAIL_SENDER}
            TR_MAIL_HOST: ${TR_MAIL_HOST}
            TR_MAIL_PORT: ${TR_MAIL_PORT}
            TR_MAIL_SECURE: ${TR_MAIL_SECURE}
            TR_MAIL_REJECT_SELF_SIGNED: ${TR_MAIL_REJECT_SELF_SIGNED}
            TR_MAIL_USER: ${TR_MAIL_USER}
            TR_MAIL_PASSWORD: ${TR_MAIL_PASSWORD}
        restart: always
        depends_on:
            - mysqldb

    mysqldb:
        image: mysql:5.7
        restart: always
        environment:
            MYSQL_DATABASE: tr_dev
            MYSQL_USER: tr
            MYSQL_PASSWORD: ${ADMIN_PASSWORD}
            MYSQL_ROOT_PASSWORD: root
            MYSQL_ALLOW_EMPTY_PASSWORD: 'true'
        volumes:
        - ./db:/var/lib/mysql

### Environment variables

|          Variable          |   Value (example)   |
| :------------------------: | :-----------------: |
|        ADMIN_EMAIL         | admin@yourmail.com  |
|       ADMIN_PASSWORD       |    your-password    |
|         TR_SECRET          |    your-password    |
|      TR_VIRTUAL_HOST       | https://your.domain |
|       TR_MAIL_SENDER       | sender@yourmail.com |
|        TR_MAIL_HOST        |     172.17.0.1      |
|        TR_MAIL_PORT        |         25          |
|       TR_MAIL_SECURE       |        false        |
| TR_MAIL_REJECT_SELF_SIGNED |        true         |
|     TR_SIGNUPS_ENABLED     |        true         |
|  TR_MAX_PROJECTS_PER_USER  |         100         |
|  TR_DEFAULT_PROJECT_PLAN   |     open-source     |
|     TR_DB_AUTOMIGRATE      |        true         |

# Maintenance

## Logging

The Elestio Traduora Docker image sends the container logs to stdout. To view the logs, you can use the following command:

    docker logs traduora

Alternatively, if you are using Docker Compose, you can use this command:

    docker-compose logs -f traduora

If you prefer to consume the container logs differently, you can configure the logging driver using the `--log-driver` option. By default, Docker uses the json-file driver.

To stop a Docker container on Windows or Mac using the command line, you can use the following command:

    docker stop [container-name]

Replace [container-name] with the name or ID of the container you want to stop.

To avoid using Ctrl+C on Windows or Mac to stop a container when running it in the foreground, you can use the following command instead:

    docker stop $(docker ps -q --filter ancestor=[image-name])

## Backup and Restore with Docker Compose

To make backup and restore operations easier, we are using folder volume mounts. You can simply stop your stack with docker-compose down, then backup all the files and subfolders in the folder near the docker-compose.yml file.

Creating a ZIP Archive
For example, if you want to create a ZIP archive, navigate to the folder where you have your docker-compose.yml file and use this command:

    zip -r myarchive.zip .

Restoring from ZIP Archive
To restore from a ZIP archive, unzip the archive into the original folder using the following command:

    unzip myarchive.zip -d /path/to/original/folder

Starting Your Stack
Once your backup is complete, you can start your stack again with the following command:

    docker-compose up -d

That's it! With these simple steps, you can easily backup and restore your data volumes using Docker Compose.

# Links

- <a target="_blank" href="https://docs.traduora.co/docs/getting-started">Traduora documentation</a>

- <a target="_blank" href="https://github.com/ever-co/ever-traduora">Traduora Github repository</a>

- <a target="_blank" href="https://docs.traduora.co/docs/getting-started">Elestio/traduora Github repository</a>
