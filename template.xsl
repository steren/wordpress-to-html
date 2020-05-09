<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="main">

<!-- Your Blog template here -->

<html lang="en">
<head>
  <title>___TITLE___</title>
  <link rel="stylesheet" href="/style.css" />
</head>
<body>
<header>
<h1><a href="/" rel="home">Steren's labs</a></h1>
</header>
<main>

<!-- This is where the content will be copied -->
<xsl:copy-of select="*"/>

</main>
</body>
</html>

</xsl:template>
</xsl:stylesheet>