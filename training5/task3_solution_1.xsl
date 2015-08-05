<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:template match="menu">
        <xsl:copy>
            <xsl:apply-templates select="item[@level=1]"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="item">
        <xsl:copy>
            <xsl:copy-of select="@id|node()"/>            
            <xsl:variable name="level"><xsl:value-of select="@level"/></xsl:variable>
            <xsl:variable name="id"><xsl:value-of select="following-sibling::item[@level=$level][1]/@id"/></xsl:variable>
            <xsl:apply-templates select="following-sibling::item[(@level=$level+1) and (@id &lt; $id or $id = '')]"/>
        </xsl:copy>        
    </xsl:template>    
    
</xsl:stylesheet>