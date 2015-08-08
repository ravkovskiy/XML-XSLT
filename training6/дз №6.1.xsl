<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="text"/>
    <xsl:key name="alphabet" match="/list/item" use="substring(., 1, 1)"/>
    
    <xsl:template match="*">
       <xsl:copy>
            <xsl:apply-templates
                select="item[generate-id(.) = generate-id(key('alphabet', substring(., 1, 1)))]">
                <xsl:sort select="."/>
            </xsl:apply-templates>
       </xsl:copy>
    </xsl:template>
    
    <xsl:template match="item">
        <xsl:text>
            &#xA;
        </xsl:text>
        <xsl:value-of select="substring(., 1, 1)"/>
        <xsl:text>
            &#xA;
        </xsl:text>
        <xsl:for-each select="key('alphabet', substring(., 1, 1))">
            <xsl:sort select="."/>
            <xsl:value-of select="."/> 
            <xsl:text>
            &#xA;
        </xsl:text>
        </xsl:for-each>       
    </xsl:template>
</xsl:stylesheet>