<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:output method="xml" indent="yes"/>
	
	<xsl:template match="/">
		<xsl:variable name="var1" select="1"/>		
		<xsl:variable name="var2"><items><item>2</item></items></xsl:variable>
		<xsl:variable name="var3"/>
		<xsl:variable name="var4" select="'41'">42</xsl:variable>
		
		<var1><xsl:value-of select="$var1"/></var1>

		<var2><xsl:value-of select="$var2"/></var2>
		<var2><xsl:copy-of select="$var2"/></var2>

		<var3><xsl:value-of select="$var3"/></var3>
		<var4><xsl:value-of select="$var4"/></var4>
		
	</xsl:template>
	
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c)1998-2004. Sonic Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\Unit1.Templates\cdcatalog.xml" htmlbaseurl="" outputurl="" processortype="saxon6" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition></MapperMetaTag>
</metaInformation>
-->