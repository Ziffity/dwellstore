<dsp:page>
<dsp:importbean bean="atg/userprofiling/Profile"/>
<dsp:include page="/includes/header.jsp"/>
 
<dsp:getvalueof var="fname" bean="Profile.shippingAddress.firstName"/>
<dsp:getvalueof var="lname" bean="Profile.shippingAddress.lastName"/>
<dsp:getvalueof var="address1" bean="Profile.shippingAddress.address1"/>
<dsp:getvalueof var="city" bean="Profile.shippingAddress.city"/>
<dsp:getvalueof var="state" bean="Profile.shippingAddress.state"/>
<dsp:getvalueof var="post" bean="Profile.shippingAddress.postalCode"/>
<dsp:getvalueof var="country" bean="Profile.shippingAddress.country"/>

<dsp:getvalueof var="bfname" bean="Profile.billingAddress.firstName"/>
<dsp:getvalueof var="blname" bean="Profile.billingAddress.lastName"/>
<dsp:getvalueof var="baddress1" bean="Profile.billingAddress.address1"/>
<dsp:getvalueof var="bcity" bean="Profile.billingAddress.city"/>
<dsp:getvalueof var="bstate" bean="Profile.billingAddress.state"/>
<dsp:getvalueof var="bpost" bean="Profile.billingAddress.postalCode"/>
<dsp:getvalueof var="bcountry" bean="Profile.billingAddress.country"/>

<h3>DefaultShippingAddress</h3>
${fname}<br>
${lname}<br>
${address1}<br>
${city}<br>
${state}<br>
${post}<br>
${country}<br>

<h3>DefaultBillingAddress</h3>
${bfname}<br>
${blname}<br>
${baddress1}<br>
${bcity}<br>
${bstate}<br>
${bpost}<br>
${bcountry}<br>
<dsp:a href="EditAddresses.jsp">ManageAddresses</dsp:a>
</dsp:page>