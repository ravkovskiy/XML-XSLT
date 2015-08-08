<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="text"/>
    
    <xsl:key name="nodeAndAttribute" match="*|@*" use="local-name()"/>
    
    <xsl:template match="*|@*">
       
        <xsl:if test="generate-id(.) = generate-id(key('nodeAndAttribute', local-name()))">
            <xsl:text>Node '</xsl:text>
            <xsl:value-of select="local-name()"/>
            <xsl:text>' found </xsl:text>
            <xsl:value-of select="count(key('nodeAndAttribute', local-name()))"/>
            <xsl:text> times.&#xA;</xsl:text>
        </xsl:if>
        
        <xsl:apply-templates select="*|@*"/>
    </xsl:template>
</xsl:stylesheet>