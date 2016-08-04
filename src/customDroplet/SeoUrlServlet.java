package customDroplet;

import java.io.IOException;
import atg.servlet.pipeline.*;

import javax.mail.URLName;
import javax.servlet.ServletException;

import atg.repository.Repository;
import atg.repository.RepositoryException;
import atg.repository.RepositoryItem;
import atg.repository.RepositoryItemImpl;
import atg.repository.RepositoryView;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;
import atg.servlet.pipeline.InsertableServletImpl;

public class SeoUrlServlet extends InsertableServletImpl
{
	 private Repository productCatalog;
	 public Repository getProductCatalog() {
			return productCatalog;
		}

		public void setProductCatalog(Repository productCatalog) {
			this.productCatalog = productCatalog;
		}
		

	 public void service(DynamoHttpServletRequest pRequest, DynamoHttpServletResponse pResponse) throws ServletException, IOException 
	{
		 String seoURL="pinjipfdp";
		 System.out.println("*******seoURL:"+seoURL);
	     if(seoURL=="p")
	     {
	    	System.out.println("******seoURL contains 'p' char");
		    checkForRedirect();
         }
	     else
	     {
	    	 System.out.println("******seoURL does not contains 'p' char");
	    	 
	     }
	 
     }

	public void checkForRedirect() 
	{
		 try 
		 {
			RepositoryView view = (RepositoryView) getProductCatalog().getView("product");
			RepositoryItemImpl item = null;
			String seoUrl=(String) item.getPropertyValue("seoURL");
			 System.out.println("seoURL Is :"+seoUrl);
		  } 
		 catch (RepositoryException e)
		 {
			
			e.printStackTrace();
		  }
		
		
	}

	public void parsePathInfo(URLName pUrlState, String pPathInfo) 
	{
		
		
	}	
}
