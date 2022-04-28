package com.fp.mio.account;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.mio.product.ProductDAO;
import com.fp.mio.product.Zzim;

@Controller
public class AccountController {

	@Autowired
	private AccountDAO aDAO;
	@Autowired
	private ProductDAO pDAO;

	// 로그인페이지로
	@RequestMapping(value = "/account.login.go", method = RequestMethod.GET)
	public String goLogin(Account a, HttpServletRequest request) {
		request.setAttribute("contentPage", "account/login.jsp");
		return "index";
	}

	// 로그인
	@RequestMapping(value = "/account.login", method = RequestMethod.POST)
	public String login(Account account, HttpServletRequest request) {
		aDAO.login(account, request);
		String result = (String) request.getAttribute("result");
		if (result.equals("1") || result.equals("2")) {
			request.setAttribute("contentPage", "account/loginFail.jsp");
		} else {
			pDAO.getProductrandom(request);
			request.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}

	// 로그아웃
	@RequestMapping(value = "/account.logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		if (aDAO.loginCheck(request)) {
			aDAO.logout(request);
		}
		pDAO.getProductrandom(request);
		request.setAttribute("contentPage", "home.jsp");
		return "index";
	}

	// 페이지 이동(등급조정)
	@RequestMapping(value = "/account.paging", method = RequestMethod.GET)
	public String accountPageChange(HttpServletRequest request, AccountSelector accountSelector) {
		int p = Integer.parseInt(request.getParameter("p"));
		if(aDAO.loginCheck(request)){
		if (request.getParameter("search") != null) {
			aDAO.AccountSearch(accountSelector, request);
		}
		aDAO.getAllAccount(p, request);
		request.setAttribute("contentPage", "account/updateGrade.jsp");
		}
		return "index";
	}

	// 검색(등급조정)
	@RequestMapping(value = "/account.search", method = RequestMethod.GET)
	public String accountSearch(HttpServletRequest request, AccountSelector accountSelector) {
		aDAO.loginCheck(request);
		aDAO.AccountSearch(accountSelector, request);
		aDAO.getAllAccount(1, request);
		request.setAttribute("contentPage", "account/updateGrade.jsp");
		return "index";

	}

	// id 찾기 페이지로
	@RequestMapping(value = "/account.searchId.go", method = RequestMethod.GET)
	public String goSearchId(HttpServletRequest request) {
		request.setAttribute("contentPage", "account/searchId.jsp");
		return "index";
	}

	// id찾기 결과
	@RequestMapping(value = "/account.searchId", method = RequestMethod.GET)
	public String searchId(Account account, HttpServletRequest request) {
		aDAO.idSearch(account, request);
		request.setAttribute("contentPage", "account/searchIdResult.jsp");
		return "index";
	}

	// pw 찾기 페이지로
	@RequestMapping(value = "/account.searchPw.go", method = RequestMethod.GET)
	public String goSearchPw(HttpServletRequest request) {
		request.setAttribute("contentPage", "account/searchPw.jsp");
		return "index";
	}

	// pw찾기 결과
	@RequestMapping(value = "/account.searchPw", method = RequestMethod.GET)
	public String searchPw(Account account, HttpServletRequest request) {
		aDAO.pwSearch(account, request);
		request.setAttribute("contentPage", "account/searchPwResult.jsp");
		return "index";
	}

	// 회원 가입 유형선택 화면으로
	@RequestMapping(value = "/account.join.go", method = RequestMethod.GET)
	public String joinGo(HttpServletRequest request) {
		request.setAttribute("contentPage", "account/joinSelect.jsp");
		return "index";
	}

	// 일반 회원 가입 화면으로
	@RequestMapping(value = "/account.join.go.general", method = RequestMethod.GET)
	public String joinGoGeneral(HttpServletRequest request) {
		request.setAttribute("contentPage", "account/join_general.jsp");
		return "index";
	}

	// 판매자 회원 가입 화면으로
	@RequestMapping(value = "/account.join.go.seller", method = RequestMethod.GET)
	public String joinGoSeller(HttpServletRequest request) {
		request.setAttribute("contentPage", "account/join_seller.jsp");
		return "index";
	}

	// 회원 가입(일반)
	@RequestMapping(value = "/account.join.general", method = RequestMethod.POST)
	public String memberJoinGeneral(Account account, HttpServletRequest request) {
		aDAO.joinGeneral(account, request);
		pDAO.getProductrandom(request);
		request.setAttribute("contentPage", "home.jsp");
		return "index";
	}

	// 회원 가입(판매자)
	@RequestMapping(value = "/account.join.seller", method = RequestMethod.POST)
	public String memberJoinSeller(HttpServletRequest request, Seller seller) {
		aDAO.joinSeller(seller, request);
		request.setAttribute("contentPage", "account/sellerComplete.jsp");
		return "index";
	}

	// 마이페이지
	@RequestMapping(value = "/account.mypage", method = RequestMethod.GET)
	public String accountMypage(HttpServletRequest request) {
		if (aDAO.loginCheck(request)) {
			request.setAttribute("contentPage", "account/mypage.jsp");
		} else {
			pDAO.getProductrandom(request);
			request.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}

	// 내 정보페이지
	@RequestMapping(value = "/account.info", method = RequestMethod.GET)
	public String accountInfo(HttpServletRequest request) {
		if (aDAO.loginCheck(request)) {
			aDAO.splitAddr(request);
			request.setAttribute("contentPage", "account/info.jsp");
		} else {
			pDAO.getProductrandom(request);
			request.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}
	// 내 정보 수정 페이지로
	@RequestMapping(value = "/account.update.go", method = RequestMethod.GET)
	public String accountUpdateGo(Account account, HttpServletRequest request) {
		if (aDAO.loginCheck(request)) {
			aDAO.splitAddr(request);
			request.setAttribute("contentPage", "account/update.jsp");
		} else {
			pDAO.getProductrandom(request);
			request.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}

	// 내 정보 수정
	@RequestMapping(value = "/account.update", method = RequestMethod.POST)
	public String accountUpdate(Account account, HttpServletRequest request) {
		if (aDAO.loginCheck(request)) {
			aDAO.updateAccount(account, request);
			aDAO.splitAddr(request);
			request.setAttribute("contentPage", "account/info.jsp");
		} else {
			pDAO.getProductrandom(request);
			request.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}

	// 등급 조정
	@RequestMapping(value = "/account.updateGrade", method = RequestMethod.GET)
	public String updateGrade(Account account, HttpServletRequest request) {
		if (aDAO.loginCheck(request)) {
			aDAO.updateGrade(account, request);
			aDAO.getAllAccount(1, request);
			request.setAttribute("contentPage", "account/updateGrade.jsp");
		} else {
			pDAO.getProductrandom(request);
			request.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}

	// 등급 조정 페이지로
	@RequestMapping(value = "/account.updateGrade.go", method = RequestMethod.GET)
	public String gradeUpdateGo(HttpServletRequest request) {
		if (aDAO.loginCheck(request)) {
			SiteOption.clearSearch(request);
			aDAO.calcAllACount();
			aDAO.getAllAccount(1, request);
			request.setAttribute("contentPage", "account/updateGrade.jsp");
		} else {
			pDAO.getProductrandom(request);
			request.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}

	// 가입 승인 페이지로
	@RequestMapping(value = "/account.join.confirm.go", method = RequestMethod.GET)
	public String joinConfirmGo(HttpServletRequest request) {
		if (aDAO.loginCheck(request)) {
			aDAO.getSeller(request);
			request.setAttribute("contentPage", "account/joinConfirm.jsp");
		} else {
			pDAO.getProductrandom(request);
			request.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}
	
	// 판매자 상세 페이지로
	@RequestMapping(value = "/account.sellerDetail", method = RequestMethod.GET)
	public String sellerDetail(Seller seller, HttpServletRequest request) {
		if (aDAO.loginCheck(request)) {
			aDAO.getSellerById(seller, request);
			aDAO.splitAddr(request);
			request.setAttribute("contentPage", "account/sellerDetail.jsp");
		} else {
			pDAO.getProductrandom(request);
			request.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}
	// 판매자 승인
	@RequestMapping(value = "/account.sellerJoin.do", method = RequestMethod.GET)
	public String sellerJoin(Seller seller, HttpServletRequest request) {
		if (aDAO.loginCheck(request)) {
			aDAO.sellerToAccount(seller, request);
			aDAO.deleteSellerjoin(seller, request);
			aDAO.getSeller(request);
			request.setAttribute("contentPage", "account/joinConfirm.jsp");
		} else {
			pDAO.getProductrandom(request);
			request.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}

	// 판매자 거절
	@RequestMapping(value = "/account.sellerReject.do", method = RequestMethod.GET)
	public String sellerReject(Account account, Seller seller, HttpServletRequest request) {
		if (aDAO.loginCheck(request)) {
			aDAO.deletePhoto(seller, request);
			aDAO.deleteSellerjoin(seller, request);
			aDAO.getSeller(request);
			request.setAttribute("contentPage", "account/joinConfirm.jsp");
		} else {
			pDAO.getProductrandom(request);
			request.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}

	// 탈퇴
	@RequestMapping(value = "/account.delete", method = RequestMethod.GET)
	public String accountDelete(HttpServletRequest request) {
		if (aDAO.loginCheck(request)) {
			aDAO.deleteAccount(request);
			pDAO.getProductrandom(request);
			request.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}
	
	// id 중복체크
	@RequestMapping(value = "/account.idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("a_id") String a_id, HttpServletRequest request) {
		aDAO.loginCheck(request);
		return aDAO.idCheck(a_id, request);
	}

	// 탈퇴페이지로
	@RequestMapping(value = "/account.delete.go", method = RequestMethod.GET)
	public String accountDeleteGo(HttpServletRequest request) {
		if(aDAO.loginCheck(request)){
		request.setAttribute("contentPage", "account/deleteAccount.jsp");
		}else {
			request.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}

	// 찜사이트로 이동
	@RequestMapping(value = "account.Wishlist", method = RequestMethod.GET)
	public String accountWishlist(HttpServletRequest request) {
		pDAO.getAccount(request);
		if (aDAO.loginCheck(request)) {
			pDAO.showzzim(request); // 찜한거 보여주는기능
		}
		request.setAttribute("contentPage", "account/myZzim.jsp");
		return "index";
	}

	// 찜 삭제
	@RequestMapping(value = "account.deletezzim", method = RequestMethod.GET)
	public String accountdeletezzim(HttpServletRequest request, Zzim zzim) {
		aDAO.getAccount(request);
		if (aDAO.loginCheck(request)) {
			pDAO.deletezzim(zzim, request); // 찜한거 삭제하는기능
			pDAO.showzzim(request); // 찜한거 보여주는기능
		}
		request.setAttribute("contentPage", "account/myZzim.jsp");
		return "index";

	}
}
