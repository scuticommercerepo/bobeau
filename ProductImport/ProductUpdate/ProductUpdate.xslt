<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:excel="urn:schemas-microsoft-com:office:spreadsheet"
				xmlns:y="urn:schemas-microsoft-com:office:spreadsheet"
				xmlns:o="urn:schemas-microsoft-com:office:office"
				xmlns:x="urn:schemas-microsoft-com:office:excel"
				xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
				xmlns:ml="http://marketlive.com/integration/xmlbean"
				xmlns:xs="http://www.w3.org/2001/XMLSchema"
				exclude-result-prefixes="y o x ss ml xs excel "
>

	<xsl:output method="xml" encoding="UTF-8" indent="no" cdata-section-elements="ml:name ml:long ml:moreInfo ml:value"/>
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
												<xsl:value-of select="." />
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>
									<xsl:variable name="productName">
										<xsl:for-each select="./y:Cell">
											<xsl:if test="position() = 2 ">
												<xsl:value-of select="." />
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>
									<xsl:variable name="longDesc">
										<xsl:for-each select="./y:Cell">
											<xsl:if test="position() = 3 ">
												<xsl:value-of select="." />
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>
									<xsl:variable name="fabricContent">
										<xsl:for-each select="./y:Cell">
											<xsl:if test="position() = 4 ">
												<xsl:value-of select="." />
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>
									<xsl:variable name="detailCareInst">
										<xsl:for-each select="./y:Cell">
											<xsl:if test="position() = 5 ">
												<xsl:value-of select="." />
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>

									<xsl:variable name="fit">
										<xsl:for-each select="./y:Cell">
											<xsl:if test="position() = 6 ">
												<xsl:value-of select="." />
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>
									<xsl:variable name="feature1">
										<xsl:for-each select="./y:Cell">
											<xsl:if test="position() = 7 ">
												<xsl:value-of select="." />
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>
									<xsl:variable name="feature2">
										<xsl:for-each select="./y:Cell">
											<xsl:if test="position() = 8 ">
												<xsl:value-of select="." />
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>
									<xsl:variable name="feature3">
										<xsl:for-each select="./y:Cell">
											<xsl:if test="position() = 9 ">
												<xsl:value-of select="." />
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>
									<xsl:variable name="feature4">
										<xsl:for-each select="./y:Cell">
											<xsl:if test="position() = 10 ">
												<xsl:value-of select="." />
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>
									<xsl:variable name="feature5">
										<xsl:for-each select="./y:Cell">
											<xsl:if test="position() = 11 ">
												<xsl:value-of select="." />
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>
									<xsl:variable name="madeIn">
										<xsl:for-each select="./y:Cell">
											<xsl:if test="position() = 12 ">
												<xsl:value-of select="." />
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>
									<!-- Start Building the XML from variables -->
									<ml:code><xsl:value-of select="$productCode" /></ml:code>
									<ml:attributePages>
										<xsl:if test="$fabricContent !='' ">
										<ml:attributePage>
											<ml:name>assignedAttributePage</ml:name>
											<ml:attributes>
												<ml:name>fabric_content</ml:name>
												<ml:value><xsl:value-of select="$fabricContent" /></ml:value>
											</ml:attributes>
										</ml:attributePage>
										</xsl:if>
										<xsl:if test="$detailCareInst !='' ">
										<ml:attributePage>
											<ml:name>assignedAttributePage</ml:name>
											<ml:attributes>
												<ml:name>Detailed care instructions</ml:name>
												<ml:value><xsl:value-of select="$detailCareInst" /></ml:value>
											</ml:attributes>
										</ml:attributePage>
										</xsl:if>
										<xsl:if test="$fit !='' ">
										<ml:attributePage>
											<ml:name>assignedAttributePage</ml:name>
											<ml:attributes>
												<ml:name>fit</ml:name>
												<ml:value><xsl:value-of select="$fit" /></ml:value>
											</ml:attributes>
										</ml:attributePage>
										</xsl:if>
										<xsl:if test="$feature1 !='' ">
										<ml:attributePage>
											<ml:name>assignedAttributePage</ml:name>
											<ml:attributes>
												<ml:name>feature1</ml:name>
												<ml:value><xsl:value-of select="$feature1" /></ml:value>
											</ml:attributes>
										</ml:attributePage>
										</xsl:if>
										<xsl:if test="$feature2 !='' ">
										<ml:attributePage>
											<ml:name>assignedAttributePage</ml:name>
											<ml:attributes>
												<ml:name>feature2</ml:name>
												<ml:value><xsl:value-of select="$feature2" /></ml:value>
											</ml:attributes>
										</ml:attributePage>
										</xsl:if>
										<xsl:if test="$feature3 !='' ">
										<ml:attributePage>
											<ml:name>assignedAttributePage</ml:name>
											<ml:attributes>
												<ml:name>feature3</ml:name>
												<ml:value><xsl:value-of select="$feature3" /></ml:value>
											</ml:attributes>
										</ml:attributePage>
										</xsl:if>
										<xsl:if test="$feature4 !='' ">
										<ml:attributePage>
											<ml:name>assignedAttributePage</ml:name>
											<ml:attributes>
												<ml:name>feature4</ml:name>
												<ml:value><xsl:value-of select="$feature4" /></ml:value>
											</ml:attributes>
										</ml:attributePage>
										</xsl:if>
										<xsl:if test="$feature5 !='' ">
										<ml:attributePage>
											<ml:name>assignedAttributePage</ml:name>
											<ml:attributes>
												<ml:name>feature5</ml:name>
												<ml:value><xsl:value-of select="$feature5" /></ml:value>
											</ml:attributes>
										</ml:attributePage>
										</xsl:if>
										<xsl:if test="$madeIn !='' ">
										<ml:attributePage>
											<ml:name>assignedAttributePage</ml:name>
											<ml:attributes>
												<ml:name>made in</ml:name>
												<ml:value><xsl:value-of select="$madeIn" /></ml:value>
											</ml:attributes>
										</ml:attributePage>
										</xsl:if>
									</ml:attributePages>
									<ml:descriptionPages>
										<ml:descriptionPage locale="en_US">
											<ml:siteDescriptions>
												<ml:siteDescription siteCode="bobeau">
													<ml:name>
														<xsl:value-of select="$productName" />
													</ml:name>
													<ml:long>
														<xsl:value-of select="$longDesc" />
													</ml:long>
												</ml:siteDescription>
											</ml:siteDescriptions>
										</ml:descriptionPage>
									</ml:descriptionPages>
								</ml:product>
							</xsl:if>
						</xsl:for-each>
					</ml:products>
				</ml:command>
			</ml:import>
		</ml:marketlive>
	</xsl:template>
</xsl:stylesheet>
