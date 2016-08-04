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
  
  <dsp:getvalueof var="contentItem" vartype="com.endeca.infront.assembler.ContentItem" 
                  value="${originatingRequest.contentItem}"/>
  
 

      <img src="${contentItem.logo}"/>
     
     <div align="right">
 <dsp:renderContentItem contentItem="${contentItem.SearchBox}"/>
 </div>
    <c:forEach var="content" items="${contentItem.HeaderContent}">
 <a href="${originatingRequest.contextPath}/headerLinks/${content.linkName}.jsp">
 ${content.linkName}
   </a>
   &emsp;&emsp;
  ${actionURL}
</c:forEach>

  			     
  
      
      
     
</dsp:page>
<%-- @version $Id: //hosting-blueprint/B2CBlueprint/version/11.2/Storefront/j2ee/store.war/cartridges/MediaBanner/MediaBanner.jsp#1 $$Change: 946917 $--%>