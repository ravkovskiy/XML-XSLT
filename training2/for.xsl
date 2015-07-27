<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <xsl:call-template name="for">
      <xsl:with-param name="n" select="12"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="for">
    <xsl:param name="i" select="0"/>
    <xsl:param name="n"/>

    <xsl:if test="$i &lt; $n">
      
        <xsl:value-of select="'*'"/>      

      <xsl:call-template name="for">
        <xsl:with-param name="i" select="$i + 1"/>
        <xsl:with-param name="n" select="$n"/>
      </xsl:call-template>

    </xsl:if>

  </xsl:template>

</xsl:stylesheet><!-- Stylus Studio meta-information - (c)1998-2004. Sonic Software Corporation. All rights reserved.
<metaInformation>
<scenarios ><scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="variables.xml" htmlbaseurl="" outputurl="" processortype="internal" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext=""/></scenarios><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no" ><SourceSchema srcSchemaPath="variables.xml" srcSchemaRoot="data" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/></MapperInfo><MapperBlockPosition><template match="/"><block path="xsl:call&#x2D;template" x="257" y="0"/></template><template name="for"><block path="xsl:if/<[0]" x="261" y="0"/><block path="xsl:if" x="307" y="0"/><block path="xsl:if/xsl:value&#x2D;of" x="257" y="0"/><block path="xsl:if/xsl:call&#x2D;template" x="217" y="0"/></template></MapperBlockPosition></MapperMetaTag>
</metaInformation>
-->