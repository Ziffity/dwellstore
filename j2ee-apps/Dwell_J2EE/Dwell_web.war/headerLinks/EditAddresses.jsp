<dsp:page>
<html>
<head>
<script language="JavaScript">
function myFunction()
{
alert("Default Addresses updated Successfully!!!!!!!");
}
</script>
</head>
<body>
<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>
<dsp:include page="/includes/header.jsp"/>
 
<dsp:form>
<h3>Default Shipping Address</h3>
FirstName: <dsp:input type="text" bean="ProfileFormHandler.value.shippingAddress.firstName"/><br>
LastName: <dsp:input type="text" bean="ProfileFormHandler.value.shippingAddress.lastName"/><br>
Address1: <dsp:input type="text" bean="ProfileFormHandler.value.shippingAddress.address1"/><br>
City:  <dsp:input type="text" bean="ProfileFormHandler.value.shippingAddress.city"/><br>
State:  <dsp:input type="text" bean="ProfileFormHandler.value.shippingAddress.state"/><br>
PostalCode:  <dsp:input type="text" bean="ProfileFormHandler.value.shippingAddress.postalCode"/><br>
Country:  <dsp:input type="text" bean="ProfileFormHandler.value.shippingAddress.country"/><br>
<br><br>
<h3>Default Billing Address</h3>
FirstName: <dsp:input type="text" bean="ProfileFormHandler.value.billingAddress.firstName"/><br>
LastName: <dsp:input type="text"  bean="ProfileFormHandler.value.billingAddress.lastName"/><br>
Address1: <dsp:input type="text"  bean="ProfileFormHandler.value.billingAddress.address1"/><br>
City:  <dsp:input type="text"  bean="ProfileFormHandler.value.billingAddress.city"/><br>
State:  <dsp:input type="text"  bean="ProfileFormHandler.value.billingAddress.state"/><br>
PostalCode:  <dsp:input type="text"  bean="ProfileFormHandler.value.billingAddress.postalCode"/><br>
Country:  <dsp:input type="text"  bean="ProfileFormHandler.value.billingAddress.country"/><br>
<br><br>
<dsp:input type="hidden" bean="ProfileFormHandler.updateSuccessURL"  value="MyAccount.jsp"/> 
<dsp:input type="hidden" bean="ProfileFormHandler.updateErrorURL" value="MyAccount.jsp"/>
<dsp:input type="submit" bean="ProfileFormHandler.update" onClick="myFunction()" value="Save Changes"/> &nbsp;
</dsp:form>
</body>
</html>
</dsp:page>

