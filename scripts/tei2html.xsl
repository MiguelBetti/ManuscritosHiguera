<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs"
  version="2.0"
  xpath-default-namespace="http://www.tei-c.org/ns/1.0">
  
  
  <xsl:output method="html" indent="yes" name="html" encoding="UTF-8"/>
  
  <xsl:template match="/">
    <html>
      <head>
        <title>Tercetos</title>
        <link rel="stylesheet" type="text/css" href="assets/style.css"/>
        <script type="text/javascript" src="assets/script.js"></script>
      </head>
      <body>
        
        <!-- sidebar -->
        <div id="mySidebar" class="sidebar">
          <a href="index.html">Inicio</a>
          <a href="tercetos.html">Tercetos</a>
        </div> 
        
        <!-- main div -->
        
        <xsl:element name="div">
          <xsl:attribute name="id">
            <xsl:text>main</xsl:text>
          </xsl:attribute>
        
          <button class="openbtn" onclick="openNav()">☰ Navegación</button>                      
          
          <!-- boutons tél. du fichier TEI -->
          <xsl:if test="//TEI/@type='edition'">
            <xsl:element name="span">
              <xsl:attribute name="class">
                <xsl:text>download</xsl:text>
              </xsl:attribute>
              <xsl:element name="button">
                <xsl:attribute name="class">
                  <xsl:text>openbtn</xsl:text>
                </xsl:attribute>
                <xsl:element name="a">
                  <xsl:attribute name="href">
                    <xsl:text>editions/</xsl:text>
                    <xsl:value-of select="//TEI/@xml:id"/>
                    <xsl:text>.xml</xsl:text>
                  </xsl:attribute>
                  <xsl:attribute name="target">
                    <xsl:text>_blank</xsl:text>
                  </xsl:attribute>
                  <xsl:text>[↓] XML-TEI</xsl:text>
                </xsl:element>
              </xsl:element>
            </xsl:element>
          </xsl:if>
          
          <!-- nom de la page -->
          
          <xsl:element name="div">
            <xsl:attribute name="class">
              <xsl:text>title</xsl:text>
            </xsl:attribute>
          
              <xsl:value-of select="//title[parent::titleStmt]"/>
            
          </xsl:element>
          
          <!-- on execute les transformations sur le fichier TEI -->
        
          <xsl:apply-templates/>
          
        </xsl:element>
        
        <!-- on a le footer -->
        
        <xsl:element name="div">
          <xsl:attribute name="id">
            <xsl:text>footer</xsl:text>
          </xsl:attribute>
          <xsl:element name="img">
            <xsl:attribute name="class">
              <xsl:text>logo</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="src">
              <xsl:text>assets/unige.svg</xsl:text>
            </xsl:attribute>
          </xsl:element>
        </xsl:element>
      </body>
    </html>
  </xsl:template>

  <!-- on traite le fichier TEI element par element -->
  <xsl:template match="teiHeader"/>
  
  <xsl:template match="div">
    <div><xsl:apply-templates/></div>
  </xsl:template>
  
  <xsl:template match="head">
    <h1><xsl:apply-templates/></h1>
  </xsl:template>
 
  
  <xsl:template match="p">
    <p><xsl:apply-templates/></p>
  </xsl:template>

  <xsl:template match="l">
    <p><xsl:apply-templates/></p>
  </xsl:template>
  
  <xsl:template match="fw">
    <p><span class="page">
      <xsl:apply-templates/></span></p>
  </xsl:template>
  
  <xsl:template match="stage">
    <p><span class="stage">
      <xsl:apply-templates/></span></p>
  </xsl:template>

</xsl:stylesheet>