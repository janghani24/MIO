package com.fp.mio.product;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fp.mio.account.AccountDAO;

@Controller
public class ProductController {

	@Autowired
	private ProductDAO pDAO;

	@Autowired
	private AccountDAO aDAO;

	// 상품 전체 조회
	@RequestMapping(value = "/product.all", method = RequestMethod.GET)
	public String productAll(HttpServletRequest request) {

		pDAO.getProductAll(request);

		request.setAttribute("contentPage", "product/productAll.jsp");
		return "index";
	}

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

	// food 하위 카테고리로 이동
	@RequestMapping(value = "/product.food.category", method = RequestMethod.GET)
	public String foodCategory(HttpServletRequest request, String p_category) {

		String p_category2 = request.getParameter("p_category");
		pDAO.getProductCategory(request, p_category2);

		request.setAttribute("contentPage", "product/food.jsp");

		return "index";

	}

	// fashion 하위 카테고리로 이동
	@RequestMapping(value = "/product.fashion.category", method = RequestMethod.GET)
	public String fashionCategory(HttpServletRequest request, String p_category) {

		String p_category2 = request.getParameter("p_category");
		pDAO.getProductCategory(request, p_category2);

		request.setAttribute("contentPage", "product/fashion.jsp");

		return "index";

	}

	// beauty 하위 카테고리로 이동
	@RequestMapping(value = "/product.beauty.category", method = RequestMethod.GET)
	public String beautyCategory(HttpServletRequest request, String p_category) {

		String p_category2 = request.getParameter("p_category");
		pDAO.getProductCategory(request, p_category2);

		request.setAttribute("contentPage", "product/beauty.jsp");

		return "index";

	}

	// living 하위 카테고리로 이동
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

		pDAO.getReply(product, request);
		pDAO.getProductDetail(request, product, p_num);

		pDAO.getAccount(request);
		if (aDAO.loginCheck(request)) {

			pDAO.showzzim(request); // 찜한거 보여주는기능

		}

		request.setAttribute("detail", pDAO.getProductDetail(request, product, p_num));
		request.setAttribute("contentPage", "product/productDetail.jsp");
		return "index";

	}

	// 찜 페이지
	@RequestMapping(value = "/product.zzim", method = RequestMethod.GET)
	public String productzzim(HttpServletRequest request, Product product, int p_num, Zzim zzim) {

		if (aDAO.loginCheck(request)) {

			pDAO.getProductzzim(request, zzim); // 찜하는기능
		}

//		pDAO.getProductDetail(request, product, p_num);

		request.setAttribute("detail", pDAO.getProductDetail(request, product, p_num));
		request.setAttribute("contentPage", "product/productDetail.jsp");
		return "index";
	}


	//전체 상품 검색 페이지로 이동

	@RequestMapping(value = "/product.search", method = RequestMethod.GET)
	public String productSearch(HttpServletRequest request, Product p) {

		pDAO.productSearch(request, p);

		request.setAttribute("contentPage", "product/productSearch.jsp");
		return "index";

	}

	// 댓글
	@RequestMapping(value = "/product.reply.write", method = RequestMethod.GET)
	public String productReplyWrite(ProductReply pr, HttpServletRequest req, Product product) {
		com.fp.mio.TokenMaker.make(req);
		// int p = Integer.parseInt(req.getParameter("p"));
		if (aDAO.loginCheck(req)) {
			pDAO.writeReply(pr, product, req);
			pDAO.getReply(product, req);
			req.setAttribute("detail", pDAO.getProductDetailRp(req, product));
		}

		req.setAttribute("contentPage", "product/productDetail.jsp");
		return "index";
	}
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

	// fashion 등록 페이지
	@RequestMapping(value = "/product.fashionReg", method = RequestMethod.GET)
	public String fashionReg(HttpServletRequest request) {

		request.setAttribute("contentPage", "product/fashionReg.jsp");
		return "index";
	}

	// 뷰티 등록 페이지
	@RequestMapping(value = "/product.beautyReg", method = RequestMethod.GET)
	public String beautyReg(HttpServletRequest request) {

		request.setAttribute("contentPage", "product/beautyReg.jsp");
		return "index";
	}

	// living 등록 페이지
	@RequestMapping(value = "/product.livingReg", method = RequestMethod.GET)
	public String livingReg(HttpServletRequest request) {

		request.setAttribute("contentPage", "product/livingReg.jsp");
		return "index";
	}

}
