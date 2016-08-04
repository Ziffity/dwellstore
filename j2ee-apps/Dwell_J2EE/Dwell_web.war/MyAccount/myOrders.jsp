<%@ page isELIgnored="false" %>
<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_1" %>

<dsp:page>

<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/commerce/order/OrderLookup"/>
      
      
       <dsp:include page="/includes/header.jsp"/>
       
<!-- Start Profile Form Handler -->
  
      
          
        <table cellpadding="9" border=2 align="center" >
      <tr>
      <td>
        
            <table cellpadding="6" border=0 align="center" >
        <a href="editProfile.jsp">Update Profile</a>&nbsp;&nbsp;&nbsp;<a href="addressBook.jsp?init=true">My Address Book</a>&nbsp;&nbsp;&nbsp;<a href="myOrders.jsp">My Orders</a>
           <tr>
            	<center></center>
            	<hr>
              <tr>
            	<td>
            <h3><u>My Orders</u></h3>   
            </td>
            </tr>
            
            
            
            <dsp:droplet name="/atg/commerce/order/OrderLookup">
 <dsp:param bean="/atg/userprofiling/Profile.repositoryId" name="userId"/>
 <dsp:param value="open" name="state"/>
 <dsp:oparam name="output">
    <dsp:droplet name="/atg/dynamo/droplet/ForEach">
       <dsp:param param="result" name="array"/>
       <dsp:oparam name="outputStart">
          <OL>
       </dsp:oparam>
       <dsp:oparam name="output">
       <tr><td>
          <LI>
          <dsp:a href="myOrderDetails.jsp">
          <dsp:param name="orderId" param="element.id"/> 
           <dsp:valueof param="element.id"/>
           </dsp:a>
          </td>
          
          <td>
              This order was placed on
       <dsp:valueof date="MMMMM d, yyyy" param="element.submittedDate"/>
       
       </td></tr>
     <%-- 
       and shipped on
       <dsp:valueof date="MMMMM d, yyyy" param="element.completedDate"/>.
     --%>
     
        
       </dsp:oparam>
       <dsp:oparam name="outputEnd">
          </OL>
       </dsp:oparam>
       <dsp:oparam name="empty">
          No open orders.
       </dsp:oparam>
    </dsp:droplet>
 </dsp:oparam>
 <dsp:oparam name="error">
    <span class=profilebig>ERROR:
       <dsp:valueof param="errorMsg">no error message</dsp:valueof>
    </span>
 </dsp:oparam>
</dsp:droplet>
            
            
            </td></tr>
             
          </table>
   
      
      </td></tr></table>


</dsp:page>