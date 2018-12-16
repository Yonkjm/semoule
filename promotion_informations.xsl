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
                    Polytech promotion informations. 
                </title>
            </head>
            <body>
                <h1>Polytech's promotions.</h1>
                <blockquote>
                    <ul>
                        <!-- Pour chaque spécialité -->
                        <xsl:apply-templates select="//specialite"/>
                    </ul>
                </blockquote>
            </body>
        </html>
    </xsl:template>

    <!-- Template qui sélectionne les spécialités -->
    <xsl:template match="specialite/promotion">
        <li>
            <p>
                <!-- On sélectionne leur prénom et leur nom -->
                <xsl:value-of select="../@nom"/>
                , 
                <xsl:value-of select="@annee"/>

            </p>
            <ul>
                <!-- On sélectionne l'id de l'enseignant et on le test avec les id des enseignant des matières,
                     si c'est le même id, on retourne dans matière-->
                <xsl:variable name="id_prof" select="./responsable/@idEnseignant"/>
                <xsl:apply-templates select="//enseignants/enseignant[@id=$id_prof]"/>
                <li>
                    <p>
                        Number of students : 
                        <xsl:value-of select="count(//etudiants_promotion)" />

                    </p>
                </li>
                <li>
                    <p>
                        Number of courses : 
                        <xsl:value-of select="count(//matieres_promotion)" />
                    </p>
                </li>


            </ul>
        </li>
    </xsl:template>
    <xsl:template match="enseignant">
        <li>
            <p>
                <!-- On applique un template qui sélectionne les noms -->
                responsable:
                <xsl:value-of select="./nom"/>
                <xsl:value-of select="./prenom"/>

            </p>
        </li>
    </xsl:template>


</xsl:stylesheet>