<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!-- Входной файл будет вида :
    <?xml version="1.0" encoding="UTF-8"?>
<cor>
    <string>smart git</string>
    <substr> git</substr>
    <substitute>phone</substitute>
</cor>
    -->
   <xsl:template match="/cor">
       <xsl:call-template name="replaceString"/>
   </xsl:template>
   
    <xsl:template name="replaceString">
        <xsl:param name="resultString" select="string/text()"/>
        <xsl:choose>
            <xsl:when test="contains($resultString, substr)">
                <xsl:call-template name="replaceString">
                    <xsl:with-param name="resultString" select="concat(substring-before($resultString, substr), substitute, substring-after($resultString, substr))"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:value-of select="$resultString"/>  
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>