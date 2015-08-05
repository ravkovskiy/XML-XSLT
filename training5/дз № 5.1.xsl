<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!-- С помощью этого способа можно и "Войну и мир" инвертировать (но только в Saxon-е)
    пробовал запускать на стареньком-стареньком компе, так он 409000 символов
    (эквивалентно половине 3-го тома) преобразовал за 30 минут. Если сравнить
    с моим ноутбуком помощнее: так этот 200000 символов перевернул за 5 минут.
    Пробовал и несколько миллионов символов крутить, никаких ошибок и предупреждений
    не выскакивает, обрабатывает, нужно только много времени)-->
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
        
        <xsl:if test="$i &gt; $n">
            <xsl:value-of select="substring(text(), $i, 1)"/>      
            <xsl:call-template name="for">
                <xsl:with-param name="i" select="$i - 1"/>
            </xsl:call-template>
        </xsl:if>
        <!-- Шаблоны простенькие. Для разнообразия написал еще файл "дз №5.1-2", в котором
        используется функция concat, но при больших строчках (длиной более 298 символов)
        память переполняется, да еще и работает медленнее этого варианта, несмотря на множественные
        вставки в результируещее дерево.-->
    </xsl:template>
</xsl:stylesheet>