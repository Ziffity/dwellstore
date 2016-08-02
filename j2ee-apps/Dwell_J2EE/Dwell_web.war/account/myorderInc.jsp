<%@ page isELIgnored="false" %>
<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_1" %>
<dsp:page>
<link rel="stylesheet" href="/css/styles.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="/css/screen.css" type="text/css" media="screen" title="no title" charset="utf-8" />

 <dsp:importbean bean="/atg/commerce/order/OrderLookup"/>
  <dsp:importbean bean="/atg/userprofiling/Profile"/>
  <dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
  <dsp:importbean bean="/atg/commerce/order/OrderStatesDetailed"/>


	 <dsp:droplet name="OrderLookup">
          <dsp:param name="userId" bean="Profile.id"/>
          <dsp:param name="sortBy" value="submittedDate"/>
          <dsp:param name="state" value="open"/>
          <dsp:param name="numOrders" value="5"/>      
      
          <dsp:oparam name="output">

<div class="col-main">
                <div class="my-account"><div class="page-title">
    <h1>My Orders</h1>
</div>

        <div class="pager">
    
        <p class="amount">
                    <strong>4 Item(s)</strong>
            </p>
    
        
        </div>
    
<table class="data-table responsive" id="my-orders-table">
    <colgroup><col width="1">
    <col width="1">
    <col>
    <col width="1">
    <col width="1">
    <col width="1">
    </colgroup><thead>
        <tr class="first last">
            <th>Order #</th>
            <th>Date</th>
            <th>Ship To</th>
            <th><span class="nobr">Order Total</span></th>
            <th><span class="nobr">Order Status</span></th>
            <th>&nbsp;</th>
        </tr>
    </thead>
    <tbody>
    
    	  <dsp:droplet name="ForEach">
              <dsp:param name="array" param="result"/>
              <dsp:oparam name="output">
              
                        <tr>
            <td><dsp:valueof param="element.id" /></td>
            <td><span class="nobr"><dsp:valueof date="M/dd/yyyy" param="element.submittedDate"/></span></td>
            
            <td><dsp:valueof bean="Profile.derivedShippingAddress.firstName" /></td>
            <td><span class="price"><dsp:valueof param="element.priceInfo.total"/></span></td>
            <td><em><dsp:droplet name="OrderStatesDetailed">
         	  <dsp:param name="state" param="element.state"/>
         	   <dsp:param name="elementName" value="orderStateDescription"/>
         	  <dsp:oparam name="output">
      			<dsp:valueof param="orderStateDescription" />
      		   </dsp:oparam>
      		  </dsp:droplet> </em></td>
            <td class="a-center last">
                <dsp:a href="/account/dwellOrderDetails.jsp">
             <dsp:param name="order_id" param="element.id" />
                <span class="nobr">View Order</span>
                </dsp:a>
                                                        
            </td>
        </tr>
           </dsp:oparam>
          </dsp:droplet>
        
          
            </tbody>
</table>
	<script type="text/javascript">decorateTable('my-orders-table');</script>

        
    
<div class="buttons-set">
    
</div></div>            </div>

</dsp:oparam>
</dsp:droplet> 

</dsp:page>