<%@ page isELIgnored="false" %>
<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_1" %>

<dsp:page>
<link rel="stylesheet" href="/css/styles.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="/css/screen.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<body class=" cms-index-index cms-home">
<div class="wrapper">
<div class="page">
<dsp:importbean bean="/atg/commerce/order/purchase/CartModifierFormHandler" />
<dsp:importbean bean="/atg/commerce/ShoppingCart"/>
<dsp:importbean bean="/OriginatingRequest" var="originatingRequest"/>
<dsp:importbean bean="/atg/commerce/order/purchase/ShippingGroupFormHandler" />
<dsp:importbean bean="/atg/commerce/order/purchase/ShippingGroupDroplet" />
<dsp:importbean bean="/atg/dynamo/droplet/ForEach" />
<dsp:importbean bean="/atg/dynamo/droplet/Switch" />

 <dsp:include page="/includes/header.jsp"/>
 <div class="main col1-layout">
<div class="col-main">
<div class="page-title"><h1>DWELL STORE CHECKOUT</h1></div>
<h5>Please fill in the fields below and click "Place Order" to complete your purchase</h5>


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
      
      <table style="width: 400px" border="5">
  <tr><td>
      
      <dsp:form method="post">
     
        <dsp:input bean="ShippingGroupFormHandler.applyDefaultShippingGroup" type="hidden" value="true"/>
<b>Shipping Address</b><BR>
            
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
                
        <dsp:input bean="ShippingGroupFormHandler.applyShippingGroupsErrorURL" type="hidden" value="/checkout/shipping.jsp"/>
        <dsp:input bean="ShippingGroupFormHandler.applyShippingGroupsSuccessURL" type="hidden" value="/checkout/shippingMethod.jsp"/> 
        <dsp:input bean="ShippingGroupFormHandler.applyShippingGroups" type="submit" value="Ship Entire Order to this Address"/>  
             
     <%--   <br/><dsp:input bean="ShippingGroupFormHandler.specifyDefaultShippingGroup" type="submit" value="Make this the default Address"/> --%>
               
         </dsp:form>
    </table>      
         
         </dsp:oparam>
    </dsp:droplet><!-- end ForEach -->
  <!-- end output -->
  </dsp:oparam>
</dsp:droplet>



<h4>Create New: </h4>

 <dsp:include page="createShippingGroup.jsp"/>
</div>
    
</div>
</div>
  <dsp:include page="/includes/footer.jsp" />
  </div>
</body>
</dsp:page>