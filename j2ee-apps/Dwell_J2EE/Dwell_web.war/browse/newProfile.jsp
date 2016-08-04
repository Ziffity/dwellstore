<dsp:page>
 <dsp:importbean bean="/OriginatingRequest" var="originatingRequest"/>
       <dsp:form action="newProfile.jsp" method="post">       
       
            <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
<center>
                   <dsp:oparam name="output">
                     <ul>
                     <li>
                  <font color="Red"><dsp:valueof param="message"/></font> </center>
                     </li>
                     </ul>
                   </dsp:oparam>
                                   
                   <dsp:oparam name="outputStart">
                    
                   </dsp:oparam>
                   
                   <dsp:oparam name="outputEnd">
                     
                   </dsp:oparam>
           </dsp:droplet>
          
        <table bordercolor="black"  border=1 align="left" >
      <tr>
      <td>
       <center> <h1>New Profile</h1></center>
            <table>
            <tr>
            	<td align="left">
            <h3 >Login Information(Required)</h3>   
            <td>
            </tr>
            
    			<tr>
    			<td align="right">
           User Name:
               </td>
            
            <td>
             <dsp:input type="text" bean="/atg/userprofiling/ProfileFormHandler.value.login" name="login"/><br>
         </td>
         
         <tr>
    		<td align="right">
            Password:
            </td>
            <td>
            <dsp:input type="password" bean="/atg/userprofiling/ProfileFormHandler.value.password" name="password"/><br>
  			</td>
  			<tr>
    		<td align="right">
			Retype Password to Confirm:
			</td>
			<td>
            <dsp:input type="password" bean="/atg/userprofiling/ProfileFormHandler.value.confirmPassword"/>
             <dsp:input type="hidden" bean="/atg/userprofiling/ProfileFormHandler.confirmPassword" value="true"/>
             
             </td>
             </tr>
            <br>
            
           
            <tr>
            	<td align="left">
            <h3>Personal Information(Optional)</h3>   

            <td>
            </tr>
             
             <tr>
    		<td align="right">
            First Name:
            </td><td>
            <dsp:input type="text" bean="/atg/userprofiling/ProfileFormHandler.value.firstName" name="firstName"/><br>
          </td>
         <tr>
    		<td align="right">
            Last Name:
            </td><td>
            <dsp:input type="text" bean="/atg/userprofiling/ProfileFormHandler.value.lastName" name="lastName"/><br>
            </td>
             </tr>
            <br>
 			
                   
            <br>
            <tr>
            	<td align="left">
            <h3>Shipping Address</h3>
             <td>
            </tr>
             
             <tr>
    		<td align="right">
            First Name:
            </td><td>
            <dsp:input type="text" bean="/atg/userprofiling/ProfileFormHandler.value.shippingAddress.firstName"/><br>
          </td>
         <tr>
    		<td align="right">
            Last Name:
            </td><td>
            <dsp:input type="text" bean="/atg/userprofiling/ProfileFormHandler.value.shippingAddress.lastName" /><br>
            </td>
             </tr>
            <br>
            <tr>
            <td align="right">
            Address1          :
            <dsp:input type="text" bean="/atg/userprofiling/ProfileFormHandler.value.shippingAddress.address1"/></td><br>
            
            <td align="right">
            City           :
            <dsp:input type="text" bean="/atg/userprofiling/ProfileFormHandler.value.shippingAddress.city"/></td><br>
             <td align="right">
            State            :
            <dsp:input type="text" bean="/atg/userprofiling/ProfileFormHandler.value.shippingAddress.state"/></td><br>
             <td align="right">
             Country            :
            <dsp:input type="text" bean="/atg/userprofiling/ProfileFormHandler.value.shippingAddress.country"/></td><br>
            <br>
             <td align="right">
             PostalCode            :
            <dsp:input type="text" bean="/atg/userprofiling/ProfileFormHandler.value.shippingAddress.postalCode"/></td><br>
            <br>
          
          
          
           <tr>
            	<td align="left">
            <h3>Payment Information</h3>
             <td>
            </tr>
             
             <tr>
    		<td align="right">
            First Name:
            </td><td>
            <dsp:input type="text" bean="/atg/userprofiling/ProfileFormHandler.value.billingAddress.firstName"/><br>
          </td>
         <tr>
    		<td align="right">
            Last Name:
            </td><td>
            <dsp:input type="text" bean="/atg/userprofiling/ProfileFormHandler.value.billingAddress.lastName" /><br>
            </td>
             </tr>
            <br>
            <tr>
            <td align="right">
            Address1          :
            <dsp:input type="text" bean="/atg/userprofiling/ProfileFormHandler.value.billingAddress.address1"/></td><br>
            
            <td align="right">
            City           :
            <dsp:input type="text" bean="/atg/userprofiling/ProfileFormHandler.value.billingAddress.city"/></td><br>
             <td align="right">
            State            :
            <dsp:input type="text" bean="/atg/userprofiling/ProfileFormHandler.value.billingAddress.state"/></td><br>
             <td align="right">
             Country            :
            <dsp:input type="text" bean="/atg/userprofiling/ProfileFormHandler.value.billingAddress.country"/></td><br>
            <br>
             <td align="right">
             PostalCode            :
            <dsp:input type="text" bean="/atg/userprofiling/ProfileFormHandler.value.billingAddress.postalCode"/></td><br>
            <br>
          
            <!-- defines the URL to go to on success (relative to 'action')-->
           <dsp:input bean="/atg/userprofiling/ProfileFormHandler.createSuccessURL" type="hidden" value="/index.jsp"/>
            <dsp:input bean="/atg/userprofiling/ProfileFormHandler.createErrorURL" type="hidden" value="newProfile.jsp"/>
            <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
                                        <dsp:param bean="/atg/userprofiling/ProfileFormHandler.formExceptions" name="exceptions"/>
                                        <dsp:oparam name="output">
                                            <li>
                                                <dsp:valueof param="message"/>
                                            </li>
                                        </dsp:oparam>
                                    </dsp:droplet>
           <tr>
    		<td>
          </td>
           <td>
            <dsp:input bean="/atg/userprofiling/ProfileFormHandler.create" type="Submit" value="Sign-Up" class="btn btn-success"/>
           <dsp:input bean="/atg/userprofiling/ProfileFormHandler.cancel" type="Submit" value="Cancel" class="btn btn-danger"/>
          </td>
          </tr>
          </table>
          </dsp:form>
      </dsp:page>
     