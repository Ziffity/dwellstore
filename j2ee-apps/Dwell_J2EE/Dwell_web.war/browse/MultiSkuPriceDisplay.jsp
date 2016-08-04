<dsp:page>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_1" %>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/commerce/pricing/priceLists/PriceDroplet" />

   

<% 
String sku= request.getParameter("val");
String product= request.getParameter("prod");
pageContext.setAttribute("sku", sku);
pageContext.setAttribute("product", product);
%>
<c:set var="sku" value="${sku}"/>
<c:set var="product" value="${product}"/>
<dsp:getvalueof var="sku" value="${sku}"/>
<dsp:getvalueof var="product" value="${product}" />


<c:if test="${empty sku}">
 <dsp:getvalueof var="childSKUs" param="product.childSKUs"/>
 <!-- <c:if test="${fn:length(childSKUs) eq 1}"> -->
      <dsp:getvalueof var="sku" value="${product.childSKUs[0]}"/>
   <!-- </c:if> -->
</c:if>

<%-- <% out.println(sku+","+product);%> --%>

<dsp:include page="/browse/skuPrice.jsp">
 <dsp:param name="product" value="${product}"/> 
  <dsp:param name="sku" value="${sku}"/>   
 </dsp:include>

</dsp:page>
 