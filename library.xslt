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
		<h3>books</h3>
			<table>
      			<tr>
        			<th>title</th>
        			<th>author</th>
        			<th>year</th>
      			</tr>
      			<xsl:for-each select="library/book">
      			<tr>
        			<td><xsl:value-of select="title"/></td>
        			<td><xsl:value-of select="author"/></td>
        			<td><xsl:value-of select="year"/></td>
      			</tr>
      			</xsl:for-each>
    		</table>
    	<h3>films</h3>
			<table>
      			<tr>
        			<th>title</th>
        			<th>director</th>
        			<th>year</th>
      			</tr>
      			<xsl:for-each select="library/film">
      			<tr>
        			<td><xsl:value-of select="title"/></td>
        			<td><xsl:value-of select="director"/></td>
        			<td><xsl:value-of select="year"/></td>
      			</tr>
      			</xsl:for-each>
    		</table>
	</body>
	<script>document.title = "library";</script>
	</html>
</xsl:template>
</xsl:stylesheet>