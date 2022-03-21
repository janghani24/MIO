package com.fp.mio.product;

import java.math.BigDecimal;
import java.util.Date;

public class Zzim {
	
	private BigDecimal z_no;
    private String z_num;
    private String z_id;
    private int p_num;
    private String p_name;
    private int p_price;
    private String p_brand;
    private String p_photo;
    private String p_content;
    private String p_category1;
    private String p_category2;
    private Date p_date;
    private String a_id;
    
    public Zzim() {
		// TODO Auto-generated constructor stub
	}

	public BigDecimal getZ_no() {
		return z_no;
	}

	public void setZ_no(BigDecimal z_no) {
		this.z_no = z_no;
	}

	public String getZ_num() {
		return z_num;
	}

	public void setZ_num(String z_num) {
		this.z_num = z_num;
	}

	public String getZ_id() {
		return z_id;
	}

	public void setZ_id(String z_id) {
		this.z_id = z_id;
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

	public String getA_id() {
		return a_id;
	}

	public void setA_id(String a_id) {
		this.a_id = a_id;
	}

	public Zzim(BigDecimal z_no, String z_num, String z_id, int p_num, String p_name, int p_price, String p_brand,
			String p_photo, String p_content, String p_category1, String p_category2, Date p_date, String a_id) {
		super();
		this.z_no = z_no;
		this.z_num = z_num;
		this.z_id = z_id;
		this.p_num = p_num;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_brand = p_brand;
		this.p_photo = p_photo;
		this.p_content = p_content;
		this.p_category1 = p_category1;
		this.p_category2 = p_category2;
		this.p_date = p_date;
		this.a_id = a_id;
	}
    
}
	
