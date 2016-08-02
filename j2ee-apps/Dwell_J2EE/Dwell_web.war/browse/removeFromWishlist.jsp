<dsp:page>
<link rel="stylesheet" href="/css/styles.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="/css/screen.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<body class=" cms-index-index cms-home">

<dsp:importbean bean="/atg/commerce/gifts/GiftlistFormHandler"/>

<dsp:importbean bean="/atg/endeca/assembler/droplet/InvokeAssembler"/>
 <dsp:importbean bean="/atg/targeting/TargetingFirst"/>
 <dsp:importbean bean="atg/userprofiling/Profile"/>

 <dsp:include page="/myWishlist.jsp" />
 
<br>
<center>
<dsp:form>

<dsp:getvalueof var="giftlistId" param="giftListId"></dsp:getvalueof>
<dsp:getvalueof var="giftId" param="giftId"></dsp:getvalueof>

	  <dsp:droplet name="/atg/commerce/gifts/RemoveItemFromGiftlist">
		<dsp:param name="giftlistId" param="giftListId"/>
		<dsp:param name="giftId" value="${giftId}"/>
		<dsp:oparam name="error">
		  <font color=cc0000><STRONG><UL>
		  <li>Either giftlist not found or you are not the owner.
		  </UL></STRONG></font>
		</dsp:oparam>
		<dsp:oparam name="output">
		<font color=cc0000><STRONG><UL>
		  <li>Gift List Item Successfully removed.
		  </UL></STRONG></font>
		  
		</dsp:oparam>
	  </dsp:droplet>

	<dsp:input bean="GiftlistFormHandler.giftlistId" paramvalue="giftlistId" type="hidden"/>
</dsp:form>

<dsp:include page="/browse/myWishlist.jsp"/>

</dsp:page>