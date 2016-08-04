 <dsp:page>
 <link rel="stylesheet" href="/css/styles.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="/css/screen.css" type="text/css" media="screen" title="no title" charset="utf-8" />
 <dsp:importbean bean="/atg/endeca/assembler/droplet/InvokeAssembler"/>
 <dsp:importbean bean="/atg/targeting/TargetingFirst"/>
<dsp:importbean bean="atg/userprofiling/Profile"/>
<dsp:importbean bean="/OriginatingRequest" var="originatingRequest"/>

<div class="std">
<div class="category-products">
     <ul class="products-grid first odd">
       
<dsp:droplet name="TargetingFirst">
<dsp:param name="targeter" bean="/atg/registry/RepositoryTargeters/FeaturedProducts"/>
<dsp:param name="howMany" value="12"/>
<dsp:oparam name="output">
<li class="item">

<dsp:a href="/browse/Product.jsp">
 <dsp:param name="productId" param="element.id"/>    
<dsp:getvalueof var="imgUrl" param="element.largeImage.url" />

<img src="${imgUrl}" width="240" height="200" />
<h2 class="product-name"><dsp:valueof param="element.displayName" /></h2>

<div class="product-price">
         <div class="price-box">
<dsp:droplet name="/dwell/DwellDroplet">
  <dsp:param name="product" param="element"/>
    <dsp:oparam name="output">
    <span class="regular-price">
   <dsp:include page="/browse/PriceDisplay.jsp" >
    <dsp:param name="sku" param="defaultSKU" />
    <dsp:param name="product" param="product"/>
    
    </dsp:include>
    </span>
    </dsp:oparam>
   
</dsp:droplet>
 </dsp:a>
 </div></div>
 </li>
</dsp:oparam>

</dsp:droplet>
</ul>
</div></div>



</dsp:page>