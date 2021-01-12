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
  <xsl:template match="tei:editor">
    <editor xmlns="http://www.tei-c.org/ns/1.0" xml:id="posselt_gert_1955">Gert Posselt</editor>
  </xsl:template>
  <xsl:template match="//tei:msContents"/>
  <xsl:template match="tei:creation">
    <correspDesc xmlns="http://www.tei-c.org/ns/1.0">
      <xsl:choose>
        <xsl:when test="//tei:summary/tei:persName[@role = 'author']">
          <correspAction type="sent">
            <persName>
              <xsl:value-of select="//tei:summary/tei:persName[@role = 'author']"/>
            </persName>
            <xsl:if test="//tei:creation/tei:placeName">
              <xsl:apply-templates select="//tei:creation/tei:placeName"/>
            </xsl:if>
            <xsl:if test="//tei:creation/tei:date">
              <date>
                <xsl:attribute name="when">
                  <xsl:value-of select="//tei:creation/tei:date/@when"/>
                </xsl:attribute>
              </date>
            </xsl:if>
          </correspAction>
        </xsl:when>
      </xsl:choose>
      <xsl:choose>
        <xsl:when test="//tei:summary/tei:persName[@role = 'recipient']">
          <correspAction type="received">
            <persName>
              <xsl:value-of select="//tei:summary/tei:persName[@role = 'recipient']"/>
            </persName>
            <placeName>empty</placeName>
          </correspAction>
        </xsl:when>
      </xsl:choose>
    </correspDesc>
    <xsl:copy>
      <xsl:apply-templates select="node() | @*"/>
    </xsl:copy>
    <langUsage xmlns="http://www.tei-c.org/ns/1.0">
      <language ident="da"/>
    </langUsage>
    <textClass xmlns="http://www.tei-c.org/ns/1.0">
      <keywords>
        <term>brev</term>
      </keywords>
    </textClass>
    <abstract xmlns="http://www.tei-c.org/ns/1.0">
      <ab>empty</ab>
    </abstract>
  </xsl:template>
  <xsl:template match="tei:note/tei:note">
    [<xsl:apply-templates/>]
  </xsl:template>
  <xsl:template match="tei:emph">
    <hi xmlns="http://www.tei-c.org/ns/1.0" rend="italics">
      <xsl:apply-templates/>
    </hi>
  </xsl:template>
  <xsl:template match="tei:title[@key]">
    <xsl:comment>start title reference</xsl:comment>
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
    <!--<hi xmlns="http://www.tei-c.org/ns/1.0">
      <xsl:apply-templates/>
    </hi>-->
    <xsl:comment>end title reference</xsl:comment>
  </xsl:template>
</xsl:stylesheet>
