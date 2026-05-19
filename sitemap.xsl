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
                <title>Decogri | Consola XML Engine</title>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <style>
                    :root {
                        --bg-main: #f6f8fa;
                        --card-bg: #ffffff;
                        --text-main: #0b0f19;
                        --text-muted: #64748b;
                        --accent-gold: #bf953f;
                        --accent-gold-light: rgba(191, 149, 63, 0.06);
                        --border-color: #e2e8f0;
                        --radius: 12px;
                    }
                    
                    body {
                        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
                        color: var(--text-main);
                        background-color: var(--bg-main);
                        margin: 0;
                        padding: 50px 20px;
                        -webkit-font-smoothing: antialiased;
                    }
                    
                    .container {
                        max-width: 1100px;
                        margin: 0 auto;
                        background: var(--card-bg);
                        padding: 40px;
                        border-radius: var(--radius);
                        border: 1px solid var(--border-color);
                        box-shadow: 0 20px 40px rgba(15, 23, 42, 0.04);
                        box-sizing: border-box;
                    }
                    
                    /* CABECERA ESTILO CONSOLA */
                    .header-area {
                        display: flex;
                        align-items: center;
                        justify-content: space-between;
                        border-bottom: 1px solid var(--border-color);
                        padding-bottom: 30px;
                        margin-bottom: 30px;
                        gap: 20px;
                    }
                    .brand-group {
                        display: flex;
                        align-items: center;
                        gap: 20px;
                    }
                    .logo-wrapper img {
                        width: 75px;
                        height: auto;
                        filter: drop-shadow(0 4px 10px rgba(191, 149, 63, 0.15));
                    }
                    h1 {
                        font-size: 20px;
                        margin: 0 0 4px 0;
                        font-weight: 700;
                        letter-spacing: -0.5px;
                    }
                    h1 span {
                        color: var(--accent-gold);
                        font-weight: 500;
                        font-size: 14px;
                        background: var(--accent-gold-light);
                        padding: 3px 8px;
                        border-radius: 6px;
                        margin-left: 8px;
                        border: 1px solid rgba(191, 149, 63, 0.2);
                    }
                    p.desc {
                        color: var(--text-muted);
                        font-size: 13px;
                        margin: 0;
                    }
                    
                    /* COUNTER GLASSMORPHISM */
                    .counter {
                        display: flex;
                        align-items: center;
                        gap: 10px;
                        background: #0f172a;
                        color: #f8fafc;
                        padding: 10px 20px;
                        border-radius: 8px;
                        font-size: 11px;
                        font-weight: 600;
                        letter-spacing: 0.5px;
                        white-space: nowrap;
                    }
                    .counter span {
                        width: 8px;
                        height: 8px;
                        background-color: #10b981;
                        border-radius: 50%;
                        box-shadow: 0 0 10px #10b981;
                    }

                    /* SECCIONES DENTRO DE LA TABLA */
                    .section-row td {
                        background: #f8fafc !important;
                        color: #475569;
                        font-weight: 700;
                        font-size: 11px;
                        text-transform: uppercase;
                        letter-spacing: 1px;
                        padding: 12px 20px;
                        border-top: 1px solid var(--border-color);
                        border-bottom: 1px solid var(--border-color);
                    }
                    
                    /* DISEÑO DE TABLA AVANZADO */
                    .table-wrapper {
                        width: 100%;
                        overflow-x: auto;
                        border-radius: 8px;
                        border: 1px solid var(--border-color);
                    }
                    table {
                        width: 100%;
                        border-collapse: collapse;
                        text-align: left;
                    }
                    th {
                        background-color: #fafafa;
                        color: var(--text-muted);
                        padding: 14px 20px;
                        font-size: 11px;
                        font-weight: 600;
                        text-transform: uppercase;
                        letter-spacing: 0.5px;
                        border-bottom: 1px solid var(--border-color);
                    }
                    td {
                        padding: 16px 20px;
                        font-size: 13.5px;
                        background-color: #ffffff;
                        border-bottom: 1px solid #f1f5f9;
                    }
                    
                    /* ANIMACIÓN DE FILAS INTEGRADAS */
                    tbody tr.data-row {
                        cursor: pointer;
                        transition: transform 0.15s ease, box-shadow 0.15s ease, background-color 0.15s ease;
                    }
                    tbody tr.data-row:hover td {
                        background-color: var(--accent-gold-light);
                    }
                    tbody tr.data-row:hover {
                        transform: scale(1.002);
                        box-shadow: inset 4px 0 0 var(--accent-gold);
                    }
                    
                    /* CLEAN URL DESIGN (Resalta el final de la URL) */
                    .url-link {
                        color: #94a3b8;
                        text-decoration: none;
                        font-weight: 400;
                        font-size: 13px;
                    }
                    .url-link strong {
                        color: var(--text-main);
                        font-weight: 600;
                        font-size: 14px;
                    }
                    tbody tr:hover .url-link strong {
                        color: var(--accent-gold);
                    }
                    
                    /* PRIORITY BADGES MULTINIVEL */
                    .prio-badge {
                        font-weight: 700;
                        font-size: 12px;
                        padding: 2px 6px;
                        border-radius: 4px;
                    }
                    .prio-10 { color: #1e1b4b; background: #e0e7ff; }
                    .prio-09 { color: #064e3b; background: #d1fae5; }
                    .prio-08 { color: #7c2d12; background: #ffedd5; }
                    .prio-low { color: #334155; background: #f1f5f9; }
                    
                    /* BADGE MULTIMEDIA DE DISEÑO */
                    .img-indicator {
                        display: inline-flex;
                        align-items: center;
                        gap: 5px;
                        background: #0f172a;
                        color: #ffffff;
                        font-size: 10px;
                        padding: 4px 8px;
                        border-radius: 4px;
                        font-weight: 600;
                        margin-top: 5px;
                    }
                    
                    .footer-brand {
                        text-align: center;
                        margin-top: 40px;
                        font-size: 11px;
                        color: var(--text-muted);
                        letter-spacing: 0.5px;
                    }
                    
                    @media (max-width: 768px) {
                        body { padding: 15px 10px; }
                        .container { padding: 20px; }
                        .header-area { flex-direction: column; text-align: center; align-items: center; }
                        .brand-group { flex-direction: column; }
                        th:not(:first-child), td:not(:first-child) { display: none; }
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    
                    <div class="header-area">
                        <div class="brand-group">
                            <div class="logo-wrapper">
                                <img src="https://decogri.com.ar/IMG/LOGO/logo-decogri.jpg" alt="Logo Decogri"/>
                            </div>
                            <div class="brand-info">
                                <h1>DECOGRI CORE <span>SITEMAP ENGINE v2.1</span></h1>
                                <p class="desc">Estructura indexable automatizada para Googlebot e inspectores de desarrollo.</p>
                            </div>
                        </div>
                        <div class="counter">
                            <span/>INDEX POOL: <xsl:value-of select="count(sitemap:urlset/sitemap:url)"/> OBJECTS
                        </div>
                    </div>
                    
                    <div class="table-wrapper">
                        <table>
                            <thead>
                                <tr>
                                    <th>Ruta de Indexación (Target)</th>
                                    <th style="text-align: center; width: 100px;">Weight</th>
                                    <th style="text-align: center; width: 110px;">Frecuencia</th>
                                    <th style="text-align: center; width: 140px;">Última Modificación</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select="sitemap:urlset/sitemap:url">
                                    <xsl:variable name="fullUrl" select="sitemap:loc"/>
                                    
                                    <xsl:if test="position() = 1">
                                        <tr class="section-row"><td colspan="4"> HOME &amp; CORE PAGES</td></tr>
                                    </xsl:if>
                                    <xsl:if test="contains($fullUrl, '/PRODUCTOS/SILLONES/') and not(contains(preceding-sibling::sitemap:url[1]/sitemap:loc, '/PRODUCTOS/SILLONES/'))">
                                        <tr class="section-row"><td colspan="4"> LÍNEA SILLONES A MEDIDA</td></tr>
                                    </xsl:if>
                                    <xsl:if test="contains($fullUrl, '/PRODUCTOS/MUEBLES/') and not(contains(preceding-sibling::sitemap:url[1]/sitemap:loc, '/PRODUCTOS/MUEBLES/'))">
                                        <tr class="section-row"><td colspan="4"> MOBILIARIO DE DISEÑO &amp; INTERIOR</td></tr>
                                    </xsl:if>
                                    <xsl:if test="contains($fullUrl, '/PRODUCTOS/TEXTILES/') and not(contains(preceding-sibling::sitemap:url[1]/sitemap:loc, '/PRODUCTOS/TEXTILES/'))">
                                        <tr class="section-row"><td colspan="4"> TEXTILES &amp; FUNDAS RÚSTICAS</td></tr>
                                    </xsl:if>
    

                                    <tr class="data-row" onclick="window.open('{$fullUrl}', '_blank')">
                                        <td>
                                            <span class="url-link" onclick="event.stopPropagation();">
                                                https://decogri.com.ar/<strong class="slug"><xsl:value-of select="substring-after($fullUrl, 'https://decogri.com.ar/')"/></strong>
                                            </span>
                                            <xsl:if test="image:image">
                                                <br/>
                                                <span class="img-indicator">⚡ MULTIMEDIA MAP SYNCED</span>
                                            </xsl:if>
                                        </td>
                                        
                                        <td style="text-align: center;">
                                            <xsl:choose>
                                                <xsl:when test="sitemap:priority = '1.0'"><span class="prio-badge prio-10">1.0</span></xsl:when>
                                                <xsl:when test="sitemap:priority = '0.9'"><span class="prio-badge prio-09">0.9</span></xsl:when>
                                                <xsl:when test="sitemap:priority = '0.8'"><span class="prio-badge prio-08">0.8</span></xsl:when>
                                                <xsl:otherwise><span class="prio-badge prio-low"><xsl:value-of select="sitemap:priority"/></span></xsl:otherwise>
                                            </xsl:choose>
                                        </td>
                                        
                                        <td class="meta-cell" style="text-align: center; text-transform: uppercase; font-size:11px; font-weight:700;">
                                            <xsl:value-of select="sitemap:changefreq"/>
                                        </td>
                                        
                                        <td class="meta-cell" style="text-align: center; font-variant-numeric: tabular-nums;">
                                            <xsl:choose>
                                                <xsl:when test="contains(sitemap:lastmod, 'T')">
                                                    <xsl:value-of select="substring-before(sitemap:lastmod, 'T')"/>
                                                    <span style="font-size:10px; color:#94a3b8; margin-left:4px;"><xsl:value-of select="substring(substring-after(sitemap:lastmod, 'T'), 1, 5)"/></span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="sitemap:lastmod"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    </div>
                    
                    <div class="footer-brand">
                        DECOGRI FACTORY AUDIT // PROCESSED AS VALID XML SCHEMA SYSTEM
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet> 
