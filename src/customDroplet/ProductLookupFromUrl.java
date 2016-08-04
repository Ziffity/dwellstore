package customDroplet;
import atg.core.util.StringUtils;

import atg.multisite.SiteContextManager;
import atg.nucleus.Nucleus;
import atg.repository.Repository;
import atg.repository.RepositoryException;
import atg.repository.RepositoryItem;
import atg.repository.RepositoryView;
import atg.repository.rql.RqlStatement;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;
import atg.servlet.DynamoServlet;
import javax.servlet.ServletException;
import java.io.IOException;
import java.text.MessageFormat;
import java.util.List;

public class ProductLookupFromUrl extends DynamoServlet{
 
 private Repository productCatalog;
 //input parameters
 private static final String PARAM_INPUT = "seoURL";
 
 //output parameters
 private static final String PARAM_OUTPUT = "product";
 private static final String PARAM_ERROR_MESSAGE = "errorMsg";

 //open parameters

 private static final String OPARAM_OUTPUT = "output";
 private static final String OPARAM_ERROR = "error";
 
 public Repository getProductCatalog() {

        return productCatalog;

 }

public void setProductCatalog(Repository productCatalog) {

this.productCatalog = productCatalog;

}

  @Override
  
  public void service(DynamoHttpServletRequest pRequest, DynamoHttpServletResponse pResponse) throws ServletException, IOException {
   
    try{
     String seoURL = (String) pRequest.getObjectParameter(PARAM_INPUT);
        System.out.println(seoURL);
    // SiteContextManager SiteContextManager =(SiteContextManager) Nucleus.getGlobalNucleus().resolveName("/atg/multisite/SiteContextManager");
     Object param[]=new Object[2];
     param[0]= seoURL;
    
     System.out.println("param 1:" +param[0]);
     
     String query= "seoURL EQUALS ?0";
     
     RepositoryView view = (RepositoryView) getProductCatalog().getView("product");
     RqlStatement statement=RqlStatement.parseRqlStatement(query);
     RepositoryItem items[]=statement.executeQuery(view,param);
     
     pRequest.setParameter(PARAM_OUTPUT, items[0]);
     pRequest.serviceParameter(OPARAM_OUTPUT, pRequest, pResponse);
     
     System.out.println(items[0]);
    }
    
    catch(RepositoryException re){
   System.out.println(re);
    }
   
  }
}






