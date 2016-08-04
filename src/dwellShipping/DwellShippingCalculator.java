package dwellShipping;

import java.util.List;
import atg.commerce.order.HardgoodShippingGroup;
import atg.commerce.order.Order;
import atg.commerce.order.ShippingGroup;
import atg.commerce.pricing.ShippingCalculatorImpl;
import atg.commerce.pricing.ShippingPriceInfo;
import atg.nucleus.GenericService;
import atg.repository.RepositoryException;
import atg.repository.RepositoryItem;

public class DwellShippingCalculator extends ShippingCalculatorImpl{
	
	@Override
	public void priceShippingPriceInfo(double pAmount, ShippingPriceInfo pPriceQuote) 
	{
		pPriceQuote.setAmount(pAmount);
	}
}
