<dsp:page>
<dsp:importbean bean="/OriginatingRequest" var="originatingRequest"/>

<dsp:include page="/includes/header.jsp"/><br>
<dsp:getvalueof var="orderId" param="orderId"/>
<dsp:droplet name="/atg/commerce/order/OrderLookup">
<dsp:param name="orderId" value="${orderId}"/>
 <dsp:oparam name="output">
 
 <h4>OrderId: <dsp:valueof param="result.id"/></h4>
<h4>UserId: <dsp:valueof param="result.profileId"/></h4>
 <table style="width: 400px" border="1" align="left">
       <tr>
       <th>productId</th>
       <th>Quantity</th>
       <th>Price</th>
       </tr>
 <dsp:getvalueof var="currentItems" vartype="java.lang.Double" param="result.commerceItems"/>
 <dsp:droplet name="/atg/dynamo/droplet/ForEach">
<dsp:param name="array" value="${currentItems}"/>
<dsp:oparam name="output">
<tr>
<td><dsp:valueof param="element.auxiliaryData.productId"/></td>
<td><dsp:valueof param="element.quantity"/></td>
<td><dsp:valueof param="element.priceInfo.amount"/></td>
</tr>
</dsp:oparam>
</dsp:droplet>
 </table>
 <br>
 <br><br><br><br>
<h4>GrandTotal: Rs <dsp:valueof param="result.priceInfo.total"/></h4>
 <dsp:getvalueof var="ship"  param="result.shippingGroups"/>
 <c:forEach var="shipping" items="${ship}">
 <h4>Shipping Method</h4>
 ${shipping.shippingMethod}
 <h4>Shipping Address</h4>
 <table style="width: 400px" border="5">
 <tr>
<tr>
<td>First Name: </td>
<td>  ${shipping.shippingAddress.firstName} </td>
</tr>

<tr>
<td>Last Name:</td> 
<td> ${shipping.shippingAddress.lastName}</td>
</tr>
<tr>
<td>Address:</td> 
<td>${shipping.shippingAddress.address1}</td>
</tr>
<tr>
<td>City:</td> 
<td>${shipping.shippingAddress.city} </td>
</tr>
<tr>
<td>State:</td>
<td> ${shipping.shippingAddress.state}</td>
</tr>
<tr>
<td>Country:</td> 
<td>${shipping.shippingAddress.country} </td>
</tr>
<tr>
<td>Postal Code: </td>
<td>${shipping.shippingAddress.postalCode}</td>
</tr>
</table>
<dsp:a href="${originatingRequest.contextPath}/browse/editShippingAdd.jsp"><b>Edit</b></dsp:a>
 </c:forEach>
 
 <dsp:getvalueof var="pay"  param="result.paymentGroups"/>
 
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
<dsp:a href="${originatingRequest.contextPath}/browse/editPaymentAdd.jsp"><b>Edit</b></dsp:a>
</c:forEach>
 
 </dsp:oparam>
 </dsp:droplet>
</dsp:page>