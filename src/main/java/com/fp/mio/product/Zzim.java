package com.fp.mio.product;

import java.math.BigDecimal;

public class Zzim {
	
	private BigDecimal p_no;
	private String p_num;
	private String p_id;
	
public Zzim() {
	// TODO Auto-generated constructor stub
}

public Zzim(BigDecimal p_no, String p_num, String p_id) {
	super();
	this.p_no = p_no;
	this.p_num = p_num;
	this.p_id = p_id;
}

public BigDecimal getP_no() {
	return p_no;
}

public void setP_no(BigDecimal p_no) {
	this.p_no = p_no;
}

public String getP_num() {
	return p_num;
}

public void setP_num(String p_num) {
	this.p_num = p_num;
}

public String getP_id() {
	return p_id;
}

public void setP_id(String p_id) {
	this.p_id = p_id;
}



}
