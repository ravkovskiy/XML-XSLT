<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <!-- По аналогии с файлом 5.1 пробигаем по каждому символу строки.
        Если этот символ - число, то выводим его. Таким образом конечный результат
        полностью удовлетворяет условию задания-->
    
    <!-- Глобальную переменную создадим для оптимизации выполнения шаблона for -->
    <xsl:variable name="stringLength" select="string-length(/string/text())"/>
    
    <xsl:template match="string">
        <xsl:copy>
            <xsl:call-template name="for"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template name="for">
        <xsl:param name="i" select="1"/>
        <xsl:param name="n" select="$stringLength"/>
        <xsl:variable name="sub" select="number(substring(text(), $i, 1))"/>
        
        <xsl:if test="$i &lt;= $n">
            <xsl:if test="$sub = $sub">
                <xsl:value-of select="$sub"/>
            </xsl:if>
                  
            <xsl:call-template name="for">
                <xsl:with-param name="i" select="$i + 1"/>
            </xsl:call-template>
        </xsl:if>
        
    </xsl:template>
</xsl:stylesheet>