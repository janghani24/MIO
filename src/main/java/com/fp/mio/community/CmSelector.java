package com.fp.mio.community;

import java.math.BigDecimal;


public class CmSelector {

	private String search;
	private BigDecimal start;
	private BigDecimal end;
	
	public CmSelector() {
		// TODO Auto-generated constructor stub
	}

	public CmSelector(String search, BigDecimal start, BigDecimal end) {
		super();
		this.search = search;
		this.start = start;
		this.end = end;
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
	
	
	
	
	
}