<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sgr="http://www.smartgridready.com/ns/V0/">

    <xsl:template match="sgr:genericAttributes">
        <!--maxVal-->
        <xsl:if test="sgr:maxVal">
            <xsl:if test="sgr:maxVal != ''">
                <tr class="genericDetails">
                    <td class="genericattribute">Upper Range Limit</td>
                    <td>
                        <xsl:value-of select="sgr:maxVal" />
                    </td>
                </tr>
            </xsl:if>
        </xsl:if>

        <!--minVal-->
        <xsl:if test="sgr:minVal">
            <xsl:if test="sgr:minVal != ''">
                <tr class="genericDetails">
                    <td class="genericattribute">Lower Range Limit</td>
                    <td>
                        <xsl:value-of select="sgr:minVal" />
                    </td>
                </tr>
            </xsl:if>
        </xsl:if>

        <!--specialQualityRequirement-->
        <xsl:if test="sgr:specialQualityRequirement">
            <xsl:if test="sgr:specialQualityRequirement != ''">
                <tr class="genericDetails">
                    <td class="genericattribute">Quality Requirements</td>
                    <td>
                        <xsl:value-of select="sgr:specialQualityRequirement" />
                    </td>
                </tr>
            </xsl:if>
        </xsl:if>

        <!--precisionPercent-->
        <xsl:if test="sgr:precisionPercent">
            <xsl:if test="sgr:precisionPercent != ''">
                <tr class="genericDetails">
                    <td class="genericattribute">Precision</td>
                    <td>
                        <xsl:value-of select="sgr:precisionPercent" />
                        %
                    </td>
                </tr>
            </xsl:if>
        </xsl:if>

        <!--stabilityFallback-->
        <xsl:if test="sgr:stabilityFallback">
            <tr class="genericDetails">
                <td class="genericattribute">Stability Fallback</td>
                <td>
                    Max receive time:
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
            <xsl:if test="sgr:smoothTransition != ''">
                <tr class="genericDetails">
                    <td class="genericattribute">Smooth Transition</td>
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
        </xsl:if>

        <!--maxLatencyTime-->
        <xsl:if test="sgr:maxLatencyTimeMs">
            <xsl:if test="sgr:maxLatencyTimeMs != ''">
                <tr class="genericDetails">
                    <td class="genericattribute">Max. Latency</td>
                    <td>
                        <xsl:value-of select="sgr:maxLatencyTimeMs" />&#160;ms
                    </td>
                </tr>
            </xsl:if>
        </xsl:if>
        
        <!--measuredValueType-->
        <xsl:if test="sgr:measuredValueType">
            <xsl:if test="sgr:measuredValueType != ''">
                <tr class="genericDetails">
                    <td class="genericattribute">ValueType</td>
                    <td>
                        <xsl:value-of select="sgr:measuredValueType" />
                    </td>
                </tr>
            </xsl:if>
        </xsl:if>

        <!--measuredValueSource-->
        <xsl:if test="sgr:measuredValueSource">
            <xsl:if test="sgr:measuredValueSource != ''">
                <tr class="genericDetails">
                    <td class="genericattribute">Value Source</td>
                    <td>
                        <xsl:value-of select="sgr:measuredValueSource" />
                    </td>
                </tr>
            </xsl:if>
        </xsl:if>

        <!--sampleRateHz-->
        <xsl:if test="sgr:sampleRateHz">
            <xsl:if test="sgr:sampleRateHz != ''">
                <tr class="genericDetails">
                    <td class="genericattribute">Sample Rate</td>
                    <td>
                        <xsl:value-of select="sgr:sampleRateHz" />
                        ms
                    </td>
                </tr>
            </xsl:if>
        </xsl:if>

        <!--curtailment-->
        <xsl:if test="sgr:curtailment">
            <xsl:if test="sgr:curtailment != ''">
                <tr class="genericDetails">
                    <td class="genericattribute">Curtailment</td>
                    <td>
                        <xsl:value-of select="sgr:curtailment" />
                    </td>
                </tr>
            </xsl:if>
        </xsl:if>

        <!--minLoad-->
        <xsl:if test="sgr:minLoad">
            <xsl:if test="sgr:minLoad != ''">
                <tr class="genericDetails">
                    <td class="genericattribute">Min. Load</td>
                    <td>
                        <xsl:value-of select="sgr:minLoad" />
                    </td>
                </tr>
            </xsl:if>
        </xsl:if>

        <!--maxLockTimeMinutes-->
        <xsl:if test="sgr:maxLockTimeMinutes">
            <xsl:if test="sgr:maxLockTimeMinutes != ''">
                <tr class="genericDetails">
                    <td class="genericattribute">Max. Lock Time</td>
                    <td>
                        <xsl:value-of select="sgr:maxLockTimeMinutes" />
                        min
                    </td>
                </tr>
            </xsl:if>
        </xsl:if>

        <!--minRunTimeMinutes-->
        <xsl:if test="sgr:minRunTimeMinutes">
            <xsl:if test="sgr:minRunTimeMinutes != ''">
                <tr class="genericDetails">
                    <td class="genericattribute">Min. Run Time</td>
                    <td>
                        <xsl:value-of select="sgr:minRunTimeMinutes" />
                        min
                    </td>
                </tr>
            </xsl:if>
        </xsl:if>

        <!--valueByTimeTableMinutes-->
        <xsl:if test="sgr:valueByTimeTableMinutes">
            <xsl:if test="sgr:valueByTimeTableMinutes != ''">
                <tr class="genericDetails">
                    <td class="genericattribute">Value by time Table</td>
                    <td>
                        <xsl:value-of select="sgr:valueByTimeTableMinutes" />
                        min
                    </td>
                </tr>
            </xsl:if>
        </xsl:if>

        <!--flexAssistance-->
        <xsl:if test="sgr:flexAssistance">
            <tr class="genericDetails">
                <td class="genericattribute">Flex Assistance</td>
                <td>
                    Assists
                    <xsl:value-of select="sgr:flexAssistance/sgr:assists" />
                    , obliged to
                    <xsl:value-of select="sgr:flexAssistance/sgr:obliged_to" />
                </td>
            </tr>
        </xsl:if>

    </xsl:template>

    <xsl:template match="sgr:genericAttributeList">

        <!--genericAttributeList-->
        <xsl:for-each select="sgr:genericAttributeListElement">
            <xsl:variable name="name" select="sgr:name"/> 
            <xsl:variable name="attribute" select="document(concat('../GenericAttributes/', $name, '.xml'))"/>
            <tr class="genericDetails">
                <td class="genericattribute">
                  <xsl:value-of select="$attribute/sgr:GenericAttributeFrame/sgr:name" />
                  <xsl:for-each select="$attribute/sgr:GenericAttributeFrame/sgr:genericAttributeList/sgr:genericAttributeListElement">
                    <ul style="margin: 0">
                      <li><xsl:value-of select="sgr:name"/></li>
                    </ul>
                  </xsl:for-each>
                </td>
                <td>
                  <xsl:value-of select="sgr:value" />&#160;<xsl:call-template name="SGrUnits"><xsl:with-param name="value" select="sgr:unit" /></xsl:call-template>
                  <xsl:for-each select="sgr:genericAttributeList/sgr:genericAttributeListElement">
                    <ul style="margin: 0">
                      <li><xsl:value-of select="sgr:value" />&#160;<xsl:call-template name="SGrUnits"><xsl:with-param name="value" select="sgr:unit" /></xsl:call-template></li>
                    </ul>
                  </xsl:for-each>
                </td>
            </tr>
        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>  