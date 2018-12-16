<?xml version="1.0" encoding="UTF-8"?>

<!-- Performs a transformation on students and their field(s) of studying. Prints a list of students, in each a list of their courses.

     Scenario : a student want to know wich classes he follows-->

<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#160;"> ]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8"/>


    <!-- On ce positionne a la racine  -->
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    Student and classes they attend.
                </title>
            </head>
            <body>
                <h1>List of students and courses they attend.</h1>
                <blockquote>
                    <ul>
                        <!-- Pour chaque etudiant -->
                        <xsl:apply-templates select="//etudiants/etudiant"/>
                    </ul>
                </blockquote>
            </body>
        </html>
    </xsl:template>

    <!-- Template qui sélectionne les étudiants -->
    <xsl:template match="etudiant">
        <li>
            <p>
                <!-- On sélectionne leur prénom et leur nom -->
                <xsl:apply-templates select="./prenom"/>
                <xsl:apply-templates select="./nom"/>
            </p>
            <ul>
                <!-- On sélectionne l'id de l'étudiant et on le test avec les id des enseignant des matières,
                     si c'est le même id, on retourne dans matière-->
                <xsl:variable name="id_stud" select="@id"/>
                <xsl:apply-templates select="../../matieres/matiere/etudiants_matiere/etudiant[@id=$id_stud]/../.."/>
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