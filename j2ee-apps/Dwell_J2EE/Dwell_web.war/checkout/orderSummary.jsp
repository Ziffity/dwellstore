<dsp:page>
<link rel="stylesheet" href="/css/styles.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="/css/screen.css" type="text/css" media="screen" title="no title" charset="utf-8" />

<dsp:importbean bean="/atg/commerce/ShoppingCart"/>
<dsp:importbean bean="/atg/commerce/order/OrderLookup"/>
<dsp:importbean bean="/atg/commerce/order/purchase/CartModifierFormHandler" />
<style>
 tab { padding-left: 4em; }
 #section {
     background-color:#eeeeee;
}
</style>
<div id="section">
<b>ORDER SUMMARY</b>	
</div>	
<br>
<fieldset>
<table id="shopping-cart-table" class="data-table cart-table" >
<thead>
<tr class="first last">

<th rowspan="1"><span class="nobr">Product Name</span></th>
<th class="a-center" colspan="1"><span class="nobr">Item Price</span></th>
<th class="a-center" rowspan="1">Discount</th>
<th class="a-center" rowspan="1">Quantity</th>
<th class="a-center" width="150px" colspan="1">Total</th>
</tr>
</thead>

<dsp:getvalueof var="orderId" bean="ShoppingCart.current.id" />
<dsp:form>
<dsp:droplet name="/atg/dynamo/droplet/ForEach">
<dsp:param name="array" param="commerceItems"/>
<dsp:setvalue param="currentItem" paramvalue="element" />
<dsp:oparam name="output">

<dsp:getvalueof var="currentItem" param="currentItem"/>
<dsp:getvalueof var="product" value="${currentItem.auxiliaryData.productRef}" />

<tbody>
<tr class="first odd">

<td><h2 class="product-name">${product.displayName}</h2></td>
<td class="a-center">
<span class="cart-price">
<dsp:getvalueof var="listPrice" vartype="java.lang.Double" param="currentItem.priceInfo.listPrice" />
<dsp:getvalueof var="salePrice" vartype="java.lang.Double" param="currentItem.priceInfo.salePrice" />
<dsp:getvalueof var="discPrice" vartype="java.lang.Double" param="currentItem.priceInfo.adjustments" />


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
<td class="a-center">
<c:forEach var="discount" items="${discPrice}">
   
  <c:choose>
   <c:when test="${discount.adjustmentDescription=='Item Discount'}">
    <span class="price">
  ${discount.totalAdjustment}
   </span>
  </c:when>
 </c:choose>
</c:forEach>
</td>
<td class="a-left">
<%--<input type="text" size="2" name="<dsp:valueof param='currentItem.catalogRefId'/>" value="<dsp:valueof param='currentItem.quantity'/>">--%>
<dsp:valueof param='currentItem.quantity'/>
</td>
<td class="a-right last">
<span class="cart-price">
<span class="price"><dsp:valueof param="currentItem.priceInfo.amount" /></span>
</span>
</td>
</tr>
</tbody>
</dsp:oparam>
</dsp:droplet>

</table>
</fieldset>

        
<div class="cart-collaterals" style="float:none; height:160px;">
<div class="col2-set"></div>
<div class="estimate-shipping">

</div>
<div class="totals" style="float:right; width:160px;">

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
<%--
<tr class="first last">
<td class="a-right last" colspan="50">
<dsp:input bean="CartModifierFormHandler.setOrder" class="input-button" type="submit"
value="Update Shopping Cart"/>
</td>
</tr>
--%>
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
<dsp:valueof bean="ShoppingCart.current.priceInfo.tax"
         converter="currency">no price</dsp:valueof>
</span>
</td>

</tr>
</tbody>
</table>
</div>
</div>
</dsp:form>
</dsp:page>