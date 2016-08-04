<dsp:page>
<dsp:importbean bean="/atg/commerce/order/ShoppingCartModifier"/>
<dsp:importbean bean="/atg/commerce/order/purchase/ShippingGroupFormHandler"/>
  <dsp:importbean bean="/OriginatingRequest" var="originatingRequest"/>
  <dsp:importbean bean="/atg/commerce/pricing/AvailableShippingMethods"/>
  <dsp:importbean bean="/atg/commerce/ShoppingCart"/>
  <dsp:importbean bean="/atg/commerce/order/purchase/ShippingGroupDroplet"/>
  <dsp:include page="/includes/header.jsp"/>
 <h2>Select the Shipping Method</h2>
  <dsp:form action="billing.jsp">
  <dsp:getvalueof var="currentItem" bean="ShoppingCart.current"/>
 <dsp:getvalueof var="amount" bean="ShoppingCart.current.priceInfo.shipping" />

  <dsp:getvalueof var="shippingGroup" value="${currentItem.shippingGroups}"/>
 <dsp:getvalueof var="method" value="${shippingGroup[0].shippingMethod}" />
 <dsp:getvalueof var="method11" bean="ShoppingCart.current.shippingGroups[0].shippingMethod" />
 

  <dsp:droplet name="AvailableShippingMethods">
          <dsp:param name="shippingGroup" value="${shippingGroup[0]}"/>
          <dsp:oparam name="output">
          
          <dsp:getvalueof var="availableShippingMethods" vartype="java.lang.Object"
                            param="availableShippingMethods"/>
        
         <c:forEach var="methods" items="${availableShippingMethods}">
   <dsp:input type="radio" bean="ShoppingCart.current.shippingGroups[0].shippingMethod" value="${methods}"/> 
   ${methods}<br>
   </c:forEach> 
   </dsp:oparam>
			</dsp:droplet>  
			 <input type="submit"  value="Update" />
  </dsp:form>
 
         
         

          
			</dsp:page>
	
			