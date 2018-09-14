<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
	<html>
	<body>
	<table border="2px" pdding="10px">
		<tr>
			<th> QUAL </th>
			<th>location</th>
			<th>noa</th>
		</tr>
		<xsl:for-each select="jobs/job">
			<xsl:if test="noa &lt; 10" >
				<tr>
					<td><xsl:value-of select="qualification" /> </td>
					<td><xsl:value-of select="location" /> </td>
					<td> <xsl:value-of select="noa"/></td>
				</tr>
			</xsl:if>
		</xsl:for-each>
	</table>
	</body>
	</html>
</xsl:template>
</xsl:stylesheet>