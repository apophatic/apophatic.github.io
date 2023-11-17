# xml-based reading log

2023-11-16

There is a new page on this site, [the library page](/library), which is a reading log in a table format. The source of the library page is an XML document, albeit, a fairly simple one at the moment:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<library>
	<book category="theology">
		<title>God In Our Hands</title>
		<author>Graham Shaw</author>
		<publisher>SCM Press</publisher>
		<year>1987</year>
		<read>Fall 2023</read>
	</book>
</library>
```
Commonly, I convert the XML to XSLT:
```xml
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
```

Considering the structure of my website, the above two files, `library.xml` and `library.xslt` are standalone at the root of the website given they are unnecessary to the production of the website, i.e., they are not part of the makefile. This is logical: none of those files outputs to something web-friendly to display.

And therefore, a handy library already pre-installed in Linux and Unix-like operating systems: [xsltproc](https://opensource.apple.com/source/libxslt/libxslt-5/libxslt/doc/xsltproc.html), a command line xslt processor.

> xsltproc is a command line tool for applying XSLT stylesheets to XML documents. It is part of libxslt, the XSLT C library for GNOME. While it was developed as part of the GNOME project, it can operate independently of the GNOME desktop. 
>
>
> xsltproc is invoked from the command line with the name of the stylesheet to be used followed by the name of the file or files to which the stylesheet is to be applied.
>
>
> If a stylesheet is included in an XML document with a Stylesheet Processing Instruction, no stylesheet need be named at the command line. xsltproc will automatically detect the included stylesheet and use it.
>
>
> By default, output is to stdout. You can specify a file for output using the `-o` option.

At the root of my website:

```bash
xsltproc -o ./pages/library.md  library.xslt library.xml
```

This applies the XSLT file to the XML file and through XSLT converts it to HTML. The output file is placed right in my pages folder where it gets rendered not only as a proper document but also according to my already defined stylesheet. I leave the output file untouched.