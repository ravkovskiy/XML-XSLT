<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="xml" indent="yes"/>
	
	<xsl:template match="node()|@*">
		<xsl:copy>
			<xsl:apply-templates select="node()|@*"/>
		</xsl:copy>
		
	</xsl:template>
	<!-- example1:     /AAA     /AAA/CCC     /AAA/DDD/BBB -->
	<!-- example2:     //BBB     //DDD/BBB -->
	
	<!-- example3:     /AAA/CCC/DDD/*     /*/*/*/BBB     //* -->
	<!-- example4:     /AAA/BBB[1]     /AAA/BBB[last()] -->
	<!-- example5:     /*/*/*/BBB     //BBB[@id]     //BBB[@name]     //BBB[@*]     //BBB[not(@*)] -->
	<!-- example6:     //BBB[@id='b1']     //BBB[@name='bbb']     //BBB[normalize-space(@name)='bbb'] -->
	<xsl:template match="">
		<xsl:copy>
			<xsl:attribute name="selected">true</xsl:attribute>
		</xsl:copy>
		<xsl:apply-templates/>
	</xsl:template>
	
	<!-- example5:     //@id -->
	<!--<xsl:template match="//@id">
		<xsl:copy/>
		****
		<xsl:apply-templates/>
	</xsl:template>-->
	
</xsl:stylesheet>
