<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:file="http://expath.org/ns/file"
    xmlns:cbc="http://conbavil.fr/namespace"
    exclude-result-prefixes="xs"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    version="3.0">
    
    <xsl:output method="text" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:param name="path" select="'txt'"></xsl:param>
    <xsl:variable name="conbavil" select="document('../../conbavil/conbavil.xml')"/>
    
    <xsl:template match="/">
        <xsl:apply-templates select="TEI/text/body/div/div[@type='assembly']"/>
    </xsl:template>
    
    <xsl:template match="div[@type='assembly']">
        <xsl:variable name="date" select="head/date/@when"/>
        <xsl:for-each select="./div[@type='case']">
            <xsl:variable name="affaire">
                <xsl:call-template name="getAffaire">
                    <xsl:with-param name="date" select="$date"/>
                    <xsl:with-param name="content" select="."/>
                </xsl:call-template>
            </xsl:variable>
            <xsl:variable name="author">
                <xsl:value-of select="if ($affaire/cbc:deliberation/cbc:report/cbc:author) then $affaire/cbc:deliberation/cbc:report/cbc:author else 'xxx'"/>
            </xsl:variable>
            <xsl:variable name="file" select="$path || '/' || $affaire/cbc:deliberation/@xml:id  || '_' || $date || '_' || $author || '_' || position() || '.txt'"/>
            <xsl:result-document href="{$file}">
                <div>
                    <xsl:apply-templates />
                </div>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="getAffaire">
        <xsl:param name="date"/>
        <xsl:param name="content"/>
        <xsl:variable name="item">
            <xsl:for-each select="$content/label">
                <xsl:analyze-string select="." regex="(\d*)">
                    <xsl:matching-substring>
                        <xsl:value-of select="regex-group(1)"/>
                    </xsl:matching-substring>
                </xsl:analyze-string>
            </xsl:for-each>
        </xsl:variable>
        <xsl:copy-of select="$conbavil//cbc:meeting[cbc:date[@when=$date]]/cbc:deliberations/cbc:deliberation[cbc:item = $item]"/>
    </xsl:template>
    
    <xsl:template match="label | head | p | list | postscript">
        <xsl:apply-templates />
        <xsl:text>&#10;</xsl:text>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    
    <xsl:template match="item">
        <xsl:apply-templates />
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    
    <xsl:template match="gap">
        <xsl:text>xxx </xsl:text>
    </xsl:template>
    
    <xsl:template match="del | fw | pb | lb"/>
    <xsl:template match="abbr | persName | placeName | sic | unclear | expan | date | orig | add">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="text()">
        <xsl:value-of select="normalize-space()"/>
        <xsl:text> </xsl:text>
    </xsl:template>
    
    
    
</xsl:stylesheet>