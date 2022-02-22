package com.fp.mio.account;

public class Seller {
private String a_s_id;
private String s_pw;
private String s_name;
private String s_addr;
private String s_phone;
private String s_img;
private String s_grade;
private String s_question;
private String s_answer;
private String s_intro;
private String s_sellsort;

public Seller() {
	// TODO Auto-generated constructor stub
}

public String getA_s_id() {
	return a_s_id;
}

public void setA_s_id(String a_s_id) {
	this.a_s_id = a_s_id;
}

public String getS_pw() {
	return s_pw;
}

public void setS_pw(String s_pw) {
	this.s_pw = s_pw;
}

public String getS_name() {
	return s_name;
}

public void setS_name(String s_name) {
	this.s_name = s_name;
}

public String getS_addr() {
	return s_addr;
}

public void setS_addr(String s_addr) {
	this.s_addr = s_addr;
}

public String getS_phone() {
	return s_phone;
}

public void setS_phone(String s_phone) {
	this.s_phone = s_phone;
}

public String getS_img() {
	return s_img;
}

public void setS_img(String s_img) {
	this.s_img = s_img;
}

public String getS_grade() {
	return s_grade;
}

public void setS_grade(String s_grade) {
	this.s_grade = s_grade;
}

public String getS_question() {
	return s_question;
}

public void setS_question(String s_question) {
	this.s_question = s_question;
}

public String getS_answer() {
	return s_answer;
}

public void setS_answer(String s_answer) {
	this.s_answer = s_answer;
}

public String getS_intro() {
	return s_intro;
}

public void setS_intro(String s_intro) {
	this.s_intro = s_intro;
}

public String getS_sellsort() {
	return s_sellsort;
}

public void setS_sellsort(String s_sellsort) {
	this.s_sellsort = s_sellsort;
}

public Seller(String a_s_id, String s_pw, String s_name, String s_addr, String s_phone, String s_img, String s_grade,
		String s_question, String s_answer, String s_intro, String s_sellsort) {
	super();
	this.a_s_id = a_s_id;
	this.s_pw = s_pw;
	this.s_name = s_name;
	this.s_addr = s_addr;
	this.s_phone = s_phone;
	this.s_img = s_img;
	this.s_grade = s_grade;
	this.s_question = s_question;
	this.s_answer = s_answer;
	this.s_intro = s_intro;
	this.s_sellsort = s_sellsort;
}


}
