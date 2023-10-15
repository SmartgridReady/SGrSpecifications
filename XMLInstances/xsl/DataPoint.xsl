<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:sgr="http://www.smartgridready.com/ns/V0/">

    <xsl:template match="sgr:dataPointList">
        <!-- Data Points -->
        <div class="dataPoint">
            <table>
                <colgroup>
                    <col style="width:230px" />
                    <col style="width:325px" />
                    <col style="width:54px" />
                    <col style="width:75px" />
                    <col style="width:44px" />
                    <col style="width:44px" />
                </colgroup>
                <tr>
                    <th>Datapoint</th>
                    <th>Description</th>
                    <th>Unit</th>
                    <th>Type</th>
                    <th>MRO<sup>1)</sup></th>
                    <th>RWP<sup>2)</sup></th>
                </tr>
                <xsl:for-each select="sgr:dataPointListElement">
                    <xsl:apply-templates select="." />
                </xsl:for-each>
            </table>
        </div>
    </xsl:template>

    <xsl:template match="sgr:dataPointListElement">
        <xsl:apply-templates select="sgr:dataPoint" />
        <tr class="dataPointDetails">
            <td colspan="6" class="noborder">
                <table style="margin-left:35px; width:737px;">
                    <colgroup>
                        <col style="width:194px" />
                    </colgroup>

                    <xsl:apply-templates select="sgr:dataPoint/sgr:programmerHints" />
                    <xsl:apply-templates select="sgr:dataPoint/sgr:alternativeNames" />
                    <xsl:apply-templates select="sgr:genericAttributes" />

                    <!-- transport service details-->
                    <xsl:if test="sgr:modbusDataPointConfiguration">
                        <xsl:apply-templates select="sgr:modbusDataPointConfiguration" />
                        <xsl:apply-templates select="sgr:blockCacheIdentification" />
                        <xsl:apply-templates select="sgr:modbusAttributes" />
                    </xsl:if>
                    <xsl:if test="sgr:restApiDataPointConfiguration">
                        <xsl:apply-templates select="sgr:restApiDataPointConfiguration" />
                    </xsl:if>
                </table>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="sgr:dataPoint">
        <!-- Renders a data point table row (dataPointName, unit, dataType, presenceLevel,
        dataDirection) -->
        <tr>
            <td>
                <xsl:value-of select="sgr:dataPointName" />
            </td>
            <td>
                <xsl:for-each select="sgr:legibleDescription">
                    <div>
                        <xsl:attribute name="lang">
                          <xsl:value-of select="sgr:language" />
                        </xsl:attribute>
                        <img width="20px" height="14px">
                            <xsl:attribute name="src" alt="Lang">/xsl/ressources/<xsl:value-of select="sgr:language" />.png</xsl:attribute>
                        </img>
                        &#160;<xsl:value-of select="sgr:textElement" disable-output-escaping="yes" />
                        <xsl:apply-templates select="sgr:uri" />
                    </div>
                </xsl:for-each>
                <xsl:apply-templates select="sgr:dataType/sgr:enum" />
                <xsl:apply-templates select="sgr:dataType/sgr:bitmap" />
            </td>
            <td>
                <xsl:call-template name="SGrUnits">
                    <xsl:with-param name="value" select="sgr:unit" />
                </xsl:call-template>
            </td>
            <td>
                <xsl:if test="sgr:arrayLength">
                    <xsl:value-of select="sgr:arrayLength" /> x </xsl:if>

                <xsl:apply-templates select="sgr:dataType" />
            </td>
            <td>
                <xsl:value-of select="sgr:presenceLevel" />
            </td>
            <td>
                <xsl:value-of select="sgr:dataDirection" />
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>