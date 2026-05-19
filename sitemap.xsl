<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
                xmlns:image="http://www.google.com/schemas/sitemap-image/1.1"
                exclude-result-prefixes="sitemap image">
    <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <html lang="es">
            <head>
                <title>Decogri | XML Sitemap Oficial</title>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <style>
                    :root {
                        --bg-main: #fafafa;
                        --card-bg: #ffffff;
                        --text-main: #1a202c;
                        --text-muted: #718096;
                        --accent-gold: #bf953f;
                        --accent-gold-dark: #aa8434;
                        --border-color: #e2e8f0;
                        --row-hover: #fbf8f3;
                    }
                    body {
                        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
                        color: #333333;
                        background-color: var(--bg-main);
                        margin: 0;
                        padding: 60px 15px;
                    }
                    .container {
                        max-width: 1050px;
                        width: 100%;
                        margin: 0 auto;
                        background: var(--card-bg);
                        padding: 45px 35px;
                        border-radius: 16px;
                        border: 1px solid var(--border-color);
                        box-shadow: 0 12px 40px rgba(0, 0, 0, 0.03);
                        box-sizing: border-box;
                        overflow: hidden;
                    }
                    
                    /* CABECERA CON LOGO Y ACENTOS PREMIUM */
                    .header-area {
                        display: flex;
                        align-items: center;
                        gap: 30px;
                        border-bottom: 2px solid #f1f5f9;
                        padding-bottom: 30px;
                        margin-bottom: 35px;
                    }
                    .logo-wrapper {
                        flex-shrink: 0;
                    }
                    .logo-wrapper img {
                        width: 100px;
                        height: auto;
                        object-fit: contain;
                        filter: drop-shadow(0 2px 8px rgba(191, 149, 63, 0.15)); 
                    }
                    .brand-info {
                        flex-grow: 1;
                    }
                    
                    h1 {
                        font-size: 24px;
                        color: var(--text-main);
                        margin: 0 0 6px 0;
                        font-weight: 700;
                        letter-spacing: -0.5px;
                        text-transform: uppercase;
                    }
                    h1 span {
                        color: var(--accent-gold); 
                        font-weight: 600;
                    }
                    p.desc {
                        color: var(--text-muted);
                        font-size: 13.5px;
                        margin: 0;
                        line-height: 1.6;
                    }
                    
                    /* CONTADOR ESTILO BADGE DE SISTEMA */
                    .counter {
                        display: inline-flex;
                        align-items: center;
                        gap: 8px;
                        background: #111111;
                        color: #ffffff;
                        padding: 8px 18px;
                        border-radius: 30px;
                        font-size: 11px;
                        font-weight: 600;
                        margin-bottom: 25px;
                        letter-spacing: 0.8px;
                        border: 1px solid var(--accent-gold);
                    }
                    .counter span {
                        width: 7px;
                        height: 7px;
                        background-color: #38a169;
                        border-radius: 50%;
                        display: inline-block;
                        box-shadow: 0 0 8px #38a169;
                    }
                    
                    .table-responsive-wrapper {
                        width: 100%;
                        overflow-x: auto;
                        -webkit-overflow-scrolling: touch;
                        border-radius: 10px;
                        border: 1px solid var(--border-color);
                        box-shadow: 0 4px 12px rgba(0,0,0,0.01);
                    }
                    
                    table {
                        width: 100%;
                        border-collapse: collapse;
                        text-align: left;
                    }
                    th {
                        background-color: #f8fafc;
                        color: #64748b;
                        padding: 16px 20px;
                        font-size: 11px;
                        font-weight: 700;
                        text-transform: uppercase;
                        letter-spacing: 1px;
                        border-bottom: 2px solid var(--border-color);
                    }
                    td {
                        padding: 18px 20px;
                        font-size: 14px;
                        background-color: #ffffff;
                        border-bottom: 1px solid #f1f5f9;
                        vertical-align: middle;
                    }
                    tr:last-child td {
                        border-bottom: none;
                    }
                    
                    /* ANIMACIÓN E INTERACCIÓN PREMIUM POR FILA */
                    tbody tr {
                        cursor: pointer;
                        transition: all 0.2s ease-in-out;
                    }
                    tbody tr:hover td {
                        background-color: var(--row-hover);
                    }
                    
                    td a {
                        color: #2d3748;
                        text-decoration: none;
                        font-weight: 500;
                        display: inline-block;
                        transition: color 0.15s ease;
                    }
                    /* Al hacer hover en la fila, se activa el estilo del enlace automáticamente */
                    tbody tr:hover td a {
                        color: var(--accent-gold-dark);
                        text-decoration: none;
                    }
                    
                    .meta-cell {
                        color: #a0aec0;
                        font-size: 12px;
                        font-weight: 500;
                    }
                    tbody tr:hover .meta-cell {
                        color: #4a5568;
                    }
                    
                    /* BADGE PREMIUM MODERNO PARA MULTIMEDIA */
                    .img-indicator {
                        display: inline-flex;
                        align-items: center;
                        gap: 6px;
                        background: #111111;
                        color: #ffffff;
                        font-size: 10.5px;
                        padding: 5px 10px;
                        border-radius: 6px;
                        font-weight: 600;
                        letter-spacing: 0.3px;
                        margin-top: 6px;
                        border: 1px solid var(--accent-gold);
                        text-transform: uppercase;
                    }
                    
                    .footer-brand {
                        text-align: center;
                        margin-top: 45px;
                        padding-top: 20px;
                        border-top: 1px solid #f1f5f9;
                        font-size: 12px;
                        color: #a0aec0;
                        letter-spacing: 0.5px;
                    }
                    
                    @media (max-width: 768px) {
                        body { padding: 20px 10px; }
                        .container { padding: 30px 15px; }
                        .header-area {
                            flex-direction: column;
                            text-align: center;
                            gap: 15px;
                        }
                        .logo-wrapper img {
                            width: 110px;
                        }
                        th:not(:first-child), td:not(:first-child) { display: none; }
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <div class="header-area">
                        <div class="logo-wrapper">
                            <img src="https://decogri.com.ar/IMG/LOGO/logo-decogri.jpg" alt="Decogri Sillones - Logo Dorado"/>
                        </div>
                        <div class="brand-info">
                            <h1>Decogri <span>// Índice XML</span></h1>
                            <p class="desc">
                                Índice de indexación automatizado para el catálogo de sillones a medida, muebles de interior y galería de imágenes. Optimizado para Google Core.
                            </p>
                        </div>
                    </div>
                    
                    <div class="counter">
                        <span/> URLS INDEXADAS: <xsl:value-of select="count(sitemap:urlset/sitemap:url)"/>
                    </div>
                    
                    <div class="table-responsive-wrapper">
                        <table>
                            <thead>
                                <tr>
                                    <th>Dirección Web (URL)</th>
                                    <th style="text-align: center; width: 90px;">Prioridad</th>
                                    <th style="text-align: center; width: 110px;">Frecuencia</th>
                                    <th style="text-align: center; width: 120px;">Actualizado</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select="sitemap:urlset/sitemap:url">
                                    <xsl:variable name="currentLoc" select="sitemap:loc"/>
                                    <tr onclick="window.open('{$currentLoc}', '_blank')">
                                        <td>
                                            <a href="{$currentLoc}" onclick="event.stopPropagation();">
                                                <xsl:value-of select="sitemap:loc"/>
                                            </a>
                                            <xsl:if test="image:image">
                                                <br/>
                                                <span class="img-indicator">📸 Imagen SEO Activa</span>
                                            </xsl:if>
                                        </td>
                                        <td class="meta-cell" style="text-align: center; font-weight: 600;">
                                            <xsl:choose>
                                                <xsl:when test="sitemap:priority"><xsl:value-of select="sitemap:priority"/></xsl:when>
                                                <xsl:otherwise>-</xsl:otherwise>
                                            </xsl:choose>
                                        </td>
                                        <td class="meta-cell" style="text-align: center; text-transform: capitalize;">
                                            <xsl:choose>
                                                <xsl:when test="sitemap:changefreq"><xsl:value-of select="sitemap:changefreq"/></xsl:when>
                                                <xsl:otherwise>-</xsl:otherwise>
                                            </xsl:choose>
                                        </td>
                                        <td class="meta-cell" style="text-align: center;">
                                            <xsl:choose>
                                                <xsl:when test="sitemap:lastmod"><xsl:value-of select="sitemap:lastmod"/></xsl:when>
                                                <xsl:otherwise>-</xsl:otherwise>
                                            </xsl:choose>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    </div>
                    
                    <div class="footer-brand">
                        © Decogri | Arquitectura Digital y Desarrollo de Alta Gama
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet> 
