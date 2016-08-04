<%--
  Renders a search box which allows the user to query for search results.
  Provides checkboxes to allow user to search across sites (where applicable)
  and also supports auto auggest (provides a list of possible matches as
  the user types)

  Required parameters:
    contentItem
      The "Search Box" content item
    
  Optional parameters:
    None.
--%>
<dsp:page>
  <dsp:importbean bean="/OriginatingRequest" var="originatingRequest"/>
  <dsp:importbean bean="/atg/dynamo/droplet/multisite/CartSharingSitesDroplet" />
  <dsp:importbean bean="/atg/dynamo/droplet/ForEach" />
  <dsp:importbean bean="/atg/multisite/Site" var="currentSite"/>
  <dsp:importbean bean="/atg/endeca/assembler/SearchFormHandler"/>
  <dsp:importbean bean="/atg/endeca/assembler/cartridge/manager/DefaultActionPathProvider"/>

<c:set var="javascriptRoot" value="/javascript"/>
 <script type="text/javascript" src="${javascriptRoot}/widget/AutoSuggest2.js"></script>  
 <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/css/styles.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="/css/screen.css" type="text/css" media="screen" title="no title" charset="utf-8" />

  <dsp:getvalueof var="contentItem" vartype="com.endeca.infront.assembler.ContentItem" value="${originatingRequest.contentItem}"/> 
  <dsp:getvalueof var="contextPath" vartype="java.lang.String" value="${originatingRequest.contextPath}"/>
  <dsp:getvalueof var="actionPath" bean="DefaultActionPathProvider.defaultExperienceManagerNavigationActionPath"/>

  <fmt:message var="hintText" key="common.search.input"/>
  <fmt:message var="submitText" key="search_simpleSearch.submit"/>
  
  <div id="atg_store_search">
    
    <%-- The search form --%>
    <dsp:form action="${contextPath}${actionPath}" id="searchForm" requiresSessionConfirmation="false">
      <input type="hidden" name="Dy" value="1"/>
      <input type="hidden" name="Nty" value="1"/>
      <dsp:input bean="SearchFormHandler.siteScope" type="hidden" value="ok" name="siteScope"/>

      <%--
        The autocomplete attribute specifies whether or not an input field 
        should have autocomplete enabled. Autocomplete allows the browser to 
        display a list of options to fill in the field, based on earlier typed values.
        Turn off browser autocomplete when auto suggest is enabled so that only one
        list of options is displayed to the user.
      --%>
       
      Search:
      <dsp:input class="text atg_store_searchInput" bean="SearchFormHandler.intxt" name="Ntt" value=" " type="text" 
         onkeypress="myFunction()" title="${hintText}" autocomplete="off"/>
     
      <span class="atg_store_smallButton">
      <dsp:input bean="SearchFormHandler.successURL" type="hidden" value="cartridges/DwellProductsListPage/DwellProductsListPage.jsp"/>
        <dsp:input type="submit" bean="SearchFormHandler.search" class="input-submit" name="search" 
          value="Submit" id="atg_store_searchSubmit" title="${submitText}"/>
       
      </span>
      
  
      
    </dsp:form> 
  
  </div>
  
</dsp:page>
<%-- @version $Id: //hosting-blueprint/B2CBlueprint/version/11.2/Storefront/j2ee/store.war/cartridges/SearchBox/SearchBox.jsp#1 $$Change: 946917 $--%>