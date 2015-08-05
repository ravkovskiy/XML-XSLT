<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
   <xsl:template match="string">
       <xsl:copy>
       <xsl:call-template name="for">
           <xsl:with-param name="i" select="string-length(text())"/>
       </xsl:call-template>
       </xsl:copy>
   </xsl:template>
    
    <xsl:template name="for">
        <xsl:param name="n" select="0"/>
        <xsl:param name="i"/>
        <xsl:param name="string"/>
        
        <xsl:if test="$i &gt; $n">    
            <xsl:call-template name="for">
                <xsl:with-param name="i" select="$i - 1"/>
                <xsl:with-param name="string" select="concat($string, substring(text(), $i, 1))"/>
            </xsl:call-template>
        </xsl:if>
        <xsl:if test="$i &lt;= $n">
            <xsl:value-of select="$string"/>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>