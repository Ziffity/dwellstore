<dsp:page>
<dsp:importbean bean="/atg/commerce/ShoppingCart"/>
<dsp:importbean bean="/OriginatingRequest" var="originatingRequest"/>
<dsp:include page="/includes/header.jsp"/>
 
<dsp:getvalueof var="orderId" bean="ShoppingCart.last.id"/>
<h2>Order ${orderId} Successfully submited</h2>
<dsp:a href="${originatingRequest.contextPath}/index.jsp">Home</dsp:a>
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
</dsp:page>