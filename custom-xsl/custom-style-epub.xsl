<?xml version='1.0'?>
<xsl:stylesheet
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        version="1.0">

  <xsl:import href="../docbook-xsl/epub3/chunk.xsl"/>

  <!-- Numbering paragraphs -->
  <xsl:template match="para[parent::section or parent::chapter]">
    <p>
      <xsl:call-template name="anchor"/>
      <span class="numbering-paragraphs">
        <xsl:number count="para[parent::section or parent::chapter]" level="any"/>
        <xsl:text>. </xsl:text>
      </span>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <!-- Add custom CSS -->
  <xsl:template name="user.head.content">
    <style type="text/css">
      .numbering-paragraphs {
        color: grey;
      }
      p { margin: 0.3em; }
    </style>
  </xsl:template>

</xsl:stylesheet>