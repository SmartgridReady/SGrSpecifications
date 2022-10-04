<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sgr="http://www.smartgridready.com/ns/V0/">

    <xsl:template match="sgr:genAttribute">
        <xsl:param name="type" select="EI" />
        <xsl:choose>
            <xsl:when test="$type = 'EI'">
                <xsl:call-template name="SGrAttr4GenericType" />
            </xsl:when>
            <xsl:when test="$type = 'FP'">
                <xsl:call-template name="SGrAttr4GenericType4FP" />
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="SGrAttr4GenericType">
        <!--maxVal-->
        <xsl:if test="sgr:maxVal">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    Upper Range Limit
                </td>
                <td>
                    <xsl:value-of select="sgr:maxVal" />
                </td>
            </tr>
        </xsl:if>

        <!--minVal-->
        <xsl:if test="sgr:minVal">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    Lower Range Limit
                </td>
                <td>
                    <xsl:value-of select="sgr:minVal" />
                </td>
            </tr>
        </xsl:if>

        <!--specQualityRequirement-->
        <xsl:if test="sgr:specQualityRequirement">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    Quality Requirements
                </td>
                <td>
                    <xsl:value-of select="sgr:specQualityRequirement" />
                </td>
            </tr>
        </xsl:if>

        <!--precision-->
        <xsl:if test="sgr:precision">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    Precision
                </td>
                <td>
                    <xsl:value-of select="sgr:precision" />
                    %
                </td>
            </tr>
        </xsl:if>

        <!--stabilityFallback-->
        <xsl:if test="sgr:stabilityFallback">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    Stability Fallback
                </td>
                <td>
                    Max recieve time:
                    <xsl:value-of select="sgr:stabilityFallback/sgr:maxReceiveTime" />
                    <br />
                    Init Value:
                    <xsl:value-of select="sgr:stabilityFallback/sgr:initValue" />
                    <br />
                    Fallback Value:
                    <xsl:value-of select="sgr:stabilityFallback/sgr:fallbackValue" />
                    <br />
                </td>
            </tr>
        </xsl:if>

        <!--smoothTransition-->
        <xsl:if test="sgr:smoothTransition">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    Stability Fallback
                </td>
                <td>
                    <xsl:if test="sgr:smoothTransition/sgr:winTms">
                        Window:
                        <xsl:value-of select="sgr:smoothTransition/sgr:winTms" />
                        ms&#160;
                    </xsl:if>
                    <xsl:if test="sgr:smoothTransition/sgr:rvrtTms">
                        rvrt:
                        <xsl:value-of select="sgr:smoothTransition/sgr:rvrtTms" />
                        ms&#160;
                    </xsl:if>
                    <xsl:if test="sgr:smoothTransition/sgr:rmpTms">
                        rmp:
                        <xsl:value-of select="sgr:smoothTransition/sgr:rmpTms" />
                        ms&#160;
                    </xsl:if>
                </td>
            </tr>
        </xsl:if>

        <!--minSendDelta-->
        <xsl:if test="sgr:minSendDelta">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    Min. Delta for Notification
                </td>
                <td>
                    <xsl:value-of select="sgr:minSendDelta" />
                </td>
            </tr>
        </xsl:if>

        <!--maxSendTime-->
        <xsl:if test="sgr:maxSendTime">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    Max. Time between Notification
                </td>
                <td>
                    <xsl:value-of select="sgr:maxSendTime" />
                </td>
            </tr>
        </xsl:if>

        <!--maxReceiveTime-->
        <xsl:if test="sgr:maxReceiveTime">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    Max. Recieve Time
                </td>
                <td>
                    <xsl:value-of select="sgr:maxReceiveTime" />
                </td>
            </tr>
        </xsl:if>

        <!--minSendTime-->
        <xsl:if test="sgr:minSendTime">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    Min. Time between Notification
                </td>
                <td>
                    <xsl:value-of select="sgr:minSendTime" />
                </td>
            </tr>
        </xsl:if>

        <!--maxLatencyTime-->
        <xsl:if test="sgr:maxLatencyTime">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    Max. Latency
                </td>
                <td>
                    <xsl:value-of select="sgr:maxLatencyTime" />
                </td>
            </tr>
        </xsl:if>

        <!--timeStampLog-->
        <xsl:if test="sgr:timeStampLog">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    Time Stamp Log
                </td>
                <td>
                    <xsl:value-of select="sgr:timeStampLog" />
                </td>
            </tr>
        </xsl:if>

        <!--timeRange-->
        <xsl:if test="sgr:timeRange">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    Time Range
                </td>
                <td>
                    <xsl:value-of select="sgr:timeRange/sgr:startTime" />
                    -
                    <xsl:value-of select="sgr:timeRange/sgr:endTime" />
                </td>
            </tr>
        </xsl:if>

        <!--valueType-->
        <xsl:if test="sgr:valueType">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    ValueType
                </td>
                <td>
                    <xsl:value-of select="sgr:valueState" />
                </td>
            </tr>
        </xsl:if>

        <!--valueState-->
        <xsl:if test="sgr:valueState">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    Value Statue
                </td>
                <td>
                    <xsl:value-of select="sgr:valueState" />
                </td>
            </tr>
        </xsl:if>

        <!--valueTendency-->
        <xsl:if test="sgr:valueTendency">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    Value Tendency
                </td>
                <td>
                    <xsl:value-of select="sgr:valueTendency" />
                </td>
            </tr>
        </xsl:if>

        <!--valueSource-->
        <xsl:if test="sgr:valueSource">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    Value Source
                </td>
                <td>
                    <xsl:value-of select="sgr:valueSource" />
                </td>
            </tr>
        </xsl:if>

        <!--sampleRate-->
        <xsl:if test="sgr:sampleRate">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    Sample Rate
                </td>
                <td>
                    <xsl:value-of select="sgr:sampleRate" />
                    ms
                </td>
            </tr>
        </xsl:if>

        <!--curtailment-->
        <xsl:if test="sgr:curtailment">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    Curtailment
                </td>
                <td>
                    <xsl:value-of select="sgr:curtailment" />
                </td>
            </tr>
        </xsl:if>

        <!--minLoad-->
        <xsl:if test="sgr:minLoad">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    Min. Load
                </td>
                <td>
                    <xsl:value-of select="sgr:minLoad" />
                </td>
            </tr>
        </xsl:if>

        <!--maxLockTimeMinutes-->
        <xsl:if test="sgr:maxLockTimeMinutes">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    Max. Lock Time
                </td>
                <td>
                    <xsl:value-of select="sgr:maxLockTimeMinutes" />
                    min
                </td>
            </tr>
        </xsl:if>

        <!--minRunTimeMinutes-->
        <xsl:if test="sgr:minRunTimeMinutes">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    Min. Run Time
                </td>
                <td>
                    <xsl:value-of select="sgr:minRunTimeMinutes" />
                    min
                </td>
            </tr>
        </xsl:if>

        <!--valueByTimeTableMinutes-->
        <xsl:if test="sgr:valueByTimeTableMinutes">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    Value by time Table
                </td>
                <td>
                    <xsl:value-of select="sgr:valueByTimeTableMinutes" />
                    min
                </td>
            </tr>
        </xsl:if>

        <!--flexAssistance-->
        <xsl:if test="sgr:flexAssistance">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    Flex Assistance
                </td>
                <td>
                    Assists
                    <xsl:value-of select="sgr:flexAssistance/sgr:assists" />
                    , obliged to
                    <xsl:value-of select="sgr:flexAssistance/sgr:obliged_to" />
                </td>
            </tr>
        </xsl:if>
    </xsl:template>

    <!-- generic attribute representation for functional profiles -->
    <xsl:template name="SGrAttr4GenericType4FP">

        <!--maxVal-->
        <xsl:if test="sgr:maxVal">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    maxVal
                </td>
                <td>Float</td>
                <td>Upper Range Limit</td>
            </tr>
        </xsl:if>

        <!--minVal-->
        <xsl:if test="sgr:minVal">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    minVal
                </td>
                <td>Float</td>
                <td>Lower Range Limit</td>
            </tr>
        </xsl:if>

        <!--specQualityRequirement-->
        <xsl:if test="sgr:specQualityRequirement">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    specQualityRequirement
                </td>
                <td>String (e.g. "METAS")</td>
                <td>Indicates Quality requirements fullfilled like formal certifications</td>
            </tr>
        </xsl:if>

        <!--precision-->
        <xsl:if test="sgr:precision">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    precision
                </td>
                <td>%</td>
                <td>Precision defines the accuracy
                    of a data point either related to a measurement value, a simulation
                    result or of a setpoint value</td>
            </tr>
        </xsl:if>

        <!--stabilityFallback-->
        <xsl:if test="sgr:stabilityFallback">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    stabilityFallback
                </td>
                <td>
                    Max recieve time: float,
                    <br />
                    Init Value: float,
                    <br />
                    Fallback Value: float
                    <br />
                </td>
                <td>A consumer or a generating system receives the
                    permit for a load change for a certain period of time. This time
                    is always set to 0 each time a confirmation message is received
                    (HeartBeat).</td>
            </tr>
        </xsl:if>

        <!--smoothTransition-->
        <xsl:if test="sgr:smoothTransition">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    smoothTransition
                </td>
                <td>
                    <p>Window: optional, ms, unsigned long. (Indicates a time window in which the new operating
                    mode is started randomly. The time window begins with the start
                    command of the operating mode. The value 0 means immediate.)</p>
                    <p>rvrt:  optional, ms, unsigned long. (determines how long the operating mode should be
                    active. When the time has elapsed, the operating mode is
                    automatically terminated. If rvrtTms = 0 (standard value), the
                    operating mode remains active until a new command is received.)</p>
                    <p>rmp: optional, ms, unsigned long. (specifies how quickly the changes should be made.
                    The corresponding value is gradually changed from the old to the
                    new value in the specified time.)</p>
                </td>
                <td>The time behavior of a transition from a power
                    adjustment (positive as well as negative) can be determined by
                    several time values, so that this starts with a random time delay,
                    changes via a ramp and an expiry time with return to the initial
                    value (see IEC-61850-90-7).
                    <img src="/xsl/genAttribute_smoothTransition.png"/>
                </td>
            </tr>
        </xsl:if>

        <!--minSendDelta-->
        <xsl:if test="sgr:minSendDelta">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    minSendDelta
                </td>
                <td>float</td>
                <td>A measured value difference that must lead to a notification.</td>
            </tr>
        </xsl:if>

        <!--maxSendTime-->
        <xsl:if test="sgr:maxSendTime">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    maxSendTime
                </td>
                <td>time</td>
                <td>The maximum time between 2 notifications.</td>
            </tr>
        </xsl:if>

        <!--maxReceiveTime-->
        <xsl:if test="sgr:maxReceiveTime">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    maxReceiveTime
                </td>
                <td>time</td>
                <td>The maximum time a response takes.</td>
            </tr>
        </xsl:if>

        <!--minSendTime-->
        <xsl:if test="sgr:minSendTime">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    minSendTime
                </td>
                <td>time</td>
                <td>The min time between 2 notifications.</td>
            </tr>
        </xsl:if>

        <!--maxLatencyTime-->
        <xsl:if test="sgr:maxLatencyTime">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    maxLatencyTime
                </td>
                <td>unsigned long</td>
                <td>Maximum occurring or permitted delay time, e.g. of
                    a data transaction</td>
            </tr>
        </xsl:if>

        <!--timeStampLog-->
        <xsl:if test="sgr:timeStampLog">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    timeStampLog
                </td>
                <td>dateTime</td>
                <td>This is the date Time Value indicates that any
                    value generation must be paired with the time of either a
                    measuement was taken or where a higher controls software level
                    indicates when it got the value</td>
            </tr>
        </xsl:if>

        <!--timeRange-->
        <xsl:if test="sgr:timeRange">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    timeRange
                </td>
                <td>
                    <p>startTime: time</p>
                    <p>endTime: time</p>
                </td>
                <td>time range min…max</td>
            </tr>
        </xsl:if>

        <!--valueType-->
        <xsl:if test="sgr:valueType">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    valueType
                </td>
                <td>min, max, average, stdDev</td>
                <td>Type of data point collection.</td>
            </tr>
        </xsl:if>

        <!--valueState-->
        <xsl:if test="sgr:valueState">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    valueState
                </td>
                <td>normal, error</td>
                <td>Status / validity of the measurement.</td>
            </tr>
        </xsl:if>

        <!--valueTendency-->
        <xsl:if test="sgr:valueTendency">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    valueTendency
                </td>
                <td>rising, stable, falling</td>
                <td>value trend based on timely changes</td>
            </tr>
        </xsl:if>

        <!--valueSource-->
        <xsl:if test="sgr:valueSource">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    valueSource
                </td>
                <td>measuredValue, calculatedValue, empiricalValue</td>
                <td>Value source kind related to SGr level 6 applications.</td>
            </tr>
        </xsl:if>

        <!--sampleRate-->
        <xsl:if test="sgr:sampleRate">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    sampleRate
                </td>
                <td>float</td>
                <td>SampleRate in milliseconds</td>
            </tr>
        </xsl:if>

        <!--curtailment-->
        <xsl:if test="sgr:curtailment">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    curtailment
                </td>
                <td>float</td>
                <td>Absenkung der Rückspeisung: Wert in % der aktuell gelieferten Rückspeisung beim Übergang in den Betriebsmode reduziert</td>
                <!-- TODO: translate to english -->
            </tr>
        </xsl:if>

        <!--minLoad-->
        <xsl:if test="sgr:minLoad">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    minLoad
                </td>
                <td>float</td>
                <td></td>
            </tr>
        </xsl:if>

        <!--maxLockTimeMinutes-->
        <xsl:if test="sgr:maxLockTimeMinutes">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    maxLockTimeMinutes
                </td>
                <td>float</td>
                <td></td>
            </tr>
        </xsl:if>

        <!--minRunTimeMinutes-->
        <xsl:if test="sgr:minRunTimeMinutes">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    minRunTimeMinutes
                </td>
                <td>float</td>
                <td></td>
            </tr>
        </xsl:if>

        <!--valueByTimeTableMinutes-->
        <xsl:if test="sgr:valueByTimeTableMinutes">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    valueByTimeTableMinutes
                </td>
                <td>float</td>
                <td></td>
            </tr>
        </xsl:if>

        <!--flexAssistance-->
        <xsl:if test="sgr:flexAssistance">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    Flex Assistance
                </td>
                <td>
                    <p>assists: AT_NetServicable, AT_SysServicable, AT_EnerServicable</p>
                    <p>obliged_to: OL_SHALL, OL_SHOULD, OL_MAY</p>
                </td>
                <td>Systems with more than One communicator need a definition of the priority of the commands / demands for a flexibility requirement.
                    This element defines the kind of a such a command (servicable for net (DSO), energy or system (TNO)) and its priority (SHALL / SHOULD / MAY)</td>
            </tr>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>  