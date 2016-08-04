package customDroplet;

import java.io.IOException;
import javax.servlet.ServletException;

import atg.repository.RepositoryItem;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;
import atg.servlet.DynamoServlet;

public class ProductUrlLookup extends DynamoServlet
{
	private static final String PARAM_INPUT="productId";
	//open parameters

	private static final String PARAM_OUTPUT="seoURL";
	private static final String OPARAM_OUTPUT="output";


	private static final String OPARAM_ERROR = "error";
	private static final String PARAM_ERROR_MESSAGE = "errorMsg";
	public void service(DynamoHttpServletRequest pRequest, DynamoHttpServletResponse pResponse)throws ServletException, IOException
	{
		RepositoryItem productId=(RepositoryItem) pRequest.getObjectParameter(PARAM_INPUT);
		System.out.println("**************productId:"+productId);
		String seoURL=(String) productId.getPropertyValue("seoURL");
		System.out.println("**************seoURL:"+seoURL);
		if(seoURL!=null)
		{
			pRequest.setParameter(PARAM_OUTPUT,seoURL);
			pRequest.serviceParameter(OPARAM_OUTPUT,pRequest,pResponse);
		}
		
		else
		{
			pRequest.setParameter(PARAM_ERROR_MESSAGE, "seoURL NULL");
			pRequest.serviceParameter(OPARAM_ERROR, pRequest, pResponse);
			
		}
	}

}
