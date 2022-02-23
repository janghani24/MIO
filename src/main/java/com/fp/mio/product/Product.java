package com.fp.mio.product;

import java.util.Date;

public class Product {
	
	private int p_num;
	private String p_name;
	private int p_price;
	private String p_photo;
	private String p_content;
	private String p_category1;
	private String p_category2;
	private Date p_date;
	
public Product() {
	// TODO Auto-generated constructor stub
}

public Product(int p_num, String p_name, int p_price, String p_photo, String p_content, String p_category1,
		String p_category2, Date p_date) {
	super();
	this.p_num = p_num;
	this.p_name = p_name;
	this.p_price = p_price;
	this.p_photo = p_photo;
	this.p_content = p_content;
	this.p_category1 = p_category1;
	this.p_category2 = p_category2;
	this.p_date = p_date;
}



public int getP_price() {
	return p_price;
}

public void setP_price(int p_price) {
	this.p_price = p_price;
}

public int getP_num() {
	return p_num;
}

public void setP_num(int p_num) {
	this.p_num = p_num;
}

public String getP_name() {
	return p_name;
}

public void setP_name(String p_name) {
	this.p_name = p_name;
}

public String getP_photo() {
	return p_photo;
}

public void setP_photo(String p_photo) {
	this.p_photo = p_photo;
}

public String getP_content() {
	return p_content;
}

public void setP_content(String p_content) {
	this.p_content = p_content;
}

public String getP_category1() {
	return p_category1;
}

public void setP_category1(String p_category1) {
	this.p_category1 = p_category1;
}

public String getP_category2() {
	return p_category2;
}

public void setP_category2(String p_category2) {
	this.p_category2 = p_category2;
}

public Date getP_date() {
	return p_date;
}

public void setP_date(Date p_date) {
	this.p_date = p_date;
}



}
