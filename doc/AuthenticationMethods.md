# SmartGridready Authentication methods

## Introduction

The SmartGridready specification provides a list of authentication methods that can be defined 
for a certain device interface. At the moment, not all authentication methods are supported by the Python and Java libraries.
The matrix in the chapter below (see [Implemented Authentication Methods](#implemented-authentication-methods))


## Specified Authentication Methods 

The specified authentication methods can be applied within an external interface XML (EI-XML).
The table lists the authentication methods supported by interface type and may be subject of change in the future (status 24.05.2024):

<table>
    <tr><th>Security Scheme</th><th>Rest API</th><th>Messaging API</th><th>Modbus</th><th>Description</th></tr>
    <tr><td>NoSecurityScheme</td><td>X</td><td>X</td><td></td><td>No authentication method needed</td></tr>
    <tr><td>BasicSecurityScheme</td><td>X</td><td>X</td><td></td><td>Authentication uses username/password. An example usage is the usage in the HTTP `Authentication: Basic : base64(username:password)` header</td></tr>
    <tr><td>BearerSecurityScheme</td><td>X</td><td></td><td></td><td>Authentication uses a Bearer token. An example usage is the usage in the HTTP `Authentication: Bearer : {token}` header. </td></tr>
    <tr><td>ApiKeySecurityScheme</td><td>X</td><td></td><td></td><td>Authentication an API key. API keys are often used within cloud-sevices, such as AWS web-services. API tokens are usually part of HTTP header in Webservice calls.</td></tr>
    <tr><td>DigestSecurityScheme</td><td>X</td><td></td><td></td><td>Security means that uses a hash in place instead of plaintext to exchange secure data such as passwords.</td></tr>
    <tr><td>PskSecurityScheme</td><td>X</td><td></td><td></td><td>PSK uses Pre-Shared-Keys to secure the communication between two partners. As an example some IoT devices make use of PSK</td></tr>
    <tr><td>OAuth2SecurityScheme</td><td>X</td><td></td><td></td><td>Auth2 is an authorization framework that enables third-party applications to obtain limited access to a user's resources without exposing their credentials.</td></tr>
    <tr><td>HawkSecurityScheme</td><td>X</td><td></td><td></td><td>Hawk is a security scheme that uses a security token/signature within the HTTP header. Example header 'Authorization: Hawk id="dh37fgj492je", ts="1353832234", nonce="j4h3g2", mac="bhCQXTVyfj5cmA9uKkPFx1zeOXM="'</td></tr>
    <tr><td>AwsSignatureSecurityScheme</td><td>X</td><td></td><td></td><td>AWS Signature is a robust and secure method for authenticating API requests to AWS services, ensuring that only authorized clients can access the resources and that the integrity of the requests is maintained.</td></tr>
    <tr><td>ClientCertificateSecurityScheme</td><td></td><td>X</td><td></td><td>The client uses a pre-shared PKI client-certificate that is validated by the server.</td></tr>
</table>

The table lists the authentication methods supported by by interface type a SGr specification ()


## Implemented Authentication Methods

The SmartGrideady libraries in Python and Java do not support all authentication schemes. Additional methods will be added in the future. 
The current status of implementations (status 24.05.2024) is as follows:

<table>
    <tr><th>Library  </th><th>Rest API Interface</th><th>Messaging Interface</th><th>Modbus</th></tr>
    <tr><td>SGrPython</td><td><ul><li>NoSecurityScheme</li><li>BearerSecurityScheme</li></ul></td><td>n.a</td><td>n.a</td></tr>
    <tr><td>SGrJava  </td><td><ul><li>NoSecurityScheme</li><li>BearerSecurityScheme</li><li>BasicSecurityScheme</li></ul></td><td><ul><li>NoSecurityScheme</li><li>BasicSecurityScheme</li></ul></td><td>n.a</td></tr>
</table>
