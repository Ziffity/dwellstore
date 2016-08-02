<dsp:page>
<link rel="stylesheet" href="/css/styles.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="/css/screen.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<body class=" cms-index-index cms-home">
<div class="wrapper">
<div class="page">
<dsp:importbean bean="/atg/commerce/ShoppingCart"/>
<link rel="stylesheet" href="${originatingRequest.contextPath}/css/styles.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="${originatingRequest.contextPath}/css/screen.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<dsp:include page="/includes/header.jsp"/>
<div class="main col1-layout">
	<div class="col-main">
<dsp:getvalueof var="order" bean="ShoppingCart.last.id" />
<h1>Order SuccessFully placed</h1>
<br>
 <dsp:a href="/account/dwellOrderDetails.jsp">
             <dsp:param name="order_id" value="${order}" />
                <span class="nobr">View Order</span>
                <dsp:valueof value="${order}"/>

</dsp:a>
</div>
</div>
</div>
<dsp:include page="/includes/footer.jsp"/>
</div>
</body>

</dsp:page>