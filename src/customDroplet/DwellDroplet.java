package customDroplet;

import atg.repository.RepositoryItem;


import atg.servlet.DynamoServlet;
import atg.core.util.StringUtils;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;
import atg.servlet.DynamoServlet;
import atg.userprofiling.Profile;
import javax.servlet.ServletException;

import java.io.IOException;
import java.text.MessageFormat;
import java.util.List;
public class DwellDroplet extends DynamoServlet 
{
	//input parameters
	private static final String PARAM_INPUT="product";
	//open parameters

	private static final String PARAM_OUTPUT="defaultSKU";

	private static final String PARAM_ERROR_MESSAGE = "errorMsg";	
	//open parameters

	private static final String OPARAM_OUTPUT = "output";

	private static final String OPARAM_ERROR = "error";

	@Override

	public void service(DynamoHttpServletRequest pRequest, DynamoHttpServletResponse pResponse)throws ServletException, IOException
			{
		System.out.println("***********Inside Custom Droplet");
	RepositoryItem product=(RepositoryItem) pRequest.getObjectParameter(PARAM_INPUT);
	System.out.println("********product is:"+product);
	RepositoryItem defaultSKU=(RepositoryItem) product.getPropertyValue("DefaultSKU");
	
	List<RepositoryItem> childSkuList=(List<RepositoryItem>) product.getPropertyValue("childSKUs");
	
if(!(childSkuList.isEmpty()))
{
	
	if(defaultSKU!=null)
	{
		System.out.println("***********DefaultSKU is there");
		pRequest.setParameter(PARAM_OUTPUT,defaultSKU);
	}
	else
	{
		System.out.println("***********DefaultSKU is NUll");
		pRequest.setParameter(PARAM_OUTPUT,childSkuList.get(0));
		
	}
	pRequest.serviceParameter(OPARAM_OUTPUT,pRequest,pResponse);
}
	else
		pRequest.setParameter(PARAM_ERROR_MESSAGE, "NO Skus available");
		pRequest.serviceParameter(OPARAM_ERROR, pRequest, pResponse);
	

}
}
