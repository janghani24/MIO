package com.fp.mio.funding;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FundingController {
	

	@Autowired
	private FundingDAO fDAO;
	
	// 상품 전체 조회 
		@RequestMapping(value = "/funding.all", method = RequestMethod.GET)
		public String productAll(HttpServletRequest request) {

			fDAO.getFundingAll(request);

			request.setAttribute("contentPage", "funding/fundingAll.jsp");
			return "index";
		}
	

}
