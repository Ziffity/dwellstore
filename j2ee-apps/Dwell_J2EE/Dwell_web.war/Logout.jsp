<%@ page isELIgnored="false" %>
<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_1" %>
<dsp:page>

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
              <dsp:input bean="/atg/userprofiling/ProfileFormHandler.logoutSuccessURL" type="hidden" value="index.jsp"/>
              <dsp:input bean="/atg/userprofiling/ProfileFormHandler.logout" type="Submit" value="Logout"/>
            
 </dsp:form>
 </dsp:page>