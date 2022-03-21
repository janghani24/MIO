package com.fp.mio.product;

public class ProductDetail {

	private int d_num;
	private int d_master_num;
	private String d_size;
	private String d_color;
	private int d_quantity;
	
	public ProductDetail() {
		// TODO Auto-generated constructor stub
	}

	public int getD_num() {
		return d_num;
	}

	public void setD_num(int d_num) {
		this.d_num = d_num;
	}

	public int getD_master_num() {
		return d_master_num;
	}

	public void setD_master_num(int d_master_num) {
		this.d_master_num = d_master_num;
	}

	public String getD_size() {
		return d_size;
	}

	public void setD_size(String d_size) {
		this.d_size = d_size;
	}

	public String getD_color() {
		return d_color;
	}

	public void setD_color(String d_color) {
		this.d_color = d_color;
	}

	public int getD_quantity() {
		return d_quantity;
	}

	public void setD_quantity(int d_quantity) {
		this.d_quantity = d_quantity;
	}

	public ProductDetail(int d_num, int d_master_num, String d_size, String d_color, int d_quantity) {
		super();
		this.d_num = d_num;
		this.d_master_num = d_master_num;
		this.d_size = d_size;
		this.d_color = d_color;
		this.d_quantity = d_quantity;
	}
	
	
}
