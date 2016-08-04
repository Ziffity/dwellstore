<%@ page isELIgnored="false" %>
<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_1" %>
<dsp:page>
<html>
<head>   
<style>
.Row
{
display:table;
width:100%;
table-layout:fixed;
border-spacing:10px;
}
.Column
{
display:table-cell;
}
</style>

</head>

<dsp:importbean bean="/atg/commerce/order/purchase/CartModifierFormHandler" />
<dsp:importbean bean="/atg/commerce/ShoppingCart"/>
<dsp:importbean bean="/atg/commerce/order/purchase/ShippingGroupFormHandler" />
<dsp:importbean bean="/atg/commerce/order/purchase/CommitOrderFormHandler" />
<dsp:importbean bean="/atg/commerce/order/purchase/ShippingGroupDroplet" />
<dsp:importbean bean="/atg/dynamo/droplet/ForEach" />
<dsp:importbean bean="/atg/dynamo/droplet/Switch" />
<dsp:importbean bean="/atg/commerce/pricing/UserPricingModels"/>
<dsp:importbean bean="/atg/commerce/pricing/AvailableShippingMethods"/>
<dsp:importbean bean="/atg/commerce/order/ShoppingCartModifier"/>
<dsp:importbean bean="/OriginatingRequest" var="originatingRequest"/>
<dsp:importbean bean="/atg/commerce/order/purchase/PaymentGroupFormHandler" />
<dsp:importbean bean="/atg/commerce/order/purchase/PaymentGroupDroplet" />
<dsp:importbean bean="/atg/commerce/order/purchase/CreateCreditCardFormHandler" />
<dsp:importbean bean="/atg/commerce/order/ShoppingCartModifier"/>
<dsp:importbean bean="/atg/commerce/order/purchase/RepriceOrderDroplet"/>
 <dsp:importbean bean="/atg/commerce/order/purchase/CreateCreditCardFormHandler"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/commerce/order/purchase/RepriceOrderDroplet" />

<body>
 
<dsp:include page="/includes/header.jsp"/>
 
<%-- New Row --%>

<dsp:form method="post">

<div class="Row">
<%-- New Column --%>

<div class="Column">
 <table border="0">
 <tr><td><h3><b>Shipping Address</tr></td>
 <tr><td>
 <dsp:include page="shipping1.jsp"/>
 
<!-- end Shipping Group --> 
</tr></td></table>

<%-- Column Ending --%>
</div>

<%-- New Column --%>
  <div class="Column">
      <table border="0">
      <tr><td><h3><b>Shipping Method</tr></td>
  <tr><td>
 <dsp:include page="shippingMethod.jsp"/>
</tr></td></table>

<%-- Column Ending--%>
</div>

<%-- New Column --%>
<div class="Column">
<table border="0">
      <tr><td><h3><b>Billing Details</tr></td>
  <tr><td>
<dsp:include page="billing.jsp"/>
</tr></td></table>

<br><br>
<div style="display:none;" id="hiddenDiv2">
 <br/>
</div>

<br>
<br>
<center>

<%-- Column Ending--%>
</div>
<%-- Row Ending--%>
</div> 

<center>
<dsp:input bean="CommitOrderFormHandler.commitOrder" type="submit" value="Submit"/>
<dsp:input bean="CommitOrderFormHandler.commitOrderSuccessURL" type="hidden" value="/checkout/orderSummary.jsp"/>
<dsp:input bean="CommitOrderFormHandler.commitOrderErrorURL" type="hidden" value="#"/>  
</center>

</dsp:form>
</body>
</html>
</dsp:page>