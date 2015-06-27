<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:decimal-format name="d" grouping-separator = " "/>
    <xsl:variable name="target" select="scores/cricketbbbfeed/currentscores/target"/>
    <xsl:variable name="maxovers" select="scores/cricketbbbfeed/currentscores/maxovers"/>
    <xsl:variable name="total" select="scores/inningsinfo/match/innings/total"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Bangladesh-Sri Lanka</title>
                <style type="">
                    table {color: white}
                </style>
            </head>
            <body>
                <table border="1px" bgcolor="#7777dd"
                    cols='28' color='white' width='2000px'>
                    <tr align="center">
                        <td rowspan='2'>
                            <div>
                                <xsl:value-of select="scores/cricketbbbfeed
                                    /matchdetail/team2"/> vs <xsl:value-of select="scores/cricketbbbfeed
                                        /matchdetail/team1"/> 
                            </div>
                           <div>
                               <xsl:value-of select="scores/cricketbbbfeed/matchdetail/matchdates"/>
                           </div>
                            
                        </td>
                        <td rowspan="2">
                            <div>
                                <xsl:value-of select="scores/cricketbbbfeed
                                    /matchdetail/team2"/>
                            </div>
                            <div>
                                <xsl:value-of select="normalize-space
                                    (substring-after($total,')'))"/>/<xsl:value-of select="substring-before(
                                        substring-after($total,'('),' ')"/> (<xsl:value-of select="substring-before(
                                            substring-after($total,', '),'e')"/>)
                            </div>
                        </td>
                        <td>
                            Rate
                        </td>
                        <td>
                            <xsl:value-of select="scores/cricketbbbfeed
                                /matchdetail/team1"/>
                        </td>
                        <td>
                            Rate
                        </td>
                        <td>
                            Batsman 1
                        </td>
                        <td>
                            R
                        </td>
                        <td>
                            B
                        </td>
                        <td>
                            4S
                        </td>
                        <td>
                            6S
                        </td>
                        <td>
                            Batsman 2
                        </td>
                        <td>
                            R
                        </td>
                        <td>
                            B
                        </td>
                        <td>
                            4S
                        </td>
                        <td>
                            6S
                        </td>
                        <td>
                            Bowler 1
                        </td>
                        <td>
                            O
                        </td>
                        <td>
                            M
                        </td>
                        <td>
                            R
                        </td>
                        <td>
                            W
                        </td>
                        <td>
                            Bowler 2
                        </td>
                        <td>
                            O
                        </td>
                        <td>
                            M
                        </td>
                        <td>
                            R
                        </td>
                        <td>
                            W
                        </td>
                        <td>
                            Innings
                        </td>
                        <td>
                            Target
                        </td>
                        <td>
                            Status: <xsl:value-of select="scores/cricketbbbfeed
                                /matchdetail/result"/>
                        </td>
                    </tr>
                    <tr align="center">
                        <td>
                            <xsl:value-of select="format-number(($target - 1) div $maxovers, '###.00', 'd')" />
                        </td>
                        <td>
                            <xsl:value-of select="scores/cricketbbbfeed
                                /currentscores/runrates/currentrunrate"/> 
                        </td>
                        <td>
                            <xsl:value-of select="scores/cricketbbbfeed
                                /currentscores/striker/name"/>
                        </td>
                        <td>
                            <xsl:value-of select="scores/cricketbbbfeed
                                /currentscores/striker/runs"/>
                        </td>
                        <td>
                            <xsl:value-of select="scores/cricketbbbfeed
                                /currentscores/striker/balls"/>
                        </td>
                        <td>
                            <xsl:value-of select="scores/cricketbbbfeed
                                /currentscores/striker/fours"/>
                        </td>
                        <td>
                            <xsl:value-of select="scores/cricketbbbfeed
                                /currentscores/striker/sixes"/>
                        </td>
                        <td>
                            <xsl:value-of select="scores/cricketbbbfeed
                                /currentscores/nonstriker/name"/>
                        </td>
                        <td>
                            <xsl:value-of select="scores/cricketbbbfeed
                                /currentscores/nonstriker/runs"/>
                        </td>
                        <td>
                            <xsl:value-of select="scores/cricketbbbfeed
                                /currentscores/nonstriker/balls"/>
                        </td>
                        <td>
                            <xsl:value-of select="scores/cricketbbbfeed
                                /currentscores/nonstriker/fours"/>
                        </td>
                        <td>
                            <xsl:value-of select="scores/cricketbbbfeed
                                /currentscores/nonstriker/sixes"/>
                        </td>
                        <td>
                            <xsl:value-of select="scores/cricketbbbfeed
                                /currentscores/bowler/name"/>
                        </td>
                        <td>
                            <xsl:value-of select="scores/cricketbbbfeed
                                /currentscores/bowler/overs"/>
                        </td>
                        <td>
                            <xsl:value-of select="scores/cricketbbbfeed
                                /currentscores/bowler/maidens"/>
                        </td>
                        <td>
                            <xsl:value-of select="scores/cricketbbbfeed
                                /currentscores/bowler/runs"/>
                        </td>
                        <td>
                            <xsl:value-of select="scores/cricketbbbfeed
                                /currentscores/bowler/wickets"/>
                        </td>
                        <td>
                            <xsl:value-of select="scores/cricketbbbfeed
                                /currentscores/nonbowler/name"/>
                        </td>
                        <td>
                            <xsl:value-of select="scores/cricketbbbfeed
                                /currentscores/nonbowler/overs"/>
                        </td>
                        <td>
                            <xsl:value-of select="scores/cricketbbbfeed
                                /currentscores/nonbowler/maidens"/>
                        </td>
                        <td>
                            <xsl:value-of select="scores/cricketbbbfeed
                                /currentscores/nonbowler/runs"/>
                        </td>
                        <td>
                            <xsl:value-of select="scores/cricketbbbfeed
                                /currentscores/nonbowler/wickets"/>
                        </td>
                        <td>
                            <xsl:value-of select="scores/cricketbbbfeed
                                /currentscores/innings"/>
                        </td>
                        <td>
                            <xsl:value-of select="scores/cricketbbbfeed
                                /currentscores/target"/>
                        </td>
                    </tr>
                </table>
            </body>
        </html>
        <h1>
            <xsl:value-of select="format-number(($target - 1) div $maxovers, '###.00', 'd')" />
        </h1>
        <div>
            <xsl:value-of select="substring-before(substring-after($total,')'),'0')"/> 
        </div>
        <div>
            <xsl:value-of select ="name(scores/cricketbbbfeed
                /currentscores/bowler)"/>
        </div>
    </xsl:template>
</xsl:stylesheet>