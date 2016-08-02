<dsp:page>
<div class="cart">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<dsp:importbean bean="/atg/commerce/ShoppingCart"/>
<dsp:importbean bean="/OriginatingRequest" var="originatingRequest"/>
<dsp:importbean bean="/atg/commerce/order/purchase/CartModifierFormHandler"/>
<dsp:importbean bean="/atg/commerce/promotion/CouponFormHandler"/>

 <dsp:form action="cartItems.jsp">
 
 <h2>View Cart</h2>
<fieldset>
<table id="shopping-cart-table" class="data-table cart-table" >
<thead>
<tr class="first last">
<th width="1" rowspan="1">Delete</th>
<th rowspan="1"> </th>
<th rowspan="1"><span class="nobr">Product Name</span></th>
<th class="a-center" colspan="1"><span class="nobr">Item Price</span></th>
<th class="a-center" rowspan="1">Quantity</th>
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
<dsp:getvalueof var="productId" param="productId"/>

<dsp:setvalue param="currentItem" paramvalue="element" />
<dsp:oparam name="output">

<dsp:getvalueof var="currentItem" param="currentItem"/>
<dsp:getvalueof var="product" value="${currentItem.auxiliaryData.productRef}" />
<dsp:getvalueof var="sku" value="${currentItem.auxiliaryData.catalogRef}" />
<dsp:getvalueof var="listPrice" vartype="java.lang.Double" param="currentItem.priceInfo.listPrice" />
<dsp:getvalueof var="salePrice" vartype="java.lang.Double" param="currentItem.priceInfo.salePrice" />
<dsp:getvalueof var="quantity" vartype="java.lang.Double" param="currentItem.quantity" />
<dsp:getvalueof var="amount" vartype="java.lang.Double" param="currentItem.priceInfo.amount" />
<dsp:getvalueof var="adjustment" vartype="java.lang.Double" param="currentItem.priceInfo.adjustments" />
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
<c:choose>
 <c:when test="${salePrice>0}">
 <del> <dsp:valueof converter="currency" value="${listPrice}" /></del>
<span class="price"><dsp:valueof value="Rs ${salePrice}"/></span>
</c:when>
<c:otherwise>
<span class="price"><dsp:valueof value="${listPrice}"/></span>
</c:otherwise>
</c:choose>
<span>

<td class="a-left"><input name='<dsp:valueof value='${sku.id}' />' size="4" value="${quantity}" type="text"/></td>
<td class="a-right last"><span class="cart-price"><span class="price"><dsp:valueof value="Rs ${amount}"/></span></span></td>

  
   	<dsp:input bean="CartModifierFormHandler.setOrderSuccessURL" type="hidden" value="/cart/Cart.jsp"/>
   <dsp:input bean="CartModifierFormHandler.setOrder" type="submit" value="Update"/>
   	<dsp:input bean="CartModifierFormHandler.removeItemFromOrderSuccessURL" type="hidden" value="/cart/Cart.jsp"/>
</td>
</tr>
</dsp:oparam>
</dsp:droplet>
</tbody>
</table>
</fieldset>
<dsp:getvalueof var="order" bean="ShoppingCart.current" />
<div class="cart-collaterals">
<div class="col2-set"></div>
<div class="estimate-shipping">

<dsp:include page="/checkout/gadgets/estimateShipping.jsp" />
<%@ include file="shippingMethods.jspf" %>
</div>
<div class="totals">
<div class="discount">
<fieldset>
<label for="coupon_code">Enter a promotional code.</label>
<div class="v-fix"><dsp:input bean="CouponFormHandler.couponClaimCode" type="text" id="coupon_code" class="input-text" /></div>
<dsp:input bean="CouponFormHandler.claimCoupon" class="input-coupon" type="submit" value="Apply Promo Code" />
</fieldset>
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
<span class="price"><dsp:valueof value="${order.priceInfo.amount}"  converter="currency"/></span>
</strong>
</td>
</tr>
</tfoot>
<tbody>
<tr>
<td class="a-left" colspan="1" style=""> Merchandise Total </td>
<td class="a-right" style="">
<span class="price"><dsp:valueof value="${order.priceInfo.rawSubtotal}"  converter="currency"/></span>
</td>
</tr>
<tr>
<td class="a-left" colspan="1" style=""> Discount </td>
<td class="a-right" style="">
<span class="price"><dsp:valueof value="${order.priceInfo.discountAmount}"  converter="currency"/></span>
</td>
</tr>
<tr>
<td class="a-left" colspan="1" style=""> Shipping </td>
<td class="a-right" style="">
<dsp:getvalueof var="price" bean="ShippingInformationDataHolder.price" />
<span class="price">${price}</span>
</td>
</tr>
<tr class="summary-total show-details">
<td class="a-left" colspan="1" style="">
<div class="summary-collapse" style="background:none">Tax </div>
</td>
<td class="a-right" style="">
<span class="price"><dsp:valueof bean="ShoppingCart.current.priceInfo.tax"
         converter="currency">no price</dsp:valueof></span>
</td>
</tr>
</tbody>
</table>
<ul class="checkout-types">
<li>
<div class="continue_shopping">
<input type="button" onclick="location.href='/index.jsp'" value="Continue Shopping" />
</div>
<dsp:input bean="CartModifierFormHandler.moveToPurchaseInfoByRelId" type="submit" value="Check Out"/>
<dsp:input bean="CartModifierFormHandler.moveToPurchaseInfoByRelIdSuccessURL" type="hidden" value="/checkout/shipping.jsp?init=true"/>
<dsp:input bean="CartModifierFormHandler.moveToPurchaseInfoByRelIdErrorURL" type="hidden" value="/checkout/cart.jsp"/>
</li>
</ul>
</div>
</div>
</div>
</dsp:form>
</dsp:page>