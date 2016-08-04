<%@ page isELIgnored="false" %>
<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_1" %>

<dsp:page>

<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>
      
      
       <dsp:include page="/includes/header.jsp"/>
       
<!-- Start Profile Form Handler -->
  
       <dsp:form method="post">       
       
        <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
                <dsp:oparam name="output">
                  <b><dsp:valueof param="message"/></b><br>
                </dsp:oparam>
                <dsp:oparam name="outputStart">
                </dsp:oparam>
                <dsp:oparam name="outputEnd">
                </dsp:oparam>
              </dsp:droplet>
          
        <table cellpadding="9" border=2 align="center" >
      <tr>
      <td>
        
            <table cellpadding="6" border=0 align="center" >
       <a href="editProfile.jsp">Update Profile</a>&nbsp;&nbsp;&nbsp;<a href="addressBook.jsp?init=true">My Address Book</a>
       &nbsp;&nbsp;&nbsp;<a href="myOrders.jsp">My Orders</a>
       &nbsp;&nbsp;&nbsp;<a href="myWishlist.jsp">My WishList</a>
              </tr>  </td>
            
            <tr>
  
            <td align="left">
            <h3 style="margin-top:-100px;"><u>Login Informations: </u></h3>   

            <td>
            </tr>
         <tr>
    		<td align="right">
            PassWord:
            </td><td>
            <dsp:input type="password" bean="ProfileFormHandler.value.password" name="password"/><br>
            </td>
             </tr>
            <br>
 			<tr>
    		<td align="right">
            Confirm PassWord:</td>
            <td>
           <dsp:input type="password" bean="ProfileFormHandler.value.confirmPassword"/>
             <dsp:input type="hidden" bean="ProfileFormHandler.confirmPassword" value="true"/>
             <br>
            </td> </tr>
            
            
            <hr>
            <tr>
            	<td align="left">
            <h3><u>Personal Information: </u></h3>   

            <td>
            </tr>
             
             <tr>
    		<td align="right">
            First Name:
            </td><td>
            <dsp:input bean="/atg/userprofiling/ProfileFormHandler.value.firstName" name="firstName"/><br>
          </td>
          
           <br>
 			<tr>
    		<td align="right">
            Middle Name:</td>
            <td>
            <dsp:input bean="/atg/userprofiling/ProfileFormHandler.value.middleName" name="state"/><br>
            </td> </tr> 
          
         <tr>
    		<td align="right">
            Last Name:
            </td><td>
            <dsp:input bean="/atg/userprofiling/ProfileFormHandler.value.lastName" name="lastName"/><br>
            </td>
             </tr>
             
              <br>
 			<tr>
    		<td align="right">
            Address:</td>
            <td>
            <dsp:input bean="/atg/userprofiling/ProfileFormHandler.value.homeAddress.address1" name="state"/><br>
            </td> </tr> 
             
             
            <br>
 			<tr>
    		<td align="right">
            City:</td>
            <td>
            <dsp:input bean="/atg/userprofiling/ProfileFormHandler.value.homeAddress.city" name="city"/><br>
            </td> </tr>            
            
            <br>
           
 			<tr>
    		<td align="right">
            State:</td>
            <td>
            <dsp:input bean="/atg/userprofiling/ProfileFormHandler.value.homeAddress.state" name="state"/><br>
            </td> </tr> 
            
           <br>
           
 			<tr>
    		<td align="right">
            Country:</td>
            <td>
            <dsp:input bean="/atg/userprofiling/ProfileFormHandler.value.homeAddress.country" name="country"/><br>
            </td> </tr> 
            <br>
           
 			<tr>
    		<td align="right">
            Postal Code:</td>
            <td>
            <dsp:input bean="/atg/userprofiling/ProfileFormHandler.value.homeAddress.postalCode" name="postalCode"/><br>
            </td> </tr> 
            
          
            <dsp:input bean="/atg/userprofiling/ProfileFormHandler.updateSuccessURL" type="hidden" value="/index.jsp"/>
             <dsp:input bean="/atg/userprofiling/ProfileFormHandler.cancelURL" type="hidden" value="/index.jsp"/>
           <dsp:input bean="/atg/userprofiling/ProfileFormHandler.updateErrorURL" type="hidden" value="/MyAccount/editProfile.jsp"/>
           <tr>
    		<td>
          </td>
           <td>
            <dsp:input bean="/atg/userprofiling/ProfileFormHandler.update" type="Submit" value="Update" class="btn btn-success"/>
           <dsp:input bean="/atg/userprofiling/ProfileFormHandler.cancel" type="Submit" value="Cancel" class="btn btn-danger"/>
          </td>
          </tr>
          </table>
          </dsp:form>
      
      </td></tr></table>
    



</dsp:page>