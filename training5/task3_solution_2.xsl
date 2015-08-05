<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="xml" indent="yes"/>
	
	<xsl:template match="menu">
		<xsl:copy>
			<xsl:apply-templates select="item[@level=1]"/>
		</xsl:copy>
	</xsl:template>
	
	<xsl:variable name="count_item" select="count(//item)"/>
	
	<xsl:template match="item">
		<xsl:variable name="level" select="@level"/>
		<xsl:variable name="pos_level"
			select="$count_item - count(following-sibling::*[@level = $level][1]/following-sibling::*)"/>
		<xsl:copy>
			<xsl:copy-of select="@id|node()"/>
			<xsl:if test="following-sibling::*[1][@level = $level + 1]">
				<xsl:apply-templates
					select="following-sibling::*[@level = $level + 1 and @id &lt;= $pos_level]"/>
			</xsl:if>
		</xsl:copy>
	</xsl:template>
	
</xsl:stylesheet>
