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
	
	
	@RequestMapping(value = "/account.login.go", method = RequestMethod.GET)
	public String goLogin(Account a, HttpServletRequest req) {
		
		// 로그인페이지로
		aDAO.loginCheck(req);
		req.setAttribute("contentPage", "account/login.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/account.login", method = RequestMethod.POST)
	public String home(Account a, HttpServletRequest req) {
		
		// 로그인
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
	
	
	@RequestMapping(value = "/account.logout", method = RequestMethod.GET)
	public String logout(Account a, HttpServletRequest req) {
		// 로그 아웃
		aDAO.logout(req);
		aDAO.loginCheck(req);
		pDAO.getProductrandom(req);
		req.setAttribute("contentPage", "home.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/account.searchId.go", method = RequestMethod.GET)
	public String goSearchId(HttpServletRequest req) {
		
		// id 찾기 페이지로
		aDAO.loginCheck(req);
		req.setAttribute("contentPage", "account/searchId.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/account.searchId", method = RequestMethod.GET)
	public String searchId(Account a, HttpServletRequest req) {
		
		// id찾기 결과
		aDAO.loginCheck(req);
		aDAO.idSearch(a,req);
		req.setAttribute("contentPage", "account/searchIdResult.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/account.searchPw.go", method = RequestMethod.GET)
	public String goSearchPw(HttpServletRequest req) {
		
		// pw 찾기 페이지로
		aDAO.loginCheck(req);
		req.setAttribute("contentPage", "account/searchPw.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/account.searchPw", method = RequestMethod.GET)
	public String searchPw(Account a, HttpServletRequest req) {
		
		// pw찾기 결과
		aDAO.loginCheck(req);
		aDAO.pwSearch(a,req);
		req.setAttribute("contentPage", "account/searchPwResult.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/account.join.go", method = RequestMethod.GET)
	public String JoinGo(HttpServletRequest req) {
		//회원 가입 유형선택 화면으로
		aDAO.loginCheck(req);
		req.setAttribute("contentPage", "account/joinSelect.jsp");
		return "index";
	}
	
	
	@RequestMapping(value = "/account.join.go.general", method = RequestMethod.GET)
	public String JoinGoGeneral(HttpServletRequest req) {
		//일반 회원 가입 화면으로
		aDAO.loginCheck(req);
		req.setAttribute("contentPage", "account/join_general.jsp");
		return "index";
	}
	
	
	@RequestMapping(value = "/account.join.go.seller", method = RequestMethod.GET)
	public String JoinGoSeller(HttpServletRequest req) {
		//판매자 회원 가입 화면으로
		aDAO.loginCheck(req);
		req.setAttribute("contentPage", "account/join_seller.jsp");
		return "index";
	}


	@RequestMapping(value = "/account.join.general", method = RequestMethod.POST)
	public String memberJoinGeneral(Account a, HttpServletRequest req) {
		// 회원 가입(일반)
		
		aDAO.loginCheck(req);
		
			aDAO.joinGeneral(a,req);
			req.setAttribute("contentPage", "home.jsp");
		
		return "index";
	}
	
	@RequestMapping(value = "/account.join.seller", method = RequestMethod.POST)
	public String memberJoinSeller(HttpServletRequest req, Seller s) {
		// 회원 가입(판매자)
		//가입,신청 완료 페이지 만들기
		
		aDAO.loginCheck(req);
		
		aDAO.joinSeller(s, req);
		req.setAttribute("contentPage", "account/sellerComplete.jsp");
		
		return "index";
	}

	@RequestMapping(value = "/account.mypage", method = RequestMethod.GET)
	public String AccountMypage(HttpServletRequest req) {
		// 마이페이지
		if (aDAO.loginCheck(req)) {
			req.setAttribute("contentPage", "account/mypage.jsp");
		} else {
			req.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}
	@RequestMapping(value = "/account.info", method = RequestMethod.GET)
	public String AccountInfo(HttpServletRequest req) {
		// 내 정보페이지
		if (aDAO.loginCheck(req)) {
			aDAO.splitAddr(req);
			req.setAttribute("contentPage", "account/info.jsp");
		} else {
			req.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}

	@RequestMapping(value = "/account.update.go", method = RequestMethod.GET)
	public String AccountUpdateGo(Account a, HttpServletRequest req) {
		// 내 정보 수정 페이지로
		if (aDAO.loginCheck(req)) {
			aDAO.splitAddr(req);
			req.setAttribute("contentPage", "account/update.jsp");
		} else {
			req.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}
	@RequestMapping(value = "/account.update", method = RequestMethod.POST)
	public String AccountUpdate(Account a, HttpServletRequest req) {
		// 내 정보 수정
		if (aDAO.loginCheck(req)) {
			aDAO.updateAccount(a, req);
			aDAO.splitAddr(req);
			req.setAttribute("contentPage", "account/info.jsp");
		} else {
			req.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}
	
	@RequestMapping(value = "/account.updategrade", method = RequestMethod.GET)
	public String GradeUpdate(Account a, HttpServletRequest req) {
		if (aDAO.loginCheck(req)) {
			aDAO.updateGrade(a,req);
			// jsp 수정 필요 - 관리자의 등급 조정 페이지 생성
			aDAO.getAccount(req);
			req.setAttribute("contentPage", "account/updateGrade.jsp");
		} else {
			req.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}
	@RequestMapping(value = "/account.updategrade.go", method = RequestMethod.GET)
	public String GradeUpdateGo(HttpServletRequest req) {
		// 등급 조정 페이지로
		if (aDAO.loginCheck(req)) {
			aDAO.getAccount(req);
			req.setAttribute("contentPage", "account/updateGrade.jsp");
		} else {
			req.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}
	@RequestMapping(value = "/account.join.confirm.go", method = RequestMethod.GET)
	public String JoinConfirmGo(HttpServletRequest req) {
		// 가입 승인 페이지로
		if (aDAO.loginCheck(req)) {
			aDAO.getSeller(req);
			req.setAttribute("contentPage", "account/joinConfirm.jsp");
		} else {
			req.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}
	@RequestMapping(value = "/account.sellerDetail", method = RequestMethod.GET)
	public String SellerDetail(Seller s, HttpServletRequest req) {
		// 판매자 상세 페이지로
		if (aDAO.loginCheck(req)) {
			aDAO.getSellerById(s,req);
			aDAO.splitAddr(req);
			req.setAttribute("contentPage", "account/sellerDetail.jsp");
		} else {
			req.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}
	@RequestMapping(value = "/account.sellerJoin.do", method = RequestMethod.GET)
	public String SellerJoin(Account a,Seller s, HttpServletRequest req) {
		// 판매자 승인
		if (aDAO.loginCheck(req)) {
			aDAO.sellerToAccount(a,s, req);
			aDAO.deleteSellerjoin(s, req);
			aDAO.getSeller(req);
			req.setAttribute("contentPage", "account/joinConfirm.jsp");
		} else {
			req.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}
	
	@RequestMapping(value = "/account.sellerReject.do", method = RequestMethod.GET)
	public String SellerReject(Account a,Seller s, HttpServletRequest req) {
		// 판매자 거절
		if (aDAO.loginCheck(req)) {
			aDAO.deleteSellerjoin(s, req);
			aDAO.getSeller(req);
			req.setAttribute("contentPage", "account/joinConfirm.jsp");
		} else {
			req.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}
	
	
	
	@RequestMapping(value = "/account.delete", method = RequestMethod.GET)
	public String AccountDelete(HttpServletRequest req) {
		// 탈퇴
		if (aDAO.loginCheck(req)) {
			aDAO.deleteAccount(req);
		}
		req.setAttribute("contentPage", "home.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/account.idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int IdCheck(@RequestParam("a_id") String a_id, HttpServletRequest req) {
		// id 중복체크
		aDAO.loginCheck(req);
		
		
		return aDAO.idCheck(a_id,req);
	}
	
	@RequestMapping(value = "/account.delete.go", method = RequestMethod.GET)
	public String AccountDeleteGo(HttpServletRequest req) {
		// 탈퇴페이지로
		aDAO.loginCheck(req);
			
		
		req.setAttribute("contentPage", "account/deleteAccount.jsp");
		return "index";
	}
	
	//찜사이트로 이동
	@RequestMapping(value = "account.Wishlist", method = RequestMethod.GET)
	public String AccountWishlist(HttpServletRequest req) {
		
		pDAO.getAccount(req);
		if (aDAO.loginCheck(req)) {
			
			pDAO.showzzim(req);	//찜한거 보여주는기능
			
		
		}
		
		req.setAttribute("contentPage", "account/myZzim.jsp");
		return "index";
	}
	
	// 찜 삭제
		@RequestMapping(value = "account.deletezzim", method = RequestMethod.GET)
		public String Accountdeletezzim(HttpServletRequest req, Zzim zzim) {
			
			aDAO.getAccount(req);
			
		
			
			if (aDAO.loginCheck(req)) {
			pDAO.deletezzim(zzim, req);	//찜한거 삭제하는기능
				pDAO.showzzim(req);		//찜한거 보여주는기능
			}

			req.setAttribute("contentPage", "account/myZzim.jsp");
			return "index";

		}
	
		//찜삭제 2 해결함
		@RequestMapping(value = "account.deletezzim2", method = RequestMethod.GET)
		public String Accountdeletezzim2(HttpServletRequest req,Zzim zzim,Product p) {
			
			aDAO.getAccount(req);
				
			if (aDAO.loginCheck(req)) {
				pDAO.deletezzim(zzim, req);	//찜한거 삭제하는기능
				
			}
			System.out.println(p.getP_num());
			req.setAttribute("detail", pDAO.getProductDetail(req, p));
			req.setAttribute("contentPage", "product/productDetail.jsp");
			return "index";
		}


		
		
		
		


		
				
		
		
		
		
}
