<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sgr="http://www.smartgridready.com/ns/V0/">

    <!-- restApiInterfaceDescription -->
    <xsl:template match="sgr:restApiInterfaceDescription">
        <tr class="transportDetails">
            <td>Interface Type</td>
            <td>
                <xsl:value-of select="sgr:restAPIInterfaceSelection" />
            </td>
        </tr>

        <!-- trspSrvRestTCPV4outOfBox (1x opt )-->
        <xsl:if test="sgr:trspSrvRestTCPV4outOfBox">
            <tr class="transportDetails">
                <td>TCP/IP v4 Adress</td>
                <td>
                    <xsl:value-of select="sgr:trspSrvRestTCPV4outOfBox/sgr:ipV4n1" />
                    .
                    <xsl:value-of select="sgr:trspSrvRestTCPV4outOfBox/sgr:ipV4n2" />
                    .
                    <xsl:value-of select="sgr:trspSrvRestTCPV4outOfBox/sgr:ipV4n3" />
                    .
                    <xsl:value-of select="sgr:trspSrvRestTCPV4outOfBox/sgr:ipV4n4" />
                    :
                    <xsl:value-of select="sgr:trspSrvRestTCPV4outOfBox/sgr:ipV4portNr" />
                </td>
            </tr>
        </xsl:if>

        <!-- trspSrvRestTCPV6outOfBox (1x opt )-->
        <xsl:if test="sgr:trspSrvRestTCPV6outOfBox">
            <tr class="transportDetails">
                <td>TCP/IP v6 Adress</td>
                <td>
                    <xsl:value-of select="sgr:trspSrvRestTCPV6outOfBox/sgr:prelimStringDef" />
                </td>
            </tr>
        </xsl:if>

        <!-- trspSrvRestURIoutOfBox (1x opt )-->
        <xsl:if test="sgr:trspSrvRestURIoutOfBox">
            <tr class="transportDetails">
                <td>TCP/IP URI</td>
                <td>
                    <xsl:value-of select="sgr:trspSrvRestURIoutOfBox" />
                </td>
            </tr>
        </xsl:if>

        <tr class="transportDetails">
            <td>Authentication Method</td>
            <td>
                <xsl:value-of select="sgr:restAPIAuthenticationMethod" />
            </td>
        </tr>


        <!-- restAPIBearer (1x opt )-->
        <xsl:if test="sgr:restAPIBearer">
            <tr class="transportDetails">
                <td>Bearer Security</td>
                <td>
                    <table>
                        <xsl:apply-templates select="sgr:restAPIBearer/sgr:serviceCall" />
                    </table>
                </td>
            </tr>
        </xsl:if>

        <!-- restAPIBasic (1x opt )-->
        <xsl:if test="sgr:restAPIBasic">
            <tr class="transportDetails">
                <td>Basic Security</td>
                <td>
                    Username:
                    <xsl:value-of select="sgr:restAPIBasic/sgr:restBasicUsername" />
                    <br />
                    Password:
                    <xsl:value-of select="sgr:restAPIBasic/sgr:restBasicPassword" />
                </td>
            </tr>
        </xsl:if>
    </xsl:template>

    <!-- Attributes RestAPI -->
    <xsl:template match="sgr:restApiAttribute">
        <!--flexAssistance-->
        <xsl:if test="sgr:placeHolder4futureExtensions">
            <tr class="transportDetails">
                <td>
                    <img src="/xsl/rest.png" width="60px" />
                    Fut.Ext. ??
                </td>
                <td>
                    <xsl:value-of select="sgr:placeHolder4futureExtensions" />
                </td>
            </tr>
        </xsl:if>
    </xsl:template>

    <!-- Rest Service Call -->
    <xsl:template match="sgr:restServiceCall">
		<xsl:call-template name="SGrRestServiceCall" />
	</xsl:template>
    <xsl:template match="sgr:serviceCall">
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