package dwellShipping;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import atg.commerce.order.Order;
import atg.commerce.order.ShippingGroup;
import atg.commerce.pricing.PricingException;
import atg.commerce.pricing.ShippingPriceInfo;
import atg.commerce.pricing.ShippingPricingCalculator;
import atg.nucleus.GenericService;
import atg.repository.RepositoryItem;

public class DwellShippingCalculator extends GenericService implements ShippingPricingCalculator{

	Double amount;

	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	@Override
	public void getAvailableMethods(List arg0, ShippingGroup arg1,
			RepositoryItem arg2, Locale arg3, RepositoryItem arg4, Map arg5)
			throws PricingException {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void priceShippingGroup(Order arg0, ShippingPriceInfo arg1,
			ShippingGroup arg2, RepositoryItem arg3, Locale arg4,
			RepositoryItem arg5, Map arg6) throws PricingException {
		// TODO Auto-generated method stub
		System.out.println("*****INSIDE SHIPPING PRICE GROUP :" +getAmount());
		arg0.getPriceInfo().setShipping(getAmount());
		System.out.println("*****INSIDE SHIPPING PRICE GROUP :" +getAmount());
		arg1.setAmount(getAmount());
	}

	
	
}