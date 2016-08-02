<dsp:page>
<h1>welcome</h1>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_1" %>
<dsp:importbean bean="/OriginatingRequest" var="originatingRequest"/>
<html>
<head><title>sku price</title></head>
<body>
 <h1>hello</h1> 
ssssssss<%= request.getParameter("sku")%>
<% 
String sku= request.getParameter("sku");
String product= request.getParameter("product");
String quantity= request.getParameter("quantity");
pageContext.setAttribute("sku", sku);
pageContext.setAttribute("product", product);
pageContext.setAttribute("quantity",quantity);
%>
<c:set var="sku" value="${sku}"/>
<c:set var="product" value="${product}"/>
<c:set var="quantity" value="${quantity}"/>
<dsp:getvalueof var="sku" value="${sku}"/>
sku:${sku}
<dsp:getvalueof var="product" value="${product}" />
prod:${product}
<dsp:getvalueof var="quantity" value="${quantity}" />
<%@ include file="/browse/skuImage.jspf" %>
<%@ include file="/browse/skuPrice.jspf" %>
<b> quantity: </b>${quantity}
</body>
</html>
</dsp:page>
 