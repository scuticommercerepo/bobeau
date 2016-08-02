<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:excel="urn:schemas-microsoft-com:office:spreadsheet"
                xmlns:y="urn:schemas-microsoft-com:office:spreadsheet"
                xmlns:o="urn:schemas-microsoft-com:office:office"
                xmlns:x="urn:schemas-microsoft-com:office:excel"
                xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
                xmlns:ml="http://marketlive.com/integration/xmlbean"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="y o x ss ml xs excel "
>

    <xsl:output method="xml" encoding="UTF-8" indent="no"
                cdata-section-elements="ml:name ml:long ml:moreInfo ml:value ml:contentText ml:contentFile"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="text()"/>
    <!-- TEMPLATE MAIN  -->
    <xsl:template match="y:Table">
        <ml:marketlive>
            <ml:import>
                <ml:command type="update">
                    <ml:products>
                        <xsl:for-each select="y:Row">

                            <xsl:if test="position() != 1 ">

                                <ml:product>
                                    <xsl:variable name="productCode">
                                        <xsl:for-each select="./y:Cell">
                                            <xsl:if test="position() = 1 ">
                                                <xsl:value-of select="."/>
                                            </xsl:if>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:variable name="productName">
                                        <xsl:for-each select="./y:Cell">
                                            <xsl:if test="position() = 2 ">
                                                <xsl:value-of select="."/>
                                            </xsl:if>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:variable name="longDesc">
                                        <xsl:for-each select="./y:Cell">
                                            <xsl:if test="position() = 3 ">
                                                <xsl:value-of select="."/>
                                            </xsl:if>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:variable name="topic1">
                                        <xsl:for-each select="./y:Cell">
                                            <xsl:if test="position() = 4 ">
                                                <xsl:value-of select="."/>
                                            </xsl:if>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:variable name="topic2">
                                        <xsl:for-each select="./y:Cell">
                                            <xsl:if test="position() = 5 ">
                                                <xsl:value-of select="."/>
                                            </xsl:if>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:variable name="topic2Text">
                                        <xsl:for-each select="./y:Cell">
                                            <xsl:if test="position() = 6 ">
                                                <xsl:value-of select="."/>
                                            </xsl:if>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:variable name="topic4">
                                        <xsl:for-each select="./y:Cell">
                                            <xsl:if test="position() = 7 ">
                                                <xsl:value-of select="."/>
                                            </xsl:if>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <!-- Start Building the XML from variables -->
                                    <ml:code>
                                        <xsl:value-of select="$productCode"/>
                                    </ml:code>
                                    <ml:descriptionPages>
                                        <ml:descriptionPage locale="en_US">
                                            <ml:siteDescriptions>
                                                <ml:siteDescription siteCode="bobeau">
                                                    <ml:name>
                                                        <xsl:value-of select="$productName"/>
                                                    </ml:name>
                                                    <ml:long>
                                                        <xsl:value-of select="$longDesc"/>
                                                    </ml:long>
                                                </ml:siteDescription>
                                            </ml:siteDescriptions>
                                        </ml:descriptionPage>
                                    </ml:descriptionPages>
                                    <ml:productInfoPages>
                                        <ml:productInfoPage locale="en_US">
                                            <ml:topics>
											<xsl:if test="$topic1 !='' ">
                                                <ml:topic>
                                                    <ml:code>TOPIC_1</ml:code>
                                                    <ml:contentText>
                                                        <xsl:value-of select="$topic1"/>
                                                    </ml:contentText>
                                                    <ml:contentType>2</ml:contentType>
                                                </ml:topic>
												</xsl:if>
												<xsl:if test="$topic2 !='' ">
                                                <ml:topic>
                                                    <ml:code>TOPIC_2</ml:code>
                                                    <ml:contentFile>
                                                        <xsl:value-of select="$topic2"/>
                                                    </ml:contentFile>
                                                    <ml:contentType>1</ml:contentType>
                                                </ml:topic>
												</xsl:if>
												<xsl:if test="$topic2Text !='' ">
                                                <ml:topic>
                                                    <ml:code>TOPIC_2</ml:code>
                                                    <ml:contentText>
                                                        <xsl:value-of select="$topic2Text"/>
                                                    </ml:contentText>
                                                    <ml:contentType>2</ml:contentType>
                                                </ml:topic>
												</xsl:if>
												<xsl:if test="$topic4 !='' ">
                                                <ml:topic>
                                                    <ml:code>TOPIC_4</ml:code>
                                                    <ml:contentText>
                                                        <xsl:value-of select="$topic4"/>
                                                    </ml:contentText>
                                                    <ml:contentType>2</ml:contentType>
                                                </ml:topic>
												</xsl:if>
                                            </ml:topics>
                                        </ml:productInfoPage>
                                    </ml:productInfoPages>
                                </ml:product>
                            </xsl:if>
                        </xsl:for-each>
                    </ml:products>
                </ml:command>
            </ml:import>
        </ml:marketlive>
    </xsl:template>
</xsl:stylesheet>
