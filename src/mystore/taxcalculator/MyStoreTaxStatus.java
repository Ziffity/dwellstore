package mystore.taxcalculator;

import java.util.Date;

import atg.payment.tax.TaxStatus;

public class MyStoreTaxStatus implements TaxStatus{
	private static final long serialVersionUID = 1L;
	String mTransactionId;
	boolean mTransactionSuccess;
	String mErrorMessage;
	double mAmount;
	Date mTransactionTimestamp;
	double mCityTax;
	double mStateTax;
	double mCountyTax;
	double mCountryTax;
	double mDistrictTax;
	
	public String getTransactionId() {
		return mTransactionId;
	}
	public void setTransactionId(String mTransactionId) {
		this.mTransactionId = mTransactionId;
	}
	public boolean getTransactionSuccess() {
		return mTransactionSuccess;
	}
	public void setTransactionSuccess(boolean mTransactionSuccess) {
		this.mTransactionSuccess = mTransactionSuccess;
	}
	public String getErrorMessage() {
		return mErrorMessage;
	}
	public void setErrorMessage(String mErrorMessage) {
		this.mErrorMessage = mErrorMessage;
	}
	public double getAmount() {
		return mAmount;
	}
	public void setAmount(double mAmount) {
		this.mAmount = mAmount;
	}
	public Date getTransactionTimestamp() {
		return mTransactionTimestamp;
	}
	public void setTransactionTimestamp(Date mTransactionTimestamp) {
		this.mTransactionTimestamp = mTransactionTimestamp;
	}
	public double getCityTax() {
		return mCityTax;
	}
	public void setCityTax(double mCityTax) {
		this.mCityTax = mCityTax;
	}
	public double getStateTax() {
		return mStateTax;
	}
	public void setStateTax(double mStateTax) {
		this.mStateTax = mStateTax;
	}
	public double getCountyTax() {
		return mCountyTax;
	}
	public void setCountyTax(double mCountyTax) {
		this.mCountyTax = mCountyTax;
	}
	public double getCountryTax() {
		return mCountryTax;
	}
	public void setCountryTax(double mCountryTax) {
		this.mCountryTax = mCountryTax;
	}
	public double getDistrictTax() {
		return mDistrictTax;
	}
	public void setDistrictTax(double mDistrictTax) {
		this.mDistrictTax = mDistrictTax;
	}
	
	public MyStoreTaxStatus(){
		this.mAmount = 0.0D;
		this.mCityTax = 0.0D;
		this.mStateTax = 0.0D;
		this.mCountyTax = 0.0D;
		this.mCountryTax = 0.0D;
		this.mDistrictTax = 0.0D;
	}
	

}
