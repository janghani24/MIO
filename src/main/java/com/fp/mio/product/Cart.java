package com.fp.mio.product;

public class Cart {

	private int c_no;
	private int c_p_no;
	private String c_a_id;
	private int c_quantity;
	private String c_name;
	private int c_price;
	private String c_category;
	private String c_p_photo;
	
	public Cart() {
		// TODO Auto-generated constructor stub
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public int getC_p_no() {
		return c_p_no;
	}

	public void setC_p_no(int c_p_no) {
		this.c_p_no = c_p_no;
	}

	public String getC_a_id() {
		return c_a_id;
	}

	public void setC_a_id(String c_a_id) {
		this.c_a_id = c_a_id;
	}

	public int getC_quantity() {
		return c_quantity;
	}

	public void setC_quantity(int c_quantity) {
		this.c_quantity = c_quantity;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public int getC_price() {
		return c_price;
	}

	public void setC_price(int c_price) {
		this.c_price = c_price;
	}

	public String getC_category() {
		return c_category;
	}

	public void setC_category(String c_category) {
		this.c_category = c_category;
	}

	public String getC_p_photo() {
		return c_p_photo;
	}

	public void setC_p_photo(String c_p_photo) {
		this.c_p_photo = c_p_photo;
	}

	public Cart(int c_no, int c_p_no, String c_a_id, int c_quantity, String c_name, int c_price, String c_category,
			String c_p_photo) {
		super();
		this.c_no = c_no;
		this.c_p_no = c_p_no;
		this.c_a_id = c_a_id;
		this.c_quantity = c_quantity;
		this.c_name = c_name;
		this.c_price = c_price;
		this.c_category = c_category;
		this.c_p_photo = c_p_photo;
	}
	
	
	
	
	
}
