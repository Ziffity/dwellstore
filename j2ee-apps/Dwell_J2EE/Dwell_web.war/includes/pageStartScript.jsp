<%--
  Include all Javascript files that need to be loaded for the page. 
  All <script> blocks should be included on this page to perform any page initialization.
  
  Required Parameters:
    None
    
  Optional Parameters:
    None
--%>

<dsp:page>
  <dsp:getvalueof var="storeConfig" bean="/atg/store/StoreConfiguration"/>
  <fmt:message key="common.button.pleaseWaitText" var="pleaseWaitMessage"/>
  <c:set var="javascriptRoot" value="${pageContext.request.contextPath}/javascript"/>

  <%-- 
    Include dojo from WebUI module. 
    Context root for dojo version 1.6.2 is configured in WebUI module as '/dojo-1-6-2' 
  --%>
  <script type="text/javascript">
    <%-- 
      Dojo Configuration.

      Enable/Disable Dojo debugging - This will log any dojo.debug calls to the Firebug console if installed. 
      Enable debugging by setting component /atg/store/StoreConfiguration.dojoDebug=true 
    --%>
    var djConfig={
      disableFlashStorage: true,
      parseOnLoad: true,
      isDebug: ${storeConfig.dojoDebug}
    };
  </script> 
  <%--  <script type="text/javascript" src="/dojo-1-6-2/dojo/dojo.js.uncompressed.js"></script>
  <script type="text/javascript" src="/dojo-1-6-2/RangeSlider-fixes.js"></script>--%>

  <script type="text/javascript">     
      dojo.require("dojo.back");
      dojo.require("dojo.date");
      dojo.require("dojo.dnd.autoscroll");
      dojo.require("dojo.dnd.common");
      dojo.require("dojo.dnd.Mover");
      dojo.require("dojo.dnd.Moveable");
      dojo.require("dojo.dnd.move");
      dojo.require("dojo.dnd.TimedMoveable");
      dojo.require("dojo.fx");
      dojo.require("dojo.fx.easing");
      dojo.require("dojo.html");
      dojo.require("dojo.i18n");
      dojo.require("dojo.NodeList-traverse");
      dojo.require("dojo.number");
      dojo.require("dojo.parser");
      dojo.require("dojo.window");
      dojo.require("dijit._Container");
      dojo.require("dijit._DialogMixin");
      dojo.require("dijit._HasDropDown");
      dojo.require("dijit._Templated");
      dojo.require("dijit._Widget");
      dojo.require("dijit.Dialog");
      dojo.require("dijit.DialogUnderlay");
      dojo.require("dijit.dijit");
      dojo.require("dijit.form._FormMixin");
      dojo.require("dijit.form._FormWidget");
      dojo.require("dijit.form.Button");
      dojo.require("dijit.form.HorizontalRule");
      dojo.require("dijit.form.HorizontalSlider");
      dojo.require("dijit.form.NumberSpinner");
      dojo.require("dojox.form.RangeSlider");
      dojo.require("dijit.form.VerticalSlider");
      dojo.require("dijit.layout._ContentPaneResizeMixin");
      dojo.require("dijit.layout.ContentPane");
      dojo.require("dijit.nls.dijit-all_en-us");
      dojo.require("dijit.TooltipDialog");
      dojo.require("dojox.image.Lightbox");
      dojo.require("dojox.fx._base");
      dojo.require("dojox.widget.Dialog");       
  </script>
<%-- 
  <script type="text/javascript" src="/dojo-1-6-2/dojo-fixes.js"></script>
  
  
    Include all Javascript files that need to be loaded for the page. 
    All <script> blocks should be included on this page to perform any page initialization. 
  --%>  
  <c:set var="javascriptRoot" value="${pageContext.request.contextPath}/javascript"/>

  <script type="text/javascript">
    <%-- Create global var with webapp context path - this can be used to build absolute urls--%>
    var contextPath="${pageContext.request.contextPath}";
    <%-- Define Store javascript modules path --%>
    dojo.registerModulePath('atg.store', contextPath+'/javascript');
    <%-- Define all required dojo modules. Any custom defined widgets should be listed here. --%>    
    
    <%-- Add any required page initialisation functions here. DO NOT use <body onload=...>  --%>
    
  </script>
  <%--
  <script type="text/javascript" src="${javascriptRoot}/widget/RichCartTrigger.js"></script> 
  <script type="text/javascript" src="${javascriptRoot}/widget/RichCartSummary.js"></script>  
  <script type="text/javascript" src="${javascriptRoot}/widget/RichCartSummaryItem.js"></script>
  <script type="text/javascript" src="${javascriptRoot}/widget/RichCartMessage.js"></script>
  <script type="text/javascript" src="${javascriptRoot}/widget/enterSubmit.js"></script>
  
  <script type="text/javascript" src="${javascriptRoot}/widget/HorizontalResultsList.js"></script>
  <script type="text/javascript" src="${javascriptRoot}/widget/AutoSuggest.js"></script>  
  <script type="text/javascript" src="${javascriptRoot}/widget/PriceSlider.js"></script>
  <script type="text/javascript" src="${javascriptRoot}/widget/ScrollablePromotionalContent.js"></script>
  <script type="text/javascript" src="${javascriptRoot}/widget/ScrollableProductSpotlight.js"></script>
  --%>
  <%-- Include other required external Javascript files 
  <script type="text/javascript" src="${javascriptRoot}/Lightbox.js"></script>
  <script type="text/javascript" src="${javascriptRoot}/picker.js"></script>
  <script type="text/javascript" src="${javascriptRoot}/dialog.js"></script>
  <script type="text/javascript" src="${javascriptRoot}/store.js"></script>
  <script type="text/javascript" src="${javascriptRoot}/numberspinner.js"></script>
--%>
  <%-- 
    Include any store-specific Javascript files. These should be added to the jsp included
    here, and copied to the store-specific application directory  
  --%>
  <script type="text/javascript" charset="utf-8">
    var formIdArray = ["atg_store_preRegisterForm","atg_store_registerLoginForm","atg_store_checkoutLoginForm","searchForm","simpleSearch"];   
    dojo.addOnLoad(function(){
      atg.store.util.setUpPopupEnhance();
      atg.store.util.addNumericValidation();
      atg.store.util.addReturnHandling();
      atg.store.util.addTextAreaCounter();
      atg.store.util.initAddressHighlighter();
      atg.store.util.dropDownOpen();
      atg.store.util.richButtons("atg_store_basicButton");
      atg.store.util.searchFieldBehaviors(dojo.byId("atg_store_searchInput"), dojo.byId("atg_store_searchSubmit"));
      atg.store.util.giftListLinkBehaviors(dojo.byId("giftList"));
      if(dojo.isMac){ dojo.addClass(dojo.doc.documentElement,"dj_osx"); }
    });
  </script>
  
</dsp:page>
<%-- @version $Id: //hosting-blueprint/B2CBlueprint/version/11.2/Storefront/j2ee/store.war/includes/pageStartScript.jsp#2 $$Change: 953229 $--%>
