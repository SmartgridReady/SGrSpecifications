# SGr XML Schema

## Purpose
The XML schema provides the building block to interoperable device descriptions for smart energy grids and flexible energy management.

### What the schema provides
The schema allows to describe the communication interfaces of existing and new devices. Such a XML description contains
- device information
- data points, grouped into functional profiles
- how to read from or write to data points using modbus or RestAPI as transport service

### Out of Scope
The schema does not standardize or structure any use cases, or use-case related groups of standardized data points. This would be
the purpose of published [functional profiles](functionalProfile.md)

## General XSD Structure

### Building Blocks
The  elements in [SGrBaseDeviceFrame.xsd](/SchemaDatabase/SGr/Generic/SGrBaseDeviceFrame.xsd) ) form the base building blocks for the schema. They are

| Element            | Description |
|--------------------|-------------|
| Device             | Describes high-level and generic attributes of the device |
| Functional Profile | Describes the attributes of a [functional profiles](functionalProfile.md) |
| Data Point         | Describes the attributes of a data point |

### Frame Types for each Transport Layer
Based on the building blocks the schema then defines root elements for the different product and communicator types, depending on their communication layers.
The base building blockes are grouped together, and enriched with transport-service specific information.

![Schema Entity Relation](SGrSchema.png)

For each transport service the schema defines a specific root element based on the structure above. This element groups basic building blocks (white) together
with transport-layer-specific elements into the generic structure of device and a list of functional profiles with their list of data points.

## Transport Services
Currently the schema defines the following root elements

| Element                  | Description |
|--------------------------|-------------|
| SGrGenDeviceFrame        | Generic device without any specified transport service |
| SGrContactAPIDeviceFrame | Device with electrical contacts |
| SGrModbusDeviceFrame     | Modbus device  |
| RestApiDeviceFrame    | RestAPI device |