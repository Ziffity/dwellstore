package endeca.search;

import java.io.IOException;


import java.net.URLEncoder;

import javax.servlet.ServletException;

import atg.droplet.GenericFormHandler;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;

public class DwellSearchFormHandler extends GenericFormHandler
{
String intxt;
String errorURL;
String successURL;
public String getIntxt() 
{
	return intxt;
}

public void setIntxt(String intxt)
{
	this.intxt = intxt;
}
	
public String getErrorURL() {
	return errorURL;
}

public void setErrorURL(String errorURL) 
{
	this.errorURL = errorURL;
}

public String getSuccessURL() {
	return successURL;
}

public void setSuccessURL(String successURL) {
	this.successURL = successURL;
}

public boolean handleSearch(atg.servlet.DynamoHttpServletRequest request,
        atg.servlet.DynamoHttpServletResponse response) throws ServletException,IOException
{
	System.out.println("******Inside DwellSearchFormHandler");
intxt = intxt.replaceAll("[^\\p{L}\\p{Nd}]", " ");
String keyword = "";
StringBuffer searchURL=new StringBuffer();
keyword = URLEncoder.encode(intxt, "UTF-8");
searchURL.append("/browse?Ntt=");
searchURL.append(keyword);
return checkFormRedirect(searchURL.toString(),errorURL,request,response);
}
}
