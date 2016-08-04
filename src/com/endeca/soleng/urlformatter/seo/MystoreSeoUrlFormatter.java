package com.endeca.soleng.urlformatter.seo;

import atg.commerce.endeca.cache.DimensionValueCacheObject;



import atg.commerce.endeca.cache.DimensionValueCacheTools;
import atg.commerce.endeca.cache.MystoreDimensionValueCacheTools;
import atg.core.util.StringUtils;
import atg.multisite.SiteContextManager;
import atg.nucleus.Nucleus;
import atg.repository.Repository;
import atg.repository.RepositoryException;
import atg.repository.RepositoryItem;
import atg.repository.RepositoryView;
import atg.repository.rql.RqlStatement;

import java.util.List;

import com.endeca.soleng.urlformatter.UrlFormatException;
import com.endeca.soleng.urlformatter.UrlState;

public class MystoreSeoUrlFormatter extends SeoUrlFormatter 
{
	
	MystoreDimensionValueCacheTools dimensionValueCacheTools = (MystoreDimensionValueCacheTools) Nucleus.getGlobalNucleus().resolveName("/atg/commerce/endeca/cache/DimensionValueCacheTools");
	SiteContextManager siteContextManager = (SiteContextManager) Nucleus.getGlobalNucleus().resolveName("/atg/multisite/SiteContextManager");
	Repository catalogRepository = (Repository) Nucleus.getGlobalNucleus().resolveName("/atg/commerce/catalog/ProductCatalog");
	
	@SuppressWarnings("static-access")
	protected void parsePathInfo(UrlState pUrlState, String pPathInfo)
			throws UrlFormatException
			{
		

		boolean isCategory = false;

		if (null == pPathInfo)
			return;

		int i = 0;
		String[] pathElements = pPathInfo.split("/");
		for (; i < pathElements.length; ++i) {
			String pathElement = pathElements[i];
			//System.out.println("path element: " + pathElement);
			if ("".equals(pathElement))
				continue;
			if ("c".equals(pathElement)) {
				isCategory = true;
				++i;
				break;
			}
		}
		System.out.println("*******Inside SeoUrlFormatter****" + isCategory);

		if (!isCategory || pathElements.length == i || (pathElements.length > i && StringUtils.isNotBlank(pathElements[i]) 
				&& getPathSeparatorToken().equals(pathElements[pathElements.length-2]))) {
			super.parsePathInfo(pUrlState, pPathInfo);
		} else {
			RepositoryItem[] items = null;
			Object param[] = new Object[2];
			param[0] = pathElements[i];
			param[1] = siteContextManager.getCurrentSiteId();
			String query = "seoURL EQUALS ?0";
			//System.out.println("path element: "+ pathElements[i]);
			try {
				RepositoryView view = catalogRepository.getView("category");
				RqlStatement statement = RqlStatement.parseRqlStatement(query);
				items = statement.executeQuery(view, param);
				//System.out.println("items " + items);
				if (null != items && items.length >= 1) {
					List<DimensionValueCacheObject> dimensionValueCacheObjects = dimensionValueCacheTools.get(items[0].getRepositoryId());
					//System.out.println("dimension value : "+ dimensionValueCacheObjects );
					if(null!=dimensionValueCacheObjects)
						//System.out.println("setting N: " + dimensionValueCacheObjects.get(0).getDimvalId());
						pUrlState.setParam("N", dimensionValueCacheObjects.get(0).getDimvalId());
				} else {
					super.parsePathInfo(pUrlState, pPathInfo);
				}
			} catch (RepositoryException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
