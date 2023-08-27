<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:file="http://expath.org/ns/file"
  xmlns:cbc="http://conbavil.fr/namespace"
  exclude-result-prefixes="xs"
  xpath-default-namespace="http://www.tei-c.org/ns/1.0"
  xmlns="http://www.tei-c.org/ns/1.0"
  version="3.0">
  <!-- saxon -s:concours.xml -xsl:xsl/tei2txt.xsl -o:test.txt-->
  <!-- saxon -xsl:xsl/tei2txt.xsl -it:{http://www.w3.org/1999/XSL/Transform}initial-template -o:test.txt-->

  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:strip-space elements="*"/>

  <xsl:template match="xsl:initial-template">
    <xsl:for-each select="(1, 2, 3)">
            <xsl:sequence select=". * 2"/>
        </xsl:for-each>
  </xsl:template>
  

</xsl:stylesheet>