package dwellCalculator;

import java.util.ArrayList;

import atg.commerce.order.Order;
import atg.commerce.pricing.PricingTools;
import atg.commerce.pricing.TaxPriceInfo;
import atg.nucleus.GenericService;
import atg.repository.Repository;
import atg.repository.RepositoryException;
import atg.repository.RepositoryItem;
import atg.repository.RepositoryView;
import atg.repository.rql.RqlStatement;

public class DwellTaxManager extends GenericService {
	double taxRates=0.0D;
	Repository mystoreTaxRepository;
	PricingTools pricingTools;
	
	public PricingTools getPricingTools() {
		return pricingTools;
	}

	public void setPricingTools(PricingTools pricingTools) {
		this.pricingTools = pricingTools;
	}

	public Repository getMystoreTaxRepository() {
		return mystoreTaxRepository;
	}

	public void setMystoreTaxRepository(Repository mystoreTaxRepository) {
		this.mystoreTaxRepository = mystoreTaxRepository;
	}
	
	public double calculateTax(Order pOrder,String zipcode){
		
		double orderAmount =0;
		double amount = 0;
		double taxAmount = 0;
		double taxRates = 0;
		
		RepositoryItem item=null;
		
		try {
			item = getMystoreTaxRepository().getItem(zipcode,"dwelltaxPriceRate");
			/*System.out.println("*******RETURNED ITEM " +item);*/
		} catch (RepositoryException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (item != null){
			taxRates=Double.parseDouble(item.getPropertyValue("taxRate").toString());
		}
		
		orderAmount = pOrder.getPriceInfo().getAmount();
		amount = orderAmount * taxRates/100;
		taxAmount = getPricingTools().round(amount);
		
		return taxAmount;
		
	}

}