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
	public void login(Account account, HttpServletRequest request) {
		Account dbAccount = ss.getMapper(AccountMapper.class).getAccountByID(account);
		if (dbAccount != null) {
			if (account.getA_pw().equals(dbAccount.getA_pw())) {
				request.getSession().setAttribute("loginAccount", dbAccount);
				request.getSession().setMaxInactiveInterval(60 * 1000);
				request.setAttribute("result", "0");
			} else {
				request.setAttribute("result", "1");// pw오류
			}
		} else {
			request.setAttribute("result", "2");// 없는 id
		}
	}
	// 로그아웃
	public void logout(HttpServletRequest request) {
		request.getSession().setAttribute("loginAccount", null);
	}
	// 로그인 체크
	public boolean loginCheck(HttpServletRequest request) {
		Account account = (Account) request.getSession().getAttribute("loginAccount");
		if (account != null) {
			return true;
		} else {
			return false;
		}
	}

	// 일반 회원 가입
	public void joinGeneral(Account account, HttpServletRequest request) {
		String path = request.getSession().getServletContext().getRealPath("resources/img_account");
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(request, path, 10 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", "가입실패"); // 확인용
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

			account.setA_id(join_id);
			account.setA_pw(join_pw);
			account.setA_name(join_name);
			account.setA_grade(join_grade);
			account.setA_addr(join_addr);
			account.setA_img(join_photo);
			account.setA_grade(join_grade);
			account.setA_phone(join_phone);
			account.setA_question(join_question);
			account.setA_answer(join_answer);

			if (ss.getMapper(AccountMapper.class).joinGeneral(account) == 1) {
				request.setAttribute("result", "가입성공");
			} else {
				request.setAttribute("result", "가입실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			String fileName = mr.getFilesystemName("a_img");
			new File(path + "/" + fileName).delete();
			request.setAttribute("result", "가입실패");
		}
	}

	// 판매자 회원 가입
	public void joinSeller(Seller seller, HttpServletRequest request) {
		String path = request.getSession().getServletContext().getRealPath("resources/img_account");
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(request, path, 10 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", "가입실패"); // 확인용
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

			seller.setA_s_id(join_id);
			seller.setS_pw(join_pw);
			seller.setS_name(join_name);
			seller.setS_grade(join_grade);
			seller.setS_phone(join_phone);
			seller.setS_question(join_question);
			seller.setS_answer(join_answer);
			seller.setS_addr(join_addr);
			seller.setS_img(join_photo);
			seller.setS_intro(join_intro);
			seller.setS_sellsort(join_sellsort);

			if (ss.getMapper(AccountMapper.class).joinSeller(seller) == 1) {
				request.setAttribute("result", "가입신청성공");
			} else {
				request.setAttribute("result", "가입신청실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			String fileName = mr.getFilesystemName("s_img");
			new File(path + "/" + fileName).delete();
			request.setAttribute("result", "가입실패");
		}
	}

	// 주소관련
	public void splitAddr(HttpServletRequest request) {
		Account account = (Account) request.getSession().getAttribute("loginAccount");
		String join_addr = account.getA_addr();
		String[] join_addr2 = join_addr.split("!");
		request.setAttribute("addr", join_addr2);
	}

	// 회원 탈퇴
	public void deleteAccount(HttpServletRequest request) {
		try {
			Account a = (Account) request.getSession().getAttribute("loginAccount");
			String join_photo = a.getA_img();
			if (ss.getMapper(AccountMapper.class).deleteAccount(a) == 1) {
				String path = request.getSession().getServletContext().getRealPath("resources/img_account");
				join_photo = URLDecoder.decode(join_photo, "utf-8");
				new File(path + "/" + join_photo).delete();
				logout(request);
				loginCheck(request);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 회원 등급 조정
	public void updateGrade(Account account, HttpServletRequest request) {
		if (ss.getMapper(AccountMapper.class).updateGrade(account) == 1) {
			request.setAttribute("result", "수정성공"); // 확인용
		} else {
			request.setAttribute("result", "수정실패");
		}
	}

	// 회원 정보 수정
	public void updateAccount(Account account, HttpServletRequest request) {
		String path = request.getSession().getServletContext().getRealPath("resources/img_account");
		MultipartRequest mr = null;
		Account loginMember = (Account) request.getSession().getAttribute("loginAccount");
		String oldFile = loginMember.getA_img();
		String newFile = null;
		try {
			mr = new MultipartRequest(request, path, 10 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
			newFile = mr.getFilesystemName("jm_photo");
			if (newFile == null) {
				newFile = oldFile;
			} else {
				newFile = URLEncoder.encode(newFile, "utf-8");
				newFile = newFile.replace("+", " ");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", "수정실패"); // 확인용
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

			account.setA_id(join_id);
			account.setA_pw(join_pw);
			account.setA_name(join_name);
			account.setA_addr(join_addr);
			account.setA_img(join_img);
			account.setA_phone(join_phone);

			if (ss.getMapper(AccountMapper.class).updateAccount(account) == 1) {
				request.setAttribute("result", "수정성공");
				account = ss.getMapper(AccountMapper.class).getAccountByID(account);
				request.getSession().setAttribute("loginAccount", account);
				if (!oldFile.equals(newFile)) {
					oldFile = URLDecoder.decode(oldFile, "utf-8");
					new File(path + "/" + oldFile).delete();
				}
			} else {
				request.setAttribute("result", "수정실패");
				if (!oldFile.equals(newFile)) {
					newFile = URLDecoder.decode(newFile, "utf-8");
					new File(path + "/" + newFile).delete();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", "수정실패");
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
	public void getAllAccount(int pageNo, HttpServletRequest request) {
		int count = so.getProductCountPerpage();
		int start = (pageNo - 1) * count + 1;
		int end = start + (count - 1);

		AccountSelector search = (AccountSelector) request.getSession().getAttribute("search");
		
		int aCount = 0;

		if (search == null) {
			search = new AccountSelector("", new BigDecimal(start), new BigDecimal(end));
			aCount = allACount;
		} else {
			search.setStart(new BigDecimal(start));
			search.setEnd(new BigDecimal(end));
			aCount = ss.getMapper(AccountMapper.class).getAccountCount(search);
			request.setAttribute("search", search.getSearch());
		}

		List<Account> accounts = ss.getMapper(AccountMapper.class).getAccountSearch(search);

		int pageCount = (int) Math.ceil(aCount / (double) count);

		request.setAttribute("pageCount", pageCount);
		request.setAttribute("accounts", accounts);
		request.setAttribute("curPage", pageNo);

	}

	// 등급으로 정렬된 회원 정보 가져오기(전체)
	public void getAccount(HttpServletRequest request) {
		try {
			request.setAttribute("accounts", ss.getMapper(AccountMapper.class).getAccount());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 판매자 신청 정보 가져오기(전체)
	public void getSeller(HttpServletRequest request) {
		try {
			request.setAttribute("sellers", ss.getMapper(AccountMapper.class).getSeller());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 판매자 id로 가져오기
	public void getSellerById(Seller seller, HttpServletRequest request) {
		try {
			request.setAttribute("sellers", ss.getMapper(AccountMapper.class).getSellerById(seller));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 판매자를 회원에 등록하기
	public void sellerToAccount(Seller seller, HttpServletRequest request) {
		Seller sellerApproved = ss.getMapper(AccountMapper.class).getSellerById(seller);
		Account account = new Account();
		account.setA_id(sellerApproved.getA_s_id());
		account.setA_pw(sellerApproved.getS_pw());
		account.setA_name(sellerApproved.getS_name());
		account.setA_addr(sellerApproved.getS_addr());
		account.setA_phone(sellerApproved.getS_phone());
		account.setA_img(sellerApproved.getS_img());
		account.setA_grade(sellerApproved.getS_grade());
		account.setA_question(sellerApproved.getS_question());
		account.setA_answer(sellerApproved.getS_answer());

		if (ss.getMapper(AccountMapper.class).joinGeneral(account) == 1) {
			request.setAttribute("result", "가입성공"); // 확인용
		} else {
			request.setAttribute("result", "가입실패");
		}
	}

	// id중복체크
	public int idCheck(String a_id) {
			
		int result = ss.getMapper(AccountMapper.class).idCheck(a_id);
		
		System.out.println(result);
		
		return result;
	}

	// 승인 거절
	public void deleteSellerjoinPhoto(Seller seller, HttpServletRequest request) {
		try {
			Seller sss = ss.getMapper(AccountMapper.class).getSellerById(seller);
			String join_photo = sss.getS_img();
			if (ss.getMapper(AccountMapper.class).deleteAccountS(seller) == 1) {
				String path = request.getSession().getServletContext().getRealPath("resources/img_account");
				join_photo = URLDecoder.decode(join_photo, "utf-8");
				new File(path + "/" + join_photo).delete();
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	// 가입 신청시 올린 사진파일 삭제
	public void deletePhoto (Seller seller,HttpServletRequest request) {
		try {
		Seller deleteSeller = ss.getMapper(AccountMapper.class).getSellerById(seller);
		String deletePhoto = deleteSeller.getS_img();
		String path = request.getSession().getServletContext().getRealPath("resources/img_account");
			deletePhoto = URLDecoder.decode(deletePhoto, "utf-8");
			new File(path + "/" + deletePhoto).delete();
			System.out.println(path);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
	// 승인신청에서 삭제
	public void deleteSellerjoin(Seller seller, HttpServletRequest req) {
		try {
			Seller deleteSeller = ss.getMapper(AccountMapper.class).getSellerById(seller);
			if (ss.getMapper(AccountMapper.class).deleteAccountS(deleteSeller) == 1) {
				req.setAttribute("result", "삭제성공"); // 확인용	
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// id찾기(이름, 핸드폰 번호로)
	public void idSearch(Account account, HttpServletRequest request) {
		try {
			if (ss.getMapper(AccountMapper.class).searchId(account) == null) {
				request.setAttribute("result", "1");// 1이면 없는 id
			} else {
				request.setAttribute("id", ss.getMapper(AccountMapper.class).searchId(account).getA_id());
				request.setAttribute("result", "2");// 2면 id있음
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// pw찾기(ID,질문답으로)
	public void pwSearch(Account account, HttpServletRequest request) {
		try {
			Account searchAccount = ss.getMapper(AccountMapper.class).getAccountByID(account);
			if (account.getA_question().equals(searchAccount.getA_question()) && account.getA_answer().equals(searchAccount.getA_answer())) {
				request.setAttribute("pw", ss.getMapper(AccountMapper.class).searchId(searchAccount).getA_pw());
				request.setAttribute("result", "2");
			} else {
				request.setAttribute("result", "1");// 1이면 pw x
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 페이징 기능에 사용되는 AccountSelector 설정
	public void AccountSearch(AccountSelector accountSelector, HttpServletRequest request) {
		request.getSession().setAttribute("search", accountSelector);
	}
}
