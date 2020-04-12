<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!--Identity transform copies all items by default -->
<xsl:template match="@* | node()">
    <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
</xsl:template>

<!--Empty template to match on <script> elements and prevent it from being copied to output -->
<xsl:template match="script"/>

</xsl:stylesheet>