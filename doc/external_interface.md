# External Interface Description Schema

## Use case

An external interface descripton contains information about the device, its supported functional profiles and how
the datapoints of the functional profiles can be accessed through the transport layer.

This allows potential controllers to easily integrate, implement or access any SmartGridready certified product
through a standarized set of functionality, and thereby greatly simplifies scale-up to support a wide range of products.

## General Structure
The schema of the external interface description is structured on three levels:
- Device information concerning manufacturer and product data, and the basic configuration of the transport layer
- A list of supported functional profiles
- A list of data points (as defined in the respective functional profile definition) together with transport layer details on how to access the individual data point

The figure below shows the entity relation model of the external interface description (t.b.d!!!)

![External Interface Description Entity Relation](externalInterfaceDescription.drawio.png)

## Device Attributes

| Element | Description |
| ------- | ----------- |
| levelOfOperation | levelOfOperation defines a controls complexity  (see [LevelOfOperation.md](LevelOfOperation.md) ), and is defined by the highest level of the devices functional profile |
