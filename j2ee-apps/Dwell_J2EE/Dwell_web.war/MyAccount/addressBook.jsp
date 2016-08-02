<dsp:page>

<dsp:importbean bean="/atg/commerce/order/purchase/CartModifierFormHandler" />
<dsp:importbean bean="/atg/commerce/ShoppingCart"/>
<dsp:importbean bean="/OriginatingRequest" var="originatingRequest"/>
<dsp:importbean bean="/atg/commerce/order/purchase/ShippingGroupFormHandler" />
<dsp:importbean bean="/atg/commerce/order/purchase/ShippingGroupDroplet" />
<dsp:importbean bean="/atg/dynamo/droplet/ForEach" />
<dsp:importbean bean="/atg/dynamo/droplet/Switch" />

  
       <dsp:include page="/includes/header.jsp"/>
       
          
        <table cellpadding="9" border=2 align="center" >
      <tr>
      <td>
            <table cellpadding="6" border=0 align="center" >
          <a href="editProfile.jsp">Update Profile</a>&nbsp;&nbsp;&nbsp;<a href="addressBook.jsp?init=true">My Address Book</a>&nbsp;&nbsp;&nbsp;<a href="myOrders.jsp">My Orders</a>
         
          <hr>
            <tr>
            	<center></center>
              <tr>
            	<td>  
            </td>
            </tr>
</table>
 
<h4 style="margin-top:-17px;">My Shipping Address's:</h4>
<dsp:droplet name="ShippingGroupDroplet">
 <%--  <dsp:param name="createOneInfoPerUnit" value="false"/> --%>
  <dsp:param name="clearShippingInfos" param="init"/>
  <dsp:param name="clearShippingGroups" value="true"/>
  <dsp:param name="shippingGroupTypes" value="hardgoodShippingGroup"/>
  <dsp:param name="initShippingGroups" param="init"/>
  <dsp:param name="initBasedOnOrder" param="init"/>
  <dsp:oparam name="output">
  <!-- begin output -->
    <dsp:droplet name="ForEach">
      <dsp:param name="array" param="shippingGroups"/>
      <dsp:oparam name="output">
   
      <table style="width: 400px;margin-top:-17px;" border="5">
  <tr><td>
      
      <dsp:form method="post">
<BR>
            
<br>

<dsp:input bean="ShippingGroupDroplet.shippingGroupMapContainer.defaultShippingGroupName" paramvalue="key" type="hidden"/>              
                    
First Name</td><td> <dsp:valueof param="element.shippingAddress.firstName"/> </td></tr>
<tr><td>
Last Name</td><td>  <dsp:valueof param="element.shippingAddress.lastName"/></td></tr>
<tr><td>
Street</td><td><dsp:valueof param="element.shippingAddress.address1"/></td></tr>
<tr><td>
City</td><td><dsp:valueof param="element.shippingAddress.city"/></td></tr>
<tr><td>
State</td><td><dsp:valueof param="element.shippingAddress.state"/></td></tr>
<tr><td>
Country</td><td><dsp:valueof param="element.shippingAddress.country"/></td></tr>
         
<br>

<tr> <td colspan="2"><center>
                
        <dsp:input bean="ShippingGroupFormHandler.removeShippingAddressErrorURL" type="hidden" value="/browse/addressBook.jsp?init=true"/>
        <dsp:input bean="ShippingGroupFormHandler.removeShippingAddressSuccessURL" type="hidden" value="/browse/addressBook.jsp?init=true"/> 
        <dsp:input bean="ShippingGroupFormHandler.removeShippingAddress" type="submit" value="Remove"/>  
           
             
     <%--   <br/><dsp:input bean="ShippingGroupFormHandler.specifyDefaultShippingGroup" type="submit" value="Make this the default Address"/> --%>
               
         </dsp:form>
    </table>      
         
         </dsp:oparam>
    </dsp:droplet><!-- end ForEach -->
  <!-- end output -->
  </dsp:oparam>
</dsp:droplet>
<br>
 <dsp:include page="createShippingGroup.jsp"/>

</dsp:page>