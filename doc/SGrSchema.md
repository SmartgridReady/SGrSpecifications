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
The base building blocks are grouped together, and enriched with transport-service specific information.

![Schema Entity Relation](SGrSchema.png)

For each transport service the schema defines a specific root element based on the structure above. This element groups basic building blocks (white) together
with transport-layer-specific elements into the generic structure of device and a list of functional profiles with their list of data points.

## Transport Services
Currently the schema defines the following root elements

| Element                  | Description |
|--------------------------|-------------|
| GenericDeviceFrame        | Generic device without any specified transport service |
| ContactDeviceFrame | Device with electrical contacts |
| ModbusDeviceFrame     | Modbus device  |
| RestApiDeviceFrame    | RestAPI device |

## Naming Conventions

### Naming

 The following naming are applied:
 - camelCase for elements, attributes, tags
 - UpperCamelCase for simpleTypes and complexTypes in XSD
 - no abbreviations in general, but trivial ones are OK (e.g. ms for milliseconds)
 - same things have same names
 - use meaningful names that can be understood
 - if the element defines a value with units the name should have the unit as suffix (example: timeToLiveMs for milliseconds)

 ### MinOccurs, MaxOccurs

 - omit the defaults in schema (minOccurs=1, maxOccurs=1)
 - Order
    - name
    - type
    - maxOccurs
    - minOccurs


### Formatting
 - 2 spaces for indentation, no tabs
 - line length should be less than 120 characters
 - just one `<element>`, `<sequence>`, ... per line
 - if a tag uses multiple lines, `<tag>` and `</tag>`are on separate lines

### Elements vs Attributes

As a rule of thumb: Relevant data should use elements, whereas meta data should be put in attributes.
If in doubt whether to use elements or attributes ask yourself if you loose significant information when stripping the XML of all attributes. If yes, use an element, if no an attribute is fine.

 
### Namespace

Use the SGr namespace as default namespace in the XMLs. 


### Schema Compliance

XMLs should always fulfill their schema. No invalid XMLs on master.
