<dsp:page>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_1" %>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/commerce/pricing/priceLists/PriceDroplet" />
<html>
<head><title>sku Image</title></head>
<body>
   
<dsp:getvalueof var="sku" param="sku"/>
<dsp:getvalueof var="product" param="product" />

<dsp:droplet name="/atg/commerce/catalog/ProductLookup">
<dsp:param name="id" value="${product}"/>
<dsp:param value="product" name="elementName"/>
<dsp:oparam name="output">
 <dsp:getvalueof var="childSKUsId" param="product.childSKUs"/>
 <dsp:getvalueof var="skuId" value="${sku}"/>
 <dsp:droplet name="/atg/dynamo/droplet/ForEach">
<dsp:param name="array" param="product.childSKUs"/>
<dsp:param name="elementName" value="skuId"/>
<dsp:oparam name="output">
<dsp:getvalueof var="chSku" param="skuId.repositoryId"/>

<c:choose>
 <c:when test="${chSku==sku}">
 
 <dsp:getvalueof var="images" param="skuId.largeImage.url" />

    <img src="${images}" height="400" width="400">
 </c:when>
 <c:otherwise>
 
 </c:otherwise>
 </c:choose>

 <dsp:getvalueof var="img" param="skuId.largeImage.url"/>
<img src="${img}" height="70" width="70">

</dsp:oparam>

</dsp:droplet>

</dsp:oparam>
</dsp:droplet>
</body>
</html>
</dsp:page>
 