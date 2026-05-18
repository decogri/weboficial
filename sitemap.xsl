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
                    body {
                        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
                        color: #333333;
                        background-color: #f8f9fa;
                        margin: 0;
                        padding: 50px 15px;
                    }
                    .container {
                        max-width: 1000px;
                        width: 100%;
                        margin: 0 auto;
                        background: #ffffff;
                        padding: 40px 30px;
                        border-radius: 12px;
                        border: 1px solid #e2e8f0;
                        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.04);
                        box-sizing: border-box;
                        overflow: hidden;
                    }
                    
                    /* CABECERA ACTUALIZADA CON LOGO DORADO */
                    .header-area {
                        display: flex;
                        align-items: center;
                        gap: 25px;
                        border-bottom: 2px solid #f1f5f9;
                        padding-bottom: 25px;
                        margin-bottom: 35px;
                    }
                    .logo-wrapper {
                        flex-shrink: 0;
                    }
                    .logo-wrapper img {
                        width: 100px; /* Tamaño prolijo para el logo horizontal */
                        height: auto;
                        object-fit: contain;
                        /* Sutil sombra dorada para integrarlo más */
                        filter: drop-shadow(0 2px 4px rgba(191, 149, 63, 0.2)); 
                    }
                    .brand-info {
                        flex-grow: 1;
                    }
                    
                    h1 {
                        font-size: 24px;
                        color: #1a202c;
                        margin: 0 0 5px 0;
                        font-weight: 700;
                        letter-spacing: -0.3px;
                        text-transform: uppercase;
                    }
                    h1 span {
                        /* Acento dorado sutil en el texto para combinar con el logo */
                        color: #bf953f; 
                        font-weight: 600;
                    }
                    p.desc {
                        color: #718096;
                        font-size: 13.5px;
                        margin: 0;
                        line-height: 1.6;
                    }
                    
                    .counter {
                        display: inline-flex;
                        align-items: center;
                        gap: 8px;
                        background: #f1f5f9;
                        color: #4a5568;
                        padding: 6px 16px;
                        border-radius: 20px;
                        font-size: 11px;
                        font-weight: 600;
                        margin-bottom: 25px;
                        letter-spacing: 0.5px;
                    }
                    .counter span {
                        width: 6px;
                        height: 6px;
                        background-color: #38a169;
                        border-radius: 50%;
                    }
                    
                    .table-responsive-wrapper {
                        width: 100%;
                        overflow-x: auto;
                        -webkit-overflow-scrolling: touch;
                        border-radius: 8px;
                        border: 1px solid #e2e8f0;
                    }
                    
                    table {
                        width: 100%;
                        border-collapse: collapse;
                        text-align: left;
                    }
                    th {
                        background-color: #f8fafc;
                        color: #64748b;
                        padding: 14px 18px;
                        font-size: 11px;
                        font-weight: 700;
                        text-transform: uppercase;
                        letter-spacing: 0.8px;
                        border-bottom: 2px solid #e2e8f0;
                    }
                    td {
                        padding: 16px 18px;
                        font-size: 13.5px;
                        background-color: #ffffff;
                        border-bottom: 1px solid #f1f5f9;
                        white-space: normal;
                        word-wrap: break-word;
                        word-break: break-all;
                        overflow-wrap: break-word;
                    }
                    tr:last-child td {
                        border-bottom: none;
                    }
                    tr:hover td {
                        background-color: #f8fafc;
                    }
                    
                    td a {
                        color: #2d3748;
                        text-decoration: none;
                        font-weight: 500;
                        display: block;
                        white-space: normal;
                        word-wrap: break-word;
                        word-break: break-all;
                        transition: color 0.15s ease;
                    }
                    tr:hover td a {
                        color: #000000;
                        text-decoration: underline;
                    }
                    
                    .meta-cell {
                        color: #a0aec0;
                        font-size: 12px;
                        font-weight: 500;
                    }
                    tr:hover .meta-cell {
                        color: #4a5568;
                    }
                    
                    .img-indicator {
                        /* Acento dorado sutil para el indicador de imagen */
                        color: #bf953f; 
                        font-size: 11px;
                        background: rgba(191, 149, 63, 0.08);
                        padding: 3px 8px;
                        border-radius: 4px;
                        font-weight: 600;
                        display: inline-flex;
                        align-items: center;
                        gap: 4px;
                        margin-top: 6px;
                        border: 1px solid rgba(191, 149, 63, 0.15);
                    }
                    
                    .footer-brand {
                        text-align: center;
                        margin-top: 40px;
                        font-size: 12px;
                        color: #a0aec0;
                        letter-spacing: 0.5px;
                    }
                    
                    @media (max-width: 768px) {
                        body { padding: 20px 10px; }
                        .container { padding: 25px 15px; }
                        
                        /* Ajuste de cabecera para celu */
                        .header-area {
                            flex-direction: column;
                            text-align: center;
                            gap: 15px;
                        }
                        .logo-wrapper img {
                            width: 120px; /* Un toque más grande en celu si está centrado */
                        }
                        
                        th:not(:first-child), td:not(:first-child) { display: none; }
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <div class="header-area">
                        <div class="logo-wrapper">
                            <img src="IMG/LOGO/logo-decogri.jpg" alt="Decogri Sillones - Logo Dorado"/>
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
                                    <tr>
                                        <td>
                                            <a href="{sitemap:loc}">
                                                <xsl:value-of select="sitemap:loc"/>
                                            </a>
                                            <xsl:if test="image:image">
                                                <span class="img-indicator">📸 Imagen SEO</span>
                                            </xsl:if>
                                        </td>
                                        <td class="meta-cell" style="text-align: center;">
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
                        © Decogri | Fábrica de Sillones y Muebles de Diseño
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
