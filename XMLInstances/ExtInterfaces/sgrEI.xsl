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
		  .profileheader { }
		  .externalInterface { } 
		  .functionalProfile { }
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
			
			<div class="externalInterface">
				<h2><xsl:value-of select="/*/@manufacturerName"/> - <xsl:value-of select="/*/@deviceName"/></h2>
				<table>
					<colgroup>
						<col style="width:30%"/>
					</colgroup>	
					<tr><td>Name</td><td><xsl:value-of select="/*/@deviceName"/></td></tr>
					<tr><td>Manufacturer</td><td><xsl:value-of select="/*/@manufacturerName"/></td></tr>
					<tr><td>Manufacturer ID</td><td><xsl:value-of select="/*/@manufacturerID"/></td></tr>
					<tr><td>Local / Cloud</td><td><xsl:value-of select="/*/@isLocalControl"/></td></tr>
				</table>

				<xsl:apply-templates select="*/sgr:deviceProfile"/>

				<!-- devMbAttrReference -->
				<xsl:if test="*/sgr:devMbAttrReference">
					<table>
						<colgroup>
							<col style="width:30%"/>
						</colgroup>	

						<xsl:apply-templates select="*/sgr:devMbAttrReference"/>
					</table>
				</xsl:if>
				
				<!-- devRestAPIAttrReference -->
				<xsl:if test="*/sgr:devRestAPIAttrReference">
					<table>
						<colgroup>
							<col style="width:30%"/>
						</colgroup>	

						<xsl:apply-templates select="*/sgr:devRestAPIAttrReference"/>
					</table>
				</xsl:if>

				<!-- modbusInterfaceDesc -->
				<xsl:apply-templates select="*/sgr:modbusInterfaceDesc"/>

				<!-- TODO name="restAPIInterfaceDesc" type="sgr:SGrRestAPIInterfaceDescriptionType"-->

				<!-- TODO name="networkConnectionState" type="sgr:networkConnectionStateType" (opt 1x)-->
					<!--element maxOccurs="1" minOccurs="0" name="isConnected" type="boolean"/-->
      				<!--element maxOccurs="1" minOccurs="0" name="nextAttempt" type="time"/-->
			</div>

			<!-- Functiol Profiles -->
			<xsl:for-each select="*/sgr:fpListElement">
				<div class="functionalProfile">
					<xsl:apply-templates select="sgr:functionalProfile"/>


					<xsl:apply-templates select="sgr:fpMbAttrReference"/>
					<xsl:apply-templates select="sgr:fpRestAPIAttrReference"/>

					<table>
						<colgroup>
							<col style="width:30%"/>
							<col style="width:30%"/>
							<col style="width:20%"/>
							<col style="width:20%"/>
						</colgroup>			
						<tr>
							<th>Datapoint</th>
							<th>Einh.</th>
							<th>MRO</th>
							<th>RWP</th>
						</tr>
						<xsl:apply-templates select="sgr:dpListElement"/>
					</table>
				</div>
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
<xsl:template match="sgr:dpNameList">
	<xsl:call-template name="SGrNamelistType"/>
</xsl:template>
<xsl:template name="SGrNamelistType">
	<h3><xsl:value-of select="sgr:nameType"/> Ontology</h3>
	<table>
		<colgroup>
			<col style="width:30%"/>
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
<xsl:template match="sgr:fpPrgDesc">
	<xsl:call-template name="SGrLegibDocumentationType"/>
</xsl:template>
<xsl:template match="sgr:dpLegibDesc">
	<xsl:call-template name="SGrLegibDocumentationType"/>
</xsl:template>
<xsl:template name="SGrLegibDocumentationType">
	<div style="padding:0.5em">
		<img width="20px" height="14px"><xsl:attribute name="src">xsl/<xsl:value-of select="sgr:language"/>.png</xsl:attribute></img>
		&#160;<xsl:value-of select="sgr:textElement"/>&#160;
		<a><xsl:attribute name="href"><xsl:value-of select="sgr:uri"/></xsl:attribute><img alt="Link.." src="xsl/link.png" width="16pt" height="16pt" /></a>
	</div>
</xsl:template>

<!-- SGrDeviceProfileType -->
<xsl:template match="sgr:deviceProfile">	

	<!-- devNameList -->
	<xsl:apply-templates select="sgr:devNameList"/>

	<!-- devLegibDesc (4x opt) -->
	<xsl:apply-templates select="sgr:devLegibDesc"/>	

	<table style="width:100%">
		<colgroup>
			<col style="width:30%"/>
		</colgroup>

		<!-- Transport Service -->
		<tr><td>Transport Service</td><td>
			<xsl:choose>
				<xsl:when test="sgr:transportService='Modbus'"><img src="xsl/modbus.png" width="60px"/></xsl:when>
				<xsl:when test="sgr:transportService='RESTfulJSON'"><img src="xsl/rest.png" width="80px"/></xsl:when>
				<xsl:otherwise>
					<!--enumeration value="EEBUS"/>
					<enumeration value="OCPP1.6"/>
					<enumeration value="OCPP2.01"/>
					<enumeration value="Contacts"/>
					<enumeration value="WoT"/>
					<enumeration value="proprietary"/>
					<enumeration value="generic"/-->
					<xsl:value-of select="sgr:transportService"/>
				</xsl:otherwise>
			</xsl:choose>
			    
		</td></tr>
		
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
</xsl:template>

<!-- SGrModbusInterfaceDescriptionType -->
<xsl:template match="sgr:modbusInterfaceDesc">
	<xsl:call-template name="SGrModbusInterfaceDescriptionType"/>
</xsl:template>
<xsl:template name="SGrModbusInterfaceDescriptionType">
	<h3><img src="xsl/modbus.png" width="100px"/></h3>
	<table>
		<colgroup>
			<col style="width:30%"/>
		</colgroup>	

		<tr><td>Interface Type</td><td><xsl:value-of select="sgr:modbusInterfaceSelection"/></td></tr>

		<!-- trspSrvModbusTCPoutOfBox (1x opt) -->
		<xsl:if test="sgr:trspSrvModbusTCPoutOfBox">
			<tr><td>TCP</td><td>
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
			<tr><td>RTU</td><td>
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
		<tr>
			<td>First Register Address</td>
			<td>
				<xsl:choose>
					<xsl:when test="sgr:firstRegisterAddressIsOne='true'">1 </xsl:when>
					<xsl:otherwise>0</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>

		<!-- conversionScheme -->
		<tr><td>Conversion Scheme</td><td>
			<xsl:call-template name="join">
				<xsl:with-param name="valueList" select="sgr:conversionScheme"/>
				<xsl:with-param name="separator" select="', '"/>
			</xsl:call-template>
		</td></tr>
	</table>
</xsl:template>


<!-- Function Profile-->
<xsl:template match="sgr:functionalProfile">
	<h2><xsl:value-of select="@profileName"/> (<xsl:value-of select="@mroVisibilityIndicator"/>)</h2>

	<table>
		<colgroup>
			<col style="width:30%"/>
		</colgroup>	
		<xsl:for-each select="sgr:profileNumber">
			<tr><td>Profil-ID</td><td><xsl:value-of select="sgr:specsOwnerId"/> - <xsl:value-of select="sgr:profileIdentification"/> - <xsl:value-of select="sgr:subProfileIdent"/></td></tr>
			<tr><td>Level</td><td><xsl:value-of select="sgr:sgrLevelOfOperation"/></td></tr>
			<tr><td>Version</td><td><xsl:apply-templates select="sgr:versionNumber"/></td></tr>
		</xsl:for-each>
	</table>

		<!-- fpNameList -->
	<xsl:apply-templates select="sgr:fpNameList"/>

	<!-- fpLegibDesc (4x opt) -->
	<xsl:apply-templates select="sgr:fpLegibDesc"/>	

	<!-- fpPrgDesc (4x opt)-->
	<xsl:apply-templates select="sgr:fpPrgDesc"/>	
</xsl:template>

<!-- SGrDataPointDescriptionType -->
<xsl:template match="sgr:dpListElement">
	<tr>
		<td><xsl:value-of select="sgr:dataPoint/@datapointName"/></td>
		<td><xsl:value-of select="sgr:dataPoint/@unit"/></td>
		<td><xsl:value-of select="sgr:dataPoint/@mroVisibilityIndicator"/></td>
		<td><xsl:value-of select="sgr:dataPoint/@rwpDatadirection"/></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="3">
			<!-- dpNameList (1x opt)-->
			<xsl:if test="sgr:dataPoint/sgr:dpNameList">
				<xsl:apply-templates select="sgr:dataPoint/sgr:dpNameList"/>
			</xsl:if>

			<!-- dpLegibDesc (4x opt) -->
			<xsl:apply-templates select="sgr:dataPoint/sgr:dpLegibDesc"/>

			<xsl:apply-templates select="sgr:dpMbAttrReference"/>
			<xsl:apply-templates select="sgr:dpRestAPIAttrReference"/>
		</td>
	</tr>

	<!-- TODO name="basicDataType" type="sgr:SGrBasicGenDataPointTypeType" (opt 1x) -->
	<!-- TODO name="basicArrayDataType" type="sgr:SGrBasicGenArrayDPTypeType" (opt 1x) -->	

	<!-- TODO name="modbusDataPoint" type="sgr:SGrModbusDataPointDescriptionType" (1-unbound)-->
</xsl:template>

<!-- Attributes Modbus Mapper -->
<xsl:template match="sgr:devMbAttrReference">
	<xsl:call-template name="SGrModbusAttrFrameType"/>
</xsl:template>
<xsl:template match="sgr:fpMbAttrReference">
	<table>
		<colgroup>
			<col style="width:30%"/>
		</colgroup>	
		<xsl:call-template name="SGrModbusAttrFrameType"/>
	</table>
</xsl:template>
<xsl:template match="sgr:dpMbAttrReference">
	<table>
		<colgroup>
			<col style="width:30%"/>
		</colgroup>	
		<xsl:call-template name="SGrModbusAttrFrameType"/>
	</table>
</xsl:template>
<xsl:template name="SGrModbusAttrFrameType">
	<xsl:apply-templates select="sgr:genAttribute"/>
	<xsl:apply-templates select="sgr:modbusAttr"/>
</xsl:template>

<!-- Attributes RestAPI Mapper -->
<xsl:template match="sgr:devRestAPIAttrReference">
	<xsl:call-template name="SGrRestAPIAttrFrameType"/>
</xsl:template>
<xsl:template match="sgr:fpRestAPIAttrReference">
	<table>
		<colgroup>
			<col style="width:30%"/>
		</colgroup>	
		<xsl:call-template name="SGrModbusAttrFrameType"/>
	</table>
</xsl:template>
<xsl:template match="sgr:dpRestAPIAttrReference">
	<table>
		<colgroup>
			<col style="width:30%"/>
		</colgroup>	
		<xsl:call-template name="SGrModbusAttrFrameType"/>
	</table>
</xsl:template>
<xsl:template name="SGrRestAPIAttrFrameType">
	<xsl:apply-templates select="sgr:genAttribute"/>
	<xsl:apply-templates select="sgr:restAPIAttr"/>
</xsl:template>

<!-- Attributes generic -->
<xsl:template match="sgr:genAttribute">
	<xsl:call-template name="SGrAttr4GenericType"/>
</xsl:template>
<xsl:template match="sgr:devAttr4Generic">
	<xsl:call-template name="SGrAttr4GenericType"/>
</xsl:template>
<xsl:template match="sgr:fpAttr4Generic">
	<xsl:call-template name="SGrAttr4GenericType"/>
</xsl:template>
<xsl:template match="sgr:dpAttr4Generic">
	<xsl:call-template name="SGrAttr4GenericType"/>
</xsl:template>
<xsl:template name="SGrAttr4GenericType">
	<!--maxVal-->
	<xsl:if test="sgr:maxVal">
		<tr><td>Upper Range Limit</td><td><xsl:value-of select="sgr:maxVal"/></td></tr>
	</xsl:if>	

	<!--minVal-->
	<xsl:if test="sgr:minVal">
		<tr><td>Lower Range Limit</td><td><xsl:value-of select="sgr:minVal"/></td></tr>
	</xsl:if>	

	<!--specQualityRequirement-->
	<xsl:if test="sgr:specQualityRequirement">
		<tr><td>Quality Requirements</td><td><xsl:value-of select="sgr:specQualityRequirement"/></td></tr>
	</xsl:if>	

	<!--precision-->
	<xsl:if test="sgr:precision">
		<tr><td>Precision</td><td><xsl:value-of select="sgr:precision"/></td></tr>
	</xsl:if>

	<!--stabilityFallback-->
	<xsl:if test="sgr:stabilityFallback">
		<tr><td>Stability Fallback</td><td>
			Max recieve time: <xsl:value-of select="sgr:stabilityFallback/sgr:maxReceiveTime"/><br/>
			Init Value: <xsl:value-of select="sgr:stabilityFallback/sgr:initValue"/><br/>
			Fallback Value: <xsl:value-of select="sgr:stabilityFallback/sgr:fallbackValue"/><br/>
		</td></tr>
	</xsl:if>

	<!--smoothTransition-->
	<xsl:if test="sgr:smoothTransition">
		<tr><td>Stability Fallback</td><td>
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
		<tr><td>Min. Delta for Notification</td><td><xsl:value-of select="sgr:minSendDelta"/></td></tr>
	</xsl:if>

	<!--maxSendTime-->
	<xsl:if test="sgr:maxSendTime">
		<tr><td>Max. Time between Notification</td><td><xsl:value-of select="sgr:maxSendTime"/></td></tr>
	</xsl:if>

	<!--maxReceiveTime-->
	<xsl:if test="sgr:maxReceiveTime">
		<tr><td>Max. Recieve Time</td><td><xsl:value-of select="sgr:maxReceiveTime"/></td></tr>
	</xsl:if>

	<!--minSendTime-->
	<xsl:if test="sgr:minSendTime">
		<tr><td>Min. Time between Notification</td><td><xsl:value-of select="sgr:minSendTime"/></td></tr>
	</xsl:if>

	<!--maxLatencyTime-->
	<xsl:if test="sgr:maxLatencyTime">
		<tr><td>Max. Latency</td><td><xsl:value-of select="sgr:maxLatencyTime"/></td></tr>
	</xsl:if>

	<!--timeStampLog-->
	<xsl:if test="sgr:timeStampLog">
		<tr><td>Time Stamp Log</td><td><xsl:value-of select="sgr:timeStampLog"/></td></tr>
	</xsl:if>
		
	<!--timeRange-->
	<xsl:if test="sgr:timeRange">
		<tr><td>Time Range</td><td><xsl:value-of select="sgr:timeRange/sgr:startTime"/> - <xsl:value-of select="sgr:timeRange/sgr:endTime"/></td></tr>
	</xsl:if>

	<!--valueState-->
	<xsl:if test="sgr:valueState">
		<tr><td>Value Statue</td><td><xsl:value-of select="sgr:valueState"/></td></tr>
	</xsl:if>

	<!--valueTendency-->
	<xsl:if test="sgr:valueTendency">
		<tr><td>Value Tendency</td><td><xsl:value-of select="sgr:valueTendency"/></td></tr>
	</xsl:if>

	<!--valueSource-->
	<xsl:if test="sgr:valueSource">
		<tr><td>Value Source</td><td><xsl:value-of select="sgr:valueSource"/></td></tr>
	</xsl:if>

	<!--sampleRate-->
	<xsl:if test="sgr:sampleRate">
		<tr><td>Sample Rate</td><td><xsl:value-of select="sgr:sampleRate"/> ms</td></tr>
	</xsl:if>

	<!--curtailment-->
	<xsl:if test="sgr:curtailment">
		<tr><td>Curtailment</td><td><xsl:value-of select="sgr:curtailment"/></td></tr>
	</xsl:if>

	<!--minLoad-->
	<xsl:if test="sgr:minLoad">
		<tr><td>Min. Load</td><td><xsl:value-of select="sgr:minLoad"/></td></tr>
	</xsl:if>

	<!--maxLockTimeMinutes-->
	<xsl:if test="sgr:maxLockTimeMinutes">
		<tr><td>Max. Lock Time</td><td><xsl:value-of select="sgr:maxLockTimeMinutes"/> min</td></tr>
	</xsl:if>

	<!--minRunTimeMinutes-->
	<xsl:if test="sgr:minRunTimeMinutes">
		<tr><td>Min. Run Time</td><td><xsl:value-of select="sgr:minRunTimeMinutes"/> min</td></tr>
	</xsl:if>

	<!--valueByTimeTableMinutes-->
	<xsl:if test="sgr:valueByTimeTableMinutes">
		<tr><td>Value by time Table</td><td><xsl:value-of select="sgr:valueByTimeTableMinutes"/>min</td></tr>
	</xsl:if>

	<!--flexAssistance-->
	<xsl:if test="sgr:flexAssistance">
		<tr><td>Flex Assistance</td><td>Assists <xsl:value-of select="sgr:flexAssistance/sgr:assists"/>, obliged to <xsl:value-of select="sgr:flexAssistance/sgr:obliged_to"/></td></tr>
	</xsl:if>

</xsl:template>
<!-- Attributes Modbus -->
<xsl:template match="sgr:modbusAttr">
	<!--scalingByMulPwr-->
	<xsl:if test="sgr:scalingByMulPwr">
		<tr><td><img src="xsl/modbus.png" width="60px"/> Scaling</td><td><xsl:value-of select="sgr:scalingByMulPwr/sgr:multiplicator"/> x 10e<xsl:value-of select="sgr:scalingByMulPwr/sgr:powerof10"/></td></tr>
	</xsl:if>	

	<!--stepByIncrement-->
	<xsl:if test="sgr:stepByIncrement">
		<tr><td><img src="xsl/modbus.png" width="60px"/> Step by Increment</td><td><xsl:value-of select="sgr:stepByIncrement"/> ms</td></tr>
	</xsl:if>	

	<!--sunssf-->
	<xsl:if test="sgr:sunssf">
		<tr><td><img src="xsl/modbus.png" width="60px"/> Sunspec Scale Factor</td><td><xsl:value-of select="sgr:sunssf"/> ms</td></tr>
	</xsl:if>	

	<!--pollLatencyMS-->
	<xsl:if test="sgr:pollLatencyMS">
		<tr><td><img src="xsl/modbus.png" width="60px"/> Polling Latency</td><td><xsl:value-of select="sgr:pollLatencyMS"/> ms</td></tr>
	</xsl:if>

	<!--timeSyncBlockNotification-->
	<xsl:if test="sgr:timeSyncBlockNotification">
		<tr><td><img src="xsl/modbus.png" width="60px"/> Time Sync Block Notification</td><td>Block <xsl:value-of select="sgr:timeSyncBlockNotification/sgr:blockNumber"/>: <xsl:value-of select="sgr:timeSyncBlockNotification/sgr:timeoutMs"/> ms</td></tr>
	</xsl:if>	

	<!--accessProtection-->
	<xsl:if test="sgr:accessProtection">
		<tr><td><img src="xsl/modbus.png" width="60px"/> Access Protection</td><td>
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
		<tr><td><img src="xsl/modbus.png" width="60px"/> ISO/OSI Layer 6 Data Type</td><td><xsl:value-of select="sgr:layer6Deviation"/></td></tr>
	</xsl:if>

</xsl:template>
<!-- Attributes RestAPI -->
<xsl:template match="sgr:restAPIAttr">
	<!--flexAssistance-->
	<xsl:if test="sgr:placeHolder4futureExtensions">
		<tr><td>Future Extensions???</td><td><xsl:value-of select="sgr:placeHolder4futureExtensions"/></td></tr>
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

</xsl:stylesheet>