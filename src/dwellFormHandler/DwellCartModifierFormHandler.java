package dwellFormHandler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import com.endeca.infront.shaded.org.apache.commons.lang.StringUtils;
import atg.commerce.order.Order;
import atg.commerce.order.purchase.CartModifierFormHandler;
import atg.repository.RepositoryItem;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;
import dwellCalculator.DwellTaxCalculator;
import dwellCalculator.DwellTaxManager;
import dwellShipping.DwellShippingManager;
import dwellShipping.ShippingInformationDataHolder;

public class DwellCartModifierFormHandler extends CartModifierFormHandler {

	String zipcode;
	Double taxAmount;
	DwellTaxManager taxManager;
	private String successURL;
	private String ErrorURL;
	DwellShippingManager shippingManager;
	String selectedMethod;
	Map<List,List> shippingMethods;
	ShippingInformationDataHolder shippingInformationDataHolder;
	
	public Map<List, List> getShippingMethods() {
		return shippingMethods;
	}

	public void setShippingMethods(Map<List, List> shippingMethods) {
		this.shippingMethods = shippingMethods;
	}

	
	public ShippingInformationDataHolder getShippingInformationDataHolder() {
		return shippingInformationDataHolder;
	}

	public void setShippingInformationDataHolder(
			ShippingInformationDataHolder shippingInformationDataHolder) {
		this.shippingInformationDataHolder = shippingInformationDataHolder;
	}

	
	
	public String getSelectedMethod() {
		return selectedMethod;
	}

	public void setSelectedMethod(String selectedMethod) {
		this.selectedMethod = selectedMethod;
	}

	public DwellShippingManager getShippingManager() {
		return shippingManager;
	}

	public void setShippingManager(DwellShippingManager shippingManager) {
		this.shippingManager = shippingManager;
	}

	public Double getTaxAmount() {
		return taxAmount;
	}

	public void setTaxAmount(Double taxAmount) {
		this.taxAmount = taxAmount;
	}

	public String getSuccessURL() {
		return successURL;
	}

	public void setSuccessURL(String successURL) {
		this.successURL = successURL;
	}

	public String getErrorURL() {
		return ErrorURL;
	}

	public void setErrorURL(String errorURL) {
		ErrorURL = errorURL;
	}

	
	public DwellTaxManager getTaxManager() {
		return taxManager;
	}

	public void setTaxManager(DwellTaxManager taxManager) {
		this.taxManager = taxManager;
	}

	
	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public boolean handleTax(DynamoHttpServletRequest request,DynamoHttpServletResponse response) throws ServletException, IOException{
		
		zipcode = getZipcode();
		Order mOrder = getOrder();
		Double taxPrice = getTaxManager().calculateTax(mOrder,zipcode);
		
		System.out.println("*****zipcode : " +zipcode);
		System.out.println("*****taxAmount : " +taxPrice);
		
		setTaxAmount(taxPrice);
		
		return checkFormRedirect(getSuccessURL(), getErrorURL(), request, response);
	}
	

	public boolean handleEstimate(DynamoHttpServletRequest request,DynamoHttpServletResponse response) throws ServletException, IOException{
		 
		if(StringUtils.isNotBlank(getZipcode())|| StringUtils.isNotBlank(getShippingInformationDataHolder().getPostalcode())){
			 zipcode = getZipcode();
			 getShippingManager().estimateShipping(zipcode);
			 
			  //System.out.println("*****zipcode : " +zipcode);
			/*  ArrayList<Double> shippingRate = getShippingManager().estimateShipping(getZipcode());
			  
			  ArrayList<String> shippingMethod = getShippingManager().estimateShippingMethod(getZipcode());
			  System.out.println("*****shippingrates : " +shippingRate);
			  System.out.println("*****shippingmethods : " +shippingMethod);
			  
			  shippingMethods = new HashMap<List,List>();
			  shippingMethods.put(shippingMethod, shippingRate);
			  
			  System.out.println("ShippingMethods" +shippingMethods);
			  getShippingInformationDataHolder().setEstimatedShippingMethods(shippingMethods);*/
		}
		 
		  return checkFormRedirect(getSuccessURL(), getErrorURL(), request, response);
	}
	
	public boolean HandleUpdateShippingMethod(DynamoHttpServletRequest request,DynamoHttpServletResponse response) throws ServletException, IOException
	{
		 getShippingManager().estimateShippingAmount(getZipcode(),getSelectedMethod());
		
		return checkFormRedirect(getSuccessURL(), getErrorURL(), request, response);
	}
	
}