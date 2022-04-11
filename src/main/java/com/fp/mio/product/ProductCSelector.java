package com.fp.mio.product;

import java.math.BigDecimal;

public class ProductCSelector {

	private String search; 
	private BigDecimal start;
	private BigDecimal end;
	private String p_category1;
	
	 public ProductCSelector() {
		// TODO Auto-generated constructor stub
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public BigDecimal getStart() {
		return start;
	}

	public void setStart(BigDecimal start) {
		this.start = start;
	}

	public BigDecimal getEnd() {
		return end;
	}

	public void setEnd(BigDecimal end) {
		this.end = end;
	}

	public String getP_category1() {
		return p_category1;
	}

	public void setP_category1(String p_category1) {
		this.p_category1 = p_category1;
	}

	public ProductCSelector(String search, BigDecimal start, BigDecimal end, String p_category1) {
		super();
		this.search = search;
		this.start = start;
		this.end = end;
		this.p_category1 = p_category1;
	}
	 
	 
}
