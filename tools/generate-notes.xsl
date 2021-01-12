<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
  exclude-result-prefixes="xs tei" version="2.0">
  <xsl:output omit-xml-declaration="yes" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <!--This template is meant to generate notes from note elements 
    available in the text-->
  <xsl:variable name="basename" select="substring-before(tokenize(base-uri(), '/')[last()], '.xml')"/>

  <xsl:template match="/">
    <xsl:if test="//tei:note[not(ancestor::tei:creation/tei:date)]">
      <xsl:result-document href="{$basename}.toml">
# Notes for <xsl:value-of select="concat($basename, '.xml')"/>
<xsl:text>
</xsl:text>
        <xsl:apply-templates select="//tei:note[not(ancestor::tei:creation/tei:date)]"/>
      </xsl:result-document>
    </xsl:if>      
  </xsl:template>  
  <xsl:template match="tei:note[not(ancestor::tei:creation/tei:date)]">
    <xsl:variable name="identifier">
      <xsl:number count="//tei:note[not(ancestor::tei:creation/tei:date)]" level="any"/>
    </xsl:variable>
[n<xsl:value-of select="$identifier"></xsl:value-of>]
lemma = 
note = <xsl:apply-templates/>
<xsl:text>      
</xsl:text>
    
    
  </xsl:template>
  <xsl:template match="tei:hi[@rend='italics']"> _<xsl:value-of select="normalize-space()"/>_ </xsl:template>
  <xsl:template match="text()">
    <xsl:apply-templates select="normalize-space()"/>
  </xsl:template>
</xsl:stylesheet>
