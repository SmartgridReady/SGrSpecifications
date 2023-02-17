<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sgr="http://www.smartgridready.com/ns/V0/">

    <!-- SGrNamelistType-->
    <xsl:template name="SGrNamelistType">
        <xsl:if test="sgr:sLV1Name">
            <tr class="ontologyDetails">
                <td>SGr label V1 (legacy)</td>
                <td>
                    <xsl:value-of select="sgr:sLV1Name" />
                </td>
            </tr>
        </xsl:if>

        <xsl:if test="sgr:sWorkName">
            <tr class="ontologyDetails">
                <td>Temporary Work Name</td>
                <td>
                    <xsl:value-of select="sgr:sWorkName" />
                </td>
            </tr>
        </xsl:if>

        <xsl:if test="sgr:sManufName">
            <tr class="ontologyDetails">
                <td>Manufacturer</td>
                <td>
                    <xsl:value-of select="sgr:sManufName" />
                </td>
            </tr>
        </xsl:if>

        <xsl:if test="sgr:sIEC61850Name">
            <tr class="ontologyDetails">
                <td>IEC 61850 Name </td>
                <td>
                    <xsl:value-of select="sgr:sIEC61850Name" />
                </td>
            </tr>
        </xsl:if>

        <xsl:if test="sgr:sSAREFName">
            <tr class="ontologyDetails">
                <td>SAREF Name</td>
                <td>
                    <xsl:value-of select="sgr:sSAREFName" />
                </td>
            </tr>
        </xsl:if>

        <xsl:if test="sgr:sEEBUSName">
            <tr class="ontologyDetails">
                <td>EEBUS Name</td>
                <td>
                    <xsl:value-of select="sgr:sEEBUSName" />
                </td>
            </tr>
        </xsl:if>

        <xsl:if test="sgr:sSUNSPECName">
            <tr class="ontologyDetails">
                <td>SUNSPEC Name</td>
                <td>
                    <xsl:value-of select="sgr:sSUNSPECName" />
                </td>
            </tr>
        </xsl:if>

        <xsl:if test="sgr:sHPbwpName">
            <tr class="ontologyDetails">
                <td>bwp HP Name</td>
                <td>
                    <xsl:value-of select="sgr:sHPbwpName" />
                </td>
            </tr>
        </xsl:if>

        <xsl:if test="sgr:sEN17609Name">
            <tr class="ontologyDetails">
                <td>EN17609 Name</td>
                <td>
                    <xsl:value-of select="sgr:sEN17609Name" />
                </td>
            </tr>
        </xsl:if>

    </xsl:template>

</xsl:stylesheet>