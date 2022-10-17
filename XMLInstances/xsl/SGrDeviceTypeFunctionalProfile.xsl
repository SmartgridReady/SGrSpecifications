<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sgr="http://www.smartgridready.com/ns/V0/">

    <!-- Generic Functional Profiles -->
    <xsl:template match="sgr:SGrFunctionalProfileFrame">
        <div class="functionalProfile">
            <h2>
                <xsl:value-of select="sgr:functionalProfile/@profileName" />
            </h2>

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
                                    <xsl:value-of select="sgr:functionalProfile/sgr:profileNumber/sgr:specsOwnerId" />
                                    -
                                    <xsl:value-of select="sgr:functionalProfile/sgr:profileNumber/sgr:profileIdentification" />
                                    -
                                    <xsl:value-of select="sgr:functionalProfile/sgr:profileNumber/sgr:subProfileIdent" />
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

            <h2>Functional Profile</h2>

            <!-- Functional Profile Block -->
            <table>
                <colgroup>
                    <col style="width:20%" />
                </colgroup>

                <!-- fpNameList -->
                <xsl:apply-templates select="sgr:functionalProfile/sgr:fpNameList" />

                <!-- fpLegibDesc (4x opt) -->
                <xsl:apply-templates select="sgr:functionalProfile/sgr:fpLegibDesc" />

                <!-- fpPrgDesc (4x opt)-->
                <xsl:apply-templates select="sgr:functionalProfile/sgr:fpPrgDesc" />
            </table>

            <!-- Data Points -->
            <div class="dataPoint">
                <table>
                    <colgroup>
                        <col style="width:5%" />
                        <col style="width:15%" />
                        <col style="width:43%" />
                        <col style="width:15%" />
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
                            </td>
                            <td>
                                <xsl:value-of select="sgr:dataPoint/@unit" />
                            </td>
                            <td>
                                <xsl:if test="sgr:dataPoint/sgr:basicDataType">
                                    <xsl:apply-templates select="sgr:dataPoint/sgr:basicDataType" />
                                </xsl:if>

                                <xsl:if test="sgr:dataPoint/sgr:basicArrayDataType">
                                    <xsl:apply-templates select="sgr:dataPoint/sgr:basicArrayDataType" />
                                </xsl:if>
                            </td>
                            <td>
                                <xsl:value-of select="sgr:dataPoint/@mroVisibilityIndicator" />
                            </td>
                            <td>
                                <xsl:value-of select="sgr:dataPoint/@rwpDatadirection" />
                            </td>
                        </tr>

                        <xsl:if test="sgr:dataPoint/sgr:dpNameList or sgr:genAttribute">
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

                                        <!-- Generic Attributes -->
                                        <xsl:apply-templates select="sgr:genAttribute">
                                            <xsl:with-param name="type" select="'FP'" />
                                        </xsl:apply-templates>

                                    </table>
                                </td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>
            </div>

            <xsl:if test="sgr:genAttribute">
                <div class="functionalProfile">
                    <h2>Attibutes</h2>
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
                        <xsl:apply-templates select="sgr:genAttribute">
                            <xsl:with-param name="type" select="'FP'" />
                        </xsl:apply-templates>

                    </table>
                </div>
            </xsl:if>

            <!-- Footer-->
            <div class="profilefooter">
            Konzept und Spezifikation Funktionsprofile siehe separates Dokument "Funktionsprofile_Spezifikation_vx.x.pdf"
            Informationen und Support unter www.smartgridready.ch, deklaration@smartgridready.ch
        </div>
        </div>
    </xsl:template>

</xsl:stylesheet>