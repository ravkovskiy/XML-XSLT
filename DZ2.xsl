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
<!--переменна untouched пригодится ниже, она покажет по какой причине i стало больше n-->
    <xsl:param name="untouched" select="0"></xsl:param>
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
<!-- присваивание untouched=1 происходит в блоке otherwise,
        иначе обработаем изменения интервалов: -->
      <xsl:when test="$n &lt; $i and $untouched != 1">
        <xsl:call-template name="for">
          <xsl:with-param name="n" select="$i"/>
          <xsl:with-param name="i" select="$n"/>
        </xsl:call-template>
      </xsl:when>
      
      <xsl:when test="$n &gt; $maxNumCd">
        <xsl:call-template name="for">
          <xsl:with-param name="n" select="$maxNumCd"/>
          <xsl:with-param name="i" select="$i"/>
        </xsl:call-template>
      </xsl:when>
      
  <!-- более 297 каталогов приводит к перегрузке -->
     <xsl:when test="$n &gt; 297">
       <xsl:call-template name="for">
         <xsl:with-param name="i" select="$i"/>
         <xsl:with-param name="n" select="297"/>
       </xsl:call-template>
       Выведено 297 каталогов из <xsl:value-of select="$maxNumCd"/>
     </xsl:when>
      
      <xsl:otherwise>
        <xsl:if test="$i &lt;= $n ">
          <xsl:copy-of select="/catalog/cd[$i]"/>
          <xsl:call-template name="for">
            <xsl:with-param name="i" select="$i+1"/>
            <xsl:with-param name="untouched" select="1"/>
            <xsl:with-param name="n" select="$n"></xsl:with-param>
          </xsl:call-template>
        </xsl:if>
      </xsl:otherwise>
      
    </xsl:choose>
    
  </xsl:template>

</xsl:stylesheet>