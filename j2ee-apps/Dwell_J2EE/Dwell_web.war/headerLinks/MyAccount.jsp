<dsp:page>
<body>
<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>
<dsp:include page="/includes/header.jsp"/>
<dsp:importbean bean="/atg/endeca/assembler/droplet/InvokeAssembler"/>
<br><br>
<dsp:droplet name="InvokeAssembler">
    <dsp:param name="contentCollection" value="/content/Shared/Sidebar"/>
    <dsp:oparam name="output">
      <dsp:getvalueof var="SidebarContent" vartype="com.endeca.infront.assembler.ContentItem" param="contentItem" />
     <dsp:renderContentItem contentItem="${SidebarContent}" />
    </dsp:oparam>
    <dsp:oparam name="error">
    	Error Loading Page
    </dsp:oparam>
  </dsp:droplet>
  
 </br></br>
<div align="right">
<dsp:form action="Logout.jsp" method="post">
            
              <!-- Default form error handling support -->
              <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
                <dsp:oparam name="output">
                  <b><dsp:valueof param="message"/></b><br>
                </dsp:oparam>
                <dsp:oparam name="outputStart">
                  <LI>
                </dsp:oparam>
                <dsp:oparam name="outputEnd">
                  </LI>
                </dsp:oparam>
              </dsp:droplet>
            
              <!-- defines the URL to go to on success (relative to 'action')-->
              <dsp:input bean="/atg/userprofiling/ProfileFormHandler.logoutSuccessURL" type="hidden" value="${originatingRequest.contextPath}/index.jsp"/>
              <dsp:input bean="/atg/userprofiling/ProfileFormHandler.logout" type="Submit" value="Logout"/>
            
 </dsp:form>
 </div>
  </dsp:page>