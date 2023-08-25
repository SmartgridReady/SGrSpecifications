<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sgr="http://www.smartgridready.com/ns/V0/">

    <xsl:template match="sgr:dataType">
        <xsl:call-template name="SGrDataType" />
    </xsl:template>

    <xsl:template name="SGrDataType">
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
            <xsl:when test="sgr:dateTime">date time</xsl:when>
            <xsl:when test="sgr:string">string</xsl:when>
            <xsl:when test="sgr:enum"><xsl:apply-templates select="sgr:enum" /></xsl:when> <!-- TODO Simon: map enum -->
            <xsl:when test="sgr:enum2bitmapIndex">bitmap</xsl:when> <!-- TODO Simon: render the differnet bitmap types -->
        </xsl:choose>
    </xsl:template>

    <xsl:template match="sgr:enum">
        <xsl:call-template name="SGrEnumListTyp" />
    </xsl:template>
    <xsl:template name="SGrEnumListTyp">
        <xsl:choose>
            <xsl:when test="sgr:sgrMeasValueSource">MeasValueSource</xsl:when>
            <xsl:when test="sgr:sgrPowerSource">PowerSource</xsl:when>
            <xsl:when test="sgr:sgreadyStateLv2">sgreadyStateLv2</xsl:when>
            <xsl:when test="sgr:sgreadyStateLv1">sgreadyStateLv1</xsl:when>
            <xsl:when test="sgr:sgrSunspStateCodes">SunspStateCodes</xsl:when>
            <xsl:when test="sgr:sgrEVSEStateLv2">EVSEStateLv2</xsl:when>
            <xsl:when test="sgr:sgrEVSEStateLv1">EVSEStateLv1</xsl:when>
            <xsl:when test="sgr:sgrSGCPLoadStateLv2">SGCPLoadStateLv2</xsl:when>
            <xsl:when test="sgr:sgrSGCPFeedInStateLv2">SGCPFeedInStateLv2</xsl:when>
            <xsl:when test="sgr:sgrEVState">sgrEVState</xsl:when>
            <xsl:when test="sgr:sgrSGCPService">SGCPService</xsl:when>
            <xsl:when test="sgr:sgrObligLvl">ObligLvl</xsl:when>
            <xsl:when test="sgr:sgrOCPPState">OCPPState</xsl:when>
            <xsl:when test="sgr:sgrHPOpMode">HPOpMode</xsl:when>
            <xsl:when test="sgr:sgrHCOpMode">HCOpMode</xsl:when>
            <xsl:when test="sgr:sgrDHWOpMode">DHWOpMode</xsl:when>        
            <xsl:otherwise>unknown</xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
