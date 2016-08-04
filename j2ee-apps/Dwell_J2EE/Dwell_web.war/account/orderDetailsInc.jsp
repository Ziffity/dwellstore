<dsp:page>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/commerce/order/OrderStatesDetailed"/>
<dsp:importbean bean="/atg/commerce/order/OrderLookup"/>
<dsp:importbean bean="/atg/commerce/ShoppingCart"/>

<dsp:droplet name="OrderLookup">
        <dsp:param name="orderId" param="order_id"/>
        
        <dsp:oparam name="output">
    	 <dsp:getvalueof var="order" param="result"/>
    	<dsp:getvalueof var="commerceItem" param="result.commerceItems" />
    			
        
<div class="col-main">
                <div class="my-account"><div class="order-page">
<div class="page-title title-buttons">
    <h1>Order #<dsp:valueof param="order_id"/> - 
    		  <dsp:droplet name="OrderStatesDetailed">
         	  <dsp:param name="state" param="order.state"/>
         	   <dsp:param name="elementName" value="orderStateDescription"/>
         	  <dsp:oparam name="output">
      			<dsp:valueof param="orderStateDescription" />
      		   </dsp:oparam>
      		  </dsp:droplet></h1>
    <a href="https://store.dwell.com/sales/order/print/order_id/30558/" onclick="this.target='_blank';">Print Order</a>
</div>
<!--{MESSAGES_27acc08fb41aad9b12aa021e6eee9fdb}--><!--/{MESSAGES_27acc08fb41aad9b12aa021e6eee9fdb}--><dl class="order-info">
    <dt>About This Order:</dt>
    <dd>
                <ul>
                                    <li class="current"><strong>Order Information</strong></li>
                            </ul>
    </dd>
</dl>
<p class="order-date">Order Date: <dsp:valueof date="MMM d, yyyy" value="${order.submittedDate}"/></p>
<div class="col2-set">
    <div class="col-1">
        <div class="info-box">
            <h2 class="box-title">Shipping Address</h2>

<dsp:getvalueof var="shippingInfo" value="${order.shippingGroups}"/>

<dsp:droplet name="ForEach">
  <dsp:param name="array" value="${shippingInfo}"/>
   <dsp:param name="elementName" value="shippingGroup"/>
  <dsp:oparam name="output">

            <address class="box-content"><br>


<dsp:valueof param="shippingGroup.shippingAddress.address1"/>,<br/>

<dsp:valueof param="shippingGroup.shippingAddress.city"/>,
    <dsp:valueof param="shippingGroup.shippingAddress.state"/>,
   <br/>
 <dsp:valueof param="shippingGroup.shippingAddress.country"/><br/>

</address>
 
        </div>
    </div>

      <div class="col-2">
        <div class="info-box">
            <h2 class="box-title">Shipping Method</h2>
            <div class="box-content">
                    Shipping Option -  :  <dsp:valueof param="shippingGroup.shippingMethod"/>                  </div></dsp:oparam>
</dsp:droplet>
        </div>
    </div>
</div>

<div class="col2-set">
    <div class="col-1">
        <div class="info-box">
            <h2 class="box-title">Billing Address</h2>
<dsp:droplet name="ForEach">
<dsp:param name="array" bean="ShoppingCart.current.paymentGroups" />
<dsp:oparam name="output">
            <address class="box-content"><dsp:valueof  param="element.billingAddress.firstName"/><br>

<dsp:valueof  param="element.billingAddress.address1"/><br>

<dsp:valueof  param="element.billingAddress.state"/> ,  <dsp:valueof  param="element.billingAddress.city"/>,  <dsp:valueof  param="element.billingAddress.postalCode"/><br>
<dsp:valueof  param="element.billingAddress.country"/><br>

</address>
        </div>
    </div>


    <div class="col-2">
        <div class="info-box">
            <h2 class="box-title">Payment Method</h2>
            <div class="box-content"><p><strong><dsp:valueof param="element.paymentMethod"/></strong></p>


</div></dsp:oparam>    		
</dsp:droplet>
        </div>
    </div>
</div>
</div>
<div class="order-items order-details">
        <script type="text/javascript">
    //<![CDATA[
    function giftMessageToogle(giftMessageIdentifier)
    {
        var link = $('order-item-gift-message-link-'+giftMessageIdentifier);
        var container = $('order-item-gift-message-'+giftMessageIdentifier);
        var row = $('order-item-row-'+giftMessageIdentifier);
        if(link.expanded) {
            link.expanded = false;
            link.removeClassName('expanded');
            if(container.hasClassName('last')) {
                row.addClassName('last');
            }
            container.hide();
        } else {
            link.expanded = true;
            link.addClassName('expanded');
            if(container.hasClassName('last')) {
                row.removeClassName('last');
            }
            container.show();
        }

        return false;
    }
    //]]>
    </script>
            <h2 class="table-caption">Items Ordered            </h2>

    
<table cellspacing="0" cellpadding="0" border="0" width="100%" class="data-table responsive">
    <thead>
        <tr>
            <th align="left" bgcolor="#EAEAEA" style="font-size:13px; padding:3px 9px">Product Name</th>
            <th align="left" bgcolor="#EAEAEA" style="font-size:13px; padding:3px 9px">Sku</th>
             <th align="left" bgcolor="#EAEAEA" style="font-size:13px; padding:3px 9px">Price</th>
            <th align="center" bgcolor="#EAEAEA" style="font-size:13px; padding:3px 9px">Qty</th>
            <th align="right" bgcolor="#EAEAEA" style="font-size:13px; padding:3px 9px">Subtotal</th>
        </tr>
    </thead>
				
				<dsp:droplet name="/atg/dynamo/droplet/ForEach">
			<dsp:param name="array" value="${commerceItem}"/>
				<dsp:setvalue param="currentItem" paramvalue="element" />
				<dsp:oparam name="output">
				
				<dsp:getvalueof var="currentItem" param="currentItem"/>

				<dsp:getvalueof var="product" value="${currentItem.auxiliaryData.productRef}" />
				<dsp:getvalueof var="sku" value="${currentItem.auxiliaryData.catalogRef}" />
				
				<dsp:getvalueof var="listPrice" vartype="java.lang.Double" param="currentItem.priceInfo.listPrice" />
				<dsp:getvalueof var="salePrice" vartype="java.lang.Double" param="currentItem.priceInfo.salePrice" />
				<dsp:getvalueof var="adjustment" vartype="java.lang.Double" param="currentItem.priceInfo.adjustments" />
				<dsp:getvalueof var="discount" value="${order.priceInfo.adjustments}"/>
				
            <tbody bgcolor="#F6F6F6">
        <tr class="border" id="order-item-row-69519">
    <td><h3 class="product-name">${product.displayName}</h3>
                <dl class="item-options">
                    <dt>color</dt>
                                            <dd>
                    cobalt blue                                    </dd>
                            </dl>
                                    
                            </td>
    <td>${product.childSKUs[0].id}</td>
    <td class="a-right">
                    <span class="price-excl-tax">
                                                    <span class="cart-price">
                
                                            <span class="price"><dsp:valueof value="${listPrice}"/></span>                    
                </span>


                            </span>
            <br>
                    </td>
    <td class="a-right">
        <span class="nobr">
                            Ordered: <strong><dsp:valueof param="currentItem.quantity" /></strong><br>
                                  <%--  Canceled: <strong>1</strong><br>--%>
                        </span>
    </td>
    <td class="a-right">
                    <span class="price-excl-tax">
                                                    <span class="cart-price">
                
                                            <span class="price"><dsp:valueof param="currentItem.priceInfo.amount" /></span>                    
                </span>

                            </span>
            <br>
                    </td>
                      </dsp:oparam>
</dsp:droplet>
    <!--
        <th class="a-right"><span class="price">$11.99</span></th>
            -->
</tr>
    </tbody>
            <tbody>
            </tbody>
    <tbody class="odd">
                <tr class="subtotal">
        <td colspan="4" class="a-right">
                        Subtotal                    </td>
        <td class="last a-right">
                        <span class="price">${order.priceInfo.rawSubtotal}</span>                    </td>
    </tr>
    
    <%------discount-------%>
     <tr class="discount">
        <td colspan="4" class="a-right">
                       Discount                 </td>
        <td class="last a-right">
                        <span class="price">
                      <c:forEach var="discount" items="${discount}">
  <c:choose>
   <c:when test="${discount.adjustmentDescription=='Order Discount'}">
    
  ${discount.totalAdjustment}
  
  </c:when>
  
   </c:choose>
   </c:forEach>
                        </span>                    </td>
    </tr>
    <%----end discount-----%>
            <tr class="shipping">
        <td colspan="4" class="a-right">
                        Shipping &amp; Handling                    </td>
        <td class="last a-right">
                        <span class="price">${order.priceInfo.shipping}</span>                    </td>
    </tr>
                
    

<tr>
    <td colspan="4" class="a-right">
                    <div class="summary-collapse">Tax</div>
            </td>
    <td class="last a-right"><span class="price"><dsp:valueof bean="ShoppingCart.current.priceInfo.tax" converter="currency">no price</dsp:valueof></span></td>
</tr>
              
            <tr class="grand_total">
        <td colspan="4" class="a-right">
                        <strong>Grand Total</strong>
                    </td>
        <td class="last a-right">
                        <strong><span class="price"><dsp:valueof converter="currency" value="${order.priceInfo.total}" /></span></strong>
                    </td>
    </tr>
        </tbody>
      
</table>



                <div class="buttons-set">
        <p class="back-link"><a href="/account/dwellMyOrders.jsp"><small>« </small>Back to My Orders</a></p>
    </div>
</div></div>        </div>



</dsp:oparam>
</dsp:droplet>
</dsp:page>