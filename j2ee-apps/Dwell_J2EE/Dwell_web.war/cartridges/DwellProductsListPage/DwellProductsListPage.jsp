<dsp:page>
<link rel="stylesheet" href="/css/styles.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="/css/screen.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<body class=" cms-index-index cms-home">
<div class="wrapper">
<div class="page">
<dsp:include page="/includes/header.jsp"/>
<div class="main col2-left-layout">

<dsp:importbean bean="/atg/endeca/assembler/droplet/InvokeAssembler"/>
<dsp:importbean bean="/atg/commerce/order/purchase/CartModifierFormHandler"/>
  <dsp:importbean bean="/OriginatingRequest" var="originatingRequest"/>
  <dsp:importbean bean="/atg/endeca/store/droplet/ActionURLDroplet"/>
  <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/3-col-portfolio.css" rel="stylesheet">

 <dsp:getvalueof var="ntt" param="Ntt"/> 

 
 <dsp:getvalueof var="contentItem" vartype="com.endeca.infront.assembler.ContentItem" 
                  value="${originatingRequest.contentItem}"/>

 
    <dsp:getvalueof var="maincontent" value="${contentItem.MainContent}"/>
    
 <c:choose>
 <c:when test="${not empty ntt}">
  
  <dsp:getvalueof var="maincontent" value="${contentItem.MainContent}"/>
  <div class="col-left sidebar">
<div class="block block-layered-nav">
<div class="block-title">
<h1>CATEGORIES</h1>
</div>
<div class="block-content">
<ul class="left-category-navigation">
<li class="level1 nav-1 active first parent">
<ul class="level1">
<c:forEach var="secondaryContent" items="${contentItem.SecondaryContent}">
  <li class="level1">
   <dsp:renderContentItem contentItem="${secondaryContent}" />
   </li>
   </c:forEach>
   </ul>
   </li>
   </ul>
   </div>
   </div>
   </div>
  </c:when>
  <c:otherwise>
 
  </c:otherwise>
  </c:choose>
  
 <div class="col-main">
<div class="category-view">
 
 <c:forEach var="content" items="${maincontent}">

  <dsp:include page="productListRangePagination.jsp">
<dsp:param name="contentItem" value="${content}"/>
</dsp:include>


<dsp:form id="sortByForm">
<br>
Sort By:
<select  id="sortBySelect" name="sort" onchange="location = this.options[this.selectedIndex].value">
<c:forEach var="sort" items="${content.sortOptions}" >
<dsp:droplet name="ActionURLDroplet">
                      <dsp:param name="action" value="${sort}"/>
                      <dsp:oparam name="output">
                        <dsp:getvalueof var="actionURL" param="actionURL"/>
                       ${actionURL}
                        <c:set var="sortAction" value="${actionURL}"/>
                  
                      </dsp:oparam>
                    </dsp:droplet>
<option
 <c:if test="${sort.selected}">
                            selected="true"
                        </c:if>
                        
 value="${fn:replace(sortAction,"/dwell/storeus","")}">${sort.label}
    </option>
</c:forEach>
</select>
</dsp:form>




<div class="category-products">
<ul class="products-grid first odd">
  <c:forEach var="record" items="${content.records}">
 
 <dsp:droplet name="/atg/commerce/catalog/ProductLookup">

 <dsp:param name="id" value="${record.attributes['product.repositoryId']}"/>
     <dsp:getvalueof var="id" value="${record.attributes['product.repositoryId']}"/>
   <dsp:param value="product" name="elementName" />
    <dsp:oparam name="output">
	   <li class="item">
  
  <dsp:a href="/browse/Product.jsp">
   <dsp:param name="productId" param="product.id"/> 
   <dsp:getvalueof var="pid" param="product.id"/>
       
        <dsp:getvalueof var="images" param="product.largeImage.url" />
        <dsp:getvalueof var="childSKUs" param="product.childSKUs"/>
    <img src="${images}" width="240" height="200" />
	<h2 class="product-name"><dsp:valueof param="product.displayName" /></h2>

  <div class="product-price">
  		<div class="price-box">
     <dsp:droplet name="/dwell/DwellDroplet">
  <dsp:param name="product" param="product"/>
    <dsp:oparam name="output">
    <br><dsp:getvalueof var="def" param="defaultSKU"/>
   <dsp:include page="/browse/PriceDisplay.jsp" >
    <dsp:param name="sku" param="defaultSKU" />
    <dsp:param name="product" param="product"/>
    </dsp:include>
    </dsp:oparam>
</dsp:droplet>
  </div>
    </div>
    </dsp:a>
   
   
 <div style="margin-bottom:10px; margin-top:5px;">
   <dsp:form>
   <dsp:input bean="CartModifierFormHandler.catalogRefIds" value="${def.id}" type="hidden"/>
    <b> Quantity: </b><dsp:input bean="CartModifierFormHandler.productId" paramvalue="product.repositoryId" type="hidden"/>
   <dsp:input bean="CartModifierFormHandler.quantity" size="2" value="1" type="text"/>
<br>
  
<dsp:input bean="CartModifierFormHandler.addItemToOrderErrorURL" type="hidden"  value="/c/tabletop"/>
 <c:if test="${fn:length(childSKUs) gt 1}">
  
 <dsp:input bean="CartModifierFormHandler.addItemToOrderSuccessURL" type="hidden" value="/browse/Product.jsp?productId=${pid}"/>
 </c:if>
<dsp:input bean="CartModifierFormHandler.addItemToOrder" type="Submit" value="Add To Cart"/>
<dsp:input bean="CartModifierFormHandler.addItemToOrderSuccessURL" type="hidden" value="/checkout/cart.jsp"/>
 <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
                                        <dsp:param bean="CartModifierFormHandler.formExceptions" name="exceptions"/>
                                        <dsp:oparam name="output">
                                            <li>
                                                <dsp:valueof param="message"/>
                                            </li>
                                        </dsp:oparam>
                                    </dsp:droplet>
       <dsp:a href="/browse/Product.jsp"><b>View Details</b>
  <dsp:param name="productId" param="product.id"/> 
  </dsp:a>
 
</dsp:form>
</div>
         </li>
        </dsp:oparam>
        </dsp:droplet>
		
       </c:forEach> 
       
 </c:forEach>
</ul>
</div>
</div>
 </div>
</div>

 <dsp:include page="/includes/footerNew.jsp" />
</div>
</body>
 </dsp:page>