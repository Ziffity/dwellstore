<dsp:page>
<link rel="stylesheet" href="/css/styles.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="/css/screen.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<body class=" cms-index-index cms-home">
<div class="wrapper">
<div class="page">
<dsp:include page="/includes/header.jsp" />

<div class="main col2-left-layout">
<div class="col-main">
  
<dsp:include page="/account/editPasswordInc.jsp" />

</div>

<div class="col-left sidebar">
<div class="block block-account">
    <div class="block-title">
        <strong><span>My Account</span></strong>
    </div>
    <div class="block-content">
        <ul>
        	<li ><dsp:a href="/account/myaccount.jsp">Dashboard</dsp:a></li>
				                        	
       	 	<li class="current"><strong>Edit Profile</strong></li>
                                                            	
       		<li><dsp:a href="/account/dwellEditPassword.jsp">Edit Password | Email</dsp:a></li>
	                                                        	
         	<li><dsp:a href="/account/dwellShippingAddress.jsp">Shipping Addresses</dsp:a></li>
                                                            	
            <li><dsp:a href="/account/dwellMyOrders.jsp">My Orders</dsp:a></li>
                                                            	
            <li class="account-navigation-title"><strong>My Lists</strong></li>
                                        	
            <li><dsp:a href="/account/myWishlist.jsp">Edit My Wishlist</dsp:a></li>
                                                            	
           <li class="last"><dsp:a href="http://store.dwell.com/xnotif/subscr/">My Out of Stock Subscriptions</dsp:a></li>
      
      </ul>
    </div>
</div>
</div>
</div>
<dsp:include page="/includes/footer.jsp" />
</dsp:page>