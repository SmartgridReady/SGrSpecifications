<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sgr="http://www.smartgridready.com/ns/V0/">

<!--
    Contains the style sheets for the generic device profile, including
    - sgr:deviceProfile
    - sgr:devNameList
    - sgr:devLegibDesc

	This template renders 2 conlum table rows for the device profile, and thus depends on
	a table element that must be created outside this template

    Depends on named templates:
    - SGrNamelistType
    - SGrLegibDocumentationType

-->

<xsl:import href="SGrDeviceTypeModbus.xsl" />
<xsl:import href="SGrDeviceTypeRestAPI.xsl" />

<xsl:import href="SGrGenericNamelistType.xsl" />
<xsl:import href="SGrGenericLegibDocumentationType.xsl" />

<xsl:template match="sgr:deviceProfile">	

	<!-- devNameList -->
	<xsl:apply-templates select="sgr:devNameList"/>

	<!-- devLegibDesc (4x opt) -->
	<xsl:apply-templates select="sgr:devLegibDesc"/>	

	<!-- Transport Service -->
	<tr class="genericDetails"><td>Transport Service</td><td>
		<xsl:choose>
			<xsl:when test="sgr:transportService='Modbus'"><img src="/xsl/modbus.png" alt="Modbus" height="17px"/></xsl:when>
			<xsl:when test="sgr:transportService='RESTfulJSON'"><img src="/xsl/rest.png" alt="JsonRest" height="17px"/>></xsl:when>
			<xsl:when test="sgr:transportService='Contacts'"><img src="/xsl/contacts.png" alt="Contacts" height="17px"/></xsl:when>
			<xsl:otherwise>
				<!--enumeration value="EEBUS"/>
				<enumeration value="OCPP1.6"/>
				<enumeration value="OCPP2.01"/>
				<enumeration value="WoT"/>
				<enumeration value="proprietary"/>
				<enumeration value="generic"/-->
				<xsl:value-of select="sgr:transportService"/>
			</xsl:otherwise>
		</xsl:choose>		
	</td></tr>
	
	<!-- Device Kind -->
	<tr class="genericDetails"><td>Device Type</td><td><xsl:value-of select="sgr:deviceKind"/></td></tr>
	
	<!-- serialNumber (1x opt)-->
	<xsl:if test="sgr:serialNumber">
		<tr class="genericDetails"><td>Serial No.</td><td><xsl:value-of select="sgr:serialNumber"/></td></tr>
	</xsl:if>

	<!-- softwareRevision -->
	<tr class="genericDetails"><td>Software Rev.</td><td><xsl:apply-templates select="sgr:softwareRevision"/></td></tr>
	
	<!-- hardwareRevision (1x opt)-->
	<xsl:if test="sgr:hardwareRevision">
		<tr class="genericDetails"><td>Hardware Rev.</td><td><xsl:apply-templates select="sgr:hardwareRevision"/></td></tr>
	</xsl:if>

	<!-- brandName -->
	<xsl:if test="sgr:brandName">
		<tr class="genericDetails"><td>Brand</td><td><xsl:value-of select="sgr:brandName"/></td></tr>
	</xsl:if>

	<!-- powerSource (1x opt) -->
	<xsl:if test="sgr:powerSource">
		<tr class="genericDetails"><td>Power Source</td><td><xsl:value-of select="sgr:powerSource"/></td></tr>
	</xsl:if>

	<!-- nominalPower (1x opt) -->
	<xsl:if test="sgr:nominalPower">
		<tr class="genericDetails"><td>Nominal Power</td><td><xsl:value-of select="sgr:nominalPower"/></td></tr>
	</xsl:if>

	<!-- manufSpecIdent (1x opt) -->
	<xsl:if test="sgr:manufSpecIsdent">
		<tr class="genericDetails"><td>Secification ID</td><td><xsl:value-of select="sgr:manufSpecIdent"/></td></tr>
	</xsl:if>

	<!-- manufacturerLabel (1x opt) -->
	<xsl:if test="sgr:manufacturerLabel">
		<tr class="genericDetails"><td>Manufcaturer Label</td><td><xsl:value-of select="sgr:manufacturerLabel"/></td></tr>
	</xsl:if>
	
	<!-- remAuthorID (1x opt) -->
	<xsl:if test="sgr:remAuthorID">
		<tr class="genericDetails"><td>Author Remarks</td><td><xsl:value-of select="sgr:remAuthorID"/></td></tr>
	</xsl:if>
	
	<!-- devLevelofOperation (1x opt) -->
	<xsl:if test="sgr:devLevelofOperation">
		<tr class="genericDetails"><td>SGr Level</td><td><xsl:value-of select="sgr:devLevelofOperation"/></td></tr>
	</xsl:if>
</xsl:template>

<xsl:template match="sgr:devNameList">
	<xsl:call-template name="SGrNamelistType"/>
</xsl:template>

<xsl:template match="sgr:devLegibDesc">
	<tr><xsl:attribute name="lang"><xsl:value-of select="sgr:language"/></xsl:attribute><td colspan="2"><xsl:call-template name="SGrLegibDocumentationType"/></td></tr>	
</xsl:template>


</xsl:stylesheet>