<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes"/>
  
  <xsl:template match="/">
     <xsl:call-template name="piz">
       <xsl:with-param name="i" select="1"/>
       <xsl:with-param name="n" select="count(/catalog/cd)"/>
     </xsl:call-template>
  </xsl:template>
  
  <xsl:template name='piz'>
    
    <xsl:param name="i" select="1"/>
    <xsl:param name="n" select="count(/catalog/cd)"/>
    <xsl:param name="cd" select="/catalog/cd"></xsl:param>
    <xsl:variable name="maxNumCd" select="count(/catalog/cd)"/>
    
    <xsl:choose>
<!-- для начала обработаем неприятные изменения интервалов  -->
      <xsl:when test="$n &lt;= 0">
        Внимание! Параметр n не может быть меньше или равен нулю!
      </xsl:when>
      
      <xsl:when test="$i &lt;= 0">
        Внимание! Параметр i не может быть меньше или равен нулю!
      </xsl:when>
      
      <xsl:when test="$n &gt; $maxNumCd and $i &gt; $maxNumCd">
        Уменьшите значения n и i!
      </xsl:when>

      <xsl:when test="$n &lt; $i">
        <xsl:call-template name="piz">
          <xsl:with-param name="n" select="$i"/>
          <xsl:with-param name="i" select="$n"/>
        </xsl:call-template>
      </xsl:when>
      
      <xsl:when test="$n &gt; $maxNumCd">
        <xsl:call-template name="piz">
          <xsl:with-param name="n" select="$maxNumCd"/>
          <xsl:with-param name="i" select="$i"/>
        </xsl:call-template>
      </xsl:when>
      
  <!-- Так как метод Пиза нормально обрабатывается процессором при
   $allCd > 15000 не будем ограничивать количество выводимых каталогов cd -->
      
      <xsl:otherwise>
          <xsl:for-each select="$cd[position() &gt;= $i and position() &lt;= $n]">
            <xsl:copy-of select="."/>
          </xsl:for-each>
      </xsl:otherwise>
      
    </xsl:choose>
    
  </xsl:template>

</xsl:stylesheet>