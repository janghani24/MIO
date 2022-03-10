package com.fp.mio.funding;

import java.text.SimpleDateFormat;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.mio.product.ProductMapper;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class FundingDAO {

	@Autowired
	private SqlSession ss;

	// 펀딩 전체
	public void getFundingAll(HttpServletRequest request) {

		try {
			System.out.println(ss.getMapper(FundingMapper.class).getFundingAll());
			request.setAttribute("funding", ss.getMapper(FundingMapper.class).getFundingAll());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 펀딩 삭제
	public void deleteFunding(HttpServletRequest request, int f_num) {

		try {
			request.setAttribute("funding", ss.getMapper(FundingMapper.class).deleteFunding(f_num));
		} catch (Exception e) {
			e.printStackTrace();

		}
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

			SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
			Date period = fm.parse(mr.getParameter("f_period"));
			funding.setF_period(period);
			funding.setF_url(mr.getParameter("f_url"));

			System.out.println(funding.getF_name());

			if (ss.getMapper(FundingMapper.class).regFunding(funding) == 1) {
				request.setAttribute("r", "등록성공!");
			} else {
				request.setAttribute("r", "등록실패!");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void getProductCategory(HttpServletRequest request, String f_category2) {

		request.setAttribute("funding", ss.getMapper(FundingMapper.class).getFundingCategory(f_category2));

	}

}
