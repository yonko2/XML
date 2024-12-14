<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" encoding="UTF-8"/>

    <!-- Template for the root element -->
    <xsl:template match="/game_catalog">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="./GameCatalog.css"/>
                <title>Video Game Catalog</title>
            </head>
            <body>
                <h1>Video Game Catalog</h1>
                <div>
                    <h2>Games</h2>
                    <xsl:apply-templates select="games/game">
                        <xsl:sort select="genre"/>
                        <xsl:sort select="title"/>
                    </xsl:apply-templates>
                </div>
            </body>
        </html>
    </xsl:template>

    <!-- Template for each game -->
    <xsl:template match="game">
        <div class="game-card">
            <img class="game-image" src="{image}" alt="{title}"/>
            <div class="game-info">
                <h3><xsl:value-of select="title"/></h3>
                <p><strong>Developer:</strong> <xsl:value-of select="developer"/></p>
                <p><strong>Genre:</strong> <xsl:value-of select="genre"/></p>
                <p><strong>Platform:</strong> <xsl:value-of select="platform"/></p>
                <p><strong>Release Year:</strong> <xsl:value-of select="release_year"/></p>
                <div>
                    <strong>Features:</strong>
                    <ul>
                        <xsl:for-each select="features/feature">
                            <li><xsl:value-of select="."/></li>
                        </xsl:for-each>
                    </ul>
                </div>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>
