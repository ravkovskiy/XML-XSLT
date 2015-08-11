<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="text"/>
	<xsl:key name="elemname_group" match="*|@*" use="local-name(.)"/>
	
	
	<xsl:key name="surname_group" match="item" use="substring(text(), 1,1)"/>

	<xsl:template match="list">
		<xsl:apply-templates select="item[generate-id(.)=generate-id(key('surname_group',substring(text(),1,1)))]">
			<xsl:sort select="text()"/>
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template match="item">
		<xsl:value-of select="substring(text(), 1,1)"/>
		<xsl:text>&#xA;</xsl:text>
		<xsl:for-each select="key('surname_group',substring(text(), 1,1))">
			<xsl:sort select="."/>
			<xsl:value-of select="."/>
			<xsl:text>&#xA;</xsl:text>
		</xsl:for-each>
	</xsl:template>
	

	<xsl:template match="/">
		<xsl:apply-templates select="*[generate-id(.)=generate-id(key('elemname_group',local-name(.)))]|@*[generate-id(.)=generate-id(key('elemname_group',local-name(.)))]"/>	
	</xsl:template>
	
	<xsl:template match="*|@*">
		<xsl:value-of select="concat('Node ', string(local-name(.)), ' found ', string(count(key('elemname_group',local-name(.)))), ' times')"/>
		<xsl:text>&#xA;</xsl:text>
		<xsl:apply-templates select="*[generate-id(.)=generate-id(key('elemname_group',local-name(.)))]|@*[generate-id(.)=generate-id(key('elemname_group',local-name(.)))]"/>
	</xsl:template>

</xsl:stylesheet>

