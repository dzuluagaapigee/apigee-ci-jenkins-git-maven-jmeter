#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install -y default-jre
sudo apt-get install -y default-jdk

wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install -y jenkins
sudo apt-get install -y git