package com.fp.mio.account;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AccountController {

	@Autowired 
	private AccountDAO aDAO;
	
	
	@RequestMapping(value = "account.login", method = RequestMethod.POST)
	public String home(Account a, HttpServletRequest req) {
		
		// 로그인
		aDAO.login(a, req);
		aDAO.loginCheck(req);
		req.setAttribute("contentPage", "home.jsp");
		return "index";
	}
	
	
	@RequestMapping(value = "account.logout", method = RequestMethod.GET)
	public String logout(Account a, HttpServletRequest req) {
		// 로그 아웃
		aDAO.logout(req);
		aDAO.loginCheck(req);
		req.setAttribute("contentPage", "home.jsp");
		return "index";
	}
	
	
	@RequestMapping(value = "account.join.go", method = RequestMethod.GET)
	public String JoinGo(HttpServletRequest req) {
		//회원 가입 유형선택 화면으로
		aDAO.loginCheck(req);
		req.setAttribute("contentPage", "account/joinSelect.jsp");
		return "index";
	}
	
	
	@RequestMapping(value = "account.join.go.general", method = RequestMethod.GET)
	public String JoinGoGeneral(HttpServletRequest req) {
		//일반 회원 가입 화면으로
		aDAO.loginCheck(req);
		req.setAttribute("contentPage", "account/join_general.jsp");
		return "index";
	}
	
	
	@RequestMapping(value = "account.join.go.seller", method = RequestMethod.GET)
	public String JoinGoSeller(HttpServletRequest req) {
		//판매자 회원 가입 화면으로
		aDAO.loginCheck(req);
		req.setAttribute("contentPage", "account/join_seller.jsp");
		return "index";
	}


	@RequestMapping(value = "account.join", method = RequestMethod.POST)
	public String memberJoin(Account a, HttpServletRequest req, Seller s) {
		// 회원 가입
		//가입,신청 완료 페이지 만들기
		aDAO.loginCheck(req);
		if (req.getParameter("a_grade").equals("seller")) {
			aDAO.joinSeller(s,req);
			req.setAttribute("contentPage", "home.jsp");
		}else {
			aDAO.joinGeneral(a,req);
			req.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}

	@RequestMapping(value = "account.mypage", method = RequestMethod.GET)
	public String AccountMypage(HttpServletRequest req) {
		// 마이페이지
		if (aDAO.loginCheck(req)) {
			req.setAttribute("contentPage", "account/mypage.jsp");
		} else {
			req.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}
	@RequestMapping(value = "account.info", method = RequestMethod.GET)
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

	@RequestMapping(value = "account.update.go", method = RequestMethod.POST)
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
	@RequestMapping(value = "account.update", method = RequestMethod.POST)
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
	@RequestMapping(value = "account.updategrade", method = RequestMethod.GET)
	public String GradeUpdate(Account a, HttpServletRequest req) {
		if (aDAO.loginCheck(req)) {
			aDAO.updateGrade(a, req);
			// jsp 수정 필요 - 관리자의 등급 조정 페이지 생성
			req.setAttribute("contentPage", "account/updateGrade.jsp");
		} else {
			req.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}
	@RequestMapping(value = "account.updategrade.go", method = RequestMethod.POST)
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
	@RequestMapping(value = "account.join.confirm.go", method = RequestMethod.POST)
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
	@RequestMapping(value = "account.sellerDetail", method = RequestMethod.POST)
	public String SellerDetail(Seller s, HttpServletRequest req) {
		// 판매자 상세 페이지로
		if (aDAO.loginCheck(req)) {
			aDAO.getSellerById(s,req);
			req.setAttribute("contentPage", "account/sellerDetail.jsp");
		} else {
			req.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}
	@RequestMapping(value = "account.sellerJoin.do", method = RequestMethod.POST)
	public String SellerJoin(Seller s, HttpServletRequest req) {
		// 판매자 승인
		if (aDAO.loginCheck(req)) {
			aDAO.sellerToAccount(s, req);
			req.setAttribute("contentPage", "account/joinConfirm.jsp");
		} else {
			req.setAttribute("contentPage", "home.jsp");
		}
		return "index";
	}
	
	
	
	@RequestMapping(value = "account.delete", method = RequestMethod.GET)
	public String AccountDelete(HttpServletRequest req) {
		// 탈퇴
		if (aDAO.loginCheck(req)) {
			aDAO.deleteAccount(req);
		}
		req.setAttribute("contentPage", "home.jsp");
		return "index";
	}
	
	@RequestMapping(value = "account.delete.go", method = RequestMethod.GET)
	public String AccountDeleteGo(HttpServletRequest req) {
		// 탈퇴페이지로
		aDAO.loginCheck(req);
			
		
		req.setAttribute("contentPage", "deleteAccount.jsp");
		return "index";
	}




	
	
	
	
	
}
