<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:sgr="http://www.smartgridready.com/ns/V0/">

	<!--
    Contains the style sheets for the product frames, including
	- sgr:ModbusDeviceFrame
	- sgr:RestApiDeviceFrame
	- sgr:ContactDeviceFrame

-->

	<xsl:include href="DeviceInformation.xsl" />
	<xsl:include href="GenericAttributes.xsl" />

	<xsl:include href="TransportServiceModbus.xsl" />
	<xsl:include href="TransportServiceRestApi.xsl" />
	<xsl:include href="TransportServiceContactApi.xsl" />

	<xsl:include href="FunctionalProfile.xsl" />


	<!-- Device Frames -->
	<xsl:template match="sgr:ModbusDeviceFrame">
		<xsl:call-template name="SGrDeviceType" />
	</xsl:template>
	<xsl:template match="sgr:RestApiDeviceFrame">
		<xsl:call-template name="SGrDeviceType" />
	</xsl:template>
	<xsl:template match="sgr:ContactDeviceFrame">
		<xsl:call-template name="SGrDeviceType" />
	</xsl:template>
	<xsl:template name="SGrDeviceType">
		<div class="documentheader">Product Declaration</div>
		<div class="externalInterface">
			<h1>
				<xsl:value-of select="sgr:manufacturerName" /> - <xsl:value-of
					select="sgr:deviceName" />
			</h1>

			<xsl:apply-templates select="sgr:releaseNotes" />

			<table>
				<colgroup>
					<col style="width:30%" />
				</colgroup>
				<tr>
					<td>Name</td>
					<td>
						<xsl:value-of select="sgr:deviceName" />
					</td>
				</tr>
				<tr>
					<td>Manufacturer</td>
					<td>
						<xsl:value-of select="sgr:manufacturerName" />
					</td>
				</tr>

				<tr>
					<td class="noborder">&#160;</td>
				</tr>

				<xsl:apply-templates select="sgr:deviceInformation" />
				<xsl:apply-templates select="sgr:genericAttributes" />

				<!-- Modbus Device -->
				<xsl:if test="sgr:modbusInterfaceDescription">
					<tr class="transportDetails">
						<td colspan="2" class="noborder">
							<h3>
								<img src="/xsl/modbus.png" alt="Modbus" width="100px" />
							</h3>
						</td>
					</tr>
					<xsl:apply-templates select="sgr:modbusInterfaceDescription" />
					<xsl:apply-templates select="sgr:modbusAttributes" />
					<xsl:apply-templates select="sgr:timeSyncBlockNotification" />
				</xsl:if>

				<!-- Rest Device -->
				<xsl:if test="sgr:restApiInterfaceDescription">
					<tr class="transportDetails">
						<td colspan="2" class="noborder">
							<h3>
								<img src="/xsl/rest.png" alt="Rest" width="100px" />
							</h3>
						</td>
					</tr>
					<xsl:apply-templates select="sgr:restApiInterfaceDescription" />
				</xsl:if>

				<!-- Contact Device -->
				<xsl:if test="sgr:contactInterfaceDescription">
					<tr class="transportDetails">
						<td colspan="2" class="noborder">
							<h3>
								<img src="/xsl/contacts.png" alt="Contacts" width="40px" />
							</h3>
						</td>
					</tr>
					<xsl:apply-templates select="sgr:contactInterfaceDescription" />
				</xsl:if>

			</table>

			<!-- Functiol Profiles -->
			<xsl:apply-templates select="sgr:functionalProfileList/sgr:functionalProfileListElement" />
		</div>
	</xsl:template>

</xsl:stylesheet>