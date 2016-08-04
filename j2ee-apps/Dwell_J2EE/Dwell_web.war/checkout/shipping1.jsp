<%@ page isELIgnored="false" %>
<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_1" %>

<dsp:page>
<dsp:importbean bean="/atg/commerce/order/purchase/ShippingGroupFormHandler"/>
<dsp:importbean bean="/atg/commerce/order/purchase/ShippingGroupDroplet"/>
<dsp:importbean bean="/OriginatingRequest" var="originatingRequest"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/commerce/ShoppingCart"/>
<dsp:importbean bean="/atg/commerce/pricing/AvailableShippingMethods"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/commerce/order/purchase/RepriceOrderDroplet"/>

<dsp:getvalueof var="order" bean="ShoppingCart.current" />


   <dsp:droplet name="ShippingGroupDroplet">
   <dsp:param name="clear" value="true"/>
  	<dsp:param name="shippingGroupTypes" value="hardgoodShippingGroup"/>
  	<dsp:param name="initShippingGroups" value="true"/>
  	<dsp:param name="initBasedOnOrder" value="true"/>
       
 	<dsp:oparam name="output">
 	<dsp:setvalue bean="ShippingGroupFormHandler.listId" value="${order.id}"/>
              	
    <br>

 <dsp:form method="post">
 
<dsp:input bean="ShippingGroupDroplet.defaultShippingGroup.shippingMethod" value="Ground" type="hidden"/>      
<dsp:input bean="ShippingGroupDroplet.defaultShippingGroup.shippingMethod" value="Ground" type="hidden"/>   

<dsp:select bean="ShippingGroupDroplet.shippingGroupMapContainer.defaultShippingGroupName" paramvalue="key">
   
   <dsp:droplet name="ForEach">
                   <dsp:param name="array" param="shippingGroups"/>
                     <dsp:oparam name="output">     
   
   <dsp:option>
                 
			<dsp:valueof param="element.shippingAddress.firstName"/>&nbsp;
            <dsp:valueof param="element.shippingAddress.lastName"/>
			<dsp:valueof param="element.shippingAddress.address1"/>,
			<dsp:valueof param="element.shippingAddress.city"/>,
			<dsp:valueof param="element.shippingAddress.country"/>.
			
	</dsp:option>
	
	</dsp:oparam>
 	</dsp:droplet>
 	
	</dsp:select>
	
 	</br>
 	</table>
    </center>
 	
 	<dsp:input bean="ShippingGroupFormHandler.listId" beanvalue="ShippingGroupFormHandler.listId" priority="9" type="hidden"/>
 	
	<dsp:input bean="ShippingGroupFormHandler.applyDefaultShippingGroup" type="hidden" value="true"/> 
	<dsp:input bean="ShippingGroupFormHandler.applyShippingGroups" class="input-submit" type="submit" value="Ship to this address"/>
	<dsp:input bean="ShippingGroupFormHandler.applyShippingGroupsSuccessURL" type="hidden" value="/checkout/shippingMethod.jsp?init=true"/>
	<dsp:input bean="ShippingGroupFormHandler.applyShippingGroupsErrorURL" type="hidden" value="#"/>

</dsp:form>    		
    	
  	</dsp:oparam>
 	</dsp:droplet>
  
 
 
</dsp:page>