package com.fp.mio;

import javax.servlet.http.HttpServletRequest;


import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fp.mio.community.CommunityDAO;
import com.fp.mio.product.ProductDAO;


@Controller
public class HomeController {
	
private boolean firstreq;
	
	public HomeController() {
			firstreq = true;
	}
	
	@Autowired
	private CommunityDAO cDAO;
	
	@Autowired
	private ProductDAO pDAO;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)

	public String home(HttpServletRequest req) {
		
		if(true) {
			cDAO.getAllMsgCount();
			firstreq =false;
		}
		pDAO.getProductrandom(req);
		req.setAttribute("contentPage", "home.jsp");
		req.setAttribute("loginPage", "login.jsp");

		return "index";
	}
	
}
