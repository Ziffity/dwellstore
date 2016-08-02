package atg.commerce.endeca.cache;

import java.util.List;


import atg.endeca.assembler.AssemblerTools;
import atg.nucleus.Nucleus;
import atg.repository.Repository;
import atg.repository.RepositoryException;
import atg.repository.RepositoryItem;

public class MystoreDimensionValueCache extends DimensionValueCache {
	
	Repository catalogRepository = (Repository) Nucleus.getGlobalNucleus().resolveName("/atg/commerce/catalog/ProductCatalog");

	public boolean put(String pRepositoryId, String pDimvalId, String pURL,
			List<String> pAncestorRepositoryIds) 
	{
		System.out.println("*******Inside DimentionValueCache****");
		AssemblerTools
		.getApplicationLogging().vlogDebug("Calling Custom put method to poppulate cache in Mystore map");
		
		RepositoryItem category = null;
		String categoryUrl = null;
		
		try {
			category = catalogRepository.getItem(pRepositoryId, "category");
		} catch (RepositoryException e) {
			AssemblerTools.getApplicationLogging().vlogError(e.getMessage(), "Catalog repo error");
		}
		
		if(category != null) {
			AssemblerTools
			.getApplicationLogging().vlogWarning("Cache refresh for repository "+pRepositoryId + "-Dim val id : " + pDimvalId + " - Ancestor repository id :"+pAncestorRepositoryIds);
			categoryUrl = "/c/" + (String) category.getPropertyValue("seoUrl");
			System.out.println("DimValId:"+pDimvalId);
			return super.put(pRepositoryId, pDimvalId, categoryUrl, pAncestorRepositoryIds);
		} else {
			AssemblerTools
			.getApplicationLogging().vlogWarning("Category is null for repository  id : "+pRepositoryId);
			return false;
		}
	}
}
