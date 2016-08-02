<dsp:page>
 <dsp:importbean bean="/atg/commerce/order/purchase/CommitOrderFormHandler"/>
  <dsp:importbean bean="/atg/commerce/ShoppingCart"/>

 
<dsp:include page="orderDetails.jsp" >
<dsp:param name="commerceItems" bean="ShoppingCart.current.commerceItems"/>
</dsp:include>
</dsp:page>