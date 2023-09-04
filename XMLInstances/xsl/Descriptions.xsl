<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:sgr="http://www.smartgridready.com/ns/V0/">

	<!-- LegibleDescription -->
	<xsl:template match="sgr:legibleDescription">
		<tr>
			<xsl:attribute name="lang">
				<xsl:value-of select="sgr:language" />
			</xsl:attribute>
			<td colspan="2">
				<xsl:call-template name="LegibleDescription" />
			</td>
		</tr>
	</xsl:template>
	<!-- ProgrammerHints -->
	<xsl:template match="sgr:programmerHints">
		<tr>
			<xsl:attribute name="lang">
				<xsl:value-of select="sgr:language" />
			</xsl:attribute>
			<td colspan="2">
				<xsl:call-template name="LegibleDescription" />
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="LegibleDescription">
		<img width="20px" height="14px">
			<xsl:attribute name="src" alt="Lang">/xsl/<xsl:value-of select="sgr:language" />.png</xsl:attribute>
		</img>
		&#160;<xsl:value-of select="sgr:textElement" disable-output-escaping="yes" />
	<xsl:if
			test="sgr:uri"> &#160; <a target="_blank">
				<xsl:attribute name="href">
					<xsl:value-of select="sgr:uri" />
				</xsl:attribute>
				<img src="/xsl/link.png" alt="Link.." width="16pt" height="16pt" />
			</a>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>