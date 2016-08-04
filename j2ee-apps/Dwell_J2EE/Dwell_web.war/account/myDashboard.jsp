 <%@ page isELIgnored="false" %>
<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_1" %>
<dsp:page>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
 <link rel="stylesheet" href="/css/styles.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="/css/screen.css" type="text/css" media="screen" title="no title" charset="utf-8" />
 
<div class="dashboard">
    <div class="page-title">
        <h1>My Dashboard</h1>
    </div>
        <div class="welcome-msg">
	      <h2 class="sub-title">Hello, Guest Customer!</h2>
        <p>From your My Account Dashboard you have the ability to view a snapshot of your recent account activity and update your account information. Select a link below to view or edit information.</p>
</div>
    	


	
    <h2 class="sub-title">Account Information</h2>
            <div class="col2-set">
    <div class="col-1">
        <div class="info-box">
            <h3 class="box-title">Contact Information <span class="separator">|</span> </h3>
            <p class="box-content">
                <dsp:valueof bean="Profile.firstName" /><br>
                <dsp:valueof bean="Profile.email" /><br>
                <a href="/account/dwellEditPassword.jsp">Change Password</a>
            </p>
        </div>
    </div>
        <div class="col-2">
        
                    </div>
    </div>
    <div class="col2-set">
    <h2 class="sub-title">Address Book <span class="separator">|</span> <a href="/account/dwellEditProfile.jsp">Manage Addresses</a></h2>
    <div class="col-1">
        <div class="info-box">
           <h3 class="box-title">Default Billing Address <span class="separator"></span> </h3>
                <address class="box-content">
                <dsp:valueof bean="Profile.derivedBillingAddress.firstName" /> <br>

<dsp:valueof bean="Profile.derivedBillingAddress.address1" />, <br>



 <dsp:valueof bean="Profile.derivedBillingAddress.city" />,<dsp:valueof bean="Profile.derivedBillingAddress.state" /> <dsp:valueof bean="Profile.derivedBillingAddress.postalCode" /><br>
<dsp:valueof bean="Profile.derivedBillingAddress.country" /><br>

                </address>
        </div>
    </div>
    <div class="col-2">
        <div class="info-box">
           <h3 class="box-title">Default Shipping Address <span class="separator"></span> </h3>
                <address class="box-content">
                    <dsp:valueof bean="Profile.derivedShippingAddress.firstName" /><br>

<dsp:valueof bean="Profile.derivedShippingAddress.address1" />, <br>



<dsp:valueof bean="Profile.derivedShippingAddress.address2" />,  <dsp:valueof bean="Profile.derivedShippingAddress.city" />, <dsp:valueof bean="Profile.derivedShippingAddress.state" /> <dsp:valueof bean="Profile.derivedShippingAddress.postalCode" /><br>
<dsp:valueof bean="Profile.derivedShippingAddress.country" /><br>


                </address>
        </div>
    </div>
</div>
        </div>
</dsp:page>