<%@ page isELIgnored="false" %>
<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_1" %>
<dsp:page>
<link rel="stylesheet" href="/css/styles.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="/css/screen.css" type="text/css" media="screen" title="no title" charset="utf-8" />

<script type="text/javascript">
    function myFunction (url) {
        var xmlHttp = getXMLHttpObject();
        xmlHttp.open('GET', 'perl.m', true);
        window.location.href = goto_url;                
    }
</script>

<dsp:include page="/includes/header.jsp" />

<div class="main col2-left-layout">
<div class="col-main">
  
  
<dsp:include page="/account/myorderInc.jsp" />

</div>

<div class="col-left sidebar">
<div class="block block-account">
    <div class="block-title">
        <strong><span>My Account</span></strong>
    </div>
    <div class="block-content">
        <ul>
        	<li><dsp:a href="/account/myaccount.jsp">Dashboard</dsp:a></li>
				                        	
       	 	<li><dsp:a href="/account/dwellEditProfile.jsp">Edit Profile</dsp:a></li>
                                                            	
       		<li><dsp:a href="/account/dwellEditPassword.jsp">Edit Password | Email</dsp:a></li>
	                                                        	
         	<li><dsp:a href="/account/dwellShippingAddress.jsp">Shipping Addresses</dsp:a></li>
                                                            	
            <li class="current"><strong>My Orders</strong></li>
                                                            	
            <li class="account-navigation-title"><strong>My Lists</strong></li>
                                        	
            <li><dsp:a href="/account/myWishlist.jsp">Edit My Wishlist</dsp:a></li>
                                                            	
          
      
      </ul>
    </div>
</div>
</div>
</div>
<dsp:include page="/includes/footerNew.jsp" />
</dsp:page>