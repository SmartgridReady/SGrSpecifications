# Product Description Schema

## Use case

A product description contains information about the device, its supported functional profiles, and how
the data points of the functional profiles can be accessed through the communication interface.

This allows potential controllers to easily integrate, implement, or access any SmartGridready certified product
through a standardized set of functionalities, and thereby greatly simplifies scale-up to support a wide range of products.

## General Structure

The schema of the product description (EID, External interface definition) is structured on four levels:
- Device information concerning manufacturer and product data, and the basic configuration of the communication interface.
- A list of communication interfaces (e.g. Contacts, RESTfulJSon, Modbus, Messaging). Although it is in principle possible to define more than one communication interface in one product description if a device supports more than one type of communication, it is recommended to separate them into separate product descriptions.
- A list of supported functional profiles. The functional profiles must have the same content as those defined in the list of functional profiles. (see [Functional Profile Structure](functionalProfile.md), [List of Functional Profiles](https://library.smartgridready.ch/FunctionalProfileTemplate)).
- A list of data points (as defined in the respective functional profile definition) together with communication interface details defining how to access the individual data point.

The figure below shows the entity relation model of the product description.

![Product Entity Relation](product.drawio.png)

## Device Elements

### Device Identification

| Element          | Description |
|------------------|-------------|
| deviceName       | name of the device |
| manufacturerName | name of the manufacturer |
| specificationOwnerIdentification | Owner of the declaration (normally identical to manufacturer, but different for 3rd party declarations) |

### Release Notes

The release note section contains meta data that describe the history and the current state of the functional profile

| Element   | Description |
|-----------|-------------|
| state     | one of `Draft`, `Review`, `Released`, `Revoked` |
| remarks   | optional, arbitrary text. Can be useful e.g. during draft phase. |
| changeLog | optional, can occurs multiple times. Contains release notes to the version with version, date, author, and comment |

### Device Information

| Element          | Description |
|------------------|-------------|
| alternativeNames  | a list of relevant name spaces list for to display names used in different standards like EEBUS, IEC6850, SAREF4ENER etc. (see [AlternativeNames](AlternativeNames.md))|
(AlternativeNames.md) |
| legibleDescription | can occur once per language. Contains details concerning the intended use case of the functional profile. |
| deviceCategory        | type of the device - see [Device Category](deviceCategory.md) |
| isLocalControl   | Value `false` means "is cloud control device", indicating that this service is based on cloud. `true` indicates that services are provided within the range of the local area. |
| softwareRevision | software version information for this product declaration |
| hardwareRevision | hardware version information for this product declaration |
| brandName | branding information |
| powerSource | power supply type |
| manufacturerSpecificationIdentification | manufacturers specification identifier |
| manufacturerLabel | manufacturers label of the device |
| generalRemarks | remarks and non disclaimer statements |
| levelOfOperation | level of control defining the complexity (see [LevelOfOperation](LevelOfOperation.md) ), and is defined by the highest level of the devices functional profile |
| versionNumber | version number of the Product Description (EID) - first two parts should be the same as in the file name |
| programmerHints | additional device-specific implementation hints for this device |

### Configuration

Values in the product definition can contain place holders e.g. for IP addresses, device ID's, ...
These place holders are keys enclosed with double braces `{{}}`. The values for the keys must be provided during the instantiation of the product.

Example: `{{ipaddress}}`

The keys should be documented in a list of configuration items. Each item contains

| Element          | Description |
|------------------|-------------|
| name             | key name |
| dataType         | the data type of this value|
| defaultValue     | optional default value  |
| configurationDescription | description of the configuration item - can be repeated for each language|

Each configurationDescription element contains

| Element          | Description |
|------------------|-------------|
| textElement      | description of the configuration item |
| language         | the language |
| label | short label to be displayed during the configuration of the device |

## Communication Interface

Although it is possible to define a list of communication interfaces for future use, it is strongly recommended to
define one product description for each communication interface the product supports.
(Also the current support libraries do not support multiple communication interfaces.)

Currently supported communication interfaces are

| Interface     | Description |
|-------------|-------------|
| contactInterface | product with physical contacts | 
| restApiInterface | product with a RESTfulJSON interface | 
| modbusInterface | product with a Modbus interfacee | 
| messagingInterface | product with a messaging interface (e.g. MQTT) |

Depending on the type of root element a transport-service specific structure is present, describing the device-specific communication interface configuration

### Contacts Communication Interface

The contacts interface has the following properties

| Element          | Description |
|------------------|-------------|
| numberOfContacts      | number of contacts |
| contactStabilisationTimeMs | Time in milliseconds until a contact has reached a stable state after switching |

Usually, a product description with contacts is only for documentation, as the access to contacts from a communicator is not possible.

### Rest API Communication Interface

The RestAPI interface has the following properties

| Element          | Description |
|------------------|-------------|
| restApiInterfaceSelection      | Type of Rest Api interface as one of `TCPV4`, `TCPV6`, `URI` |
| restApiUri | Address of the RestAPI server |
| restApiAuthenticationMethod | Authentication method as one of `NoSecurityScheme`, `BearerSecurityScheme`, `ApiKeySecurityScheme`, `BasicSecurityScheme` `DigestSecurityScheme`, `PskSecurityScheme`, `OAuth2SecurityScheme`, `HawkSecurityScheme`, `AwsSignatureSecurityScheme` |
| restApiBearer | Service calls for authentication |
| restApiBasic | User name and password for authentication |
| restApiVerifyCertificate | Indicates whether a certificate is required |




## Functional Profiles
Each device contains a list of functional profiles.
| Element     | Description |
|-------------|-------------|
| profileName | instance name of the functional profile entry - a device can include a specific functional profile more than once but with different profile instance names |
| functionalProfile | copy of the standardized [functional profile](functionalProfile.md) |
| programmerHints   | optional, can occur once per language. Contains details for the programmer. |


## Data Points
Each functional profile instance contains a list of data points in accordance with the standardized functional profile.
| Element     | Description |
|-------------|-------------|
| Data point | data point of the standardized [functional profile](functionalProfile.md), containing name, description, units, data type, read/write information |
| Interface Info| transport-service specific information on how to access the data point |
| programmerHints   | optional, can occur once per language. Contains details for the programmer. |

### Sub Data Points

Data Points that are defined as Sub Data Points are handled in the same way as the normal data points with all consequences. But a sub data point can only be used in the device if the main data point is also used.

### Constant Data Points

Additional to the data points in the functional profile the product has the concept of constant data points that can implement the data point of the functional profile and that have a constant value.

For this, the data direction `C` is possible in products. In this case, a value must be defined for the data point.

### Generic Attributes
SGr allows to associate attributes to a data point. See [GenericAttributes](GenericAttributes.md) for details.

The generic attributes (see [GenericAttributes](GenericAttributes.md)) contain static characteristics of the product.

The generic attributes are a list of elements defined by

- name
- data type
- value
- description

## File Naming Schema
File names for Products Definitions (EID's) should have the following file naming conventions:

`SGr_[LevelOfOperation]_[ManufacturerId]_[DesclarationId]_[Manufacturer]_[ProductName]_V[PrimaryVerion].[SecondaryVerion].xml`

with

- `LevelOfOperation`: as defined in [LevelOfOperation](LevelOfOperation.md) with 2 digits without `m` and with leading `0`
- `ManufacturerId`: maintained by the declaration office - `mmmm` if not yet known
- `DesclarationId`: maintained by the declaration office - `dddd` if not yet known
- `Manufacturer`: manufacturer name - short - if possible only one word
- `ProductName`: product name - short - if possible only one word
- `PrimaryVerion` / `SecondaryVerion`: first two parts of the version of the Product Definitions (EID's) - same as [versionNumber](product.md#device-attributes)

If there are more Product Definitions for one product with different interfaces, the interface can optionally be added as `Interface` with values `RestAPI`, `MQTT`, `Modbus`, `ModbusRTU`, `ModbusTCP`, ...

`SGr_[LevelOfOperation]_[ManufacturerId]_[DesclarationId]_[Manufacturer]_[ProductName]_[Interface]_V[PrimaryVerion].[SecondaryVerion].xml`
