<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:output method="xml" indent="yes"/>

<xsl:template match="/">
	Дата: <xsl:value-of select="date/day"/>.<xsl:value-of select="date/month"/>.<xsl:value-of select="date/year"/> г.
	<xsl:call-template name="numDay"/>
	<xsl:call-template name="numDayInMonth"/>	
</xsl:template>
	
<!-- Шаблон numDay рассчитывает номер дня начиная с 1941 года, думаю для решения домашнего
задания этого будет достаточно. Если же нет, стартовую точку легко изменить.-->
	<xsl:template name="numDay">
		
		<xsl:param name="check" select="0"/>
		<!-- параметр check проверяет: впервые ли мы зашли в шаблон -->
		<xsl:param name="priorDate" select="0"/>
		<!-- Параметр priorDate будет хранить количество дней от начала года до начала месяца даты -->
		<xsl:variable name="month" select="date/month"/>
		<xsl:variable name="year" select="date/year"/>
		<xsl:variable name="additDays" select="(($year - 1940 - 1) - (($year - 1940 - 1) 
			mod 4)) div 4 + 1"/>
		<!-- Параметр additDays определяет количество високосных лет от 1940 до года даты -->
		<xsl:choose>
			<xsl:when test="$check = 0">
				<!-- Если check = 0, то рассчитываем priorDate и запускаем шаблон снова,
				для вывода номера дня недели ( отсылаем check = 1 )-->
				<xsl:choose>
					<xsl:when test="$month = 1">
						<xsl:call-template name="numDay">
							<xsl:with-param name="check" select="1"/>
							<xsl:with-param name="priorDate" select="0"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="$month = 2">
						<xsl:call-template name="numDay">
							<xsl:with-param name="check" select="1"/>
							<xsl:with-param name="priorDate" select="31"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="($month = 3) and ($year mod 4)">
						<xsl:call-template name="numDay">
							<xsl:with-param name="check" select="1"/>
							<xsl:with-param name="priorDate" select="59"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="($month = 3) and not($year mod 4)">
						<xsl:call-template name="numDay">
							<xsl:with-param name="check" select="1"/>
							<xsl:with-param name="priorDate" select="60"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="($month = 4) and ($year mod 4)">
						<xsl:call-template name="numDay">
							<xsl:with-param name="check" select="1"/>
							<xsl:with-param name="priorDate" select="90"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="($month = 4) and not($year mod 4)">
						<xsl:call-template name="numDay">
							<xsl:with-param name="check" select="1"/>
							<xsl:with-param name="priorDate" select="91"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="($month = 5) and ($year mod 4)">
						<xsl:call-template name="numDay">
							<xsl:with-param name="check" select="1"/>
							<xsl:with-param name="priorDate" select="120"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="($month = 5) and not($year mod 4)">
						<xsl:call-template name="numDay">
							<xsl:with-param name="check" select="1"/>
							<xsl:with-param name="priorDate" select="121"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="($month = 6) and ($year mod 4)">
						<xsl:call-template name="numDay">
							<xsl:with-param name="check" select="1"/>
							<xsl:with-param name="priorDate" select="151"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="($month = 6) and not($year mod 4)">
						<xsl:call-template name="numDay">
							<xsl:with-param name="check" select="1"/>
							<xsl:with-param name="priorDate" select="152"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="($month = 7) and ($year mod 4)">
						<xsl:call-template name="numDay">
							<xsl:with-param name="check" select="1"/>
							<xsl:with-param name="priorDate" select="181"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="($month = 7) and not($year mod 4)">
						<xsl:call-template name="numDay">
							<xsl:with-param name="check" select="1"/>
							<xsl:with-param name="priorDate" select="182"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="($month = 8) and ($year mod 4)">
						<xsl:call-template name="numDay">
							<xsl:with-param name="check" select="1"/>
							<xsl:with-param name="priorDate" select="212"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="($month = 8) and not($year mod 4)">
						<xsl:call-template name="numDay">
							<xsl:with-param name="check" select="1"/>
							<xsl:with-param name="priorDate" select="213"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="($month = 9) and ($year mod 4)">
						<xsl:call-template name="numDay">
							<xsl:with-param name="check" select="1"/>
							<xsl:with-param name="priorDate" select="243"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="($month = 9) and not($year mod 4)">
						<xsl:call-template name="numDay">
							<xsl:with-param name="check" select="1"/>
							<xsl:with-param name="priorDate" select="244"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="($month = 10) and ($year mod 4)">
						<xsl:call-template name="numDay">
							<xsl:with-param name="check" select="1"/>
							<xsl:with-param name="priorDate" select="273"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="($month = 10) and not($year mod 4)">
						<xsl:call-template name="numDay">
							<xsl:with-param name="check" select="1"/>
							<xsl:with-param name="priorDate" select="274"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="($month = 11) and ($year mod 4)">
						<xsl:call-template name="numDay">
							<xsl:with-param name="check" select="1"/>
							<xsl:with-param name="priorDate" select="304"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="($month = 11) and not($year mod 4)">
						<xsl:call-template name="numDay">
							<xsl:with-param name="check" select="1"/>
							<xsl:with-param name="priorDate" select="305"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="($month = 12) and ($year mod 4)">
						<xsl:call-template name="numDay">
							<xsl:with-param name="check" select="1"/>
							<xsl:with-param name="priorDate" select="334"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="($month = 12) and not($year mod 4)">
						<xsl:call-template name="numDay">
							<xsl:with-param name="check" select="1"/>
							<xsl:with-param name="priorDate" select="335"/>
						</xsl:call-template>
					</xsl:when>
				</xsl:choose>
			</xsl:when>
			
			<xsl:otherwise>
				Номер дня:<xsl:value-of select="(($year - 1940 - 1)*365 + $priorDate + 
					$additDays + date/day) mod 7 + 1"/>
			</xsl:otherwise>
			
		</xsl:choose>
	</xsl:template>
	
	<!-- Шаблон для вывода количества дней в месяце -->
	<xsl:template name="numDayInMonth">
		<xsl:variable name="month" select="date/month"/>
		<xsl:choose>
			<xsl:when test="$month = 1 or $month = 3 or $month = 5 
				or $month = 7 or $month = 8 or $month = 10 or $month = 12">
				Всего дней в месяце:<xsl:value-of select="31"/>
			</xsl:when>
			<xsl:when test="($month = 2) and (date/year mod 4)">
				Всего дней в месяце:<xsl:value-of select="28"/>
			</xsl:when>
			<xsl:when test="($month = 2) and not(date/year mod 4)">
				Всего дней в месяце:<xsl:value-of select="29"/>
			</xsl:when>
			<xsl:otherwise>
				Всего дней в месяце:<xsl:value-of select="30"/>
			</xsl:otherwise>
			<!-- В данном шаблоне я не делал проверку на корректность данных входящего файла,
				в реальных же проектах такая бы проверка проводилась -->
		</xsl:choose>
	</xsl:template>
	
</xsl:stylesheet>
