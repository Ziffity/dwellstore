<dsp:page>
<dsp:importbean bean="/atg/endeca/assembler/droplet/InvokeAssembler"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/OriginatingRequest" var="originatingRequest"/>
<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler" />
<dsp:importbean bean="/atg/commerce/ShoppingCart"/>
 <dsp:importbean bean="atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/IsEmpty"/>

<dsp:droplet name="InvokeAssembler">
    	<dsp:param name="contentCollection" value="/content/Shared/Footer"/>
    	<dsp:oparam name="output">
      		<dsp:getvalueof var="footerContent" vartype="com.endeca.infront.assembler.ContentItem" param="contentItem" />
    	</dsp:oparam>
    	<dsp:oparam name="error">
     		Error Loading Page
    	</dsp:oparam>
  	</dsp:droplet>
    
			<c:if test="${not empty footerContent}">
    			<dsp:renderContentItem contentItem="${footerContent}" />
   			</c:if>
   			</dsp:page>