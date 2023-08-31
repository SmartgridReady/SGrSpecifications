<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sgr="http://www.smartgridready.com/ns/V0/">

    <xsl:template match="sgr:genericAttributes">
        <xsl:call-template name="GenericAttributes" />
    </xsl:template>

    <xsl:template name="GenericAttributes">
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
                    <xsl:value-of select="sgr:stabilityFallback/sgr:maxReceiveTime" />&#160;s
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
                    Smooth Transition
                </td>
                <td>
                    <xsl:if test="sgr:smoothTransition/sgr:winTms">
                        Window:
                        <xsl:value-of select="sgr:smoothTransition/sgr:winTms" />
                        s&#160;
                    </xsl:if>
                    <xsl:if test="sgr:smoothTransition/sgr:rvrtTms">
                        rvrt:
                        <xsl:value-of select="sgr:smoothTransition/sgr:rvrtTms" />
                        s&#160;
                    </xsl:if>
                    <xsl:if test="sgr:smoothTransition/sgr:rmpTms">
                        rmp:
                        <xsl:value-of select="sgr:smoothTransition/sgr:rmpTms" />
                        s&#160;
                    </xsl:if>
                </td>
            </tr>
        </xsl:if>

        <!--maxLatencyTime-->
        <xsl:if test="sgr:maxLatencyTimeMs">
            <tr class="genericDetails">
                <td>
                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                    Max. Latency
                </td>
                <td>
                    <xsl:value-of select="sgr:maxLatencyTimeMs" />&#160;ms
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
                    <xsl:value-of select="sgr:valueType" />
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