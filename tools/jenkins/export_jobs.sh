#!/usr/bin/env bash

java -jar jenkins-cli.jar -s https://dfzuluaga.ci.cloudbees.com/ get-job weather-api-develop-pull-request > eather-api-develop-pull-request.xml
