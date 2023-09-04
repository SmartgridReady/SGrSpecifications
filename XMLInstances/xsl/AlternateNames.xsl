<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sgr="http://www.smartgridready.com/ns/V0/">

    <!-- AlternativeNames-->
    <xsl:template match="sgr:alternativeNames">
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
                <td>Manufacturers Name</td>
                <td>
                    <xsl:value-of select="sgr:manufName" />
                </td>
            </tr>
        </xsl:if>

        <xsl:if test="sgr:IEC61850Name">
            <tr class="ontologyDetails">
                <td>IEC 61850 Name </td>
                <td>
                    <xsl:value-of select="sgr:IEC61850Name" />
                </td>
            </tr>
        </xsl:if>

        <xsl:if test="sgr:SAREFName">
            <tr class="ontologyDetails">
                <td>SAREF Name</td>
                <td>
                    <xsl:value-of select="sgr:SAREFName" />
                </td>
            </tr>
        </xsl:if>

        <xsl:if test="sgr:EEBUSName">
            <tr class="ontologyDetails">
                <td>EEBUS Name</td>
                <td>
                    <xsl:value-of select="sgr:EEBUSName" />
                </td>
            </tr>
        </xsl:if>

        <xsl:if test="sgr:sunSpecName">
            <tr class="ontologyDetails">
                <td>SUNSPEC Name</td>
                <td>
                    <xsl:value-of select="sgr:sunSpecName" />
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

        <xsl:if test="sgr:EN17609Name">
            <tr class="ontologyDetails">
                <td>EN17609 Name</td>
                <td>
                    <xsl:value-of select="sgr:EN17609Name" />
                </td>
            </tr>
        </xsl:if>

    </xsl:template>

</xsl:stylesheet>