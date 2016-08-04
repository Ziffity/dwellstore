package dwellCalculator;

import java.util.Locale;
import java.util.Map;

import atg.commerce.order.Order;
import atg.commerce.pricing.OrderPriceInfo;
import atg.commerce.pricing.PricingException;
import atg.commerce.pricing.PricingTools;
import atg.commerce.pricing.TaxPriceInfo;
import atg.commerce.pricing.TaxPricingCalculator;
import atg.nucleus.GenericService;
import atg.repository.RepositoryItem;
 
public class DwellTaxCalculator extends GenericService implements TaxPricingCalculator {
 
 PricingTools pricingTools;
 
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
  System.out.println("INSIDE PRICETAX" );
  
  double taxRate = 5;
  double orderAmount =0;
  double amount = 0;
  double taxAmount = 0;
  
  orderAmount = pOrder.getPriceInfo().getAmount();
  amount = orderAmount * taxRate/100;
  taxAmount = getPricingTools().round(amount);
  pPriceQuote.setAmount(taxAmount);
  
 }
}