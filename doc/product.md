# Product Description Schema

## Use case

A product description contains information about the device, its supported functional profiles, and how
the datapoints of the functional profiles can be accessed through the transport layer.

This allows potential controllers to easily integrate, implement, or access any SmartGridready certified product
through a standardized set of functionality, and thereby greatly simplifies scale-up to support a wide range of products.

## General Structure
The schema of the product description is structured on three levels:
- Device information concerning manufacturer and product data, and the basic configuration of the transport layer
- A list of supported functional profiles
- A list of data points (as defined in the respective functional profile definition) together with transport layer details on how to access the individual data point

The figure below shows the entity relation model of the product description.

![Product Entity Relation](product.drawio.png)

# Device Elements

### Release Notes
The release note section contains meta data that describe history and current state of the functional profile

| Element   | Description |
|-----------|-------------|
| state     | One of Draft, Review, Released, Revoked |
| remarks   | Optional, arbitrary text. Can be useful e.g. during draft phase. |
| changeLog | Optional, can occurs multiple times. Contains release notes to the version concerned |

### Device Information
| Element          | Description |
|------------------|-------------|
| Name             | Device Name |
| Manufacturer     | Manufacturer |
| specOwnerId      | Owner of the declaration (normally identical to manufacturer, but different for 3rd party declarations) |
| Type             | local or cloud device |
| DeviceCategory   | Device Category |
| SoftwareRevision | Software revision of device |


### Device Attributes

| Element | Description |
| ------- | ----------- |
| levelOfOperation | Level of control defining the complexity (see [LevelOfOperation](LevelOfOperation.md) ), and is defined by the highest level of the devices functional profile |

### Descriptions
| Element     | Description |
|-------------|-------------|
| alternativeNames  | A list of relevant namespaces list for to display names used in different standards like EEBUS, IEC6850,, SAREF4ENER etc. (see [AlternativeNames](AlternativeNames.md))|
| legibleDescription | Optional, can occur once per language. Contains details concerning the intended use case of the functional profile. |

### Transport Service
| Element     | Description |
|-------------|-------------|
| transportService | One of Generic|Contacts|Modbus|RESTfulJSON |

Depending on the type of root element a transport-service specific structure is present, describing the device-specific transport-service configuration

## Functional Profiles
Each device contains a list of functional profiles.
| Element     | Description |
|-------------|-------------|
| profileName | Instance name of the specified functional profile, containing Release Notes, Classification, Description |
| functionalProfile | Copy of the standardized [functional profile](functionalProfile.md) |
| programmerHints   | optional, can occur once per language. Contains details for the programmer. |


## Data Points
Each functional profile instance contains a list of data points in accordance with the standardized functional profile.
| Element     | Description |
|-------------|-------------|
| Data point | Data point of the standardized [functional profile](functionalProfile.md), containing name, description, units, data type, read/write, mandatory/recommended/optional information |
| Transport Layer Info| transport-service specific information on how to access the data point |
| programmerHints   | optional, can occur once per language. Contains details for the programmer. |

