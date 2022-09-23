<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sgr="http://www.smartgridready.com/ns/V0/">

    <xsl:template match="sgr:genAttribute">
        <xsl:call-template name="SGrAttr4GenericType" />
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
</xsl:stylesheet>  