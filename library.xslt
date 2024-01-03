<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8"/>
<xsl:template match="/">
	<html>
	<head>
		<title>library</title>
	</head>
	<body>
		<h1>library</h1>
		<p>A list of some of my favorite creative works.</p>
		<hr/>
		<h2>books</h2>
		<ul>
			<xsl:for-each select="library/book">
			<li>
				<xsl:value-of select="author"/>: <em><xsl:value-of select="title"/></em>
			</li>
			</xsl:for-each>
		</ul>
		<h2>movies</h2>
		<ul>
			<xsl:for-each select="library/film">
			<li>
				<xsl:value-of select="director"/>: <em><xsl:value-of select="title"/></em>
			</li>
			</xsl:for-each>
		</ul>
	</body>
	<script>document.title = "library";</script>
	</html>
</xsl:template>
</xsl:stylesheet>