<dsp:page>
 
<dsp:importbean bean="/atg/commerce/order/purchase/CreateCreditCardFormHandler"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>

<hr><p>
<br>
<h1>Enter new CreditCard information
</h1><br>
<dsp:form action="billing.jsp" method="post">
<table>
<tr><td>
CreditCard NickName </td> <td>:<dsp:input
bean="CreateCreditCardFormHandler.creditCardName" type="text"
value=""/></td>
</tr>
<tr><td>
CreditCardNumber </td> <td>:<dsp:input
bean="CreateCreditCardFormHandler.creditCard.creditCardNumber"
maxsize="20" size="20" type="text" value="4111111111111111"/>
</td>
</tr>
<tr><td>CreditCardType </td><td>
:<dsp:select bean="CreateCreditCardFormHandler.creditCard.creditCardType"
required="<%=true%>">
<dsp:option value="Visa">Visa</dsp:option>
<dsp:option value="MasterCard">Master Card</dsp:option>
<dsp:option value="American Express">American Express</dsp:option>
</dsp:select>
</td></tr>

<tr><td>
Expiration Details </td> <td>:<dsp:select 
bean="CreateCreditCardFormHandler.creditCard.expirationMonth">
<dsp:option value="1">January</dsp:option>
<dsp:option value="2">February</dsp:option>
<dsp:option value="3">March</dsp:option>
<dsp:option value="4">April</dsp:option>
<dsp:option value="5">May</dsp:option>
<dsp:option value="6">June</dsp:option>
<dsp:option value="7">July</dsp:option>
<dsp:option value="8">August</dsp:option>
<dsp:option value="9">September</dsp:option>
<dsp:option value="10">October</dsp:option>
<dsp:option value="11">November</dsp:option>
<dsp:option value="12">December</dsp:option>
</dsp:select>

<dsp:select bean="CreateCreditCardFormHandler.creditCard.expirationYear">
<dsp:option value="2017">2017</dsp:option>
<dsp:option value="2018">2018</dsp:option>
<dsp:option value="2019">2019</dsp:option>
<dsp:option value="2020">2020</dsp:option>
<dsp:option value="2021">2021</dsp:option>
<dsp:option value="2022">2022</dsp:option>
<dsp:option value="2023">2023</dsp:option>
<dsp:option value="2024">2024</dsp:option>
<dsp:option value="2025">2025</dsp:option>
</dsp:select>
</td></tr>
<tr><td>
First Name: </td><td><dsp:input
bean="CreateCreditCardFormHandler.creditCard.billingAddress.firstName"
beanvalue="Profile.firstName" size="30" type="text"/>
</td></tr>
<tr><td>
Last Name: </td><td><dsp:input
bean="CreateCreditCardFormHandler.creditCard.billingAddress.lastName"
beanvalue="Profile.lastName" size="30" type="text"/>
</td></tr>
<tr><td>
Address: </td><td><dsp:input
bean="CreateCreditCardFormHandler.creditCard.billingAddress.address1"
beanvalue="Profile.billingAddress.address1" size="30" type="text"/>
</td></tr>
<tr><td>
City: </td><td><dsp:input
bean="CreateCreditCardFormHandler.creditCard.billingAddress.city"
beanvalue="Profile.billingAddress.city" size="30" type="text"/>
</td></tr>
<tr><td>
State: </td><td><dsp:input
bean="CreateCreditCardFormHandler.creditCard.billingAddress.state"
beanvalue="Profile.billingAddress.state" size="30" type="text"/>
</td></tr>
<tr><td>
Postal code: </td><td><dsp:input
bean="CreateCreditCardFormHandler.creditCard.billingAddress.postalCode"
beanvalue="Profile.billingAddress.postalCode" size="30" type="text"/>
</td></tr>
<tr><td>
Country: </td><td><dsp:input
bean="CreateCreditCardFormHandler.creditCard.billingAddress.country"
beanvalue="Profile.billingAddress.country" size="30" type="text"/>
</td></tr>

</table>
<dsp:input bean="CreateCreditCardFormHandler.newCreditCardSuccessURL"
type="hidden" value="/checkout/billing.jsp?init=false"/>
<dsp:input bean="CreateCreditCardFormHandler.newCreditCardErrorURL"
type="hidden" value="/checkout/billing.jsp"/>
<dsp:input bean="CreateCreditCardFormHandler.newCreditCard" class="input-submit" type="submit"
value="Update Credit Card"/>

</dsp:form>

</dsp:page>