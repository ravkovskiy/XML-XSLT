<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:output method="xml" indent="yes"/>
	
	<xsl:template match="/">
		<xsl:call-template name="day-name">
			<xsl:with-param name="day-number" select="1"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="day-name">
		<xsl:param name="day-number" select="0"/>
		<xsl:choose>
			<xsl:when test="$day-number = 1">Mon</xsl:when>
			<xsl:when test="$day-number = 2">Tue</xsl:when>
			<xsl:when test="$day-number = 3">Wed</xsl:when>
			<xsl:when test="$day-number = 4">Thu</xsl:when>
			<xsl:when test="$day-number = 5">Fri</xsl:when>
			<xsl:when test="$day-number = 6">Sat</xsl:when>
			<xsl:when test="$day-number = 7">Sun</xsl:when>
			<xsl:otherwise>Hmmm....</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c)1998-2004. Sonic Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\Unit1.Templates\cdcatalog.xml" htmlbaseurl="" outputurl="" processortype="saxon8" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition></MapperMetaTag>
</metaInformation>
-->