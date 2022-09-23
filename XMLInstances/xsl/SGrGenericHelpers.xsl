<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sgr="http://www.smartgridready.com/ns/V0/">


    <!-- Helper templates -->
    <!-- template 'join' accepts valueList and separator -->
    <xsl:template name="join">
        <xsl:param name="valueList" select="''" />
        <xsl:param name="separator" select="','" />
        <xsl:for-each select="$valueList">
            <xsl:choose>
                <xsl:when test="position() = 1">
                    <xsl:value-of select="." />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat($separator, .) " />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

    <!-- SGrVersionNumberType -->
    <xsl:template match="sgr:softwareRevision">
        <xsl:call-template name="SGrVersionNumberType" />
    </xsl:template>
    <xsl:template match="sgr:hardwareRevision">
        <xsl:call-template name="SGrVersionNumberType" />
    </xsl:template>
    <xsl:template match="sgr:versionNumber">
        <xsl:call-template name="SGrVersionNumberType" />
    </xsl:template>
    <xsl:template name="SGrVersionNumberType">
        <xsl:value-of select="sgr:primaryVersionNumber" />.<xsl:value-of select="sgr:secondaryVersionNumber" />.<xsl:value-of select="sgr:subReleaseVersionNumber" />
    </xsl:template>

    <!-- SGrReleaseNotes -->
    <xsl:template match="sgr:releaseNotes">
        <table>
            <colgroup>
                <col style="width:5%" />
                <col style="width:25%" />
                <col style="width:20%" />
                <col style="width:20%" />
                <col style="width:30%" />
            </colgroup>
            <tr>
                <td colspan="2">State</td>
                <td colspan="3">
                    <xsl:value-of select="sgr:state" />
                </td>
            </tr>
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
                    <td>
                        <xsl:value-of select="sgr:version" />
                    </td>
                    <td>
                        <xsl:value-of select="sgr:date" />
                    </td>
                    <td>
                        <xsl:value-of select="sgr:author" />
                    </td>
                    <td>
                        <xsl:value-of select="sgr:comment" />
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>

</xsl:stylesheet> 