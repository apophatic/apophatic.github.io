<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
	<html>
	<head>
		<title>library</title>
	</head>
	<body>
		<h1>library</h1>
		<p>A reading log.</p>
		<hr/>
		    <table>
      			<tr>
        			<th>title</th>
        			<th>author</th>
        			<th>publisher</th>
        			<th>year</th>
        			<th>read</th>
      			</tr>
      			<xsl:for-each select="library/book">
      			<tr>
        			<td><xsl:value-of select="title"/></td>
        			<td><xsl:value-of select="author"/></td>
        			<td><xsl:value-of select="publisher"/></td>
        			<td><xsl:value-of select="year"/></td>
        			<td><xsl:value-of select="read"/></td>
      			</tr>
      			</xsl:for-each>
    		</table>
	</body>
	</html>
</xsl:template>
</xsl:stylesheet>