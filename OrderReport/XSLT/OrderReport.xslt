<?xml version='1.0' ?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ml="http://marketlive.com/integration/xmlbean"
				xmlns:c="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="ml xs">

	<xsl:output method="text"/>
	<xsl:template match="/">
		<xsl:variable name="tabCharacter" select="'&#9;'"/>
		<xsl:variable name="newLineCharacter" select="'&#10;'"/>
		<xsl:variable name="tiltCharacter" select="'&#126;'"/>
		<xsl:variable name="pipeCharacter" select="'&#124;'"/>
		<xsl:for-each select="ml:marketlive/ml:results/ml:result">
			<xsl:text>Order #	Order Date	First Name	Last Name	Ship State	Ship City	Ship Postal Code	Item#	Product Name	Qty. Order	Price each	Item Discount	Total Price	Merchandise total 	Order Discount	Shipping 	Discounted Shipping	Tax	Total Invoiced	Coupon Code	Payment Method</xsl:text>

			<xsl:for-each select="ml:output/ml:orders/ml:order">
				<xsl:value-of select="$newLineCharacter"/>

				<xsl:variable name="orderDiscountAmount">
					<xsl:value-of select="sum(ml:discounts/ml:discount/ml:amount)"/>
				</xsl:variable>

				<xsl:variable name="orderCouponCode">
					<xsl:for-each select="ml:discounts/ml:discount">
						<xsl:value-of select="ml:sourceCodesAsString"/>
					</xsl:for-each>
				</xsl:variable>

				<xsl:variable name="orderCode" select="ml:code"/>
				<xsl:variable name="orderCustomerCode" select="ml:customerCode"/>
				<xsl:variable name="orderStatus" select="ml:status"/>
				<xsl:variable name="orderSubTotal" select="ml:subTotal"/>
				<xsl:variable name="orderTaxTotal" select="ml:taxTotal"/>
				<xsl:variable name="orderShippingTotal" select="ml:shippingTotal"/>
				<xsl:variable name="orderShippingCostTotal" select="ml:shippingCostTotal"/>
				<xsl:variable name="orderShippingMethodTotal" select="ml:shippingMethodTotal"/>
				<xsl:variable name="orderShippingWeightTotal" select="ml:shippingWeightTotal"/>
				<xsl:variable name="orderShippingLocationTotal" select="ml:shippingLocationTotal"/>
				<xsl:variable name="orderGiftWrapTotal" select="ml:giftWrapTotal"/>
				<xsl:variable name="orderAdditionalAddressTotal" select="ml:additionalAddressTotal"/>
				<xsl:variable name="orderAdditionalChargesTotal" select="ml:additionalChargesTotal"/>
				<xsl:variable name="orderWeightSurchargeTotal" select="ml:weightSurchargeTotal"/>
				<xsl:variable name="orderTotal" select="ml:total"/>
				<xsl:variable name="orderMerchandiseTotal" select="ml:merchandiseTotal"/>
				<xsl:variable name="orderDeferred" select="ml:deferred"/>
				<xsl:variable name="orderMultipleAddresses" select="ml:multipleAddresses"/>
				<xsl:variable name="orderDeleted" select="ml:deleted"/>
				<xsl:variable name="orderDateOrdered" select="ml:dateOrdered"/>
				<xsl:variable name="billToInfoCode" select="ml:billToInfo/ml:code"/>



				<xsl:variable name="payments">
					<xsl:for-each select="ml:payments/ml:payment">

						<xsl:choose>
							<xsl:when test="ml:orderPaymentCreditCard">
								<xsl:value-of select="ml:orderPaymentCreditCard/ml:type"/>
							</xsl:when>
							<xsl:when test="ml:orderPaymentGiftCertificate">
								<xsl:value-of select="ml:orderPaymentGiftCertificate/ml:orderPayment/ml:typeCode"/>
								<!--	<xsl:for-each select="ml:orderPaymentGiftCertificate/ml:orderPayment/ml:attributePages/ml:attributePage">
                                        <xsl:if test="ml:name='orderPaymentAttributePage'">
                                            <xsl:value-of select="ml:attributes/ml:statusCode"/><xsl:value-of select="$tiltCharacter"/>
                                            <xsl:value-of select="ml:attributes/ml:retrievalReferenceNumber"/><xsl:value-of select="$tiltCharacter"/>
                                            <xsl:value-of select="ml:attributes/ml:retrievalReferenceNumberKey"/><xsl:value-of select="$tiltCharacter"/>
                                            <xsl:value-of select="ml:attributes/ml:authorizedAmount"/><xsl:value-of select="$tiltCharacter"/>
                                            <xsl:value-of select="ml:attributes/ml:authorizerReferenceCode"/><xsl:value-of select="$tiltCharacter"/>
                                            <xsl:value-of select="ml:attributes/ml:truncatedCardNumber"/>
                                        </xsl:if>
                                    </xsl:for-each>-->
							</xsl:when>
							<xsl:when test="ml:orderPaymentCheck">
								<xsl:value-of select="ml:orderPaymentCheck/ml:orderPayment/ml:typeCode"/>

							</xsl:when>
							<xsl:when test="ml:orderPaymentPayPal">

								<xsl:value-of select="ml:orderPaymentPayPal/ml:orderPayment/ml:typeCode"/>

							</xsl:when>

						</xsl:choose>

						<xsl:if test="position()!=last()">
							<xsl:value-of select="$pipeCharacter"/>
						</xsl:if>
					</xsl:for-each>
					<xsl:if test="ml:authorizationsRequests/ml:authorizationsRequest/ml:amazonAuthorizationId">AMAZON</xsl:if>
				</xsl:variable>

				<xsl:for-each select="ml:shipments/ml:orderShipment">

					<xsl:variable name="couponCode">
						<xsl:for-each select="ml:discounts/ml:discount">
							<xsl:value-of select="ml:sourceCodesAsString"/>
						</xsl:for-each>
					</xsl:variable>

					<xsl:variable name="shippingDiscountAmount">
						<xsl:value-of select="sum(ml:discounts/ml:discount/ml:amount)"/>
					</xsl:variable>
					<xsl:variable name="taxtotal" select="ml:taxTotal"/>

					<xsl:for-each select="ml:items/ml:orderItem">
						<xsl:variable name="addData">
							<xsl:choose>
								<xsl:when test="position()=last()">1</xsl:when>
								<xsl:otherwise>0</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<xsl:variable name="itemDiscountAmount">
							<xsl:value-of select="sum(ml:discounts/ml:discount/ml:amount)"/>
						</xsl:variable>

						<xsl:choose>
							<xsl:when test="position()=1">
								<xsl:value-of select="$orderCode"/><xsl:value-of select="$tabCharacter"/>
								<xsl:value-of select="$orderDateOrdered"/><xsl:value-of select="$tabCharacter"/>
								<xsl:for-each select="../../ml:shipToInfo/ml:attributePages/ml:attributePage">
									<xsl:choose>
										<xsl:when test="ml:name = 'person'">
											<xsl:value-of select="ml:attributes/ml:firstName"/><xsl:value-of select="$tabCharacter"/>
											<xsl:value-of  select="ml:attributes/ml:lastName"/><xsl:value-of select="$tabCharacter"/>
										</xsl:when>

									</xsl:choose>

								</xsl:for-each>
								<xsl:for-each select="../../ml:shipToInfo/ml:attributePages/ml:attributePage">
									<xsl:choose>
										<xsl:when test="ml:name = 'address'">
											<xsl:value-of  select="ml:attributes/ml:state"/><xsl:value-of select="$tabCharacter"/>
											<xsl:value-of  select="ml:attributes/ml:city"/><xsl:value-of select="$tabCharacter"/>
											<xsl:value-of select="ml:attributes/ml:postalCode"/><xsl:value-of select="$tabCharacter"/>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$tabCharacter"/><xsl:value-of select="$tabCharacter"/><xsl:value-of select="$tabCharacter"/><xsl:value-of select="$tabCharacter"/><xsl:value-of select="$tabCharacter"/><xsl:value-of select="$tabCharacter"/><xsl:value-of select="$tabCharacter"/>
							</xsl:otherwise>
						</xsl:choose>


						<!--Item Detail-->
						<xsl:choose>
							<xsl:when test="$addData='1'">
								<xsl:value-of select="ml:sku"/><xsl:value-of select="$tabCharacter"/><xsl:value-of select="ml:productName"/><xsl:value-of select="$tabCharacter"/><xsl:value-of select="ml:qty"/><xsl:value-of select="$tabCharacter"/><xsl:call-template name="formatDollar"><xsl:with-param name="amount" select="ml:sellPrice" /></xsl:call-template><xsl:value-of select="$tabCharacter"/><xsl:call-template name="formatDiscount"><xsl:with-param name="amount" select="$itemDiscountAmount" /></xsl:call-template><xsl:value-of select="$tabCharacter"/><xsl:call-template name="formatDollar"><xsl:with-param name="amount" select="ml:subTotal" /></xsl:call-template><xsl:value-of select="$tabCharacter"/><xsl:call-template name="formatDollar"><xsl:with-param name="amount" select="$orderMerchandiseTotal" /></xsl:call-template><xsl:value-of select="$tabCharacter"/><xsl:call-template name="formatDiscount"><xsl:with-param name="amount" select="$orderDiscountAmount" /></xsl:call-template><xsl:value-of select="$tabCharacter"/><xsl:call-template name="formatDollar"><xsl:with-param name="amount" select="../../ml:shippingTotal" /></xsl:call-template><xsl:value-of select="$tabCharacter"/><xsl:call-template name="formatDiscount"><xsl:with-param name="amount" select="$shippingDiscountAmount" /></xsl:call-template><xsl:value-of select="$tabCharacter"/><xsl:call-template name="formatDollar"><xsl:with-param name="amount" select="$taxtotal" /></xsl:call-template><xsl:value-of select="$tabCharacter"/><xsl:call-template name="formatDollar"><xsl:with-param name="amount" select="$orderTotal" /></xsl:call-template><xsl:value-of select="$tabCharacter"/><xsl:value-of select="$couponCode"/> <xsl:value-of select="$orderCouponCode"/><xsl:value-of select="$tabCharacter"/><xsl:value-of select="$payments"/><xsl:value-of select="$newLineCharacter"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="ml:sku"/><xsl:value-of select="$tabCharacter"/><xsl:value-of select="ml:productName"/><xsl:value-of select="$tabCharacter"/><xsl:value-of select="ml:qty"/><xsl:value-of select="$tabCharacter"/><xsl:call-template name="formatDollar"><xsl:with-param name="amount" select="ml:sellPrice" /></xsl:call-template><xsl:value-of select="$tabCharacter"/><xsl:call-template name="formatDiscount"><xsl:with-param name="amount" select="$itemDiscountAmount" /></xsl:call-template><xsl:value-of select="$tabCharacter"/><xsl:call-template name="formatDollar"><xsl:with-param name="amount" select="ml:subTotal" /></xsl:call-template><xsl:value-of select="$tabCharacter"/><xsl:value-of select="$tabCharacter"/><xsl:value-of select="$tabCharacter"/><xsl:value-of select="$tabCharacter"/><xsl:value-of select="$tabCharacter"/><xsl:value-of select="$tabCharacter"/><xsl:value-of select="$tabCharacter"/><xsl:value-of select="$couponCode"/><xsl:value-of select="$newLineCharacter"/>
							</xsl:otherwise>
						</xsl:choose>
						<!--	<xsl:value-of select="$orderStatus"/><xsl:value-of select="$tabCharacter"/>
                            <xsl:value-of select="$orderSubTotal"/><xsl:value-of select="$tabCharacter"/>
                            <xsl:value-of select="$orderTaxTotal"/><xsl:value-of select="$tabCharacter"/>
                            <xsl:value-of select="$orderShippingTotal"/><xsl:value-of select="$tabCharacter"/>
                            <xsl:value-of select="$orderShippingCostTotal"/><xsl:value-of select="$tabCharacter"/>
                            <xsl:value-of select="$orderShippingMethodTotal"/><xsl:value-of select="$tabCharacter"/>
                            <xsl:value-of select="$orderShippingWeightTotal"/><xsl:value-of select="$tabCharacter"/>
                            <xsl:value-of select="$orderShippingLocationTotal"/><xsl:value-of select="$tabCharacter"/>
                            <xsl:value-of select="$orderGiftWrapTotal"/><xsl:value-of select="$tabCharacter"/>
                            <xsl:value-of select="$orderAdditionalAddressTotal"/><xsl:value-of select="$tabCharacter"/>
                            <xsl:value-of select="$orderAdditionalChargesTotal"/><xsl:value-of select="$tabCharacter"/>
                            <xsl:value-of select="$orderWeightSurchargeTotal"/><xsl:value-of select="$tabCharacter"/>
                            <xsl:value-of select="$orderTotal"/><xsl:value-of select="$tabCharacter"/>
                            <xsl:value-of select="$orderMerchandiseTotal"/><xsl:value-of select="$tabCharacter"/>
                            <xsl:value-of select="$orderDeferred"/><xsl:value-of select="$tabCharacter"/>
                            <xsl:value-of select="$orderMultipleAddresses"/><xsl:value-of select="$tabCharacter"/>
                            <xsl:value-of select="$orderDeleted"/><xsl:value-of select="$tabCharacter"/>


                            <xsl:value-of select="$billToInfoCode"/><xsl:value-of select="$tabCharacter"/>


                            <xsl:value-of select="ml:code"/><xsl:value-of select="$tabCharacter"/>
                            <xsl:value-of select="ml:dateCreated"/><xsl:value-of select="$tabCharacter"/>

                            <xsl:value-of select="ml:shipToInfo/ml:code"/><xsl:value-of select="$tabCharacter"/>



                            <xsl:value-of select="ml:shipToInfo/ml:phone1"/><xsl:value-of select="$tabCharacter"/>
                            <xsl:value-of select="ml:shipToInfo/ml:email"/><xsl:value-of select="$tabCharacter"/>

                            <xsl:value-of select="ml:status"/><xsl:value-of select="$tabCharacter"/>
                            <xsl:value-of select="ml:shippingMethodCode"/><xsl:value-of select="$tabCharacter"/>
                            <xsl:value-of select="ml:shippingMethodName"/><xsl:value-of select="$tabCharacter"/>
                            <xsl:value-of select="ml:shippingMethodDescription"/><xsl:value-of select="$tabCharacter"/>
                            <xsl:value-of select="ml:subTotal"/><xsl:value-of select="$tabCharacter"/>
                            <xsl:value-of select="ml:total"/><xsl:value-of select="$tabCharacter"/>
                            <xsl:value-of select="ml:shippingTotal"/><xsl:value-of select="$tabCharacter"/>
                            <xsl:value-of select="ml:shippingCostTotal"/><xsl:value-of select="$tabCharacter"/>
                            <xsl:value-of select="ml:shippingMethodTotal"/><xsl:value-of select="$tabCharacter"/>
                            <xsl:value-of select="ml:shippingWeightTotal"/><xsl:value-of select="$tabCharacter"/>
                            <xsl:value-of select="ml:taxTotal"/><xsl:value-of select="$tabCharacter"/>
                            <xsl:value-of select="ml:giftWrapTotal"/><xsl:value-of select="$tabCharacter"/>
                            <xsl:value-of select="ml:additionalChargesTotal"/><xsl:value-of select="$tabCharacter"/>
                            <xsl:value-of select="ml:weightSurchargeTotal"/><xsl:value-of select="$tabCharacter"/>
                            <xsl:value-of select="ml:merchandiseTotal"/><xsl:value-of select="$tabCharacter"/>
                            <xsl:value-of select="ml:deleted"/><xsl:value-of select="$tabCharacter"/>



                            <xsl:value-of select="$payments"/>-->

					</xsl:for-each>
				</xsl:for-each>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="formatDollar">
	<xsl:param name="amount" />
	<xsl:if test="$amount != ''">
		<xsl:value-of select="format-number($amount,'$#,##0.00')"/>
	</xsl:if>
</xsl:template>
	<xsl:template name="formatDiscount">
		<xsl:param name="amount" />
		<xsl:if test="$amount != ''">(<xsl:value-of select="format-number($amount,'$#,##0.00')"/>)</xsl:if>
	</xsl:template>
</xsl:stylesheet>