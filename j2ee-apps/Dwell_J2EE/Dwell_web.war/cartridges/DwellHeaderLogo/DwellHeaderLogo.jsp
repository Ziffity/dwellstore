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
 
 <h1 style="text-align: right; margin-top:-20px;">
   <dsp:renderContentItem contentItem="${contentItem.SearchBox}" />
 </h1>
   
   <h1 style="margin-top:-140px;">
  <dsp:getvalueof var="contentItem" vartype="com.endeca.infront.assembler.ContentItem" 
                  value="${originatingRequest.contentItem}"/>
  <a href="/index.jsp">
      <img src="${contentItem.logoURL}"/>
      </h1></a>
      <br><center>
        ${contentItem.linkURL}
        
        <c:forEach var="content" items="${contentItem.HeaderContent}">
   
   
&emsp;&emsp;<a href="/${content.linkURL}.jsp">
 
 		${content.linkURL}
 		
 		</a>
 		
 		${actionURL}

   		</c:forEach>
   		
   		</center>
<br>
</dsp:page>


<%-- @version $Id: //hosting-blueprint/B2CBlueprint/version/11.2/Storefront/j2ee/store.war/cartridges/MediaBanner/MediaBanner.jsp#1 $$Change: 946917 $--%>