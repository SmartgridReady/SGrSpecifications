<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sgr="http://www.smartgridready.com/ns/V0/">

<!--
    Contains the style sheets for the generic functional profile, including
    - sgr:fpNameList

    Depends on named templates:
    - SGrNamelistType
    - SGrLegibDocumentationType
    - 

-->

<xsl:template match="sgr:fpListElement">
    <xsl:call-template name="sgrFunctionProfile"/>
</xsl:template>

<xsl:template name="sgrFunctionProfile">
	<div class="functionalProfile">
        <h2 style="float:left;"><xsl:value-of select="sgr:functionalProfile/@profileName"/> (<xsl:value-of select="sgr:functionalProfile/@mroVisibilityIndicator"/>)</h2>
        
        <!-- Functional Profile Block -->
        <table>
            <colgroup>
                <col style="width:30%"/>
            </colgroup>	
		    
            <xsl:apply-templates select="sgr:functionalProfile"/>

            <!-- Generic Attributes -->
            <xsl:apply-templates select="sgr:genAttribute"/>

            <!-- Modbus and Rest Attributes -->
            <xsl:apply-templates select="sgr:modbusAttr"/>
            <xsl:apply-templates select="sgr:restAPIAttr"/>
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
	</div>
</xsl:template>

<!-- Generic Functional Profile -->
<xsl:template match="sgr:functionalProfile">
    
    <tr><td>Profil-ID</td><td><xsl:value-of select="sgr:profileNumber/sgr:specsOwnerId"/> - <xsl:value-of select="sgr:profileNumber/sgr:profileIdentification"/> - <xsl:value-of select="sgr:profileNumber/sgr:subProfileIdent"/></td></tr>
    <tr><td>Level</td><td><xsl:value-of select="sgr:profileNumber/sgr:sgrLevelOfOperation"/></td></tr>
    <tr><td>Version</td><td><xsl:apply-templates select="sgr:profileNumber/sgr:versionNumber"/></td></tr>

    <tr><td class="noborder">&#160;</td></tr>

    <!-- fpNameList -->
    <xsl:apply-templates select="sgr:fpNameList"/>

    <!-- fpLegibDesc (4x opt) -->
    <xsl:apply-templates select="sgr:fpLegibDesc"/>	

    <!-- fpPrgDesc (4x opt)-->
    <xsl:apply-templates select="sgr:fpPrgDesc"/>
</xsl:template>

<!-- SGrNamelistType -->
<xsl:template match="sgr:fpNameList">
	<xsl:call-template name="SGrNamelistType"/>
</xsl:template>

<!-- SGrLegibDocumentationType -->
<xsl:template match="sgr:fpLegibDesc">
    <tr><xsl:attribute name="lang"><xsl:value-of select="sgr:language"/></xsl:attribute><td colspan="2"><xsl:call-template name="SGrLegibDocumentationType"/></td></tr>	
</xsl:template>
<xsl:template match="sgr:fpPrgDesc">
	<tr><xsl:attribute name="lang"><xsl:value-of select="sgr:language"/></xsl:attribute><td colspan="2"><xsl:call-template name="SGrLegibDocumentationType"/></td></tr>	
</xsl:template>

</xsl:stylesheet>