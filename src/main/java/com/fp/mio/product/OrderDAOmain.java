package com.fp.mio.product;

import java.util.List;

public class OrderDAOmain {

	
	private List<OrderDAO> orders;

	public List<OrderDAO> getOrders() {
		return orders;
	}

	public void setOrders(List<OrderDAO> orders) {
		this.orders = orders;
	}

	public OrderDAOmain(List<OrderDAO> orders) {
		super();
		this.orders = orders;
	}

	@Override
	public String toString() {
		return "OrderDAOmain [orders=" + orders + "]";
	}
	
}
