<%@ page isELIgnored="false" %>
<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_1" %>
<dsp:page>
<link rel="stylesheet" href="/css/styles.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="/css/screen.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<body class=" cms-index-index cms-home">
<div class="wrapper">
<div class="page">
<link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/3-col-portfolio.css" rel="stylesheet">
<link rel="stylesheet" href="${originatingRequest.contextPath}/css/styles.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="${originatingRequest.contextPath}/css/screen.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<body class=" cms-index-index cms-home">
<div class="wrapper">
<div class="page">
<dsp:importbean bean="/atg/commerce/gifts/GiftlistFormHandler"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/endeca/assembler/droplet/InvokeAssembler"/>
<dsp:importbean bean="/atg/commerce/catalog/ProductLookup"/>
<dsp:importbean bean="/dwell/DwellDroplet"/>
<dsp:importbean bean="/atg/commerce/order/purchase/CartModifierFormHandler" />
<dsp:include page="/includes/header.jsp" />
<dsp:getvalueof var="product" param="productId"/>

<script type="text/javascript">
function priceDisplay1()  
{  
var request; 
var v=document.vinform.stage1.value;  
var p="${product}";
var url="MultiSkuPriceDisplay.jsp?val="+v+"&prod="+p;  
  
if(window.XMLHttpRequest)
{  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject)
{  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try  
{  
request.onreadystatechange=getInfo;  
request.open("GET",url,true);  
request.send();  
}  
catch(e)  
{  
alert("Unable to connect to server");  
}  


function getInfo()
{  
if(request.readyState==4)
{  
var val=request.responseText;  
document.getElementById('selboxId').innerHTML=val; 
productprice();
}
} 
} 
window.onload = function() 
{
document.getElementsByName('stage1')[0].onchange();
}
function productprice()  
{  
var request; 
var v=document.vinform.stage1.value;  
var p="${product}";
var url="MultiSkuImageDisplay.jsp?val="+v+"&prod="+p;  
  
if(window.XMLHttpRequest)
{  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject)
{  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try  
{  
request.onreadystatechange=getInfo;  
request.open("GET",url,true);  
request.send();  
}  
catch(e)  
{  
alert("Unable to connect to server");  
}  

window.onload = function() 
{
document.getElementsByName('stage1')[0].onchange();
}
function getInfo()
{  
if(request.readyState==4)
{  
var val=request.responseText;  
document.getElementById('image').innerHTML=val; 
}
} 
} 
</script>
<dsp:droplet name="InvokeAssembler">
    <dsp:param name="contentCollection" value="/content/Shared/Header"/>
    <dsp:oparam name="output">
      <dsp:getvalueof var="headerContent" vartype="com.endeca.infront.assembler.ContentItem" param="contentItem" />
     
    </dsp:oparam>
    <dsp:oparam name="error">
    	Error Loading Page
    </dsp:oparam>
  </dsp:droplet>
  
<div class="main col1-layout">
	<div class="col-main">
		<dsp:droplet name="ProductLookup">
 			<dsp:param name="id" value="${product}"/>
 		<dsp:getvalueof var="prod" param="id"/>
 	
 			<dsp:param value="product" name="elementName" />
    		<dsp:oparam name="empty">Product Inaccessible</dsp:oparam>
		<dsp:oparam name="output">
			<div class="product-view">
				<div class="product-essential">
					<div class="product-img-box">
						<div class="product-image" id="image">
							<dsp:getvalueof var="images" param="product.largeImage.url" />
    						<img id="image" width="400" height="400" src="${images}" />
    					</div>
    				</div>
    				<div class="product-shop">
						<div class="product-main-info">
							<div class="product-name">
    							<h1 id="registry-product-detailed-title" itemprop="name"><dsp:valueof param="product.displayName" /></h1>
    						</div>
    						<div id="desc" class="menu_body" style="display:block" itemprop="description">
    									<h3><dsp:valueof param="product.description" /></h3>
    									<p><dsp:valueof param="product.longDescription" valueishtml="true" /></p>
    								</div>
    						<dsp:droplet name="DwellDroplet">
  								<dsp:param name="product" param="product"/>
  									<dsp:oparam name="output">
    									<div class="price-area">
    										<div class="price-box">
    										<span id="selboxId">
  												<dsp:include page="priceDisplay.jsp" >
     												<dsp:param name="sku" param="defaultSKU" />
     												<dsp:param name="product" param="product"/>
      											</dsp:include>
      										</span>
    										</div>
    									</div>
    									
    									<dsp:form name="vinform" method="post">
  											<dsp:getvalueof var="childSKU" param="product.childSKUs" />
  											<c:choose>
  												<c:when test="${fn:length(childSKU) gt 1}">
  												<b>Color:</b>
  													<dsp:select bean="CartModifierFormHandler.catalogRefIds" onchange="priceDisplay1();"   name="stage1" >
   														<c:forEach var="sku" items="${childSKU}">
   															<dsp:option value="${sku.repositoryId}"> ${sku.color}</dsp:option>
   														</c:forEach>
 													</dsp:select>
 													  
 												</c:when>
 												<c:otherwise>
 												
 												
 												
 									<dsp:droplet name="DwellDroplet">
  										<dsp:param name="product" param="product"/>
    									<dsp:oparam name="output">
   
  											  <dsp:include page="PriceDisplay.jsp" >
  											  <dsp:param name="sku" param="defaultSKU" />
   												 <dsp:param name="product" param="product"/>
    
  												  </dsp:include>
  										  </dsp:oparam>
  									 </dsp:droplet>
 												
 													<dsp:input bean="CartModifierFormHandler.catalogRefIds" paramvalue="defaultSKU.id" type="hidden"/>
 												</c:otherwise>
											</c:choose>
    										<dsp:input bean="CartModifierFormHandler.productId" paramvalue="product.repositoryId" type="hidden" />
 											<br><b>Quantity: </b><dsp:input bean="CartModifierFormHandler.quantity" name="quantity" size="3" value="1" type="text"/>
  											<br><br><dsp:input bean="CartModifierFormHandler.addItemToOrder" class="input-submit" value="Add to Cart" type="submit"/>
											<dsp:input bean="CartModifierFormHandler.addItemToOrderSuccessURL" value="/checkout/cart.jsp" type="hidden"/>
										
										
										 <%-- *** Add to Wish List *** --%>
   
   

	<dsp:input bean="GiftlistFormHandler.productId" value="${prod}" type="hidden"/>
	
	<dsp:input bean="GiftlistFormHandler.catalogRefIds" paramvalue="defaultSKU.id" type="hidden"/>
	
	<dsp:input bean="GiftlistFormHandler.quantity" size="4" type="text" value="1" type="hidden"/>
	
	<dsp:setvalue beanvalue="Profile.wishlist" param="wishlist"/>
	
	<dsp:setvalue paramvalue="wishlist.id" param="wishlistId"/>
	
	<c:set var="wishlistId"><dsp:valueof param="wishlistId"/></c:set>

	<dsp:input type="hidden" bean="GiftlistFormHandler.giftlistId" value="${wishlistId}"></dsp:input>
	<dsp:input bean="GiftlistFormHandler.addItemToGiftlistErrorURL" type="hidden" value="/browse/Product.jsp"/>
	<dsp:input bean="GiftlistFormHandler.addItemToGiftlistSuccessURL" type="hidden" value="/account/myWishlist.jsp"/>							
	
	<dsp:input bean="GiftlistFormHandler.addItemToGiftlist" type="submit" class="input-submit" value="Add to WishList"/>	
	
	
</dsp:form>
   
   </dsp:oparam>
</dsp:droplet>

										
										
    							
    						</div>
    					</div>
    				</div>
				</div>
				<%---Related Products Display--%>
										<dsp:getvalueof var="cross" param="product.fixedRelatedProducts" />
				<c:if test="${fn:length(cross) gt 0}">
<div class="container">

        <!-- Page Header -->
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">Related Products
                    
                </h3>
           
<div class="row">
 <dsp:droplet name="/atg/dynamo/droplet/ForEach">
  <dsp:param name="array" value="${cross}"/>
   <dsp:oparam name="output">
    <div class="col-md-3 portfolio-item">
   <dsp:a href="Product.jsp">
   <dsp:param name="productId" param="product.id"/>   
    <dsp:getvalueof var="img" param="product.largeImage.url" />
    <img src="${img}" height="150" width="150"/><br>
    <dsp:valueof param="product.displayName"/> <br>
    
    <dsp:droplet name="/dwell/DwellDroplet">
  <dsp:param name="product" param="product"/>
    <dsp:oparam name="output">
    <dsp:include page="PriceDisplay.jsp" >
    <dsp:param name="sku" param="defaultSKU" />
    <dsp:param name="product" param="product"/>
    
    </dsp:include>
    </dsp:oparam>
</dsp:droplet>
    
    </dsp:a>
    </div>
   </dsp:oparam>
   </dsp:droplet>
     
    </div>
    </div>
 </c:if>
 <%--end--%>
			</dsp:oparam>
		</dsp:droplet>
	</div>
</div>
<dsp:include page="/includes/footer.jsp" />
</div>
</div>

						
</dsp:page>