<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sgr="http://www.smartgridready.com/ns/V0/">

    <!-- AlternativeNames-->
    <xsl:template name="AlternativeNames">
        <xsl:if test="sgr:sLV1Name">
            <tr class="ontologyDetails">
                <td>SGr label V1 (legacy)</td>
                <td>
                    <xsl:value-of select="sgr:sLV1Name" />
                </td>
            </tr>
        </xsl:if>

        <xsl:if test="sgr:workName">
            <tr class="ontologyDetails">
                <td>Temporary Work Name</td>
                <td>
                    <xsl:value-of select="sgr:workName" />
                </td>
            </tr>
        </xsl:if>

        <xsl:if test="sgr:manufName">
            <tr class="ontologyDetails">
                <td>Manufacturer</td>
                <td>
                    <xsl:value-of select="sgr:manufName" />
                </td>
            </tr>
        </xsl:if>

        <xsl:if test="sgr:iec61850Name">
            <tr class="ontologyDetails">
                <td>IEC 61850 Name </td>
                <td>
                    <xsl:value-of select="sgr:iec61850Name" />
                </td>
            </tr>
        </xsl:if>

        <xsl:if test="sgr:sarefName">
            <tr class="ontologyDetails">
                <td>SAREF Name</td>
                <td>
                    <xsl:value-of select="sgr:sarefName" />
                </td>
            </tr>
        </xsl:if>

        <xsl:if test="sgr:eebusName">
            <tr class="ontologyDetails">
                <td>EEBUS Name</td>
                <td>
                    <xsl:value-of select="sgr:eebusName" />
                </td>
            </tr>
        </xsl:if>

        <xsl:if test="sgr:sunspecName">
            <tr class="ontologyDetails">
                <td>SUNSPEC Name</td>
                <td>
                    <xsl:value-of select="sgr:sunspecName" />
                </td>
            </tr>
        </xsl:if>

        <xsl:if test="sgr:hpBwpName">
            <tr class="ontologyDetails">
                <td>bwp HP Name</td>
                <td>
                    <xsl:value-of select="sgr:hpBwpName" />
                </td>
            </tr>
        </xsl:if>

        <xsl:if test="sgr:en17609Name">
            <tr class="ontologyDetails">
                <td>EN17609 Name</td>
                <td>
                    <xsl:value-of select="sgr:en17609Name" />
                </td>
            </tr>
        </xsl:if>

    </xsl:template>

</xsl:stylesheet>