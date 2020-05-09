<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="ol">

<!-- Your Blog Index template here -->

<html lang="en">
<head>
  <title>Steren's labs</title>
  <link rel="stylesheet" href="/style.css" />
</head>
<body>
<header>
<h1>Steren's labs</h1>
</header>
<main>

<!-- This is where the content will be copied -->
<xsl:copy-of select="*"/>

</main>
</body>
</html>

</xsl:template>
</xsl:stylesheet>