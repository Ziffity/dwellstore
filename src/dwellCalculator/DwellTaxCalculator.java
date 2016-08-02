package dwellCalculator;

import java.util.Locale;
import java.util.Map;


import atg.commerce.order.Order;
import atg.commerce.pricing.OrderPriceInfo;
import atg.commerce.pricing.PricingException;
import atg.commerce.pricing.PricingTools;
import atg.commerce.pricing.TaxPriceInfo;
import atg.commerce.pricing.TaxPricingCalculator;
import atg.core.util.Address;
import atg.core.util.ContactInfo;
import atg.nucleus.GenericService;
import atg.repository.Repository;
import atg.repository.RepositoryException;
import atg.repository.RepositoryItem;


public class DwellTaxCalculator extends GenericService implements TaxPricingCalculator {
	
	PricingTools pricingTools;
	DwellTaxManager taxManager;		
	
	public DwellTaxManager getTaxManager() {
		return taxManager;
	}

	public void setTaxManager(DwellTaxManager taxManager) {
		this.taxManager = taxManager;
	}

	public PricingTools getPricingTools() {
		return pricingTools;
	}
	
	public void setPricingTools(PricingTools pricingTools) {
		this.pricingTools = pricingTools;
	}
    
	@Override
	public void priceTax(TaxPriceInfo pPriceQuote , Order pOrder, RepositoryItem pPricingModel,
			Locale pLocale, RepositoryItem pProfile, Map pExtraParameters) throws PricingException {
		// TODO Auto-generated method stub
		/*System.out.println("INSIDE PRICETAX" );*/
		double taxAmount = 0;
		
		Object address =  pProfile.getPropertyValue("derivedShippingAddress");
		RepositoryItem item= (RepositoryItem) address;
		String postalCode=(String) item.getPropertyValue("postalCode");
	/*	System.out.println("*****POSTALCODE : " +postalCode);*/
		
		/*int code = 99925;
		String zipcode1 =Integer.toString(code);
		System.out.println("***ZIPCODE : " +zipcode1);*/
		taxAmount = getTaxManager().calculateTax(pOrder, postalCode);
		
		/*System.out.println("***TaxAmount" +taxAmount);*/
		pPriceQuote.setAmount(taxAmount);
		}
}