<dsp:page>
<div class="cart">
<dsp:importbean bean="/atg/endeca/assembler/droplet/InvokeAssembler"/>
<dsp:importbean bean="/atg/commerce/order/purchase/CartModifierFormHandler" />
<dsp:importbean bean="/OriginatingRequest" var="originatingRequest"/>
<dsp:importbean bean="/atg/commerce/ShoppingCart"/>
<dsp:importbean bean="/atg/dynamo/droplet/IsEmpty" />
<dsp:importbean bean="/dwell/shipping/ShippingInformationDataHolder" />
 <dsp:importbean bean="/atg/commerce/promotion/CouponFormHandler"/>
 <dsp:importbean bean="/atg/commerce/promotion/CouponDroplet"/>
<dsp:importbean bean="atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach" />
<dsp:getvalueof var="shippingMethods" bean="ShippingInformationDataHolder.estimatedShippingMethods" />
<dsp:getvalueof var="price" bean="ShippingInformationDataHolder.price" />

<dsp:droplet name="InvokeAssembler">
    <dsp:param name="contentCollection" value="/content/Shared/Header"/>
    <dsp:oparam name="output">
      <dsp:getvalueof var="headerContent" vartype="com.endeca.infront.assembler.ContentItem" param="contentItem" />
     
    </dsp:oparam>
    <dsp:oparam name="error">
    	Error Loading Page
    </dsp:oparam>
 </dsp:droplet>

<dsp:form>
<fieldset>
<table id="shopping-cart-table" class="data-table cart-table" >
<thead>
<tr class="first last">
<th width="1" rowspan="1">Delete</th>
<th rowspan="1"> </th>
<th rowspan="1"><span class="nobr">Product Name</span></th>
<th class="a-center" colspan="1"><span class="nobr">Item Price</span></th>
<th class="a-center" rowspan="1">Quantity</th>
<th class="a-center" rowspan="1">Discount</th>
<th class="a-center" width="150px" colspan="1">Total</th>
</tr>
</thead>
<tfoot>
<tr class="first last">
<td class="a-right last" colspan="50">
<dsp:input bean="CartModifierFormHandler.setOrder" class="input-button" type="submit"
value="Update Shopping Cart"/>
</td>
</tr>
</tfoot>
<dsp:droplet name="/atg/dynamo/droplet/ForEach">
<dsp:param name="array" param="commerceItems"/>
<dsp:setvalue param="currentItem" paramvalue="element" />
<dsp:oparam name="output">
<dsp:getvalueof var="currentItem" param="currentItem"/>
<dsp:getvalueof var="product" value="${currentItem.auxiliaryData.productRef}" />
<dsp:getvalueof var="sku" value="${currentItem.auxiliaryData.catalogRef}" />
<tbody>
<tr class="first odd">

<td class="a-center" width="1"> 
<dsp:getvalueof id="skuId" param="CommerceItem.catalogRefId">
      <dsp:input type="checkbox" bean=
         "CartModifierFormHandler.removalCatalogRefIds" value="${currentItem.catalogRefId}"/>
   </dsp:getvalueof>
</td>
<td></td>
<td><h2 class="product-name">${product.displayName}</h2></td>
<td class="a-center">
<span class="cart-price">
<dsp:getvalueof var="listPrice" vartype="java.lang.Double" param="currentItem.priceInfo.listPrice" />
<dsp:getvalueof var="salePrice" vartype="java.lang.Double" param="currentItem.priceInfo.salePrice" />
<dsp:getvalueof var="discount" vartype="java.lang.Double" param="currentItem.priceInfo.adjustments" />

 <c:choose>
 <c:when test="${salePrice gt 0}">
  <del><dsp:valueof value="${listPrice}"/></del>
  <span class="price"><dsp:valueof value="${salePrice}"/></span>
 </c:when>
 <c:otherwise>
  <span class="price"><dsp:valueof value="${listPrice}"/></span>
 </c:otherwise>
 </c:choose>
 </span>
</td>
<td class="a-left">
 <input name="<dsp:valueof value='${sku.id}' />" size="3" type="text" value="${currentItem.quantity}" /></td>
</td>
<td>
<c:forEach var="discount" items="${discount}">
  <c:choose>
   <c:when test="${discount.adjustmentDescription=='Item Discount'}">
    
  ${discount.totalAdjustment}
  
  </c:when>
  
   </c:choose>
   </c:forEach>
</td>
<td class="a-right last">
<span class="cart-price">
<span class="price"><dsp:valueof param="currentItem.priceInfo.amount" /></span>
</span>
   
</td>
</tr>

<%--
GoTo this URL if user pushes RECALCULATE button and there are no errors:
--%>
<dsp:input bean="CartModifierFormHandler.setOrderSuccessURL" type="hidden"
   value="/checkout/cart.jsp"/>

<%--
GoTo this URL if user pushes RECALCULATE button and there are errors:
--%>
<dsp:input bean="CartModifierFormHandler.setOrderErrorURL" type="hidden"
   value="/checkout/cart.jsp"/>

<%-- CHECKOUT Order button: --%>
&nbsp; &nbsp;   

<dsp:input bean="CartModifierFormHandler.moveToPurchaseInfoSuccessURL"
   type="hidden" value="/checkout/shipping.jsp"/> <%-- move on to shipping --%>
</tr>
</dsp:oparam>
<dsp:oparam name="empty">
  Shopping Cart Is Empty
</dsp:oparam>
</dsp:droplet>
</tbody>
</table>
</fieldset>
<div class="cart-collaterals">
<div class="col2-set"></div>
<div class="estimate-shipping">

	<dsp:include page="/checkout/gadgets/estimateShipping.jsp" />
	<%@ include file="shippingMethods.jspf" %>
</div>
<div class="totals">
<div class="discount">
<dsp:include page="/checkout/coupon.jsp" />
</div>
<table id="shopping-cart-totals-table">
<colgroup>
<col>
<col width="1">
</colgroup>
<tfoot>
<tr>
<td class="a-left" colspan="1" style="">
<strong>Order Total</strong>
</td>
<td class="a-right" style="">
<strong>
<span class="price"><dsp:valueof bean="ShoppingCart.current.priceInfo.total"
         converter="currency">no price</dsp:valueof></span>
</strong>
</td>
</tr>
</tfoot>
<tbody>

<tr>
<td class="a-left" colspan="1" style=""> Sub Total </td>
<td class="a-right" style="">
<span class="price"><dsp:valueof
         bean="ShoppingCart.current.priceInfo.rawSubtotal"
         converter="currency">no price</dsp:valueof></span>
</td>
</tr>

<%-----discount-----%>
<tr>
<td class="a-left" colspan="1" style=""> Discount </td>
<td class="a-right" style="">
<span class="price">
<dsp:getvalueof var="orders" bean="ShoppingCart.current" />
<dsp:valueof value="${orders.priceInfo.discountAmount}"  converter="currency">no price</dsp:valueof></span>
</td>
</tr>

<%----end discount------%>

<tr>
<td class="a-left" colspan="1" style=""> Merchandise Total </td>
<td class="a-right" style="">
<span class="price"><dsp:valueof
         bean="ShoppingCart.current.priceInfo.amount"
         converter="currency">no price</dsp:valueof></span>
</td>
</tr>
<tr>
<td class="a-left" colspan="1" style=""> Shipping </td>
<td class="a-right" style="">

<c:choose>
<c:when test="${not empty price}">
<span class="price">${price}</span>

</c:when>
<c:otherwise>
<span class="price">
<dsp:valueof
         bean="ShoppingCart.current.priceInfo.shipping"
         converter="currency">no price</dsp:valueof></span>
</c:otherwise>
</c:choose>
</td>
</tr>
<tr class="summary-total show-details">

<td class="a-left" colspan="1" style="">
<div style="background:none">Tax </div> </td>

<td class="a-right" style="">
<span class="price">
<dsp:valueof bean="ShoppingCart.current.priceInfo.tax" converter="currency">no price</dsp:valueof>
</span>
</td>

</tr>
</tbody>
</table>
<ul class="checkout-types">
<li>
<div class="continue_shopping">
<a class="continue-shopping" title="Continue Shopping" href="/">Continue Shopping</a>
</div>
<dsp:input bean="CartModifierFormHandler.moveToPurchaseInfo" type="submit" class="input-button" value="Checkout"/>

</li>
</ul>
</div>
</div>
</div>
 Coupon code: <dsp:input bean="CouponFormHandler.couponClaimCode" type="text"/>

  <dsp:input bean="CouponFormHandler.claimCoupon" type="submit" class="input-button" value="Claim it"/>
</dsp:form>


<%-- Showing Coupon Applied --%>

<dsp:droplet name="ForEach">
      <dsp:param name="array" bean="Profile.activePromotions"/>
      <dsp:oparam name="output">

&nbsp;**Applied Promo Coupon:&nbsp;<b><dsp:valueof param="element.promotion.displayName"/>
</b>
 </dsp:oparam>
 
 <dsp:oparam name="empty">
<b>No Coupons Applied...</b>
 </dsp:oparam>
 
 </dsp:droplet>

</center>

<br><br><br>


<script>
 function submitCoupon() 
 {
   document.getElementById("applyCoupon").click();
 };
</script>
</dsp:page>