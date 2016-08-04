<dsp:page>
<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>
<dsp:form>
<h2>Edit Billing Address</h2>
<dsp:input type="text" bean="ProfileFormHandler.value.billingAddress.firstName" /><br>
<dsp:input type="text" bean="ProfileFormHandler.value.billingAddress.lastName"/><br>
<dsp:input type="text" bean="ProfileFormHandler.value.billingAddress.address1"/><br>
<dsp:input type="text" bean="ProfileFormHandler.value.billingAddress.city"/><br>
<dsp:input type="text" bean="ProfileFormHandler.value.billingAddress.state"/><br>
<dsp:input type="text" bean="ProfileFormHandler.value.billingAddress.postalCode"/><br>
<dsp:input type="text" bean="ProfileFormHandler.value.billingAddress.country"/><br>
<dsp:input type="hidden" bean="ProfileFormHandler.updateSuccessURL" value="myAccount.jsp"/> 
<dsp:input type="hidden" bean="ProfileFormHandler.deleteSuccessURL" value="myAccount.jsp"/>
<dsp:input type="hidden" bean="ProfileFormHandler.updateErrorURL" value="editPaymentAdd.jsp"/> 
<dsp:input type="submit" bean="ProfileFormHandler.update" value="Save Changes"/> &nbsp;

</dsp:form>
</dsp:page>