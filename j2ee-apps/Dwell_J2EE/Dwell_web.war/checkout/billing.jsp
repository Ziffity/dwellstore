<dsp:page>
<link rel="stylesheet" href="/css/styles.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="/css/screen.css" type="text/css" media="screen" title="no title" charset="utf-8" />

<dsp:importbean bean="/atg/commerce/order/purchase/PaymentGroupFormHandler"/>
<dsp:importbean bean="/atg/commerce/order/purchase/CreateCreditCardFormHandler"/>

<dsp:importbean bean="/atg/commerce/order/purchase/PaymentGroupDroplet"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/commerce/ShoppingCart"/>
<dsp:importbean bean="/atg/commerce/order/purchase/RepriceOrderDroplet"/>

<link rel="stylesheet" href="/css/styles.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="/css/screen.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<dsp:include page="/includes/header.jsp" />


<dsp:getvalueof var="order" bean="ShoppingCart.current" />


<!-- ${currentItem.shippingGroups} -->


<dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
        <dsp:oparam name="output">
        <b><dsp:valueof param="message"/></b><br>
        </dsp:oparam>
        <dsp:oparam name="outputStart">
        <LI>
        </dsp:oparam>
        <dsp:oparam name="outputEnd">
        </LI>
        </dsp:oparam>
        </dsp:droplet>
        
      
   		<dsp:droplet name="PaymentGroupDroplet">
   		<dsp:param name="clear" value="true"/>
 		<dsp:param name="paymentGroupTypes" value="creditCard"/>
        <dsp:param name="initOrderPayment" value="true"/>
       	<dsp:param name="initPaymentGroups" value="true"/>
       	
     	
       			<dsp:oparam name="output">
       			<dsp:setvalue bean="PaymentGroupFormHandler.listId" value="${order.id}"/>
                	
       			</br>
       				<!--	PAYMENT GROUP:<dsp:valueof param="paymentGroups" /> -->
 	 					<dsp:droplet name="ForEach">
                   		<dsp:param name="array" param="paymentGroups" />
               			
                     	<dsp:oparam name="output"></br>
                     	</br>
                     
                     	<!-- Payment Method: <dsp:valueof param="element.paymentMethod"/> -->
                		<dsp:form>
                		<center>
                		<table>
                	
                     <tr><td> Card Type </td><td> :<dsp:valueof  param="element.creditCardType"/></td></tr>
                     <tr><td>Card Number </td><td>:<dsp:valueof param="element.creditCardNumber" converter="creditcard" /></td></tr>
             		 
             		 </table></center>
<dsp:input bean="PaymentGroupFormHandler.listId" beanvalue="PaymentGroupFormHandler.listId" priority="9" type="hidden"/>
       	                 
<dsp:input bean="PaymentGroupFormHandler.currentList[0].paymentMethod" type="hidden" paramvalue="key" />
 
 <!-- <dsp:valueof param="key"/> -->
 <dsp:input bean="PaymentGroupFormHandler.applyDefaultPaymentGroup" type="hidden" value="true"/>
<dsp:input bean="PaymentGroupFormHandler.applyPaymentGroupsSuccessURL" type="hidden" value="/checkout/orderConfirmation.jsp?init=true" />
<dsp:input bean="PaymentGroupFormHandler.applyPaymentGroupsErrorURL" type="hidden" value="/checkout/billing.jsp" /> </br>
<dsp:input type="submit" bean="PaymentGroupFormHandler.applyPaymentGroups" class="input-submit" value="confirm" /> 
 	 
 </dsp:form>
                  		</dsp:oparam>
                  		</dsp:droplet>
       			</dsp:oparam>
       	</dsp:droplet>
       	<br>
 		
<center><dsp:include page="NewCreditCard.jsp" />
</center>
<br>

<dsp:include page="/includes/footerNew.jsp" />
</dsp:page>