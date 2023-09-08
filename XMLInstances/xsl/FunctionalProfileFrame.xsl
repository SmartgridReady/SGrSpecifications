<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:sgr="http://www.smartgridready.com/ns/V0/">

    <!-- Generic Functional Profiles -->
    <xsl:template match="sgr:FunctionalProfileFrame">
        <div class="documentheader">Functional Profile Definition</div>
        <div class="functionalProfile">
            <h2>

                <xsl:value-of
                    select="sgr:functionalProfile/sgr:functionalProfileIdentification/sgr:functionalProfileCategory" />
                - <xsl:value-of
                    select="sgr:functionalProfile/sgr:functionalProfileIdentification/sgr:functionalProfileType" />
                (Level <xsl:value-of
                    select="sgr:functionalProfile/sgr:functionalProfileIdentification/sgr:levelOfOperation" />
                )
            </h2>
            <br />

            <xsl:apply-templates select="sgr:releaseNotes" />

            <table>
                <colgroup>
                    <col style="width:30%" />
                </colgroup>
                <tr>
                    <td class="fpHeader">
                        <h4>Classification</h4>
                    </td>
                    <td class="fpHeader">
                        <table>
                            <colgroup>
                                <col style="width:30%" />
                            </colgroup>

                            <xsl:apply-templates
                                select="/*/sgr:functionalProfile/sgr:functionalProfileIdentification">
                                <xsl:with-param name="separator" select="' - '" />
                            </xsl:apply-templates>
                        </table>
                    </td>
                </tr>
            </table>
            <br />

            <!-- Functional Profile Block -->
            <table>
                <colgroup>
                    <col style="width:230px" />
                </colgroup>

                <!-- alternativeNames -->
                <xsl:apply-templates select="sgr:functionalProfile/sgr:alternativeNames" />
                <xsl:apply-templates select="sgr:functionalProfile/sgr:legibleDescription" />
                <xsl:apply-templates select="sgr:genericAttributes" />
            </table>

            <xsl:apply-templates select="sgr:dataPointList" />

            <xsl:if test="//sgr:genericAttributes">
                <div class="functionalProfile">
                    <h2>Table of Attibutes</h2>
                    <!-- Generic Attributes -->
                    <table>
                        <colgroup>
                            <col style="width:230px" />
                            <col style="width:134px" />
                        </colgroup>
                        <tr>
                            <th>Attribute</th>
                            <th>Type</th>
                            <th>Description</th>
                        </tr>

                        <!--maxVal-->
                        <xsl:if test="//sgr:maxVal">
                            <tr class="genericDetails">
                                <td class="genericattribute">maxVal</td>
                                <td>Float</td>
                                <td>Upper Range Limit</td>
                            </tr>
                        </xsl:if>

                        <!--minVal-->
                        <xsl:if test="//sgr:minVal">
                            <tr class="genericDetails">
                                <td class="genericattribute">minVal</td>
                                <td>Float</td>
                                <td>Lower Range Limit</td>
                            </tr>
                        </xsl:if>

                        <!--specialQualityRequirement-->
                        <xsl:if test="//sgr:specialQualityRequirement">
                            <tr class="genericDetails">
                                <td class="genericattribute">specialQualityRequirement</td>
                                <td>String (e.g. "METAS")</td>
                                <td>Indicates Quality requirements fullfilled like formal
                                    certifications</td>
                            </tr>
                        </xsl:if>

                        <!--precisionPercent-->
                        <xsl:if test="//sgr:precisionPercent">
                            <tr class="genericDetails">
                                <td class="genericattribute">precisionPercent</td>
                                <td>%</td>
                                <td>Precision defines the accuracy
                                    of a data point either related to a measurement value, a
                                    simulation
                                    result or of a setpoint value</td>
                            </tr>
                        </xsl:if>

                        <!--stabilityFallback-->
                        <xsl:if test="//sgr:stabilityFallback">
                            <tr class="genericDetails">
                                <td class="genericattribute">stabilityFallback</td>
                                <td> Max recieve time: float, seconds <br /> Init Value: float, <br />
                                    Fallback Value: float <br />
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
                                <td class="genericattribute">smoothTransition</td>
                                <td>
                                    <p>Window: optional, seconds, unsigned long. (Indicates a time
                                        window in which the new operating
                                        mode is started randomly. The time window begins with the
                                        start
                                        command of the operating mode. The value 0 means immediate.)</p>
                                    <p>rmp: optional, seconds, unsigned long. (specifies how quickly
                                        the changes should be made.
                                        The corresponding value is gradually changed from the old to
                                        the
                                        new value in the specified time.)</p>
                                    <p>rvrt: optional, seconds, unsigned long. (determines how long
                                        the operating mode should be
                                        active. When the time has elapsed, the operating mode is
                                        automatically terminated. If rvrtTms = 0 (standard value),
                                        the
                                        operating mode remains active until a new command is
                                        received.)</p>
                                </td>
                                <td>
                                    The time behavior of a transition from a power
                                    adjustment (positive as well as negative) can be determined by
                                    several time values, so that this starts with a random time
                                    delay,
                                    changes via a ramp and an expiry time with return to the initial
                                    value (see IEC-61850-90-7).
                                </td>
                            </tr>
                        </xsl:if>

                        <!--maxLatencyTime-->
                        <xsl:if test="//sgr:maxLatencyTimeMs">
                            <tr class="genericDetails">
                                <td class="genericattribute">maxLatencyTimeMs</td>
                                <td>unsigned long</td>
                                <td>Maximum time in milliseconds from capturing of measured value
                                    until ready at the external interface
                                    (i.e. analog-digital conversion time)</td>
                            </tr>
                        </xsl:if>

                        <!--measuredValueType-->
                        <xsl:if test="//sgr:measuredValueType">
                            <tr class="genericDetails">
                                <td class="genericattribute">measuredValueType</td>
                                <td>value, min, max, average, stdDev</td>
                                <td>Type of data point collection.</td>
                            </tr>
                        </xsl:if>

                        <!--measuredValueSource-->
                        <xsl:if test="//sgr:measuredValueSource">
                            <tr class="genericDetails">
                                <td class="genericattribute">measuredValueSource</td>
                                <td>measuredValue, calculatedValue, empiricalValue</td>
                                <td>Value source kind related to SGr level 6 applications.</td>
                            </tr>
                        </xsl:if>

                        <!--sampleRateHz-->
                        <xsl:if test="//sgr:sampleRateHz">
                            <tr class="genericDetails">
                                <td class="genericattribute">sampleRateHz</td>
                                <td>float</td>
                                <td>SampleRate in milliseconds</td>
                            </tr>
                        </xsl:if>

                        <!--curtailment-->
                        <xsl:if test="//sgr:curtailment">
                            <tr class="genericDetails">
                                <td class="genericattribute">>curtailment</td>
                                <td>float</td>
                                <td>Used in state-based reduction schemes. This value specifies the
                                    reduction in percent for the reduced operation mode.</td>
                            </tr>
                        </xsl:if>

                        <!--minLoad-->
                        <xsl:if test="//sgr:minLoad">
                            <tr class="genericDetails">
                                <td class="genericattribute">minLoad</td>
                                <td>float</td>
                                <td>Minimale Last in kW, welche im Sperrbetrieb nicht überschritten
                                    werden darf.</td>
                            </tr>
                        </xsl:if>

                        <!--maxLockTimeMinutes-->
                        <xsl:if test="//sgr:maxLockTimeMinutes">
                            <tr class="genericDetails">
                                <td class="genericattribute">maxLockTimeMinutes</td>
                                <td>float</td>
                                <td>Wert in Minuten für die maximale Sperrzeit.</td>
                            </tr>
                        </xsl:if>

                        <!--minRunTimeMinutes-->
                        <xsl:if test="//sgr:minRunTimeMinutes">
                            <tr class="genericDetails">
                                <td class="genericattribute">minRunTimeMinutes</td>
                                <td>float</td>
                                <td>Wert in Minuten für die minimale Laufzeit</td>
                            </tr>
                        </xsl:if>

                        <!--valueByTimeTableMinutes-->
                        <xsl:if test="//sgr:valueByTimeTableMinutes">
                            <tr class="genericDetails">
                                <td class="genericattribute">valueByTimeTableMinutes</td>
                                <td>float</td>
                                <td>Step width in minutes</td>
                            </tr>
                        </xsl:if>

                        <!--flexAssistance-->
                        <xsl:if test="//sgr:flexAssistance">
                            <tr class="genericDetails">
                                <td class="genericattribute">Flex Assistance</td>
                                <td>
                                    <p>assists: AT_NetServicable, AT_SysServicable,
                                        AT_EnerServicable</p>
                                    <p>obliged_to: OL_SHALL, OL_SHOULD, OL_MAY</p>
                                </td>
                                <td>Systems with more than One communicator need a definition of the
                                    priority of the commands / demands for a flexibility
                                    requirement.
                                    This element defines the kind of a such a command (servicable
                                    for net (DSO), energy or system (TNO)) and its priority (SHALL /
                                    SHOULD / MAY)</td>
                            </tr>
                        </xsl:if>

                    </table>

                    <xsl:if test="//sgr:smoothTransition">
                        <h3>Smooth Transition Timing</h3>
                        <img src="/xsl/ressources/genAttributes_smoothTransition.drawio.png" width="100%" />
                        <ol>
                            <li>Command for a new set value is recieved (e.g. 60%)</li>
                            <li>Within the maximum delay the product starts the ramp to the new set
                                value</li>
                            <li>Within the specified ramp time the product reaches the new set value</li>
                            <li>The product initiates a revert to the old set value (e.g. 100%) if
                                now new set value is recieved within the revert time window</li>
                            <li>Within the specified ramp time the product reverts to the old set
                                value</li>
                        </ol>
                    </xsl:if>
                </div>
            </xsl:if>

            <!-- Footer-->
            <div class="documentfooter"> Informationen und Support unter <a
                    href="http://www.smartgridready.ch">www.smartgridready.ch</a>, oder Mail <a
                    href="mailto:deklaration@smartgridready.ch">deklaration@smartgridready.ch</a>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>