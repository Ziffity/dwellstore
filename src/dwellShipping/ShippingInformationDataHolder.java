package dwellShipping;

import java.util.Map;

import atg.nucleus.GenericService;

public class ShippingInformationDataHolder extends GenericService{
  
	private String postalcode;
	private Map<String,Double> estimatedShippingMethods;
	private Double price;
	
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getPostalcode() {
		return postalcode;
	}
	public void setPostalcode(String postalcode) {
		this.postalcode = postalcode;
	}
	public Map<String, Double> getEstimatedShippingMethods() {
		return estimatedShippingMethods;
	}
	public void setEstimatedShippingMethods(
			Map<String, Double> shippingMethods) {
		this.estimatedShippingMethods = shippingMethods;
	}
}