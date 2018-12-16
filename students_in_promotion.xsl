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
                        <!-- Selection des spécialités -->
                        <xsl:apply-templates select="//specialite"/>
                    </ul>
                </blockquote>
            </body>
        </html>
    </xsl:template>

    <!-- Template qui sélectionne les spécialités -->
    <xsl:template match="specialite">
        <li>
            <!-- On affiche le nom de la spécialité -->
            <p><xsl:value-of select="@nom"/></p>
            <ul>
                <!-- Selection des promotions -->
                <xsl:apply-templates select="./promotion"/>
            </ul>
        </li>
    </xsl:template>

    <!-- Template qui sélectionne les promotions -->
    <xsl:template match="promotion">
        <li>
            <!-- Affichage de l'année -->
            <p><xsl:value-of select="@annee"/></p>
            <ul>
                <!-- Selection de l'étudiant de la promotion -->
                <xsl:variable name="id" select="./etudiants_promotion/etudiant/@id"/>
                <xsl:apply-templates select="../../etudiants/etudiant[@id = $id]"/>
            </ul>
        </li>
    </xsl:template>

<!-- Template qui sélectionne les étudiants -->
    <xsl:template match="etudiant">
        <li>
            <p>
                <!-- Affichage du nom et du prénom -->
                <xsl:value-of select="./nom"/> <xsl:value-of select="./prenom"/>
            </p>
        </li>
    </xsl:template>

</xsl:stylesheet>