package com.fp.mio.account;

public class Account {
	private String a_id;
	private String a_pw;
	private String a_name;
	private String a_addr;
	private String a_phone;
	private String a_img;
	private String a_grade;
	private String a_question;
	private String a_answer;
	
	public Account() {
		// TODO Auto-generated constructor stub
	}

	public String getA_id() {
		return a_id;
	}

	public void setA_id(String a_id) {
		this.a_id = a_id;
	}

	public String getA_pw() {
		return a_pw;
	}

	public void setA_pw(String a_pw) {
		this.a_pw = a_pw;
	}

	public String getA_name() {
		return a_name;
	}

	public void setA_name(String a_name) {
		this.a_name = a_name;
	}

	public String getA_addr() {
		return a_addr;
	}

	public void setA_addr(String a_addr) {
		this.a_addr = a_addr;
	}

	public String getA_phone() {
		return a_phone;
	}

	public void setA_phone(String a_phone) {
		this.a_phone = a_phone;
	}

	public String getA_img() {
		return a_img;
	}

	public void setA_img(String a_img) {
		this.a_img = a_img;
	}

	public String getA_grade() {
		return a_grade;
	}

	public void setA_grade(String a_grade) {
		this.a_grade = a_grade;
	}

	public String getA_question() {
		return a_question;
	}

	public void setA_question(String a_question) {
		this.a_question = a_question;
	}

	public String getA_answer() {
		return a_answer;
	}

	public void setA_answer(String a_answer) {
		this.a_answer = a_answer;
	}

	public Account(String a_id, String a_pw, String a_name, String a_addr, String a_phone, String a_img, String a_grade,
			String a_question, String a_answer) {
		super();
		this.a_id = a_id;
		this.a_pw = a_pw;
		this.a_name = a_name;
		this.a_addr = a_addr;
		this.a_phone = a_phone;
		this.a_img = a_img;
		this.a_grade = a_grade;
		this.a_question = a_question;
		this.a_answer = a_answer;
	}
	
	
	
}
