<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" encoding="UTF-8" />
    <xsl:template match="/catalogue">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="./GameCatalog.css" />
                <title>Video Game Catalogue</title>
            </head>
            <body>
                <h1 class="title">Video Game Catalogue</h1>
                <div class="catalogue">
                    <xsl:apply-templates select="games/game">
                        <xsl:sort select="purpose" />
                        <xsl:sort select="sector" />
                    </xsl:apply-templates>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="game">
        <xsl:variable name="purposeId" select="@purpose" />
        <xsl:variable name="sectorId" select="@sector" />

        <div class="game">
            <h2>
                <xsl:value-of select="title" />
            </h2>
            <h3>Purpose: <xsl:value-of select="/catalogue/purposes/purpose[@id=$purposeId]" />
            </h3>
            <h3>Sector: <xsl:value-of select="/catalogue/sectors/sector[@id=$sectorId]" /></h3>
            <p>
                <strong>Description: </strong>
                <xsl:value-of select="description" />
            </p>
            <p>
                <strong>Release Year: </strong>
                <xsl:value-of select="releaseYear" />
            </p>
            <p>
                <strong>Studio: </strong>
                <xsl:value-of select="studio" />
            </p>
            <p>
                <strong>Stars: </strong>
                <xsl:value-of select="stars" />
            </p>
            <img>
                <xsl:attribute name="src">
                    <xsl:value-of
                        select="thumbnail/@source" />
                </xsl:attribute>
                <xsl:attribute name="width">400</xsl:attribute>
            </img>
            <p>
                <strong>Primary Category: </strong>
                <xsl:value-of select="primaryCategory" />
            </p>
            <p>
                <strong>Secondary Category: </strong>
                <xsl:value-of select="secondaryCategory" />
            </p>
        </div>
    </xsl:template>
</xsl:stylesheet>