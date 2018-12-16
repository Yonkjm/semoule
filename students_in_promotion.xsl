<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" encoding="UTF-8"/>


    <xsl:output method="html" encoding="UTF-8"/>


    <!-- Template qui sélectionne la racine -->
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    List of students per promotion
                </title>
            </head>
            <body>
                <h1>List of students per promotion</h1>
                <blockquote>
                    <ul>
                        <xsl:apply-templates select="//specialite"/>
                    </ul>
                </blockquote>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="specialite">
        <li>
            <p><xsl:value-of select="@nom"/></p>
            <ul>
                <xsl:apply-templates select="./promotion"/>
            </ul>
        </li>
    </xsl:template>

    <xsl:template match="promotion">
        <li>
            <p><xsl:value-of select="@annee"/></p>
            <ul>
                <xsl:variable name="id" select="./etudiants_promotion/etudiant/@id"/>
                <xsl:apply-templates select="../../etudiants/etudiant[@id = $id]"/>
            </ul>
        </li>
    </xsl:template>


    <xsl:template match="etudiant">
        <li>
            <p>
                <xsl:value-of select="./nom"/> <xsl:value-of select="./prenom"/>
            </p>
        </li>
    </xsl:template>

</xsl:stylesheet>