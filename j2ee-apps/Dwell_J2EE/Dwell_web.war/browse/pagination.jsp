<%@ page isELIgnored="false" %>
<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_1" %>
<dsp:page>
 <dsp:importbean bean="/atg/endeca/assembler/droplet/InvokeAssembler"/>
<crs:pageContainer>
hello
<dsp:include page="/includes/header.jsp"/>
 banner page bigin
 <dsp:droplet name="InvokeAssembler">
    <dsp:param name="contentCollection" value="/content/Web/Home Pages"/>
    <dsp:oparam name="output">
    <dsp:getvalueof var="homePageContent" vartype="com.endeca.infront.assembler.ContentItem" param="contentItem" />
   <dsp:renderContentItem contentItem="${homePageContent}" /> 
   
   </dsp:oparam>
   
    <dsp:oparam name="error">
     Error Loading Page
    </dsp:oparam>
  
    <dsp:oparam name="empty">
     Media banner is empty
    </dsp:oparam>
  </dsp:droplet>
 
  banner page end
   </crs:pageContainer>
</dsp:page>

 