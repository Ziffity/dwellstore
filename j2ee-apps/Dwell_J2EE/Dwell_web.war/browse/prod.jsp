<%@ page isELIgnored="false" %>
<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_1" %>
<dsp:page>
 <link rel="stylesheet" href="3-col-portfolio.css">
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<dsp:getvalueof var="product" param="productId"/>

 <%--ajax query------------%>
      
      <!DOCTYPE html>
<html>
<style>
#left {
    display: table-cell;
    min-width: 560px;
}
#right {
    display: table-cell;
    min-width: 100px;
    vertical-align: top;
}
</style>
<head>
 <script type="text/javascript"> 

function priceDisplay()  
{  
var sku=document.vinform.stage1.value;  
var product=document.vinform.pid.value;
var quantity=document.vinform.quantity.value;
var url="skuDetails.jsp";
alert("skuId:"+sku+"prodId:"+product+"quantity:"+quantity+"url:"+url);
$.ajax({
   type: "GET",
   url,
   data: {sku: sku,  product: product, quantity:quantity},
   success: function(data)
   {
    alert("******data");
    $("#left").replaceWith(data);
   },
     error: function() 
       {
            alert('Error occured');
        }
    });
}
</script>

</head>

<body>
   <%--ajax end query------------%>
 <dsp:importbean bean="/atg/multisite/Site"/>
<dsp:importbean bean="/atg/commerce/order/purchase/CartModifierFormHandler"/>
<dsp:importbean bean="/OriginatingRequest" var="originatingRequest"/>
 <dsp:include page="/includes/header.jsp"/>
<div align="right">
<dsp:form method="post">
            
              <!-- Default form error handling support -->
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
            
              <!-- defines the URL to go to on success (relative to 'action')-->
              <dsp:input bean="/atg/userprofiling/ProfileFormHandler.logoutSuccessURL" type="hidden" value="${originatingRequest.contextPath}/index.jsp"/>
              <dsp:input bean="/atg/userprofiling/ProfileFormHandler.logout" type="Submit" value="Logout"/>
            
 </dsp:form>
</div>


<dsp:getvalueof var="id" param="productId"/>
<dsp:droplet name="/atg/commerce/catalog/ProductLookup">

 <dsp:param name="id" value="${id}"/>
 
	
	
	<dsp:getvalueof var="images" param="product.largeImage.url" />
 
 <dsp:param value="product" name="elementName" />
    
    <dsp:oparam name="empty">
    Product Inaccessible
    </dsp:oparam>
    
    <dsp:oparam name="output">
   
    <dsp:param name="productId" param="product.id"/>
   <%-- <dsp:getvalueof var="site" bean="Site.id"/>
site:${site} --%>    
        <dsp:getvalueof var="pname" param="product.displayName" />
       
        <%--<h3><dsp:getvalueof var="des" param="product.description" /></h3><br>--%>
         <dsp:getvalueof var="ldes" param="product.longDescription" />
        <dsp:getvalueof var="cross" param="product.fixedRelatedProducts" />
        

		<div id="left">
		 <img id="image" src="${images}" >
  
  <h3>${pname}</h3>
  <p>${ldes}</p>
  
     
  <dsp:form name="vinform" method="post"> 
 
  <dsp:getvalueof var="childSKUs" param="product.childSKUs"/>
  <c:choose>
  <c:when test="${fn:length(childSKUs) ==1}">
  
   <dsp:droplet name="/dwell/DwellDroplet">
  <dsp:param name="product" param="product"/>
    <dsp:oparam name="output">
   
    <dsp:include page="PriceDisplay.jsp" >
    <dsp:param name="sku" param="defaultSKU" />
    <dsp:param name="product" param="product"/>
    
    </dsp:include>
    </dsp:oparam>
   </dsp:droplet>
  
  
   </c:when>
   <c:otherwise>
   
 <b> Color: </b> <dsp:select bean="CartModifierFormHandler.catalogRefIds" onchange="priceDisplay()"   name="stage1" id="changeImage">
 
 

 <c:forEach var="sku" items="${childSKUs}" >
 <dsp:getvalueof var="skuId" value="${sku.repositoryId}" />
 
   <dsp:option value="${skuId}"> ${sku.color}</dsp:option>
  
  </c:forEach>
  </dsp:select>
  
   <span id="selboxId"> </span> 
   
   
</c:otherwise>
</c:choose>

  <br>
 <b> Quantity: </b><dsp:input bean="CartModifierFormHandler.productId" paramvalue="product.repositoryId" type="hidden" id="pid"/>
   <dsp:input bean="CartModifierFormHandler.quantity" size="4" value="1" type="text" id="quantity"/>
   <br><br>
     
 <%-- <dsp:droplet name="/dwell/DwellDroplet">
  <dsp:param name="product" param="product"/>
    <dsp:oparam name="output">
    ddd
    <dsp:include page="PriceDisplay.jsp" >
    <dsp:param name="sku" param="defaultSKU" />
    <dsp:param name="product" param="product"/>
    
    </dsp:include>
    </dsp:oparam>
</dsp:droplet>
--%>
<br>
<br>
 
<dsp:input bean="CartModifierFormHandler.addItemToOrderSuccessURL" type="hidden" value="${originatingRequest.contextPath}/cart/Cart.jsp"/>
<dsp:input bean="CartModifierFormHandler.addItemToOrderErrorURL" type="hidden"  value="Product.jsp"/>
<dsp:input bean="CartModifierFormHandler.addItemToOrder" type="Submit" value="Add To Cart"/>
 <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
                                        <dsp:param bean="CartModifierFormHandler.formExceptions" name="exceptions"/>
                                        <dsp:oparam name="output">
                                            <li>
                                                <dsp:valueof param="message"/>
                                            </li>
                                        </dsp:oparam>
                                    </dsp:droplet>
 
</dsp:form>
        </div>
 <%--  <dsp:droplet name="/atg/dynamo/droplet/ForEach">
   <dsp:param value="sku" name="elementName" />
  <dsp:param name="array" param="product.childSKUs"/>
  <dsp:oparam name="output">
 <dsp:valueof param="sku.color" />
  </dsp:oparam>
  </dsp:droplet>
  --%>
 
  
  
    
<br>
<dsp:droplet name="/dwell/ProductUrlLookup">
<dsp:param name="productId" param="product"/>
<dsp:oparam name="output">
 <dsp:droplet name="/dwell/ProductLookupFromUrl">
 <dsp:param name="seoURL" param="seoURL"/>
    <dsp:oparam name="output">
  <%-- REQ URI:<dsp:valueof param="product"/> --%>
    </dsp:oparam>
    </dsp:droplet>
</dsp:oparam>
    </dsp:droplet>


 


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
    <div class="col-md-2 portfolio-item">
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
</dsp:oparam>

</tr>
</table>

</dsp:droplet>
</body>
</html>



</dsp:page>


