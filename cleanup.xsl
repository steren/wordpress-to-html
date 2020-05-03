<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- Remove spaces -->
<xsl:strip-space elements="*"/>

<!-- Indent -->
<xsl:output omit-xml-declaration="yes" method="xml" indent="yes" />

<!--Identity transform copies all items by default -->
<xsl:template match="@* | node()">
    <xsl:copy>
        <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
</xsl:template>

<!-- Only copy the <main> -->
<xsl:template match="/">
  <xsl:apply-templates select="//main"/>
</xsl:template>

<!-- remove div keep children -->
<xsl:template match="div">
    <xsl:apply-templates select="*"/>
</xsl:template>

<!--Remove elements we want to get rid of -->
<xsl:template match="script | meta | style | link | noscript | button | input | nav | form"/>
<!--Remove comments -->
<xsl:template match="comment()"/>
<!--Remove unecessary attributes -->
<xsl:template match="@class | @id | @style"/>
<!--Remove unecessary wordpress data-* attributes -->
<xsl:template match="@data-attachment-id | @data-permalink | @data-orig-file | @data-orig-size | @data-image-meta | @data-orig-size | @data-comments-opened | @data-image-description | @data-medium-file | @data-image-title | @data-image-description | @data-large-file"/>

<!-- 
Remove comments
They are are in <div class="comments-wrapper"> 
This is likely theme dependent
-->
<xsl:template match="*[@class = 'comments-wrapper']"/>

</xsl:stylesheet>