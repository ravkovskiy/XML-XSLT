<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:output method="xml" indent="yes"/>
	<!-- Так как много раз придется работать с атрибутом @level будем
		использовать ключ -->
	<xsl:key name="level" match="/menu/item" use="@level"/>
	<xsl:template match="/">
		<!-- Заменим корневой узел тегом <menu> и вызовем шаблон для
			обработки элементов -->
		<menu>
			<xsl:call-template name="output"/>
		</menu>
	</xsl:template>
	<xsl:template name="output">
		<xsl:param name="id1" select="1"/>
		<xsl:param name="id2" select="999999"/>
		<xsl:param name="level" select="1"/>
		<xsl:for-each select="key('level', $level)[@id &gt;= $id1][@id &lt;= $id2]">
			<xsl:element name="item">
				<xsl:attribute name="id">
					<xsl:value-of select="@id"/>
				</xsl:attribute>
				<xsl:element name="name">
					<xsl:value-of select="name/text()"/>
				</xsl:element>
				<!-- Рассмотрим два варианта: 1) справа есть необработанные соседи такого
					же уровня 2) нет + есть ли при этом относящийся к текущему
				элементу сосед более низкого уровня -->
				<xsl:choose>
					<xsl:when test="key('level', $level + 1)[@id &gt; $id1][@id &lt; $id2] and following-sibling::*[@level = $level][1]">
						<xsl:call-template name="output">
							<xsl:with-param name="level" select="$level + 1"/>
							<xsl:with-param name="id1" select="@id"/>
							<xsl:with-param name="id2" select="following-sibling::*[@level = $level ][1]/@id"></xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="key('level', $level + 1)[@id &gt; $id1][@id &lt; $id2]">
						<xsl:call-template name="output">
							<xsl:with-param name="level" select="$level + 1"/>
							<xsl:with-param name="id1" select="@id"/>
							<xsl:with-param name="id2" select="999999"></xsl:with-param>
						</xsl:call-template>
					</xsl:when>
				</xsl:choose>
			</xsl:element>
		</xsl:for-each>
		<!-- Обработку ситуации с уровнем ниже, чем на один пока сделать не успел -->
	</xsl:template>
</xsl:stylesheet>
