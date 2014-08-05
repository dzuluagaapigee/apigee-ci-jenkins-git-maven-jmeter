#!/usr/bin/env bash

java -jar ./jenkins/jenkins-cli.jar -s http://localhost:8080/ install-plugin performance -deploy
java -jar ./jenkins/jenkins-cli.jar -s http://localhost:8080/ install-plugin github -deploy
java -jar ./jenkins/jenkins-cli.jar -s http://localhost:8080/ install-plugin github-oauth -deploy
java -jar ./jenkins/jenkins-cli.jar -s http://localhost:8080/ install-plugin jira -deploy
java -jar ./jenkins/jenkins-cli.jar -s http://localhost:8080/ install-plugin ghprb -deploy
java -jar ./jenkins/jenkins-cli.jar -s http://localhost:8080/ install-plugin email-ext -deploy
java -jar ./jenkins/jenkins-cli.jar -s http://localhost:8080/ install-plugin nodejs -deploy
java -jar ./jenkins/jenkins-cli.jar -s http://localhost:8080/ install-plugin mask-passwords -deploy