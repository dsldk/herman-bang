<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
  exclude-result-prefixes="xs tei" version="2.0">
  <xsl:output omit-xml-declaration="yes" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <!--This template is meant as a converter from legacy Herman Bang format
  to DSL-TEI-->

  <xsl:template match="node() | @*">
    <xsl:copy>
      <xsl:apply-templates select="node() | @*"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="//tei:note[not(ancestor::tei:creation/tei:date)]">
    <xsl:variable name="identifier">
      <xsl:number count="//tei:note[not(ancestor::tei:creation/tei:date)]" level="any"/>
    </xsl:variable>
    <ref xmlns="http://www.tei-c.org/ns/1.0">
      <xsl:attribute name="target">
        <xsl:value-of select="concat('n', $identifier)"/>
      </xsl:attribute>
    </ref>
  </xsl:template>
</xsl:stylesheet>
