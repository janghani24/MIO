package com.fp.mio.product;

import java.util.Date;

public class Product {
	
	private int p_num;
	private String p_owner;
	private String p_name;
	private int p_price;
	private String p_brand;
	private String p_photo;
	private String p_content;
	private int p_quantity;
	private String p_category1;
	private String p_category2;
	private Date p_date;
	
public Product() {
	// TODO Auto-generated constructor stub
}

public int getP_num() {
	return p_num;
}

public void setP_num(int p_num) {
	this.p_num = p_num;
}

public String getP_owner() {
	return p_owner;
}

public void setP_owner(String p_owner) {
	this.p_owner = p_owner;
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

public String getP_brand() {
	return p_brand;
}

public void setP_brand(String p_brand) {
	this.p_brand = p_brand;
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

public int getP_quantity() {
	return p_quantity;
}

public void setP_quantity(int p_quantity) {
	this.p_quantity = p_quantity;
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

public Product(int p_num, String p_owner, String p_name, int p_price, String p_brand, String p_photo, String p_content,
		int p_quantity, String p_category1, String p_category2, Date p_date) {
	super();
	this.p_num = p_num;
	this.p_owner = p_owner;
	this.p_name = p_name;
	this.p_price = p_price;
	this.p_brand = p_brand;
	this.p_photo = p_photo;
	this.p_content = p_content;
	this.p_quantity = p_quantity;
	this.p_category1 = p_category1;
	this.p_category2 = p_category2;
	this.p_date = p_date;
}





}
