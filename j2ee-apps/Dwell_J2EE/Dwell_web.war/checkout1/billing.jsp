<dsp:page>

<dsp:importbean bean="/OriginatingRequest" var="originatingRequest"/>
<dsp:importbean bean="/atg/commerce/order/purchase/CartModifierFormHandler" />
<dsp:importbean bean="/atg/commerce/ShoppingCart"/>
<dsp:importbean bean="/OriginatingRequest" var="originatingRequest"/>
<dsp:importbean bean="/atg/commerce/order/purchase/PaymentGroupFormHandler" />
<dsp:importbean bean="/atg/commerce/order/purchase/PaymentGroupDroplet" />
<dsp:importbean bean="/atg/dynamo/droplet/ForEach" />
<dsp:importbean bean="/atg/dynamo/droplet/Switch" />
<dsp:importbean bean="/atg/commerce/order/purchase/CreateCreditCardFormHandler" />
<dsp:importbean bean="/atg/commerce/order/ShoppingCartModifier"/>
<dsp:importbean bean="/atg/commerce/order/purchase/RepriceOrderDroplet" />
 <dsp:importbean bean="/atg/commerce/order/purchase/CreateCreditCardFormHandler"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/commerce/ShoppingCart"/>
<dsp:getvalueof var="order" bean="ShoppingCart.current"/>

 <dsp:include page="/includes/header.jsp"/>
 
<h4>My Billing Details: </h4>

<dsp:droplet name="RepriceOrderDroplet">
  <dsp:param value="ORDER_TOTAL" name="pricingOp"/>
</dsp:droplet>

<dsp:droplet name="PaymentGroupDroplet">

  <dsp:param value="true" name="clear"/>
  <dsp:param value="storeCredit,creditCard"
              name="paymentGroupTypes"/>
  <dsp:param name="initOrderPayment" value="true"/>
  <dsp:param value="true" name="initPaymentGroups"/>
  
      
  <dsp:oparam name="output">
  
  <dsp:setvalue bean="PaymentGroupFormHandler.listId" value="${order.id}"/>
  
  <dsp:droplet name="ForEach">
  <dsp:param name="array" param="paymentGroups"/>
  <dsp:oparam name="output">
<dsp:form method="post">


 <table style="width: 400px" border="5">
 <tr>
 <td colspan="4" align="center">
PaymentMethod
</td></tr>
<td>CreditCard Type: </td>
<td> <dsp:valueof  param="element.creditCardType"/> </td>
</tr>
<tr>
<td>CreditCard Number:</td>
<td>  <dsp:valueof converter="creditCard" param="element.creditCardNumber"/></td>
</tr>
<tr>
<td>ExpirationMonth: </td> 
<td><dsp:valueof param="element.expirationMonth"/></td>
</tr>
<tr>
<td>ExpirationYear:</td>
<td> <dsp:valueof param="element.expirationYear"/></td>
</tr>


<tr><td colspan="2"><center>
<dsp:input bean="PaymentGroupFormHandler.listId" beanvalue="PaymentGroupFormHandler.listId" priority="9" type="hidden"/>
 <dsp:valueof param="key"/>
   <dsp:input bean="PaymentGroupFormHandler.applyDefaultPaymentGroup" type="hidden" value="true"/>
   <dsp:input bean="PaymentGroupFormHandler.applyPaymentGroups" type="submit" value="Select & Continue"/>
   <dsp:input bean="PaymentGroupFormHandler.applyPaymentGroupsSuccessURL" type="hidden" value="/checkout/orderSummary.jsp?init=true"/>
   <dsp:input bean="PaymentGroupFormHandler.applyPaymentGroupsErrorURL" type="hidden" value="/checkout/billing.jsp"/>  
<dsp:droplet name="Switch">
<dsp:param bean="PaymentGroupFormHandler.formError" name="value"/>
<dsp:oparam name="true">
    <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
      <dsp:param bean="PaymentGroupFormHandler.formExceptions" name="exceptions"/>
      <dsp:oparam name="output">
      <dsp:valueof param="message"/>
      </dsp:oparam>
    </dsp:droplet>
</dsp:oparam>
</dsp:droplet>
</td></tr>
</center> 

</table>
</dsp:form>

 </dsp:oparam>
 </dsp:droplet>

 </dsp:oparam>
</dsp:droplet> 



<hr>

<dsp:include page="newBilling.jsp"/>
</dsp:page>



<%--
<tr>
<td colspan="4" align="center">
BillingAddress
</td></tr>
<tr>
<td>FirstName</td>
<td> <dsp:valueof param="element.billingAddress.firstName"/></td>
</tr>
<tr>
<td>LastName</td>
<td> <dsp:valueof param="element.billingAddress.lastName"/></td>
</tr>
<tr>
<td>Address1</td>
<td> <dsp:valueof param="element.billingAddress.address1"/></td>
</tr>
<tr>
<td>City</td>
<td> <dsp:valueof param="element.billingAddress.city"/></td>
</tr>
 <tr>
<td>State</td>
<td> <dsp:valueof param="element.billingAddress.state"/></td>
</tr>
<tr>
<td>PostalCode</td>
<td> <dsp:valueof param="element.billingAddress.postalCode"/></td>
</tr>
<tr>
<td>Country</td>
<td> <dsp:valueof param="element.billingAddress.country"/></td>
</tr>

--%>

