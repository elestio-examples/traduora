[![elest.io](https://elest.io/images/elestio.svg)](https://elest.io)

[![Blog](https://img.shields.io/static/v1.svg?color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=elest.io&message=Blog)](https://blog.elest.io "Latest news about elestio, open source software, and DevOps techniques.")
[![Discord](https://img.shields.io/static/v1.svg?logo=discord&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=elest.io&message=Discord)](https://discord.gg/4T4JGaMYrD "Get instant assistance and engage in live discussions with both the community and team through our chat feature.")
[![Elestio examples](https://img.shields.io/static/v1.svg?logo=github&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=elest.io&message=Github)](https://github.com/elestio-examples "Access the source code for all our repositories by viewing them.")

[elest.io](https://elest.io) is a cloud-based platform that provides powerful tools for businesses to manage, optimize and automate their digital marketing campaigns. Its key features include:

- Advanced analytics and reporting capabilities
- Customizable dashboards and data visualization
- Integration with popular advertising platforms like Google Ads and Facebook Ads
- Automated campaign optimization based on machine learning algorithms
- Real-time monitoring and alerting for campaign performance and anomalies.

Find us at:

- [Blog](https://blog.elest.io) - Latest news about elestio, open source software, and DevOps techniques.
- [Discord](https://discord.gg/4T4JGaMYrD) - Get instant assistance and engage in live discussions with both the community and team through our chat feature.
- [Elestio examples](https://github.com/elestio-examples) - Access the source code for all our repositories by viewing them.

# Traduora

[Traduora](https://traduora.co/) offers translation management system for enterprises and language service providers to automate their translation workflows.

[![deploy](https://github.com/elestio-examples/traduora/raw/main/deploy-on-elestio.png)](https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/traduora)

[![traduora](https://github.com/elestio-examples/traduora/raw/main/traduora.png)](https://www.audacityteam.org/)

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
