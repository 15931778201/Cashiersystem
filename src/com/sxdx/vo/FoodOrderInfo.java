package com.sxdx.vo;

public class FoodOrderInfo {
	private String customerName;
	private String address;
	private String telephone;
	private double totalPrice;
	private String state;
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getstate() {
		return state;
	}
	public void setstate(String state) {
		this.state = state;
	}
	public FoodOrderInfo(String customerName, String address,
			 String telephone, double totalPrice, String state) {
		super();
		this.customerName = customerName;
		this.address = address;
		this.telephone = telephone;
		this.totalPrice = totalPrice;
		this.state= state;
	}

}
