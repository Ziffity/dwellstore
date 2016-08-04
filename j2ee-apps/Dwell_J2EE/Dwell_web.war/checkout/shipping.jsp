<dsp:page>
<dsp:importbean bean="/atg/commerce/order/purchase/ShippingGroupFormHandler"/>
<dsp:importbean bean="/atg/commerce/order/purchase/ShippingGroupDroplet"/>
<dsp:importbean bean="/OriginatingRequest" var="originatingRequest"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/commerce/ShoppingCart"/>
<dsp:importbean bean="/atg/commerce/pricing/AvailableShippingMethods"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/commerce/order/purchase/RepriceOrderDroplet"/>

<link rel="stylesheet" href="/css/styles.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="/css/screen.css" type="text/css" media="screen" title="no title" charset="utf-8" />

<dsp:include page="/includes/header.jsp" />

<style>
    tab { padding-left: 4em; }
</style>

<dsp:getvalueof var="order" bean="ShoppingCart.current" />

<dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
        <dsp:oparam name="output">
        <b><dsp:valueof param="message"/></b><br>
        </dsp:oparam>
        <dsp:oparam name="outputStart">
        <LI>
        </dsp:oparam>
        <dsp:oparam name="outputEnd">
        </LI>
        </dsp:oparam>
        </dsp:droplet>
 
   <dsp:droplet name="ShippingGroupDroplet">
   <dsp:param name="clear" value="true"/>
  	<dsp:param name="shippingGroupTypes" value="hardgoodShippingGroup"/>
  	<dsp:param name="initShippingGroups" value="true"/>
  	<dsp:param name="initBasedOnOrder" value="true"/>
       
 	<dsp:oparam name="output">
 	<dsp:setvalue bean="ShippingGroupFormHandler.listId" value="${order.id}"/>
 	 			   <dsp:droplet name="ForEach">
                   <dsp:param name="array" param="shippingGroups"/>
                     <dsp:oparam name="output">
                     <dsp:form method="post">
                   </br>
                  <center>
                   <table>
            
            
          	
              <br><dsp:input bean="ShippingGroupDroplet.shippingGroupMapContainer.defaultShippingGroupName" paramvalue="key" type="hidden"/> 
               <dsp:input bean="ShippingGroupDroplet.defaultShippingGroup.shippingMethod" value="Ground" type="hidden"/> 
        
               <tr><td> Name :</td><td><dsp:valueof param="element.shippingAddress.firstName"/>&nbsp;<dsp:valueof param="element.shippingAddress.lastName"/></td></tr></br>
					<tr><td>Address :</td><td><dsp:valueof param="element.shippingAddress.address1"/>,</td></tr>
					<tr><td> </td><td><dsp:valueof param="element.shippingAddress.address2"/>,</td></tr>
					<tr><td> </td><td><dsp:valueof param="element.shippingAddress.city"/>,</td></tr>
					<tr><td> </td><td><dsp:valueof param="element.shippingAddress.country"/></td></tr>
              
            </table></center>
        	
 	</br>
 	<dsp:input bean="ShippingGroupFormHandler.listId" beanvalue="ShippingGroupFormHandler.listId" priority="9" type="hidden"/>
 	
 	<!-- <dsp:valueof param="key"/> -->
<dsp:input bean="ShippingGroupFormHandler.applyDefaultShippingGroup" type="hidden" value="true"/> 
	<dsp:input bean="ShippingGroupFormHandler.applyShippingGroups" class="input-submit" type="submit" value="Ship to this address"/>
	<dsp:input bean="ShippingGroupFormHandler.applyShippingGroupsSuccessURL" type="hidden" value="/checkout/shippingMethod.jsp?init=true"/>
	<dsp:input bean="ShippingGroupFormHandler.applyShippingGroupsErrorURL" type="hidden" value="#"/>
</dsp:form>    		
    	
    	</dsp:oparam>
 		</dsp:droplet>
  </dsp:oparam>				
 </dsp:droplet>
 
 </br></br>
    
<center>
 <dsp:include page="NewShippingAddress.jsp" /></center>
 <br>
 <dsp:include page="/includes/footerNew.jsp" />
 
</dsp:page>