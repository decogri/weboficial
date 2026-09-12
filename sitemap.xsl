<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
xmlns:image="http://www.google.com/schemas/sitemap-image/1.1"
exclude-result-prefixes="sitemap image">

```
<xsl:output method="html"
            version="1.0"
            encoding="UTF-8"
            indent="yes"/>

<xsl:template match="/">

    <html lang="es">

        <head>

            <meta charset="UTF-8"/>

            <meta name="viewport"
                  content="width=device-width, initial-scale=1.0"/>

            <title>Decogri | Sitemap XML</title>

            <link rel="icon"
                  type="image/jpeg"
                  href="https://decogri.com.ar/IMG/LOGO/logo-decogri.jpg"/>

            <style>

                :root {
                    --bg-main: #f6f8fa;
                    --card-bg: #ffffff;
                    --text-main: #0b0f19;
                    --text-muted: #64748b;
                    --accent-gold: #bf953f;
                    --accent-gold-light: rgba(191,149,63,0.07);
                    --border-color: #e2e8f0;
                    --dark: #0f172a;
                    --success: #10b981;
                    --radius: 14px;
                }

                * {
                    box-sizing: border-box;
                }

                html {
                    scroll-behavior: smooth;
                }

                body {
                    margin: 0;
                    padding: 50px 20px;
                    background: var(--bg-main);
                    color: var(--text-main);
                    font-family:
                        -apple-system,
                        BlinkMacSystemFont,
                        "Segoe UI",
                        Roboto,
                        Helvetica,
                        Arial,
                        sans-serif;
                    -webkit-font-smoothing: antialiased;
                }

                .container {
                    width: 100%;
                    max-width: 1150px;
                    margin: 0 auto;
                    background: var(--card-bg);
                    border: 1px solid var(--border-color);
                    border-radius: var(--radius);
                    box-shadow:
                        0 20px 45px rgba(15,23,42,0.05);
                    overflow: hidden;
                }

                /* ================================
                   HEADER
                   ================================ */

                .header-area {
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                    gap: 30px;
                    padding: 32px 38px;
                    border-bottom: 1px solid var(--border-color);
                }

                .brand-group {
                    display: flex;
                    align-items: center;
                    gap: 20px;
                    min-width: 0;
                }

                .logo-wrapper {
                    flex: 0 0 auto;
                }

                .logo-wrapper img {
                    width: 72px;
                    height: 72px;
                    object-fit: contain;
                    border-radius: 10px;
                    filter:
                        drop-shadow(
                            0 5px 12px
                            rgba(191,149,63,0.15)
                        );
                }

                .brand-info {
                    min-width: 0;
                }

                h1 {
                    margin: 0 0 8px;
                    font-size: 21px;
                    line-height: 1.2;
                    font-weight: 700;
                    letter-spacing: -0.5px;
                }

                h1 span {
                    display: inline-block;
                    margin-left: 8px;
                    padding: 4px 8px;
                    border-radius: 6px;
                    border: 1px solid rgba(191,149,63,0.25);
                    background: var(--accent-gold-light);
                    color: var(--accent-gold);
                    font-size: 11px;
                    font-weight: 600;
                    letter-spacing: 0.3px;
                    vertical-align: middle;
                }

                .desc {
                    margin: 0;
                    color: var(--text-muted);
                    font-size: 13px;
                    line-height: 1.6;
                }

                /* ================================
                   COUNTER
                   ================================ */

                .counter {
                    display: flex;
                    align-items: center;
                    gap: 9px;
                    flex: 0 0 auto;
                    padding: 11px 16px;
                    background: var(--dark);
                    color: #f8fafc;
                    border-radius: 8px;
                    font-size: 11px;
                    font-weight: 700;
                    letter-spacing: 0.5px;
                    white-space: nowrap;
                }

                .counter span {
                    width: 8px;
                    height: 8px;
                    display: inline-block;
                    border-radius: 50%;
                    background: var(--success);
                    box-shadow:
                        0 0 10px rgba(16,185,129,0.8);
                }

                /* ================================
                   INFO BAR
                   ================================ */

                .info-bar {
                    display: flex;
                    flex-wrap: wrap;
                    align-items: center;
                    gap: 10px;
                    padding: 18px 38px;
                    background: #fafafa;
                    border-bottom: 1px solid var(--border-color);
                }

                .info-label {
                    color: var(--text-muted);
                    font-size: 11px;
                    font-weight: 700;
                    text-transform: uppercase;
                    letter-spacing: 0.8px;
                }

                .info-url {
                    color: var(--text-main);
                    font-size: 12px;
                    font-weight: 600;
                    word-break: break-all;
                }

                .status {
                    display: inline-flex;
                    align-items: center;
                    gap: 6px;
                    margin-left: auto;
                    padding: 5px 9px;
                    border-radius: 5px;
                    background: #ecfdf5;
                    color: #047857;
                    font-size: 10px;
                    font-weight: 700;
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                }

                .status-dot {
                    width: 6px;
                    height: 6px;
                    border-radius: 50%;
                    background: var(--success);
                }

                /* ================================
                   TABLE
                   ================================ */

                .table-wrapper {
                    width: 100%;
                    overflow-x: auto;
                }

                table {
                    width: 100%;
                    border-collapse: collapse;
                    text-align: left;
                }

                th {
                    padding: 14px 20px;
                    background: #fafafa;
                    color: var(--text-muted);
                    border-bottom: 1px solid var(--border-color);
                    font-size: 10px;
                    font-weight: 700;
                    text-transform: uppercase;
                    letter-spacing: 0.8px;
                    white-space: nowrap;
                }

                td {
                    padding: 16px 20px;
                    background: #ffffff;
                    border-bottom: 1px solid #f1f5f9;
                    font-size: 13px;
                    vertical-align: middle;
                }

                /* ================================
                   SECTION ROWS
                   ================================ */

                .section-row td {
                    padding: 11px 20px;
                    background: #f8fafc !important;
                    color: #475569;
                    border-top: 1px solid var(--border-color);
                    border-bottom: 1px solid var(--border-color);
                    font-size: 10px;
                    font-weight: 800;
                    text-transform: uppercase;
                    letter-spacing: 1.2px;
                }

                /* ================================
                   DATA ROWS
                   ================================ */

                tbody tr.data-row {
                    cursor: pointer;
                    transition:
                        background-color 0.15s ease,
                        box-shadow 0.15s ease;
                }

                tbody tr.data-row:hover td {
                    background: var(--accent-gold-light);
                }

                tbody tr.data-row:hover {
                    box-shadow:
                        inset 4px 0 0 var(--accent-gold);
                }

                /* ================================
                   URL
                   ================================ */

                .url-link {
                    display: block;
                    color: #94a3b8;
                    text-decoration: none;
                    font-size: 12px;
                    line-height: 1.6;
                    word-break: break-word;
                }

                .url-link strong {
                    color: var(--text-main);
                    font-size: 13px;
                    font-weight: 650;
                }

                tbody tr.data-row:hover
                .url-link strong {
                    color: var(--accent-gold);
                }

                /* ================================
                   IMAGE BADGE
                   ================================ */

                .img-indicator {
                    display: inline-flex;
                    align-items: center;
                    gap: 5px;
                    margin-top: 7px;
                    padding: 4px 8px;
                    border-radius: 4px;
                    background: var(--dark);
                    color: #ffffff;
                    font-size: 9px;
                    font-weight: 700;
                    letter-spacing: 0.4px;
                }

                /* ================================
                   LASTMOD
                   ================================ */

                .lastmod {
                    color: var(--text-muted);
                    font-size: 12px;
                    font-variant-numeric: tabular-nums;
                    white-space: nowrap;
                }

                /* ================================
                   IMAGE COUNT
                   ================================ */

                .media-count {
                    display: inline-flex;
                    align-items: center;
                    justify-content: center;
                    min-width: 30px;
                    padding: 4px 7px;
                    border-radius: 5px;
                    background: #f1f5f9;
                    color: #475569;
                    font-size: 10px;
                    font-weight: 700;
                }

                /* ================================
                   FOOTER
                   ================================ */

                .footer-brand {
                    padding: 28px 20px;
                    text-align: center;
                    color: var(--text-muted);
                    font-size: 10px;
                    line-height: 1.6;
                    letter-spacing: 0.5px;
                    border-top: 1px solid var(--border-color);
                }

                .footer-brand strong {
                    color: var(--accent-gold);
                }

                /* ================================
                   RESPONSIVE
                   ================================ */

                @media (max-width: 768px) {

                    body {
                        padding: 15px 10px;
                    }

                    .header-area {
                        flex-direction: column;
                        align-items: center;
                        text-align: center;
                        padding: 25px 20px;
                    }

                    .brand-group {
                        flex-direction: column;
                    }

                    .counter {
                        width: 100%;
                        justify-content: center;
                    }

                    .info-bar {
                        padding: 15px 20px;
                    }

                    .status {
                        margin-left: 0;
                    }

                    th {
                        padding: 12px;
                    }

                    td {
                        padding: 14px 12px;
                    }

                    th:nth-child(3),
                    td:nth-child(3) {
                        display: none;
                    }

                    .url-link {
                        font-size: 11px;
                    }

                }

            </style>

        </head>

        <body>

            <div class="container">

                <!-- =========================================
                     HEADER
                     ========================================= -->

                <div class="header-area">

                    <div class="brand-group">

                        <div class="logo-wrapper">
                            <img
                                src="https://decogri.com.ar/IMG/LOGO/logo-decogri.jpg"
                                alt="Logo Decogri"/>
                        </div>

                        <div class="brand-info">

                            <h1>
                                DECOGRI
                                <span>SITEMAP XML</span>
                            </h1>

                            <p class="desc">
                                Mapa de URLs indexables de Decogri para
                                buscadores y sistemas de rastreo.
                            </p>

                        </div>

                    </div>

                    <div class="counter">

                        <span/>

                        <xsl:value-of
                            select="count(sitemap:urlset/sitemap:url)"/>

                        <xsl:text> URLs INDEXABLES</xsl:text>

                    </div>

                </div>


                <!-- =========================================
                     INFORMATION BAR
                     ========================================= -->

                <div class="info-bar">

                    <span class="info-label">
                        Sitemap:
                    </span>

                    <span class="info-url">
                        https://decogri.com.ar/sitemap.xml
                    </span>

                    <span class="status">
                        <span class="status-dot"/>
                        XML ACTIVO
                    </span>

                </div>


                <!-- =========================================
                     TABLE
                     ========================================= -->

                <div class="table-wrapper">

                    <table>

                        <thead>

                            <tr>

                                <th>
                                    URL Canónica
                                </th>

                                <th style="text-align:center;width:120px;">
                                    Imágenes
                                </th>

                                <th style="text-align:center;width:160px;">
                                    Última modificación
                                </th>

                            </tr>

                        </thead>

                        <tbody>

                            <xsl:for-each
                                select="sitemap:urlset/sitemap:url">

                                <xsl:variable
                                    name="fullUrl"
                                    select="sitemap:loc"/>


                                <!-- =====================================
                                     HOME
                                     ===================================== -->

                                <xsl:if test="position() = 1">

                                    <tr class="section-row">

                                        <td colspan="3">
                                            HOME &amp; CORE
                                        </td>

                                    </tr>

                                </xsl:if>


                                <!-- =====================================
                                     SILLONES
                                     ===================================== -->

                                <xsl:if test="
                                    contains(
                                        $fullUrl,
                                        '/PRODUCTOS/SILLONES/'
                                    )
                                    and
                                    not(
                                        contains(
                                            preceding-sibling::sitemap:url[1]/sitemap:loc,
                                            '/PRODUCTOS/SILLONES/'
                                        )
                                    )
                                ">

                                    <tr class="section-row">

                                        <td colspan="3">
                                            LÍNEA SILLONES A MEDIDA
                                        </td>

                                    </tr>

                                </xsl:if>


                                <!-- =====================================
                                     MUEBLES
                                     ===================================== -->

                                <xsl:if test="
                                    (
                                        contains($fullUrl, '/PRODUCTOS/MESAS/')
                                        or
                                        contains($fullUrl, '/PRODUCTOS/RESPALDOS/')
                                        or
                                        contains($fullUrl, '/PRODUCTOS/SILLAS-BANQUETAS/')
                                        or
                                        contains($fullUrl, '/PRODUCTOS/PUFF/')
                                    )
                                    and
                                    not(
                                        contains(
                                            preceding-sibling::sitemap:url[1]/sitemap:loc,
                                            '/PRODUCTOS/MESAS/'
                                        )
                                        or
                                        contains(
                                            preceding-sibling::sitemap:url[1]/sitemap:loc,
                                            '/PRODUCTOS/RESPALDOS/'
                                        )
                                        or
                                        contains(
                                            preceding-sibling::sitemap:url[1]/sitemap:loc,
                                            '/PRODUCTOS/SILLAS-BANQUETAS/'
                                        )
                                        or
                                        contains(
                                            preceding-sibling::sitemap:url[1]/sitemap:loc,
                                            '/PRODUCTOS/PUFF/'
                                        )
                                    )
                                ">

                                    <tr class="section-row">

                                        <td colspan="3">
                                            MOBILIARIO DE DISEÑO &amp; INTERIOR
                                        </td>

                                    </tr>

                                </xsl:if>


                                <!-- =====================================
                                     TEXTILES
                                     ===================================== -->

                                <xsl:if test="
                                    contains(
                                        $fullUrl,
                                        '/PRODUCTOS/TEXTILES/'
                                    )
                                    and
                                    not(
                                        contains(
                                            preceding-sibling::sitemap:url[1]/sitemap:loc,
                                            '/PRODUCTOS/TEXTILES/'
                                        )
                                    )
                                ">

                                    <tr class="section-row">

                                        <td colspan="3">
                                            TEXTILES &amp; CONFECCIÓN A MEDIDA
                                        </td>

                                    </tr>

                                </xsl:if>


                                <!-- =====================================
                                     DATA ROW
                                     ===================================== -->

                                <tr
                                    class="data-row"
                                    onclick="window.open('{$fullUrl}', '_blank')">

                                    <td>

                                        <span
                                            class="url-link"
                                            onclick="event.stopPropagation();">

                                            https://decogri.com.ar/<strong>
                                                <xsl:value-of
                                                    select="
                                                        substring-after(
                                                            $fullUrl,
                                                            'https://decogri.com.ar/'
                                                        )
                                                    "/>
                                            </strong>

                                        </span>


                                        <!-- IMAGE INDICATOR -->

                                        <xsl:if test="image:image">

                                            <span class="img-indicator">
                                                ⚡ MULTIMEDIA MAP SYNCED
                                            </span>

                                        </xsl:if>

                                    </td>


                                    <!-- IMAGE COUNT -->

                                    <td style="text-align:center;">

                                        <xsl:choose>

                                            <xsl:when test="image:image">

                                                <span class="media-count">

                                                    <xsl:value-of
                                                        select="
                                                            count(image:image)
                                                        "/>

                                                    <xsl:text>
                                                        IMG
                                                    </xsl:text>

                                                </span>

                                            </xsl:when>

                                            <xsl:otherwise>

                                                <span class="media-count">
                                                    —
                                                </span>

                                            </xsl:otherwise>

                                        </xsl:choose>

                                    </td>


                                    <!-- LAST MOD -->

                                    <td
                                        class="lastmod"
                                        style="text-align:center;">

                                        <xsl:choose>

                                            <xsl:when
                                                test="contains(sitemap:lastmod,'T')">

                                                <xsl:value-of
                                                    select="
                                                        substring-before(
                                                            sitemap:lastmod,
                                                            'T'
                                                        )
                                                    "/>

                                            </xsl:when>

                                            <xsl:otherwise>

                                                <xsl:value-of
                                                    select="sitemap:lastmod"/>

                                            </xsl:otherwise>

                                        </xsl:choose>

                                    </td>

                                </tr>

                            </xsl:for-each>

                        </tbody>

                    </table>

                </div>


                <!-- =========================================
                     FOOTER
                     ========================================= -->

                <div class="footer-brand">

                    DECOGRI FACTORY AUDIT //
                    <strong>SITEMAP XML INDEX</strong>
                    //
                    URLs CANÓNICAS DE PRODUCCIÓN

                </div>

            </div>

        </body>

    </html>

</xsl:template>
```

</xsl:stylesheet>
