package dwell.servlet;

import atg.servlet.pipeline.InsertableServletImpl;
import atg.core.util.StringUtils;
import atg.multisite.SiteContextManager;
import atg.nucleus.Nucleus;
import atg.repository.Repository;
import atg.repository.RepositoryItem;
import atg.repository.RepositoryItemImpl;
import atg.repository.RepositoryView;
import atg.servlet.sessiontracking.GenericSessionManager;
import atg.repository.rql.RqlStatement;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;
import javax.servlet.ServletException;
import java.io.IOException;
import javax.servlet.http.HttpSession;

public class NaturalSearchServlet extends InsertableServletImpl{
	
	Repository productCatalog;
	boolean redirect;
	private GenericSessionManager genericSessionManager;
	private boolean loggingAdditionalDebug;
	
	public void service(DynamoHttpServletRequest request,
			DynamoHttpServletResponse response) throws IOException,
			ServletException {
		System.out.println("****Inside Natural Search Servlet****");
		setRedirect(false);
		String requestUri = request.getRequestURI();
		String requestURIWithQueryString = request
				.getRequestURIWithQueryString();
		String queryString = request.getQueryString();
		boolean isValidQueryString = validateQueryString(queryString);
		vlogDebug("Resquest URI start index is {0} and end index is {1}",
				new Object[] { requestURIWithQueryString.indexOf("?"),
						requestURIWithQueryString.lastIndexOf("?") });
		if (requestURIWithQueryString.indexOf("?") != requestURIWithQueryString
				.lastIndexOf("?")
				|| !isValidQueryString
				|| requestUri.endsWith("/c")
				|| requestUri.endsWith("/c/")
				|| requestUri.endsWith("/p") || requestUri.endsWith("/p/")) 
		{
			response.sendError(404);
			return;
		}

		String contextPath = request.getContextPath();
		StringBuffer redirectURl = new StringBuffer();
		redirectURl.append(requestUri);
		
		if (requestUri.startsWith(contextPath)) {
			redirectURl.delete(0, contextPath.length());
		}

		if (redirectURl.toString().startsWith("/dwell")) 
		{
			redirectURl.delete(0, "/dwell".length());
		}
		
		if (requestUri.contains("/c/")) {
			checkForRedirect("category", redirectURl.toString(), response);
			if (isRedirect()) {
				return;
			}
		}

		if (requestUri.contains("/p/")) {
			checkForRedirect("product", redirectURl.toString(), response);
			if (isRedirect()) {
				return;
			}
		}
			response.setHeader("Cache-Control",
					"no-cache,no-store,must-revalidate"); // HTTP 1.1
			response.setHeader("Pragma", "no-cache"); // HTTP 1.0
			response.setDateHeader("Expires", 0);

		logSessionInfo(request);
		
		passRequest(request, response);
	}
	
	private boolean validateQueryString(String pQueryString) {
		if (StringUtils.isBlank(pQueryString))
			return true;
		String[] fields = pQueryString.split("&");

		if (fields != null && fields.length > 0) {
			for (int i = 0; i < fields.length; ++i) {
				String[] pairs = fields[i].split("=");
				if (pairs.length > 2) {
					return false;
				}
			}
		}
		return true;
	}
	
	/**
	 * @param request
	 * @param requestUri
	 */
	private void logSessionInfo(DynamoHttpServletRequest request) {
		if(isLoggingAdditionalDebug()){
			String sessionId=request.getCookieParameter("JSESSIONID");
			logDebug("Request URI is : "+request.getRequestURI()+" || Referer URI is :"+request.getHeader("referer"));
			if(!StringUtils.isBlank(sessionId)){
				logDebug("NSS_JSession Id is : "+sessionId);
			}else{
				vlogWarning("NSS_No Session Id available. How can this happen?", new Object[]{});
			}
			HttpSession httpSession=getGenericSessionManager().getSession(sessionId);
			if(httpSession==null){
				vlogWarning("NSS_No Session Available for the session Id. How can this happen?", new Object[]{});
			}
		}
	}
	
	@SuppressWarnings("static-access")
	public void checkForRedirect(String itemDescriptorName, String url,
			DynamoHttpServletResponse response) {

		SiteContextManager siteContextManager = (SiteContextManager) Nucleus
				.getGlobalNucleus().resolveName(
						"/atg/multisite/SiteContextManager");

		String[] pathInfo = url.toString().split("/");
		String seoURL = pathInfo[2];

		RepositoryItem[] items = null;
		Object params[] = new Object[2];
		params[0] = seoURL;
	//	System.out.println("***param[0]:"+params[0]);
		params[1] = siteContextManager.getCurrentSiteId();
		//System.out.println("***param[1]:"+params[1]);
		String query = "seoURL EQUALS IGNORECASE ?0";
		
		//System.out.println("****url:" + url);
		//System.out.println("****seo url:" + seoURL);
	//	System.out.println("****site id: "+ siteContextManager.getCurrentSiteId());
		//System.out.println("****itemDescriptor:" + itemDescriptorName);

		try {
			
			RepositoryView view = getProductCatalog().getView(itemDescriptorName);
			
			//System.out.println("****view:" + view);
			RqlStatement statement = RqlStatement.parseRqlStatement(query);
			//System.out.println("******statement:"+statement);
			//System.out.println("***param:"+params);
			items = statement.executeQuery(view,params);
			//System.out.println("******Items1:"+items);
			if (null == items || items.length < 1) {
				//System.out.println("****inside if");
				query = "seoURL EQUALS IGNORECASE ?0 ";
				statement = RqlStatement.parseRqlStatement(query);
				items = statement.executeQuery(view,params);
				//System.out.println("******Items:"+items);
				if (null != items && items.length >= 1) {
					if (url.contains("/c/"))
					{
						//System.out.println("******inside c");
						response.sendRedirect("/c/"
								+ (String) items[0].getPropertyValue("seoURL"));
					} else
					{
						response.sendRedirect("/p/" + (String) items[0].getPropertyValue("seoURL"));
					}
				} else {
					response.sendError(404);
				}
				setRedirect(true);
			}
		} catch (Exception e)
		{
			vlogError("*********Redirect error :"+e.getMessage());
			//System.out.println("*******redirect msg:"+e);
		}
	}


	public Repository getProductCatalog() {
		return productCatalog;
	}

	public void setProductCatalog(Repository productCatalog) {
		this.productCatalog = productCatalog;
	}

	public boolean isRedirect() {
		return redirect;
	}

	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}

	public GenericSessionManager getGenericSessionManager() {
		return genericSessionManager;
	}

	public void setGenericSessionManager(GenericSessionManager genericSessionManager) {
		this.genericSessionManager = genericSessionManager;
	}

	public boolean isLoggingAdditionalDebug() {
		return loggingAdditionalDebug;
	}

	public void setLoggingAdditionalDebug(boolean loggingAdditionalDebug) {
		this.loggingAdditionalDebug = loggingAdditionalDebug;
	}
		
}
