<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
   <xsl:template match="string">
       <xsl:copy>
       <xsl:apply-templates/>
       </xsl:copy>
   </xsl:template>
    
    <xsl:template match='text()'>
        <xsl:value-of select="translate(., 'abcdefghijklmnopqrstuvwxyzабвгдеёжзийклмнопрстуфхцчшщьыъэюя', 'ABCDEFGHIJKLMNOPQRSTUVWXYZАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЬЫЪЭЮЯ')"/>
    </xsl:template>
</xsl:stylesheet>