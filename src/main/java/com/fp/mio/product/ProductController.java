package com.fp.mio.product;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductController {

	@RequestMapping(value = "/product.food", method = RequestMethod.GET)
	public String productAll(HttpServletRequest request) {
		request.setAttribute("contentPage", "product/food.jsp");
		return "index";
	}

}
