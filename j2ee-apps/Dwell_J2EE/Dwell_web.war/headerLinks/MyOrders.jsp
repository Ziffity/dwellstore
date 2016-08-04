<dsp:page>
<dsp:include page="/includes/header.jsp"/>
 
<h2>Order Information</h2>
<table style="width: 400px" border="1" align="center">
       <tr>
       <th>OrderId</th>
       <th>CreationDate</th>
       <th>SubmittedDate</th>
       <th>Status</th>
       </tr>
<dsp:droplet name="/atg/commerce/order/OrderLookup">
 <dsp:param bean="/atg/userprofiling/Profile.repositoryId" name="userId"/>
 <dsp:param value="open" name="state"/>
 <dsp:oparam name="output">
    <dsp:droplet name="/atg/dynamo/droplet/ForEach">
       <dsp:param param="result" name="array"/>
       <dsp:oparam name="outputStart">
          <OL>
       </dsp:oparam>
       <dsp:oparam name="output">
       
       <tr>
         
        <td>  <dsp:a href="MyOrderDetails.jsp">
         <dsp:param name="orderId" param="element.id" />
           <dsp:valueof param="element.id"/></dsp:a></td>
           <td><dsp:valueof param="element.creationDate"/></td>
           <td><dsp:valueof param="element.submittedDate"/></td>
           <td><dsp:valueof param="element.stateAsString"/></td>
           </tr>
      

       </dsp:oparam>
       <dsp:oparam name="outputEnd">
          </OL>
       </dsp:oparam>
       <dsp:oparam name="empty">
          No open orders.
       </dsp:oparam>
    </dsp:droplet>
 </dsp:oparam>
 <dsp:oparam name="error">
    <span class=profilebig>ERROR:
       <dsp:valueof param="errorMsg">no error message</dsp:valueof>
    </span>
 </dsp:oparam>
</dsp:droplet>
</table>
</dsp:page>
