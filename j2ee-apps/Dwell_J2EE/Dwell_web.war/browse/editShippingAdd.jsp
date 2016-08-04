<dsp:page>
<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>
<dsp:form>
<h2>Edit Shipping Address</h2>
<dsp:input type="text" bean="ProfileFormHandler.value.shippingAddress.firstName" /><br>
<dsp:input type="text" bean="ProfileFormHandler.value.shippingAddress.lastName"/><br>
<dsp:input type="text" bean="ProfileFormHandler.value.shippingAddress.address1"/><br>
<dsp:input type="text" bean="ProfileFormHandler.value.shippingAddress.city"/><br>
<dsp:input type="text" bean="ProfileFormHandler.value.shippingAddress.state"/><br>
<dsp:input type="text" bean="ProfileFormHandler.value.shippingAddress.postalCode"/><br>
<dsp:input type="text" bean="ProfileFormHandler.value.shippingAddress.country"/><br>
<dsp:input type="hidden" bean="ProfileFormHandler.updateSuccessURL" value="myAccount.jsp"/> 
<dsp:input type="hidden" bean="ProfileFormHandler.deleteSuccessURL" value="myAccount.jsp"/>
<dsp:input type="hidden" bean="ProfileFormHandler.updateErrorURL" value="editShippingAdd.jsp"/> 
<dsp:input type="submit" bean="ProfileFormHandler.update" value="Save Changes"/> &nbsp;

</dsp:form>
</dsp:page>