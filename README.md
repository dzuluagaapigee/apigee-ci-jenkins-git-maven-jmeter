<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](http://doctoc.herokuapp.com/)*

- [Enable Continuous Integration on Apigee Edge](#enable-continuous-integration-on-apigee-edge)
- [Install Virtual Box](#install-virtual-box)
- [Install Jenkins Vagrant Box](#install-jenkins-vagrant-box)
      - [Optional - Jenkins on Cloudbees](#optional---jenkins-on-cloudbees)
- [Install Jenkins Plugins](#install-jenkins-plugins)
      - [Install Plugins with install-jenkins-plugins.sh](#install-plugins-with-install-jenkins-pluginssh)
      - [Hide passwords and sensitive data](#hide-passwords-and-sensitive-data)
- [Install Maven](#install-maven)
- [Create a new job](#create-a-new-job)
  - [Setup Git Repo](#setup-git-repo)
  - [Setup Build Trigger](#setup-build-trigger)
- [Notifications](#notifications)
- [Jenkins CLI](#jenkins-cli)
- [Node.js Plugin and Grunt API Plugin ](#nodejs-plugin-and-grunt-api-plugin)
- [Jenkins on EC2](#jenkins-on-ec2)
- [Jenkins Pull Request Plugin Setup](#jenkins-pull-request-plugin-setup)
- [Contributing](#contributing)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

Enable Continuous Integration on Apigee Edge
=====
The purpose of this repo is to provide a step-by-step guide to enable Apigee Edge bundle deployment on Jenkins for Continuous Integration and Deployment.

Install Virtual Box
======
Download [Virtual Box](https://www.virtualbox.org/wiki/Downloads). **This step is required to run Vagrant.**

Install Jenkins Vagrant Box
======
run ```vagrant up``` to download and install vagrant box. This box will also execute bootstrap.sh, which contains the command to install git, JRE, JDK and Jenkins. 

#### Optional - Jenkins on Cloudbees
An alternative to install Jenkins on a Virtual Machine is to leverage services from a cloud provider such as [Cloudbees](http://www.cloudbees.com/). You can signup for free for 200 build minutes. This environment has been tested successfuly so far.

Install Jenkins Plugins
======

#### Install Plugins with install-jenkins-plugins.sh
after running ```vagrant ssh``` install Jenkins plugins by running install-jenkins-plugins.sh. This script leverages jenkins-cli, which leverages Jenkins API to install Jenkins plugins from Jenkins dependency management. Plugins include: performance, github, github oauth, jira, email extension, mask-passwords, and node.js.
```
cd /vagrant
./install-jenkins-plugins.sh
```

#### Hide passwords and sensitive data
[Mask Passwords Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Mask+Passwords+Plugin) has been installed as part of install-jenkins-plugins.sh. To setup got to Manage Jenkins > Configure System > Mask Passwords - Parameters to automatically mask, Add global passwords. In this case add ae_username and ae_password. These variables will be used from Grunt.js Deploy plugins to deploy bundles to Apigee Edge. Unfortunately, at this point Maven for Jenkins doesn't support Mask Passwords. Alternative solution described below.

Install Maven
====
Point your browser to https://127.0.0.1:8088 on the host OS, Go to Manage Jenkins > Configure System > Maven and pick Maven 3.0.5. Make sure Install Automatically checkbox is ticked.

Create a new job
===

## Setup Git Repo

Name the job as "forecastweather-v1-test"
Go to New Item > Build a maven project > Select Git under Source Code Management > Set URL as "https://github.com/dzuluagaapigee/apigee-ci-jenkins-git-maven-jmeter.git". Since this is a public repo, there's no need to set any credentials. In case you need to connect to a private repository, [you'll need to setup ssh keys generated from you Virtual Box to be added to the private repo](https://github.com/Tozkoparan/Deneme/wiki/Setup-Jenkins-for-working-with-a-private-Github-repository).

## Setup Build Trigger

For simplicity, setup Jenkins to poll for changes every 15 minutes under Build Triggers
```H/15 * * * *```

## Enable Mask Passwords
Enable Mask passwords under Build Environment

## Setup Maven Execution Step

Set Root POM as ```apiproxies/forecastweatherapi/pom.xml```

Set Goals and Options as ```install -P test -D username=$ae_username -D password=$ae_password```. username and password can reside under settings.xml. settings.xml file can be found under this folder /var/lib/jenkins/tools/hudson.tasks.Maven_MavenInstallation/Maven_3.0.5/conf/settings.xml. Sample settings.xml file included in this repo under Vagrant folder.

A quick and dirty solution is to add Global Properties under Manage Jenkins > Configure System. Be aware that this won't prevent from including them in the console output.

## Run Job

Go back to Job and click "Build Now"

## Check build history

## Test Analysis
### Analize JMeter Log files (JTL)
Configure forecastweatherapi Job and under Add post-build action pick Publish Performance test result report, add a new JMeter report and provide the path under the workspace as apiproxies/forecastweatherapi/target/jmeter/results/*.jtl. Under Relative Thresholds for build comparison, set Unstable % Range negative as 80 and positive as 100. Set Failed % Range negative as 90 and positive as 100. Save and run this job. The next time this job is executed, performance reports will be generated.

Notifications
========

### Setup email

Setup email from Manage Jenkins > Configure System > E-mail Notification
For a small test, [GMail SMTP settings can be setup](https://www.digitalocean.com/community/tutorials/how-to-use-google-s-smtp-server). Also make sure to create an [App password](https://support.google.com/accounts/answer/185833)

### Edit Job to setup Email Notification

Email notification leverages [Email-ext Jenkins Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Email-ext+plugin). Edit Job configuration and "Add Post Build Action" (make sure to click advanced and pick the proper trigger e.g. Always, Fail, Success, etc.)

Jenkins CLI
========
Jenkins CLI commands are available under [Manage Jenkins](http://127.0.0.1:8088/cli/).
#### Exporting Jobs
Run ```vagrant ssh``` and ```java -jar ./jenkins/jenkins-cli.jar -s http://localhost:8080/ get-job forecastweather-v1-test > forecastweather-v1-test.xml```. You should see an export of the job created in previous steps.

Node.js Plugin and Grunt API Plugin 
=======
#### Install Node.js and Grunt-cli
Go to Manage Jenkins > Configure System > NodeJS, click on Add NodeJS, pick latest version and include ```grunt-cli@~0.1.13``` under Global npm packages to install.

More info about [NodeJS Plugin for Jenkins Here](https://wiki.jenkins-ci.org/display/JENKINS/NodeJS+Plugin).

#### Create a free-style software project job
This job will allow execution of grunt-cli throughcommand line. Name this job "forecastweather-grunt-test".

### Point Source Code Management to apigee-deploy-grunt-plugin repo
Point SCM to this [repo](https://github.com/apigeecs/apigee-deploy-grunt-plugin.git).

### Enable Mask Passwords under Build Environment
This will leverage the two variables (ae_username and ae_password) created in step above.

### Add build step Execute Shell
Set shell this step to execute the following commands:
```
echo $PATH
node --version
grunt --version
npm install
grunt --env=test --debug --username=${ae_username} --password=${ae_password}
```

For additional directions on enabling a job with Node.js, see this section [here](https://wiki.jenkins-ci.org/display/JENKINS/NodeJS+Plugin#NodeJSPlugin-Usage).

Jenkins on EC2
========
Bitnami Jenkins is a pre-configured, ready to run image for running Jenkins on Amazon EC2.  [Amazon EC2 Bitnami](https://aws.amazon.com/marketplace/pp/B008AT8BYK).

Jenkins Pull Request Plugin Setup
=====
[This plugin](https://wiki.jenkins-ci.org/display/JENKINS/GitHub+pull+request+builder+plugin) is useful to trigger the execution of a Job when a pull request is created. WIP

Contributing
======
If you would like to contribute, simply fork the repository, push your changes to a branch and send a pull request.

Typo fixes, improvements to grammar or readability, it's all welcome.