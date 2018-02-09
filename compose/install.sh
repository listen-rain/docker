#!/bin/bash

curl -L https://github.com/docker/compose/releases/download/1.8.0/run.sh > /usr/bin/docker-compose \
        && chmod +x /usr/bin/docker-compose \
        && docker-compose --help

