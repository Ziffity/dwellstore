<dsp:page>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_1" %>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/commerce/pricing/priceLists/PriceDroplet" />

<dsp:getvalueof var="product" param="product"/>

<dsp:getvalueof var="sku" param="sku"/>
<dsp:droplet name="PriceDroplet">
<dsp:param name="product" value="${product}"/>
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
    <br>
   
   <%-- Sale Price1:--%><b><dsp:valueof converter="currency" value="${salePrice}"/> 
    <dsp:getvalueof var="price" param="theListPrice.listPrice" vartype="java.lang.Double" />

  <del><%-- List Price1:--%> <dsp:valueof converter="currency" value="${price}" /></del></b>
 
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
 ss ${saleprice}
  <dsp:valueof value="${saleprice}" />
  <dsp:getvalueof var="listprice" param="sku.listPrice" vartype="java.lang.Double"/>
  <dsp:valueof value="${listprice}" />
</dsp:oparam>
</dsp:droplet>




</dsp:page>