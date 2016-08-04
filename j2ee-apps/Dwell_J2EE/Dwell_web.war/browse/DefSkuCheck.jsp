<dsp:page>
 <dsp:include page="/includes/header.jsp"/>
<dsp:getvalueof var="product" value="prod140030"/>
 <dsp:droplet name="/dwell/DwellDroplet">
  <dsp:param name="product" value="${product}"/>
 
    <dsp:oparam name="output">
    <dsp:include page="PriceDisplay.jsp" >
    <dsp:param name="sku" param="defaultSKU" />
    <dsp:param name="product" value="${product}"/>
    
    </dsp:include>
    </dsp:oparam>
</dsp:droplet>
</dsp:page>