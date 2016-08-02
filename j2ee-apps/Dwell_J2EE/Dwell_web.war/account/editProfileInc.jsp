<%@ page isELIgnored="false" %>
<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_1" %>
<dsp:page>
<link rel="stylesheet" href="/css/styles.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="/css/screen.css" type="text/css" media="screen" title="no title" charset="utf-8" />
  <dsp:importbean bean="/atg/userprofiling/ProfileFormHandler" />
<div class="my-account"><div class="page-title">
    <h1>Edit My Profile</h1>
</div>
<dsp:form action="<%=request.getRequestURI()%>" method="post">

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
    <div class="fieldset">
    <input name="form_key" value="B4kMH1Ffz8XAMAm5" type="hidden">
    <input name="success_url" value="" type="hidden">
    <input name="error_url" value="" type="hidden">
        <h2 class="legend">Contact Information</h2>
        <ul class="form-list">
            <li class="fields">
                <div class="customer-name">
    <div class="field name-firstname">
        <label for="firstname" class="required"><em>*</em>First Name</label>
        <div class="input-box">
            <dsp:input class="input-text required-entry" maxlength="255" bean="ProfileFormHandler.value.firstname"  type="text"/> 
        </div>
    </div>
    <div class="field name-lastname">
        <label for="lastname" class="required"><em>*</em>Last Name</label>
        <div class="input-box">
            <dsp:input class="input-text required-entry" maxlength="255" bean="ProfileFormHandler.value.lastname"  type="text"/>
        </div>
    </div>
</div>
            </li>
            <li class="wide">
                <label for="company">Email</label>
                <div class="input-box">
                  <dsp:input class="input-text required-entry" maxlength="255" bean="ProfileFormHandler.value.email"  type="text"/>
                </div>
            </li>
			
						            <li class="wide">
                <label for="street_1" class="required"><em>*</em>Street Address</label>
                <div class="input-box">
                   <dsp:input class="input-text required-entry" maxlength="255" bean="ProfileFormHandler.value.shippingAddress.address1"  type="text"/>
                </div>
            </li>
                            <li class="wide">
                <label for="street_2" class="required">&nbsp;</label>
                <div class="input-box">
                    <dsp:input class="input-text required-entry" maxlength="255" bean="ProfileFormHandler.value.shippingAddress.address2"  type="text"/>
                </div>
            </li>
                                <li class="fields">
                <div class="field">
                    <label for="city" class="required"><em>*</em>City</label>
                    <div class="input-box">
                        <dsp:input class="input-text required-entry" maxlength="255" bean="ProfileFormHandler.value.shippingAddress.city" type="text"/>
                    </div>
                </div>
                <div class="field">
                    <label for="region_id" class="required"><em>*</em>State/Province</label>
                    <div class="input-box">
                        
                          <dsp:input class="input-text required-entry" maxlength="255" bean="ProfileFormHandler.value.shippingAddress.state"  type="text"/>
                		</div>
            </li>
            <li class="fields">
                <div class="field">
                    <label for="zip" class="required"><em>*</em>Zip/Postal Code</label>
                    <div class="input-box">
                        <dsp:input class="input-text required-entry" maxlength="255" bean="ProfileFormHandler.value.shippingAddress.postalCode"  type="text"/>
                    </div>
                </div>
                <div class="field">
                    <label for="country" class="required"><em>*</em>Country</label>
                    <div class="input-box validation-passed">
             				<dsp:input class="input-text required-entry" maxlength="255" bean="ProfileFormHandler.value.shippingAddress.country"  type="text"/>
                    </div>
            </li>
			<li class="fields">
                <div class="field">
                    <label for="telephone" class="required"><em>*</em>Telephone</label>
                    <div class="input-box">
                        <dsp:input class="input-text required-entry" maxlength="255" bean="ProfileFormHandler.value.shippingAddress.phoneNumber"  type="text"/>
                    </div>
                </div>
                            </li>
            <li>
                                    <input name="default_billing" value="1" type="hidden">
                            </li>
            <li>
                                    <input name="default_shipping" value="1" type="hidden">
                            </li>
			
			        </ul>
    </div>
<dsp:input bean="ProfileFormHandler.updateSuccessURL" type="hidden" value="/account/dwellEditProfile.jsp"/>
<p class="required">* Required Fields</p>
<p class="back-link"><a href="#"><small>« </small>Back</a></p> 
    <div class="buttons-set">
        
         
    </div>
<dsp:input bean="ProfileFormHandler.update" type="Submit" class="input-button" value="Save Address"/>

</div>
</dsp:form>
</dsp:page>