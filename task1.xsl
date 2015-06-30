<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:decimal-format
        name = "dd"
        grouping-separator = " "/>
   <xsl:template match="/">
      <html>
         <body>            
               <xsl:for-each select="SourceDoc/HTML/BODY/TABLE
                  /TR[2]/TD/TABLE/TR/TD/TABLE/TR/TD[3]/TABLE/TR
                  ">
                 <xsl:if test="(position()-2) mod 4 = 0 
                 and position() &lt; 43 and position()>2">                                   
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
                             <xsl:value-of select="format-number(normalize-space(substring-after($totaltime, ':')), '## ##', 'dd')"/>
                         </totalflighttime>
                         <departdate>
                             <xsl:value-of select="substring-after(TD[2]/STRONG, ' ')"/>
                             <time>
                                 <xsl:value-of select="TD[2]/B[2]"/>
                             </time>
                         </departdate>
                         <arrivedate>
                             <!-- Именованный шаблон "arrivedate" используется для нахождения даты прилета -->
                             <xsl:variable name="time" select="format-number(normalize-space(substring-after($totaltime, ':')), '## ##', 'dd')" />
                             <xsl:variable name="totaltimemin" select="substring-after($time, ' ')"/>
                             <xsl:variable name="totaltimehour" select="substring-before($time, $totaltimemin)"/>
                             <xsl:variable name="departhours" select="substring-before(TD[2]/B[2], ':')"/>
                             <xsl:variable name="departmin" select="substring-after(TD[2]/B[2], ':')"/>
                             <xsl:variable name="arrivehours" select="substring-before(TD[2]/B[3], ':')"/>
                             <xsl:variable name="arrivemin" select="substring-after(TD[2]/B[3], ':')"/>
                             <xsl:variable name="date" select="substring-before(substring-after(TD[2]/STRONG, ' '), ' ')"/>
                             <xsl:variable name="year" select="substring-after(substring-after(substring-after(TD[2]/STRONG, ' '), ' '), ' ')"/>
                                     <xsl:variable name="moins" select="normalize-space(substring-before(substring-after(substring-after(TD[2]/STRONG, ' '), ' '), ' '))"/>
                                     <xsl:call-template name="arrivedate">
                                         <xsl:with-param name="moins" select="$moins"/>
                                         <xsl:with-param name="totaltimehour" select="$totaltimehour"/>
                                         <xsl:with-param name="totaltimemin" select="$totaltimemin"/>
                                         <xsl:with-param name="departhours" select="$departhours"/>
                                         <xsl:with-param name="departmin" select="$departmin"/>
                                         <xsl:with-param name="arrivehours" select="$arrivehours"/>
                                         <xsl:with-param name="arrivemin" select="$arrivemin"/>
                                         <xsl:with-param name="date" select="$date"/>
                                         <xsl:with-param name="year" select="$year"/>
                                     </xsl:call-template>                                                  
                             <time>
                                 <xsl:value-of select="normalize-space(TD[2]/B[3])"/>
                             </time>
                         </arrivedate>
                         <departcity>
                             <xsl:value-of select="normalize-space(substring-before(substring-after(TD[2]/text()[6], 'Depart '), '('))"/>
                             <citycode>
                                 <xsl:value-of select="normalize-space(substring-before(substring-after(TD[2]/text()[6], '('), ')'))"/>
                             </citycode>
                         </departcity>
                         <arrivecity>
                             <xsl:value-of select="normalize-space(substring-before(substring-after(TD[2]/text()[9], 'Arrive '), '('))"/>
                             <citycode>
                                 <xsl:value-of select="normalize-space(substring-before(substring-after(TD[2]/text()[9], '('), ')'))"/>
                             </citycode>
                         </arrivecity>
                         <usualprice>
                             <xsl:value-of select="TD[8]/BIG/B/STRONG"/>
                             </usualprice>
                         <specialprice>
                             <xsl:value-of select="substring-after(TD[8]/SPAN/B, 'fare ')"/>
                         </specialprice>
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
        <xsl:variable name="space" select="' '"/>
       <xsl:choose>
           <xsl:when test="$moins='May'
               or $moins='July' or $moins='August' or $moins='October' or $moins='December'">              
               <xsl:variable name="arrivetime" select="$departhours*60+$departmin+$totaltimehour*60+$totaltimemin"/>
               <xsl:variable name="localarivetime" select="$arrivehours*60+$arrivemin"/>
               <xsl:choose>
                   <xsl:when test="($localarivetime - $arrivetime) &gt; 720">
                       <xsl:choose>
                           <xsl:when test="$date = 1">
                               <xsl:choose>                        
                                   <xsl:when test="$moins = 'May'">
                                       30 April <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 'July'">
                                       30 June <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 'August'">
                                       31 July <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 'October'">
                                       30 September <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 'December'">
                                       30 November <xsl:value-of select="$year"/>
                                   </xsl:when>
                               </xsl:choose>
                           </xsl:when>
                           <xsl:otherwise>
                                       <xsl:value-of select="$date - 1"/><xsl:value-of select="$space"/><xsl:value-of select="$moins"/><xsl:value-of select="$space"/><xsl:value-of select="$year"/>                                 
                           </xsl:otherwise>                                                   
                       </xsl:choose>
                   </xsl:when>
                   <xsl:when test="($localarivetime - $arrivetime) &lt; -720">
                       <xsl:choose>
                           <xsl:when test="$date = 31">
                               <xsl:choose>
                                   <xsl:when test="$moins = 'December'">
                                       1 January <xsl:value-of select="$year + 1"/>
                                   </xsl:when>                            
                                   <xsl:when test="$moins = 'May'">
                                       1 June <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 'July'">
                                       1 August <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 'August'">
                                       1 September <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 'October'">
                                       1 November <xsl:value-of select="$year"/>
                                   </xsl:when>
                               </xsl:choose>
                           </xsl:when>
                           <xsl:otherwise>
                               <xsl:value-of select="$date + 1"/><xsl:value-of select="$space"/><xsl:value-of select="$moins"/><xsl:value-of select="$space"/><xsl:value-of select="$year"/>
                           </xsl:otherwise>                                         
                       </xsl:choose>
                   </xsl:when>
                   <xsl:otherwise>                       
                       <xsl:value-of select="$date"/><xsl:value-of select="$space"/><xsl:value-of select="$moins"/><xsl:value-of select="$space"/><xsl:value-of select="$year"/>                       
                   </xsl:otherwise>
               </xsl:choose>              
           </xsl:when>
           <xsl:when test="$moins='April' or $moins='June'
               or $moins='September' or $moins='November'">             
               <xsl:variable name="arrivetime" select="$departhours*60+$departmin+$totaltimehour*60+$totaltimemin"/>
               <xsl:variable name="localarivetime" select="$arrivehours*60+$arrivemin"/>
               <xsl:choose>
                   <xsl:when test="($localarivetime - $arrivetime) &gt; 720">
                       <xsl:choose>
                           <xsl:when test="$date = 1">
                               <xsl:choose>                                  
                                   <xsl:when test="$moins = 'April'">
                                       31 March <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 'June'">
                                       31 May <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 'September'">
                                       31 August <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 'November'">
                                       31 October <xsl:value-of select="$year"/>
                                   </xsl:when>                   
                               </xsl:choose>
                           </xsl:when>
                           <xsl:otherwise>                          
                               <xsl:value-of select="$date - 1"/><xsl:value-of select="$space"/><xsl:value-of select="$moins"/><xsl:value-of select="$space"/><xsl:value-of select="$year"/>                                
                           </xsl:otherwise>                                                   
                       </xsl:choose>
                   </xsl:when>
                   <xsl:when test="($localarivetime - $arrivetime) &lt; -720">
                       <xsl:choose>
                           <xsl:when test="$date = 30">
                               <xsl:choose>                                   
                                   <xsl:when test="$moins = 'April'">
                                       1 May <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 'June'">
                                       1 July <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 'September'">
                                       1 October <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:when test="$moins = 'November'">
                                       1 December <xsl:value-of select="$year"/>
                                   </xsl:when>                 
                               </xsl:choose>
                           </xsl:when>
                           <xsl:otherwise>
                               <xsl:value-of select="$date + 1"/><xsl:value-of select="$space"/><xsl:value-of select="$moins"/><xsl:value-of select="$space"/><xsl:value-of select="$year"/>       
                           </xsl:otherwise>                                         
                       </xsl:choose>
                   </xsl:when>
                   <xsl:otherwise>
                       <xsl:value-of select="$date"/><xsl:value-of select="$space"/><xsl:value-of select="$moins"/><xsl:value-of select="$space"/><xsl:value-of select="$year"/>                          
                   </xsl:otherwise>
               </xsl:choose>
           </xsl:when>
           <xsl:when test="$moins = 'January' or $moins = 'February' or $moins = 'March'">
               <xsl:variable name="arrivetime" select="$departhours*60+$departmin+$totaltimehour*60+$totaltimemin"/>
               <xsl:variable name="localarivetime" select="$arrivehours*60+$arrivemin"/>
               <xsl:choose>
                   <xsl:when test="$year mod 4 = 0">
                       <xsl:choose>
                           <xsl:when test="($localarivetime - $arrivetime) &gt; 720">
                               <xsl:choose>
                                   <xsl:when test="$date = 1">
                                       <xsl:choose>
                                           <xsl:when test="$moins = 'January'">
                                               31 December <xsl:value-of select="$year - 1"/>
                                           </xsl:when>
                                           <xsl:when test="$moins = 'February'">
                                               31 January <xsl:value-of select="$year"/>
                                           </xsl:when>
                                           <xsl:when test="$moins = 'March'">
                                               29 February <xsl:value-of select="$year"/>
                                           </xsl:when>
                                       </xsl:choose>
                                   </xsl:when>
                                   <xsl:otherwise>                       
                                       <xsl:value-of select="$date - 1"/><xsl:value-of select="$space"/><xsl:value-of select="$moins"/><xsl:value-of select="$space"/><xsl:value-of select="$year"/>                                          
                                   </xsl:otherwise>
                               </xsl:choose>
                           </xsl:when>
                           <xsl:when test="($localarivetime - $arrivetime) &lt; -720">
                               <xsl:choose>
                                   <xsl:when test="$date = 31">
                                       <xsl:choose>
                                           <xsl:when test="$moins = 'January'">
                                               1 February <xsl:value-of select="$year"/>
                                           </xsl:when>
                                           <xsl:when test="$moins = 'March'">
                                               1 April <xsl:value-of select="$year"/>
                                           </xsl:when>
                                       </xsl:choose>
                                   </xsl:when>
                                   <xsl:when test="($moins = 'February') and ($date = 29)">
                                       1 March <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:otherwise>
                                       <xsl:value-of select="$date + 1"/><xsl:value-of select="$space"/><xsl:value-of select="$moins"/><xsl:value-of select="$space"/><xsl:value-of select="$year"/>            
                                   </xsl:otherwise>
                               </xsl:choose>
                           </xsl:when>
                           <xsl:otherwise>
                               <xsl:value-of select="$date"/><xsl:value-of select="$space"/><xsl:value-of select="$moins"/><xsl:value-of select="$space"/><xsl:value-of select="$year"/>                  
                           </xsl:otherwise>
                       </xsl:choose>
                   </xsl:when>
                   <xsl:when test="$year mod 4 != 0">
                       <xsl:choose>
                           <xsl:when test="($localarivetime - $arrivetime) &gt; 720">
                               <xsl:choose>
                                   <xsl:when test="$date = 1">
                                       <xsl:choose>
                                           <xsl:when test="$moins = 'January'">
                                               31 December <xsl:value-of select="$year - 1"/>
                                           </xsl:when>
                                           <xsl:when test="$moins = 'February'">
                                               31 January <xsl:value-of select="$year"/>
                                           </xsl:when>
                                           <xsl:when test="$moins = 'March'">
                                               28 February <xsl:value-of select="$year"/>
                                           </xsl:when>
                                       </xsl:choose>
                                   </xsl:when>
                                   <xsl:otherwise>
                                       <xsl:value-of select="$date - 1"/><xsl:value-of select="$space"/><xsl:value-of select="$moins"/><xsl:value-of select="$space"/><xsl:value-of select="$year"/>                                         
                                   </xsl:otherwise>
                               </xsl:choose>
                           </xsl:when>
                           <xsl:when test="($localarivetime - $arrivetime) &lt; -720">
                               <xsl:choose>
                                   <xsl:when test="$date = 31">
                                       <xsl:choose>
                                           <xsl:when test="$moins = 'January'">
                                               1 February <xsl:value-of select="$year"/>
                                           </xsl:when>
                                           <xsl:when test="$moins = 'March'">
                                               1 April <xsl:value-of select="$year"/>
                                           </xsl:when>
                                       </xsl:choose>
                                   </xsl:when>
                                   <xsl:when test="($moins = 'February') and ($date = 28)">
                                       1 March <xsl:value-of select="$year"/>
                                   </xsl:when>
                                   <xsl:otherwise>
                                       <xsl:value-of select="$date + 1"/><xsl:value-of select="$space"/><xsl:value-of select="$moins"/><xsl:value-of select="$space"/><xsl:value-of select="$year"/>                                          
                                   </xsl:otherwise>
                               </xsl:choose>
                           </xsl:when>
                           <xsl:otherwise>
                               <xsl:value-of select="$date"/><xsl:value-of select="$space"/><xsl:value-of select="$moins"/><xsl:value-of select="$space"/><xsl:value-of select="$year"/>                                  
                           </xsl:otherwise>
                       </xsl:choose>
                   </xsl:when>
               </xsl:choose>
           </xsl:when>
       </xsl:choose> 
    </xsl:template>
</xsl:stylesheet>
