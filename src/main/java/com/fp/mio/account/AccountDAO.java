package com.fp.mio.account;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class AccountDAO {

	@Autowired
	private SqlSession ss;
	
	// 로그인
	public void login(Account a, HttpServletRequest req) {

		Account dbAccount = ss.getMapper(AccountMapper.class).getAccountByID(a);

		if (dbAccount != null) {
			if (a.getA_pw().equals(dbAccount.getA_pw())) {
				req.getSession().setAttribute("loginAccount", dbAccount);
				req.getSession().setMaxInactiveInterval(60 * 1000);	//개인적으로수정
			} else {
				req.setAttribute("result", "로그인 실패(PW오류)");
			}
		} else {
			req.setAttribute("result", "로그인 실패(미가입ID)");
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
			req.setAttribute("loginPage", "account/loginSuccess.jsp");
			return true;
		} else {
			
			req.setAttribute("loginPage", "account/login.jsp");
			return false;
		}
	}
	
	// 일반 회원 가입(판매자와 합칠 방법 생각해야함)
	public void joinGeneral(Account a, HttpServletRequest req) {

		String path = req.getSession().getServletContext().getRealPath("resources/img_account");
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(req, path, 10 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "가입실패");
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
			
			System.out.println(join_id);
			System.out.println(join_grade);
			
			
			
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
			req.setAttribute("result", "가입실패");
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

			if (ss.getMapper(AccountMapper.class).deleteAccount(a) == 1) {
				req.setAttribute("result", "탈퇴성공");

				String path = req.getSession().getServletContext().getRealPath("resources/img_account");
				String join_photo = a.getA_img();
				join_photo = URLDecoder.decode(join_photo, "utf-8");
				new File(path + "/" + join_photo).delete();

				logout(req);
				loginCheck(req);
			} else {
				req.setAttribute("result", "탈퇴실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "탈퇴실패");
		}
	}
	
	// 회원 등급 조정
	public void updateGrade(Account a,HttpServletRequest req) {
		
		System.out.println(req.getParameter("a_id"));
		System.out.println(req.getParameter("a_grade"));
		
		
		if (ss.getMapper(AccountMapper.class).updateGrade(a) == 1) {
			req.setAttribute("result", "수정성공");
			
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
			req.setAttribute("result", "수정실패");
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
				req.setAttribute("result", "수정성공");
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


	// 판매자 id로 가져오기
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
			req.setAttribute("result", "가입성공");
		} else {
			req.setAttribute("result", "가입실패");
		}
	}

	// id중복체크
	public int idCheck(String a_id,HttpServletRequest req) {
		
		int result1;
		int result2;
		
		result1 = ss.getMapper(AccountMapper.class).IdCheck(a_id);
		result2 = ss.getMapper(AccountMapper.class).IdCheckS(a_id);
		
		int result;
		if (result1 == 1 || result2 == 1) {
			result = 1;
		}else {
			result = 0;
		}
		
		
		return result;
		
	}

	public void deleteSellerjoin(Seller s,HttpServletRequest req) {
		try {
		if (ss.getMapper(AccountMapper.class).deleteAccountS(s) == 1) {
			req.setAttribute("result", "탈퇴성공");

			String path = req.getSession().getServletContext().getRealPath("resources/img_account");
			String join_photo = s.getS_img();
			join_photo = URLDecoder.decode(join_photo, "utf-8");
			new File(path + "/" + join_photo).delete();

	}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

}
}