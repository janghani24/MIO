package com.fp.mio.community;

import java.math.BigDecimal;

import java.util.Date;

public class Communityre {
	
	private BigDecimal	r_no ;
	private String r_c_no;
	private String r_owner ;
	private String r_txt ;
	private Date r_when;
	
	public Communityre() {
		// TODO Auto-generated constructor stub
	}

	public Communityre(BigDecimal r_no, String r_c_no, String r_owner, String r_txt, Date r_when) {
		super();
		this.r_no = r_no;
		this.r_c_no = r_c_no;
		this.r_owner = r_owner;
		this.r_txt = r_txt;
		this.r_when = r_when;
	}

	public BigDecimal getR_no() {
		return r_no;
	}

	public void setR_no(BigDecimal r_no) {
		this.r_no = r_no;
	}

	public String getR_c_no() {
		return r_c_no;
	}

	public void setR_c_no(String r_c_no) {
		this.r_c_no = r_c_no;
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

	public Date getR_when() {
		return r_when;
	}

	public void setR_when(Date r_when) {
		this.r_when = r_when;
	}
	
	
	
}

