<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sgr="http://www.smartgridready.com/ns/V0/">

<xsl:template match="/">
	<html>
	<head>
		<style>
		body { font-family: sans-serif; width: 900px; margin-right: auto; margin-left: auto; background-color:lightgray;}
		.document { background-color:white; padding:4em;}
		h1 { font-size: 1.55em; margin-bottom: 1.5em }
		h2 { font-size: 1.44em; margin-bottom: 0.2em; margin-top: 2em; }
		h3 { font-size: 1.0em; margin-bottom: 0.2em; margin-top: 1em; }
		table { border-spacing: 0px; border-collapse: collapse; width:100%; margin-bottom:0.5em;}
		th { padding: 0.5em; text-align:left; border: 1px solid black; }
		td { padding: 0.5em; border: 1px solid black; vertical-align:text-top;}
		body:before{
			content: 'Work in Progress';
			top: -30%;
			bottom: 0;
			left: 0;
			right: 0;
						
			color: #0d745e;
			font-size: 60px;
			font-weight: 500px;
			display: grid;
			justify-content: center;
			align-content: center;
			opacity: 0.1;
			transform: rotate(0deg);
		  }
		</style>
	</head>
	<body>
		<div class="document">
			<div class="profileheader">
				<div style="display:inline-block">
					<img src="https://smartgridready.ch/media/images/Logos/SGR_LOGO_REDESIGN_RGB.svg" width="240" height="134" />
				</div>
				<div style="display:inline-block; text-align:right; width:100%">Device Profil</div>
			</div>
			
			<h2><xsl:value-of select="/*/@manufacturerName"/> - <xsl:value-of select="/*/@deviceName"/></h2>
			<table>
				<colgroup>
					<col style="width:25%"/>
				</colgroup>	
				<tr><td>Name</td><td><xsl:value-of select="/*/@deviceName"/></td></tr>
				<tr><td>Manufacturer</td><td><xsl:value-of select="/*/@manufacturerName"/></td></tr>
				<tr><td>Manufacturer ID</td><td><xsl:value-of select="/*/@manufacturerID"/></td></tr>
				<tr><td>Local / Cloud</td><td><xsl:value-of select="/*/@isLocalControl"/></td></tr>
			</table>

			<xsl:for-each select="*/sgr:deviceProfile">
				<!-- devNameList -->
				<xsl:apply-templates select="sgr:devNameList"/>
			
				<!-- devLegibDesc (4x opt) -->
				<table>
					<xsl:apply-templates select="sgr:devLegibDesc"/>	
				</table>

				<table style="width:100%">
					<colgroup>
						<col style="width:20%"/>
					</colgroup>

					<!-- Transport Service -->
					<tr><td>Transport Service</td><td><xsl:value-of select="sgr:transportService"/></td></tr>
					
					<!-- Device Kind -->
					<tr><td>Device Typ</td><td><xsl:value-of select="sgr:deviceKind"/></td></tr>
					
					<!-- serialNumber (1x opt)-->
					<xsl:if test="sgr:serialNumber">
						<tr><td>Serial No.</td><td><xsl:value-of select="sgr:serialNumber"/></td></tr>
					</xsl:if>

					<!-- softwareRevision -->
					<tr><td>Software Rev.</td><td><xsl:apply-templates select="sgr:softwareRevision"/></td></tr>
					
					<!-- hardwareRevision (1x opt)-->
					<xsl:if test="sgr:hardwareRevision">
						<tr><td>Hardware Rev.</td><td><xsl:apply-templates select="sgr:hardwareRevision"/></td></tr>
					</xsl:if>

					<!-- brandName -->
					<xsl:if test="sgr:brandName">
						<tr><td>Brand</td><td><xsl:value-of select="sgr:brandName"/></td></tr>
					</xsl:if>

					<!-- powerSource (1x opt) -->
					<xsl:if test="sgr:powerSource">
						<tr><td>Power Source</td><td><xsl:value-of select="sgr:powerSource"/></td></tr>
					</xsl:if>

					<!-- nominalPower (1x opt) -->
					<xsl:if test="sgr:nominalPower">
						<tr><td>Nominal Power</td><td><xsl:value-of select="sgr:nominalPower"/></td></tr>
					</xsl:if>

					<!-- manufSpecIdent (1x opt) -->
					<xsl:if test="sgr:manufSpecIdent">
						<tr><td>Secification ID</td><td><xsl:value-of select="sgr:manufSpecIdent"/></td></tr>
					</xsl:if>

					<!-- manufacturerLabel (1x opt) -->
					<xsl:if test="sgr:manufacturerLabel">
						<tr><td>Manufcaturer Label</td><td><xsl:value-of select="sgr:manufacturerLabel"/></td></tr>
					</xsl:if>
					
					<!-- remAuthorID (1x opt) -->
					<xsl:if test="sgr:remAuthorID">
						<tr><td>Author Remarks</td><td><xsl:value-of select="sgr:remAuthorID"/></td></tr>
					</xsl:if>
					
					<!-- devLevelofOperation (1x opt) -->
					<xsl:if test="sgr:devLevelofOperation">
						<tr><td>SGr Level</td><td><xsl:value-of select="sgr:devLevelofOperation"/></td></tr>
					</xsl:if>
				</table>
			</xsl:for-each>

			<!-- Functiol Profiles -->
			<xsl:for-each select="*/sgr:fpListElement">
				<xsl:apply-templates select="sgr:functionalProfile"/>
			</xsl:for-each>
		</div>
	</body>
	</html>
</xsl:template>

<!-- SGrVersionNumberType -->
<xsl:template match="sgr:softwareRevision">
	<xsl:call-template name="SGrVersionNumberType"/>
</xsl:template>
<xsl:template match="sgr:hardwareRevision">
	<xsl:call-template name="SGrVersionNumberType"/>
</xsl:template>
<xsl:template match="sgr:versionNumber">
	<xsl:call-template name="SGrVersionNumberType"/>
</xsl:template>
<xsl:template name="SGrVersionNumberType">
	<xsl:value-of select="sgr:primaryVersionNumber"/>.<xsl:value-of select="sgr:secondaryVersionNumber"/>.<xsl:value-of select="sgr:subReleaseVersionNumber"/>
</xsl:template>


<!-- SGrNamelistType-->
<xsl:template match="sgr:devNameList">
	<xsl:call-template name="SGrNamelistType"/>
</xsl:template>
<xsl:template match="sgr:fpNameList">
	<xsl:call-template name="SGrNamelistType"/>
</xsl:template>
<xsl:template name="SGrNamelistType">
	<h3><xsl:value-of select="sgr:nameType"/> Ontology</h3>
	<table>
		<colgroup>
			<col style="width:25%"/>
		</colgroup>	
		
		<xsl:if test="sgr:sLV1Name">
		<tr><td>SGr label V1 (legacy)</td><td><xsl:value-of select="sgr:sLV1Name"/></td></tr>
		</xsl:if>
		
		<xsl:if test="sgr:sWorkName">
		<tr><td>Temporary Work Name</td><td><xsl:value-of select="sgr:sWorkName"/></td></tr>
		</xsl:if>
		
		<xsl:if test="sgr:sManufName">
		<tr><td>Manufacturer</td><td><xsl:value-of select="sgr:sManufName"/></td></tr>
		</xsl:if>

		<xsl:if test="sgr:sIEC61850Name">
		<tr><td>IEC 61850 Name </td><td><xsl:value-of select="sgr:sIEC61850Name"/></td></tr>
		</xsl:if>

		<xsl:if test="sgr:sSAREFName">
		<tr><td>SAREF Name</td><td><xsl:value-of select="sgr:sSAREFName"/></td></tr>
		</xsl:if>

		<xsl:if test="sgr:sEEBUSName">
		<tr><td>EEBUS Name</td><td><xsl:value-of select="sgr:sEEBUSName"/></td></tr>
		</xsl:if>
		
		<xsl:if test="sgr:sHPbwpName">
		<tr><td>bwp HP Name</td><td><xsl:value-of select="sgr:sHPbwpName"/></td></tr>
		</xsl:if>
	</table>
</xsl:template>

<!-- SGrLegibDocumentationType -->
<xsl:template match="sgr:devLegibDesc">
	<xsl:call-template name="SGrLegibDocumentationType"/>
</xsl:template>
<xsl:template match="sgr:fpLegibDesc">
	<xsl:call-template name="SGrLegibDocumentationType"/>
</xsl:template>
<xsl:template name="SGrLegibDocumentationType">
	<tr><td>
		<img width="20px" height="14px"><xsl:attribute name="src">xsl/<xsl:value-of select="sgr:language"/>.png</xsl:attribute></img>
		&#160;<xsl:value-of select="sgr:textElement"/>&#160;
		<a><xsl:attribute name="href"><xsl:value-of select="sgr:uri"/></xsl:attribute><img alt="Link.." src="xsl/link.png" width="16pt" height="16pt" /></a>
	</td></tr>
</xsl:template>

<!-- Function Profile-->
<xsl:template match="sgr:functionalProfile">
	<h2><xsl:value-of select="@profileName"/> (<xsl:value-of select="@mroVisibilityIndicator"/>)</h2>

	<table>
		<colgroup>
			<col style="width:20%"/>
		</colgroup>	
		<xsl:for-each select="sgr:profileNumber">
			<tr><td>Profil-ID</td><td><xsl:value-of select="sgr:specsOwnerId"/> - <xsl:value-of select="sgr:profileIdentification"/> - <xsl:value-of select="sgr:subProfileIdent"/></td></tr>
			<tr><td>Level</td><td><xsl:value-of select="sgr:sgrLevelOfOperation"/></td></tr>
			<tr><td>Version</td><td><xsl:apply-templates select="sgr:versionNumber"/></td></tr>
		</xsl:for-each>
	</table>

		<!-- fpNameList -->
	<xsl:apply-templates select="sgr:fpNameList"/>

	<!--xsl:apply-templates select="sgr:fpNameList"/-->
	
	<!-- fpLegibDesc (4x opt) -->
	<table>
		<xsl:apply-templates select="sgr:fpLegibDesc"/>	
	</table>

		
	<table>
	<colgroup>
	<col style="width:10%"/>
	<col style="width:20%"/>
	<col style="width:20%"/>
	<col style="width:10%"/>
	<col style="width:20%"/>
	<col style="width:10%"/>
	<col style="width:10%"/>
	</colgroup>			
	<tr>
	<td  colspan="7">eque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...</td>
	</tr>
	<tr>
	<th>Ind./attr.</th>
	<th>Datenpunkt</th>
	<th>Beschreibung</th>
	<th>Typ</th>
	<th>Einh.</th>
	<th>MRO</th>
	<th>RWP</th>
	</tr>
	<xsl:for-each select="*[local-name()='dpListElement']">
	<tr>
	<td>(t.b.d)</td>
	<td><xsl:value-of select="*[local-name()='dataPoint']/@datapointName"/></td>
	<td>(t.b.d)</td>
	<td>(t.b.d)</td>
	<td><xsl:value-of select="*[local-name()='dataPoint']/@unit"/></td>
	<td><xsl:value-of select="*[local-name()='dataPoint']/@mroVisibilityIndicator"/></td>
	<td><xsl:value-of select="*[local-name()='dataPoint']/@rwpDatadirection"/></td>
	</tr>
	</xsl:for-each>
	</table>
</xsl:template>

</xsl:stylesheet>

