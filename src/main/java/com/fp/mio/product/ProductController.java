package com.fp.mio.product;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fp.mio.account.AccountDAO;

@Controller
public class ProductController {

	private boolean firstReqP;
	public ProductController() {
		firstReqP = true;
	}
	
	@Autowired
	private ProductDAO pDAO;

	@Autowired
	private AccountDAO aDAO;

	// 상품 전체 조회
	@RequestMapping(value = "/product.all", method = RequestMethod.GET)
	public String productAll(HttpServletRequest request) {
		aDAO.loginCheck(request);
		if(firstReqP) {
		pDAO.calcAllPCount();
		firstReqP = false;
		}
		pDAO.getProduct(1, request);
		request.setAttribute("contentPage", "product/productAll.jsp");
		return "index";
	}

	
	//페이징
	@RequestMapping(value = "/product.paging", method = RequestMethod.GET)
	public String snsPageChange(HttpServletRequest request) {
		int p = Integer.parseInt(request.getParameter("p"));
		aDAO.loginCheck(request);
		pDAO.getProduct(p, request);
		request.setAttribute("contentPage", "product/productAll.jsp");
		return "index";
	}
	
	
	
	// 해당 카테고리로
	@RequestMapping(value = "/product.category", method = RequestMethod.GET)
	public String categoryGo(HttpServletRequest request,ProductCSelector pcs) {
		String p_category1=request.getParameter("p_category1");
		pDAO.calcAllCPCount(request);
		pDAO.getCategoryProduct(1, request);
		if (p_category1.equals("food")) {
			request.setAttribute("contentPage", "product/food.jsp");
		}else if(p_category1.equals("fashion")) {
			request.setAttribute("contentPage", "product/fashion.jsp");
		}else if(p_category1.equals("beauty")) {
			request.setAttribute("contentPage", "product/beauty.jsp");
		}else if(p_category1.equals("living")) {
			request.setAttribute("contentPage", "product/living.jsp");
		}
		return "index";
	}
	// 카테고리 안에서 페이징
	@RequestMapping(value = "/product.category.paging", method = RequestMethod.GET)
	public String categoryPageChange(HttpServletRequest request) {
		String p_category1=request.getParameter("p_category1");
		String p_category2=request.getParameter("p_category2");
		request.setAttribute("p_category2", p_category2);
		int p = Integer.parseInt(request.getParameter("p"));
		aDAO.loginCheck(request);
		if (p_category2 == ""||p_category2==null) {
			pDAO.calcAllCPCount(request);
			pDAO.getCategoryProduct(p, request);
		}else {
			pDAO.calcAllC2PCount(request);
			pDAO.getCategory2Product(p, request);
		}
		if (p_category1.equals("food")) {
			request.setAttribute("contentPage", "product/food.jsp");
		}else if(p_category1.equals("fashion")) {
			request.setAttribute("contentPage", "product/fashion.jsp");
		}else if(p_category1.equals("beauty")) {
			request.setAttribute("contentPage", "product/beauty.jsp");
		}else if(p_category1.equals("living")) {
			request.setAttribute("contentPage", "product/living.jsp");
		}
		return "index";
	}

	
	// 카테고리 하위로 이동
	@RequestMapping(value = "/product.category.category2", method = RequestMethod.GET)
	public String livingCategory(HttpServletRequest request, String p_category) {
		pDAO.calcAllC2PCount(request);
		String p_category1 = request.getParameter("p_category1");
		String p_category2 = request.getParameter("p_category2");
		pDAO.getCategory2Product(1, request);
		request.setAttribute("p_category2", p_category2);
		if (p_category1.equals("food")) {
			request.setAttribute("contentPage", "product/food.jsp");
		}else if(p_category1.equals("fashion")) {
			request.setAttribute("contentPage", "product/fashion.jsp");
		}else if(p_category1.equals("beauty")) {
			request.setAttribute("contentPage", "product/beauty.jsp");
		}else if(p_category1.equals("living")) {
			request.setAttribute("contentPage", "product/living.jsp");
		}

		return "index";

	}
	
	

	// 상품 상세 페이지로 이동
	@RequestMapping(value = "/product.detail", method = RequestMethod.GET)
	public String productDetail(HttpServletRequest request, Product product) {

		pDAO.getReply(product, request);

		pDAO.getProductDetail(request, product);

		pDAO.getAccount(request);
		if (aDAO.loginCheck(request)) {

			pDAO.showzzim(request); // 찜한거 보여주는기능

		}

		request.setAttribute("detail", pDAO.getProductDetail(request, product));
		request.setAttribute("contentPage", "product/productDetail.jsp");
		return "index";

	}

	// 찜 페이지
	@RequestMapping(value = "/product.zzim", method = RequestMethod.GET)
	public String productzzim(HttpServletRequest request, Product product, Zzim zzim) {

		if (aDAO.loginCheck(request)) {

			pDAO.getProductzzim(request, zzim); // 찜하는기능
		}

//		pDAO.getProductDetail(request, product, p_num);

		request.setAttribute("detail", pDAO.getProductDetail(request, product));
		request.setAttribute("contentPage", "product/productDetail.jsp");
		return "index";
	}

	// 전체 상품 검색 페이지



	//전체 상품 검색 페이지로 이동

	@RequestMapping(value = "/product.search", method = RequestMethod.GET)
	public String productSearch(HttpServletRequest request, ProductSelector ps) {

		
		com.fp.mio.TokenMaker.make(request);
		aDAO.loginCheck(request);
		pDAO.productSearch(ps, request);
		pDAO.getProduct(1, request);

		request.setAttribute("contentPage", "product/productSearch.jsp");
		return "index";

	}

	// 댓글
	@RequestMapping(value = "/product.reply.write", method = RequestMethod.GET)
	public String productReplyWrite(ProductReply pr, HttpServletRequest req, Product product) {
		com.fp.mio.TokenMaker.make(req);
		if (aDAO.loginCheck(req)) {
			pDAO.writeReply(pr, product, req);
			pDAO.getReply(product, req);
			req.setAttribute("detail", pDAO.getProductDetailRp(req, product));
		}

		req.setAttribute("contentPage", "product/productDetail.jsp");
		return "index";
	}

	
	//댓글 삭제
	@RequestMapping(value = "/product.reply.delete", method = RequestMethod.GET)
	public String productReplyDelete(ProductReply pr, HttpServletRequest req, Product product) {
		com.fp.mio.TokenMaker.make(req);
		// int p = Integer.parseInt(req.getParameter("p"));
		if (aDAO.loginCheck(req)) {
			pDAO.deleteReply(pr,req);
			pDAO.getReply(product, req);
			req.setAttribute("detail", pDAO.getProductDetailRp(req, product));
		}
		
		req.setAttribute("contentPage", "product/productDetail.jsp");
		return "index";
	}


	// 상품 등록 선택 페이지

	@RequestMapping(value = "/product.reg.select", method = RequestMethod.GET)
	public String regSelect(HttpServletRequest request, String search) {

		request.setAttribute("contentPage", "product/productRegSelect.jsp");
		return "index";

	}

	// 상품 삭제
	@RequestMapping(value = "/product.deleteProduct", method = RequestMethod.GET)
	public String deleteProduct(HttpServletRequest request, Product p) {
		if (aDAO.loginCheck(request)) {
		pDAO.deleteProduct(request,p);
		}
		pDAO.getProduct(1, request);
		request.setAttribute("contentPage", "product/productAll.jsp");
		return "index";
		
	}
	
	// 장바구니 넣기
	@RequestMapping(value = "/product.insert.cart", method = RequestMethod.GET)
	public String insertCart(HttpServletRequest request, Cart c, Product p) {
		if (aDAO.loginCheck(request)) {
			pDAO.insertCart(c,request,p);
			pDAO.getReply(p, request);
			request.setAttribute("detail", pDAO.getProductDetailRp(request, p));
		}
		request.setAttribute("contentPage", "product/productDetail.jsp");
		return "index";
		
	}
	
	// 장바구니로 이동
		@RequestMapping(value = "/product.go.cart", method = RequestMethod.GET)
		public String goCart(HttpServletRequest request) {
			pDAO.getCart(request);
			request.setAttribute("contentPage", "product/cart.jsp");
			return "index";
		}
		
	// 장바구니에서 삭제
		@RequestMapping(value = "/product.delete.cart", method = RequestMethod.GET)
		public String deleteCart(HttpServletRequest request,Cart c) {
			pDAO.deleteCart(request,c);
			pDAO.getCart(request);
			request.setAttribute("contentPage", "product/cart.jsp");
			return "index";
		}
		
	// 장바구니 수량 수정
		@RequestMapping(value = "/product.update.cart", method = RequestMethod.GET)
		public String updateCart(HttpServletRequest request,Cart c) {
			pDAO.updateCart(request,c);
			pDAO.getCart(request);
			request.setAttribute("contentPage", "product/cart.jsp");
			return "index";
		}

	// food 등록 페이지
	@RequestMapping(value = "/product.foodReg", method = RequestMethod.GET)
	public String foodReg(HttpServletRequest request) {

		request.setAttribute("contentPage", "product/foodReg.jsp");
		return "index";
	}

	// food 등록하기
	@RequestMapping(value = "/food.reg", method = RequestMethod.POST)
	public String foodRegPage(HttpServletRequest request, Product product) {

		pDAO.regFood(request, product);
		pDAO.getCategoryProduct(1, request);
		request.setAttribute("contentPage", "product/food.jsp");

		return "index";
	}

	// fashion 등록 페이지
	@RequestMapping(value = "/product.fashionReg", method = RequestMethod.GET)
	public String fashionReg(HttpServletRequest request) {

		request.setAttribute("contentPage", "product/fashionReg.jsp");
		return "index";
	}

	// fashion 등록하기
		@RequestMapping(value = "/fashion.reg", method = RequestMethod.POST)
		public String fahionRegPage(HttpServletRequest request, Product product,ProductDetail pd) {

			pDAO.regFashion(request, product,pd);
			pDAO.getCategoryProduct(1, request);
			request.setAttribute("contentPage", "product/fashion.jsp");

			return "index";
		}
	
	
	// beauty 등록 페이지
	@RequestMapping(value = "/product.beautyReg", method = RequestMethod.GET)
	public String beautyReg(HttpServletRequest request) {

		request.setAttribute("contentPage", "product/beautyReg.jsp");
		return "index";
	}

	// beauty 등록하기
	@RequestMapping(value = "/beauty.reg", method = RequestMethod.POST)
	public String beautyRegPage(HttpServletRequest request, Product product) {

		pDAO.regBeauty(request, product);
		pDAO.getCategoryProduct(1, request);
		request.setAttribute("contentPage", "product/beauty.jsp");

		return "index";
	}

	// living 등록 페이지
	@RequestMapping(value = "/product.livingReg", method = RequestMethod.GET)
	public String livingReg(HttpServletRequest request) {

		request.setAttribute("contentPage", "product/livingReg.jsp");
		return "index";
	}

	// living 등록하기
	@RequestMapping(value = "/living.reg", method = RequestMethod.POST)
	public String livingRegPage(HttpServletRequest request, Product product) {

		pDAO.regLiving(request, product);
		pDAO.getCategoryProduct(1, request);
		request.setAttribute("contentPage", "product/living.jsp");

		return "index";
	}

}
