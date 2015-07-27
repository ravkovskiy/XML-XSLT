<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes"/>
  <xsl:template match="/">
    
     <xsl:call-template name="for">
       <xsl:with-param name="i" select="1"/>
       <xsl:with-param name="n" select="count(/catalog/cd)"/>
    
     </xsl:call-template>
    
  </xsl:template>
  
  <xsl:template name='for'>
    
    <xsl:param name="i" select="1"/>
    <xsl:param name="n" select="count(/catalog/cd)"/>
    <xsl:param name="untouched" select="0"></xsl:param>
    
    <xsl:choose>
      <xsl:when test="$n &lt; $i and $untouched != 1">
        ВЫПОЛНИЛОСЬ 1
        <xsl:call-template name="for">
          <xsl:with-param name="n" select="$i"/>
          <xsl:with-param name="i" select="$n"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$n &gt; count(/catalog/cd)">
        ВЫПОЛНИЛОСЬ 2
        <xsl:call-template name="for">
          <xsl:with-param name="n" select="count(/catalog/cd)"/>
          <xsl:with-param name="i" select="$i"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$n &lt;= 0">
        Внимание! Параметр n не может быть меньше или равен нулю!
      </xsl:when>
      <xsl:when test="$i &lt;= 0">
        Внимание! Параметр i не может быть меньше или равен нулю!
      </xsl:when>
      <xsl:when test="count(/catalog/cd) &gt; 298">
        <xsl:call-template name="for">
          <xsl:with-param name="n" select="298"/>
          <xsl:with-param name="i" select="$i"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        ВЫПОЛНИЛОСЬ 3
        ////
        <xsl:value-of select="$i"/>
        <xsl:if test="$i &lt;= $n ">
          <xsl:copy-of select="catalog/cd[$i]"/>
          
          <xsl:call-template name="for">
            <xsl:with-param name="i" select="$i+1"/>
            <xsl:with-param name="untouched" select="'1'"></xsl:with-param>
          </xsl:call-template>
          
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>