<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:template match='text()'>
      Количество пробельных символов в строке: <xsl:value-of select="string-length(.) - string-length(translate(., '&#x9;&#xa;&#xd; &#x20;', ''))"/>
    </xsl:template>
</xsl:stylesheet>