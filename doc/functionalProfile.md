# Functional Profile Schema

## Use case

A functional profile contains a set of data points that support implementation of a specific use case. It thereby
focuses entirely on the functionality. Any transport-specific details are not part of the functional profile (e.g.
on how to get or set a data point on a specfic device).

The main intent is to allow communicator manufacturers to easily implement their use cases based on logically grouped data points, while device-specific communication details to the SGr communicator library. Any devices that support the functional profiles required for a specific use case are therefore  automatically compatible, and can be used whithout changing the implementation.

## General Structure
The schema of the functional profile is structured on two levels:
- Information concerning the entire functional profile
- a list of data points

The figure below shows the entity relation model of the functional profile

![Functional Profile Entity Relation](functionalProfile.drawio.png)

## Functional Profile Attributes

### Name
An arbitary name describing the use case of the functional profile. 

### Classification
SGr classifies and identifies any functional profile by the following values

| Element               | Description |
|-----------------------|-------------|
| specsOwnerId          | Identifier of the functional profile owner. 0 means this is a SGr functional profile |
| profileIdentification | Functional profile class (see [SGrEnumProfileType.xsd](/SchemaDatabase/SGr/Generic/SGrEnumProfileType.xsd) ) |
| subProfileIdent       | Functional profile subclass (see [SGrEnumSubProfileType.xsd](/SchemaDatabase/SGr/Generic/SGrEnumSubProfileType.xsd) ) |
| sgrLevelOfOperation   | SGrLevelOfOperation defines a controls complexity  (see [SGrLevelOfOperation.md](SGrLevelOfOperation.md) ) |
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
| fpNameList  | a list of relevant namespaces list for to display names used in different standards like EEBUS, IEC6850,, SAREF4ENER etc. (see [SGrNamelistType](SGrNamelistType.md))|
| fpLegibDesc | optional, can occure multiple times, but ideally just a once per language. Contains details concerning the intended use case of the functional profile. |
| fpPrgDesc   | optional, can occure multiple times, but ideally just a once per language. Contains details for the programmer. |

## Generic Attributes
SGr allows to associate attributes to a functional profile (i.e. concerning every data point). See [SGrAttr4GenericType](SGrAttr4GenericType.md) for details.

# Data Point Attributes
| Element     | Description |
|-------------|-------------|
| datapointName | Name of the data point. Should be unique within the functional profile |
| rwpDatadirection | R if data point can be read, W for write, P for persistence |
| mroVisibilityIndicator | Datapoint optionality: Mandatory, Recommended, Optional |
| unit | Physical unit of data point |
| DataType |  Data point type|
| dpNameList | a list of relevant namespaces list for to display names used in different standards like EEBUS, IEC6850,, SAREF4ENER etc. (see [SGrNamelistType](SGrNamelistType.md))|
| dpLegibDesc | optional, can occure multiple times, but ideally just a once per language. Contains details concerning the intended use case of the functional profile. |
| dpPrgDesc | optional, can occure multiple times, but ideally just a once per language. Contains details for the programmer. |


## Generic Attributes
SGr allows to associate attributes to a data point. See [SGrAttr4GenericType](SGrAttr4GenericType.md) for details.


## Open Points
- What is the intent of the attribute sgr:functionalProfile@mroVisibilityIndicator? Optionality on the device is handled by the fact that the functional profile is either present or not.
- What are the rules for naming a functional profile (sgr:functionalProfile@profileName)? Is this strict (then it should be part of the classification), or loose (then it should be part of the legibDesc)?
- fpNameList: why do we need the nameType? This is clear implicidtly by the context of usage.
- fpPrgDesc: on which level? functionality (if yes this should be part of legibDesc)? device specifica (if yes this should be part of external interface)