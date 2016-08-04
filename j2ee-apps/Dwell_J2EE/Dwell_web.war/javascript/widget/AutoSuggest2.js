function myFunction(){
	
 $("#searchBar").autocomplete({
	
  source : function(request, response) {
   url = "/includes/autosuggest.jsp?Ntt=" + $("#searchBar").val() +"*&contentCollection=/content/Shared/Auto-Suggest Panels/Default Auto-Suggest Panel&Dy=1";

   $.ajax({
    url : url, type : "GET", data : {}, dataType: 'json',
    success : function(data) {
     var output = [];
     var autoSuggestCartridges = data.contents[0].autoSuggest[0];
     if (autoSuggestCartridges != null || autoSuggestCartridges.length > 0 && autoSuggestCartridges['@type'] == "DimensionSearchAutoSuggestItem") {
      var dimSearchGroupList = autoSuggestCartridges.dimensionSearchGroups;
      for (var i = 0; i < dimSearchGroupList.length; i++) {
       var dimResultGroup = dimSearchGroupList[i];
       var displayName = dimResultGroup.displayName;
       for (var j = 0; j < dimResultGroup.dimensionSearchValues.length; j++) {
        var dimResult = dimResultGroup.dimensionSearchValues[j];
		
        output.push(dimResult.label)
		
		}
      }
	  
      response(output);
     }
    }
   });
  },
  minLength : 3,
  select: function( event, ui ) {
   window.location = "/cartridges/DwellProductsListPage/DwellProductsListPage.jsp?Ntt=" + ui.item.value;
  },
  messages: {
         noResults: '',
         results: function() {}
     }
 });
}