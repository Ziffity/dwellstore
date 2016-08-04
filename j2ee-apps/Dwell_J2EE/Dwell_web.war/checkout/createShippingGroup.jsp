<dsp:page>

<dsp:importbean bean="/atg/commerce/order/purchase/CreateHardgoodShippingGroupFormHandler"/>

<table style="width: 300px" border="5">
<dsp:form method="post"> 
<tr> 
<td colspan="6" align="center">New Shipping Address</td> 
</tr>  <tr>  <td>NickName</td>  <td>
<dsp:input bean="CreateHardgoodShippingGroupFormHandler.hardgoodShippingGroupName" type="text"/>
</td>  </tr>  <tr>  <td>FirstName</td>  <td>
<dsp:input bean="CreateHardgoodShippingGroupFormHandler.hardgoodShippingGroup.shippingAddress.firstName"/>
</td>  </tr>  <tr>  <td>MiddleName</td>  <td>
<dsp:input bean="CreateHardgoodShippingGroupFormHandler.hardgoodShippingGroup.shippingAddress.middleName"/>
</td>  </tr>  <tr>  <td>LastName</td> 
<td><dsp:input bean="CreateHardgoodShippingGroupFormHandler.hardgoodShippingGroup.shippingAddress.lastName"/>
</td>  </tr>  <tr>  <td>Email</td> 
<td><dsp:input bean="CreateHardgoodShippingGroupFormHandler.hardgoodShippingGroup.shippingAddress.email"/>
</td>  </tr>  <tr>  <td>Phone Number</td>  <td><dsp:input bean="CreateHardgoodShippingGroupFormHandler.hardgoodShippingGroup.shippingAddress.phoneNumber" required="<%=true%>"/>
</td>  </tr>  <tr>  <td>Address</td>  <td>
<dsp:input bean="CreateHardgoodShippingGroupFormHandler.hardgoodShippingGroup.shippingAddress.address1"/>
</td>  </tr>  <tr>  <td>Address2</td>  <td><dsp:input bean="CreateHardgoodShippingGroupFormHandler.hardgoodShippingGroup.shippingAddress.address2"/></td>
</tr>  <tr>  <td>City</td>  <td><dsp:input bean="CreateHardgoodShippingGroupFormHandler.hardgoodShippingGroup.shippingAddress.city" required="<%=true%>"/>
</td>  </tr>  <tr>  <td>State</td> 
<td><dsp:input bean="CreateHardgoodShippingGroupFormHandler.hardgoodShippingGroup.shippingAddress.state" required="<%=true%>"/></td>
</tr>  <tr>  <td>Country</td>  <td><dsp:input bean="CreateHardgoodShippingGroupFormHandler.hardgoodShippingGroup.shippingAddress.country"/></td>
</tr> <tr> <td>PostalCode</td>  <td><dsp:input bean="CreateHardgoodShippingGroupFormHandler.hardgoodShippingGroup.shippingAddress.postalCode" required="<%=true%>"/></td>
</tr> <tr>  <td colspan="6" align="center"> 

<dsp:input bean="CreateHardgoodShippingGroupFormHandler.newHardgoodShippingGroup" type="submit" value="Add This Address"/>
<dsp:input bean="CreateHardgoodShippingGroupFormHandler.newHardgoodShippingGroupSuccessURL" type="hidden" value="/checkout/shipping.jsp?init=true"/>
<dsp:input bean="CreateHardgoodShippingGroupFormHandler.newHardgoodShippingGroupErrorURL" type="hidden" value="expresscheckout.jsp"/>  </td>  </tr>
</dsp:form>
</table>

</dsp:page>