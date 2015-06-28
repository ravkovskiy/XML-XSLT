
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:decimal-format
        name = "dd"
        grouping-separator = " "/>
   <xsl:template match="/">
      <html>
         <body>
             <h1>
                 <xsl:value-of select='SourceDoc/HTML/BODY/TABLE
                     /TR[2]/TD/TABLE/TR/TD/TABLE/TR/TD[3]/TABLE
                      /TR[6]/TD[2]/*[1]'/>
             </h1>
               <xsl:for-each select="SourceDoc/HTML/BODY/TABLE
                  /TR[2]/TD/TABLE/TR/TD/TABLE/TR/TD[3]/TABLE/TR
                  ">
                 <xsl:if test="(position()-2) mod 4 = 0 
                 and position() &lt; 43 and position()>2">
                  <flight>
                      <depart>
                          <xsl:value-of select="position()"/>
                          <xsl:copy-of select=
                             "TD[2]/text()[6]"/>
                        </depart>
                      <arrive>
                          <xsl:copy-of select=
                              "TD[2]/text()[9]"/>
                      </arrive>
                    </flight> 
                    <totalTime>
                        <xsl:copy-of select=
                            "TD[2]/text()[16]"/>
                    </totalTime>
                     <xsl:variable name="compagnname" select="TD[2]/B[4]"/>
                     <xsl:variable name="totaltime" select="TD[2]/text()[16]"/>
                     <flight>
                         <airlinecode>
                             <xsl:value-of select="normalize-space(substring-before($compagnname, 'Z'))"/>
                         </airlinecode>
                         <flightnumber>
                             <xsl:value-of select="normalize-space((substring-after((substring-after($compagnname, ' ')), ' ')))"/>
                         </flightnumber>
                         <totalflighttime>
                             <xsl:value-of select="normalize-space(substring-after($totaltime, ':'))"/>
                         </totalflighttime>
                         <departdate>
                             <xsl:value-of select="TD[2]/STRONG"/>
                             <time>
                                 <xsl:value-of select="TD[2]/B[2]"/>
                             </time>
                         </departdate>
                         <arrivedate>
                             <xsl:choose>
                                 <xsl:when test="substring-before(TD[2]/B[2], ':') &lt; substring-before(TD[2]/B[3], ':')"><xsl:value-of select="TD[2]/STRONG"/></xsl:when>
                                 <xsl:otherwise>
                                     k
                                 </xsl:otherwise>
                             </xsl:choose>
                             <time>
                                 <xsl:variable name="time" select="format-number(normalize-space(substring-after($totaltime, ':')), '## ##', 'dd')" />
                                 <xsl:variable name="totaltimemin" select="substring-after($time, ' ')"/>
                                 <xsl:variable name="totaltimehour" select="substring-before($time, $totaltimemin)"/>
                                 <xsl:variable name="departhours" select="substring-before(TD[2]/B[2], ':')"/>
                                 <xsl:variable name="departmin" select="substring-after(TD[2]/B[2], ':')"/>
                                 <xsl:variable name="arrivehours" select="substring-before(TD[2]/B[3], ':')"/>
                                 <xsl:variable name="arrivetmin" select="substring-after(TD[2]/B[3], ':')"/>
                                 <xsl:variable name="date" select="substring-before(substring-after(TD[2]/STRONG, ' '), ' ')"/>
                                 <xsl:variable name="year" select="substring-after(substring-after(substring-after(TD[2]/STRONG, ' '), ' '), ' ')"/>
                                 <xsl:choose>
                                     <xsl:when test="substring-before(substring-after(substring-after(TD[2]/STRONG, ' '), ' '), ' ') = 'December'">
                                         <xsl:variable name="moins" select="12"/>
                                         <xsl:call-template name="arrivedate">
                                             <xsl:with-param name="moins" select="$moins"/>
                                             <xsl:with-param name="totaltimehour" select="$totaltimehour"/>
                                             <xsl:with-param name="totaltimemin" select="$totaltimemin"/>
                                             <xsl:with-param name="departhours" select="$departhours"/>
                                             <xsl:with-param name="departmin" select="$departmin"/>
                                             <xsl:with-param name="arrivehours" select="$arrivehours"/>
                                             <xsl:with-param name="arrivemin" select="$arrivetmin"/>
                                             <xsl:with-param name="date" select="$date"/>
                                             <xsl:with-param name="year" select="$year"/>
                                         </xsl:call-template>
                                     </xsl:when>
                                     <xsl:when test="substring-before(substring-after(substring-after(TD[2]/STRONG, ' '), ' '), ' ') = 'January'">
                                         <xsl:variable name="moins" select="1"/>
                                         <xsl:value-of select="$moins"/>
                                         <xsl:call-template name="arrivedate">
                                             <xsl:with-param name="moins" select="$moins"/>
                                             <xsl:with-param name="totaltimehour" select="$totaltimehour"/>
                                             <xsl:with-param name="totaltimemin" select="$totaltimemin"/>
                                             <xsl:with-param name="departhours" select="$departhours"/>
                                             <xsl:with-param name="departmin" select="$departmin"/>
                                             <xsl:with-param name="arrivehours" select="$arrivehours"/>
                                             <xsl:with-param name="arrivemin" select="$arrivetmin"/>
                                             <xsl:with-param name="date" select="$date"/>
                                             <xsl:with-param name="year" select="$year"/>
                                         </xsl:call-template>
                                     </xsl:when>
                                     <xsl:when test="substring-before(substring-after(substring-after(TD[2]/STRONG, ' '), ' '), ' ') = 'February'">
                                         <xsl:variable name="moins" select="2"/>
                                         <xsl:value-of select="$moins"/>
                                         <xsl:call-template name="arrivedate">
                                             <xsl:with-param name="moins" select="$moins"/>
                                             <xsl:with-param name="totaltimehour" select="$totaltimehour"/>
                                             <xsl:with-param name="totaltimemin" select="$totaltimemin"/>
                                             <xsl:with-param name="departhours" select="$departhours"/>
                                             <xsl:with-param name="departmin" select="$departmin"/>
                                             <xsl:with-param name="arrivehours" select="$arrivehours"/>
                                             <xsl:with-param name="arrivemin" select="$arrivetmin"/>
                                             <xsl:with-param name="date" select="$date"/>
                                             <xsl:with-param name="year" select="$year"/>
                                         </xsl:call-template>
                                     </xsl:when>
                                     <xsl:when test="substring-before(substring-after(substring-after(TD[2]/STRONG, ' '), ' '), ' ') = 'March'">
                                         <xsl:variable name="moins" select="3"/>
                                         <xsl:value-of select="$moins"/>
                                         <xsl:call-template name="arrivedate">
                                             <xsl:with-param name="moins" select="$moins"/>
                                             <xsl:with-param name="totaltimehour" select="$totaltimehour"/>
                                             <xsl:with-param name="totaltimemin" select="$totaltimemin"/>
                                             <xsl:with-param name="departhours" select="$departhours"/>
                                             <xsl:with-param name="departmin" select="$departmin"/>
                                             <xsl:with-param name="arrivehours" select="$arrivehours"/>
                                             <xsl:with-param name="arrivemin" select="$arrivetmin"/>
                                             <xsl:with-param name="date" select="$date"/>
                                             <xsl:with-param name="year" select="$year"/>
                                         </xsl:call-template>
                                     </xsl:when>
                                     <xsl:when test="substring-before(substring-after(substring-after(TD[2]/STRONG, ' '), ' '), ' ') = 'April'">
                                         <xsl:variable name="moins" select="4"/>
                                         <xsl:value-of select="$moins"/>
                                         <xsl:call-template name="arrivedate">
                                             <xsl:with-param name="moins" select="$moins"/>
                                             <xsl:with-param name="totaltimehour" select="$totaltimehour"/>
                                             <xsl:with-param name="totaltimemin" select="$totaltimemin"/>
                                             <xsl:with-param name="departhours" select="$departhours"/>
                                             <xsl:with-param name="departmin" select="$departmin"/>
                                             <xsl:with-param name="arrivehours" select="$arrivehours"/>
                                             <xsl:with-param name="arrivemin" select="$arrivetmin"/>
                                             <xsl:with-param name="date" select="$date"/>
                                             <xsl:with-param name="year" select="$year"/>
                                         </xsl:call-template>
                                     </xsl:when>
                                         <xsl:when test="substring-before(substring-after(substring-after(TD[2]/STRONG, ' '), ' '), ' ') = 'May'">
                                             <xsl:variable name="moins" select="5"/>
                                             <xsl:value-of select="$moins"/>
                                             <xsl:call-template name="arrivedate">
                                                 <xsl:with-param name="moins" select="$moins"/>
                                                 <xsl:with-param name="totaltimehour" select="$totaltimehour"/>
                                                 <xsl:with-param name="totaltimemin" select="$totaltimemin"/>
                                                 <xsl:with-param name="departhours" select="$departhours"/>
                                                 <xsl:with-param name="departmin" select="$departmin"/>
                                                 <xsl:with-param name="arrivehours" select="$arrivehours"/>
                                                 <xsl:with-param name="arrivemin" select="$arrivetmin"/>
                                                 <xsl:with-param name="date" select="$date"/>
                                                 <xsl:with-param name="year" select="$year"/>
                                             </xsl:call-template>
                                     </xsl:when>
                                     <xsl:when test="substring-before(substring-after(substring-after(TD[2]/STRONG, ' '), ' '), ' ') = 'June'">
                                         <xsl:variable name="moins" select="6"/>
                                         <xsl:value-of select="$moins"/>
                                         <xsl:call-template name="arrivedate">
                                             <xsl:with-param name="moins" select="$moins"/>
                                             <xsl:with-param name="totaltimehour" select="$totaltimehour"/>
                                             <xsl:with-param name="totaltimemin" select="$totaltimemin"/>
                                             <xsl:with-param name="departhours" select="$departhours"/>
                                             <xsl:with-param name="departmin" select="$departmin"/>
                                             <xsl:with-param name="arrivehours" select="$arrivehours"/>
                                             <xsl:with-param name="arrivemin" select="$arrivetmin"/>
                                             <xsl:with-param name="date" select="$date"/>
                                             <xsl:with-param name="year" select="$year"/>
                                         </xsl:call-template>
                                     </xsl:when>
                                     <xsl:when test="substring-before(substring-after(substring-after(TD[2]/STRONG, ' '), ' '), ' ') = 'July'">
                                         <xsl:variable name="moins" select="7"/>
                                         <xsl:value-of select="$moins"/>
                                         <xsl:call-template name="arrivedate">
                                             <xsl:with-param name="moins" select="$moins"/>
                                             <xsl:with-param name="totaltimehour" select="$totaltimehour"/>
                                             <xsl:with-param name="totaltimemin" select="$totaltimemin"/>
                                             <xsl:with-param name="departhours" select="$departhours"/>
                                             <xsl:with-param name="departmin" select="$departmin"/>
                                             <xsl:with-param name="arrivehours" select="$arrivehours"/>
                                             <xsl:with-param name="arrivemin" select="$arrivetmin"/>
                                             <xsl:with-param name="date" select="$date"/>
                                             <xsl:with-param name="year" select="$year"/>
                                         </xsl:call-template>
                                     </xsl:when>
                                     <xsl:when test="substring-before(substring-after(substring-after(TD[2]/STRONG, ' '), ' '), ' ') = 'August'">
                                         <xsl:variable name="moins" select="8"/>
                                         <xsl:value-of select="$moins"/>
                                         <xsl:call-template name="arrivedate">
                                             <xsl:with-param name="moins" select="$moins"/>
                                             <xsl:with-param name="totaltimehour" select="$totaltimehour"/>
                                             <xsl:with-param name="totaltimemin" select="$totaltimemin"/>
                                             <xsl:with-param name="departhours" select="$departhours"/>
                                             <xsl:with-param name="departmin" select="$departmin"/>
                                             <xsl:with-param name="arrivehours" select="$arrivehours"/>
                                             <xsl:with-param name="arrivemin" select="$arrivetmin"/>
                                             <xsl:with-param name="date" select="$date"/>
                                             <xsl:with-param name="year" select="$year"/>
                                         </xsl:call-template>
                                     </xsl:when>
                                     <xsl:when test="substring-before(substring-after(substring-after(TD[2]/STRONG, ' '), ' '), ' ') = 'September'">
                                         <xsl:variable name="moins" select="9"/>
                                         <xsl:value-of select="$moins"/>
                                         <xsl:call-template name="arrivedate">
                                             <xsl:with-param name="moins" select="$moins"/>
                                             <xsl:with-param name="totaltimehour" select="$totaltimehour"/>
                                             <xsl:with-param name="totaltimemin" select="$totaltimemin"/>
                                             <xsl:with-param name="departhours" select="$departhours"/>
                                             <xsl:with-param name="departmin" select="$departmin"/>
                                             <xsl:with-param name="arrivehours" select="$arrivehours"/>
                                             <xsl:with-param name="arrivemin" select="$arrivetmin"/>
                                             <xsl:with-param name="date" select="$date"/>
                                             <xsl:with-param name="year" select="$year"/>
                                         </xsl:call-template>
                                     </xsl:when>
                                     <xsl:when test="substring-before(substring-after(substring-after(TD[2]/STRONG, ' '), ' '), ' ') = 'October'">
                                         <xsl:variable name="moins" select="10"/>
                                         <xsl:call-template name="arrivedate">
                                             <xsl:with-param name="moins" select="$moins"/>
                                             <xsl:with-param name="totaltimehour" select="$totaltimehour"/>
                                             <xsl:with-param name="totaltimemin" select="$totaltimemin"/>
                                             <xsl:with-param name="departhours" select="$departhours"/>
                                             <xsl:with-param name="departmin" select="$departmin"/>
                                             <xsl:with-param name="arrivehours" select="$arrivehours"/>
                                             <xsl:with-param name="arrivemin" select="$arrivetmin"/>
                                             <xsl:with-param name="date" select="$date"/>
                                             <xsl:with-param name="year" select="$year"/>
                                         </xsl:call-template>
                                     </xsl:when>
                                     <xsl:when test="substring-before(substring-after(substring-after(TD[2]/STRONG, ' '), ' '), ' ') = 'November'">
                                         <xsl:variable name="moins" select="11"/>
                                         <xsl:value-of select="$moins"/>
                                         <xsl:call-template name="arrivedate">
                                             <xsl:with-param name="moins" select="$moins"/>
                                             <xsl:with-param name="totaltimehour" select="$totaltimehour"/>
                                             <xsl:with-param name="totaltimemin" select="$totaltimemin"/>
                                             <xsl:with-param name="departhours" select="$departhours"/>
                                             <xsl:with-param name="departmin" select="$departmin"/>
                                             <xsl:with-param name="arrivehours" select="$arrivehours"/>
                                             <xsl:with-param name="arrivemin" select="$arrivetmin"/>
                                             <xsl:with-param name="date" select="$date"/>
                                             <xsl:with-param name="year" select="$year"/>
                                         </xsl:call-template>
                                     </xsl:when>
                                     
                                 </xsl:choose>
                                
                             </time>
                         </arrivedate>
                     </flight>
                    </xsl:if>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
    <xsl:template name="arrivedate">
       <xsl:param name="moins"></xsl:param>
       <xsl:param name="totaltimehour"></xsl:param>
       <xsl:param name="totaltimemin"></xsl:param>
       <xsl:param name="departhours"></xsl:param>
       <xsl:param name="departmin"></xsl:param>
       <xsl:param name="arrivehours"></xsl:param>
       <xsl:param name="arrivemin"></xsl:param>
       <xsl:param name="date"></xsl:param>
       <xsl:param name="year"></xsl:param>
       <xsl:choose>
           <xsl:when test="$moins=1 or $moins=3 or $moins=5
               or $moins=7 or $moins=8 or $moins=10 or $moins=12
               or $moins=0">
               <xsl:variable name="fullday" select="31"/>
               <xsl:variable name="arrivetime" select="$departhours*60+$departmin+$totaltimehour*60+$totaltimemin"/>
               <xsl:variable name="localarivetime" select="$arrivehours*60+$arrivemin"/>
               
               
           </xsl:when>
       </xsl:choose> 
    </xsl:template>
</xsl:stylesheet>
