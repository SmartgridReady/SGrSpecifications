<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sgr="http://www.smartgridready.com/ns/V0/">

<!--
    Contains the style sheets for the generic functional profile, including
    - sgr:alternativeNames
-->

    <xsl:import href="SGrDeviceTypeModbus.xsl" />
    <xsl:import href="SGrDeviceTypeRestAPI.xsl" />

    <xsl:import href="SGrGenericAttributes.xsl" />
    <xsl:import href="SGrGenericNamelistType.xsl" />
    <xsl:import href="SGrGenericLegibDocumentationType.xsl" />

    <xsl:template match="sgr:functionalProfileListElement">
        <xsl:call-template name="sgrFunctionProfile" />
    </xsl:template>

    <xsl:template name="sgrFunctionProfile">
        <div class="functionalProfile">
            <h2 style="float:left;">
                <xsl:value-of select="sgr:functionalProfile/@profileName" />
            </h2>

            <!-- Functional Profile Block -->
            <table>
                <colgroup>
                    <col style="width:30%" />
                </colgroup>

                <xsl:apply-templates select="sgr:functionalProfile" />

                <!-- Generic Attributes -->
                <xsl:apply-templates select="sgr:genericAttributes" />

                <!-- Modbus and Rest Attributes -->
                <xsl:apply-templates select="sgr:modbusAttributes" />
            </table>

            <!-- Data Points -->
            <div class="dataPoint">
                <table>
                    <colgroup>
                        <col style="width:5%" />
                        <col style="width:25%" />
                        <col style="width:35%" />
                        <col style="width:15%" />
                        <col style="width:10%" />
                        <col style="width:10%" />
                    </colgroup>
                    <tr>
                        <th colspan="2">Datapoint</th>
                        <th>Unit</th>
                        <th>Type</th>
                        <th>MRO</th>
                        <th>RWP</th>
                    </tr>
                    <xsl:apply-templates select="sgr:dataPointListElement" />
                </table>
            </div>
        </div>
    </xsl:template>

    <!-- Generic Functional Profile -->
    <xsl:template match="sgr:functionalProfile">

        <tr>
            <td>Profil-ID</td>
            <td>
                <xsl:apply-templates select="sgr:functionalProfileIdentification">
                    <xsl:with-param name="separator" select="' - '" />
                </xsl:apply-templates>
            </td>
        </tr>
        <tr>
            <td>Level</td>
            <td>
                <xsl:value-of select="sgr:functionalProfileIdentification/sgr:levelOfOperation" />
            </td>
        </tr>
        <tr>
            <td>Version</td>
            <td>
                <xsl:apply-templates select="sgr:functionalProfileIdentification/sgr:versionNumber" />
            </td>
        </tr>

        <tr>
            <td class="noborder">&#160;</td>
        </tr>

        <!-- alternativeNames -->
        <xsl:apply-templates select="sgr:alternativeNames" />

        <!-- legibleDescription (4x opt) -->
        <xsl:apply-templates select="sgr:legibleDescription" />

        <!-- programmerHints (4x opt)-->
        <xsl:apply-templates select="sgr:programmerHints" />
    </xsl:template>

    <!-- AlternativeNames -->
    <xsl:template match="sgr:alternativeNames">
        <xsl:call-template name="AlternativeNames" />
    </xsl:template>

    <!-- LegibleDescription -->
    <xsl:template match="sgr:legibleDescription">
        <tr>
            <xsl:attribute name="lang">
                <xsl:value-of select="sgr:language" />
            </xsl:attribute>
            <td colspan="2">
                <xsl:call-template name="LegibleDescription" />
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="sgr:programmerHints">
        <tr>
            <xsl:attribute name="lang">
                <xsl:value-of select="sgr:language" />
            </xsl:attribute>
            <td colspan="2">
                <xsl:call-template name="LegibleDescription" />
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>