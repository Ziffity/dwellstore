<dsp:page>
<link rel="stylesheet" href="/css/styles.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="/css/screen.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<body class=" cms-index-index cms-home">
<div class="wrapper">
<div class="page">
	<dsp:importbean bean="/atg/commerce/gifts/GiftlistFormHandler"/>
	<dsp:importbean bean="/atg/userprofiling/Profile"/>
	<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
	<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
	<dsp:importbean bean="/atg/dynamo/droplet/IsEmpty"/>
	
	<dsp:importbean bean="/atg/endeca/assembler/droplet/InvokeAssembler"/>
 <dsp:importbean bean="/atg/targeting/TargetingFirst"/>
 <dsp:importbean bean="atg/userprofiling/Profile"/>

<dsp:include page="/includes/header.jsp"/>
<div class="main col2-left-layout">
<div class="col-main">
  
<center>
	

	<dsp:setvalue beanvalue="Profile.wishlist" param="wishlist"/>
	<dsp:setvalue paramvalue="wishlist.giftlistItems" param="items"/> 
	<dsp:setvalue paramvalue="wishlist.id" param="wishlistId"/>
	
	<table cellspacing=2 cellpadding=1 border=1 width=50%>
    
		      <tr>
		      	<td colspan=8><b> <center>My Favourites Listing</center></b></td>
		      </tr>
		      
		        <dsp:droplet name="IsEmpty">
					  <dsp:param name="value" param="items"/>
					  
					  <dsp:oparam name="true">
					  <tr><td>
					  <center>Its Empty...<dsp:a href="/index.jsp"><font color="red"> Add Items </font> </dsp:a> to Your  WistList
					</center>  </td></tr>
					  </dsp:oparam>
					  
					  <tr>
					  
					  <dsp:oparam name="false">
					    		<dsp:droplet name="/atg/dynamo/droplet/ForEach">
					      				<dsp:param name="array" param="items"/>
					      				<dsp:oparam name="output">
					        			<tr valign=top>
					        			
					        	<%--	
					        			<td>	
					        		<dsp:getvalueof var="count" param="count"/>
									
									Quantity:  <dsp:valueof param="element.quantityDesired"/>
										</td>
					        	--%>
					        	
					        		<td>	
					        		<dsp:getvalueof var="wish" param="element.id"/>
					        		<dsp:getvalueof var="count" param="count"/>
								<center> <dsp:valueof param="count"/> </center>
									</td>
					        	
					        	
       									<td>
										<dsp:droplet name="/atg/commerce/catalog/ProductLookup">
								            <dsp:param name="id" param="element.productId"/>
								             <dsp:param name="productName" param="element.displayName"/>  
								            <dsp:param name="elementName" value="product"/>
								            <dsp:oparam name="output">
								            
								     <dsp:a href="/browse/Product.jsp">
     								 <dsp:param name="productId" param="id"/>  
     								 
     								<center> 
     								  <b>
     								 <dsp:valueof param="productName"/> 
								           
								         
								              <dsp:droplet name="/atg/commerce/catalog/SKULookup">
										              <dsp:param name="id" param="element.catalogRefId"/>
										              <dsp:param name="elementName" value="giftSku"/>
										              <dsp:oparam name="output">
										              <%--  	  item Name: <dsp:valueof param="giftSku.displayName"/>  --%>
													   </dsp:oparam>
								              </dsp:droplet>
								          
								     </b>
								        </center>  
								         
								         </dsp:a>
								          
								            </dsp:oparam>
								          </dsp:droplet>							        
								          
								        </td>			     
								     <td>	
				<center>     
				<dsp:a href="/account/removeFromWishlist.jsp"> 
				<dsp:param name="giftId" value="${wish}"/>
				
				<dsp:param name="giftListId" param="wishlistId"/> Remove Item  </dsp:a>			     
				</center> </td>
						</dsp:oparam>
						</dsp:droplet>
						
					</dsp:oparam>
				</dsp:droplet>
			</tr>
		</table>

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
                                        	
            <li><strong>Edit My Wishlist</strong></li>
                                                            	
           <li class="last"><dsp:a href="http://store.dwell.com/xnotif/subscr/">My Out of Stock Subscriptions</dsp:a></li>
      
      </ul>
    </div>
</div>
</div>
</div>
<dsp:include page="/includes/footer.jsp" />
</dsp:page>