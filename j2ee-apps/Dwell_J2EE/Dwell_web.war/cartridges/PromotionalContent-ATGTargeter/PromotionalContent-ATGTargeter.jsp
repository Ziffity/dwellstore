<%--
  Renders Promotional Content Slots
--%>
<dsp:page>
  <dsp:importbean bean="/OriginatingRequest" var="originatingRequest"/>

  <dsp:getvalueof var="contentItem" vartype="com.endeca.infront.assembler.ContentItem" value="${originatingRequest.contentItem}"/> 
  <dsp:getvalueof var="items" value="${contentItem['atg:contents'].items}"/>  
  
  <c:if test="${not empty items}">    
    <c:forEach items="${items}" var="item">  
      <dsp:getvalueof var="pageurl" idtype="java.lang.String" 
                      value="${item.template.url}"/>
      <dsp:include page="${pageurl}">
        <dsp:param name="promotionalContent" value="${item}"/>
      </dsp:include>
    </c:forEach> 
  </c:if> 
  
</dsp:page>
<%-- @version $Id: //hosting-blueprint/B2CBlueprint/version/11.2/Storefront/j2ee/store.war/cartridges/PromotionalContent-ATGTargeter/PromotionalContent-ATGTargeter.jsp#1 $$Change: 946917 $ --%>
