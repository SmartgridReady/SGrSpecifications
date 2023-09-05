<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:sgr="http://www.smartgridready.com/ns/V0/">

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

				<tr><td class="noborder" /></tr>

				<xsl:apply-templates select="sgr:deviceInformation" />
				<xsl:apply-templates select="sgr:genericAttributes" />

				<!-- Modbus Device -->
				<xsl:if test="sgr:modbusInterfaceDescription">
					<xsl:apply-templates select="sgr:modbusInterfaceDescription" />
					<xsl:apply-templates select="sgr:modbusAttributes" />
					<xsl:apply-templates select="sgr:timeSyncBlockNotification" />
				</xsl:if>

				<!-- Rest Device -->
				<xsl:if test="sgr:restApiInterfaceDescription">
					<xsl:apply-templates select="sgr:restApiInterfaceDescription" />
				</xsl:if>

				<!-- Contact Device -->
				<xsl:if test="sgr:contactInterfaceDescription">
					<xsl:apply-templates select="sgr:contactInterfaceDescription" />
				</xsl:if>

			</table>

			<!-- Functiol Profiles -->
			<xsl:apply-templates select="sgr:functionalProfileList" />
		</div>
	</xsl:template>

		<!-- Device information -->
		<xsl:template match="sgr:deviceInformation">

		<xsl:apply-templates select="sgr:alternativeNames" />

		<xsl:apply-templates select="sgr:legibleDescription" />
		<xsl:apply-templates select="sgr:programmerHints" />

		<!-- isLocalControl -->
		<tr class="genericDetails">
			<td>Type</td>
			<td>
				<xsl:choose>
					<xsl:when test="sgr:isLocalControl = 'true'">
						<img src="/xsl/ressources/lan.png" alt="" width="16pt" height="16pt" /> Local area </xsl:when>
					<xsl:otherwise>
						<img src="/xsl/ressources/cloud.png" alt="" width="16pt" height="16pt" /> Cloud device </xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>

		<!-- Transport Service -->
		<!-- Vereinfachen, classes verwenden, zusätzlich z.B. bei Contact noch Text dazu -->
		<tr class="genericDetails">
			<td>Transport Service</td>
			<xsl:choose>
				<xsl:when test="sgr:transportService='Modbus'">
					<td class="modbusattribute" />
				</xsl:when>
				<xsl:when test="sgr:transportService='RESTfulJSON'">
					<td class="restapiattribute">RESTful JSON</td>
				</xsl:when>
				<xsl:when test="sgr:transportService='Contacts'">
					<td class="contactapiattribute" >Contacts</td>
				</xsl:when>
				<xsl:otherwise>
					<!--enumeration
					value="EEBUS"/>
			<enumeration value="OCPP1.6"/>
			<enumeration value="OCPP2.01"/>
			<enumeration value="WoT"/>
			<enumeration value="proprietary"/>
			<enumeration value="generic"/-->
					<td><xsl:value-of select="sgr:transportService" /></td>
				</xsl:otherwise>
			</xsl:choose>
		</tr>

		<!-- Device Kind -->
		<tr class="genericDetails">
			<td>Device Type</td>
			<td>
				<xsl:value-of select="sgr:deviceCategory" />
			</td>
		</tr>

		<!-- softwareRevision -->
		<tr class="genericDetails">
			<td>Software Rev.</td>
			<td>
				<xsl:value-of select="sgr:softwareRevision" />
			</td>
		</tr>

		<!-- hardwareRevision (1x opt)-->
		<xsl:if test="sgr:hardwareRevision">
			<tr class="genericDetails">
				<td>Hardware Rev.</td>
				<td>
					<xsl:value-of select="sgr:hardwareRevision" />
				</td>
			</tr>
		</xsl:if>

		<!-- brandName -->
		<xsl:if test="sgr:brandName">
			<tr class="genericDetails">
				<td>Brand</td>
				<td>
					<xsl:value-of select="sgr:brandName" />
				</td>
			</tr>
		</xsl:if>

		<!-- powerSource (1x opt) -->
		<xsl:if test="sgr:powerSource">
			<tr class="genericDetails">
				<td>Power Source</td>
				<td>
					<xsl:value-of select="sgr:powerSource" />
				</td>
			</tr>
		</xsl:if>

		<!-- nominalPower (1x opt) -->
		<xsl:if test="sgr:nominalPower">
			<tr class="genericDetails">
				<td>Nominal Power</td>
				<td>
					<xsl:value-of select="sgr:nominalPower" />
				</td>
			</tr>
		</xsl:if>

		<!-- manufacturerSpecificationIdentification (1x opt) -->
		<xsl:if test="sgr:manufSpecIsdent">
			<tr class="genericDetails">
				<td>Secification ID</td>
				<td>
					<xsl:value-of select="sgr:manufacturerSpecificationIdentification" />
				</td>
			</tr>
		</xsl:if>

		<!-- manufacturerLabel (1x opt) -->
		<xsl:if test="sgr:manufacturerLabel">
			<tr class="genericDetails">
				<td>Manufcaturer Label</td>
				<td>
					<xsl:value-of select="sgr:manufacturerLabel" />
				</td>
			</tr>
		</xsl:if>

		<!-- generalRemarks (1x opt) -->
		<xsl:if test="sgr:generalRemarks">
			<tr class="genericDetails">
				<td>Author Remarks</td>
				<td>
					<xsl:value-of select="sgr:generalRemarks" />
				</td>
			</tr>
		</xsl:if>

		<!-- levelOfOperation (1x opt) -->
		<xsl:if test="sgr:levelOfOperation">
			<tr class="genericDetails">
				<td>Level</td>
				<td>
					<xsl:value-of select="sgr:levelOfOperation" />
				</td>
			</tr>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>