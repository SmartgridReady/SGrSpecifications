<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sgr="http://www.smartgridready.com/ns/V0/">

    <!-- restApiInterfaceDescription -->
    <xsl:template match="sgr:restApiInterfaceDescription">
        <tr class="transportDetails">
            <td>Interface Type</td>
            <td>
                <xsl:value-of select="sgr:restApiInterfaceSelection" />
            </td>
        </tr>

        <!-- restApiIpV4Address (1x opt )-->
        <xsl:if test="sgr:restApiIpV4Address">
            <tr class="transportDetails">
                <td>TCP/IP v4 Adress</td>
                <td>
                    <xsl:value-of select="sgr:restApiIpV4Address/sgr:ipV4n1" />
                    .
                    <xsl:value-of select="sgr:restApiIpV4Address/sgr:ipV4n2" />
                    .
                    <xsl:value-of select="sgr:restApiIpV4Address/sgr:ipV4n3" />
                    .
                    <xsl:value-of select="sgr:restApiIpV4Address/sgr:ipV4n4" />
                    :
                    <xsl:value-of select="sgr:restApiIpV4Address/sgr:ipV4portNr" />
                </td>
            </tr>
        </xsl:if>

        <!-- restApiIpV6Address (1x opt )-->
        <xsl:if test="sgr:restApiIpV6Address">
            <tr class="transportDetails">
                <td>TCP/IP v6 Adress</td>
                <td>
                    <xsl:value-of select="sgr:restApiIpV6Address/sgr:prelimStringDef" />
                </td>
            </tr>
        </xsl:if>

        <!-- restApiUri (1x opt )-->
        <xsl:if test="sgr:restApiUri">
            <tr class="transportDetails">
                <td>TCP/IP URI</td>
                <td>
                    <xsl:value-of select="sgr:restApiUri" />
                </td>
            </tr>
        </xsl:if>

        <tr class="transportDetails">
            <td>Authentication Method</td>
            <td>
                <xsl:value-of select="sgr:restApiAuthenticationMethod" />
            </td>
        </tr>


        <!-- restApiBearer (1x opt )-->
        <xsl:if test="sgr:restApiBearer">
            <tr class="transportDetails">
                <td>Bearer Security</td>
                <td>
                    <table>
                        <xsl:apply-templates select="sgr:restApiBearer/sgr:restServiceCall" />
                    </table>
                </td>
            </tr>
        </xsl:if>

        <!-- restApiBasic (1x opt )-->
        <xsl:if test="sgr:restApiBasic">
            <tr class="transportDetails">
                <td>Basic Security</td>
                <td>
                    Username:
                    <xsl:value-of select="sgr:restApiBasic/sgr:restBasicUsername" />
                    <br />
                    Password:
                    <xsl:value-of select="sgr:restApiBasic/sgr:restBasicPassword" />
                </td>
            </tr>
        </xsl:if>
    </xsl:template>

    <!-- Rest Service Call -->
    <xsl:template match="sgr:restServiceCall">
		<xsl:call-template name="SGrRestServiceCall" />
	</xsl:template>
    <xsl:template match="sgr:restServiceCall">
		<xsl:call-template name="SGrRestServiceCall" />
	</xsl:template>    
    <xsl:template name="SGrRestServiceCall">
        <tr class="transportDetails">
			<td>End Point</td>
			<td>
				<xsl:value-of select="sgr:requestMethod" /> &#160; 
				<xsl:value-of select="sgr:requestPath" />
			</td>
		</tr>
        <xsl:if test="sgr:requestHeader">
            <tr class="transportDetails">
                <td>Header</td>
                <td>
    				<xsl:for-each select="sgr:requestHeader/sgr:header">
                        <xsl:value-of select="./@headerName" /> : <xsl:value-of select="@value" />
                    </xsl:for-each>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="sgr:requestBody">
		    <tr class="transportDetails">
			    <td>Body</td>
			    <td>
                    <xsl:value-of select="sgr:requestBody" />
			    </td>
		    </tr>		
        </xsl:if>
		<tr class="transportDetails">
			<td>Response</td>
			<td>
				<xsl:value-of select="sgr:responseQuery/sgr:queryType" /> &#160;
				<xsl:value-of select="sgr:responseQuery/sgr:query" />
			</td>
		</tr>
    </xsl:template>
    
</xsl:stylesheet>