<dsp:page>
  <dsp:importbean bean="/atg/commerce/order/purchase/ShippingGroupFormHandler"/>
	<dsp:importbean bean="/atg/commerce/pricing/AvailableShippingMethods"/>
  <dsp:importbean bean="/atg/commerce/ShoppingCart"/>
  <dsp:importbean bean="/atg/store/pricing/PriceShippingMethod"/>
   <dsp:importbean bean="/atg/userprofiling/Profile"/>
  <dsp:importbean bean="/atg/commerce/pricing/UserPricingModels"/>
  <dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
  
  <link rel="stylesheet" href="/css/styles.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="/css/screen.css" type="text/css" media="screen" title="no title" charset="utf-8" />

<dsp:include page="/includes/header.jsp" />
  
  
<dsp:getvalueof var="currentItem" bean="ShoppingCart.current" />
<dsp:getvalueof var="shippingGroup" value="${currentItem.shippingGroups}" />
<dsp:getvalueof var="method" value="${shippingGroup[0].shippingMethod}" />



<%-- <dsp:droplet name="ForEach">
        <dsp:param name="array" bean="ShoppingCart.current.shippingGroups" />
		<dsp:oparam name="output"></br>
		<b>Shipping Address</b></br></br>
		
        Name :<dsp:valueof param="element.shippingAddress.firstName"/>&nbsp;<dsp:valueof param="element.shippingAddress.lastName"/></br>
		Address :<dsp:valueof param="element.shippingAddress.address1"/>,</br>
							 <tab><dsp:valueof param="element.shippingAddress.address2"/>,</br>
							 <tab><dsp:valueof param="element.shippingAddress.city"/>,</br>
							 <tab><dsp:valueof param="element.shippingAddress.country"/></br>
                      <dsp:valueof param="element.shippingMethod" />
         </dsp:oparam>
         </dsp:droplet> 
		
		<dsp:form>
			<dsp:input bean="ExpressCheckoutFormHandler.commitOrder" type="hidden" value="true"/>
			<dsp:input bean="ExpressCheckoutFormHandler.expressCheckoutErrorURL" type="hidden" value="/checkout/orderConfirmation.jsp" />
			<dsp:input bean="ExpressCheckoutFormHandler.expressCheckoutSuccessURL" type="hidden" value="/checkout/orderSuccess.jsp" /> </br>
	        <dsp:input type="submit" bean="ExpressCheckoutFormHandler.expressCheckout" value="Confirm Order" /> 
 		
		</dsp:form>   --%>



<h1>SELECT SHIPPING METHOD</h1>
   
<dsp:form action="billing.jsp?init=true">

		  <dsp:droplet name="AvailableShippingMethods">
          <dsp:param name="shippingGroup" value="${shippingGroup[0]}"/>
          <dsp:param bean="UserPricingModels.shippingPricingModels" name="pricingModels"/>
          <dsp:param bean="Profile" name="profile"/>
          
          <dsp:oparam name="output">
          <dsp:getvalueof var="availableShippingMethods" vartype="java.lang.Object"
                            param="availableShippingMethods"/> 
             
          <c:forEach var="methods" items="${availableShippingMethods}">
             </br>
          <dsp:input type="radio" bean="ShoppingCart.current.shippingGroups[0].shippingMethod" value="${methods}"/>
           ${methods}
          </c:forEach>
            
         </dsp:oparam>
         </dsp:droplet>
   
         <br>
         <br> <input type="submit"  class="input-submit" value="update shipping method" />
</dsp:form>
<br><br>
 <br><br> 
<dsp:include page="/includes/footer.jsp" />

</dsp:page>