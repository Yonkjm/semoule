<?xml version="1.0" encoding="UTF-8"?>

<!-- Performs a transformation on professors and their field(s) of teaching. Prints a list of professors, in each
     a list of their field of teaching (not style applied yet).

     Scenario : a user wants to consult the pedagogical team and their fields of teaching  -->

<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#160;"> ]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8"/>


    <!-- Template qui sélectionne la racine -->
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
                        <!-- Pour chaque enseignant -->
                        <xsl:apply-templates select="//enseignants/enseignant"/>
                    </ul>
                </blockquote>
            </body>
        </html>
    </xsl:template>

    <!-- Template qui sélectionne les enseignants -->
    <xsl:template match="enseignant">
        <li>
            <p>
                <!-- On sélectionne leur prénom et leur nom -->
                <xsl:apply-templates select="./prenom"/>
                <xsl:apply-templates select="./nom"/>
            </p>
            <ul>
                <!-- On sélectionne l'id de l'enseignant et on le test avec les id des enseignant des matières,
                     si c'est le même id, on retourne dans matière-->
                <xsl:variable name="id_prof" select="@id"/>
                <xsl:apply-templates select="../../matieres/matiere/enseignants_matiere/enseignant[@id=$id_prof]/../.."/>
            </ul>
        </li>
    </xsl:template>

    <!-- Template qui sélectionne le prénom et affiche la valeur -->
    <xsl:template match="/prenom">
        <xsl:value-of select="prenom"/>
    </xsl:template>

    <!-- Template qui sélectionne le nom et affiche la valeur -->
    <xsl:template match="/nom">
        <xsl:value-of select="nom"/>
    </xsl:template>

    <!-- Template qui sélectionne la matière -->
    <xsl:template match="matiere">
        <li>
            <p>
                <!-- On applique un template qui sélectionne les noms -->
                <xsl:apply-templates select="./nom"/>
            </p>
        </li>
    </xsl:template>




</xsl:stylesheet>