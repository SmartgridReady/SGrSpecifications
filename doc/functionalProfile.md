# Functional Profile

## General Concept

A functional profile contains a set of data points that support the implementation of a specific use case. It thereby
focuses entirely on the functionality. Any transport-specific details are not part of the functional profile (e.g.
on how to get or set a data point on a specific product).

The main intent is to allow communicator manufacturers to easily implement their use cases based on logically grouped data points, while device-specific communication details to the SGr communicator library. Any product that supports the functional profiles required for a specific use case is therefore  automatically compatible and can be used without changing the implementation.

The functional profiles are located on [library.smartgridready.ch](https://library.smartgridready.ch/FunctionalProfileTemplate).

## Structure 

A functional profile is structured into the following elements

- Definition of the functional profile with identification and description
- Generic attributes defining static characteristics of the product
- Data points defining access points to data of the product

### Definition

A functional profile is defined by

- the category of the functional profile defines the usage of the product (see [FunctionalProfileCategory](FunctionalProfileCategory.md))
- the type of the functional profile
- the level of operation (see [LevelOfOperation](LevelOfOperation.md))
- the version number

All these values must be used identically in the product to match a functional profile.

Additionally to this, the definition contains the description of a functional profile in English, German, French, and/or Italian language.

### Generic Attributes

The generic attributes (see [GenericAttributes](GenericAttributes.md)) contain static characteristics of the product. All generic attributes defined in the functional profile must also later be defined in product.

The generic attributes are a list of elements defined by

- name
- data type
- value
- description

The value of generic attributes is optional in the functional profile. The declared product must define the actual value.

### Datapoints

The datapoints define dynamic values that can be read from or written to the product.

Each datapoint is defined by

- a name to identify the datapoint
- a data direction defining whether the data can be
  - R: read
  - W: written
  - WR: read and written
- a presence level
  - M: mandatory - datapoint must be present in the product
  - R: recommended - datapoint should be present in the product
  - O: optional - datapoint can optionally be present in the product
- the data type of the data point
- the unit of the data point
- and a description of the data point

If a datapoint is defined as mandatory in the functional profile, it must also be present in the product implementing this functional profile.

If no datapoint is mandatory in the functional profile, then at least one datapoint must be recommended and at least one of the recommended datapoints must be present
in the product implementing this functional profile.

Like the generic attributes for the functional profile also the datapoints can have local generic attributes.

## Using Functional Profiles for declaration 

For the declaration of the a product the following flow is proposed:

- Fill in general information of the product like
  - device name
  - manufacturer name
  - device category
  - hardware and software version numbers
- Select the possible interface of the product (Modbus, RESTfulJSON, Contacts).
- Select the functional profiles from the [library](https://library.smartgridready.ch/FunctionalProfileTemplate) that should be implemented by the product.
- Copy the selected functional profiles into the product and add a name to the functional profile (with this it is possible to implement a
  functional profile more than once with different names).
- Fill in the values for the generic attributes as well as the configuration of the datapoints.
- Add a description to the datapoint.

More information can be found on [smartgridready.ch](https://smartgridready.ch/deklaration/product-communicator).

# For developer - schema of functional profiles

## General Structure

The schema of the functional profile is structured on two levels:
- information concerning the entire functional profile
- a list of data points

The figure below shows the entity relation model of the functional profile

![Functional Profile Entity Relation](functionalProfile.drawio.png)

## Functional Profile Attributes

### Classification
SGr classifies and identifies any functional profile by the following values

| Element               | Description |
|-----------------------|-------------|
| specificationOwnerIdentification          | Identifier of the functional profile owner. |
| functionalProfileCategory | Functional profile class (see [SGrFunctionalProfileCategory.xsd](../SchemaDatabase/SGr/Generic/BaseType_FunctionalProfileCategory.xsd) ) |
| functionalProfileType       | Functional profile subclass |
| levelOfOperation   | Level of control defining the complexity (see [LevelOfOperation](LevelOfOperation.md) ) |
| versionNumber         | Version of the functional profile. Changes in primaryVersionNumber indicate breaking changes, changes in secondaryVersionNumber indicate complimentary changes, changes in subReleaseVersionNumber are without impact on the functionality | 

## Generic Attributes
SGr allows to associate attributes to a functional profile (i.e. concerning every data point). See [GenericAttributes](GenericAttributes.md) for details. Any attribute defined on the functional profile level are mandatory to any product that implements this functional profile. However, the product can optionally add further attributes based on its own needs.

## Data Points
A functional profile mainly defines a set of datapoints. The attributes of a datapoint are defined in the next section.

# Data Point Attributes
| Element     | Description |
|-------------|-------------|
| datapointName | Name of the data point. Should be unique within the functional profile |
| dataDirection | R if data point can be read, W for write, P for persistence |
| presenceLevel | Datapoint availability: Mandatory, Recommended, Optional |
| unit | Physical unit of data point |
| dataType |  Data type of the value for the point type |
| alternativeNames | A list of relevant namespaces list for to display names used in different standards like EEBUS, IEC6850,, SAREF4ENER etc. (see [AlternativeNames](AlternativeNames.md))|
| legibleDescription | Optional, can occur once per language. Contains details concerning the intended use case of the functional profile. |

## Generic Attributes
SGr allows to associate attributes to a data point. See [GenericAttributes](GenericAttributes.md) for details.
Any attribute defined on the functional profile level is mandatory to any product that implements this functional profile. However, the product can optionally add further attributes based on its own needs.
The generic attributes in the functional profile can be empty or examples - the actual values are defined in the product XML (they are not read from the product).

tbd update:

The generic attributes (see [GenericAttributes](GenericAttributes.md)) contain static characteristics of the product. All generic attributes defined in the functional profile must also later be defined in product.

The generic attributes are a list of elements defined by

- name
- data type
- value
- description

The value of generic attributes is optional in the functional profile. The declared product must define the actual value.

## New Functional Profiles

## File Naming Schema
Functional profiles should have the following file naming conventions:

`FP_[specificationOwnerIdentification]_[FunctionalProfileCategory]_[FunctionalProfileType]_[levelOfOperation]_[majorVerion].[minorVerion].xml`

## Writing Descriptions
Functional profile descriptions should be structured as follows:
- Image indicating the typical use of the functional profile, together with an easily understandable title
- Short explanation (i.e. long version of the title)
- Detailed explanation, including very attribute.
- Description on how to apply the functional profile concerning presence level (i.e. how to handle recommended and optional data points)

# Attatchment
### Release Notes
The release note section contains meta data that descibe history and current state of the functional profile

| Element   | Description |
|-----------|-------------|
| state     | one of Draft, Review, Released, Revoked |
| remarks   |  Optional, arbitrary text. Can be usefull e.g. during draft phase. |
| changeLog | Optional, can occure multiple times. Contains release notes to the version concerned |

### Descriptions
| Element     | Description |
|-------------|-------------|
| alternativeNames  | a list of relevant namespaces list for to display names used in different standards like EEBUS, IEC6850,, SAREF4ENER etc. (see [AlternativeNames](AlternativeNames.md))|
| legibleDescription | optional, can occure multiple times, but ideally just a once per language. Contains details concerning the intended use case of the functional profile. |
