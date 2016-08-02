<dsp:page>
<link rel="stylesheet" href="/css/styles.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="/css/screen.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<body class=" cms-index-index cms-home">
<div class="wrapper">
<div class="page">
<dsp:include page="/includes/header.jsp" />
<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>
<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler" />
<div class="main col1-layout">
	<div class="col-main">
<dsp:form method="post">

 <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
   <dsp:oparam name="output">
     <b><dsp:valueof param="message"/></b><br>
    </dsp:oparam>
   <dsp:oparam name="outputStart">
      <LI>
    </dsp:oparam>
  <dsp:oparam name="outputEnd">
     </LI>
   </dsp:oparam>
  </dsp:droplet>
 Login:<br>
 <dsp:input bean="ProfileFormHandler.value.login" required="<%=true%>" type="text"/> <br>
         
 Password:<br>
 <dsp:input bean="ProfileFormHandler.value.password" required="<%=true%>"  type="password"/><br>
  
Retype password to confirm:<br>
<dsp:input bean="ProfileFormHandler.confirmPassword" type="hidden" value="true"/>
<dsp:input bean="ProfileFormHandler.value.confirmPassword"  type="password"/><br>
       
 First name:<br>
 <dsp:input bean="ProfileFormHandler.value.firstname"  type="text"/> <br>
          
 Last name:<br>
 <dsp:input bean="ProfileFormHandler.value.lastname"  type="text"/><br>
 <br>
 Email Address:<br>
 <dsp:input bean="ProfileFormHandler.value.email"  type="text"/><br>
 <br>
Address:<br>
 <dsp:input bean="ProfileFormHandler.value.shippingAddress.address1"  type="text"/><br>
 <br>
 City:<br>
 <dsp:input bean="ProfileFormHandler.value.shippingAddress.city"  type="text"/><br>
 <br>
State:<br>
 <dsp:input bean="ProfileFormHandler.value.shippingAddress.state"  type="text"/><br>
 <br>
Postal code:<br>
 <dsp:input bean="ProfileFormHandler.value.shippingAddress.postalCode"  type="text"/><br>
 <br>
Country:<br>
 <dsp:input bean="ProfileFormHandler.value.shippingAddress.country"  type="text"/><br>
 <br> 
 <dsp:input bean="ProfileFormHandler.createSuccessURL" type="hidden" value="/"/>
 <dsp:input bean="ProfileFormHandler.cancelURL" type="hidden" value="/"/>
 <dsp:input bean="ProfileFormHandler.create" type="Submit" value="Register"/>
 <dsp:input bean="ProfileFormHandler.cancel" type="Submit" value="Cancel"/>
  
     
</dsp:form>          
	</div>
</div>
</div>
 <dsp:include page="/includes/footer.jsp" />
</div>
</body>
</dsp:page>