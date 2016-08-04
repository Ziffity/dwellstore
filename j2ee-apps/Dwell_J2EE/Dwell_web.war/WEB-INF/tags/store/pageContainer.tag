<%--
  Tag that acts as a container for all top level pages, it includes all relevant header, footer and nav elements. 

  The body of this tag should include any required gadgets.

  If any of the divId, titleKey or textKey attributes are set, then the pageIntro gadget will be included. 
  If none of these attributes are specified, then the pageIntro gadget will not be included.

  The tag accepts the following fragments:
    navigationAddition 
      Specifies a fragment that will be included at the end of the left nav gadgets.  
      For example,
        <jsp:attribute name="leftNavigationAddition">
           ....
        </jsp:attribute>
    subNavigation 
      Specifies a fragment that will be contain sub navigation gadgets.
      For example,
        <jsp:attribute name="subNavigation">
           ....
        </jsp:attribute>
    SEOTagRenderer 
      Specifies a fragment that will render SEO meta tags.
      For example,
        <jsp:attribute name="SEOTagRenderer">
           ....
        </jsp:attribute>      
                    

  Required attributes:
    None.

  Optional attributes: 
    divId 
      Id for the containing div, passed to the pageIntro gadget.
    copyrightDivId 
      Id for the containing div, passed to the copyright gadget. 
      If 'copyrightDivId' is not specified then the default value 'atg_store_copyright' will be used.
    bodyClass 
      Class name that will be used in the page's '<body>' tag.
    contentClass 
      Class name that will be used for the page's 'content' '<div>' tag.
    titleKey 
      Resource bundle key for the title, passed to the 'pageIntro' gadget.
    textKey 
      Resource bundle key for the intro text, passed to the 'pageIntro' gadget.
    titleString 
      Title string, passed to the 'pageIntro' gadget.
    textString 
      Intro text string, passed to the 'pageIntro' gadget.
    index 
      Boolean flag indicating if indexing instruction is passed to robot '<meta>' tag and specifies whether a page 
        should be indexed by search robots; Defaults to true.
    follow 
      Boolean flag indicating if indexing instruction is passed to robot '<meta>' tag and specifies whether a page 
        should be followed by search robots; Defaults to true.
    levelNeeded
      String representation of level required for displaying the current page. All levels defined in the
      /atg/store/states/CheckoutProgressStates.checkoutProgressLevels property.
    redirectURL
      If current page is not allowed, request will be redirected to this URL.
    a11yNavDiv
      The nav div to skip to
    a11yNavTextKey
      The skip nav link text
    a11yContentDiv
      The content div to skip to
    a11yContentTextKey
      The skip nav content link text
--%>

<%@ include file="/includes/taglibs.jspf" %>


<%@ tag language="java" %>

<%@ attribute name="divId" %>
<%@ attribute name="copyrightDivId" %>
<%@ attribute name="bodyClass" %>
<%@ attribute name="contentClass" %>
<%@ attribute name="titleKey" %>
<%@ attribute name="textKey" %>
<%@ attribute name="titleString" %>
<%@ attribute name="textString" %>
<%@ attribute name="index" %>
<%@ attribute name="follow" %>
<%@ attribute name="navigationAddition" fragment="true" %>
<%@ attribute name="subNavigation" fragment="true" %>
<%@ attribute name="SEOTagRenderer" fragment="true" %>
<%@ attribute name="levelNeeded" %>
<%@ attribute name="redirectURL" %>
<%@ attribute name="selpage" %>
<%@ attribute name="a11yNavDiv" %>
<%@ attribute name="a11yNavTextKey" %>
<%@ attribute name="a11yContentDiv" %>
<%@ attribute name="a11yContentTextKey" %>
<%@ attribute name="formErrorsRenderer" fragment="true" %>
 
<dsp:importbean bean="/atg/endeca/assembler/droplet/InvokeAssembler"/>


<%--<dsp:droplet name="InvokeAssembler">
  <dsp:param name="contentCollection" value="/content/Shared/Global Search Configuration/Search Box"/>
  <dsp:oparam name="output">
    <dsp:getvalueof var="searchBox" vartype="com.endeca.infront.assembler.ContentItem" param="contentItem" />
  </dsp:oparam>
</dsp:droplet>
--%>


<jsp:invoke fragment="SEOTagRenderer" var="SEOTagRendererContent"/>

<%-- Setup the page e.g CSS, JS, Page Icon etc --%>
<dsp:include page="/includes/pageStart.jsp">
  <dsp:param name="bodyClass" value="${bodyClass}"/>
  <dsp:param name="index" value="${index}"/>
  <dsp:param name="follow" value="${follow}"/>
  <dsp:param name="SEOTagRendererContent" value="${SEOTagRendererContent}" />
</dsp:include>



 <jsp:doBody/>
<%-- When Javascript needs to be added at the very bottom of the page --%>
<dsp:include page="/includes/pageEnd.jsp"/>
<%-- @version $Id: //hosting-blueprint/B2CBlueprint/main/storefront/j2ee/storefront.war/global/gadgets/pageIntro.jsp#1 $$Change: 524649 $ --%>
