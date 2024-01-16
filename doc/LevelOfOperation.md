# SGr Level of Operation

levelOfOperation defines a controls complexity level

| Level | Description | Details |
| ----- | ----------- | ------- |
| m     | Monitoring | Pure monitoring applications, e.g., for a meter, are marked as "0.m". A charging station at Stage 4 with monitoring is labeled as "4.m". |
| 1     | On-Off | The interface allows switching between two discrete operating states.|
| 2     | Discrete values | The interface allows switching between multiple discrete operating states.|
| 3     | Set of characteristic curves | The interface enables the activation of various pre-configured characteristic curves. (Discrete, as there is a limited number of characteristic curves). Grid-friendly characteristic curves, which can react to grid voltage, are also assigned to this level without communication via the SmartGridready interface. |
| 4     | dynamic set values | The interface allows the setting of continuous setpoints. This stage builds upon level 2. |
| 5     | dynamically changeable characteristics tables | The interface allows the setting of continuous control parameters or characteristic curve values. This stage builds upon level 3.|
| 6     | prediction based systems | The interface allows the setting of new setpoints and control parameters / characteristic curve values based on energy production or load forecasts, up to the inclusion of a digital twin.|

Levels 1-6 can be combined with a the monitoring (m) level if they offer read-only data points

(see [FunctionalProfileDescription.xsd](../SchemaDatabase/SGr/Generic/BaseType_LevelOfOperationType.xsd) for details...)
