<dsp:page>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<div class="my-account"><div class="page-title title-buttons">
    <h1>Address Book</h1>
    
</div>
<dsp:getvalueof var="profile" bean="Profile" />
<div class="col2-set addresses-list">
    <div class="col-1 addresses-primary">
        <h2 class="sub-title">Default Addresses</h2>
        <ol>
                    <li class="info-box">
                <h3 class="box-title">Default Billing Address <span class="separator"></span> </h3>
                <address class="box-content">
                <dsp:valueof bean="Profile.derivedBillingAddress.firstName" /> <br>

<dsp:valueof bean="Profile.derivedBillingAddress.address1" />, <br>



<dsp:valueof bean="Profile.derivedBillingAddress.address2" />, <dsp:valueof bean="Profile.derivedBillingAddress.city" />,<dsp:valueof bean="Profile.derivedBillingAddress.state" /> <dsp:valueof bean="Profile.derivedBillingAddress.postalCode" /><br>
<dsp:valueof bean="Profile.derivedBillingAddress.country" /><br>

                </address>
           </li>	
        
                    <li class="info-box">
                <h3 class="box-title">Default Shipping Address <span class="separator"></span> </h3>
                <address class="box-content">
                    <dsp:valueof bean="Profile.derivedShippingAddress.firstName" /><br>

<dsp:valueof bean="Profile.derivedShippingAddress.address1" />, <br>



<dsp:valueof bean="Profile.derivedShippingAddress.address2" />,  <dsp:valueof bean="Profile.derivedShippingAddress.city" />, <dsp:valueof bean="Profile.derivedShippingAddress.state" /> <dsp:valueof bean="Profile.derivedShippingAddress.postalCode" /><br>
<dsp:valueof bean="Profile.derivedShippingAddress.country" /><br>


                </address>
            </li>
                </ol>
    </div>
    <div class="col-2 addresses-additional">
        <h2 class="sub-title">Additional Address Entries</h2>
        <ol>
                    <li class="item empty">
                <p>You have no additional address entries in your address book.</p>
            </li>
                </ol>
    </div>
</div>

<script type="text/javascript">
//<![CDATA[
    function deleteAddress(addressId) {
        if(confirm('Are you sure you want to delete this address?')) {
            window.location='https://store.dwell.com/customer/address/delete/id/'+addressId;
        }
        return false;
    }
//]]>
</script></div>
</dsp:page>