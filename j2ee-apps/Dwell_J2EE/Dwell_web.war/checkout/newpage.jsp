<dsp:page>

<dsp:importbean bean="atg/commerce/order/purchase/ExpressCheckoutFormHandler" />


<dsp:form method="post">
		
			<dsp:input bean="ExpressCheckoutFormHandler.commitOrder" type="hidden" value="true"/>
			
		<input bean="ExpressCheckoutFormHandler.expressCheckout" type="submit" value="Place an Order"/>
		
 <dsp:input bean="ExpressCheckoutFormHandler.expressCheckoutSuccessURL" type="hidden" value="/checkout/orderSuccess.jsp"/>
 <dsp:input bean="ExpressCheckoutFormHandler.expressCheckoutErrorURL" type="hidden" value="/checkout/orderConfirmation.jsp"/>
		
		</dsp:form>

</dsp:page>