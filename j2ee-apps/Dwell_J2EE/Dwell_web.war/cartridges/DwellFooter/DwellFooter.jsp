<dsp:page>
<div class="footer-container">
  <div class="dwell-footer">
	<div class="footer-left">
<dsp:getvalueof var="contentItem" vartype="com.endeca.infront.assembler.ContentItem" 
                  value="${originatingRequest.contentItem}"/>
                <div class="footer-right">
                <ul>
  <c:forEach var="content" items="${contentItem.FooterContent}">
   <li><a href="/c/${content.linkText}" style="text-decoration:none">${content.linkText}</a></li>
    
     </c:forEach>
     </ul>
     </div>
</div>
</div>
</div>
</dsp:page>
               