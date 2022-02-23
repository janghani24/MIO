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

	// food 카테고리로
	@RequestMapping(value = "/product.food.all", method = RequestMethod.GET)
	public String food(HttpServletRequest request) {

		pDAO.getFood(request);

		request.setAttribute("contentPage", "product/food.jsp");
		return "index";
	}

	// fashion 카테고리로
	@RequestMapping(value = "/product.fashion.all", method = RequestMethod.GET)
	public String fashion(HttpServletRequest request) {

		pDAO.getFashion(request);

		request.setAttribute("contentPage", "product/fashion.jsp");
		return "index";
	}

	// beauty 카테고리로
	@RequestMapping(value = "/product.beauty.all", method = RequestMethod.GET)
	public String beauty(HttpServletRequest request) {

		pDAO.getBeauty(request);

		request.setAttribute("contentPage", "product/beauty.jsp");
		return "index";
	}

	// living 카테고리로
	@RequestMapping(value = "/product.living.all", method = RequestMethod.GET)
	public String living(HttpServletRequest request) {

		pDAO.getLiving(request);

		request.setAttribute("contentPage", "product/living.jsp");
		return "index";
	}

}
