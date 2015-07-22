<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:template match="/">
        <catalog>
            <xsl:for-each select="catalog/cd">
                <xsl:sort select="year"/>
                <cd>
                    <title><xsl:value-of select="title"/></title>
                    <artistname><xsl:value-of select="artist"/></artistname>
                    <country><xsl:value-of select="country"/></country>
                    <company><xsl:value-of select="company"/></company>
                    <price><xsl:value-of select="format-number(price, '#')"/></price>
                    <year><xsl:value-of select="year"/></year>
                </cd>
            </xsl:for-each>
        </catalog>
    </xsl:template>
</xsl:stylesheet>
