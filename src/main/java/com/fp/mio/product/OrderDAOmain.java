package com.fp.mio.product;

public class OrderDAOmain {

	private int orderItemId ;
	private String orderId;
	private int productId;
	private int productCount;
	private int productPrice;

    public OrderDAOmain() {
		// TODO Auto-generated constructor stub
	}

	public int getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(int orderItemId) {
		this.orderItemId = orderItemId;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
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

	public OrderDAOmain(int orderItemId, String orderId, int productId, int productCount, int productPrice) {
		super();
		this.orderItemId = orderItemId;
		this.orderId = orderId;
		this.productId = productId;
		this.productCount = productCount;
		this.productPrice = productPrice;
	}
    
    
}
