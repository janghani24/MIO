package com.fp.mio.funding;

import java.util.Date;

public class Funding {

	private int f_num;
	private String f_owner;
	private String f_photo;
	private String f_name;
	private String f_company;
	private String f_category;
	private Date f_period;
	private String f_url;

	public Funding() {
		// TODO Auto-generated constructor stub
	}

	public int getF_num() {
		return f_num;
	}

	public void setF_num(int f_num) {
		this.f_num = f_num;
	}

	public String getF_owner() {
		return f_owner;
	}

	public void setF_owner(String f_owner) {
		this.f_owner = f_owner;
	}

	public String getF_photo() {
		return f_photo;
	}

	public void setF_photo(String f_photo) {
		this.f_photo = f_photo;
	}

	public String getF_name() {
		return f_name;
	}

	public void setF_name(String f_name) {
		this.f_name = f_name;
	}

	public String getF_company() {
		return f_company;
	}

	public void setF_company(String f_company) {
		this.f_company = f_company;
	}

	public String getF_category() {
		return f_category;
	}

	public void setF_category(String f_category) {
		this.f_category = f_category;
	}

	public Date getF_period() {
		return f_period;
	}

	public void setF_period(Date f_period) {
		this.f_period = f_period;
	}

	public String getF_url() {
		return f_url;
	}

	public void setF_url(String f_url) {
		this.f_url = f_url;
	}

	public Funding(int f_num, String f_owner, String f_photo, String f_name, String f_company, String f_category,
			Date f_period, String f_url) {
		super();
		this.f_num = f_num;
		this.f_owner = f_owner;
		this.f_photo = f_photo;
		this.f_name = f_name;
		this.f_company = f_company;
		this.f_category = f_category;
		this.f_period = f_period;
		this.f_url = f_url;
	}
	

}
