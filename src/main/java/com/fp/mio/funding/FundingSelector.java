package com.fp.mio.funding;

import java.math.BigDecimal;

public class FundingSelector {

	private String search; 
	private BigDecimal start;
	private BigDecimal end;
	
	public FundingSelector() {
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

	public FundingSelector(String search, BigDecimal start, BigDecimal end) {
		super();
		this.search = search;
		this.start = start;
		this.end = end;
	} 
	
}
