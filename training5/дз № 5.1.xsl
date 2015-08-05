<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:variable name="stringLength" select="string-length(.)"/>
    
   <xsl:template match="string">
       <xsl:copy>
       <xsl:call-template name="for">
           <xsl:with-param name="i" select="$stringLength"/>
       </xsl:call-template>
       </xsl:copy>
   </xsl:template>
    
    <xsl:template name="for">
        <xsl:param name="n" select="0"/>
        <xsl:param name="i"/>
        
        <xsl:if test="$i &gt; $n">
            <xsl:value-of select="substring(., $i, 1)"/>      
            <xsl:call-template name="for">
                <xsl:with-param name="i" select="$i - 1"/>
            </xsl:call-template>
        </xsl:if>
        
    </xsl:template>
</xsl:stylesheet>