<%-- 
  This page lays out the elements that make up the PriceSlider.
    
  Required Parameters:
    contentItem
      The content parameter represents an unselected dimension refinement.
   
  Optional Parameters:

--%>

 <script>
 <%--
 function check()
 {
 alert("hello");
 };
 --%>
  priceSlider = {

 init : function() {
  10200
  var contentItemPricePropertyName = $("#contentItemPricePropertyName")
    .val();
  var selectedMinimum = $("#selectedMinimum").val();
  var selectedMaximum = $("#selectedMaximum").val();
  var sliderMinimum = $("#sliderMinimum").val();
  var sliderMaximum = $("#sliderMaximum").val();
  if (selectedMinimum == "") {
  alert("hello111");
   selectedMinimum = sliderMinimum;
  }
  if (selectedMaximum == "") {
   selectedMaximum = sliderMaximum;
  }
  var formattedMinimum = $("#formattedMinimum").val();
  var formattedMaximum = $("#formattedMaximum").val();
  var Nf = "";

  $("#slider-range").slider(
    {
     range : true,
     min : 0,
     max : sliderMaximum,//sliderMaximum
     values : [ selectedMinimum, selectedMaximum ],
     slide : function(event, ui) {
      $("#amount").val(
        "$" + ui.values[0] + " - $" + ui.values[1]);
     },
     stop : function(event, ui) {

      var uri = decodeURIComponent(window.location.href
        .replace(/\+/g, " "));

      if (uri.indexOf("?") == -1) {

       Nf = contentItemPricePropertyName + "|BTWN+"
         + ui.values[0] + "+" + ui.values[1];

       uri += "?Nf=" + Nf;

       window.location.href = uri;

      } else {

       var query = (document.location.search).replace(
         /(^\?)/, '').split("&").map(
         function(n) {
          return n = n.split("="),
            this[n[0]] = n[1], this
         }.bind({}))[0];

       query['Nf'] = contentItemPricePropertyName
         + "|BTWN+" + ui.values[0] + "+"
         + ui.values[1];
       ;

       uri = uri.substring(0, uri.indexOf("?"));

       uri += "?" + decodeURIComponent($.param(query));
       window.location.href = uri;

      }

     }
    });

  $("#amount").val(
    "$" + $("#slider-range").slider("values", 0) + " - $"
      + $("#slider-range").slider("values", 1));
 }
}
  </script>

<dsp:page>
 
  <dsp:getvalueof var="contextPath" vartype="java.lang.String"  value=""/>
  <dsp:importbean bean="/OriginatingRequest" var="originatingRequest"/>
  
  <dsp:getvalueof var="contentItem" vartype="com.endeca.infront.assembler.ContentItem" value="${originatingRequest.contentItem}"/> 
  ${contentItem}
  <%-- 
    The slider is a range filter not an Endeca dimension refinement so we need
    to use a custom method to determine if we should render the control.
  --%>
  <dsp:getvalueof var="enabled" value="${contentItem.enabled}"/>
  <c:if test="${enabled}">
  

    <dsp:include page="/global/gadgets/formattedPrice.jsp">
      <dsp:param name="price" value="${contentItem.sliderMin}"/>
      <dsp:param name="saveFormattedPrice" value="true"/>
    </dsp:include>
    <dsp:getvalueof var="minPrice" value="${formattedPrice}"/>

    <dsp:include page="/global/gadgets/formattedPrice.jsp">
      <dsp:param name="price" value="${contentItem.sliderMax}"/>
      <dsp:param name="saveFormattedPrice" value="true"/>
    </dsp:include>
    
    <dsp:getvalueof var="maxPrice" value="${formattedPrice}"/>
    
        
   <div id="mobile-facets" class="show-for-medium-up">
         
         <ul class="category-nav-landing small-mb16 nav-accordion">
   
         
             
 <%-- <c:out value="${contentItem.priceProperty}"></c:out> --%>
 <!-- Variables For Slider  -->

  <input type="hidden" id="contentItemPricePropertyName" value="${contentItem.priceProperty}">
  <input type="hidden" id="selectedMinimum" value="${contentItem.filterCrumb.lowerBound}">
  <input type="hidden" id="selectedMaximum" value="${contentItem.filterCrumb.upperBound}">
  <input type="hidden" id="sliderMinimum" value="${contentItem.sliderMin}">
  <input type="hidden" id="sliderMaximum" value="${contentItem.sliderMax}">
  <input type="hidden" id="formattedMinimum" value="${minPrice}">
  <input type="hidden" id="formattedMaximum" value="${maxPrice}">
  
  <%-- <c:out value="${minPrice}"></c:out> --%>
  
 <!-- End Of Variables -->

    
     <%-- <h5><fmt:message key="common.price"/></h5>--%>

      <input type="text" id="amount" readonly style="border:0; color:#f6931f; font-weight:bold;">
            

      <div id="slider-range"></div>
   </ul>
         </div>
 
  </c:if>
<%--<input type="button" onclick="check()" value="click"/>--%>
</dsp:page>

<%-- @version $Id: //hosting-blueprint/B2CBlueprint/version/11.0/Storefront/j2ee/store.war/cartridges/PriceSlider/PriceSlider.jsp#1 $$Change: 848678 $--%>