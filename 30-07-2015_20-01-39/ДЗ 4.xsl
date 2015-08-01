<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:output method="xml" indent="yes"/>

<xsl:template match="/">
	<xsl:call-template name="numDay"/>	
</xsl:template>
	
	<xsl:template name="numDay">
		<xsl:variable name="dopdni" select="((date/year - 1940) - ((date/year - 1940) mod 4)) div 4 + 1"/>
	<xsl:value-of select="$dopdni"/>
		<xsl:choose>
			<xsl:when test="date/month = 1">
				<xsl:text>Номер дня:</xsl:text>
				<xsl:choose>
					<xsl:when test="date/year mod 4">
						<xsl:choose>
							<xsl:when test="(((date/year - 1940) * 365 + $dopdni + date/day) mod 7) = 0">7</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="(((date/year - 1940) * 365 + $dopdni + date/day) mod 7) "/>
							</xsl:otherwise>
						</xsl:choose>
						
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="(((date/year - 1940) * 365 + $dopdni + date/day - 1) mod 7) = 0">7</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="(((date/year - 1940) * 365 + $dopdni + date/day - 1) mod 7) "/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>

			</xsl:when>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
