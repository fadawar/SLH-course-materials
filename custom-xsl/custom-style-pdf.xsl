<?xml version='1.0'?>
<xsl:stylesheet
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:fo="http://www.w3.org/1999/XSL/Format"
        version="1.0">

  <xsl:import href="../docbook-xsl/fo/docbook.xsl"/>

  <xsl:param name="paper.type" select="'A4'"/>
  <xsl:param name="title.fontset" select="'OpenSans,normal,bold'"/>
  <xsl:param name="body.fontset" select="'OpenSans'"/>
  <xsl:param name="page.margin.inner" select="'2cm'"/>
  <xsl:param name="page.margin.outer" select="'2cm'"/>
  <xsl:param name="body.start.indent" select="'0cm'"/>

  <xsl:attribute-set name="normal.para.spacing">
    <xsl:attribute name="space-before.optimum">0.5em</xsl:attribute>
    <xsl:attribute name="space-before.minimum">0.4em</xsl:attribute>
    <xsl:attribute name="space-before.maximum">0.6em</xsl:attribute>
  </xsl:attribute-set>

  <!-- Numbering paragraphs -->
  <xsl:template match="para[parent::section or parent::chapter]">
    <fo:block xsl:use-attribute-sets="normal.para.spacing">
      <xsl:call-template name="anchor"/>
      <fo:inline color="grey">
        <xsl:number count="para[parent::section or parent::chapter]" level="any"/>
        <xsl:text>.</xsl:text>
      </fo:inline>
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <!-- Custom title page via file -->
  <!--<xsl:import href="booktitlepage.xsl"/>-->

  <!-- Custom title page via editing template -->
  <!--<xsl:template name="book.titlepage.recto">-->
  <!--<fo:block>-->
    <!--<fo:external-graphic src="url(/home/fadawar/PycharmProjects/SLH-course-materials/custom-xsl/SLH-logo.png)"/>-->
  <!--</fo:block>-->
  <!--</xsl:template>-->

</xsl:stylesheet>