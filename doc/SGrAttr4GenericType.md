# SGr Attributes

This documentation describes the list of generic attributes.

 Generic attributes incorporate hierarchical inheritance as follows:
- Generic attributes always apply to the data point
- Generic attributes defined on functional profile level apply to all data points of the same functional profile.
- Generic attributes defined on device level apply to all functional profiles, and thus to all data points of the device
If the same attribute is defined on multiple levels the most specific definition superseeds any other definition (i.e. data point over functional profile over).

## Static Data Point Attributes
These values describe the measurement limits for data points. Depending on the definition level they apply either to a specific data point, every data point of a functional profile, or the the entire device.

These attributes are generally used to search for devices that fullfil a set of  minimum requirements to support a specific use case.

| SGr Attribute | Data Type | Description | Example |
|---------------|-----------|-------------|---------|
| maxVal | float | upper range limit. | 200.0 |
| minVal | float | lower range limit. | 0.0 |
| specQualityRequirement | string | indicates Quality requirements fullfilled like formal certifications | METAS  |
| precision | float | the precision of a measurement, calculation result or result of a controls process | 2.0% |

## Stability Fallback
A consumer or a generating system receives the permit for a load change for a certain period of time. This time is always set to 0 each time a confirmation message is received (HeartBeat).

The figure below depicts the typical flow
1. the device starts at initial value.
2. regular communication starts. The communicator periodically sets new set values.
3. communication breaks. The device recieves its last set value.
4. after reaching the timeout the device automatically sets the fallback value.

![SGr Stability Fallback](genAttributes_sstabilityFallback.drawio.png)

| Stability Fallback Value | Data Type | Description | Example |
|---------------|-----------|-------------|---------|
| maxReceiveTime | float | If the device does not receive any communication within this time the device applies the fallback.| 3600.0 s |
| initValue | float | Initial value the device before the communicator sets this value (e.g.  at startup, or beginning of cycle).| 6.0 A |
| fallbackValue | float | Value the device uses in case of a fallback | 6.0 A |

## Smooth Transition
The time behavior of a transition from a power adjustment (positive as well as negative) can be determined by several time values, so that this starts with a random time delay, changes via a ramp and an expiry time with return to the initial value. To avoid return to the initial value the device must either specify the revert time to zero (i.e. no return), or the communicator must repeat the target value before the revert time window expires.

The figure below depicts the typical flow
1. the command for the new target value is received
2. the device randomly starts the ramp, but latest after winTms
3. the ramp reaches the new target value after rmpTms
4. if no new target value is received, the device starts returning to the old target value after rvtTms
5. the ramp reaches the old target value after rmpTms

![SGr Smooth Transition](genAttributes_smoothTransition.drawio.png)


| Smooth Transition Value | Data Type | Description | Example |
|---------------|-----------|-------------|---------|
| winTms | unsigned long | indicates a time window in which the new operating mode is started randomly. The time window begins with the start command of the operating mode. The value 0 means immediate | 300 s |
| rmpTms | unsigned long | specifies how quickly the changes should be made. The corresponding value is gradually changed from the old to the new value in the specified time.| 450 s |
| rvrtTms | unsigned long | determines how long the operating mode should be active. When the time has elapsed, the operating mode is automatically terminated. If rvrtTms = 0 (standard value), the operating mode remains active until a new command is received.| 7'200 s|


## Communication Timing Attributes
Timing attributes describe the details of asynchronous sampling, where the product itself pushes data point measurements to its suscribers (e.g. communicator). Especially in larger networks these attributes are absolutely necessary to avoid cluttering and overloading of the transport layer.

The SGr timing attributes allow for heart-beat based data point sampling as well as interrupt-based sampling if the measured value changes beyond a configured threshold.

The figure below depicts typical situations
1. a new value is sent if it changes at least by minSendDelta
2. for large changes in value the device waits at least for minSendTime
3. for small changes the device sends a new value at least after maxSendTime

![SGr Timing Attributes](genAttributes_timing.drawio.png)

| SGr Attribute | Data Type | Description | Example |
|---------------|-----------|-------------|---------|
| minSendDelta | float | A measured value difference that must lead to a notification (interrupt-based sampling). Note that the device will wait at least minSendTime before resending a new value. | 200 mV |
| minSendTime | float | The fastest possible or allowable sequence of notifications in seconds (i.e. maximum sampling frequency) | 1.0 s |
| maxSendTime | float | The maximum time between 2 notifications in seconds (heart-beat based sampling)| 10 s |
| maxReceiveTime | float | The maximum time between 2 notifications in seconds, after which a timeout has to be generated including a reset to the default value. | 20 s |
| maxLatencyTimeMs | unsignedLong | Maximum occurring or permitted delay time in Milliseconds, e.g. of a data transaction | 10 ms |
| sampleRate | float | SampleRate in milliseconds | 200 ms |

## Time Stamps
| SGr Attribute | Data Type | Description | Example |
|---------------|-----------|-------------|---------|
| timeStampLog  | ISO date time | Time stamp of the measured value, either in UTC zulu time, or including a time zone. The usage of local time is supported, but discouraged | 2001-12-31T12:00:00 |
| timeRange | startTime, endTime | time range min…max | |

## Data Point Quality

SGr has attributes to denote the quality of the mesaured value. The presence of any quality attributes either on functional profile or data point level indicate that the com handler will provide these dynamic attributes at run time (see documentation of SGr com handler libs)


| SGr Attribute | Data Type | Description | Example |
|---------------|-----------|-------------|---------|
| valueType | enum | MeasValueType: type of measurement. Possbile values are "min", max", "average", "stdDev" | average |
| valueState | enum | MeasValueState: Status / validity of the measurement. Possible values are "normal", "error" | normal |
| valueTendency | enum | value trend based on timely changes, potential values are rising, stable, falling | stable |
| valueSource | enum | Value source kind related to SGr level 6 applications. Potential values are measuredValue, calculatedValue, empiricalValue | measuredValue |

## TODO
| SGr Attribute | Data Type | Description | Example |
|---------------|-----------|-------------|---------|
| curtailment | float | Used in state-based reduction schemes. This value specifies the reduction in percent for the reduced operation mode. | 40% | 
| minLoad | float |  |
| maxLockTimeMinutes | float |  |
| minRunTimeMinutes | float |  |
| valueByTimeTableMinutes | float |  |
| flexAssistance | sgr:SGrFlexAssistanceType | Systems with more than One communicator need a definition of the priority of the commands / demands for a flexibility requirement. This element defines the kind of a such a command (servicable for net (DSO), energy or system (TNO)) and its priority (SHALL / SHOULD / MAY) |


## Open Points
- Stability Fallback
  - document!
- Timing attributes
    - currently neither RestAPI nor Modbus support these attributes. Correct?
- Smooth Transition
  - Does the device support this functionality? who absorbes the randomness?
- Timestamp
  - timeStampLog should not be a generic attribute, but delivered automatically by the com handler. Generate an issue for java / python
  - what is the intent of timeRange?
- Quality
  - the com handler implementations should provide the values of these attributes. Generate an issue for java / python
  - valueState: enum outOfRange is documented, but not defined in schema. Remove from doc, or extend schema.
  - valueType & valueSource should be moved to static data point attributes