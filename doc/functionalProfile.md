# Functional Profile Schema

## Use case

A functional profile contains a set of data points that support implementation of a specific use case. It thereby
focuses entirely on the functionality. Any transport-specific details are not part of the functional profile (e.g.
on how to get or set a data point on a specfic product).

The main intent is to allow communicator manufacturers to easily implement their use cases based on logically grouped data points, while device-specific communication details to the SGr communicator library. Any product that support the functional profiles required for a specific use case are therefore  automatically compatible, and can be used whithout changing the implementation.

## General Structure
The schema of the functional profile is structured on two levels:
- Information concerning the entire functional profile
- a list of data points

The figure below shows the entity relation model of the functional profile

![Functional Profile Entity Relation](functionalProfile.drawio.png)

## Functional Profile Attributes

### Classification
SGr classifies and identifies any functional profile by the following values

| Element               | Description |
|-----------------------|-------------|
| specificationOwnerIdentification          | Identifier of the functional profile owner. |
| functionalProfileCategory | Functional profile class (see [SGrEnumProfileType.xsd](/SchemaDatabase/SGr/Generic/SGrEnumProfileType.xsd) ) |
| functionalProfileType       | Functional profile subclass (see [SGrEnumSubProfileType.xsd](/SchemaDatabase/SGr/Generic/SGrEnumSubProfileType.xsd) ) |
| levelOfOperation   | levelOfOperation defines a controls complexity  (see [levelOfOperation.md](levelOfOperation.md) ) |
| versionNumber         | Version of the functional profile. Changes in primaryVersionNumber indicate breaking changes, changes in secondaryVersionNumber indicate complimentary changes, changes in subReleaseVersionNumber are without impact on the functionality | 

### Release Notes
The release note section contains meta data that descibe history and current state of the functional profile

| Element   | Description |
|-----------|-------------|
| state     | one of Draft, Review, Released, Revoked |
| remarks   |  Optional, arbitrary text. Can be usefull e.g. during draft phase. |
| changelog | Optional, can occure multiple times. Contains release notes to the version concerned |

### Descriptions
| Element     | Description |
|-------------|-------------|
| fpNameList  | a list of relevant namespaces list for to display names used in different standards like EEBUS, IEC6850,, SAREF4ENER etc. (see [NameList](NameList.md))|
| legibleDescription | optional, can occure multiple times, but ideally just a once per language. Contains details concerning the intended use case of the functional profile. |

## Generic Attributes
SGr allows to associate attributes to a functional profile (i.e. concerning every data point). See [GenericAttributeType](GenericAttributeType.md) for details. Any attribute defined on the functional profile level are mandatory to any product that implements this functional profile. However, the product can optionally add further attributes based on its own needs.

# Data Point Attributes
| Element     | Description |
|-------------|-------------|
| datapointName | Name of the data point. Should be unique within the functional profile |
| rwpDatadirection | R if data point can be read, W for write, P for persistence |
| mroVisibilityIndicator | Datapoint optionality: Mandatory, Recommended, Optional |
| unit | Physical unit of data point |
| DataType |  Data point type|
| dpNameList | a list of relevant namespaces list for to display names used in different standards like EEBUS, IEC6850,, SAREF4ENER etc. (see [NameList](NameList.md))|
| legibleDescription | optional, can occure multiple times, but ideally just a once per language. Contains details concerning the intended use case of the functional profile. |

## Generic Attributes
SGr allows to associate attributes to a data point. See [GenericAttributeType](GenericAttributeType.md) for details.
Any attribute defined on the functional profile level are mandatory to any product that implements this functional profile. However, the product can optionally add further attributes based on its own needs.

## Open Points
- What are the rules for naming a functional profile (sgr:functionalProfile@profileName)? Is this strict (then it should be part of the classification), or loose (then it should be part of the legibleDescription)?