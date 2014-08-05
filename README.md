Install Jenkins Vagrant Box
======
run ```vagrant up``` to download and install vagrant box. This box will also execute bootstrap.sh, which contains the command to install git, JRE, JDK and Jenkins. 

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
