package com.fp.mio.account;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.mio.product.Product;
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
	public String goLogin(Account a, HttpServletRequest req) {
		
		aDAO.loginCheck(req);
		req.setAttribute("contentPage", "account/login.jsp");
		return "index";
	}
	
	// 로그인
	@RequestMapping(value = "/account.login", method = RequestMethod.POST)
	public String login(Account a, HttpServletRequest req) {
		
		aDAO.login(a, req);
		aDAO.loginCheck(req);
		String result = (String)req.getAttribute("result");
		if(result.equals("1")||result.equals("2")) {
			req.setAttribute("contentPage", "account/loginFail.jsp");
		}else {

			pDAO.getProductrandom(req);
		req.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}
	
	// 로그아웃
	@RequestMapping(value = "/account.logout", method = RequestMethod.GET)
	public String logout(Account a, HttpServletRequest req) {

		aDAO.logout(req);
		aDAO.loginCheck(req);
		pDAO.getProductrandom(req);
		req.setAttribute("contentPage", "home.jsp");
		return "index";
	}
	
	//페이지 이동(등급조정)
	@RequestMapping(value = "/account.paging", method = RequestMethod.GET)
	public String accountPageChange(HttpServletRequest request,AccountSelector as) {
		int p = Integer.parseInt(request.getParameter("p"));
		aDAO.loginCheck(request);
		if (request.getParameter("search")!=null) {
			aDAO.AccountSearch(as, request);
		}
		aDAO.getAllAccount(p, request);
		request.setAttribute("contentPage", "account/updateGrade.jsp");
		return "index";
	}
	
	//검색(등급조정)
	@RequestMapping(value = "/account.search", method = RequestMethod.GET)
	public String accountSearch(HttpServletRequest request, AccountSelector as) {

		aDAO.loginCheck(request);
		aDAO.AccountSearch(as, request);
		aDAO.getAllAccount(1, request);

		request.setAttribute("contentPage", "account/updateGrade.jsp");
		return "index";

	}
		
	// id 찾기 페이지로	
	@RequestMapping(value = "/account.searchId.go", method = RequestMethod.GET)
	public String goSearchId(HttpServletRequest req) {
		
		aDAO.loginCheck(req);
		req.setAttribute("contentPage", "account/searchId.jsp");
		return "index";
	}
	
	// id찾기 결과
	@RequestMapping(value = "/account.searchId", method = RequestMethod.GET)
	public String searchId(Account a, HttpServletRequest req) {
		
		aDAO.loginCheck(req);
		aDAO.idSearch(a,req);
		req.setAttribute("contentPage", "account/searchIdResult.jsp");
		return "index";
	}
	
	// pw 찾기 페이지로
	@RequestMapping(value = "/account.searchPw.go", method = RequestMethod.GET)
	public String goSearchPw(HttpServletRequest req) {
		
		aDAO.loginCheck(req);
		req.setAttribute("contentPage", "account/searchPw.jsp");
		return "index";
	}
	
	// pw찾기 결과
	@RequestMapping(value = "/account.searchPw", method = RequestMethod.GET)
	public String searchPw(Account a, HttpServletRequest req) {
	
		aDAO.loginCheck(req);
		aDAO.pwSearch(a,req);
		req.setAttribute("contentPage", "account/searchPwResult.jsp");
		return "index";
	}
	
	//회원 가입 유형선택 화면으로
	@RequestMapping(value = "/account.join.go", method = RequestMethod.GET)
	public String joinGo(HttpServletRequest req) {
	
		aDAO.loginCheck(req);
		req.setAttribute("contentPage", "account/joinSelect.jsp");
		return "index";
	}
	
	//일반 회원 가입 화면으로
	@RequestMapping(value = "/account.join.go.general", method = RequestMethod.GET)
	public String joinGoGeneral(HttpServletRequest req) {
		
		aDAO.loginCheck(req);
		req.setAttribute("contentPage", "account/join_general.jsp");
		return "index";
	}
	
	//판매자 회원 가입 화면으로
	@RequestMapping(value = "/account.join.go.seller", method = RequestMethod.GET)
	public String joinGoSeller(HttpServletRequest req) {
		
		aDAO.loginCheck(req);
		req.setAttribute("contentPage", "account/join_seller.jsp");
		return "index";
	}

	// 회원 가입(일반)
	@RequestMapping(value = "/account.join.general", method = RequestMethod.POST)
	public String memberJoinGeneral(Account a, HttpServletRequest req) {
		
		aDAO.loginCheck(req);
		
		aDAO.joinGeneral(a,req);
		pDAO.getProductrandom(req);
		req.setAttribute("contentPage", "home.jsp");
		
		return "index";
	}
	
	// 회원 가입(판매자)
	@RequestMapping(value = "/account.join.seller", method = RequestMethod.POST)
	public String memberJoinSeller(HttpServletRequest req, Seller s) {
		
		aDAO.loginCheck(req);
		
		aDAO.joinSeller(s, req);
		req.setAttribute("contentPage", "account/sellerComplete.jsp");
		
		return "index";
	}
	
	// 마이페이지
	@RequestMapping(value = "/account.mypage", method = RequestMethod.GET)
	public String accountMypage(HttpServletRequest req) {
		
		if (aDAO.loginCheck(req)) {
			req.setAttribute("contentPage", "account/mypage.jsp");
		} else {
			pDAO.getProductrandom(req);
			req.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}
	
	// 내 정보페이지
	@RequestMapping(value = "/account.info", method = RequestMethod.GET)
	public String accountInfo(HttpServletRequest req) {
		
		if (aDAO.loginCheck(req)) {
			aDAO.splitAddr(req);
			req.setAttribute("contentPage", "account/info.jsp");
		} else {
			pDAO.getProductrandom(req);
			req.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}

	// 내 정보 수정 페이지로
	@RequestMapping(value = "/account.update.go", method = RequestMethod.GET)
	public String accountUpdateGo(Account a, HttpServletRequest req) {
		
		if (aDAO.loginCheck(req)) {
			aDAO.splitAddr(req);
			req.setAttribute("contentPage", "account/update.jsp");
		} else {
			pDAO.getProductrandom(req);
			req.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}
	
	// 내 정보 수정
	@RequestMapping(value = "/account.update", method = RequestMethod.POST)
	public String accountUpdate(Account a, HttpServletRequest req) {
		
		if (aDAO.loginCheck(req)) {
			aDAO.updateAccount(a, req);
			aDAO.splitAddr(req);
			req.setAttribute("contentPage", "account/info.jsp");
		} else {
			pDAO.getProductrandom(req);
			req.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}
	
	// 등급 조정
	@RequestMapping(value = "/account.updategrade", method = RequestMethod.GET)
	public String gradeUpdate(Account a, HttpServletRequest req) {
		if (aDAO.loginCheck(req)) {
			aDAO.updateGrade(a,req);
			aDAO.getAllAccount(1, req);
			req.setAttribute("contentPage", "account/updateGrade.jsp");
		} else {
			pDAO.getProductrandom(req);
			req.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}
	
	// 등급 조정 페이지로
	@RequestMapping(value = "/account.updategrade.go", method = RequestMethod.GET)
	public String gradeUpdateGo(HttpServletRequest req) {
		
		if (aDAO.loginCheck(req)) {
			aDAO.calcAllACount();
			aDAO.getAllAccount(1, req);
			req.setAttribute("contentPage", "account/updateGrade.jsp");
		} else {
			pDAO.getProductrandom(req);
			req.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}
	
	// 가입 승인 페이지로
	@RequestMapping(value = "/account.join.confirm.go", method = RequestMethod.GET)
	public String joinConfirmGo(HttpServletRequest req) {
		
		if (aDAO.loginCheck(req)) {
			aDAO.getSeller(req);
			req.setAttribute("contentPage", "account/joinConfirm.jsp");
		} else {
			pDAO.getProductrandom(req);
			req.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}
	
	// 판매자 상세 페이지로
	@RequestMapping(value = "/account.sellerDetail", method = RequestMethod.GET)
	public String sellerDetail(Seller s, HttpServletRequest req) {
		
		if (aDAO.loginCheck(req)) {
			aDAO.getSellerById(s,req);
			aDAO.splitAddr(req);
			req.setAttribute("contentPage", "account/sellerDetail.jsp");
		} else {
			pDAO.getProductrandom(req);
			req.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}
	
	// 판매자 승인
	@RequestMapping(value = "/account.sellerJoin.do", method = RequestMethod.GET)
	public String sellerJoin(Account a,Seller s, HttpServletRequest req) {
		
		if (aDAO.loginCheck(req)) {
			aDAO.sellerToAccount(a,s, req);
			aDAO.deleteSellerjoin(s, req);
			aDAO.getSeller(req);
			req.setAttribute("contentPage", "account/joinConfirm.jsp");
		} else {
			pDAO.getProductrandom(req);
			req.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}
	
	// 판매자 거절
	@RequestMapping(value = "/account.sellerReject.do", method = RequestMethod.GET)
	public String sellerReject(Account a,Seller s, HttpServletRequest req) {
		
		if (aDAO.loginCheck(req)) {
			aDAO.deleteSellerjoinPhoto(s, req);
			aDAO.getSeller(req);
			req.setAttribute("contentPage", "account/joinConfirm.jsp");
		} else {
			pDAO.getProductrandom(req);
			req.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}
	
	// 탈퇴
	@RequestMapping(value = "/account.delete", method = RequestMethod.GET)
	public String accountDelete(HttpServletRequest req) {
		
		if (aDAO.loginCheck(req)) {
			aDAO.deleteAccount(req);
			pDAO.getProductrandom(req);
				req.setAttribute("contentPage", "home.jsp");
			
		}
		return "index";
	}
	
	// id 중복체크
	@RequestMapping(value = "/account.idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("a_id") String a_id, HttpServletRequest req) {
		
		aDAO.loginCheck(req);	
		return aDAO.idCheck(a_id,req);
	}
	
	// 탈퇴페이지로
	@RequestMapping(value = "/account.delete.go", method = RequestMethod.GET)
	public String accountDeleteGo(HttpServletRequest req) {
		
		aDAO.loginCheck(req);
			
		req.setAttribute("contentPage", "account/deleteAccount.jsp");
		return "index";
	}
	
	//찜사이트로 이동
	@RequestMapping(value = "account.Wishlist", method = RequestMethod.GET)
	public String accountWishlist(HttpServletRequest req) {
		
		pDAO.getAccount(req);
		if (aDAO.loginCheck(req)) {
			
			pDAO.showzzim(req);	//찜한거 보여주는기능
			
		}
		
		req.setAttribute("contentPage", "account/myZzim.jsp");
		return "index";
	}
	
	// 찜 삭제
	@RequestMapping(value = "account.deletezzim", method = RequestMethod.GET)
	public String accountdeletezzim(HttpServletRequest req, Zzim zzim) {
			
		aDAO.getAccount(req);
				
		if (aDAO.loginCheck(req)) {
		pDAO.deletezzim(zzim, req);	//찜한거 삭제하는기능
		pDAO.showzzim(req);		//찜한거 보여주는기능
		}

		req.setAttribute("contentPage", "account/myZzim.jsp");
		return "index";

	}
		
}
