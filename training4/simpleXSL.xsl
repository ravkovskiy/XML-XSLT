<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" omit-xml-declaration="yes"/>
    
    <xsl:variable name="href">
            <body>
                    <xsl:apply-templates select="//href"/>
            </body>
    </xsl:variable>
        
    <xsl:template match="/">
        <!--<xsl:call-template name="booleanSamples"/>-->
        
        <!--<xsl:call-template name="numberSamples"/>-->
        
        <!--<xsl:call-template name="stringSamples"/>-->
        
       <!-- <xsl:call-template name="nodesetSamples"/>-->                      
       
       <!--<xsl:call-template name="resultTreeSamples"/>-->
       
       <xsl:call-template name="operations"/>
    </xsl:template>

    <xsl:template name="booleanSamples">
        <xsl:variable name="boolean1"
        select=" 1>2 "/>
        <xsl:text disable-output-escaping="yes"> Value of variable boolean1(1>2) is:   </xsl:text>
        <xsl:value-of select="$boolean1"/>
        <xsl:text>
</xsl:text>
        
        <xsl:variable name="boolean2"
        select="$boolean1 or not($boolean1)"/>
        <xsl:text disable-output-escaping="yes"> Value of variable boolean2 is:   </xsl:text>
        <xsl:value-of select="$boolean2"/>
        
        <xsl:text>

</xsl:text>
        <xsl:text>Boolean and Number:</xsl:text>
        <xsl:text>
Variable boolean1: </xsl:text>
        <xsl:value-of select="number($boolean1)"/>
        <xsl:text>
Variable boolean2: </xsl:text>
        <xsl:value-of select="number($boolean2)"/>
        <xsl:text>
Value of expression (10 + $boolean2): </xsl:text>
        <xsl:value-of select="10  + $boolean2"/>        
    </xsl:template>
    
    <xsl:template name="numberSamples">
       <xsl:variable name="negInfinity"
           select="-1 div 0"/>
        <xsl:variable name="posInfinity"
           select="1 div 0"/>
        <xsl:variable name="negZero"
           select="1 div $negInfinity"/>
        <xsl:variable name="posZero"
        select="1 div $posInfinity"/>
        <xsl:variable name="NaN"
                select="10 div 'aaa'"/>
        
        <xsl:text>Negative Infinity (-1 div 0): </xsl:text>
        <xsl:value-of select="$negInfinity"/>
        <xsl:text>
Positive Infinity (1 div 0): </xsl:text>
        <xsl:value-of select="$posInfinity"/>
        <xsl:text>
Negative Zero (1 div (-1 div 0)): </xsl:text> 
        <xsl:value-of select="$negZero"/>
        <xsl:text>
Positive Zero (1 div (1 div 0)): </xsl:text>
        <xsl:value-of select="$posZero"/>
        <xsl:text>
Value of expression (-1 div $negZero): </xsl:text>
        <xsl:value-of select="-1 div $negZero"/>
        <xsl:text>
Not a Number(10 div 'aaa'): </xsl:text>
        <xsl:value-of select="$NaN"/>
        <xsl:if test="$NaN != $NaN">
            <xsl:text>
This is not a number (NaN)</xsl:text>
        </xsl:if>
    </xsl:template>
        
    <xsl:template name="stringSamples">
        <xsl:variable name="emptyString"
                        select="''"/>
        <xsl:variable name="string1"
                        select="'string1'"/>
        <xsl:variable name="string2"
                        select="'string2'"/>
        <xsl:variable name="numberString"
                        select="'15.015'"/>
        <xsl:variable name="NaNString"
                        select="'12q.50'"/>
            
        <xsl:text>Compare two strings:
</xsl:text>
        <xsl:value-of select="$string1"/>
        <xsl:text> and </xsl:text>
        <xsl:value-of select="$string2"/>
        <xsl:text>: </xsl:text>
        <xsl:value-of select=" $string1 = $string2"/>
        
        <xsl:text>
Boolean value of empty string: </xsl:text>                
        <xsl:value-of select="$emptyString and $emptyString"/>
        <xsl:text>
Boolean value of not empty string: </xsl:text>
        <xsl:value-of select="$string1 and $string1"/>
        <xsl:text>
String as a number: </xsl:text>
        <xsl:value-of select="10 + $numberString"/>
        <xsl:text>
String as a NaN: </xsl:text>
        <xsl:value-of select="10 + $NaNString"/>
    </xsl:template>
        
    <xsl:template name="nodesetSamples">
            
            <xsl:for-each
                    select="/simpleDocument/A/C//node()">
                    <xsl:value-of select="name(.)"/>
                    <xsl:text>,</xsl:text>
            </xsl:for-each>
            
            <xsl:text>
Compare node-sets
</xsl:text>
            <xsl:value-of select="/simpleDocument/numbers/int = /simpleDocument/numbers/byte"/>
            <xsl:text> and </xsl:text>
            <xsl:value-of select="/simpleDocument/numbers/int != /simpleDocument/numbers/byte"/>
            <xsl:text>
Node-set as a string: </xsl:text>
            <xsl:value-of select="/simpleDocument/numbers/int"/>
            <xsl:text>
Node-set as a number: </xsl:text>
            <xsl:value-of select="/simpleDocument/numbers/int - /simpleDocument/numbers/byte"/>
    </xsl:template>
        
    <xsl:template name="resultTreeSamples">
            
            <xsl:apply-templates select="/simpleDocument/href"/>
            
            <xsl:call-template name="template1"/>
            
            
    </xsl:template>
        
    <xsl:template match="href">
           <B> You may visit the <A HREF="{location}"> following link</A>.</B>            
    </xsl:template>
    
    <xsl:template name="template1">
            <result>
            <xsl:text> Result as a string: </xsl:text>        
            <xsl:value-of select="$href"/>        
            <xsl:text>
</xsl:text>        
            <xsl:text> Result as a tree: </xsl:text>
            <xsl:copy-of select="$href"/>
            </result>
            
    </xsl:template>
    
    <xsl:template name="operations">
            <xsl:variable name="number1"
                        select="-12.5"/>
            <xsl:variable name="number2"
                        select="-2"/>
            
            <xsl:value-of select="$number1 div $number2"/>
            <xsl:text>
</xsl:text>          
            <xsl:value-of select="$number1 mod $number2"/>
            <xsl:text>
</xsl:text>
            <xsl:value-of select="($number1 - ($number1 mod $number2)) div $number2"/>
    </xsl:template>
</xsl:stylesheet>
