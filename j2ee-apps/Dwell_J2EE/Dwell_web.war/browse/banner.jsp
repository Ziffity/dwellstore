 <dsp:page>
 <dsp:importbean bean="/atg/endeca/assembler/droplet/InvokeAssembler"/>
 <dsp:importbean bean="/atg/targeting/TargetingFirst"/>
 <dsp:droplet name="TargetingFirst">
 aa
<dsp:param name="targeter" bean="/atg/registry/RepositoryTargeters/FeaturedProducts"/>
bb
<dsp:param name="howMany" value="25"/>
<dsp:valueof param="element"/>
cc
<dsp:oparam name="output">
ee
<dsp:a href="browse/Product.jsp">
ff
 <dsp:param name="productId" param="element.id"/>    
<dsp:getvalueof var="imgUrl" param="element.smallImage.url">
<img src="${imgUrl}"/><br>
</dsp:getvalueof>
<dsp:valueof param="element.displayName"/><br>
 </dsp:a>
</dsp:oparam>
</dsp:droplet>
 
 banner page bigin
 <dsp:droplet name="InvokeAssembler">
    <dsp:param name="contentCollection" value="/content/Web/Home Pages"/>
    <dsp:oparam name="output">
    <dsp:getvalueof var="homePageContent" vartype="com.endeca.infront.assembler.ContentItem" param="contentItem" />
   <dsp:renderContentItem contentItem="${homePageContent}" /> 
   
   </dsp:oparam>
   
    <dsp:oparam name="error">
     Error Loading Page
    </dsp:oparam>
  
    <dsp:oparam name="empty">
     Media banner is empty
    </dsp:oparam>
  </dsp:droplet>
 
  banner page end
  

  </dsp:page>