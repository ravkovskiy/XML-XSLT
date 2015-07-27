<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

	<xsl:template match="/">
		<ul>	
			<xsl:call-template name="split">	
				<xsl:with-param name="str_to_split" select="data/text()"/>	
			</xsl:call-template>
		</ul>	
	</xsl:template>

	<xsl:template name="split">
		<xsl:param name="str_to_split"/>
		<xsl:variable name="razdel" select="';'"/>			
		
		<xsl:choose>
    		<xsl:when test="contains($str_to_split, $razdel)">
	      		<li><xsl:value-of select="substring-before($str_to_split, $razdel)"/></li>
	      		<xsl:call-template name="split">
	        		<xsl:with-param name="str_to_split" select="substring-after($str_to_split, $razdel)"/>
	             </xsl:call-template>
    		</xsl:when>
    		<xsl:otherwise>
		      	<li><xsl:value-of select="$str_to_split"/></li>
		    </xsl:otherwise>
  		</xsl:choose>
	
	</xsl:template>

</xsl:stylesheet><!-- Stylus Studio meta-information - (c)1998-2004. Sonic Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="variables.xml" htmlbaseurl="" outputurl="" processortype="xalan" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition></MapperMetaTag>
</metaInformation>
-->