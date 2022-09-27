<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sgr="http://www.smartgridready.com/ns/V0/">

    <!-- Generic Functional Profiles -->
    <xsl:template match="sgr:SGrFunctionalProfileDescriptionType">
        <div class="functionalProfile">
            <h2>
                <xsl:value-of select="sgr:functionalProfile/@profileName" />
            </h2>

            <xsl:apply-templates select="sgr:releaseNotes" />


            <h2>Functional Profile</h2>

            <!-- Functional Profile Block -->
            <table>
                <colgroup>
                    <col style="width:30%" />
                </colgroup>

                <xsl:apply-templates select="sgr:functionalProfile" />


            </table>

            <!-- Data Points -->
            <div class="dataPoint">
                <table>
                    <colgroup>
                        <col style="width:5%" />
                        <col style="width:25%" />
                        <col style="width:35%" />
                        <col style="width:15%" />
                        <col style="width:10%" />
                        <col style="width:10%" />
                    </colgroup>
                    <tr>
                        <th colspan="2">Datapoint</th>
                        <th>Unit</th>
                        <th>Type</th>
                        <th>MRO</th>
                        <th>RWP</th>
                    </tr>
                    <xsl:apply-templates select="sgr:dpListElement" />
                </table>
            </div>

            <div class="functionalProfile">
                <h2>Attibutes</h2>
                <!-- Generic Attributes -->
                <table>
                    <colgroup>
                        <col style="width:30%" />
                        <col style="width:30%" />
                        <col style="width:40%" />
                    </colgroup>
                    <tr>
                        <th>SGr Attribute</th>
                        <th>Type</th>
                        <th>Description</th>
                    </tr>
                    <xsl:apply-templates select="sgr:genAttribute">
                        <xsl:with-param name="type" select="'FP'" />
                    </xsl:apply-templates>

                </table>
            </div>

            <!-- Footer-->
            <div class="profilefooter">
            Konzept und Spezifikation Funktionsprofile siehe separates Dokument "Funktionsprofile_Spezifikation_vx.x.pdf"
            Informationen und Support unter www.smartgridready.ch, deklaration@smartgridready.ch
        </div>
        </div>
    </xsl:template>

</xsl:stylesheet>