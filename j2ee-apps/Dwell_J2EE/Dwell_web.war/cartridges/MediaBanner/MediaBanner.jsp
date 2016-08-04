<%--
  Renders MediaBanner cartridge content.
  "Media image" and "Click Action URL" are taken from values defined in XMgr for MediaBanner cartridge.

  Required parameters:
    None.
    
  Optional parameters:
    None.
--%>
<dsp:page>

  <dsp:importbean bean="/OriginatingRequest" var="originatingRequest"/>
 <dsp:importbean bean="/atg/endeca/store/droplet/ActionURLDroplet"/>
  
  <dsp:getvalueof var="contentItem" vartype="com.endeca.infront.assembler.ContentItem" 
                  value="${originatingRequest.contentItem}"/>
  
 
 <center><img src="${contentItem.imageURL}" alt="${contentItem.name}"/><center>
 <%-- <div id="atg_store_mediaBannerContainer">
    <c:if test="${not empty actionURL}">
      <a href="${actionURL}">
    </c:if>
      <center><img src="${contentItem.imageURL}" alt="${contentItem.name}"/><center>
    <c:if test="${not empty actionURL}">
      </a>
    </c:if>
  </div>
--%><br>
</dsp:page>
<%-- @version $Id: //hosting-blueprint/B2CBlueprint/version/11.2/Storefront/j2ee/store.war/cartridges/MediaBanner/MediaBanner.jsp#1 $$Change: 946917 $--%>
