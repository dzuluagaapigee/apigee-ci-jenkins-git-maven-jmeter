# weather-api JMeter test scripts


## Overview

**weather-api test scripts** is a library of JMeter scripts to demonstrate specific functionality to build your *test suite* using a public and stable api as Yahoo Weather. Each test script provides specific functionality such as: *header validation, simple matching of RegEx content, advanced JSON content validation, parameterization, etc*  


### weather-validate-json-payload.jmx
This script explains the usage of BSF (Bean Scripting Framework) validating JSON payload content by parsing JSON and then applying specific logic such as: validation of the number of elements that an array element is expected to have.

**use with weather-validate-json-payload.csv**

**NOTE: Avoid using eval expression as it introduces obscure elements difficult to debug. Keep your scripts simple, so any developer can debug them. Since Maven does the work of executing scripts under tests folder, there's no need to create a monolythic script with too many variations of test cases. <br>Execute from command line:**

```
sh $JMETER/bin/jmeter.sh -n -t weather.jmx -J threadNum=12 -J rampUpPeriodSecs=12 -J loopCount=3 -J testData=weather_dev.csv -l results.jtl
```
