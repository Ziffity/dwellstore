package dwellShipping;

import java.util.HashMap;
import java.util.Map;

import atg.commerce.order.purchase.ShippingGroupFormHandler;

import atg.nucleus.GenericService;
import atg.repository.Repository;
import atg.repository.RepositoryException;
import atg.repository.RepositoryItem;
import atg.repository.RepositoryView;
import atg.repository.rql.RqlStatement;

public class DwellShippingManager extends GenericService{

	Repository mystoreshippingrepository;
	RepositoryItem item=null;
	String postalCode;
	DwellShippingCalculator shippingCalculator;
	

	public DwellShippingCalculator getShippingCalculator() {
		return shippingCalculator;
	}

	public void setShippingCalculator(DwellShippingCalculator shippingCalculator) {
		this.shippingCalculator = shippingCalculator;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	ShippingInformationDataHolder shippingInformationDataHolder;
	ShippingGroupFormHandler shippingGroupFormHandler;
	
	public ShippingGroupFormHandler getShippingGroupFormHandler() {
		return shippingGroupFormHandler;
	}

	public void setShippingGroupFormHandler(
			ShippingGroupFormHandler shippingGroupFormHandler) {
		this.shippingGroupFormHandler = shippingGroupFormHandler;
	}

	public ShippingInformationDataHolder getShippingInformationDataHolder() {
		return shippingInformationDataHolder;
	}

	public void setShippingInformationDataHolder(
			ShippingInformationDataHolder shippingInformationDataHolder) {
		this.shippingInformationDataHolder = shippingInformationDataHolder;
	}

	public Repository getMystoreshippingrepository() {
		return mystoreshippingrepository;
	}

	public void setMystoreshippingrepository(Repository mystoreshippingrepository) {
		this.mystoreshippingrepository = mystoreshippingrepository;
	}
	
	public void estimateShipping(String zipcode){
		
		RepositoryItem[] items = null;
		Object params[] = new Object[2];
		double shippingPrice = 0;
		String shippingMethod = null;
		Map<String,Double> shippingMethods = new HashMap<String, Double>();
		params[0] = zipcode;
		
		String query = "zip_code EQUALS ?0";
		System.out.println("***param[0]:"+params[0]);
		
			try {
			RepositoryView view = getMystoreshippingrepository().getView("shippingRepository");
			RqlStatement statement = RqlStatement.parseRqlStatement(query);
			items = statement.executeQuery(view,params);
			
			//System.out.println("*******REPOSITORY_ITEMS :" +items);
			
			for(RepositoryItem item :items){
				shippingPrice = (double) item.getPropertyValue("shipping_price");
				shippingMethod=(String)item.getPropertyValue("shipping_method");
				shippingMethods.put(shippingMethod, shippingPrice);
				getShippingInformationDataHolder().setEstimatedShippingMethods(shippingMethods);
			}
		} 
		catch (RepositoryException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void estimateShippingAmount(String zipcode,String shippingMethod){
		
		RepositoryItem[] result= null;
		Object param[]=new Object[2];
		param[0]=zipcode;
		param[1]=shippingMethod;
		Double price = null;
				
		String query = "zip_code EQUALS ?0 AND shipping_method EQUALS ?1";
		try{
			RepositoryView view = mystoreshippingrepository.getView("shippingRepository");
			 RqlStatement statement = RqlStatement.parseRqlStatement(query);
			 result = statement.executeQuery(view, param);
			 price=(Double) result[0].getPropertyValue("shipping_price");
			 System.out.println("****result :" +result); 
			 System.out.println("****result :" +price); 
			 
			 for (RepositoryItem RT	 : result) {
				
				 
				 price =(Double) RT.getPropertyValue("shipping_price");
				 System.out.println("*****InsideForprice :" +price);
				 System.out.println("****result :" +result); 
			  }
		}
		catch (RepositoryException e) {
		    // TODO Auto-generated catch block
		    e.printStackTrace();
		   }
		
		getShippingInformationDataHolder().setPrice(price);
		getShippingCalculator().setAmount(price);
	}
	
	public void postal(){
		System.out.println(getPostalCode());
	}
	
}
