<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- Remove spaces -->
<xsl:strip-space elements="*"/>

<!-- Indent -->
<xsl:output omit-xml-declaration="yes" method="xml" indent="yes" />

<!--copies all items by default (this is the XSLT for an Identity :) -->
<xsl:template match="@* | node()">
    <xsl:copy>
        <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
</xsl:template>

<!-- Only copy the <main> -->
<xsl:template match="/">
  <xsl:apply-templates select="//main"/>
</xsl:template>

<!-- remove <div>, keep children -->
<xsl:template match="div">
    <xsl:apply-templates select="@* | node()"/>
</xsl:template>

<!-- remove all <a rel="bookmark">, keep children -->
<xsl:template match="a[@rel = 'bookmark']">
    <xsl:apply-templates select="@* | node()"/>
</xsl:template>

<!--Remove elements we want to get rid of -->
<xsl:template match="script | meta | style | link | noscript | button | input | nav | form"/>
<!--Remove comments -->
<xsl:template match="comment()"/>
<!--Remove most attributes -->
<xsl:template match="@class | @id | @style | @rel"/>
<!--Remove image srcset attributes -->
<xsl:template match="@srcset | @sizes"/>
<!--Remove image width and height, we want to set them using CSS -->
<xsl:template match="@width | @height"/>
<!--Remove unecessary wordpress data-* attributes -->
<xsl:template match="@data-attachment-id | @data-permalink | @data-orig-file | @data-orig-size | @data-image-meta | @data-orig-size | @data-comments-opened | @data-image-description | @data-medium-file | @data-image-title | @data-image-description | @data-large-file | @data-carousel-extra | @data-id"/>

<!-- 
Remove updated date
This is likely theme dependent -->
<xsl:template match="time[@class = 'updated']"/>

<!-- 
Remove Wordpress tag and category info
This is likely theme dependent
They are spans using class="cat-links" and class="tags-links" in my theme -->
<xsl:template match="*[@class = 'cat-links'] | *[@class = 'tags-links']"/>

<!-- 
Remove comments
This is likely theme dependent
They are are in <div class="comments-wrapper"> 
-->
<xsl:template match="*[@class = 'comments-wrapper']"/>

</xsl:stylesheet>