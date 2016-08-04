<%@ page isELIgnored="false" %>
<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_1" %>

<dsp:page>

<dsp:importbean bean="/atg/commerce/ShoppingCart"/>
<dsp:importbean bean="/atg/commerce/pricing/UserPricingModels"/>
<dsp:importbean bean="/atg/commerce/pricing/AvailableShippingMethods"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/commerce/order/ShoppingCartModifier"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>

 

<dsp:getvalueof var="currentItem" bean="ShoppingCart.current"/>



<dsp:getvalueof var="shippingGroup" value="${currentItem.shippingGroups}"/>


<h4></h4>

  <dsp:form action="/checkout/billing.jsp?init=true" method="post">
  
 <dsp:droplet name="AvailableShippingMethods">
          <dsp:param name="shippingGroup" value="${shippingGroup[0]}"/>
          <dsp:oparam name="output">
          
          <dsp:getvalueof var="availableShippingMethods" vartype="java.lang.Object"
                            param="availableShippingMethods"/>
        
    
   
     
    <c:forEach var="methods" items="${availableShippingMethods}">
    
    <dsp:input type="radio" bean="ShoppingCart.current.shippingGroups[0].shippingMethod"
    name="shippingMethod" value="${methods}"/>${methods}
    <br>	
    
    </c:forEach>
    
    <input bean="ShoppingCart.current.shippingGroups[0].shippingMethod" type="submit" value="Submit"/>
    

   </dsp:oparam>
   </dsp:droplet>

</dsp:form>


</dsp:page>