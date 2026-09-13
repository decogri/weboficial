<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
xmlns:image="http://www.google.com/schemas/sitemap-image/1.1"
exclude-result-prefixes="sitemap image">


<xsl:output method="html" encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:template match="/">

    <html lang="es">

        <head>

            <meta charset="UTF-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

            <meta name="robots" content="noindex,follow"/>

            <title>Decogri | Sitemap XML</title>

            <link rel="icon"
                  type="image/jpeg"
                  href="https://decogri.com.ar/IMG/LOGO/logo-decogri.jpg"/>

            <style>
                :root {
                    --bg: #f5f6f8;
                    --card: #ffffff;
                    --text: #10141c;
                    --muted: #687386;
                    --gold: #bf953f;
                    --line: #e4e7ec;
                    --dark: #111827;
                    --green: #10b981;
                }

                * {
                    box-sizing: border-box;
                }

                body {
                    margin: 0;
                    padding: 40px 18px;
                    background: var(--bg);
                    color: var(--text);
                    font-family:
                        -apple-system,
                        BlinkMacSystemFont,
                        "Segoe UI",
                        Roboto,
                        Helvetica,
                        Arial,
                        sans-serif;
                }

                .container {
                    width: 100%;
                    max-width: 1150px;
                    margin: auto;
                    background: var(--card);
                    border: 1px solid var(--line);
                    border-radius: 14px;
                    overflow: hidden;
                    box-shadow: 0 18px 45px rgba(15,23,42,.06);
                }

                .header {
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                    gap: 25px;
                    padding: 30px 35px;
                    border-bottom: 1px solid var(--line);
                }

                .brand {
                    display: flex;
                    align-items: center;
                    gap: 18px;
                }

                .brand img {
                    width: 68px;
                    height: 68px;
                    object-fit: contain;
                    border-radius: 9px;
                }

                h1 {
                    margin: 0 0 7px;
                    font-size: 21px;
                    line-height: 1.2;
                }

                h1 span {
                    display: inline-block;
                    margin-left: 7px;
                    padding: 4px 8px;
                    border: 1px solid rgba(191,149,63,.25);
                    border-radius: 5px;
                    color: var(--gold);
                    background: rgba(191,149,63,.07);
                    font-size: 10px;
                    vertical-align: middle;
                }

                .description {
                    margin: 0;
                    color: var(--muted);
                    font-size: 13px;
                    line-height: 1.5;
                }

                .counter {
                    flex-shrink: 0;
                    padding: 11px 16px;
                    border-radius: 8px;
                    background: var(--dark);
                    color: white;
                    font-size: 11px;
                    font-weight: 700;
                    white-space: nowrap;
                }

                .counter-dot {
                    display: inline-block;
                    width: 7px;
                    height: 7px;
                    margin-right: 7px;
                    border-radius: 50%;
                    background: var(--green);
                }

                .info {
                    display: flex;
                    flex-wrap: wrap;
                    align-items: center;
                    gap: 9px;
                    padding: 17px 35px;
                    background: #fafafa;
                    border-bottom: 1px solid var(--line);
                }

                .label {
                    color: var(--muted);
                    font-size: 10px;
                    font-weight: 700;
                    text-transform: uppercase;
                    letter-spacing: .8px;
                }

                .sitemap-url {
                    color: var(--text);
                    font-size: 12px;
                    font-weight: 600;
                    word-break: break-all;
                }

                .status {
                    margin-left: auto;
                    padding: 5px 9px;
                    border-radius: 5px;
                    background: #ecfdf5;
                    color: #047857;
                    font-size: 10px;
                    font-weight: 700;
                }

                .table-wrap {
                    width: 100%;
                    overflow-x: auto;
                }

                table {
                    width: 100%;
                    border-collapse: collapse;
                }

                th {
                    padding: 14px 20px;
                    background: #fafafa;
                    color: var(--muted);
                    border-bottom: 1px solid var(--line);
                    font-size: 10px;
                    text-transform: uppercase;
                    letter-spacing: .7px;
                    text-align: left;
                }

                td {
                    padding: 15px 20px;
                    border-bottom: 1px solid #f0f2f5;
                    font-size: 13px;
                    vertical-align: middle;
                }

                .section td {
                    padding: 10px 20px;
                    background: #f8fafc;
                    color: #475569;
                    border-top: 1px solid var(--line);
                    border-bottom: 1px solid var(--line);
                    font-size: 10px;
                    font-weight: 800;
                    text-transform: uppercase;
                    letter-spacing: 1px;
                }

                .url {
                    color: var(--text);
                    text-decoration: none;
                    word-break: break-word;
                }

                .url:hover {
                    color: var(--gold);
                }

                .image-badge {
                    display: inline-block;
                    margin-top: 6px;
                    padding: 4px 7px;
                    border-radius: 4px;
                    background: var(--dark);
                    color: white;
                    font-size: 9px;
                    font-weight: 700;
                }

                .count {
                    display: inline-block;
                    min-width: 30px;
                    padding: 4px 7px;
                    border-radius: 5px;
                    background: #f1f5f9;
                    color: #475569;
                    font-size: 10px;
                    font-weight: 700;
                }

                .date {
                    color: var(--muted);
                    white-space: nowrap;
                    font-size: 12px;
                }

                .footer {
                    padding: 25px 20px;
                    border-top: 1px solid var(--line);
                    color: var(--muted);
                    text-align: center;
                    font-size: 10px;
                    letter-spacing: .4px;
                }

                .footer strong {
                    color: var(--gold);
                }

                @media (max-width: 700px) {

                    body {
                        padding: 12px 8px;
                    }

                    .header {
                        flex-direction: column;
                        text-align: center;
                        padding: 25px 18px;
                    }

                    .brand {
                        flex-direction: column;
                    }

                    .counter {
                        width: 100%;
                        text-align: center;
                    }

                    .info {
                        padding: 15px 18px;
                    }

                    .status {
                        margin-left: 0;
                    }

                    th,
                    td {
                        padding: 12px;
                    }
                }
            </style>

        </head>

        <body>

            <main class="container">

                <header class="header">

                    <div class="brand">

                        <img
                            src="https://decogri.com.ar/IMG/LOGO/logo-decogri.jpg"
                            alt="Logo Decogri"
                            width="68"
                            height="68"/>

                        <div>

                            <h1>
                                DECOGRI
                                <span>SITEMAP XML</span>
                            </h1>

                            <p class="description">
                                Mapa de URLs indexables de Decogri para buscadores y sistemas de rastreo.
                            </p>

                        </div>

                    </div>

                    <div class="counter">

                        <span class="counter-dot"></span>

                        <xsl:value-of select="count(sitemap:urlset/sitemap:url)"/>

                        <xsl:text> URLs INDEXABLES</xsl:text>

                    </div>

                </header>

                <div class="info">

                    <span class="label">Sitemap:</span>

                    <span class="sitemap-url">
                        https://decogri.com.ar/sitemap.xml
                    </span>

                    <span class="status">
                        XML ACTIVO
                    </span>

                </div>

                <div class="table-wrap">

                    <table>

                        <thead>

                            <tr>
                                <th>URL Canónica</th>
                                <th style="text-align:center;width:120px;">Imágenes</th>
                                <th style="text-align:center;width:150px;">Última modificación</th>
                            </tr>

                        </thead>

                        <tbody>

                            <xsl:for-each select="sitemap:urlset/sitemap:url">

                                <xsl:variable name="fullUrl" select="sitemap:loc"/>

                                <tr>

                                    <td>

                                        <a class="url"
                                           href="{$fullUrl}"
                                           target="_blank">

                                            <xsl:value-of select="$fullUrl"/>

                                        </a>

                                        <xsl:if test="image:image">

                                            <div class="image-badge">
                                                MULTIMEDIA
                                            </div>

                                        </xsl:if>

                                    </td>

                                    <td style="text-align:center;">

                                        <xsl:choose>

                                            <xsl:when test="image:image">

                                                <span class="count">

                                                    <xsl:value-of select="count(image:image)"/>

                                                    <xsl:text> IMG</xsl:text>

                                                </span>

                                            </xsl:when>

                                            <xsl:otherwise>

                                                <span class="count">—</span>

                                            </xsl:otherwise>

                                        </xsl:choose>

                                    </td>

                                    <td style="text-align:center;" class="date">

                                        <xsl:value-of select="sitemap:lastmod"/>

                                    </td>

                                </tr>

                            </xsl:for-each>

                        </tbody>

                    </table>

                </div>

                <footer class="footer">

                    DECOGRI FACTORY AUDIT //
                    <strong>SITEMAP XML INDEX</strong>
                    //
                    URLs CANÓNICAS DE PRODUCCIÓN

                </footer>

            </main>

        </body>

    </html>

</xsl:template>


</xsl:stylesheet>
