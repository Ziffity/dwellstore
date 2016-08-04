<%@ page isELIgnored="false" %>
<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_1" %>

<dsp:page>

<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/commerce/order/OrderLookup"/>
      
      
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
<dsp:getvalueof var="orderId" param="orderId"/>
           <dsp:droplet name="/atg/commerce/order/OrderLookup">
           
  <dsp:param value="${orderId}" name="orderId"/>
  <dsp:oparam name="error">
    <p>
    ERROR:
    <dsp:valueof param="errorMsg">no error message</dsp:valueof>
    <p>
  </dsp:oparam>
  <dsp:oparam name="output">
    <p>
     Order ID <b>#<dsp:valueof param="result.id">no order id</dsp:valueof></b>
    <p>
This order is in state:
 <b><dsp:valueof param="result.stateAsString"/> </b>
    <P>
    This order was placed on
      <b><dsp:valueof date="MMMMM d, yyyy" param="result.submittedDate"/>.</b>
    <P>
    
     <P>
    Total Amount   <b>$ <dsp:valueof param="result.priceInfo.total"/> </b>(includes Shipping Charge  <b>$ <dsp:valueof param="result.priceInfo.shipping"> No Shipping Charges</dsp:valueof>) </b>
    <P>
    
    <dsp:getvalueof var="itemsInfo" param="result.commerceItems"/>
    
    
   Items Details 
    <dsp:droplet name="ForEach">
  <dsp:param name="array" value="${itemsInfo}"/>
   <dsp:param name="elementName" value="productGroup"/>
  <dsp:oparam name="output">

     <b><dsp:a href="productDetails.jsp">
 <dsp:param name="productId" param="productGroup.productId"/>
   <dsp:getvalueof var="quantity" param="productGroup.quantity"/> </b>
   
   <dsp:getvalueof var="prodId" param="productGroup.productId"/>
   <br>
   <dsp:droplet name="/atg/commerce/catalog/ProductLookup">
 <dsp:param name="id" value="${prodId}"/>
  
 <dsp:param value="product" name="elementName" />
    
    <dsp:oparam name="empty">
    Product Inaccessible
    
 </dsp:oparam>
    
 <dsp:oparam name="output">
 <table border=2>
 <tr >
 <td rowspan=2>

    <b><dsp:valueof param="product.displayName" />&nbsp;
    (<dsp:valueof value="${quantity}"/>)</b>

 
        <dsp:getvalueof var="images" param="product.thumbnailImage.url" />
  <br>  <img src="${images}" />

  	</dsp:oparam>
 	</dsp:droplet>
 	
 	</td>
</tr></table>

  </dsp:a> 
    </dsp:oparam>
    </dsp:droplet>
    
  

  <dsp:getvalueof var="shippingInfo" param="result.shippingGroups"/>
    
    <dsp:droplet name="ForEach">
  <dsp:param name="array" value="${shippingInfo}"/>
   <dsp:param name="elementName" value="shippingGroup"/>
  <dsp:oparam name="output">

     <P>
    Shipping Method  <b><dsp:valueof param="shippingGroup.shippingMethod"/></b>
    <P>
    
    <P>
    Address  <b><dsp:valueof param="shippingGroup.shippingAddress.address1"/>,
    <dsp:valueof param="shippingGroup.shippingAddress.city"/>,
    <dsp:valueof param="shippingGroup.shippingAddress.state"/>,
    <dsp:valueof param="shippingGroup.shippingAddress.country"/></b>
    <P>
    
    </dsp:oparam>
</dsp:droplet>

  <dsp:getvalueof var="paymentInfo" param="result.paymentGroups"/>
 <dsp:droplet name="ForEach">
  <dsp:param name="array" value="${paymentInfo}"/>
   <dsp:param name="elementName" value="paymentGroup"/>
  <dsp:oparam name="output">

     <P>
    Payment Method  <b><dsp:valueof param="paymentGroup.paymentMethod"/></b>
    <P>
    
    <P>
    Credit Card Name <b><dsp:valueof param="paymentGroup.creditCardType"/></b>
    <P>
    
    <P>
    Credit Card Number <b><dsp:valueof param="paymentGroup.creditCardNumber"  converter="creditCard" groupingsize="4"/></b>
    <P>
    
    <p><center>

    </dsp:oparam>
</dsp:droplet>


 <dsp:droplet name="Switch">
 <dsp:param name="value" param="result.stateAsString"/>

 <dsp:oparam name="NO_PENDING_ACTION">

  <!-- Snip -->

   This order has been completed.  You cannot cancel it.
   </dsp:oparam>

   <dsp:oparam name="default">

  <!-- Snip -->

 <dsp:a href="orderCancel.jsp">
 <dsp:param name="orderId" param="result.id"/>
      Cancel the Order</dsp:a><br>
 </dsp:oparam>
</dsp:droplet>


  </dsp:oparam>
</dsp:droplet>
      
            
            </td></tr>
             
          </table>
   
      
      </td></tr></table>


</dsp:page>