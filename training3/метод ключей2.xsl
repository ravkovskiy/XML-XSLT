<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
	<xsl:output method="xml" indent="yes"/>
	<xsl:key name="level" match="/menu/item" use="@level"/>
	
	<xsl:template match="/">
		<menu>
			<xsl:call-template name="level1">
				
			</xsl:call-template>
		</menu>
	</xsl:template>
	
	<xsl:template name="level1">
		<xsl:param name="level" select="1"></xsl:param>
		<xsl:for-each select="key('level', $level)">
			<xsl:element name="item">
				<xsl:attribute name="id">
					<xsl:value-of select="./@id"/>
				</xsl:attribute>
				<xsl:element name="name">
					<xsl:value-of select="name/text()"/>
				</xsl:element>
				<xsl:choose>
					<xsl:when test="following-sibling::*[@level = $level][1]/@id">
						<xsl:call-template name="level2">
							<xsl:with-param name="id1" select="./@id"/>
							<xsl:with-param name="id2" select="following-sibling::*[@level = $level][1]/@id"/>
							<xsl:with-param name="level" select="$level + 1"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="level2">
							<xsl:with-param name="id1" select="./@id"/>
							<xsl:with-param name="id2" select="999999"/>
							<xsl:with-param name="level" select="$level + 1"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
				
			</xsl:element>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template name="level2">
		<xsl:param name="id1"/>
		<xsl:param name="id2"/>
		<xsl:param name="level" select="2"/>
		<xsl:param name="n" select="2"></xsl:param>
		
		<xsl:for-each select="key('level', $level)[@id &gt; $id1][@id &lt; $id2]">
			<xsl:element name="item">
				<xsl:attribute name="id">
					<xsl:value-of select="./@id"/>
				</xsl:attribute>
				<xsl:element name="name">
					<xsl:value-of select="name/text()"/>
				</xsl:element>
				<xsl:choose>
					<xsl:when test="key('level', $level + 1)[@id &gt; $id1][@id &lt; $id2] and following-sibling::*[@level = $level][1]/@id">
						<xsl:call-template name="level2">
							<xsl:with-param name="level" select="$level + 1"/>
							<xsl:with-param name="id1" select="./@id"/>
							<xsl:with-param name="id2" select="following-sibling::*[@level = $level ][1]/@id"></xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="key('level', $level + 1)[@id &gt; $id1][@id &lt; $id2]">
						<xsl:call-template name="level2">
							<xsl:with-param name="level" select="$level + 1"/>
							<xsl:with-param name="id1" select="./@id"/>
							<xsl:with-param name="id2" select="999999"></xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="/menu/item[@level &gt; $level + 1][@id &gt; $id1][@id &lt; $id2]">
						<xsl:call-template name="level2">
							<xsl:with-param name="level" select="@level"/>
							<xsl:with-param name="id1" select="./@id"/>
							<xsl:with-param name="id2" select="99"/>
						</xsl:call-template>
					</xsl:when>
				</xsl:choose>
				
			</xsl:element>
		</xsl:for-each>
	</xsl:template>	
</xsl:stylesheet>
