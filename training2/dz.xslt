<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:output method="xml" indent="yes"/>
	
	<xsl:template match="/">
		<xsl:element name="menu">
			<xsl:call-template name="level"/>
		</xsl:element>
		
	</xsl:template>
	
	<xsl:template name='level'>
		
		<xsl:param name="level" select="1"/>
		<xsl:param name="i" select="1"></xsl:param>
		<xsl:param name="count" select="count(/menu/item[@level = 1])"/>
		
		<xsl:choose>
			<xsl:when test="$level = 1">
				<xsl:call-template name="for">
					<xsl:with-param name="level" select="$level"/>
				</xsl:call-template>
			</xsl:when>
			
			<xsl:otherwise>
				<xsl:call-template name="for">
					<xsl:with-param name="level" select="$level"/>
					<xsl:with-param name="i" select="$i"/>
					<xsl:with-param name="count" select="$count"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
		
	</xsl:template>
	
	<xsl:template name="for">
		
		<xsl:param name="level" select="1"/>
		<xsl:param name="i" select="1"/>
		<xsl:param name="count" select="count(/menu/item[@level = 1])"/>
		
		<xsl:choose>
			<xsl:when test="$i &lt;= $count">
				<xsl:value-of select="($i = $count) and not(count(/menu/item[@level = $level][@id &gt; /menu/item[@level = $level][$i]/@id]))"/>
				<xsl:element name="item">
					
					<xsl:attribute name="id">
						
						<xsl:value-of select="/menu/item[@level = $level][$i]/@id"/>
					</xsl:attribute>
					<xsl:choose>
						<xsl:when test="($i = $count) and not(count(/menu/item[@level = $level][@id &gt; /menu/item[@level = $level][$i]/@id])) and count(
							/menu/item[@level = $level + 1][@id &gt; /menu/item[@level = $level][$i]/@id])">
							<xsl:call-template name="level">
								<xsl:with-param name="level" select="$level + 1"/>
								<xsl:with-param name="i" select="1"/>
								<xsl:with-param name="count" select="count(
									/menu/item[@level = $level + 1][@id &gt; /menu/item[@level = $level][$i]/@id])"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:when test="not(count(/menu/item[@level = $level + 1][@id &gt; /menu/item[@level = $level][$i]/@id]
							[@id &lt; /menu/item[@level = $level][$i + 1]/@id]))"></xsl:when>
						
						
						
						<xsl:when test="count(/menu/item[@level = $level + 1][@id &gt; /menu/item[@level = $level][$i]/@id]
							[@id &lt; /menu/item[@level = $level][$i + 1]/@id])">
							<xsl:call-template name="level">
								<xsl:with-param name="level" select="$level + 1"/>
								<xsl:with-param name="i" select="1"/>
								<xsl:with-param name="count" select="count(
									/menu/item[@level = $level + 1][@id &gt; /menu/item[@level = $level][$i]/@id]
									[@id &lt; /menu/item[@level = $level][$i + 1]/@id])"/>
							</xsl:call-template>
						</xsl:when>
						
					</xsl:choose>
					
				</xsl:element>
				<xsl:call-template name="for">
					<xsl:with-param name="level" select="$level"/>
					<xsl:with-param name="i" select="$i + 1"/>
					<xsl:with-param name="count" select="$count"/>
				</xsl:call-template>
			</xsl:when>
			
			
		</xsl:choose>
		
	</xsl:template>
</xsl:stylesheet>
