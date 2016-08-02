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
                    <ml:products>
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
                                <xsl:variable name="color">
                                    <xsl:for-each select="./y:Cell">
                                        <xsl:if test="position() = 4 ">
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

                                <ml:product>
                                    <ml:code>
                                        <xsl:value-of select="$product_code"/>
                                    </ml:code>
                                    <ml:active>false</ml:active>
                                    <ml:deleted>false</ml:deleted>
                                    <ml:descriptionPages>
                                        <ml:descriptionPage locale="en_US">
                                            <ml:siteDescriptions>
                                                <ml:siteDescription siteCode="bobeau">
                                                    <ml:name>
                                                        <xsl:value-of select="$product_name"/>
                                                    </ml:name>
                                                </ml:siteDescription>
                                            </ml:siteDescriptions>
                                        </ml:descriptionPage>
                                    </ml:descriptionPages>
                                    <ml:siteProductLinks>
                                        <ml:siteProductLink>
                                            <ml:productCode>
                                                <xsl:value-of select="$product_code"/>
                                            </ml:productCode>
                                            <ml:siteCode>bobeau</ml:siteCode>
                                        </ml:siteProductLink>
                                    </ml:siteProductLinks>
                                    <ml:productOptionTypeLinks>
                                        <ml:productOptionTypeLink>
                                            <ml:productCode>
                                                <xsl:value-of select="$product_code"/>
                                            </ml:productCode>
                                            <ml:optionTypeCode>COLOR</ml:optionTypeCode>
                                            <ml:ordinal>0</ml:ordinal>
                                            <ml:isSwatch>false</ml:isSwatch>
                                        </ml:productOptionTypeLink>
                                        <ml:productOptionTypeLink>
                                            <ml:productCode>
                                                <xsl:value-of select="$product_code"/>
                                            </ml:productCode>
                                            <ml:optionTypeCode>SIZE</ml:optionTypeCode>
                                            <ml:ordinal>0</ml:ordinal>
                                            <ml:isSwatch>false</ml:isSwatch>
                                        </ml:productOptionTypeLink>
                                    </ml:productOptionTypeLinks>

                                    <ml:skus>
                                        <ml:sku>
                                            <ml:code>
                                                <xsl:value-of select="$skuCode"/>
                                            </ml:code>
                                            <ml:skuTypeId>1</ml:skuTypeId>
                                            <ml:active>true</ml:active>
                                            <ml:taxable>true</ml:taxable>
                                            <ml:shippingChargeable>true</ml:shippingChargeable>
                                            <ml:deleted>false</ml:deleted>
                                            <ml:dateActivate><xsl:value-of select="date:date-time()"/></ml:dateActivate>
                                            <ml:dateDeactivate>2046-07-29T12:48:31-07:00</ml:dateDeactivate>
                                            <ml:skuOptionLinks>
                                                <ml:skuOptionLink>
                                                    <xsl:if test="$color !=''">
                                                        <ml:skuCode>
                                                            <xsl:value-of select="$skuCode"/>
                                                        </ml:skuCode>
                                                        <ml:optionCode>
                                                            <xsl:value-of select="$color"/>
                                                        </ml:optionCode>
                                                        <ml:optionTypeCode>COLOR</ml:optionTypeCode>
                                                    </xsl:if>

                                                </ml:skuOptionLink>
                                                <ml:skuOptionLink>
                                                    <xsl:if test="$size !=''">
                                                        <ml:skuCode>
                                                            <xsl:value-of select="$skuCode"/>
                                                        </ml:skuCode>
                                                        <ml:optionCode>
                                                            <xsl:value-of select="$size"/>
                                                        </ml:optionCode>
                                                        <ml:optionTypeCode>SIZE</ml:optionTypeCode>
                                                    </xsl:if>
                                                </ml:skuOptionLink>
                                            </ml:skuOptionLinks>
                                            <ml:productSkuLinks>
                                                <ml:productSkuLink>
                                                    <ml:productCode>
                                                        <xsl:value-of select="$product_code"/>
                                                    </ml:productCode>
                                                    <ml:skuCode>
                                                        <xsl:value-of select="$skuCode"/>
                                                    </ml:skuCode>
                                                    <ml:defaultProduct>false</ml:defaultProduct>
                                                </ml:productSkuLink>
                                            </ml:productSkuLinks>
                                            <ml:inventories>
                                                <ml:inventory>
                                                    <ml:code>
                                                        <xsl:value-of select="$skuCode"/>
                                                    </ml:code>
                                                    <ml:deleted>false</ml:deleted>
                                                    <ml:ordinal>0</ml:ordinal>
                                                    <ml:stock>0</ml:stock>
                                                    <ml:minStock>0</ml:minStock>
                                                    <ml:inventorySetCode>bobeau</ml:inventorySetCode>
                                                </ml:inventory>
                                            </ml:inventories>
                                            <ml:prices>
                                                <ml:price currency="USD">
                                                    <ml:regularPrice>
                                                        <xsl:value-of select="$price"/>
                                                    </ml:regularPrice>
                                                    <ml:salePrice>
                                                        <xsl:value-of select="$price"/>
                                                    </ml:salePrice>
                                                </ml:price>
                                            </ml:prices>
                                        </ml:sku>
                                    </ml:skus>
                                </ml:product>
                            </xsl:if>
                        </xsl:for-each>
                    </ml:products>
                </ml:command>
            </ml:import>
        </ml:marketlive>
    </xsl:template>
</xsl:stylesheet>
