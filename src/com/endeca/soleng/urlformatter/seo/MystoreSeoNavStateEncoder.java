package com.endeca.soleng.urlformatter.seo;

import java.util.ListIterator;

import com.endeca.navigation.DimLocation;
import com.endeca.navigation.DimLocationList;
import com.endeca.navigation.DimValIdList;
import com.endeca.soleng.urlformatter.NavStateUrlParam;
import com.endeca.soleng.urlformatter.UrlFormatException;
import com.endeca.soleng.urlformatter.UrlParam;
import com.endeca.soleng.urlformatter.UrlState;

public class MystoreSeoNavStateEncoder extends SeoNavStateEncoder {

 static final int RADIX = 36;
 static final char SEPARATOR_CHAR = 90;
 static final String SEPARATOR_CHAR_REGEX = new String(new char[] { 'Z' });

 public String encodeValue(UrlState pUrlState, UrlParam pUrlParam) {
  DimValIdList dimValIdList;
  if (pUrlParam instanceof NavStateUrlParam) {
   NavStateUrlParam navState = (NavStateUrlParam) pUrlParam;
   DimLocationList dimLocationList = navState.getDimLocationList();
   dimValIdList = new DimValIdList();
   ListIterator i = dimLocationList.listIterator();
   while (i.hasNext()) {
    DimLocation dimLocation = (DimLocation) i.next();
    dimValIdList.addDimValue(dimLocation.getDimValue());
   }
  } else {
   dimValIdList = new DimValIdList(pUrlParam.getValue());
  }
  return formatDimValIdList(dimValIdList);
 }

 public String decodeValue(UrlState pUrlState, String pValue)
   throws UrlFormatException {
  return parseDimValIdList(pValue).toString();
 }

 private String formatDimValIdList(DimValIdList pDimValIdList) {
  StringBuffer sb = new StringBuffer(16 * pDimValIdList.size());
  boolean isFirst = true;
  ListIterator i = pDimValIdList.listIterator();
  while (i.hasNext()) {
   Long dimValId = (Long) i.next();
   long id = dimValId.longValue();

   if (isFirst)
    isFirst = false;
   else
    sb.append('_');

   sb.append(id);
   
  }
  return sb.toString();
 }

 private DimValIdList parseDimValIdList(String pString)
   throws UrlFormatException {
  try {
   if (null == pString)
    return null;
   if (0 == pString.length())
    return new DimValIdList();

   DimValIdList dimValIdList = new DimValIdList();
   String[] values = pString.split("_");
   for (int i = 0; i < values.length; ++i) {
    String value = values[i];

    dimValIdList.addDimValueId(Long.parseLong(value));
   }
   return dimValIdList;
  } catch (NumberFormatException e) {
   throw new UrlFormatException(e);
  }
 }
}