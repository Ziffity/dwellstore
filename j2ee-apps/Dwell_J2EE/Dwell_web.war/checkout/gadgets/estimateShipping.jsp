<dsp:importbean
  bean="/atg/commerce/order/purchase/CartModifierFormHandler" />
<dsp:importbean bean="/dwell/shipping/ShippingInformationDataHolder" />
<dsp:importbean bean="/atg/dynamo/droplet/ForEach" />
<div class="heading-4">
	<label for="estimate_shipping">Estimate shipping</label>
</div>
<div class="controls est_input">
 <dsp:getvalueof var="postalCode"
  bean="ShippingInformationDataHolder.postalCode" />
 <dsp:input id="estimate_shipping" name="postalCode"
  bean="CartModifierFormHandler.zipcode" class="text" placeholder="Enter Zip/Postal Code" type="text"/>
<dsp:input type="hidden"
 bean="CartModifierFormHandler.successURL"
 value="/checkout/cart.jsp" />
<dsp:input type="hidden"
 bean="CartModifierFormHandler.ErrorURL"
 value="/checkout/cart.jsp" />
<dsp:input id="calculateShippingCharge" class="input-estimate_shipping"
 type="submit" bean="CartModifierFormHandler.estimate"
 value="Update" />
 <div id="cartZipErr" class="error" style="display: none"></div>
</div>
