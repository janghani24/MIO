package com.fp.mio.product;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductController {
	
	@Autowired
	private ProductDAO pDAO;

	@RequestMapping(value = "/product.food.all", method = RequestMethod.GET)
	public String food(HttpServletRequest request) {
		
		pDAO.getFood(request);
		
		request.setAttribute("contentPage", "product/food.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/product.fashion.all", method = RequestMethod.GET)
	public String fashion(HttpServletRequest request) {
		
		pDAO.getFashion(request);
		
		request.setAttribute("contentPage", "product/fashion.jsp");
		return "index";
	}

}
