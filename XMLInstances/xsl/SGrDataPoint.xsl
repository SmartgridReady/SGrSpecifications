<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:sgr="http://www.smartgridready.com/ns/V0/">

	<!--
    Contains the style sheets for data point, including
    - sgr:alternativeNames
-->

	<xsl:import href="SGrDeviceTypeModbus.xsl" />
	<xsl:import href="SGrDeviceTypeRestAPI.xsl" />

	<xsl:import href="SGrGenericAttributes.xsl" />
	<xsl:import href="SGrGenericDataPointDefinitions.xsl" />
	<xsl:import href="SGrGenericHelpers.xsl" />
	<xsl:import href="SGrGenericLegibDocumentationType.xsl" />
	<xsl:import href="SGrGenericNamelistType.xsl" />


	<!-- SGrDataPointType -->
	<xsl:template match="sgr:dataPointListElement">
		<tr>
			<td colspan="2">
				<xsl:value-of select="sgr:dataPoint/sgr:dataPointName" />
			</td>
			<td>
				<xsl:call-template name="SGrUnits">
					<xsl:with-param name="value" select="sgr:dataPoint/sgr:unit" />
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
				<xsl:value-of select="sgr:dataPoint/sgr:presenceLevel" />
			</td>
			<td>
				<xsl:value-of select="sgr:dataPoint/sgr:dataDirection" />
			</td>
		</tr>
		<tr class="dataPointDetails">
			<td class="noborder"></td>
			<td colspan="5">
				<table>
					<colgroup>
						<col style="width:25.8%" />
					</colgroup>

					<!-- alternativeNames (1x opt)-->
					<xsl:if test="sgr:dataPoint/sgr:alternativeNames">
						<xsl:apply-templates select="sgr:dataPoint/sgr:alternativeNames" />
					</xsl:if>

					<!-- legibleDescription (4x opt) -->
					<xsl:apply-templates select="sgr:dataPoint/sgr:legibleDescription" />

					<!-- programmerHints (4x opt)-->
	                <xsl:apply-templates select="sgr:dataPoint/sgr:programmerHints" />


					<!-- Generic Attributes -->
					<xsl:apply-templates select="sgr:genericAttributes" />

					<!-- Modbus Device -->
					<xsl:if test="sgr:modbusDataPointConfiguration">
						<tr class="transportDetails">
							<td colspan="2" class="noborder">
								<h3>
									<img src="/xsl/modbus.png" alt="Modbus" width="100px" />
								</h3>
							</td>
						</tr>
						<xsl:apply-templates select="sgr:modbusDataPointConfiguration" />
						<xsl:if test="sgr:blockCacheIdentification">
							<tr>
								<td>Time Sync Block</td>
								<td><xsl:value-of select="sgr:blockCacheIdentification" /></td>
							</tr>
						</xsl:if>
						<xsl:apply-templates select="sgr:modbusAttributes" />
					</xsl:if>

					<!-- Rest Device -->
					<xsl:if test="sgr:restApiDataPointConfiguration">
						<tr class="transportDetails">
							<td colspan="2" class="noborder">
								<h3>
									<img src="/xsl/rest.png" alt="Rest" width="100px" />
								</h3>
							</td>
						</tr>
						<xsl:apply-templates select="sgr:restApiDataPointConfiguration" />
					</xsl:if>
				</table>
			</td>
		</tr>
	</xsl:template>

	<!-- alternativeNames -->
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

	<!-- LegibleDescription -->
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

	<!-- ModbusDataPointConfiguration -->
	<xsl:template match="sgr:modbusDataPointConfiguration">
		<!-- modbusDataType (opt 1x) -->
		<tr class="transportDetails">
			<td>Data Type</td>
			<td>
				<xsl:if test="sgr:modbusDataType">
					<xsl:apply-templates select="sgr:modbusDataType" />
				</xsl:if>
			</td>
		</tr>

		<tr class="transportDetails">
			<td>Register</td>
			<td>
				<xsl:value-of select="sgr:modbusFirstRegisterReference/sgr:registerType" />&#160; <xsl:value-of
					select="sgr:modbusFirstRegisterReference/sgr:address" />
				<xsl:choose>
					<xsl:when test="sgr:modbusFirstRegisterReference/sgr:registerType = 'Coil'"> bit <xsl:value-of
							select="sgr:modbusFirstRegisterReference/sgr:bitRank" />
					</xsl:when>

					<xsl:when
						test="sgr:modbusFirstRegisterReference/sgr:registerType = 'DiscreteInput'"> bit <xsl:value-of
							select="sgr:modbusFirstRegisterReference/sgr:bitRank" />
					</xsl:when>
				</xsl:choose>
				(Size <xsl:value-of select="sgr:numberOfRegisters" />) </td>
		</tr>
		
		<tr class="transportDetails">
			<td>Supports</td>
			<td>
				<xsl:call-template name="join">
					<xsl:with-param name="valueList" select="sgr:masterFunctionsSupported" />
					<xsl:with-param name="separator" select="', '" />
				</xsl:call-template>
			</td>
		</tr>


	</xsl:template>

	<!-- RestApiDataPointConfiguration -->
	<xsl:template match="sgr:restApiDataPointConfiguration">
		<tr class="transportDetails">
			<td>Data Type</td>
			<td>
				<xsl:value-of select="./sgr:dataType" />
			</td>
		</tr>
		<xsl:apply-templates select="sgr:restServiceCall" />
	</xsl:template>

</xsl:stylesheet>
