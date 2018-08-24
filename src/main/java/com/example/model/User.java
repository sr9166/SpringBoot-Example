package com.example.model;

import java.util.ArrayList;

import org.springframework.data.annotation.Id;

public class User {
    @Id
    private String id;
    private String pw;
    private int age;
    private String name;
    
    public ArrayList<BuyList> buyList = new ArrayList<BuyList>();
    public ArrayList<BuyList> realbuyList = new ArrayList<BuyList>();
    
    public void addBuyList(BuyList m_buy) {
    	for(int i = 0; i < buyList.size(); i++) {
    		if(m_buy.getItemid().contentEquals(buyList.get(i).getItemid())) {
    			buyList.set(i, m_buy);
    			System.out.println("update item");
    			return;
    		}
    		else
    			continue;
    	}
    	System.out.println("add item");
    	buyList.add(m_buy);
    }
    
    public void deleteBuyList(String productId) {
    	for(int i = 0; i < buyList.size(); i++) {
    		if(productId.contentEquals(buyList.get(i).getItemid())) {
    			buyList.remove(i);
    			System.out.println("remove");
    			return;
    		}
    		else
    			continue;
    	}
    	System.out.println("not remove");
    	return;
    }
    
    public void purchaseBuyList() {
    	System.out.println("RealBuyList : " + realbuyList);
    	realbuyList.addAll(buyList);
    	System.out.println("RealBuyList : " + realbuyList);
    	System.out.println("BuyList : " + buyList);
    	buyList.clear();
    	System.out.println("BuyList : " + buyList);
    	System.out.println("purchase");
    	return;
    }
    
    public BuyList getBuyList(int index) {
    	return buyList.get(index);
    }
    
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
    
}