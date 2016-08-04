<%@ page isELIgnored="false" %>
<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_1" %>
<dsp:page>
<crs:pageContainer>
<link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/3-col-portfolio.css" rel="stylesheet">
 <dsp:importbean bean="/atg/endeca/assembler/droplet/InvokeAssembler"/>
 <dsp:importbean bean="/atg/targeting/TargetingFirst"/>
<dsp:importbean bean="atg/userprofiling/Profile"/>
<dsp:importbean bean="/OriginatingRequest" var="originatingRequest"/>



<dsp:droplet name="InvokeAssembler">
    <dsp:param name="contentCollection" value="/content/Web/Home Pages"/>
    <dsp:oparam name="output">
      <dsp:getvalueof var="homePageContent" vartype="com.endeca.infront.assembler.ContentItem" param="contentItem" />
     
    </dsp:oparam>
    <dsp:oparam name="error">
    	Error Loading Page
    </dsp:oparam>
  </dsp:droplet>
  

    <center><dsp:renderContentItem contentItem="${homePageContent}" /></center>
  
  <%--
    The InvokeAssembler droplet is used to retrieve content from Experience 
    Manager. In this instance we request the ContentItem representing the home
    page.
  
    Input Parameters:
      contentCollection is the full path to the content in Experience Manager.
  
    Open Parameters:
      output The open parameter in which our output parameter is rendered in.
  
    Output Parameters:
      contentItem The ContentItem representing the content requested from Experience
      Manager.
  --%>

</crs:pageContainer>
</dsp:page>
<%-- @version $Id: //product/Eclipse/version/11.2/plugins/atg.project/templates/index.jsp#1 $$Change: 946917 $--%>