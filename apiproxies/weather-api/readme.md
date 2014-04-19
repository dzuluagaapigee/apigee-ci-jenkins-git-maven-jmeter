APIName API
=================

<a name="Summary"></a>
# Summary
The L.L.Bean APIName API allows developers to ____________.  Given an APIName ID, the APIName response will provide ____.

Paste a simple response example below...(this example is from Department API)
~~~ javascript
    {
        "id": 27,
        "name": "Women&#039;s",
        "count": 1070,
        "level": 0,
        "dept" : [
            {
                "id": 607,
                "level": 1,
                "name": "Shirts",
                "count": 130,
                "dept": [
                   {
                       "id": 504209,
                       "level": 2,
                       "name": "Tees & Knit Tops",
                       "count": 66
                   },
                   {
                       "id": 502972,
                       "level": 2,
                       "name": "Button-Front",
                       "count": 31
                   }
               ]
           }
       ]
    }
~~~~

The APIName API is what you will want to use when you need to provide a way for your users to ______.


<a name="Example"></a>
## Example

The following example will illustrate how to obtain APIName using curl commands.  The purpose of this example is to provide working code for accomplishing the requirements of your app.

This guide presents a step by step process to help you gain immediate access to the APIName API so you may look around right away. Please do take copious notes of these commands as it's best to have a firm understanding of the most basic requests.

The following example makes a fictitious request using the consumer app key.

~~~~
curl  https://api.llbean.com/v1/APIName/27 /
 -H "key: YWFiYmNjZGRlZTEyMzQ1OjIyMjMzNDQ1NQ
~~~~

> But I'm getting a "HTTP/1.1 401 API is secure. Needs security Credentials" error!

If you've already asked yourself this question, or have seen one of these errors; you may have moved too fast. Please review the developer channel Getting Started Guide [here](http://developer.llbean.com/get-started).

If you have difficulties with any of these please email the API management team api@llbean.com or start a conversation in the [forum](http://developer.llbean.com/forum). 


The following example provides the most basic APIName API response payload.

paste an example below.  This example is from the Departments API.
~~~~ JSON
    {
        "id": 27,
        "name": "Women&#039;s",
        "count": 1070,
        "level": 0,
        "dept" : [
            {
                "id": 607,
                "level": 1,
                "name": "Shirts",
                "count": 130,
                "dept": [
                   {
                       "id": 504209,
                       "level": 2,
                       "name": "Tees & Knit Tops",
                       "count": 66
                   },
                   {
                       "id": 502972,
                       "level": 2,
                       "name": "Button-Front",
                       "count": 31
                   }
               ]
           }
       ]
    }
~~~~

### Congratulations! You're Done! 

> Are you serious? Is that all? Okay, you must be kidding me?

There's a lot more. However, before digging in much deeper it is important to 
note that the L.L.Bean APIName represents a very complex data model. With this 
understanding, and to aid in the usability of the API, our team focuses 
on the minimum viable product you, the developer, may require to 
build your fantastic app.

<a name="entity-expansion"/>
## Entity Expansion

Many of the L.L.Bean APIs support what we like to call entity expansion or 
"expands parameters". These querystring parameters allow the app developer to 
choose what portions of the entity are appropriate for the use case. 

In addition, these options allow our API product owners to decide which 
entities make sense to allow developers to access.

The following are the expansion parameters that are supported in the APIName API.

The Department API is used as an example but paste the APIName specific info below.

<a name="entity-expansion-items"/>
### Product 
> The product entity represents product within the specified APIName.  Example from APIName API. Paste the APIName specific information below.

~~~~
curl  https://api.llbean.com/v1/departments/607?expand=products \
-H "key: I6kFwQqUvAU6JKCM6rpFrCdfd6OnOAZV"
~~~~

~~~~
{
  "id": 27,
  "name": "Women's",
  "count": 1053,
  "level": 0,
  "dept":  [
     {
      "id": 607,
      "name": "Shirts",
      "count": 133,
      "level": 1,
      "dept":  [
         {
          "id": 504209,
          "name": "Tees & Knit Tops",
          "count": 67,
          "level": 2,
          "dept":  []
        },
         {
          "id": 502972,
          "name": "Button-Front",
          "count": 33,
          "level": 2,
          "dept":  []
        },
         {
          "id": 502974,
          "name": "Turtlenecks",
          "count": 9,
          "level": 2,
          "dept":  []
        },
         {
          "id": 502969,
          "name": "Polos",
          "count": 2,
          "level": 2,
          "dept":  []
        },
         {
          "id": 502975,
          "name": "Active",
          "count": 33,
          "level": 2,
          "dept":  []
        }
      ]
    }
  ],
  "products":  [
     {
      "id": "32709",
      "name": "Pima Cotton Tee, Short-Sleeve Crewneck"
    },
     {
      "id": "31482",
      "name": "Pima Cotton Tee, Sleeveless Shell"
    },
     {
      "id": "74846",
      "name": "Pima Cotton Scoopneck, Elbow-Sleeve"
    }
  ]
~~~

There are several templates that could be used for the Security section.   Below are a couple of examples to start from...

<a name="security"/>
## Security

First and foremost is security. On our API Platform the consumer app is a trusted 
system that interacts with L.L.Bean digital assets via an API. The L.L.Bean 
APIName API is protected with     Fiil in as appropriate          factors:

### 1. Consumer Key Validation
It is important to protect L.L.Bean APIs from unauthorized access. One of the 
 primary ways we do this is by validating your API consumer application key.

All developer apps must be approved by an L.L.Bean API administrator and 
will be provided a consumer key and secret. It is of utmost importance 
that you, the app developer, treat these credentials with special care.

When making requests to L.L.Bean APIName API you will be required to provide your 
Consumer key. 

> Your consumer app key is unique for your app and should be kept 
in a secure location.

* Do NOT store consumer keys in your source management system.
* Do NOT reference your key in your application documents.
* Do NOT allow your key to be exposed in .bash_history files.
* Do NOT post your key on the developers forum or when sending emails into the API Team.
* Do NOT hard code your key inside of your app code.


> Because we care, periodically the L.L. Bean API team will require credentials 
be regenerated.  In the event this needs to occur the email address 
associated with your app will be notified.

To find the authorization credentials for an existing app, follow these steps:

1. Go to the Developer Channel http://developer.llbean.com
2. In the top right, hover over your email address and click my apps.
3. Select an application to view its authorization credentials. 
4. Make your API request passing your consumer key


### 2. Transport Layer Security (TLS): 
All API service endpoints are encrypted using SSL. Strict use of HTTPS avoids 
intercepting the API calls and authorization headers between your app and 
the L.L.Bean API platform.


Another option for security .......

### Application Layer Validation
All developer apps must be approved by an L.L.Bean API administrator and provided a consumer key and secret. It is of utmost importance that you, the app developer, treat these credentials with special care.
### OAuth V2 Client Credentials grant
All developer apps wishing to interact with the Purchases API will be required to exchange the consumer key and secret for an access token which, when presented to the Purchases API endpoints, can retrieve Purchase-history-related data for any customer.
### Customer data verification
All developer apps built by external organizations or third parties will be required to provide additional customer information to verify appropriate access. This may include the customer's last name, postal code, the store where the item was purchased, or the date.
### Transport Layer Security (TLS):
All API service endpoints are encrypted using SSL. Strict use of HTTPS avoids intercepting the API calls and authorization headers between your app and the L.L.Bean API platform.

End of suggestion for another option ....

<a name="Response Codes"></a>
## Response Codes
Response codes are used to indicate when something has gone right or wrong with our API or your app.
Here are some additional examples of errors you may run into when developing your app. The following are pseudocode so please don't attempt to copy and paste.

### 200 OK
 
Request:
> GET  https://api.llbean.com/v1/departments/27  

 Response:
> HTTP/1.1 200 OK

~~~~ JSON
   {"beautiful":"payload"}
~~~~


This is a beautiful thing! And most likely everything went off without a 
hitch! We try hard to ensure that all 200 response codes mean your 
app is okay to go about its business.

### 500 Server Error   <a name="department-api-500-error"/>

Request:
> GET https://dev.api.llbean.com/v1/departments/60?expand=products

Response:
> HTTP/1.1 500 Internal Server Error

~~~~ JSON
{
  "fault": {
    "faultstring": "Page Not Available<br><b>We're sorry, the page you requested is not available.</b>",
    "detail": {
      "errorcode": "500"
    }
  }
}
~~~~



<a name="traffic-management"/>
## Traffic Management

The APIName API uses a combination of low and high-traffic management 
policies to protect your app, and L.L.Bean's back, from excessive load. 
All API requests are subject to a default policy; however, as a customization, 
each individual developer app can have a value set by an API management team member.

<a name="spike-arrests"/>
## Spike Arrests

SpikeArrests stop traffic spikes (or bursts) that can be caused by an 
increase in usage, buggy clients, or malicious attacks.

| Policy       |  Number of requests (default)    |  Units          |
|  :-------    |  :------                         |  :------        |
| High Use     |   15                             |  Per second     |
| Low USe      |    3                             |  Per second     |

<a name="quota-management"/>
## Quota Management

A Quota is an allotment of request messages that an app is allowed to 
submit to an API over the course of an hour, a day, a week, or a month.

| Policy       |  Number of requests (default)    |  Units                            |
|  :-------    |  :------                         |  :------                          |
| High Use     |   54,000                         |  Per hour or per Developer App    |
| Low USe      |   10.800                         |  Per hour or per Developer App    |

> okay now I'm ready for the really gory details. Let's see all those
 specs again in a detailed tabular format.
 
The following information has been designed to provide a detailed REST 
API specification for the APIName API.


<a name="API Resource"></a>
## API Resource: APIName API Resources and URIs

## APIName Resources

<a name="Description"></a>
### Description of APIName

The L.L.Bean APIName allows developers to xxxxxxxx.

Given a xxxxxx, APIName will provide xxxxxxxx.

<a name="Resource Security"></a>
### Security specific to APIName
xxxxxxxxx

<a name="Resource Error codes"></a>
### Response Codes specific to APIName Resource
* See Global definition
   


<a name="Request"></a>
### Request for APIName

<a name="URI Template"></a>
#### URI (Template)

```
/v1/xxxxxxx
```

<a name="Request Parameters"></a>
### Request Parameters for APIName

| Parameter Name | Description                           | Example Values | Usage                                |
| :------        | :------                               | :-----         | :-----                               |
| xxxxxxx        | xxxxxxxxxxxxxxxxxxxxx                 | 999999999      | xxxxxxx                              |
| xxxxxxxxxx     | xxxxxxxxxxxxxxxxxxxxxxxxxx            | 99999999999    | xxxxxxx                              | 

<a name="Example Request"></a>
### Example Requests

| Resource       |                 |
| :------        | :------         | 
| Find By xxxxxx | //v1/xxxxxx     |
| Find By xxxxxx | //v1/xxxxxxxx   |


<a name="Verbs"></a>
### Supported Verbs

|          | Get     | Post    | Put     | Delete  |
| :------  | :------ | :------ | :------ | :------ |
| All Users | X      |         |         |         |

<a name="Request Headers"></a>
### Request Headers

| Header Name   | Example                          | Description                    |
| :------       | :------                          | :------                        |
| Authorization |  MQEWYHd8Ysq3I1ND03ZzbY          | Bearer Token                   |  
| key           |  CvoV0BpqTUsPeVl6BYtoMn          | Consumer Key                   |  

<a name="Response"></a>
### Response Entities for APIName

<a name="Attributes"></a>
#### APIName Attributes
| Attribute Name | Example Value | Cardinality | Description          | 
| :------        | :------       | :------     | :------              |
| name           | value         | xxxxx       | 	xxxxxxx            |





<a name="Response Headers"></a>
#### Response Headers

| Header Name   | Example                          | Description                    |
| :------       | :------                          | :------                        |
|               |                                  |                                |  
|               |                                  |                                |


<a name="Response Errors"></a>
#### Response Errors specific to APIName
* See Global definition
   
| Response Code | Reason Phrase | Payload |
| :------       | :------       | :-----  |
|               |	              |         | 
|               |               |         | 


### Request for APIName Detail

The Department API is used as an example below....

<a name="url-template"/>
### URI (Template)

```
/v1/departments/{department_id}
```

<a name="request-parameters"/>
### Request Parameters

| Parameter Name | Description                             | Example Values   | Usage                       |
| :------        | :------                                 | :-----           | :-----                      |
| expand         | Expands products within the department. | products         | Constant  (See Expands)     |
| position       | Pseudo pagination for products associated to a department. | 10 | Numeric Value

<a name="example-requests"/>
### Example Requests

| Resource | Template | Example 
| :------    | :------ |  :------- | 
| Find Department By Id | /v1/departments/{department_id} | http://api.llbean.com/v1/departments/607 |
| Find Department By Id expanding products | /v1/departments/{department_id}?expand={entity}  | http://api.llbean.com/v1/departments/607?expand=products |

<a name="supported-verbs"/>
### Supported Verbs

|            | Get     | Post    | Put     | Delete  |
| :------    | :------ | :------ | :------ | :------ |
| All Users  | X       |         |         |         |

<a name="request-headers"/>
### Request Headers

| Header Name   | Example                          | Description                    |
| :------       | :------                          | :------                        |
| key           |  CvoV0BpqTUsPeVl6BYtoMn          | Consumer Key                   |


<a name="response-headers"></a>
### Response Headers

| Header Name                                 | Example          | Description  |
| :------                                     | :------          | :------ |


<a name="response-entities"></a>
### Response Entities

<a name="Attributes"></a>
#### Department Attributes
| Attribute Name | Example Value | Occurance   | Description                             |
| :------        | :------       | :------     | :------                                 |
| id             | 27            | Always 1    | numeric, Department ID                  |
| name           | Women&#039;s  | Always 1    | Department name                         |
| count          | 1070          | Always 1    | Number of products in the department    |
| level          | 0             | Always 1    | The level of this department within the hierarchy. 0 thourgh 2. |
| dept           |               | Optional    | The child department information. Supports 3 levels (0 highest-2 lowest providing product list) |
| products       |               | Optional    | The associated products                 |
