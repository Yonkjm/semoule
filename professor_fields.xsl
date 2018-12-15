<?xml version="1.0" encoding="UTF-8"?>

<!-- Performs a transformation on professors and their field(s) of teaching. Prints a list of professors, in each
     a list of their field of teaching (not style applied yet).

     Scenario : a user wants to consult the pedagogical team and their fields of teaching  -->

<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#160;"> ]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>
                    Professors and their field(s) of teaching
                </title>
            </head>
            <body>
                <h1>List of professors and their field(s) of teaching</h1>
                <blockquote>
                    <ul>
                        <xsl:apply-templates select="//enseignants/enseignant"/>
                    </ul>
                </blockquote>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="enseignant">
        <li>
            <p>
                <xsl:apply-templates select="./prenom"/>
                <xsl:apply-templates select="./nom"/>
            </p>
            <ul>
                <xsl:variable name="id_prof" select="@id"/>
                <xsl:apply-templates select="../../matieres/matiere/enseignants_matiere/enseignant[@id=$id_prof]/../.."/>
            </ul>
        </li>


    </xsl:template>

    <xsl:template match="/prenom">
        <xsl:value-of select="prenom"/>
    </xsl:template>

    <xsl:template match="/nom">
        <xsl:value-of select="nom"/>
    </xsl:template>

    <xsl:template match="matiere">
        <li>
            <p>
                <xsl:apply-templates select="./nom"/>
            </p>
        </li>
    </xsl:template>




</xsl:stylesheet>