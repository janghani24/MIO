package com.fp.mio.product;

import java.util.Date;

public class OrderDAO {

	
	 	private String orderId;   		//주문
	    private String memberId;	//주문자
	    private int productId;  	//제품고유넘버
	    private int productCount;  
	    private int productPrice;  
	    private String memberAddr1;
	    private String memberAddr2;
	    private String orderState;
	    private Date orderDate;

	    private String p_category1;
		private String p_photo;
	  
public OrderDAO() {
	// TODO Auto-generated constructor stub
}

public String getOrderId() {
	return orderId;
}

public void setOrderId(String orderId) {
	this.orderId = orderId;
}

public String getMemberId() {
	return memberId;
}

public void setMemberId(String memberId) {
	this.memberId = memberId;
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

public int getProductPrice() {
	return productPrice;
}

public void setProductPrice(int productPrice) {
	this.productPrice = productPrice;
}

public String getMemberAddr1() {
	return memberAddr1;
}

public void setMemberAddr1(String memberAddr1) {
	this.memberAddr1 = memberAddr1;
}

public String getMemberAddr2() {
	return memberAddr2;
}

public void setMemberAddr2(String memberAddr2) {
	this.memberAddr2 = memberAddr2;
}

public String getOrderState() {
	return orderState;
}

public void setOrderState(String orderState) {
	this.orderState = orderState;
}

public Date getOrderDate() {
	return orderDate;
}

public void setOrderDate(Date orderDate) {
	this.orderDate = orderDate;
}

public String getP_category1() {
	return p_category1;
}

public void setP_category1(String p_category1) {
	this.p_category1 = p_category1;
}

public String getP_photo() {
	return p_photo;
}

public void setP_photo(String p_photo) {
	this.p_photo = p_photo;
}

public OrderDAO(String orderId, String memberId, int productId, int productCount, int productPrice, String memberAddr1,
		String memberAddr2, String orderState, Date orderDate, String p_category1, String p_photo) {
	super();
	this.orderId = orderId;
	this.memberId = memberId;
	this.productId = productId;
	this.productCount = productCount;
	this.productPrice = productPrice;
	this.memberAddr1 = memberAddr1;
	this.memberAddr2 = memberAddr2;
	this.orderState = orderState;
	this.orderDate = orderDate;
	this.p_category1 = p_category1;
	this.p_photo = p_photo;
}






	
}