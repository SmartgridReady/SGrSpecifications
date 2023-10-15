<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:sgr="http://www.smartgridready.com/ns/V0/">

    <!-- Generic Functional Profiles -->
    <xsl:template match="sgr:FunctionalProfileFrame">
        <table style="border:hidden;">
            <thead><tr style="border:hidden;"><td>
                <div class="documentheader">
                <img src="https://smartgridready.ch/media/images/Logos/SGR_LOGO_REDESIGN_RGB.svg" height= "134px" />
                <span style="float:right;">Functional Profile Definition</span></div>
            </td></tr></thead>
            <tbody><tr style="border:hidden;"><td>
                <div class="functionalProfile">
                    <h2>
        
                        <xsl:value-of
                            select="sgr:functionalProfile/sgr:functionalProfileIdentification/sgr:functionalProfileCategory" />
                        - <xsl:value-of
                            select="sgr:functionalProfile/sgr:functionalProfileIdentification/sgr:functionalProfileType" />
                        (Level <xsl:value-of
                            select="sgr:functionalProfile/sgr:functionalProfileIdentification/sgr:levelOfOperation" />)
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
                            <h2>Table of Attributes</h2>
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
                                        <td>
                                            <div>
                                                <xsl:call-template name="SGrLanguageText">
                                                    <xsl:with-param name="lang">en</xsl:with-param>
                                                    <xsl:with-param name="value">Upper Range Limit.
                                                     </xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                            <div>
                                                <xsl:call-template name="SGrLanguageText">
                                                    <xsl:with-param name="lang">de</xsl:with-param>
                                                    <xsl:with-param name="value">Oberer Grenzwert.
                                                     </xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                        </td>
                                    </tr>
                                </xsl:if>
        
                                <!--minVal-->
                                <xsl:if test="//sgr:minVal">
                                    <tr class="genericDetails">
                                        <td class="genericattribute">minVal</td>
                                        <td>Float</td>
                                        <td>
                                            <div>
                                                <xsl:call-template name="SGrLanguageText">
                                                    <xsl:with-param name="lang">en</xsl:with-param>
                                                    <xsl:with-param name="value">Lower Range Limit.
                                                     </xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                            <div>
                                                <xsl:call-template name="SGrLanguageText">
                                                    <xsl:with-param name="lang">de</xsl:with-param>
                                                    <xsl:with-param name="value">Unterer Grenzwert.
                                                     </xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                        </td>
                                    </tr>
                                </xsl:if>
        
                                <!--specialQualityRequirement-->
                                <xsl:if test="//sgr:specialQualityRequirement">
                                    <tr class="genericDetails">
                                        <td class="genericattribute">specialQualityRequirement</td>
                                        <td>String (e.g. "METAS")</td>
                                        <td>
                                            <div>
                                                <xsl:call-template name="SGrLanguageText">
                                                    <xsl:with-param name="lang">en</xsl:with-param>
                                                    <xsl:with-param name="value">Indicates Quality requirements fullfilled like formal certifications.
                                                     </xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                            <div>
                                                <xsl:call-template name="SGrLanguageText">
                                                    <xsl:with-param name="lang">de</xsl:with-param>
                                                    <xsl:with-param name="value">Zeigt an, dass die Qualitätsanforderungen formal erfüllt sind z.B. durch Zertifizierungen.
                                                     </xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                        </td>
                                    </tr>
                                </xsl:if>
        
                                <!--precisionPercent-->
                                <xsl:if test="//sgr:precisionPercent">
                                    <tr class="genericDetails">
                                        <td class="genericattribute">precisionPercent</td>
                                        <td>%</td>
                                        <td>
                                            <div>
                                                <xsl:call-template name="SGrLanguageText">
                                                    <xsl:with-param name="lang">en</xsl:with-param>
                                                    <xsl:with-param name="value">Precision defines the accuracy
                                                          of a data point either related to a measurement value, a
                                                          simulation
                                                          result or of a setpoint value.
                                                     </xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                            <div>
                                                <xsl:call-template name="SGrLanguageText">
                                                    <xsl:with-param name="lang">de</xsl:with-param>
                                                    <xsl:with-param name="value">Präzision definiert die Genauigkeit
                                                           eines Datenpunkts, der sich entweder auf einen Messwert bezieht, auf ein
                                                           Simulationsergebnis oder auf einen Sollwert.
                                                     </xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                        </td>
                                    </tr>
                                </xsl:if>
        
                                <!--stabilityFallback-->
                                <xsl:if test="//sgr:stabilityFallback">
                                    <tr class="genericDetails">
                                        <td class="genericattribute">stabilityFallback</td>
                                        <td> Max recieve time: float, seconds <br /> Init Value: float, <br />
                                            Fallback Value: float <br />
                                        </td>
                                        <td>
                                            <div>
                                                <xsl:call-template name="SGrLanguageText">
                                                    <xsl:with-param name="lang">en</xsl:with-param>
                                                    <xsl:with-param name="value">A consumer or a generating system receives the
                                                                permit for a load change for a certain period of time. This time
                                                                is always set to 0 each time a confirmation message is received
                                                                (HeartBeat).
                                                     </xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                            <div>
                                                <xsl:call-template name="SGrLanguageText">
                                                    <xsl:with-param name="lang">de</xsl:with-param>
                                                    <xsl:with-param name="value">Ein Verbraucher oder ein Erzeuger empfängt die Erlaubnis
                                                                für eine Laständerung innerhalb einer bestimmten Zeit.
                                                                Diese Zeit wird jedes Mal auf 0 gesetzt, wenn eine Bestätigungsnachricht
                                                                empfangen wird (Hearbeat).
                                                     </xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                        </td>
                                    </tr>
                                </xsl:if>
        
                                <!--smoothTransition-->
                                <xsl:if test="//sgr:smoothTransition">
                                    <tr class="genericDetails">
                                        <td class="genericattribute">smoothTransition</td>
                                        <td>
                                            <div>
                                                <xsl:call-template name="SGrLanguageText">
                                                    <xsl:with-param name="lang">en</xsl:with-param>
                                                    <xsl:with-param name="value">
                                                      <![CDATA[
                                                        Window: optional, seconds, unsigned long.</p>
                                                        <p>rmp: optional, seconds, unsigned long.</p>
                                                        <p>rvrt: optional, seconds, unsigned long.</p>
                                                      ]]>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                            <div>
                                                <xsl:call-template name="SGrLanguageText">
                                                    <xsl:with-param name="lang">de</xsl:with-param>
                                                    <xsl:with-param name="value">
                                                      <![CDATA[
                                                         Fenster: optional, Sekunden, unsigned long</p>
                                                         <p>rmp: optional, Sekunden, unsingned long</p>
                                                         <p>rvrt: optional, Sekunden, unsigned long.</p>
                                                      ]]>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                        </td>

                                        <td>
                                            <div>
                                                <xsl:call-template name="SGrLanguageText">
                                                    <xsl:with-param name="lang">en</xsl:with-param>
                                                    <xsl:with-param name="value">
                                                      <![CDATA[
                                                        The time behavior of a transition from a power
                                                        adjustment (positive as well as negative) can be determined by
                                                        several time values, so that this starts with a random time delay,
                                                        changes via a ramp and an expiry time with return to the initial
                                                        value (see IEC-61850-90-7).
                                                        <p>Window: Indicates a time
                                                            window in which the new operating
                                                            mode is started randomly. The time window begins with the
                                                            start
                                                            command of the operating mode. The value 0 means immediate.</p>
                                                        <p>rmp: Specifies how quickly
                                                            the changes should be made.
                                                            The corresponding value is gradually changed from the old to
                                                            the
                                                            new value in the specified time.</p>
                                                        <p>rvrt: Determines how long
                                                            the operating mode should be
                                                            active. When the time has elapsed, the operating mode is
                                                            automatically terminated. If rvrtTms = 0 (standard value),
                                                            the
                                                            operating mode remains active until a new command is
                                                            received.</p>
                                                      ]]>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                            <div>
                                                <xsl:call-template name="SGrLanguageText">
                                                    <xsl:with-param name="lang">de</xsl:with-param>
                                                    <xsl:with-param name="value">
                                                      <![CDATA[
                                                         Das Zeitverhalten eines Übergangs von einer Lastanpassung
                                                         (sowohl positiv als auch negativ) kann durch mehrere Zeitwerte bestimmt werden,
                                                         so dass dieser mit einer zufälligen Zeitverzögerung startet,
                                                         Änderungen erfolgen über eine Rampe und eine Ablaufzeit mit Rückkehr zum Ausgangszustand
                                                         Wert (siehe IEC-61850-90-7).
                                                         <p>Fenster: Gibt ein Zeitfenster
                                                             an, in dem der neue Betriebsmodus angezeigt wird
                                                             Der Modus wird zufällig gestartet. Das Zeitfenster beginnt mit dem
                                                             Startbefehl mit der Betriebsart. Der Wert 0 bedeutet sofort.</p>
                                                         <p>rmp: Gibt an, wie schnell
                                                             Die Änderungen vorgenommen werden sollten.
                                                             Der entsprechende Wert wird in der angegebenen Zeit schrittweise vom alten auf den neuen
                                                             Wert geändert.</p>
                                                         <p>rvrt: Bestimmt, wie lange die Betriebsart aktiv sein sollte.
                                                             Nach Ablauf der Zeit ist der Betriebsmodus automatisch beendet, sofern rvrtTms = 0 (Standardwert),
                                                             Der Betriebsmodus bleibt aktiv, bis ein neuer Befehl gegeben wird.</p>
                                                      ]]>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                        </td>
                                    </tr>
                                </xsl:if>
        
                                <!--maxLatencyTime-->
                                <xsl:if test="//sgr:maxLatencyTimeMs">
                                    <tr class="genericDetails">
                                        <td class="genericattribute">maxLatencyTimeMs</td>
                                        <td>unsigned long</td>
                                        <td>
                                            <div>
                                                <xsl:call-template name="SGrLanguageText">
                                                    <xsl:with-param name="lang">en</xsl:with-param>
                                                    <xsl:with-param name="value">Maximum time in milliseconds from capturing of measured value
                                                                                 until ready at the product interface
                                                                                 (i.e. analog-digital conversion time).</xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                            <div>
                                                <xsl:call-template name="SGrLanguageText">
                                                    <xsl:with-param name="lang">de</xsl:with-param>
                                                    <xsl:with-param name="value">Maximalzeit in Millisekunden for die Aufnahme der Messwerte bis zur Bereitstellung an der Produktschnittstelle
                                                                                 (d.h. Analog-Digital-Umwandlungszeit).</xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                        </td>
                                    </tr>
                                </xsl:if>
        
                                <!--measuredValueType-->
                                <xsl:if test="//sgr:measuredValueType">
                                    <tr class="genericDetails">
                                        <td class="genericattribute">measuredValueType</td>
                                        <td>value, min, max, average, stdDev</td>
                                        <td>
                                            <div>
                                                <xsl:call-template name="SGrLanguageText">
                                                    <xsl:with-param name="lang">en</xsl:with-param>
                                                    <xsl:with-param name="value">Type of data point collection.</xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                            <div>
                                                <xsl:call-template name="SGrLanguageText">
                                                    <xsl:with-param name="lang">de</xsl:with-param>
                                                    <xsl:with-param name="value">Art der Messwert-Sammlung.</xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                        </td>
                                    </tr>
                                </xsl:if>
        
                                <!--measuredValueSource-->
                                <xsl:if test="//sgr:measuredValueSource">
                                    <tr class="genericDetails">
                                        <td class="genericattribute">measuredValueSource</td>
                                        <td>measuredValue, calculatedValue, empiricalValue</td>
                                        <td>
                                            <div>
                                                <xsl:call-template name="SGrLanguageText">
                                                    <xsl:with-param name="lang">en</xsl:with-param>
                                                    <xsl:with-param name="value">Value source kind related to SGr level 6 applications.</xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                            <div>
                                                <xsl:call-template name="SGrLanguageText">
                                                    <xsl:with-param name="lang">de</xsl:with-param>
                                                    <xsl:with-param name="value">Quellart bezogen auf Anwendungen der Stufe 6.</xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                        </td>
                                    </tr>
                                </xsl:if>
        
                                <!--sampleRateHz-->
                                <xsl:if test="//sgr:sampleRateHz">
                                    <tr class="genericDetails">
                                        <td class="genericattribute">sampleRateHz</td>
                                        <td>float</td>
                                        <td></td>
                                        <td>
                                            <div>
                                                <xsl:call-template name="SGrLanguageText">
                                                    <xsl:with-param name="lang">en</xsl:with-param>
                                                    <xsl:with-param name="value">Sampling rate in milliseconds.</xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                            <div>
                                                <xsl:call-template name="SGrLanguageText">
                                                    <xsl:with-param name="lang">de</xsl:with-param>
                                                    <xsl:with-param name="value">Abtastrate in Millisekunden.</xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                        </td>
                                    </tr>
                                </xsl:if>
        
                                <!--curtailment-->
                                <xsl:if test="//sgr:curtailment">
                                    <tr class="genericDetails">
                                        <td class="genericattribute">curtailment</td>
                                        <td>float</td>
                                        <td>
                                            <div>
                                                <xsl:call-template name="SGrLanguageText">
                                                    <xsl:with-param name="lang">en</xsl:with-param>
                                                    <xsl:with-param name="value">Used in state-based reduction schemes. This value specifies the
                                                                                 reduction in percent for the reduced operation mode.</xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                            <div>
                                                <xsl:call-template name="SGrLanguageText">
                                                    <xsl:with-param name="lang">de</xsl:with-param>
                                                    <xsl:with-param name="value">Wird in zustandsbasierten Schemata benutzt. Der Wert definiert die
                                                                                 Reduktion in Prozent for den reduzierten Betriebsmodus.</xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                        </td>
                                    </tr>
                                </xsl:if>
        
                                <!--minLoad-->
                                <xsl:if test="//sgr:minLoad">
                                    <tr class="genericDetails">
                                        <td class="genericattribute">minLoad</td>
                                        <td>float</td>
                                        <td>
                                            <div>
                                                <xsl:call-template name="SGrLanguageText">
                                                    <xsl:with-param name="lang">en</xsl:with-param>
                                                    <xsl:with-param name="value">Minimale Last in kW, welche im Sperrbetrieb nicht überschritten werden darf.</xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                            <div>
                                                <xsl:call-template name="SGrLanguageText">
                                                    <xsl:with-param name="lang">de</xsl:with-param>
                                                    <xsl:with-param name="value">Minimal load in kW, which must not be exceeded in wlock mode.</xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                        </td>
                                    </tr>
                                </xsl:if>
        
                                <!--maxLockTimeMinutes-->
                                <xsl:if test="//sgr:maxLockTimeMinutes">
                                    <tr class="genericDetails">
                                        <td class="genericattribute">maxLockTimeMinutes</td>
                                        <td>float</td>
                                        <td>
                                            <div>
                                                <xsl:call-template name="SGrLanguageText">
                                                    <xsl:with-param name="lang">en</xsl:with-param>
                                                    <xsl:with-param name="value">Maximum time in minutes for locking.</xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                            <div>
                                                <xsl:call-template name="SGrLanguageText">
                                                    <xsl:with-param name="lang">de</xsl:with-param>
                                                    <xsl:with-param name="value">Wert in Minuten für die maximale Sperrzeit.</xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                        </td>
                                    </tr>
                                </xsl:if>
        
                                <!--minRunTimeMinutes-->
                                <xsl:if test="//sgr:minRunTimeMinutes">
                                    <tr class="genericDetails">
                                        <td class="genericattribute">minRunTimeMinutes</td>
                                        <td>float</td>
                                        <td>
                                            <div>
                                                <xsl:call-template name="SGrLanguageText">
                                                    <xsl:with-param name="lang">en</xsl:with-param>
                                                    <xsl:with-param name="value">Minimum time in minutes for locking.</xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                            <div>
                                                <xsl:call-template name="SGrLanguageText">
                                                    <xsl:with-param name="lang">de</xsl:with-param>
                                                    <xsl:with-param name="value">Wert in Minuten für die minimale Laufzeit.</xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                        </td>
                                    </tr>
                                </xsl:if>
        
                                <!--valueByTimeTableMinutes-->
                                <xsl:if test="//sgr:valueByTimeTableMinutes">
                                    <tr class="genericDetails">
                                        <td class="genericattribute">valueByTimeTableMinutes</td>
                                        <td>float</td>
                                        <td>
                                            <div>
                                                <xsl:call-template name="SGrLanguageText">
                                                    <xsl:with-param name="lang">en</xsl:with-param>
                                                    <xsl:with-param name="value">Step width in minutes.</xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                            <div>
                                                <xsl:call-template name="SGrLanguageText">
                                                    <xsl:with-param name="lang">de</xsl:with-param>
                                                    <xsl:with-param name="value">Schrittweite in Minuten.</xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                        </td>
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
                                        <td>
                                            <div>
                                                <xsl:call-template name="SGrLanguageText">
                                                    <xsl:with-param name="lang">en</xsl:with-param>
                                                    <xsl:with-param name="value">Systems with more than One communicator need a definition of the
                                                        priority of the commands / demands for a flexibility
                                                        requirement.
                                                        This element defines the kind of a such a command (servicable
                                                        for net (DSO), energy or system (TNO)) and its priority (SHALL / SHOULD / MAY).</xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                            <div>
                                                <xsl:call-template name="SGrLanguageText">
                                                    <xsl:with-param name="lang">de</xsl:with-param>
                                                    <xsl:with-param name="value">
                                                        Systeme mit mehr als einem Kommunikator benötigen eine Definition der
                                                        Priorität der Befehle / Anforderungen an eine Flexibilitätsanforderung.
                                                        Dieses Element definiert die Art eines solchen Befehls (servicable).
                                                        für Netz (DSO), Energie oder System (TNO)) und seine Priorität (SOLL / SOLLTE / KANN).</xsl:with-param>
                                                </xsl:call-template>
                                            </div>
                                        </td>
                                    </tr>
                                </xsl:if>
        
                            </table>
        
                            <xsl:if test="//sgr:smoothTransition">
                                <h3>Smooth Transition Timing</h3>
                                <img src="/xsl/ressources/genAttributes_smoothTransition.drawio.png" width="100%" />
                                <div>
                                    <xsl:call-template name="SGrLanguageText">
                                        <xsl:with-param name="lang">en</xsl:with-param>
                                        <xsl:with-param name="value">
                                            <![CDATA[
                                            <ol>
                                                <li>Command for a new set value is received (e.g. 60%)</li>
                                                <li>Within the maximum delay the product starts the ramp to the new set
                                                    value</li>
                                                <li>Within the specified ramp time the product reaches the new set value</li>
                                                <li>The product initiates a revert to the old set value (e.g. 100%) if
                                                    now new set value is recieved within the revert time window</li>
                                                <li>Within the specified ramp time the product reverts to the old set
                                                    value</li>
                                            </ol>
                                            ]]>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </div>
                                <div>
                                    <xsl:call-template name="SGrLanguageText">
                                        <xsl:with-param name="lang">de</xsl:with-param>
                                        <xsl:with-param name="value">
                                            <![CDATA[
                                            <ol>
                                                <li>Das Kommando für einen neuen Wert wird empfangen (z.B. 60%).</li>
                                                <li>Innerhalb einer Maximalverzögerung startet das Produkt mit einer Rampe zu dem neuen Wert,</li>
                                                <li>Innerhalb einer definierten Rampenzeit erreicht das Produkt den neuen Wert.</li>
                                                <li>Das Produkt initiiert die Rückkehr zu dem alten Wert (z.B. 100%), falls
                                                    kein neuer Wert in dem Rückkehr-Zeitfenster empfangen wurde.</li>
                                                <li>Innerhalb der definierten Rampenzeit kehrt das Produkt zu dem alten Wert zurück.</li>
                                            </ol>
                                            ]]>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </div>
                            </xsl:if>
                        </div>
                    </xsl:if>
                </div>
            </td></tr></tbody>
            <tfoot><tr style="border:hidden;"><td>
                <!-- Footer-->
                <div class="documentfooter"> Information and Support at <a
                        href="http://www.smartgridready.ch">www.smartgridready.ch</a> oder email <a
                        href="mailto:deklaration@smartgridready.ch">deklaration@smartgridready.ch</a>
                        <br/><sup>1)</sup> R read, W write, P persistent
                        <br/><sup>2)</sup> M mandatory, R recommended, O optional
                </div>
            </td></tr></tfoot>
        </table>
    </xsl:template>

</xsl:stylesheet>