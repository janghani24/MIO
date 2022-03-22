package com.fp.mio.community;

import java.util.Date;


import java.util.List;

public class CommunityMsg {

	private int c_no;
	private String c_owner;
	private String c_txt;
	private Date c_date;
	
	private String m_photo;
	private List<Communityre> c_re;

	public CommunityMsg() {
		// TODO Auto-generated constructor stub
	}

	public CommunityMsg(int c_no, String c_owner, String c_txt, Date c_date, String m_photo, List<Communityre> c_re) {
		super();
		this.c_no = c_no;
		this.c_owner = c_owner;
		this.c_txt = c_txt;
		this.c_date = c_date;
		this.m_photo = m_photo;
		this.c_re = c_re;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public String getC_owner() {
		return c_owner;
	}

	public void setC_owner(String c_owner) {
		this.c_owner = c_owner;
	}

	public String getC_txt() {
		return c_txt;
	}

	public void setC_txt(String c_txt) {
		this.c_txt = c_txt;
	}

	public Date getC_date() {
		return c_date;
	}

	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}

	public String getM_photo() {
		return m_photo;
	}

	public void setM_photo(String m_photo) {
		this.m_photo = m_photo;
	}

	public List<Communityre> getC_re() {
		return c_re;
	}

	public void setC_re(List<Communityre> c_re) {
		this.c_re = c_re;
	}
	
	}
	

