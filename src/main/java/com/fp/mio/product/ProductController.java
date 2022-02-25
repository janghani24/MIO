package com.fp.mio.product;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import jdk.internal.org.jline.utils.Log;

@Controller
public class ProductController {

	@Autowired
	private ProductDAO pDAO;

	// food 카테고리로 이동
	@RequestMapping(value = "/product.food.all", method = RequestMethod.GET)
	public String food(HttpServletRequest request) {

		pDAO.getFood(request);

		request.setAttribute("contentPage", "product/food.jsp");
		return "index";
	}

	// fashion 카테고리로 이동
	@RequestMapping(value = "/product.fashion.all", method = RequestMethod.GET)
	public String fashion(HttpServletRequest request) {

		pDAO.getFashion(request);

		request.setAttribute("contentPage", "product/fashion.jsp");
		return "index";
	}

	// beauty 카테고리로 이동
	@RequestMapping(value = "/product.beauty.all", method = RequestMethod.GET)
	public String beauty(HttpServletRequest request) {

		pDAO.getBeauty(request);

		request.setAttribute("contentPage", "product/beauty.jsp");
		return "index";
	}

	// living 카테고리로 이동
	@RequestMapping(value = "/product.living.all", method = RequestMethod.GET)
	public String living(HttpServletRequest request) {

		pDAO.getLiving(request);

		request.setAttribute("contentPage", "product/living.jsp");
		return "index";
	}

	// 상품 하위 카테고리로 이동
	@RequestMapping(value = "/product.food.category", method = RequestMethod.GET)
	public String foodCategory(HttpServletRequest request, String p_category) {

		String p_category2 = request.getParameter("p_category");
		pDAO.getProductCategory(request, p_category2);

		request.setAttribute("contentPage", "product/food.jsp");

		return "index";

	}
	
	@RequestMapping(value = "/product.fashion.category", method = RequestMethod.GET)
	public String fashionCategory(HttpServletRequest request, String p_category) {

		String p_category2 = request.getParameter("p_category");
		pDAO.getProductCategory(request, p_category2);

		request.setAttribute("contentPage", "product/fashion.jsp");

		return "index";

	}
	
	@RequestMapping(value = "/product.beauty.category", method = RequestMethod.GET)
	public String beautyCategory(HttpServletRequest request, String p_category) {

		String p_category2 = request.getParameter("p_category");
		pDAO.getProductCategory(request, p_category2);

		request.setAttribute("contentPage", "product/beauty.jsp");

		return "index";

	}
	
	@RequestMapping(value = "/product.living.category", method = RequestMethod.GET)
	public String livingCategory(HttpServletRequest request, String p_category) {

		String p_category2 = request.getParameter("p_category");
		pDAO.getProductCategory(request, p_category2);

		request.setAttribute("contentPage", "product/living.jsp");

		return "index";

	}

	// 상품 상세 페이지로 이동
	@RequestMapping(value = "/product.detail", method = RequestMethod.GET)
	public String productDetail(HttpServletRequest request, Product product, int p_num) {

		pDAO.getProductDetail(request, product, p_num);

		request.setAttribute("detail", pDAO.getProductDetail(request, product, p_num));
		request.setAttribute("contentPage", "product/productDetail.jsp");
		return "index";

	}

}
