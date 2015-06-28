
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
                                 <xsl:value-of select="$time"/>
                                 <xsl:value-of select="$totaltimehour"/>
                                 <xsl:value-of select="$totaltimemin"/>
                                 <xsl:choose>
                                     <xsl:when test="substring-before(substring-after(substring-after(TD[2]/STRONG, ' '), ' '), ' ') = 'December'">
                                         <xsl:variable name="moins" select="12"/>
                                         <xsl:value-of select="$moins"/>
                                     </xsl:when>
                                     <xsl:when test="substring-before(substring-after(substring-after(TD[2]/STRONG, ' '), ' '), ' ') = 'January'">
                                         <xsl:variable name="moins" select="1"/>
                                         <xsl:value-of select="$moins"/>
                                     </xsl:when>
                                     <xsl:when test="substring-before(substring-after(substring-after(TD[2]/STRONG, ' '), ' '), ' ') = 'February'">
                                         <xsl:variable name="moins" select="2"/>
                                         <xsl:value-of select="$moins"/>
                                     </xsl:when>
                                     <xsl:when test="substring-before(substring-after(substring-after(TD[2]/STRONG, ' '), ' '), ' ') = 'March'">
                                         <xsl:variable name="moins" select="3"/>
                                         <xsl:value-of select="$moins"/>
                                     </xsl:when>
                                     <xsl:when test="substring-before(substring-after(substring-after(TD[2]/STRONG, ' '), ' '), ' ') = 'April'">
                                         <xsl:variable name="moins" select="4"/>
                                         <xsl:value-of select="$moins"/>
                                     </xsl:when>
                                         <xsl:when test="substring-before(substring-after(substring-after(TD[2]/STRONG, ' '), ' '), ' ') = 'May'">
                                             <xsl:variable name="moins" select="5"/>
                                             <xsl:value-of select="$moins"/>
                                     </xsl:when>
                                     <xsl:when test="substring-before(substring-after(substring-after(TD[2]/STRONG, ' '), ' '), ' ') = 'June'">
                                         <xsl:variable name="moins" select="6"/>
                                         <xsl:value-of select="$moins"/>
                                     </xsl:when>
                                     <xsl:when test="substring-before(substring-after(substring-after(TD[2]/STRONG, ' '), ' '), ' ') = 'July'">
                                         <xsl:variable name="moins" select="7"/>
                                         <xsl:value-of select="$moins"/>
                                     </xsl:when>
                                     <xsl:when test="substring-before(substring-after(substring-after(TD[2]/STRONG, ' '), ' '), ' ') = 'August'">
                                         <xsl:variable name="moins" select="8"/>
                                         <xsl:value-of select="$moins"/>
                                     </xsl:when>
                                     <xsl:when test="substring-before(substring-after(substring-after(TD[2]/STRONG, ' '), ' '), ' ') = 'September'">
                                         <xsl:variable name="moins" select="9"/>
                                         <xsl:value-of select="$moins"/>
                                     </xsl:when>
                                     <xsl:when test="substring-before(substring-after(substring-after(TD[2]/STRONG, ' '), ' '), ' ') = 'October'">
                                         <xsl:variable name="moins" select="10"/>
                                         <xsl:value-of select="$moins"/>
                                     </xsl:when>
                                     <xsl:when test="substring-before(substring-after(substring-after(TD[2]/STRONG, ' '), ' '), ' ') = 'November'">
                                         <xsl:variable name="moins" select="11"/>
                                         <xsl:value-of select="$moins"/>
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
        
    </xsl:template>
</xsl:stylesheet>
