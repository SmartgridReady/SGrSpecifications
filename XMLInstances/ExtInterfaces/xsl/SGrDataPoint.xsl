<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sgr="http://www.smartgridready.com/ns/V0/">

<!--
    Contains the style sheets for data point, including
    - sgr:dpNameList

    Depends on named templates:
    - SGrNamelistType
    - SGrLegibDocumentationType
    - 

-->


<!-- SGrDataPointDescriptionType -->
<xsl:template match="sgr:dpListElement">
	<tr>
		<td colspan="2"><xsl:value-of select="sgr:dataPoint/@datapointName"/></td>
		<td><xsl:value-of select="sgr:dataPoint/@unit"/></td>
		<td><xsl:apply-templates select="sgr:dataPoint/sgr:basicDataType"/></td>
		<td><xsl:value-of select="sgr:dataPoint/@mroVisibilityIndicator"/></td>
		<td><xsl:value-of select="sgr:dataPoint/@rwpDatadirection"/></td>
	</tr>
	<tr class="dataPointDetails">
		<td class="noborder"></td>
		<td colspan="5">
            <table>
                <colgroup>
                    <col style="width:25.8%"/>
                </colgroup>	

                <!-- dpNameList (1x opt)-->
                <xsl:if test="sgr:dataPoint/sgr:dpNameList">
                    <xsl:apply-templates select="sgr:dataPoint/sgr:dpNameList"/>
                </xsl:if>

                <!-- dpLegibDesc (4x opt) -->
			    <xsl:apply-templates select="sgr:dataPoint/sgr:dpLegibDesc"/>

                <!-- TODO name="basicArrayDataType" type="sgr:SGrBasicGenArrayDPTypeType" (opt 1x) -->	

                <!-- Generic Attributes -->
                <xsl:apply-templates select="sgr:genAttribute"/>
            
                <!-- Modbus Device -->
                <xsl:if test="sgr:modbusDataPoint">
                    <tr class="transportDetails"><td colspan="2" class="noborder"><h3><img src="xsl/modbus.png" alt="Modbus" width="100px"/></h3></td></tr>
                    <xsl:apply-templates select="sgr:modbusDataPoint"/>
                    <xsl:apply-templates select="sgr:modbusAttr"/>
                </xsl:if>

                <!-- Rest Device -->
                <xsl:if test="sgr:restAPIDataPoint">
                    <tr class="transportDetails"><td colspan="2" class="noborder"><h3><img src="xsl/rest.png" alt="Rest" width="100px"/></h3></td></tr>
                    <xsl:apply-templates select="sgr:restAPIDataPoint"/>
                    <xsl:apply-templates select="sgr:restAPIAttr"/>
                </xsl:if>
            </table>
		</td>
	</tr>
</xsl:template>

<!-- dpNameList -->
<xsl:template match="sgr:dpNameList">
    <xsl:call-template name="SGrNamelistType"/>
</xsl:template>

<!-- SGrLegibDocumentationType -->
<xsl:template match="sgr:dpLegibDesc">
    <tr><xsl:attribute name="lang"><xsl:value-of select="sgr:language"/></xsl:attribute><td colspan="2"><xsl:call-template name="SGrLegibDocumentationType"/></td></tr>	
</xsl:template>

<!-- SGrModbusDataPointDescriptionType -->
<xsl:template match="sgr:modbusDataPoint">
	<!-- modbusDataType (opt 1x) -->
	<xsl:if test="sgr:modbusDataType">
		<tr class="transportDetails"><td>Data Type</td><td><xsl:apply-templates select="sgr:modbusDataType"/></td></tr>
	</xsl:if>

	<!-- modbusArrayDataType (opt 1x) -->
	<xsl:if test="sgr:modbusArrayDataType">
		<tr class="transportDetails"><td>Array Data Type</td><td><xsl:apply-templates select="sgr:modbusArrayDataType"/></td></tr>
	</xsl:if>

	<tr class="transportDetails">
		<td>Register</td>
		<td>
			<xsl:value-of select="sgr:modbusFirstRegisterReference/@registerType"/>&#160;
			<xsl:value-of select="sgr:modbusFirstRegisterReference/@addr"/>.<xsl:value-of select="sgr:modbusFirstRegisterReference/@bitRank"/>
			(Size <xsl:value-of select="sgr:dpSizeNrRegisters"/>)
		</td>
	</tr>
	
	<!-- bitmask (opt 1x) -->
	<xsl:if test="sgr:bitmask">
		<tr class="transportDetails"><td>Bit Mask</td><td><xsl:value-of select="sgr:bitmask"/>h</td></tr>
	</xsl:if>

	<tr class="transportDetails"><td>Supports</td><td>
		<xsl:call-template name="join">
			<xsl:with-param name="valueList" select="sgr:masterFunctionsSupported"/>
			<xsl:with-param name="separator" select="', '"/>
		</xsl:call-template>
	</td></tr>

	<!-- modbusJMESPath (opt 1x) -->
	<xsl:if test="sgr:modbusJMESPath">
		<tr class="transportDetails"><td>JMES Path</td><td><xsl:value-of select="sgr:modbusJMESPath"/>h</td></tr>
	</xsl:if>
</xsl:template>

<!-- SGrRestAPIDataPointDescriptionType -->
<xsl:template match="sgr:restAPIDataPoint">
    <tr class="transportDetails"><td>Data Type</td><td><xsl:apply-templates select="./@dataType"/></td></tr>
    <tr class="transportDetails"><td>End Point</td><td><xsl:value-of select="sgr:restAPIEndPoint"/></td></tr>
    <tr class="transportDetails"><td>JMES Path</td><td><xsl:value-of select="sgr:restAPIJMESPath"/></td></tr>
</xsl:template>

<!-- Attributes RestAPI -->
<xsl:template match="sgr:restAPIAttr">
	<!--flexAssistance-->
	<xsl:if test="sgr:placeHolder4futureExtensions">
		<tr class="transportDetails"><td><img src="xsl/rest.png" width="60px"/> Fut.Ext. ??</td><td><xsl:value-of select="sgr:placeHolder4futureExtensions"/></td></tr>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>