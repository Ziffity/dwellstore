package mystore.taxcalculator;

import atg.nucleus.GenericService;
import atg.repository.Repository;
import atg.repository.RepositoryItem;
import atg.repository.RepositoryException;

public class MystoreTaxRates extends GenericService{
	
	Repository mystoreTaxRepository;

	public Repository getMystoreTaxRepository() {
		return mystoreTaxRepository;
	}

	public void setMystoreTaxRepository(Repository mystoreTaxRepository) {
		this.mystoreTaxRepository = mystoreTaxRepository;
	}
	
	public double getTaxRate(String zipcode)
    {
		System.out.println("******Inside Tax Rate class");
		RepositoryItem item=null;
		double taxRates=0.0D;
		System.out.println("********taxRates1 :"+taxRates);
		try{
			
			item= getMystoreTaxRepository().getItem(zipcode,"dwelltaxPriceRate");
			System.out.println("********tax Item :"+item);
			if (item != null){
				taxRates=Double.parseDouble(item.getPropertyValue("taxRate").toString());
				System.out.println("********taxRates2 :"+taxRates);
			}
			else{
				return 0.0D;
			}
		} catch (RepositoryException e) {
			logError(e);
			System.out.println("******Repository Exception:"+e);
			
		}
		return taxRates;
    }

}
