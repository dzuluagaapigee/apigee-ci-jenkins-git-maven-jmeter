# Setting up new API proxy bundle based on template

**This section defines the steps developer has to go through in order to create a bundle for new API proxy in ApigeeEdge.**

1. Create a new directory in the **apiproxies** dir with new api name.
2. Copy the contents of already existing template proxy called **weather-api** (everything this directory contains).
3. Rename main proxy xml file to suit the name of new proxy (apiproxy/weather.xml - rename with the new name).
4. Go to pom.xml file of the API proxy. The following parameters have to be changed to reflect the name of your new proxy: **<artifactId>** and **<name>**.
5. While still in pom.xml change the JMeter test data .csv file names to match test data file names your new proxy has. This will ensure that correct test data is being used. The element name you have to change is **<testData>**
6. Next step is to edit **config.json** file. You have to specify any steps / file changes and assertions required for your new API proxy during deploy time. Separate changes have to be made for each environment (for example **dev, qae, stg** etc.) 