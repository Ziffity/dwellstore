<%--
  Renders MediaBanner cartridge content.
  "Media image" and "Click Action URL" are taken from values defined in XMgr for MediaBanner cartridge.

  Required parameters:
    None.
    
  Optional parameters:
    None.
--%>
<dsp:page>

<%--<dsp:importbean bean="/atg/endeca/assembler/droplet/InvokeAssembler"/>
  <dsp:importbean bean="/OriginatingRequest" var="originatingRequest"/>
 <dsp:droplet name="InvokeAssembler">
    <dsp:param name="contentCollection" value="/content/Web/Home Pages"/>
    <dsp:oparam name="output">
      <dsp:getvalueof var="homePageContent" vartype="com.endeca.infront.assembler.ContentItem" param="contentItem" />
     
    </dsp:oparam>
    <dsp:oparam name="error">
    	Error Loading Page
    </dsp:oparam>
  </dsp:droplet>
  --%>
    <dsp:importbean bean="/atg/endeca/store/droplet/ActionURLDroplet"/>
    <div class="branding">
  <dsp:getvalueof var="contentItem" vartype="com.endeca.infront.assembler.ContentItem" 
                  value="${originatingRequest.contentItem}"/>
                

    
 <h1 class="logo"><dsp:a href="/"><img src="${contentItem.logo}" /></dsp:a></li>
 </div>
 <div class="form-search">
   <div class="form-search-inner">
    <div id="search-form" class="search-form">
     <dsp:renderContentItem contentItem="${contentItem.SearchBox}" />
    </div>
   </div>
  </div>
  
 <div class="nav-container" style="float:none;">
   <div id="top-nav" class="top-nav right">
  <ul class="right">
     <c:forEach var="content" items="${contentItem.TopNavContainer}">
      <li><a href="/c/${content.linkText}" style="text-decoration:none">${content.linkText}</a></li>
     </c:forEach>
    </ul>
   </div>
  </div>
  
  
 
 
  
</dsp:page>

<%-- @version $Id: //hosting-blueprint/B2CBlueprint/version/11.2/Storefront/j2ee/store.war/cartridges/MediaBanner/MediaBanner.jsp#1 $$Change: 946917 $--%>