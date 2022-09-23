<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sgr="http://www.smartgridready.com/ns/V0/">

    <!-- restAPIInterfaceDesc -->
    <xsl:template match="sgr:restAPIInterfaceDesc">
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
                    End Point:
                    <xsl:value-of select="sgr:restAPIBearer/sgr:restAPIEndPoint" />
                    <br />
                    JMES Path:
                    <xsl:value-of select="sgr:restAPIBearer/sgr:restAPIJMESPath" />
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
    <xsl:template match="sgr:restAPIAttr">
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
    
</xsl:stylesheet>