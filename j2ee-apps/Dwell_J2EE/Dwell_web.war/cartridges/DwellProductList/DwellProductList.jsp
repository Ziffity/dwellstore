<dsp:page>
  <b>Search Page</b>
  <dsp:importbean bean="/atg/store/sort/RangeSortDroplet" />
   <dsp:importbean bean="/atg/endeca/store/droplet/ActionURLDroplet"/>
 <dsp:importbean bean="/OriginatingRequest" var="originatingRequest"/>
  <dsp:importbean bean="/atg/endeca/assembler/droplet/InvokeAssembler"/>
  
  <dsp:getvalueof var="contentItem" vartype="com.endeca.infront.assembler.ContentItem" 
                  value="${originatingRequest.contentItem}"/>

<%-- <dsp:droplet name="InvokeAssembler">
    <dsp:param name="contentCollection" value="/content/Web/Browse"/>
    <dsp:oparam name="output">
      <dsp:getvalueof var="contentItem" vartype="com.endeca.infront.assembler.ContentItem" param="contentItem" />
     
    </dsp:oparam>
    <dsp:oparam name="error">
     Error Loading Page
    </dsp:oparam>
  </dsp:droplet> --%>

 contentItem:${contentItem}
 
<c:forEach var="content" items="${contentItem.contents}">
<br>
<dsp:form>
<br>
Sort By:
<select>
 <c:forEach var="sort" items="${content.Result.sortOptions}" >
<option value="${sort}">${sort.label}</option>
</c:forEach>
</select>
</dsp:form>
recsPerPage:${content.Result.recsPerPage}<br>
${content.Result.totalNumRecs} Item(s)
   
<dsp:droplet name="ActionURLDroplet">
      <dsp:param name="action" value="${content.Result.sortOptions}"/>
      <dsp:oparam name="output">
        <dsp:getvalueof var="actionURL" param="actionURL"/>
      </dsp:oparam>
    </dsp:droplet>
  
<dsp:renderContentItem contentItem="${content.HeaderContent}"/>
<c:forEach var="record" items="${content.Result.records}">

 
 <dsp:droplet name="/atg/commerce/catalog/ProductLookup">
<dsp:param name="filterBySite" value="true"/>
<dsp:param name="siteId" value="900001"/>
 <dsp:param name="id" value="${record.attributes['product.repositoryId']}"/>
    
    <dsp:oparam name="output">
    
   <dsp:a href="${originatingRequest.contextPath}/browse/Product.jsp">
   <dsp:param name="productId" param="element.id"/> 
       <h2> <dsp:valueof param="element.displayName" /></h2>
        <dsp:getvalueof var="images" param="element.largeImage.url" />
    <img src="${images}" />
    </dsp:a>
        <h3>Description:<dsp:valueof param="element.description" /></h3><br>
        
        
   <%--     <dsp:droplet name="/dwell/ProductUrlLookup">
<dsp:param name="productId" param="element"/>
<dsp:oparam name="output">
 <dsp:droplet name="/dwell/ProductLookupFromUrl">
 <dsp:param name="seoURL" param="seoURL"/>
    <dsp:oparam name="output">
   REQ URI:<dsp:valueof param="product"/>
    </dsp:oparam>
    </dsp:droplet>
</dsp:oparam>
    </dsp:droplet>
        --%>
 </dsp:oparam>
 
 </dsp:droplet>
 
 </c:forEach>

</c:forEach>




</dsp:page>


