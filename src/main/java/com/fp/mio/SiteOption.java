package com.fp.mio;

import javax.servlet.http.HttpServletRequest;

public class SiteOption {

	private int replyCountPerpage;	// 쓴 페이지당 개수
	
	public SiteOption() {
		// TODO Auto-generated constructor stub
	}

	public int getReplyCountPerpage() {
		return replyCountPerpage;
	}
	public int getProductCountPerpage() {
		return replyCountPerpage;
	}

	public void setReplyCountPerpage(int replyCountPerpage) {
		this.replyCountPerpage = replyCountPerpage;
	}

	public SiteOption(int replyCountPerpage) {
		super();
		this.replyCountPerpage = replyCountPerpage;
	}

	public static void clearSearch(HttpServletRequest req) {
		req.getSession().setAttribute("search", null);

	}
	
	
	
	
	
	
}
