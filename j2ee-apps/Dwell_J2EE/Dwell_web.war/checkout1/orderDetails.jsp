<dsp:page>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<dsp:importbean bean="/atg/commerce/ShoppingCart"/>
<dsp:importbean bean="/OriginatingRequest" var="originatingRequest"/>
<dsp:importbean bean="/atg/commerce/order/purchase/CartModifierFormHandler"/>
<dsp:importbean bean="/atg/commerce/order/purchase/ShippingGroupDroplet"/>
 <dsp:importbean bean="/atg/commerce/order/purchase/PaymentGroupDroplet" />
 <dsp:importbean bean="/atg/commerce/order/purchase/ExpressCheckoutFormHandler"/>
 <dsp:importbean bean="/atg/commerce/pricing/AvailableShippingMethods"/>
 <dsp:importbean bean="atg/userprofiling/Profile"/>
 <dsp:include page="/includes/header.jsp"/>
 <center><h1>Order Details</h1></center>
 <h3>Cart Items</h3>
 <div align="right">
 <dsp:getvalueof var="order" bean="ShoppingCart.current.id" />
<b>CustomerId:  </b>   <dsp:valueof bean="Profile.id"/><br>
<b>CustomerName:</b> <dsp:valueof bean="Profile.firstName"/><br>
<b>OrderId:</b> ${order}
</div>
<table class="table table-hover">
				<tr>
					<th>ProductName</th>
					<th>price</th>
					
					<th>Quantity</th>
					<th>TotalPrice(Rs)</th>
					
				</tr>
<dsp:droplet name="/atg/dynamo/droplet/ForEach">
<dsp:param name="array" param="commerceItems"/>
<dsp:getvalueof var="productId" param="productId"/>


<dsp:setvalue param="currentItem" paramvalue="element" />
<dsp:oparam name="output">

<dsp:getvalueof var="currentItem" param="currentItem"/>
<dsp:getvalueof var="product" value="${currentItem.auxiliaryData.productRef}" />
<dsp:getvalueof var="sku" value="${currentItem.auxiliaryData.catalogRef}" />
<dsp:getvalueof var="listPrice" vartype="java.lang.Double" param="currentItem.priceInfo.listPrice" />
<dsp:getvalueof var="salePrice" vartype="java.lang.Double" param="currentItem.priceInfo.salePrice" />
<dsp:getvalueof var="quantity" vartype="java.lang.Double" param="currentItem.quantity" />
<dsp:getvalueof var="amount" vartype="java.lang.Double" param="currentItem.priceInfo.amount" />
<dsp:getvalueof var="adjustment" vartype="java.lang.Double" param="currentItem.priceInfo.adjustments" />
<tr>
<td><dsp:valueof value="${product.displayName}"/></td>
<c:choose>
 <c:when test="${salePrice>0}">
 <td>  <del> <dsp:valueof converter="currency" value="${listPrice}" /></del>
<dsp:valueof value="Rs ${salePrice}"/></td>
</c:when>
<c:otherwise>
<td><dsp:valueof value="${listPrice}"/></td>
</c:otherwise>
</c:choose>

<td><input name='<dsp:valueof value='${sku.id}' />' size="4" value="${quantity}" type="text"/></td>
<td><dsp:valueof value="Rs ${amount}"/></td>

</tr>
</dsp:oparam>
</dsp:droplet>
<dsp:getvalueof var="order" bean="ShoppingCart.current" />
<tr></tr>
<tr></tr>
<tr></tr>

<tr><td></td><td>SubTotal=</td><td><dsp:valueof value="${order.priceInfo.rawSubtotal}Rs"/></td></tr>
<tr><td></td><td>DiscountAmount=Rs </td><td><dsp:valueof value="${order.priceInfo.discountAmount}"/></td></tr>
<tr><td></td><td>Total=</td><td><dsp:valueof value="${order.priceInfo.amount}Rs"/></td></tr>
<tr><td></td><td><dsp:getvalueof var="amount" bean="ShoppingCart.current.priceInfo.shipping" /></td></tr>
<tr><td></td><td>ShippingAmount=Rs${amount}</td></tr>
<tr><td></td><td>GrandTotal=</td><td><dsp:valueof value="${order.priceInfo.total}Rs"/></td></tr>
</table>
<hr>
<h3>Shipping Information</h3>
<h4>Shipping Method</h4>
<dsp:getvalueof var="method" bean="ShoppingCart.current.shippingGroups[0].shippingMethod" />
 ${method}

<h4>Shiping Address</h4>
<dsp:getvalueof var="ship" bean="ShoppingCart.current.shippingGroups"/>
<%--<dsp:getvalueof var="ship1" bean="ShoppingCart.current.shippingGroups[1]"/>
${ship1}--%>

<dsp:droplet name="/atg/dynamo/droplet/ForEach">
  <dsp:param name="array" value="${ship}"/>
   <dsp:oparam name="output">
  
  <dsp:valueof param="element.shippingAddress.firstName"/><br>
  <dsp:valueof param="element.shippingAddress.lastName"/><br>
   <dsp:valueof param="element.shippingAddress.address1"/><br>
  <dsp:valueof param="element.shippingAddress.city"/><br>
  <dsp:valueof param="element.shippingAddress.state"/><br>
  <dsp:valueof param="element.shippingAddress.postalCode"/><br>
  <dsp:valueof param="element.shippingAddress.country"/><br>
  <br>
</dsp:oparam>
</dsp:droplet>
<br>
<br>


<hr>
<dsp:getvalueof var="pay" bean="ShoppingCart.current.paymentGroups"/>
<h3>Payment Information</h3>
<h4>Payment Method</h4>
<c:forEach var="payment" items="${pay}">
 <table style="width: 400px" border="5">
<tr>
 <td>CreditCard Type: </td>
 <td>${payment.creditCardType} </td></tr>
<tr><td>
CreditCard Number:</td><td> ${payment.creditCardNumber}</td></tr>
</td></tr>
<tr>
<td>ExpirationMonth: </td> 
<td>${payment.expirationMonth}</td>
</tr>
<tr>
<td>ExpirationYear:</td>
<td> ${payment.expirationYear}</td>
</tr>
</center> 
</table>
</c:forEach>

<c:forEach var="payAdd" items="${pay}">
<h4>Billing Address</h4>
<table style="width: 400px" border="5">
<tr>
<td>FirstName:</td>
<td>${payAdd.billingAddress.firstName}</td>
</tr>
<tr>
<td>LastName:</td>
<td>${payAdd.billingAddress.lastName}</td>
</tr>
<tr>
<td>Address:</td>
<td>${payAdd.billingAddress.address1}
${payAdd.billingAddress.address2}</td>
</tr>
<tr>
<td>City:</td>
<td>${payAdd.billingAddress.city}</td>
</tr>
<tr>
<td>State:</td>
<td>${payAdd.billingAddress.state}</td>
</tr>
<tr>
<td>PostalCode:</td>
<td>${payAdd.billingAddress.postalCode}</td>
</tr>
<tr>
<td>Country:</td>
<td>${payAdd.billingAddress.country}</td>
</tr>
</table>
</tr>
</table>
</c:forEach>

<dsp:form method="post">

<dsp:input bean="ExpressCheckoutFormHandler.commitOrder" type="hidden" value="true"/>
 <dsp:input bean="ExpressCheckoutFormHandler.expressCheckoutSuccessURL" type="hidden" value="/checkout/orderConfirm.jsp"/>
 <dsp:input bean="ExpressCheckoutFormHandler.expressCheckoutErrorURL" type="hidden" value="/checkout/orderSummary.jsp"/>
<dsp:input bean="ExpressCheckoutFormHandler.expressCheckout" type="submit" value="OrderSubmit"/>
 <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
                                        <dsp:param bean="ExpressCheckoutFormHandler.formExceptions" name="exceptions"/>
                                        <dsp:oparam name="output">
                                            <li>
                                                <dsp:valueof param="message"/>
                                            </li>
                                        </dsp:oparam>
                                    </dsp:droplet>
 

</dsp:form>



</dsp:page>




				