<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:t="urn:schemas-microsoft-com:office:spreadsheet"
                xmlns:y="urn:schemas-microsoft-com:office:spreadsheet" xmlns:o="urn:schemas-microsoft-com:office:office"
                xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
                xmlns:ml="http://marketlive.com/integration/xmlbean"
                xmlns:date="http://exslt.org/dates-and-times"
                extension-element-prefixes="date"
                xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="y o x ss ml xs t">

    <xsl:output method="xml" encoding="UTF-8" indent="no"
                cdata-section-elements="ml:urlValue ml:title ml:metaDescription ml:metaKeywords"/>

    <xsl:strip-space elements="*"/>

    <xsl:template match="text()"/>
    <!-- TEMPLATE MAIN -->
    <xsl:template match="y:Table">
        <ml:marketlive>
            <ml:import>
                <ml:command type="create">
                    <ml:options>
                        <xsl:for-each select="y:Row">
                            <xsl:if test="position() != 1 ">

                                <!-- variable definition starts -->
                                <xsl:variable name="product_code">
                                    <xsl:for-each select="./y:Cell">
                                        <xsl:if test="position() = 2 ">
                                            <xsl:value-of select="."/>
                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:variable>
                                <xsl:variable name="product_name">
                                    <xsl:for-each select="./y:Cell">
                                        <xsl:if test="position() = 3 ">
                                            <xsl:value-of select="."/>
                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:variable>
                                <xsl:variable name="colorCode">
                                    <xsl:for-each select="./y:Cell">
                                        <xsl:if test="position() = 4 ">
                                            <xsl:value-of select="."/>
                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:variable>
								 <xsl:variable name="color">
                                    <xsl:for-each select="./y:Cell">
                                        <xsl:if test="position() = 5 ">
                                            <xsl:value-of select="."/>
                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:variable>
                                <xsl:variable name="size">
                                    <xsl:for-each select="./y:Cell">
                                        <xsl:if test="position() = 7 ">
                                            <xsl:value-of select="."/>
                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:variable>
                                <xsl:variable name="skuCode">
                                    <xsl:for-each select="./y:Cell">
                                        <xsl:if test="position() = 9 ">
                                            <xsl:value-of select="."/>
                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:variable>
                                <xsl:variable name="price">
                                    <xsl:for-each select="./y:Cell">
                                        <xsl:if test="position() = 10 ">
                                            <xsl:value-of select="."/>
                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:variable>
                                <!-- variable definition ends -->
								<xsl:if test="$colorCode != '' ">
									<ml:option>
										<ml:code><xsl:value-of select="$colorCode"/></ml:code>
										<ml:ordinal>1</ml:ordinal>
										<ml:optionTypeCode>COLOR</ml:optionTypeCode>
										<ml:descriptionPages>
											<ml:descriptionPage locale="en_US">
												<ml:name><xsl:value-of select="$color"/></ml:name>
											</ml:descriptionPage>
										</ml:descriptionPages>
									</ml:option>
								</xsl:if>
								<xsl:if test="$size != '' ">
									<ml:option>
										<ml:code><xsl:value-of select="$size"/></ml:code>
										<ml:ordinal>1</ml:ordinal>
										<ml:optionTypeCode>SIZE</ml:optionTypeCode>
										<ml:descriptionPages>
											<ml:descriptionPage locale="en_US">
												<ml:name><xsl:value-of select="$size"/></ml:name>
											</ml:descriptionPage>
										</ml:descriptionPages>
									</ml:option>
								</xsl:if>
                            </xsl:if>
                        </xsl:for-each>
                    </ml:options>
                </ml:command>
            </ml:import>
        </ml:marketlive>
    </xsl:template>
</xsl:stylesheet>
