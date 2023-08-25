<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sgr="http://www.smartgridready.com/ns/V0/">

    <xsl:import href="SGrGenericDataPointDefinitions.xsl" />
    <xsl:import href="SGrGenericHelpers.xsl" />

    <!-- Generic Functional Profiles -->
    <xsl:template match="sgr:SGrFunctionalProfileFrame">
        <div class="functionalProfile">
            <h2>
                <xsl:apply-templates select="sgr:functionalProfile/sgr:profileNumber">
                    <xsl:with-param name="separator" select="' - '" />
                    <xsl:with-param name="displayFullLevel" select="'true'" />
                </xsl:apply-templates>
            </h2>
            <br/>

            <table>
                <colgroup>
                    <col style="width:20%" />
                </colgroup>

                <!-- Release State -->
                <tr>
                    <td class="fpHeader">
                        <h4>Release State</h4>
                    </td>
                    <td class="fpHeader">
                        <table>
                            <tr>
                                <td>
                                    <xsl:value-of select="sgr:releaseNotes/sgr:state" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>

                <!-- Remarks -->
                <xsl:if test="sgr:releaseNotes/sgr:remarks">
                    <tr>
                        <td class="fpHeader">
                            <h4>Remarks</h4>
                        </td>
                        <td class="fpHeader">
                            <table>
                                <tr>
                                    <td>
                                        <xsl:value-of select="sgr:releaseNotes/sgr:remarks" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </xsl:if>

                <!-- Change Log -->
                <tr>
                    <td class="fpHeader">
                        <h4>Change Log</h4>
                    </td>
                    <td class="fpHeader">
                        <table>
                            <colgroup>
                                <col style="width:15%" />
                                <col style="width:15%" />
                                <col style="width:20%" />
                                <col style="width:50%" />
                            </colgroup>
                            <tr>
                                <th>Version</th>
                                <th>Date</th>
                                <th>Author</th>
                                <th>Comment</th>
                            </tr>
                            <xsl:for-each select="sgr:releaseNotes/sgr:changelog">
                                <tr>
                                    <td>
                                        <xsl:value-of select="sgr:version" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="sgr:date" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="sgr:author" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="sgr:comment" />
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </td>
                </tr>

                <tr>
                    <td class="fpHeader">
                        <h4>Classification</h4>
                    </td>
                    <td class="fpHeader">
                        <table>
                            <colgroup>
                                <col style="width:30%" />
                            </colgroup>

                            <tr>
                                <td>Profil-ID</td>
                                <td>
                                    <xsl:apply-templates select="/*/sgr:functionalProfile/sgr:profileNumber">
                                        <xsl:with-param name="separator" select="' - '" />
                                    </xsl:apply-templates>
                                </td>
                            </tr>
                            <tr>
                                <td>Level</td>
                                <td>
                                    <xsl:value-of select="sgr:functionalProfile/sgr:profileNumber/sgr:sgrLevelOfOperation" />
                                </td>
                            </tr>
                            <tr>
                                <td>Version</td>
                                <td>
                                    <xsl:apply-templates select="sgr:functionalProfile/sgr:profileNumber/sgr:versionNumber" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <br/>

            <!-- Functional Profile Block -->
            <table>
                <colgroup>
                    <col style="width:20%" />
                </colgroup>

                <!-- fpNameList -->
                <xsl:apply-templates select="sgr:functionalProfile/sgr:fpNameList" />

                <!-- fpLegibDesc (4x opt) -->
                <xsl:apply-templates select="sgr:functionalProfile/sgr:fpLegibDesc" />

                <xsl:if test="sgr:genAttribute/*">
                    <td>Attributes</td>
                    <td>
                        <xsl:for-each select="sgr:genAttribute/*">
                            <div style="padding-left:1em;">
                                <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                                &#160;
                                <xsl:value-of select="local-name(.)" />
                            </div>
                        </xsl:for-each>
                    </td>
                </xsl:if>
            </table>

            <!-- Data Points -->
            <div class="dataPoint">
                <table>
                    <colgroup>
                        <col style="width:5%" />
                        <col style="width:15%" />
                        <col style="width:52%" />
                        <col style="width:6%" />
                        <col style="width:10%" />
                        <col style="width:6%" />
                        <col style="width:6%" />
                    </colgroup>
                    <tr>
                        <th colspan="2">Datapoint</th>
                        <th>Description</th>
                        <th>Unit</th>
                        <th>Type</th>
                        <th>MRO</th>
                        <th>RWP</th>
                    </tr>
                    <xsl:for-each select="sgr:dpListElement">
                        <tr>
                            <td colspan="2">
                                <xsl:value-of select="sgr:dataPoint/@datapointName" />
                            </td>
                            <td>
                                <xsl:for-each select="sgr:dataPoint/sgr:dpLegibDesc">
                                    <div>
                                        <xsl:attribute name="lang">
                                            <xsl:value-of select="sgr:language" />
                                        </xsl:attribute>
                                        <xsl:value-of select="sgr:textElement" disable-output-escaping="yes" />
                                    </div>
                                </xsl:for-each>
                                <xsl:if test="sgr:genAttribute/*">
                                    <p style="margin-bottom:0;">Datapoint Attributes:</p>
                                    <xsl:for-each select="sgr:genAttribute/*">
                                        <div style="padding-left:1em;">
                                            <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                                            &#160;
                                            <xsl:value-of select="local-name(.)" />
                                        </div>
                                    </xsl:for-each>
                                </xsl:if>
                            </td>
                            <td>
                                <xsl:call-template name="SGrUnits">
                                    <xsl:with-param name="value" select="sgr:dataPoint/@unit" />
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:if test="sgr:dataPoint/sgr:arrayLength">
                                    <xsl:value-of select="sgr:dataPoint/sgr:arrayLength" /> x
                                </xsl:if>

                                <xsl:if test="sgr:dataPoint/sgr:dataType">
                                    <xsl:apply-templates select="sgr:dataPoint/sgr:dataType" />
                                </xsl:if>
                            </td>
                            <td>
                                <xsl:value-of select="sgr:dataPoint/@mroVisibilityIndicator" />
                            </td>
                            <td>
                                <xsl:value-of select="sgr:dataPoint/@rwpDatadirection" />
                            </td>
                        </tr>

                        <xsl:if test="sgr:dataPoint/sgr:dpNameList">
                            <tr class="dataPointDetails">
                                <td class="noborder"></td>
                                <td colspan="6">
                                    <table>
                                        <colgroup>
                                            <col style="width:25.8%" />
                                        </colgroup>

                                        <!-- dpNameList (1x opt)-->
                                        <xsl:if test="sgr:dataPoint/sgr:dpNameList">
                                            <xsl:apply-templates select="sgr:dataPoint/sgr:dpNameList" />
                                        </xsl:if>

                                    </table>
                                </td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>
            </div>

            <xsl:if test="//sgr:genAttribute">
                <div class="functionalProfile">
                    <h2>Table of Attibutes</h2>
                    <!-- Generic Attributes -->
                    <table>
                        <colgroup>
                            <col style="width:20%" />
                            <col style="width:30%" />
                            <col style="width:60%" />
                        </colgroup>
                        <tr>
                            <th>SGr Attribute</th>
                            <th>Type</th>
                            <th>Description</th>
                        </tr>

                        <!--maxVal-->
                        <xsl:if test="//sgr:maxVal">
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
                        <xsl:if test="//sgr:minVal">
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
                        <xsl:if test="//sgr:specQualityRequirement">
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
                        <xsl:if test="//sgr:precision">
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
                        <xsl:if test="//sgr:stabilityFallback">
                            <tr class="genericDetails">
                                <td>
                                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                                    stabilityFallback
                                </td>
                                <td>
                                    Max recieve time: float, seconds
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
                        <xsl:if test="//sgr:smoothTransition">
                            <tr class="genericDetails">
                                <td>
                                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                                    smoothTransition
                                </td>
                                <td>
                                    <p>Window: optional, seconds, unsigned long. (Indicates a time window in which the new operating
                                    mode is started randomly. The time window begins with the start
                                    command of the operating mode. The value 0 means immediate.)</p>
                                    <p>rmp: optional, seconds, unsigned long. (specifies how quickly the changes should be made.
                                        The corresponding value is gradually changed from the old to the
                                        new value in the specified time.)</p>
                                    <p>rvrt:  optional, seconds, unsigned long. (determines how long the operating mode should be
                                    active. When the time has elapsed, the operating mode is
                                    automatically terminated. If rvrtTms = 0 (standard value), the
                                    operating mode remains active until a new command is received.)</p>
                                </td>
                                <td>
                                    The time behavior of a transition from a power
                                    adjustment (positive as well as negative) can be determined by
                                    several time values, so that this starts with a random time delay,
                                    changes via a ramp and an expiry time with return to the initial
                                    value (see IEC-61850-90-7).
                                </td>
                            </tr>
                        </xsl:if>

                        <!--maxLatencyTime-->
                        <xsl:if test="//sgr:maxLatencyTimeMs">
                            <tr class="genericDetails">
                                <td>
                                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                                    maxLatencyTimeMs
                                </td>
                                <td>unsigned long</td>
                                <td>Maximum time in milliseconds from capturing of measured value until ready at the external interface 
                                    (i.e. analog-digital conversion time)</td>
                            </tr>
                        </xsl:if>

                        <!--valueType-->
                        <xsl:if test="//sgr:valueType">
                            <tr class="genericDetails">
                                <td>
                                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                                    valueType
                                </td>
                                <td>value, min, max, average, stdDev</td>
                                <td>Type of data point collection.</td>
                            </tr>
                        </xsl:if>

                        <!--valueSource-->
                        <xsl:if test="//sgr:valueSource">
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
                        <xsl:if test="//sgr:sampleRate">
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
                        <xsl:if test="//sgr:curtailment">
                            <tr class="genericDetails">
                                <td>
                                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                                    curtailment
                                </td>
                                <td>float</td>
                                <td>Used in state-based reduction schemes. This value specifies the reduction in percent for the reduced operation mode.</td>
                            </tr>
                        </xsl:if>

                        <!--minLoad-->
                        <xsl:if test="//sgr:minLoad">
                            <tr class="genericDetails">
                                <td>
                                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                                    minLoad
                                </td>
                                <td>float</td>
                                <td>Minimale Last in kW, welche im Sperrbetrieb nicht überschritten werden darf.</td>
                            </tr>
                        </xsl:if>

                        <!--maxLockTimeMinutes-->
                        <xsl:if test="//sgr:maxLockTimeMinutes">
                            <tr class="genericDetails">
                                <td>
                                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                                    maxLockTimeMinutes
                                </td>
                                <td>float</td>
                                <td>Wert in Minuten für die maximale Sperrzeit.</td>
                            </tr>
                        </xsl:if>

                        <!--minRunTimeMinutes-->
                        <xsl:if test="//sgr:minRunTimeMinutes">
                            <tr class="genericDetails">
                                <td>
                                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                                    minRunTimeMinutes
                                </td>
                                <td>float</td>
                                <td>Wert in Minuten für die minimale Laufzeit</td>
                            </tr>
                        </xsl:if>

                        <!--valueByTimeTableMinutes-->
                        <xsl:if test="//sgr:valueByTimeTableMinutes">
                            <tr class="genericDetails">
                                <td>
                                    <img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" />
                                    valueByTimeTableMinutes
                                </td>
                                <td>float</td>
                                <td>Step width in minutes</td>
                            </tr>
                        </xsl:if>

                        <!--flexAssistance-->
                        <xsl:if test="//sgr:flexAssistance">
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

                    </table>

                    <xsl:if test="//sgr:smoothTransition">
                        <h3>Smooth Transition Timing</h3>
                        <img src="/xsl/genAttributes_smoothTransition.drawio.png" width="100%"/>
                        <ol>
                            <li>Command for a new set value is recieved (e.g. 60%)</li>
                            <li>Within the maximum delay the product starts the ramp to the new set value</li>
                            <li>Within the specified ramp time the product reaches the new set value</li>
                            <li>The product initiates a revert to the old set value (e.g. 100%) if now new set value is recieved within the revert time window</li>
                            <li>Within the specified ramp time the product reverts to the old set value</li>
                        </ol>
                    </xsl:if>
                </div>
            </xsl:if>

            <!-- Footer-->
            <div class="profilefooter">
            Informationen und Support unter <a href="http://www.smartgridready.ch">www.smartgridready.ch</a>, oder Mail <a href="mailto:deklaration@smartgridready.ch">deklaration@smartgridready.ch</a>
        </div>
        </div>
    </xsl:template>

</xsl:stylesheet>
