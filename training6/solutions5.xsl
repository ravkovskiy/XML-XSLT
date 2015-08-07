<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	
	<xsl:template match="/">
		<xsl:call-template name="reverse2">
			<xsl:with-param name="input" select="''"></xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	
	
	<xsl:template name="reverse">
		<xsl:param name="input"/>
		<xsl:variable name="length" select="string-length($input)"/>
		<xsl:choose>
			<xsl:when test="$length &lt; 2">
				<xsl:value-of select="$input"/>
			</xsl:when>
			<xsl:when test="$length = 2">
				<xsl:value-of select="substring($input, 2, 1)"/>
				<xsl:value-of select="substring($input, 1, 1)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="mid" select="floor($length div 2)"/>
				<xsl:call-template name="reverse">
					<xsl:with-param name="input" select="substring($input, $mid+1, $mid+1)"/>
				</xsl:call-template>
				<xsl:call-template name="reverse">
					<xsl:with-param name="input" select="substring($input, 1, $mid)"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>		
	</xsl:template>

	<xsl:template name="reverse2">
		<xsl:param name="input"/>
		<xsl:variable name="length" select="string-length($input)"/>
		<xsl:choose>
			<xsl:when test="$length &gt; 1">
				<xsl:value-of select="substring($input,$length,1)"/>
				<xsl:call-template name="reverse2">
					<xsl:with-param name="input" select="substring($input,1,$length - 1)"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$input"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	
	<xsl:template name="remove_digits">
		<xsl:param name="input"/>
		<xsl:value-of select="translate($input, '1234567890','')"/>
	</xsl:template>
	
	<xsl:template name="remove_symbols">
		<xsl:param name="input"/>
		<xsl:value-of select="translate($input,translate($input,'1234567890',''),'')"/>
	</xsl:template>
	
	<xsl:template name="upper_case">
		<xsl:param name="input"/>
		<xsl:value-of select="translate($input,'abcdefghijklmnopqrstuvwxyz',
			'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
	</xsl:template>
	
	<xsl:template name="space_count">
		<xsl:param name="input"/>
		<xsl:value-of select="string-length($input) - string-length(translate($input,'',''))"/>
	</xsl:template>
	
	<xsl:template name="replace">
		<xsl:param name="input"/>
		<xsl:param name="search_string"/>
		<xsl:param name="replace_string"/>
		<xsl:choose>
			<xsl:when test="$search_string and contains($input, $search_string)">
				<xsl:value-of select="substring-before($input, $search_string)"/>
				<xsl:value-of select="$replace_string"/>
				<xsl:call-template name="replace">
					<xsl:with-param name="input" select="substring-after($input, $search_string)"/>
					<xsl:with-param name="search_string" select="$search_string"/>
					<xsl:with-param name="replace_string" select="$replace_string"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$input"/>
			</xsl:otherwise>
		</xsl:choose>
		
	</xsl:template>
	
</xsl:stylesheet>
