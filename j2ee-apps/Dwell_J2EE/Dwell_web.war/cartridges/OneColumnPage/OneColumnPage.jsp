<%--
  ~ Copyright 2001, 2012, Oracle and/or its affiliates. All rights reserved.
  ~ Oracle and Java are registered trademarks of Oracle and/or its
  ~ affiliates. Other names may be trademarks of their respective owners.
  ~ UNIX is a registered trademark of The Open Group.

 
  This page lays out the elements that make up a one column page.
    
  Required Parameters:
    contentItem
      The one column page content item to render.
   
  Optional Parameters:

  NOTES:
    The "rootContentItem" request-scoped variable (request attribute), which is used here,
      is set in the "AssemblerPipelineServlet" Nucleus component.
--%>
<dsp:page>
<link rel="stylesheet" href="css/styles.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="css/screen.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<body class=" cms-index-index cms-home">
<div class="wrapper">
<div class="page">
<dsp:importbean bean="/OriginatingRequest" var="originatingRequest"/>
<dsp:importbean bean="/atg/endeca/assembler/droplet/InvokeAssembler"/>
  <dsp:getvalueof var="content" vartype="com.endeca.infront.assembler.ContentItem" value="${originatingRequest.contentItem}"/> 

<dsp:include page="/includes/header.jsp" />
			
      <div class="main col1-layout">
<div class="col-main">
  	  <c:forEach var="element" items="${content.MainContent}" varstatus="loop">
      	<dsp:renderContentItem contentItem="${element}"/>
      </c:forEach>
      <dsp:include page="/browse/homePagefeaturedProducts.jsp" />
      
   
</div>
</div>
    

</div>





<dsp:include page="/includes/footerNew.jsp" />
<%--
<c:forEach var="content" items="${content.FooterContent}">
  	<dsp:renderContentItem contentItem="${content}"/>
    
     </c:forEach>
     --%>
  <%--<dsp:include page="/includes/footer.jsp" />--%>
  </div>
</body>
</dsp:page>
<%-- @version $Id: //hosting-blueprint/B2CBlueprint/version/11.2/Storefront/j2ee/store.war/cartridges/OneColumnPage/OneColumnPage.jsp#2 $$Change: 953229 $--%>
