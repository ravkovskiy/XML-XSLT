<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="mergedocs">
        <xsl:for-each select="doc">
            <xsl:for-each select="document(@path)/*">
                <xsl:copy>
                    <xsl:copy-of select="*"/>                   
                </xsl:copy>
                <xsl:text>&#xA;</xsl:text>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
