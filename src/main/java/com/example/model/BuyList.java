package com.example.model;

public class BuyList {
	String itemid;
	int amount;
	String name;
	String encodedString;
	int price;
	
	public String getItemid() {
		return itemid;
	}
	public void setItemid(String itemid) {
		this.itemid = itemid;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEncodedString() {
		return encodedString;
	}
	public void setEncodedString(String encodedString) {
		this.encodedString = encodedString;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}
