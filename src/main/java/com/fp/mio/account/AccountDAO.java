package com.fp.mio.account;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fp.mio.product.Product;
import com.fp.mio.product.ProductMapper;
import com.fp.mio.product.ProductSelector;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class AccountDAO {

	@Autowired
	private SqlSession ss;
	
	@Qualifier("so")
	@Autowired
	private com.fp.mio.SiteOption so;
	
	private int allACount;
	public int getAllACount() {
		return allACount;
	}
	public void setAllACount(int allACount) {
		this.allACount = allACount;
	}
	public void calcAllACount() {
		AccountSelector as = new AccountSelector("", null, null);
		allACount = ss.getMapper(AccountMapper.class).getAccountCount(as);
	}
	
	
	// 로그인
	public void login(Account a, HttpServletRequest req) {

		Account dbAccount = ss.getMapper(AccountMapper.class).getAccountByID(a);

		if (dbAccount != null) {
			if (a.getA_pw().equals(dbAccount.getA_pw())) {
				req.getSession().setAttribute("loginAccount", dbAccount);
				req.getSession().setMaxInactiveInterval(60 * 1000);	
				req.setAttribute("result", "0");
			} else {
				req.setAttribute("result", "1");//pw오류
			}
		} else {
			req.setAttribute("result", "2");// 없는 id
		}
	}

	//로그아웃
	public void logout(HttpServletRequest req) {
			req.getSession().setAttribute("loginAccount", null);
		}
	
	//로그인 체크
	public boolean loginCheck(HttpServletRequest req) {
		Account a = (Account) req.getSession().getAttribute("loginAccount");
		if (a != null) {
			return true;
		} else {
			
			return false;
		}
	}
	
	
	
	
	// 일반 회원 가입
	public void joinGeneral(Account a, HttpServletRequest req) {

		String path = req.getSession().getServletContext().getRealPath("resources/img_account");
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(req, path, 10 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "가입실패"); // 확인용
			return;
		}

		try {
			String join_id = mr.getParameter("a_id");
			String join_pw = mr.getParameter("a_pw");
			String join_name = mr.getParameter("a_name");
			String join_grade = mr.getParameter("a_grade");
			String join_phone = mr.getParameter("a_phone");
			String join_question = mr.getParameter("a_question");
			String join_answer = mr.getParameter("a_answer");
			String join_addr1 = mr.getParameter("a_addr1");
			String join_addr2 = mr.getParameter("a_addr2");
			String join_addr3 = mr.getParameter("a_addr3");
			String join_addr = join_addr1 + "!" + join_addr2 + "!" + join_addr3;
			String join_photo = mr.getFilesystemName("a_img");
			join_photo = URLEncoder.encode(join_photo, "utf-8");
			join_photo = join_photo.replace("+", " ");
			
			a.setA_id(join_id);
			a.setA_pw(join_pw);
			a.setA_name(join_name);
			a.setA_grade(join_grade);
			a.setA_addr(join_addr);
			a.setA_img(join_photo);
			a.setA_grade(join_grade);
			a.setA_phone(join_phone);
			a.setA_question(join_question);
			a.setA_answer(join_answer);
			
			if (ss.getMapper(AccountMapper.class).joinGeneral(a) == 1) {
				req.setAttribute("result", "가입성공"); 
			} else {
				req.setAttribute("result", "가입실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			String fileName = mr.getFilesystemName("a_img");
			new File(path + "/" + fileName).delete();
			req.setAttribute("result", "가입실패");
		}
	}
	
	// 판매자 회원 가입
	public void joinSeller(Seller s, HttpServletRequest req) {
		
		String path = req.getSession().getServletContext().getRealPath("resources/img_account");
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(req, path, 10 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "가입실패"); // 확인용
			return;
		}
		
		try {
			String join_id = mr.getParameter("a_s_id");
			String join_pw = mr.getParameter("s_pw");
			String join_name = mr.getParameter("s_name");
			String join_grade = mr.getParameter("s_grade");
			String join_phone = mr.getParameter("s_phone");
			String join_question = mr.getParameter("s_question");
			String join_answer = mr.getParameter("s_answer");
			String join_addr1 = mr.getParameter("s_addr1");
			String join_addr2 = mr.getParameter("s_addr2");
			String join_addr3 = mr.getParameter("s_addr3");
			String join_addr = join_addr1 + "!" + join_addr2 + "!" + join_addr3;
			String join_photo = mr.getFilesystemName("s_img");
			join_photo = URLEncoder.encode(join_photo, "utf-8");
			join_photo = join_photo.replace("+", " ");
			String join_intro = mr.getParameter("s_intro");
			String join_sellsort = mr.getParameter("s_sellsort");
			
			
			s.setA_s_id(join_id);
			s.setS_pw(join_pw);
			s.setS_name(join_name);
			s.setS_grade(join_grade);
			s.setS_phone(join_phone);
			s.setS_question(join_question);
			s.setS_answer(join_answer);
			s.setS_addr(join_addr);
			s.setS_img(join_photo);
			s.setS_intro(join_intro);
			s.setS_sellsort(join_sellsort);
			
			if (ss.getMapper(AccountMapper.class).joinSeller(s) == 1) {
				req.setAttribute("result", "가입신청성공");
			} else {
				req.setAttribute("result", "가입신청실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			String fileName = mr.getFilesystemName("s_img");
			new File(path + "/" + fileName).delete();
			req.setAttribute("result", "가입실패");
		}
	}

	// 주소관련
	public void splitAddr(HttpServletRequest req) {
		Account a = (Account) req.getSession().getAttribute("loginAccount");
		String join_addr = a.getA_addr();
		String[] join_addr2 = join_addr.split("!");
		req.setAttribute("addr", join_addr2);

	}

	// 회원 탈퇴
	public void deleteAccount(HttpServletRequest req) {
		try {
			Account a = (Account) req.getSession().getAttribute("loginAccount");
			String join_photo = a.getA_img();

			if (ss.getMapper(AccountMapper.class).deleteAccount(a) == 1) {

				String path = req.getSession().getServletContext().getRealPath("resources/img_account");
				join_photo = URLDecoder.decode(join_photo, "utf-8");
				new File(path + "/" + join_photo).delete();

				logout(req);
				loginCheck(req);
				
				req.setAttribute("result","탈퇴 성공"); // 확인용	
			} 
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result","탈퇴 실패");
		}
	}
	
	// 회원 등급 조정
	public void updateGrade(Account a,HttpServletRequest req) {
		
		if (ss.getMapper(AccountMapper.class).updateGrade(a) == 1) {
			req.setAttribute("result", "수정성공");  // 확인용
			
		} else {
			req.setAttribute("result", "수정실패");
			
		}
	}
	
	// 회원 정보 수정
	public void updateAccount(Account a, HttpServletRequest req) {
		String path = req.getSession().getServletContext().getRealPath("resources/img_account");
		MultipartRequest mr = null;
		Account loginMember = (Account) req.getSession().getAttribute("loginAccount");
		String oldFile = loginMember.getA_img();
		String newFile = null;
		try {
			mr = new MultipartRequest(req, path, 10 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
			newFile = mr.getFilesystemName("jm_photo");
			if (newFile == null) {
				newFile = oldFile;
			} else {
				newFile = URLEncoder.encode(newFile, "utf-8");
				newFile = newFile.replace("+", " ");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "수정실패");  // 확인용
			return;
		}
		try {
			String join_id = mr.getParameter("jm_id");
			String join_pw = mr.getParameter("jm_pw");
			String join_name = mr.getParameter("jm_name");
			String join_addr1 = mr.getParameter("jm_addr1");
			String join_addr2 = mr.getParameter("jm_addr2");
			String join_addr3 = mr.getParameter("jm_addr3");
			String join_addr = join_addr1 + "!" + join_addr2 + "!" + join_addr3;
			String join_img = newFile;
			String join_phone = mr.getParameter("jm_phone");

			a.setA_id(join_id);
			a.setA_pw(join_pw);
			a.setA_name(join_name);
			a.setA_addr(join_addr);
			a.setA_img(join_img);
			a.setA_phone(join_phone);

			if (ss.getMapper(AccountMapper.class).updateAccount(a) == 1) {
				req.setAttribute("result", "수정성공"); // 확인용
				a = ss.getMapper(AccountMapper.class).getAccountByID(a);
				req.getSession().setAttribute("loginAccount", a);
				if (!oldFile.equals(newFile)) {
					oldFile = URLDecoder.decode(oldFile, "utf-8");
					new File(path + "/" + oldFile).delete();
				}
			} else {
				req.setAttribute("result", "수정실패");
				if (!oldFile.equals(newFile)) {
					newFile = URLDecoder.decode(newFile, "utf-8");
					new File(path + "/" + newFile).delete();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "수정실패");
			if (!oldFile.equals(newFile)) {
				try {
					newFile = URLDecoder.decode(newFile, "utf-8");
				} catch (UnsupportedEncodingException e1) {
				}
				new File(path + "/" + newFile).delete();
			}
		}
	}
	
	// 회원 정보 가져오기(전체)
	public void getAllAccount(int pageNo,HttpServletRequest req) {
		
		int count = so.getProductCountPerpage();
		int start = (pageNo - 1) * count + 1;
		int end = start + (count - 1);

		AccountSelector search = (AccountSelector) req.getAttribute("search");
		int aCount = 0;

		if (search == null) {
			search = new AccountSelector("",new BigDecimal(start),new BigDecimal(end));
			aCount = allACount; 
		} else {
			search.setStart(new BigDecimal(start));
			search.setEnd(new BigDecimal(end));
			aCount = ss.getMapper(AccountMapper.class).getAccountCount(search);
			req.setAttribute("search", search.getSearch());
		}
		
		List<Account> accounts = ss.getMapper(AccountMapper.class).getAccountSearch(search);
		
		int pageCount = (int) Math.ceil(aCount / (double) count);
		
		System.out.println(aCount);
		
		req.setAttribute("pageCount", pageCount);

		req.setAttribute("accounts", accounts);
		req.setAttribute("curPage", pageNo);
	}
	
	// 회원 정보를 등급별로 가져오기
	public void getAccount(HttpServletRequest req) {
	try {
		req.setAttribute("accounts", ss.getMapper(AccountMapper.class).getAccount());
	} catch (Exception e) {
		e.printStackTrace();
	}
	}

	// 판매자 신청 정보 가져오기(전체)
	public void getSeller(HttpServletRequest req) {
		try {
			req.setAttribute("sellers", ss.getMapper(AccountMapper.class).getSeller());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


	// 신청 중인 판매자를 id로 가져오기
	public void getSellerById(Seller s,HttpServletRequest req) {
		try {
			req.setAttribute("sellers", ss.getMapper(AccountMapper.class).getSellerById(s));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 판매자를 회원에 등록하기
	public void sellerToAccount(Account a,Seller s, HttpServletRequest req) {
		Seller sss =ss.getMapper(AccountMapper.class).getSellerById(s);
		a.setA_id(sss.getA_s_id());
		a.setA_pw(sss.getS_pw());
		a.setA_name(sss.getS_name());
		a.setA_addr(sss.getS_addr());
		a.setA_phone(sss.getS_phone());
		a.setA_img(sss.getS_img());
		a.setA_grade(sss.getS_grade());
		a.setA_question(sss.getS_question());
		a.setA_answer(sss.getS_answer());
		
		if (ss.getMapper(AccountMapper.class).joinGeneral(a) == 1) {
			req.setAttribute("result", "가입성공"); // 확인용
		} else {
			req.setAttribute("result", "가입실패");
		}
	}

	// id중복체크
	public int idCheck(String a_id,HttpServletRequest req) {
		
		int result1;
		int result2;
		
		result1 = ss.getMapper(AccountMapper.class).idCheck(a_id); // 일반 회원 목록 중에서
		result2 = ss.getMapper(AccountMapper.class).idCheckS(a_id); // 가입 신청 목록 중에서
		
		int result;
		if (result1 == 1 || result2 == 1) {
			result = 1;
		}else {
			result = 0;
		}
		
		
		return result;
		
	}

	// 승인 거절
	public void deleteSellerjoinPhoto(Seller s,HttpServletRequest req) {
		try {
			Seller sss =ss.getMapper(AccountMapper.class).getSellerById(s);
			String join_photo = sss.getS_img();
		if (ss.getMapper(AccountMapper.class).deleteAccountS(s) == 1) {
			req.setAttribute("result", "승인 거절 완료"); // 확인용

			String path = req.getSession().getServletContext().getRealPath("resources/img_account");
			
			join_photo = URLDecoder.decode(join_photo, "utf-8");
			new File(path + "/" + join_photo).delete();

	}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

}
	
	// 승인신청에서 삭제
	public void deleteSellerjoin(Seller s,HttpServletRequest req) {
		try {
			Seller sss =ss.getMapper(AccountMapper.class).getSellerById(s);
			if (ss.getMapper(AccountMapper.class).deleteAccountS(s) == 1) {
				req.setAttribute("result", "삭제 성공"); // 확인용
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	// id찾기(이름, 핸드폰 번호로)
	public void idSearch(Account a, HttpServletRequest req) {
		try {
			if (ss.getMapper(AccountMapper.class).searchId(a)==null) {
				req.setAttribute("result", "1");//1이면 없는 id
			}else {
			req.setAttribute("id", ss.getMapper(AccountMapper.class).searchId(a).getA_id());
			req.setAttribute("result", "2");//2면 id있음
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// pw찾기(ID,질문답으로)
	public void pwSearch(Account a, HttpServletRequest req) {
		try {
			Account aa = ss.getMapper(AccountMapper.class).getAccountByID(a);
			
			if (a.getA_question().equals(aa.getA_question()) && a.getA_answer().equals(aa.getA_answer())) {
				req.setAttribute("pw", ss.getMapper(AccountMapper.class).searchId(aa).getA_pw());
				req.setAttribute("result", "2");
			}else {
				req.setAttribute("result", "1");//1이면 pw x
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void AccountSearch(AccountSelector as, HttpServletRequest request) {
		request.setAttribute("search", as);
	}
}
