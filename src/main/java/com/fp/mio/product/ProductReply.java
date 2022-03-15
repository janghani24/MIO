package com.fp.mio.product;

import java.math.BigDecimal;
import java.util.Date;

public class ProductReply {

	private BigDecimal r_no;
	private int r_p_no;
	private String r_owner;
	private String r_txt;
	private BigDecimal r_rate;
	private Date r_date;

	public ProductReply() {
		// TODO Auto-generated constructor stub
	}

	public BigDecimal getR_no() {
		return r_no;
	}

	public void setR_no(BigDecimal r_no) {
		this.r_no = r_no;
	}

	public int getR_p_no() {
		return r_p_no;
	}

	public void setR_p_no(int r_p_no) {
		this.r_p_no = r_p_no;
	}

	public String getR_owner() {
		return r_owner;
	}

	public void setR_owner(String r_owner) {
		this.r_owner = r_owner;
	}

	public String getR_txt() {
		return r_txt;
	}

	public void setR_txt(String r_txt) {
		this.r_txt = r_txt;
	}

	public BigDecimal getR_rate() {
		return r_rate;
	}

	public void setR_rate(BigDecimal r_rate) {
		this.r_rate = r_rate;
	}

	public Date getR_date() {
		return r_date;
	}

	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}

	public ProductReply(BigDecimal r_no, int r_p_no, String r_owner, String r_txt, BigDecimal r_rate, Date r_date) {
		super();
		this.r_no = r_no;
		this.r_p_no = r_p_no;
		this.r_owner = r_owner;
		this.r_txt = r_txt;
		this.r_rate = r_rate;
		this.r_date = r_date;
	}
	
	
}