<%@ page isELIgnored="false" %>
<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_1" %>

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
<dsp:importbean bean="/atg/commerce/order/purchase/RepriceOrderDroplet"/>
 <dsp:importbean bean="/atg/commerce/order/purchase/CreateCreditCardFormHandler"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/commerce/order/purchase/RepriceOrderDroplet" />


<dsp:droplet name="RepriceOrderDroplet">
  <dsp:param value="ORDER_TOTAL" name="pricingOp"/>
</dsp:droplet>

<dsp:form method="post">

<dsp:droplet name="PaymentGroupDroplet">

  <dsp:param value="true" name="clear"/>
  <dsp:param value="creditCard"
              name="paymentGroupTypes"/>
  <dsp:param name="initOrderPayment" value="true"/>
  <dsp:param value="true" name="initPaymentGroups"/>
  <dsp:oparam name="output">

<tr><td colspan="2"><center>
	<dsp:input bean="PaymentGroupFormHandler.listId" beanvalue="PaymentGroupFormHandler.listId" priority="9" type="hidden"/>
 	<dsp:valueof param="key"/>
 	
   <dsp:select bean="PaymentGroupFormHandler.applyDefaultPaymentGroup" value="true">
  	
  	<dsp:droplet name="ForEach">
  	<dsp:param name="array" param="paymentGroups"/>
  	<dsp:oparam name="output">
   
   <dsp:option>
    <dsp:valueof  param="element.creditCardType"/>,
	<dsp:valueof converter="creditCard" param="element.creditCardNumber"/>   
   </dsp:option>
   
    </dsp:oparam>
 	</dsp:droplet>
    </dsp:select>
   
   <dsp:input bean="PaymentGroupFormHandler.applyPaymentGroups" type="submit" value="Select & Continue"/>
   <dsp:input bean="PaymentGroupFormHandler.applyPaymentGroupsSuccessURL" type="hidden" value="/checkout/orderSummary.jsp"/>
   <dsp:input bean="PaymentGroupFormHandler.applyPaymentGroupsErrorURL" type="hidden" value="/checkout/billing.jsp"/>  



</td></tr>
</center> 
</table>

 </dsp:oparam>
</dsp:droplet> 

</dsp:form>

<hr>

<br><br><br>
</dsp:page>