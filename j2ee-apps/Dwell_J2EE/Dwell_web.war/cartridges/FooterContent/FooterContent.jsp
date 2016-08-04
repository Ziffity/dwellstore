<%--
  Renders MediaBanner cartridge content.
  "Media image" and "Click Action URL" are taken from values defined in XMgr for MediaBanner cartridge.

  Required parameters:
    None.
    
  Optional parameters:
    None.
--%>
<dsp:page>
In footer jsp
  <dsp:importbean bean="/OriginatingRequest" var="originatingRequest"/>
 
  
  <dsp:getvalueof var="contentItem" vartype="com.endeca.infront.assembler.ContentItem" 
                  value="${originatingRequest.contentItem}"/>
               <li><a href="${contentItem.linkUrl}" style="text-decoration:none">${contentItem.linkText}</a></li>
  
   
    
</dsp:page>

<%-- @version $Id: //hosting-blueprint/B2CBlueprint/version/11.2/Storefront/j2ee/store.war/cartridges/MediaBanner/MediaBanner.jsp#1 $$Change: 946917 $--%>