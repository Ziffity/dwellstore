<%@ page isELIgnored="false" %>
<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_1" %>
<dsp:page>

<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>
<dsp:importbean bean="/OriginatingRequest" var="originatingRequest"/>
<dsp:form action="Login.jsp" method="post">
<dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
<dsp:oparam name="output">
<dsp:valueof param="message"/>
</dsp:oparam>
<dsp:oparam name="outputStart">
<li>
</dsp:oparam>
<dsp:oparam name="outputEnd">
</li>
</dsp:oparam>
</dsp:droplet>
<center>
<br><br><br>
Login:
<dsp:input bean="ProfileFormHandler.value.login" name="login" type="text" size="10" /><br>
Password:
<dsp:input bean="ProfileFormHandler.value.password" name="password" type="password" size="10"/><br>

<dsp:input bean="ProfileFormHandler.loginSuccessURL" type="hidden" value="/index.jsp"/>
<dsp:input bean="ProfileFormHandler.login" type="Submit" value="Login"/>
</dsp:form>
</center>
</dsp:page>