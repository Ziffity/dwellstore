<%--
Return content from Endeca Experience Manager using the InvokeAssembler droplet
--%>
<dsp:page>

 <dsp:importbean bean="/atg/endeca/assembler/cartridge/AutoSuggestDroplet"/>

 <dsp:droplet name="AutoSuggestDroplet">
  <dsp:param name="collection" param="contentCollection"/>

  <dsp:oparam name="output">
 
   <dsp:getvalueof var="contentItem" vartype="com.endeca.infront.assembler.ContentItem" param="contentItem" />
 	
  </dsp:oparam>
  
  <dsp:oparam name="error">
  Error Not Found
  </dsp:oparam>
 </dsp:droplet>

</dsp:page>