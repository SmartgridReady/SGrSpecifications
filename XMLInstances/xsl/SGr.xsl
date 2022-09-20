<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sgr="http://www.smartgridready.com/ns/V0/">

<xsl:output method="html" version="4.0" encoding="UTF-8" indent="yes"/>

<xsl:include href="SGrDeviceProfile.xsl" />
<xsl:include href="SGrFunctionProfile.xsl" />
<xsl:include href="SGrDataPoint.xsl" />

<xsl:template match="/">
	<html lang="any">
	<head>
		<title>SGr EI <xsl:value-of select="/*/@manufacturerName"/> - <xsl:value-of select="/*/@deviceName"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<style>
		* {	box-sizing: border-box; }
		body { font-family: sans-serif; width: 900px; margin-top: 1em; margin-right: auto; margin-left: auto; background-color:lightgray;}
		.document { background-color:white; padding-left:4em; padding-right:4em; padding-top:3em; padding-bottom:1em;}
		h1 { font-size: 1.55em; margin-bottom: 1.5em }
		h2 { font-size: 1.44em; margin-bottom: 0.2em; margin-top: 2em; }
		h3 { font-size: 1.0em; margin-bottom: 0.2em; margin-top: 1em; }
		table { border-spacing: 0px; border-collapse: collapse; width:100%; margin-bottom:0.0em;}
		th { padding: 0.5em; text-align:left; border: 1px solid black; }
		td { padding: 0.5em; border: 1px solid black; vertical-align:text-top;}
		td.noborder { border: none; }
		div.navigation {
			padding:0.5em;
			position:fixed;
			top:10px;
			left:10px;
			background-color:darkgrey;
		}
		div.navigation > div { padding: 0.1em; }
		@media print {
			div.navigation { display: none; }
		}
		body.en :lang(de) { display: none; }
		body.en :lang(fr) { display: none; }
		body.en :lang(it) { display: none; }
		body.de :lang(en) { display: none; }
		body.de :lang(fr) { display: none; }
		body.de :lang(it) { display: none; }
		body.fr :lang(en) { display: none; }
		body.fr :lang(de) { display: none; }
		body.fr :lang(it) { display: none; }
		body.it :lang(en) { display: none; }
		body.it :lang(de) { display: none; }
		body.it :lang(fr) { display: none; }
		body.none :lang(en) { display: none; }
		body.none :lang(de) { display: none; }
		body.none :lang(fr) { display: none; }
		body.none :lang(it) { display: none; }
		.profileheader { }
		.profilefooter { margin-top:6em; border-top: 1px solid black; padding-top:0.3em;font-size:0.9em; }
		.externalInterface { }
		.genericDetails {}
		.ontologyDetails {} 
		.functionalProfile { }
		.dataPoint { margin-top: 2em;}
		.dataPointDetails { }
		</style>
	</head>
	<body class="any">
		<script type="text/javascript">
			function toggleClass(className) {
				const collection = document.getElementsByClassName(className);
				for (let i = 0; i &lt; collection.length; i++) {
				  collection[i].style.display == "none" ? collection[i].style.display = "block" : collection[i].style.display = "none";
				}
			}
			function toggleClassRow(className) {
				const collection = document.getElementsByClassName(className);
				for (let i = 0; i &lt; collection.length; i++) {
				  collection[i].style.display == "none" ? collection[i].style.display = "table-row" : collection[i].style.display = "none";
				}
			}
		</script>
		<div class="navigation">
			<h2>Details</h2>
			<div><input type="checkbox" onclick="toggleClassRow('dataPointDetails')" name="showDPDetails" value="1" checked="checked"/>Data Points</div>
			<div><input type="checkbox" onclick="toggleClassRow('genericDetails')" name="showDPDetails" value="1" checked="checked"/>Generic Info</div>
			<div><input type="checkbox" onclick="toggleClassRow('ontologyDetails')" name="showDPDetails" value="1" checked="checked"/>Ontology</div>
			<div><input type="checkbox" onclick="toggleClassRow('transportDetails')" name="showDPDetails" value="1" checked="checked"/>Transport Layer</div>
			<div>
				<select name="language" id="language" title="Language" onchange="document.body.className = this.value">
					<option value="any">All Languages</option>
					<option value="en">English</option>
					<option value="de">Deutsch</option>
					<option value="fr">Francais</option>
					<option value="it">Italiano</option>
					<option value="none">(none)</option>
				</select>
			</div>
		</div>
		<div class="document">
			<div class="profileheader" style="height: 134px; margin-bottom:2em">
				<div style="float:left; width:50%">
					<img src="https://smartgridready.ch/media/images/Logos/SGR_LOGO_REDESIGN_RGB.svg" alt="SGr" width="240px" height="134px" />
				</div>
				<div style="float:left; width:50%; text-align:right; height: 134px">
					<xsl:choose>
						<xsl:when test="/sgr:SGrFunctionalProfileDescriptionType">Definition Functional Profile</xsl:when>
						<xsl:otherwise>Device Profile</xsl:otherwise>
					</xsl:choose>
				</div>
			</div>
			<p> </p>

			<!-- Device Types -->
			<xsl:apply-templates select="sgr:SGrModbusDeviceDescriptionType"/>
			<xsl:apply-templates select="sgr:SGrRESTAPIDeviceDescriptionType"/>
			<xsl:apply-templates select="sgr:SGrContactAPIDeviceDescriptionType"/>

			<!-- generic functional Profiles -->
			<xsl:apply-templates select="/sgr:SGrFunctionalProfileDescriptionType"/>

			<!-- Functiol Profiles -->
			<xsl:apply-templates select="*/sgr:fpListElement"/>

			<!-- Footer-->
			<div class="profilefooter">
				Konzept und Spezifikation Funktionsprofile siehe separates Dokument "Funktionsprofile_Spezifikation_vx.x.pdf"
				Informationen und Support unter www.smartgridready.ch, deklaration@smartgridready.ch
			</div>
		</div>
	</body>
	</html>
</xsl:template>

<!-- Device Profiles -->
<xsl:template match="sgr:SGrModbusDeviceDescriptionType">
	<xsl:call-template name="SGrDeviceType"/>
</xsl:template>
<xsl:template match="sgr:SGrRESTAPIDeviceDescriptionType">
	<xsl:call-template name="SGrDeviceType"/>
</xsl:template>
<xsl:template match="sgr:SGrContactAPIDeviceDescriptionType">
	<xsl:call-template name="SGrDeviceType"/>
</xsl:template>
<xsl:template name="SGrDeviceType">
	<div class="externalInterface">
		<h1><xsl:value-of select="@manufacturerName"/> - <xsl:value-of select="@deviceName"/></h1>

		<table>
			<colgroup>
				<col style="width:30%"/>
			</colgroup>	
			<tr><td>Name</td><td><xsl:value-of select="@deviceName"/></td></tr>
			<tr><td>Manufacturer</td><td><xsl:value-of select="@manufacturerName"/></td></tr>
			<tr><td>Manufacturer ID</td><td><xsl:value-of select="@manufacturerID"/></td></tr>
			<tr>
				<td>Type</td>
				<td>
					<xsl:choose>
						<xsl:when test="@isLocalControl = 'true'"><img src="/xsl/lan.png" alt="" width="16pt" height="16pt" /> Local area</xsl:when>
						<xsl:otherwise><img src="/xsl/cloud.png" alt="" width="16pt" height="16pt" /> Cloud device</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>

			<tr><td class="noborder">&#160;</td></tr>
		
			<!-- Device Profile (nameList, legibDesc-->
			<xsl:apply-templates select="sgr:deviceProfile"/>

			<!-- Generic Attributes -->
			<xsl:apply-templates select="*/sgr:genAttribute"/>
			
			<!-- Modbus Device -->
			<xsl:if test="sgr:modbusInterfaceDesc">
				<tr class="transportDetails"><td colspan="2" class="noborder"><h3><img src="/xsl/modbus.png" alt="Modbus" width="100px"/></h3></td></tr>
				<xsl:apply-templates select="sgr:modbusInterfaceDesc"/>
				<xsl:apply-templates select="sgr:modbusAttr"/>
			</xsl:if>

			<!-- Rest Device -->
			<xsl:if test="sgr:restAPIInterfaceDesc">
				<tr class="transportDetails"><td colspan="2" class="noborder"><h3><img src="/xsl/rest.png" alt="Rest" width="100px"/></h3></td></tr>
				<xsl:apply-templates select="sgr:restAPIInterfaceDesc"/>
				<xsl:apply-templates select="sgr:restAPIAttr"/>
			</xsl:if>
			
			<!-- Contact Device -->
			<xsl:if test="sgr:contactApiInterfaceDesc">
				<tr class="transportDetails"><td colspan="2" class="noborder"><h3><img src="/xsl/contacts.png" alt="Contacts" width="40px"/></h3></td></tr>
				<xsl:apply-templates select="sgr:contactApiInterfaceDesc"/>
			</xsl:if>			

		</table>

		<xsl:apply-templates select="sgr:networkConnectionState"/>
	</div>
</xsl:template>

<!-- Generic Functional Profiles -->
<xsl:template match="sgr:SGrFunctionalProfileDescriptionType">
	<div class="functionalProfile">
		<h2 style="float:left;"><xsl:value-of select="sgr:functionalProfile/@profileName"/></h2>

		<xsl:apply-templates select="sgr:releaseNotes" />
	
		
		<h2>Functional Profile</h2>

		<!-- Functional Profile Block -->
		<table>
			<colgroup>
				<col style="width:30%"/>
			</colgroup>	
			
			<xsl:apply-templates select="sgr:functionalProfile"/>

			<!-- Generic Attributes -->
			<xsl:apply-templates select="sgr:genAttribute"/>

		</table>

		<!-- Data Points -->
        <div class="dataPoint">
            <table>
                <colgroup>
                    <col style="width:5%"/>
                    <col style="width:25%"/>
                    <col style="width:35%"/>
                    <col style="width:15%"/>
                    <col style="width:10%"/>
                    <col style="width:10%"/>
                </colgroup>			
                <tr>
                    <th colspan="2">Datapoint</th>
                    <th>Unit</th>
                    <th>Type</th>
                    <th>MRO</th>
                    <th>RWP</th>
                </tr>
                <xsl:apply-templates select="sgr:dpListElement"/>
            </table>
        </div>

		<!--xsl:call-template name="sgrFunctionProfile"/-->
	</div>
</xsl:template>

<!-- SGrReleaseNotes -->
<xsl:template match="sgr:releaseNotes">
	<table>
		<colgroup>
			<col style="width:5%"/>
			<col style="width:25%"/>
			<col style="width:20%"/>
			<col style="width:20%"/>
			<col style="width:30%"/>
		</colgroup>	
		<tr><td colspan="2">State</td><td colspan="3"><xsl:value-of select="sgr:state"/></td></tr>
		<tr>
			<td class="noborder"></td>
			<th>Version</th>
			<th>Date</th>
			<th>Author</th>
			<th>Comment</th>
		</tr>
		<xsl:for-each select="sgr:changelog">
			<tr>
				<td class="noborder"></td>
				<td><xsl:value-of select="sgr:version"/></td>
				<td><xsl:value-of select="sgr:date"/></td>
				<td><xsl:value-of select="sgr:author"/></td>
				<td><xsl:value-of select="sgr:comment"/></td>
			</tr>
		</xsl:for-each>
	</table>
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
<xsl:template name="SGrNamelistType">
	<xsl:if test="sgr:sLV1Name">
	<tr class="ontologyDetails"><td>SGr label V1 (legacy)</td><td><xsl:value-of select="sgr:sLV1Name"/></td></tr>
	</xsl:if>
	
	<xsl:if test="sgr:sWorkName">
	<tr class="ontologyDetails"><td>Temporary Work Name</td><td><xsl:value-of select="sgr:sWorkName"/></td></tr>
	</xsl:if>
	
	<xsl:if test="sgr:sManufName">
	<tr class="ontologyDetails"><td>Manufacturer</td><td><xsl:value-of select="sgr:sManufName"/></td></tr>
	</xsl:if>

	<xsl:if test="sgr:sIEC61850Name">
	<tr class="ontologyDetails"><td>IEC 61850 Name </td><td><xsl:value-of select="sgr:sIEC61850Name"/></td></tr>
	</xsl:if>

	<xsl:if test="sgr:sSAREFName">
	<tr class="ontologyDetails"><td>SAREF Name</td><td><xsl:value-of select="sgr:sSAREFName"/></td></tr>
	</xsl:if>

	<xsl:if test="sgr:sEEBUSName">
	<tr class="ontologyDetails"><td>EEBUS Name</td><td><xsl:value-of select="sgr:sEEBUSName"/></td></tr>
	</xsl:if>
	
	<xsl:if test="sgr:sHPbwpName">
	<tr class="ontologyDetails"><td>bwp HP Name</td><td><xsl:value-of select="sgr:sHPbwpName"/></td></tr>
	</xsl:if>
</xsl:template>

<!-- SGrLegibDocumentationType -->
<xsl:template name="SGrLegibDocumentationType">
	<img width="20px" height="14px"><xsl:attribute name="src" alt="Lang" >/xsl/<xsl:value-of select="sgr:language"/>.png</xsl:attribute></img>
	&#160;<xsl:value-of select="sgr:textElement"/>&#160;
	<a target="_blank"><xsl:attribute name="href"><xsl:value-of select="sgr:uri"/></xsl:attribute><img src="/xsl/link.png" alt="Link.." width="16pt" height="16pt" /></a>
</xsl:template>

<!-- modbusInterfaceDesc -->
<xsl:template match="sgr:modbusInterfaceDesc">
	<tr class="genericDetails"><td>Interface Type</td><td><xsl:value-of select="sgr:modbusInterfaceSelection"/></td></tr>

	<!-- trspSrvModbusTCPoutOfBox (1x opt) -->
	<xsl:if test="sgr:trspSrvModbusTCPoutOfBox">
		<tr class="transportDetails"><td>TCP</td><td>
			<xsl:call-template name="join">
				<xsl:with-param name="valueList" select="sgr:trspSrvModbusTCPoutOfBox/sgr:address/*"/>
				<xsl:with-param name="separator" select="'.'"/>
			</xsl:call-template>
			: <xsl:value-of select="sgr:trspSrvModbusTCPoutOfBox/sgr:port"/>
			- SlaveID <xsl:value-of select="sgr:trspSrvModbusTCPoutOfBox/sgr:slaveID"/>
			</td>
		</tr>
	</xsl:if>

	<!-- trspSrvModbusRTUoutOfBox (1x opt) -->
	<xsl:if test="sgr:trspSrvModbusRTUoutOfBox">
		<tr class="transportDetails"><td>RTU</td><td>
			Slave Adress: <xsl:value-of select="sgr:trspSrvModbusRTUoutOfBox/sgr:slaveAddr"/><br/>
			
			Baud Rate: <xsl:value-of select="sgr:trspSrvModbusRTUoutOfBox/sgr:baudRateSelected"/><br/>
			Data Bits: <xsl:value-of select="sgr:trspSrvModbusRTUoutOfBox/sgr:byteLenSelected"/><br/>
			Parity: <xsl:value-of select="sgr:trspSrvModbusRTUoutOfBox/sgr:paritySelected"/><br/>
			Stop Bit: <xsl:value-of select="sgr:trspSrvModbusRTUoutOfBox/sgr:stopBitLenSelected"/><br/>

			<h3>Capabilities</h3>
			Baud Rate:
			<xsl:call-template name="join">
				<xsl:with-param name="valueList" select="sgr:trspSrvModbusRTUoutOfBox/sgr:serialInterfaceCapability/sgr:baudRatesSupported"/>
				<xsl:with-param name="separator" select="','"/>
			</xsl:call-template><br/>
			Data Bits:
			<xsl:call-template name="join">
				<xsl:with-param name="valueList" select="sgr:trspSrvModbusRTUoutOfBox/sgr:serialInterfaceCapability/sgr:byteLenSupported"/>
				<xsl:with-param name="separator" select="','"/>
			</xsl:call-template><br/>
			Parity:
			<xsl:call-template name="join">
				<xsl:with-param name="valueList" select="sgr:trspSrvModbusRTUoutOfBox/sgr:serialInterfaceCapability/sgr:paritySupported"/>
				<xsl:with-param name="separator" select="','"/>
			</xsl:call-template><br/>
			Stop Bit:
			<xsl:call-template name="join">
				<xsl:with-param name="valueList" select="sgr:trspSrvModbusRTUoutOfBox/sgr:serialInterfaceCapability/sgr:stopBitLenSupported"/>
				<xsl:with-param name="separator" select="','"/>
			</xsl:call-template><br/>
			</td>
		</tr>
	</xsl:if>

	<!-- firstRegisterAddressIsOne -->
	<tr class="transportDetails">
		<td>First Register Address</td>
		<td>
			<xsl:choose>
				<xsl:when test="sgr:firstRegisterAddressIsOne='true'">1 </xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</td>
	</tr>

	<!-- conversionScheme -->
	<tr class="transportDetails"><td>Conversion Scheme</td><td>
		<xsl:call-template name="join">
			<xsl:with-param name="valueList" select="sgr:conversionScheme"/>
			<xsl:with-param name="separator" select="', '"/>
		</xsl:call-template>
	</td></tr>
</xsl:template>

<!-- restAPIInterfaceDesc -->
<xsl:template match="sgr:restAPIInterfaceDesc">
	<tr class="transportDetails"><td>Interface Type</td><td><xsl:value-of select="sgr:restAPIInterfaceSelection"/></td></tr>

	<!-- trspSrvRestTCPV4outOfBox (1x opt )-->
	<xsl:if test="sgr:trspSrvRestTCPV4outOfBox">
		<tr class="transportDetails">
			<td>TCP/IP v4 Adress</td>
			<td><xsl:value-of select="sgr:trspSrvRestTCPV4outOfBox/sgr:ipV4n1"/>.<xsl:value-of select="sgr:trspSrvRestTCPV4outOfBox/sgr:ipV4n2"/>.<xsl:value-of select="sgr:trspSrvRestTCPV4outOfBox/sgr:ipV4n3"/>.<xsl:value-of select="sgr:trspSrvRestTCPV4outOfBox/sgr:ipV4n4"/>:<xsl:value-of select="sgr:trspSrvRestTCPV4outOfBox/sgr:ipV4portNr"/></td>
		</tr>
	</xsl:if>
	
	<!-- trspSrvRestTCPV6outOfBox (1x opt )-->
	<xsl:if test="sgr:trspSrvRestTCPV6outOfBox">
		<tr class="transportDetails"><td>TCP/IP v6 Adress</td><td><xsl:value-of select="sgr:trspSrvRestTCPV6outOfBox/sgr:prelimStringDef"/></td></tr>
	</xsl:if>

	<!-- trspSrvRestURIoutOfBox (1x opt )-->
	<xsl:if test="sgr:trspSrvRestURIoutOfBox">
		<tr class="transportDetails"><td>TCP/IP URI</td><td><xsl:value-of select="sgr:trspSrvRestURIoutOfBox"/></td></tr>
	</xsl:if>

	<tr class="transportDetails"><td>Authentication Method</td><td><xsl:value-of select="sgr:restAPIAuthenticationMethod"/></td></tr>


	<!-- restAPIBearer (1x opt )-->
	<xsl:if test="sgr:restAPIBearer">
		<tr class="transportDetails">
			<td>Bearer Security</td>
			<td>
				End Point: <xsl:value-of select="sgr:restAPIBearer/sgr:restAPIEndPoint"/><br/>
				JMES Path: <xsl:value-of select="sgr:restAPIBearer/sgr:restAPIJMESPath"/>
			</td>
		</tr>
	</xsl:if>

	<!-- restAPIBasic (1x opt )-->
	<xsl:if test="sgr:restAPIBasic">
		<tr class="transportDetails">
			<td>Basic Security</td>
			<td>
				Username: <xsl:value-of select="sgr:restAPIBasic/sgr:restBasicUsername"/><br/>
				Password: <xsl:value-of select="sgr:restAPIBasic/sgr:restBasicPassword"/>
			</td>
		</tr>
	</xsl:if>
</xsl:template>

<!-- contactApiInterfaceDesc -->
<xsl:template match="sgr:contactApiInterfaceDesc">
	<tr class="transportDetails"><td>Number of Contacts</td><td><xsl:value-of select="sgr:numContacts"/></td></tr>
	<tr class="transportDetails"><td>Contact Stabilization Time</td><td><xsl:value-of select="sgr:contactStabilisationTimeMs"/> ms</td></tr>
</xsl:template>

<xsl:template match="sgr:networkConnectionState">
	<h3>Network Connection State</h3>
	<table>
		<colgroup>
			<col style="width:30%"/>
		</colgroup>	
		<tr class="transportDetails"><td>Connected</td><td><xsl:value-of select="sgr:isConnected"/></td></tr>
		<tr class="transportDetails"><td>Next Attempt</td><td><xsl:value-of select="sgr:nextAttempt"/></td></tr>
	</table>
</xsl:template>

<xsl:template match="sgr:basicDataType">
	<xsl:call-template name="SGrBasicGenDataPointTypeType" />
</xsl:template>

<xsl:template match="sgr:basicArrayDataType">
	<xsl:value-of select="sgr:lenght"/>x
	<xsl:for-each select="sgr:type">
		<xsl:call-template name="SGrBasicGenDataPointTypeType"/>
	</xsl:for-each>
</xsl:template>


<xsl:template match="sgr:modbusDataType">
	<xsl:call-template name="SGrBasicGenDataPointTypeType"/>
</xsl:template>
<xsl:template match="sgr:modbusArrayDataType">
	<xsl:call-template name="SGrBasicGenDataPointTypeType"/>
</xsl:template>

<!-- Attributes generic -->
<xsl:template match="sgr:genAttribute">
	<xsl:call-template name="SGrAttr4GenericType"/>
</xsl:template>
<xsl:template match="sgr:dpAttr4Generic">
	<xsl:call-template name="SGrAttr4GenericType"/>
</xsl:template>
<xsl:template name="SGrAttr4GenericType">
	<!--maxVal-->
	<xsl:if test="sgr:maxVal">
		<tr class="genericDetails"><td><img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" /> Upper Range Limit</td><td><xsl:value-of select="sgr:maxVal"/></td></tr>
	</xsl:if>	

	<!--minVal-->
	<xsl:if test="sgr:minVal">
		<tr class="genericDetails"><td><img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" /> Lower Range Limit</td><td><xsl:value-of select="sgr:minVal"/></td></tr>
	</xsl:if>	

	<!--specQualityRequirement-->
	<xsl:if test="sgr:specQualityRequirement">
		<tr class="genericDetails"><td><img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" /> Quality Requirements</td><td><xsl:value-of select="sgr:specQualityRequirement"/></td></tr>
	</xsl:if>	

	<!--precision-->
	<xsl:if test="sgr:precision">
		<tr class="genericDetails"><td><img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" /> Precision</td><td><xsl:value-of select="sgr:precision"/>%</td></tr>
	</xsl:if>

	<!--stabilityFallback-->
	<xsl:if test="sgr:stabilityFallback">
		<tr class="genericDetails"><td><img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" /> Stability Fallback</td><td>
			Max recieve time: <xsl:value-of select="sgr:stabilityFallback/sgr:maxReceiveTime"/><br/>
			Init Value: <xsl:value-of select="sgr:stabilityFallback/sgr:initValue"/><br/>
			Fallback Value: <xsl:value-of select="sgr:stabilityFallback/sgr:fallbackValue"/><br/>
		</td></tr>
	</xsl:if>

	<!--smoothTransition-->
	<xsl:if test="sgr:smoothTransition">
		<tr class="genericDetails"><td><img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" /> Stability Fallback</td><td>
			<xsl:if test="sgr:smoothTransition/sgr:winTms">
				Window: <xsl:value-of select="sgr:smoothTransition/sgr:winTms"/> ms&#160;
			</xsl:if>
			<xsl:if test="sgr:smoothTransition/sgr:rvrtTms">
				rvrt: <xsl:value-of select="sgr:smoothTransition/sgr:rvrtTms"/> ms&#160;
			</xsl:if>
			<xsl:if test="sgr:smoothTransition/sgr:rmpTms">
				rmp: <xsl:value-of select="sgr:smoothTransition/sgr:rmpTms"/> ms&#160;
			</xsl:if>
		</td></tr>
	</xsl:if>

	<!--minSendDelta-->
	<xsl:if test="sgr:minSendDelta">
		<tr class="genericDetails"><td><img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" /> Min. Delta for Notification</td><td><xsl:value-of select="sgr:minSendDelta"/></td></tr>
	</xsl:if>

	<!--maxSendTime-->
	<xsl:if test="sgr:maxSendTime">
		<tr class="genericDetails"><td><img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" /> Max. Time between Notification</td><td><xsl:value-of select="sgr:maxSendTime"/></td></tr>
	</xsl:if>

	<!--maxReceiveTime-->
	<xsl:if test="sgr:maxReceiveTime">
		<tr class="genericDetails"><td><img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" /> Max. Recieve Time</td><td><xsl:value-of select="sgr:maxReceiveTime"/></td></tr>
	</xsl:if>

	<!--minSendTime-->
	<xsl:if test="sgr:minSendTime">
		<tr class="genericDetails"><td><img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" /> Min. Time between Notification</td><td><xsl:value-of select="sgr:minSendTime"/></td></tr>
	</xsl:if>

	<!--maxLatencyTime-->
	<xsl:if test="sgr:maxLatencyTime">
		<tr class="genericDetails"><td><img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" /> Max. Latency</td><td><xsl:value-of select="sgr:maxLatencyTime"/></td></tr>
	</xsl:if>

	<!--timeStampLog-->
	<xsl:if test="sgr:timeStampLog">
		<tr class="genericDetails"><td><img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" /> Time Stamp Log</td><td><xsl:value-of select="sgr:timeStampLog"/></td></tr>
	</xsl:if>
		
	<!--timeRange-->
	<xsl:if test="sgr:timeRange">
		<tr class="genericDetails"><td><img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" /> Time Range</td><td><xsl:value-of select="sgr:timeRange/sgr:startTime"/> - <xsl:value-of select="sgr:timeRange/sgr:endTime"/></td></tr>
	</xsl:if>

	<!--valueState-->
	<xsl:if test="sgr:valueState">
		<tr class="genericDetails"><td><img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" /> Value Statue</td><td><xsl:value-of select="sgr:valueState"/></td></tr>
	</xsl:if>

	<!--valueTendency-->
	<xsl:if test="sgr:valueTendency">
		<tr class="genericDetails"><td><img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" /> Value Tendency</td><td><xsl:value-of select="sgr:valueTendency"/></td></tr>
	</xsl:if>

	<!--valueSource-->
	<xsl:if test="sgr:valueSource">
		<tr class="genericDetails"><td><img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" /> Value Source</td><td><xsl:value-of select="sgr:valueSource"/></td></tr>
	</xsl:if>

	<!--sampleRate-->
	<xsl:if test="sgr:sampleRate">
		<tr class="genericDetails"><td><img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" /> Sample Rate</td><td><xsl:value-of select="sgr:sampleRate"/> ms</td></tr>
	</xsl:if>

	<!--curtailment-->
	<xsl:if test="sgr:curtailment">
		<tr class="genericDetails"><td><img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" /> Curtailment</td><td><xsl:value-of select="sgr:curtailment"/></td></tr>
	</xsl:if>

	<!--minLoad-->
	<xsl:if test="sgr:minLoad">
		<tr class="genericDetails"><td><img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" /> Min. Load</td><td><xsl:value-of select="sgr:minLoad"/></td></tr>
	</xsl:if>

	<!--maxLockTimeMinutes-->
	<xsl:if test="sgr:maxLockTimeMinutes">
		<tr class="genericDetails"><td><img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" /> Max. Lock Time</td><td><xsl:value-of select="sgr:maxLockTimeMinutes"/> min</td></tr>
	</xsl:if>

	<!--minRunTimeMinutes-->
	<xsl:if test="sgr:minRunTimeMinutes">
		<tr class="genericDetails"><td><img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" /> Min. Run Time</td><td><xsl:value-of select="sgr:minRunTimeMinutes"/> min</td></tr>
	</xsl:if>

	<!--valueByTimeTableMinutes-->
	<xsl:if test="sgr:valueByTimeTableMinutes">
		<tr class="genericDetails"><td><img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" /> Value by time Table</td><td><xsl:value-of select="sgr:valueByTimeTableMinutes"/>min</td></tr>
	</xsl:if>

	<!--flexAssistance-->
	<xsl:if test="sgr:flexAssistance">
		<tr class="genericDetails"><td><img src="/xsl/genattr.png" alt="" width="16pt" height="16pt" /> Flex Assistance</td><td>Assists <xsl:value-of select="sgr:flexAssistance/sgr:assists"/>, obliged to <xsl:value-of select="sgr:flexAssistance/sgr:obliged_to"/></td></tr>
	</xsl:if>

</xsl:template>
<!-- Attributes Modbus -->
<xsl:template match="sgr:modbusAttr">
	<!--scalingByMulPwr-->
	<xsl:if test="sgr:scalingByMulPwr">
		<tr class="transportDetails"><td><img src="/xsl/modbus.png" alt="Modbus" width="60px"/> Scaling</td><td><xsl:value-of select="sgr:scalingByMulPwr/sgr:multiplicator"/> x 10e<xsl:value-of select="sgr:scalingByMulPwr/sgr:powerof10"/></td></tr>
	</xsl:if>	

	<!--stepByIncrement-->
	<xsl:if test="sgr:stepByIncrement">
		<tr class="transportDetails"><td><img src="/xsl/modbus.png" alt="Modbus" width="60px"/> Step by Increment</td><td><xsl:value-of select="sgr:stepByIncrement"/> ms</td></tr>
	</xsl:if>	

	<!--sunssf-->
	<xsl:if test="sgr:sunssf">
		<tr class="transportDetails"><td><img src="/xsl/modbus.png" alt="Modbus" width="60px"/> Sunspec Scale Factor</td><td><xsl:value-of select="sgr:sunssf"/> ms</td></tr>
	</xsl:if>	

	<!--pollLatencyMS-->
	<xsl:if test="sgr:pollLatencyMS">
		<tr class="transportDetails"><td><img src="/xsl/modbus.png" alt="Modbus" width="60px"/> Polling Latency</td><td><xsl:value-of select="sgr:pollLatencyMS"/> ms</td></tr>
	</xsl:if>

	<!--timeSyncBlockNotification-->
	<xsl:if test="sgr:timeSyncBlockNotification">
		<tr class="transportDetails"><td><img src="/xsl/modbus.png" alt="Modbus" width="60px"/> Time Sync Block Notification</td><td>Block <xsl:value-of select="sgr:timeSyncBlockNotification/sgr:blockNumber"/>: <xsl:value-of select="sgr:timeSyncBlockNotification/sgr:timeoutMs"/> ms</td></tr>
	</xsl:if>	

	<!--accessProtection-->
	<xsl:if test="sgr:accessProtection">
		<tr class="transportDetails"><td><img src="/xsl/modbus.png" alt="Modbus" width="60px"/> Access Protection</td><td>
		<xsl:choose>
			<xsl:when test="sgr:accessProtection/@isEnabled">Enabled: </xsl:when>
			<xsl:otherwise>Disabled: </xsl:otherwise>
		</xsl:choose>
		<xsl:for-each select="sgr:accessProtection/sgr:modbusException">
			<xsl:value-of select="."/>&#160;
		</xsl:for-each>
		</td></tr>
	</xsl:if>	

	<!--layer6Deviation-->
	<xsl:if test="sgr:layer6Deviation">
		<tr class="transportDetails"><td><img src="/xsl/modbus.png" alt="Modbus" width="60px"/> ISO/OSI Layer 6 Data Type</td><td><xsl:value-of select="sgr:layer6Deviation"/></td></tr>
	</xsl:if>

</xsl:template>

<!-- Helper templates -->
<!-- template 'join' accepts valueList and separator -->
<xsl:template name="join" >
	<xsl:param name="valueList" select="''"/>
	<xsl:param name="separator" select="','"/>
	<xsl:for-each select="$valueList">
		<xsl:choose>
			<xsl:when test="position() = 1">
				<xsl:value-of select="."/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat($separator, .) "/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:for-each>
</xsl:template>

<xsl:template name="SGrBasicGenDataPointTypeType">
	<xsl:choose>
		<xsl:when test="sgr:boolean">boolean</xsl:when>
		<xsl:when test="sgr:int8">byte</xsl:when>
		<xsl:when test="sgr:int16">short</xsl:when>
		<xsl:when test="sgr:int32">integer</xsl:when>
		<xsl:when test="sgr:int64">long</xsl:when>
		<xsl:when test="sgr:int8U">unsigned byte</xsl:when>
		<xsl:when test="sgr:int16U">unsigned short</xsl:when>
		<xsl:when test="sgr:int32U">unsigned int</xsl:when>
		<xsl:when test="sgr:int64U">unsigned long</xsl:when>
		<xsl:when test="sgr:float32">float</xsl:when>
		<xsl:when test="sgr:float64">double</xsl:when>
		<xsl:when test="sgr:enum">SGr Enum List Type</xsl:when> <!-- TODO Simon: map enum -->
		<xsl:when test="sgr:dateTime">date time</xsl:when>
		<xsl:when test="sgr:string">string</xsl:when>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>