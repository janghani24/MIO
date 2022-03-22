package com.fp.mio.product;

public class OrderDAO {

	
	 	private int productId;
	    
	    private int productCount;
	    
	    
	    private String p_name;
	    
	    private int p_price;
	    
	    private int salePrice;
	    
	    private int totalPrice;
	    
public OrderDAO() {
	// TODO Auto-generated constructor stub
}

public int getProductId() {
	return productId;
}

public void setProductId(int productId) {
	this.productId = productId;
}

public int getProductCount() {
	return productCount;
}

public void setProductCount(int productCount) {
	this.productCount = productCount;
}

public String getP_name() {
	return p_name;
}

public void setP_name(String p_name) {
	this.p_name = p_name;
}

public int getP_price() {
	return p_price;
}

public void setP_price(int p_price) {
	this.p_price = p_price;
}

public int getSalePrice() {
	return salePrice;
}

public void setSalePrice(int salePrice) {
	this.salePrice = salePrice;
}

public int getTotalPrice() {
	return totalPrice;
}

public void setTotalPrice(int totalPrice) {
	this.totalPrice = totalPrice;
}

public OrderDAO(int productId, int productCount, String p_name, int p_price, int salePrice, int totalPrice) {
	super();
	this.productId = productId;
	this.productCount = productCount;
	this.p_name = p_name;
	this.p_price = p_price;
	this.salePrice = salePrice;
	this.totalPrice = totalPrice;
}


public void initSaleTotal() {
	
	this.totalPrice = this.salePrice*this.productCount;
	
}

@Override
public String toString() {
	return "OrderDAO [productId=" + productId + ", productCount=" + productCount + ", p_name=" + p_name + ", p_price="
			+ p_price + ", salePrice=" + salePrice + ", totalPrice=" + totalPrice + "]";
}

	
}