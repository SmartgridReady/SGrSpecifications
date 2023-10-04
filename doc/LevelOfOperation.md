# SGr Level of Operation

levelOfOperation defines a controls complexity level

| Level | Description | Example |
| ----- | ----------- | ------- |
| m     | Monitoring | read-only values |
| 1     | On-Off | single contact |
| 2     | Discrete values | two or more contacts, state controlled interfaces |
| 3     | Set of characteristic curves | statical defined tables |
| 4     | dynamic set values | temperature set points |
| 5     | dynamically changeable characteristics tables | |
| 6     | prognosis based systems | |

Levels 1-6 can be combined with a the monitoring (m) level if they offer read-only data points

(see [FunctionalProfileDescription.xsd](/SchemaDatabase/SGr/Generic/FunctionalProfileDescription.xsd) for details...)