<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:output method="xml" indent="yes"/>
	<!-- Так как много раз придется работать с атрибутом @level будем
		использовать ключ -->
	<xsl:key name="level" match="/menu/item" use="@level"/>
	
	<xsl:template match="/">
		<!-- Заменим корневой узел тегом <menu> и вызовем шаблон для
			обработки элементов первого уровня -->
		<menu>
			<xsl:call-template name="level1"/>
		</menu>
	</xsl:template>
	<!-- Шаблон для элементов первого уровня -->
	<xsl:template name="level1">
		<xsl:param name="level" select="1"></xsl:param>
		<xsl:for-each select="key('level', $level)">
			<xsl:element name="item">
				<xsl:attribute name="id">
					<xsl:value-of select="./@id"/>
				</xsl:attribute>
				<xsl:element name="name">
					<xsl:value-of select="name/text()"/>
				</xsl:element>
				<!-- Два варианта: 1) необработанные соседи 1 уровня есть 2) нет 
				в зависимости от этого установим предел id1 и id2 в который зайдем
				для поиска элементов более низкого уровня-->
				<xsl:choose>
					<xsl:when test="following-sibling::*[@level = $level][1]/@id">
						<xsl:call-template name="leveln">
							<xsl:with-param name="id1" select="./@id"/>
							<xsl:with-param name="id2" select="following-sibling::*[@level = $level][1]/@id"/>
							<xsl:with-param name="level" select="$level + 1"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="leveln">
							<xsl:with-param name="id1" select="./@id"/>
							<xsl:with-param name="id2" select="999999"/>
							<xsl:with-param name="level" select="$level + 1"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
		</xsl:for-each>
	</xsl:template>
	<!-- А вот шаблон leveln используется для вывода элементов уровня ниже 1-го
	он работает по принципу предыдущего, только рекурсивно-->
	<xsl:template name="leveln">
		<xsl:param name="id1"/>
		<xsl:param name="id2"/>
		<xsl:param name="level" select="2"/>
		<xsl:for-each select="key('level', $level)[@id &gt; $id1][@id &lt; $id2]">
			<xsl:element name="item">
				<xsl:attribute name="id">
					<xsl:value-of select="./@id"/>
				</xsl:attribute>
				<xsl:element name="name">
					<xsl:value-of select="name/text()"/>
				</xsl:element>
				<xsl:choose>
					<xsl:when test="key('level', $level + 1)[@id &gt; $id1][@id &lt; $id2] and following-sibling::*[@level = $level][1]/@id">
						<xsl:call-template name="leveln">
							<xsl:with-param name="level" select="$level + 1"/>
							<xsl:with-param name="id1" select="./@id"/>
							<xsl:with-param name="id2" select="following-sibling::*[@level = $level ][1]/@id"></xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="key('level', $level + 1)[@id &gt; $id1][@id &lt; $id2]">
						<xsl:call-template name="leveln">
							<xsl:with-param name="level" select="$level + 1"/>
							<xsl:with-param name="id1" select="./@id"/>
							<xsl:with-param name="id2" select="999999"></xsl:with-param>
						</xsl:call-template>
					</xsl:when>
				</xsl:choose>
			</xsl:element>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
