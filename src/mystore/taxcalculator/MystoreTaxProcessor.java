package mystore.taxcalculator;

import atg.commerce.pricing.PricingTools;
import atg.core.util.StringUtils;
import atg.nucleus.GenericService;
import atg.payment.tax.ShippingDestination;
import atg.payment.tax.TaxProcessor;
import atg.payment.tax.TaxRequestInfo;
import atg.payment.tax.TaxStatus;
import atg.projects.store.order.StoreOrderImpl;

public class MystoreTaxProcessor extends GenericService implements TaxProcessor{
	
	protected PricingTools pricingTools;
	
	private MystoreTaxRates taxRates;

	MystoreTaxManager taxManager;
	
	public MystoreTaxManager getTaxManager() {
		return taxManager;
	}

	public void setTaxManager(MystoreTaxManager taxManager) {
		this.taxManager = taxManager;
	}


	public PricingTools getPricingTools() {
		return pricingTools;
	}

	public void setPricingTools(PricingTools pricingTools) {
		this.pricingTools = pricingTools;
	}

	@Override
	public TaxStatus calculateTax(TaxRequestInfo pTaxRequestInfo) {
		logDebug("CalculateTax - Mystore");
		System.out.println("calculate tac - mystore");
		MyStoreTaxStatus retTaxStatus = new MyStoreTaxStatus();
		retTaxStatus.setAmount(getPricingTools().round(5));
		retTaxStatus.setTransactionSuccess(true);
		return retTaxStatus;
	}

	@Override
	public TaxStatus[] calculateTaxByShipping(TaxRequestInfo pTaxRequestInfo) {
		logDebug("CalculateTaxByShipping - Mystore");
		
		double orderAmount = 0.0D;
		double rates = 0.0D;
		double taxAmount = 0.0D;
		int i =0;
		
		MyStoreTaxStatus[] retTaxStatus = new MyStoreTaxStatus[pTaxRequestInfo.getShippingDestinations().length];
		
		if(pTaxRequestInfo.getOrder()!=null){
			StoreOrderImpl order=(StoreOrderImpl) pTaxRequestInfo.getOrder();
			orderAmount = order.getPriceInfo().getAmount();
			/*taxOnItems = getTaxManager().getTaxForOrder(order);*/
		}
		
		for(ShippingDestination shippingDestination : pTaxRequestInfo.getShippingDestinations()){
			
			if (isLoggingDebug()) {
				logDebug("ACCL TAX PROCESSOR taxing a GROUP with amount : "	+ shippingDestination.getTaxableItemAmount() +shippingDestination.getShippingAddress().getPostalCode());
			}
			// TODO Change to repository lookup
			if(!StringUtils.isBlank(shippingDestination.getShippingAddress().getPostalCode())){
				rates = getTaxRates().getTaxRate(shippingDestination.getShippingAddress().getPostalCode());
			}
			
			taxAmount = (orderAmount) * rates / 100;
			
			retTaxStatus[i] = new MyStoreTaxStatus();
			retTaxStatus[i].setAmount(getPricingTools().round(taxAmount));
			retTaxStatus[i].setTransactionSuccess(true);
			i++;
		}
		
		return retTaxStatus;
	}

	public MystoreTaxRates getTaxRates() {
		return taxRates;
	}

	public void setTaxRates(MystoreTaxRates taxRates) {
		this.taxRates = taxRates;
	}

}
