<dsp:page>

 <dsp:importbean bean="/atg/endeca/store/droplet/ActionURLDroplet" />
 <dsp:importbean bean="/atg/store/droplet/ArraySubsetHelper" />
  <dsp:importbean bean="/OriginatingRequest" var="originatingRequest"/>
 <dsp:getvalueof var="maxLinks" value="5" />
  <dsp:getvalueof var="top" param="top" />
 <dsp:getvalueof var="currentSize" param="No" />

 <dsp:getvalueof var="contentItem"
  vartype="com.endeca.infront.assembler.ContentItem" param="contentItem" />

 <dsp:getvalueof var="size" value="${contentItem.totalNumRecs}" />
 <c:set var="arraySplitSize" value="${contentItem.recsPerPage}" />
 <c:set var="start" value="${contentItem.firstRecNum}" />

 <c:set var="viewAllLinkClass" value="atg_store_actionViewAll" />
 
<%--total - ${size}, records per page - ${arraySplitSize}
 top ${top}--%>
 
 <c:choose>
  <c:when test="${size % arraySplitSize == 0 }">
   <dsp:getvalueof var="finalPageSize" value="${(size/arraySplitSize)}" />
  </c:when>
  <c:otherwise>
   <dsp:getvalueof var="finalPageSize"
    value="${(size/arraySplitSize)+1}" />
  </c:otherwise>
 </c:choose>

 <fmt:parseNumber var="finalPageNum" integerOnly="true" type="number"
  value="${finalPageSize}" />
 <c:set var="count" value="0" scope="page" />
         
          <dsp:getvalueof var="pageNum"
    value="${((currentSize)/arraySplitSize)+1}" />
        <fmt:parseNumber var="currentPageNum" integerOnly="true"
    type="number" value="${pageNum}" />
    
  <%--  current page :${currentPageNum}, finalPageNum: ${finalPageNum}--%>
  
   <div class="pagination small-6 columns">   
   
    
        <dsp:droplet name="ActionURLDroplet">
          <dsp:param name="action"
     value="${contentItem.pagingActionTemplate}" />          
          <dsp:oparam name="output">
            <dsp:getvalueof var="actionURL" param="actionURL" />
            <c:set var="url" value="${actionURL}" />
            <c:set var="pageTemplate" value="${url}" />
          </dsp:oparam>
        </dsp:droplet>

<%--pageTemplate: ${pageTemplate}
${fn:replace(pageTemplate, "/dwell/storeus","")}--%>
 </div>
 <%-- </c:if> --%>
</dsp:page>