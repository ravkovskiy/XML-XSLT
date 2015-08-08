<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output indent="yes"/>
    <xsl:template match="*">
        <xsl:copy>
        <xsl:for-each select="item[not(@class=preceding-sibling::item/@class)]">
            <xsl:sort select="@class"/>
            <xsl:variable name="class" select="@class"/>
            <xsl:element name="{$class}">
                <xsl:for-each select="../item">
                    <xsl:sort select="."/>
                    <xsl:if test="@class = $class">
                        <xsl:copy-of select="."/>
                    </xsl:if>
                </xsl:for-each>
            </xsl:element>
        </xsl:for-each>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>