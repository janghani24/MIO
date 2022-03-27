package com.fp.mio.funding;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;


import com.fp.mio.account.Account;
import com.fp.mio.product.Product;
import com.fp.mio.product.ProductMapper;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class FundingDAO {

	@Autowired
	private SqlSession ss;
	
	@Qualifier("so")
	@Autowired
	private com.fp.mio.SiteOption so;
	private int allFCount;
	public int getAllFCount() {
		return allFCount;
	}
	public void setAllFCount(int allFCount) {
		this.allFCount = allFCount;
	}
	public void calcAllFCount() {
		FundingSelector fs = new FundingSelector("", null, null);
		allFCount = ss.getMapper(FundingMapper.class).getFundingCount(fs);
	}
	
	// 펀딩 전체
	public void getFundingAll(HttpServletRequest request) {

		try {
			request.setAttribute("funding2", ss.getMapper(FundingMapper.class).getFundingAll());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void getFunding(int pageNo, HttpServletRequest req) {

		int count = so.getProductCountPerpage();
		int start = (pageNo - 1) * count + 1;
		int end = start + (count - 1);

		FundingSelector search = (FundingSelector) req.getAttribute("search");
		int fCount = 0;

		if (search == null) {
			search = new FundingSelector("",new BigDecimal(start),new BigDecimal(end));
			fCount = allFCount; 
		} else {
			search.setStart(new BigDecimal(start));
			search.setEnd(new BigDecimal(end));
			fCount = ss.getMapper(FundingMapper.class).getFundingCount(search);
			req.setAttribute("search", search.getSearch());
		}
		System.out.println(search.getSearch());
		System.out.println(search.getStart());
		
		List<Funding> fundings = ss.getMapper(FundingMapper.class).getFundingSearch(search);
		

		int pageCount = (int) Math.ceil(fCount / (double) count);
		
		req.setAttribute("pageCount", pageCount);

		req.setAttribute("funding2", fundings);
		req.setAttribute("curPage", pageNo);
	}
	
	public void fundingSearch(FundingSelector fs,HttpServletRequest request) {
		System.out.println(fs.getSearch());
		request.setAttribute("search", fs);
	

}
// 펀딩 등록
	public void regFunding(HttpServletRequest request, Funding funding) {

		try {
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			String path = request.getSession().getServletContext().getRealPath("resources/img/funding");
			MultipartRequest mr = new MultipartRequest(request, path, 5 * 1024 * 1024, "utf-8", policy);

			String file = mr.getFilesystemName("f_photo");
			funding.setF_photo(file);
			funding.setF_name(mr.getParameter("f_name"));
			funding.setF_company(mr.getParameter("f_company"));
			String f_category = "";
			String c = mr.getParameter("f_category");

			if (c.equals("일자리창출")) {
				f_category = "일자리창출";
			} else if (c.equals("친환경")) {
				f_category = "친환경";
			} else if (c.equals("기부")) {
				f_category = "기부";
			} else {
				f_category = "유기동물보호";
			}

			funding.setF_category(f_category);

			Account a = (Account) request.getSession().getAttribute("loginAccount");
			funding.setF_owner(a.getA_id());
			SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
			Date period = fm.parse(mr.getParameter("f_period"));
			funding.setF_period(period);
			funding.setF_url(mr.getParameter("f_url"));

			System.out.println(funding.getF_name());
			System.out.println(funding.getF_photo());
			System.out.println(funding.getF_url());

			if (ss.getMapper(FundingMapper.class).regFunding(funding) == 1) {
				allFCount++;
				request.setAttribute("r", "등록성공!");
				System.out.println("--등록 성공--");
			} else {
				request.setAttribute("r", "등록실패!");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	


	


	public void getFundingCategory(HttpServletRequest request, String f_category2) {

		request.setAttribute("funding2", ss.getMapper(FundingMapper.class).getFundingCategory(f_category2));
		request.setAttribute("f_category", "f_category2");


	}

	



	// 펀딩 삭제
	public void deleteFunding(HttpServletRequest request, Funding funding) {
		if (ss.getMapper(FundingMapper.class).deleteFunding(funding) == 1) {
			allFCount--;
			request.setAttribute("r", "삭제 성공!");
			System.out.println("--삭제 성공--");
		} else {
			request.setAttribute("r", "삭제 실패!");
		}
	}
	public Funding getFundingDetail(HttpServletRequest request, Funding f) {
		System.out.println(f.getF_num() + " ~?~?~?~?~?~~?~?~~?~?~?");
		return ss.getMapper(FundingMapper.class).getFundingtDetail(f.getF_num());

	}
	
	// 펀딩 수정
	public void updateFunding(HttpServletRequest request, Funding funding) {
		try {
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			String path = request.getSession().getServletContext().getRealPath("resources/img/funding");
			MultipartRequest mr = new MultipartRequest(request, path, 5 * 1024 * 1024, "utf-8", policy);

			String file = mr.getFilesystemName("f_photo");
			funding.setF_photo(file);
			funding.setF_name(mr.getParameter("f_name"));
			funding.setF_company(mr.getParameter("f_company"));
			funding.setF_num(Integer.parseInt(mr.getParameter("f_num")));
			SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
			Date period = fm.parse(mr.getParameter("f_period"));
			funding.setF_period(period);
			funding.setF_url(mr.getParameter("f_url"));
			System.out.println(funding.getF_period());
			System.out.println(funding.getF_name());
			if (ss.getMapper(FundingMapper.class).updateFunding(funding) == 1) {
				request.setAttribute("r", "수정성공!");
				System.out.println("--수정 성공--");
			} else {
				request.setAttribute("r", "수정실패!");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
