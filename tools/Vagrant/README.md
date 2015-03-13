Install Jenkins Vagrant Box
======
run ```vagrant up``` to download and install vagrant box. This box will also execute bootstrap.sh, which contains the command to install git, JRE, JDK and Jenkins. 

Install Jenkins Plugins
======
after running ```vagrant ssh``` install Jenkins plugins by running install-jenkins-plugins.sh. This script leverages jenkins-cli, which leverages Jenkins API to install Jenkins plugins from Jenkins dependency management. Plugins include: performance, github, github oauth, jira, email extension, and node.js.
```
cd /vagrant
./install-jenkins-plugins.sh
```

Install Maven
====
Point your browser to https://127.0.0.1:8088 on the host OS, Go to Manage Jenkins > Configure System > Maven and pick Maven 3.0.5. Make sure Install Automatically checkbox is ticked.

Create a new job
===

## Setup Git Repo
Go to New Item > Build a maven project > Select Git under Source Code Management > Set URL as "https://github.com/dzuluagaapigee/apigee-ci-jenkins-git-maven-jmeter.git". Since this is a public repo, there's no need to set any credentials. In case you need to connect to a private repository, [you'll need to setup ssh keys generated from you Virtual Box to be added to the private repo](https://github.com/Tozkoparan/Deneme/wiki/Setup-Jenkins-for-working-with-a-private-Github-repository).

## Setup Build Trigger

For simplicity, setup Jenkins to poll for changes every 15 minutes under Build Triggers
```H/15 * * * *```

## Setup Maven Execution Step

Set Root POM as ```apiproxies/forecastweatherapi/pom.xml```

Set Goals and Options as ```install -P test -D username=${username} -D password=${password}``` username and password can reside under settings.xml. settings.xml file can be found under this folder /var/lib/jenkins/tools/hudson.tasks.Maven_MavenInstallation/Maven_3.0.5/conf/settings.xml.

## Run Job

Go back to Job and click "Build Now"

## Check build history

## Test Analysis
### Analize JMeter Log files (JTL)

##Notifications

### Setup email

Setup email from Manage Jenkins > Configure System > E-mail Notification
For a small test, [GMail SMTP settings can be setup](https://www.digitalocean.com/community/tutorials/how-to-use-google-s-smtp-server). Also make sure to create an [App password](https://support.google.com/accounts/answer/185833)

### Edit Job to setup Email Notification

Email notification leverages [Email-ext Jenkins Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Email-ext+plugin). Edit Job configuration and "Add Post Build Action" (make sure to click advanced and pick the proper trigger e.g. Always, Fail, Success, etc.)

##Review Node.js Plugin

##Apigee Development Vagrant Box
The folder apigee-kit-vm contains the tools for development of API Proxies in Apigee. Node.js, NPM, Jenkins, Java, Grunt, etc.

WIP

