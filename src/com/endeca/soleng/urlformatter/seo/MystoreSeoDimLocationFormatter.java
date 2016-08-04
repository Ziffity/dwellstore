package com.endeca.soleng.urlformatter.seo;

import atg.commerce.endeca.cache.DimensionValueCache;
import atg.commerce.endeca.cache.DimensionValueCacheObject;
import atg.commerce.endeca.cache.DimensionValueCacheTools;
import atg.core.util.StringUtils;
import atg.nucleus.Nucleus;
import atg.service.perfmonitor.PerformanceMonitor;

import com.endeca.navigation.DimLocation;
import com.endeca.navigation.DimVal;
import com.endeca.soleng.urlformatter.UrlFormatException;
import com.endeca.soleng.urlformatter.UrlState;

public class MystoreSeoDimLocationFormatter extends SeoDimLocationFormatter {
 
 DimensionValueCacheTools dimensionValueCacheTools = (DimensionValueCacheTools) Nucleus.getGlobalNucleus().resolveName("/atg/commerce/endeca/cache/DimensionValueCacheTools");
 
 @Override
 public String formatDimLocation(UrlState pUrlState, DimLocation pDimLocation)
   throws UrlFormatException {
  boolean exception = false;
  DimVal dimValue = pDimLocation.getDimValue();
  StringBuffer buffer = new StringBuffer();
  String seoUrl = null;
  DimensionValueCache dimvalCache = dimensionValueCacheTools.getCache();
  DimensionValueCacheObject cacheObject =  dimvalCache.getCachedObjectForDimval(Long.toString(dimValue.getId()));
  if(null != cacheObject  && dimValue.isLeaf()){
   seoUrl = cacheObject.getUrl().replace("/c/","");
  }
  seoUrl = StringUtils.isNotEmpty(seoUrl) ? seoUrl : dimValue.getName();
  String parameter = "ACCLSeoDimLocationFormatter_formatDimLocation_" + seoUrl + "_"+ dimValue.getId();
  String opName = "formatDimLocation";
  try {
   PerformanceMonitor.startOperation(opName, parameter);
   String formattedString = getDimValStringFormatter().format(pUrlState,seoUrl.trim());
   if ((null != formattedString) && (!("".equals(formattedString)))) {
    buffer.append(formattedString);
   }
  }catch(Exception e){
   exception=false;
   PerformanceMonitor.cancelOperation(opName, parameter);
  }finally{
   if(!exception)
    PerformanceMonitor.endOperation(opName, parameter);
  }
  return buffer.toString();
 }
}
