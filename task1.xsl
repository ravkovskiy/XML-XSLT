
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
           <xsl:when test="$moins=5
               or $moins=7 or $moins=8 or $moins=10 or $moins=12">              
               <xsl:variable name="arrivetime" select="$departhours*60+$departmin+$totaltimehour*60+$totaltimemin"/>
               <xsl:variable name="localarivetime" select="$arrivehours*60+$arrivemin"/>
               <xsl:choose>
                   <xsl:when test="($localarivetime - $arrivetime) &gt; 720">
                       <xsl:choose>
                           <xsl:when test="$date = 1">
                               <xsl:choose>                        
                                   <xsl:when test="$moins = 5">
                                       30 April <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 7">
                                       30 June <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 8">
                                       31 July <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 10">
                                       30 September <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 12">
                                       30 November <xsl:value-of select="$year"/>
                                   </xsl:when>
                               </xsl:choose>
                           </xsl:when>
                           <xsl:otherwise>
                               <xsl:choose>
                                   <xsl:when test="$moins = 5">
                                       <xsl:value-of select="$date - 1"/> May <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 7">
                                       <xsl:value-of select="$date - 1"/> July <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 8">
                                       <xsl:value-of select="$date - 1"/> August <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 10">
                                       <xsl:value-of select="$date - 1"/> October <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 12">
                                       <xsl:value-of select="$date - 1"/> December <xsl:value-of select="$year"/>
                                   </xsl:when>
                               </xsl:choose>
                           </xsl:otherwise>                                                   
                       </xsl:choose>
                   </xsl:when>
                   <xsl:when test="($localarivetime - $arrivetime) &lt; -720">
                       <xsl:choose>
                           <xsl:when test="$date = 31">
                               <xsl:choose>
                                   <xsl:when test="$moins = 12">
                                       1 January <xsl:value-of select="$year + 1"/>
                                   </xsl:when>                            
                                   <xsl:when test="$moins = 5">
                                       1 June <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 7">
                                       1 August <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 8">
                                       1 September <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 10">
                                       1 November <xsl:value-of select="$year"/>
                                   </xsl:when>
                               </xsl:choose>
                           </xsl:when>
                           <xsl:otherwise>
                               <xsl:choose>                                 
                                   <xsl:when test="$moins = 5">
                                       <xsl:value-of select="$date + 1"/> May <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 7">
                                       <xsl:value-of select="$date + 1"/> July <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 8">
                                       <xsl:value-of select="$date + 1"/> August <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 10">
                                       <xsl:value-of select="$date + 1"/> October <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 12">
                                       <xsl:value-of select="$date + 1"/> December <xsl:value-of select="$year"/>
                                   </xsl:when>
                               </xsl:choose>
                           </xsl:otherwise>                                         
                       </xsl:choose>
                   </xsl:when>
                   <xsl:otherwise>
                       <xsl:choose>                           
                           <xsl:when test="$moins = 5">
                               <xsl:value-of select="$date"/> May <xsl:value-of select="$year"/>
                           </xsl:when>
                           <xsl:when test="$moins = 7">
                               <xsl:value-of select="$date"/> July <xsl:value-of select="$year"/>
                           </xsl:when>
                           <xsl:when test="$moins = 8">
                               <xsl:value-of select="$date"/> August <xsl:value-of select="$year"/>
                           </xsl:when>
                           <xsl:when test="$moins = 10">
                               <xsl:value-of select="$date"/> October <xsl:value-of select="$year"/>
                           </xsl:when>
                           <xsl:when test="$moins = 12">
                               <xsl:value-of select="$date"/> December <xsl:value-of select="$year"/>
                           </xsl:when>
                       </xsl:choose>
                   </xsl:otherwise>
               </xsl:choose>
               
           </xsl:when>
           <xsl:when test="$moins=4 or $moins=6
               or $moins=9 or $moins=11">             
               <xsl:variable name="arrivetime" select="$departhours*60+$departmin+$totaltimehour*60+$totaltimemin"/>
               <xsl:variable name="localarivetime" select="$arrivehours*60+$arrivemin"/>
               <xsl:choose>
                   <xsl:when test="($localarivetime - $arrivetime) &gt; 720">
                       <xsl:choose>
                           <xsl:when test="$date = 1">
                               <xsl:choose>                                  
                                   <xsl:when test="$moins = 4">
                                       30 March <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 6">
                                       30 May <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 9">
                                       30 August <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 11">
                                       30 October <xsl:value-of select="$year"/>
                                   </xsl:when>                   
                               </xsl:choose>
                           </xsl:when>
                           <xsl:otherwise>
                               <xsl:choose>                                  
                                   <xsl:when test="$moins = 4">
                                       <xsl:value-of select="$date - 1"/> April <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 6">
                                       <xsl:value-of select="$date - 1"/> June <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 9">
                                       <xsl:value-of select="$date - 1"/> September <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 11">
                                       <xsl:value-of select="$date - 1"/> November <xsl:value-of select="$year"/>
                                   </xsl:when>              
                               </xsl:choose>
                           </xsl:otherwise>                                                   
                       </xsl:choose>
                   </xsl:when>
                   <xsl:when test="($localarivetime - $arrivetime) &lt; -720">
                       <xsl:choose>
                           <xsl:when test="$date = 30">
                               <xsl:choose>                                   
                                   <xsl:when test="$moins = 4">
                                       1 May <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 6">
                                       1 July <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 9">
                                       1 October <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 11">
                                       1 December <xsl:value-of select="$year"/>
                                   </xsl:when>                 
                               </xsl:choose>
                           </xsl:when>
                           <xsl:otherwise>
                               <xsl:choose>                                   
                                   <xsl:when test="$moins = 4">
                                       <xsl:value-of select="$date + 1"/> April <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 6">
                                       <xsl:value-of select="$date + 1"/> June <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 9">
                                       <xsl:value-of select="$date + 1"/> September <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 11">
                                       <xsl:value-of select="$date + 1"/> November <xsl:value-of select="$year"/>
                                   </xsl:when>                                 
                               </xsl:choose>
                           </xsl:otherwise>                                         
                       </xsl:choose>
                   </xsl:when>
                   <xsl:otherwise>
                       <xsl:choose> 
                           <xsl:when test="$moins = 4">
                               <xsl:value-of select="$date"/> April <xsl:value-of select="$year"/>
                           </xsl:when>
                           <xsl:when test="$moins = 6">
                               <xsl:value-of select="$date"/> June <xsl:value-of select="$year"/>
                           </xsl:when>
                           <xsl:when test="$moins = 9">
                               <xsl:value-of select="$date"/> September <xsl:value-of select="$year"/>
                           </xsl:when>
                           <xsl:when test="$moins = 11">
                               <xsl:value-of select="$date"/> November <xsl:value-of select="$year"/>
                           </xsl:when>                           
                       </xsl:choose>
                   </xsl:otherwise>
               </xsl:choose>
           </xsl:when>
           <xsl:when test="$moins = 1 or $moins = 2 or $moins = 3">
               <xsl:variable name="arrivetime" select="$departhours*60+$departmin+$totaltimehour*60+$totaltimemin"/>
               <xsl:variable name="localarivetime" select="$arrivehours*60+$arrivemin"/>
               <xsl:choose>
                   <xsl:when test="$year div 4 = 0">
                       <xsl:choose>
                           <xsl:when test="($localarivetime - $arrivetime) &gt; 720">
                               <xsl:choose>
                                   <xsl:when test="$date = 1">
                                       <xsl:choose>
                                           <xsl:when test="$moins = 1">
                                               31 December <xsl:value-of select="$year - 1"/>
                                           </xsl:when>
                                           <xsl:when test="$moins = 2">
                                               31 January <xsl:value-of select="$year"/>
                                           </xsl:when>
                                           <xsl:when test="$moins = 3">
                                               29 February <xsl:value-of select="$year"/>
                                           </xsl:when>
                                       </xsl:choose>
                                   </xsl:when>
                                   <xsl:otherwise>
                                       <xsl:choose>
                                           <xsl:when test="$moins = 1">
                                               <xsl:value-of select="$date - 1"/> January <xsl:value-of select="$year"/>
                                           </xsl:when>
                                           <xsl:when test="$moins = 2">
                                               <xsl:value-of select="$date - 1"/> February <xsl:value-of select="$year"/>
                                           </xsl:when>
                                           <xsl:when test="$moins = 3">
                                               <xsl:value-of select="$date - 1"/> March <xsl:value-of select="$year"/>
                                           </xsl:when>
                                       </xsl:choose>
                                   </xsl:otherwise>
                               </xsl:choose>
                           </xsl:when>
                           <xsl:when test="($localarivetime - $arrivetime) &lt; 720">
                               <xsl:choose>
                                   <xsl:when test="$date = 31">
                                       <xsl:choose>
                                           <xsl:when test="$moins = 1">
                                               1 February <xsl:value-of select="$year"/>
                                           </xsl:when>
                                           <xsl:when test="$moins = 3">
                                               1 April <xsl:value-of select="$year"/>
                                           </xsl:when>
                                       </xsl:choose>
                                   </xsl:when>
                                   <xsl:when test="($moins = 2) and ($date = 29)">
                                       1 March <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:otherwise>
                                       <xsl:choose>
                                           <xsl:when test="$moins = 1">
                                               <xsl:value-of select="$date + 1"/> January <xsl:value-of select="$year"/>
                                           </xsl:when>
                                           <xsl:when test="$moins = 2">
                                               <xsl:value-of select="$date + 1"/> February <xsl:value-of select="$year"/>
                                           </xsl:when>
                                           <xsl:when test="$moins = 3">
                                               <xsl:value-of select="$date+1"/> March <xsl:value-of select="$year"/>
                                           </xsl:when>
                                       </xsl:choose>
                                   </xsl:otherwise>
                               </xsl:choose>
                           </xsl:when>
                           <xsl:otherwise>
                               <xsl:choose>
                                   <xsl:when test="$moins=1">
                                       <xsl:value-of select="$date"/> January <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins=2">
                                       <xsl:value-of select="$date"/> February <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins=3">
                                       <xsl:value-of select="$date"/> March <xsl:value-of select="$year"/>
                                   </xsl:when>
                               </xsl:choose>
                           </xsl:otherwise>
                       </xsl:choose>
                   </xsl:when>
                   <xsl:when test="$year div 4 != 0">
                       <xsl:choose>
                           <xsl:when test="($localarivetime - $arrivetime) &gt; 720">
                               <xsl:choose>
                                   <xsl:when test="$date = 1">
                                       <xsl:choose>
                                           <xsl:when test="$moins = 1">
                                               31 December <xsl:value-of select="$year - 1"/>
                                           </xsl:when>
                                           <xsl:when test="$moins = 2">
                                               31 January <xsl:value-of select="$year"/>
                                           </xsl:when>
                                           <xsl:when test="$moins = 3">
                                               28 February <xsl:value-of select="$year"/>
                                           </xsl:when>
                                       </xsl:choose>
                                   </xsl:when>
                                   <xsl:otherwise>
                                       <xsl:choose>
                                           <xsl:when test="$moins = 1">
                                               <xsl:value-of select="$date - 1"/> January <xsl:value-of select="$year"/>
                                           </xsl:when>
                                           <xsl:when test="$moins = 2">
                                               <xsl:value-of select="$date - 1"/> February <xsl:value-of select="$year"/>
                                           </xsl:when>
                                           <xsl:when test="$moins = 3">
                                               <xsl:value-of select="$date - 1"/> March <xsl:value-of select="$year"/>
                                           </xsl:when>
                                       </xsl:choose>
                                   </xsl:otherwise>
                               </xsl:choose>
                           </xsl:when>
                           <xsl:when test="($localarivetime - $arrivetime) &lt; 720">
                               <xsl:choose>
                                   <xsl:when test="$date = 31">
                                       <xsl:choose>
                                           <xsl:when test="$moins = 1">
                                               1 February <xsl:value-of select="$year"/>
                                           </xsl:when>
                                           <xsl:when test="$moins = 3">
                                               1 April <xsl:value-of select="$year"/>
                                           </xsl:when>
                                       </xsl:choose>
                                   </xsl:when>
                                   <xsl:when test="($moins = 2) and ($date = 28)">
                                       1 March <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:otherwise>
                                       <xsl:choose>
                                           <xsl:when test="$moins = 1">
                                               <xsl:value-of select="$date + 1"/> January <xsl:value-of select="$year"/>
                                           </xsl:when>
                                           <xsl:when test="$moins = 2">
                                               <xsl:value-of select="$date + 1"/> February <xsl:value-of select="$year"/>
                                           </xsl:when>
                                           <xsl:when test="$moins = 3">
                                               <xsl:value-of select="$date+1"/> March <xsl:value-of select="$year"/>
                                           </xsl:when>
                                       </xsl:choose>
                                   </xsl:otherwise>
                               </xsl:choose>
                           </xsl:when>
                           <xsl:otherwise>
                               <xsl:choose>
                                   <xsl:when test="$moins=1">
                                       <xsl:value-of select="$date"/> January <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins=2">
                                       <xsl:value-of select="$date"/> February <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins=3">
                                       <xsl:value-of select="$date"/> March <xsl:value-of select="$year"/>
                                   </xsl:when>
                               </xsl:choose>
                           </xsl:otherwise>
                       </xsl:choose>
                   </xsl:when>
               </xsl:choose>
           </xsl:when>
       </xsl:choose> 
    </xsl:template>
</xsl:stylesheet>
