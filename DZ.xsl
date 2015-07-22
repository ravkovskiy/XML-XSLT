<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
   <xsl:template match="/"> 
       <catalog>
       
              <xsl:for-each select="catalog/cd">
                  <xsl:sort select="year"/>
                  
                  <cd>
                      
                  
                  <xsl:for-each select="*">
                      
                  
                  <xsl:choose>
                      <xsl:when test="name() = 'artist'">
                          <artistname><xsl:value-of select="text()"/></artistname>
                      </xsl:when>
                      <xsl:otherwise>
                          <xsl:copy-of select="."/>
                      </xsl:otherwise>
                  </xsl:choose>
                  
              </xsl:for-each>
                  </cd>       
              </xsl:for-each>                 
       </catalog>        
    </xsl:template>
    <xsl:template match="/catalog/ cd">
        
    </xsl:template>
</xsl:stylesheet>
