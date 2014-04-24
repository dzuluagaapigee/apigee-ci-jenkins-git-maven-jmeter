#!/usr/bin/env bash

java -jar ./jenkins/jenkins-cli.jar -s http://localhost:8088/ install-plugin performance -deploy
java -jar ./jenkins/jenkins-cli.jar -s http://localhost:8088/ install-plugin github -deploy
java -jar ./jenkins/jenkins-cli.jar -s http://localhost:8088/ install-plugin github-oauth -deploy
java -jar ./jenkins/jenkins-cli.jar -s http://localhost:8080/ install-plugin jira -deploy