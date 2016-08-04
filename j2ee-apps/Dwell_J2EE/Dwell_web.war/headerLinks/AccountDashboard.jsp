<dsp:page>
<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>
<dsp:include page="/includes/header.jsp"/>
 
<dsp:form>
<h2>Account Information</h2>
FirstName: <dsp:input type="text" bean="ProfileFormHandler.value.firstName"/>
LastName: <dsp:input type="text" bean="ProfileFormHandler.value.lastName"/>
<br><br>
<b>Change Password:</b><br>
New Password :<dsp:input type="password" bean="ProfileFormHandler.value.password" required="<%=true%>"/><br>
ReTypePassword :
<dsp:input bean="ProfileFormHandler.confirmPassword" type="hidden" value="true"/>
<dsp:input bean="ProfileFormHandler.value.confirmPassword"  type="password"/><br>
<dsp:input type="hidden" bean="ProfileFormHandler.updateSuccessURL" value="MyAccount.jsp"/> 
<dsp:input type="hidden" bean="ProfileFormHandler.updateErrorURL" value="MyAccount.jsp"/>
<dsp:input type="submit" bean="ProfileFormHandler.update" value="Save Changes"/> &nbsp;
</dsp:form>
</dsp:page>