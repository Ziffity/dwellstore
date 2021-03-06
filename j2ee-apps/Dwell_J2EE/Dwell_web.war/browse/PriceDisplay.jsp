<dsp:page>

<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/commerce/pricing/priceLists/PriceDroplet" />

<dsp:getvalueof var="product" param="product"/>

<dsp:getvalueof var="sku" param="sku" />
<c:if test="${empty sku}">
 <dsp:getvalueof var="childSKUs" param="product.childSKUs"/>
 <!-- <c:if test="${fn:length(childSKUs) eq 1}"> -->
      <dsp:getvalueof var="sku" value="${product.childSKUs[0]}"/>
   <!-- </c:if> -->
</c:if>

<dsp:droplet name="PriceDroplet">
<dsp:param name="product" param="product"/>

<dsp:param name="sku" value="${sku}" />

<dsp:oparam name="output">
<dsp:setvalue param="theListPrice" paramvalue="price" />
<dsp:getvalueof var="profileSalePriceList" bean="Profile.salePriceList" />
<c:choose>
 <c:when test="${not empty profileSalePriceList}">
 
  <dsp:droplet name="PriceDroplet">
   <dsp:param name="priceList" bean="Profile.salePriceList" />
   <dsp:oparam name="output">
    <dsp:getvalueof var="salePrice" param="price.listPrice" vartype="java.lang.Double" />
   <%-- Sale Price: --%><b><dsp:valueof converter="currency" value="${salePrice}"/> 
    <dsp:getvalueof var="price" param="theListPrice.listPrice" vartype="java.lang.Double" />

  <del> <%--List Price:--%> <dsp:valueof converter="currency" value="${price}" /></del></b>
   </dsp:oparam>
   <dsp:oparam name="empty">
    <dsp:getvalueof var="price" param="theListPrice.listPrice" vartype="java.lang.Double" />
    
    <dsp:valueof converter="currency" value="${price}" />
   </dsp:oparam>
  </dsp:droplet>
  </c:when>
  <c:otherwise>
   <dsp:getvalueof var="price" param="theListPrice.listPrice" vartype="java.lang.Double" />
    <dsp:valueof converter="currency" value="${price}" />
  </c:otherwise>
</c:choose>

</dsp:oparam>

<dsp:oparam name="empty">
  <dsp:getvalueof var="saleprice" param="sku.salePrice" vartype="java.lang.Double"/>
  <dsp:valueof value="${saleprice}" />
  <dsp:getvalueof var="listprice" param="sku.listPrice" vartype="java.lang.Double"/>
  <dsp:valueof value="${listprice}" />
</dsp:oparam>
</dsp:droplet>
</dsp:page>