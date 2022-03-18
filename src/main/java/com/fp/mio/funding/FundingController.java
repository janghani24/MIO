package com.fp.mio.funding;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fp.mio.account.AccountDAO;

@Controller
public class FundingController {

<<<<<<< .merge_file_a00480
	@Autowired
	private FundingDAO fDAO;
	@Autowired
	private AccountDAO aDAO;

	// 상품 전체 조회
	@RequestMapping(value = "/funding.all", method = RequestMethod.GET)
	public String fundingAll(HttpServletRequest request) {

		aDAO.loginCheck(request);
		fDAO.getFundingAll(request);

		request.setAttribute("contentPage", "funding/fundingAll.jsp");
		return "index";
	}

	// 펀딩 삭제
	@RequestMapping(value = "/funding.delete", method = RequestMethod.GET)
	public String fundingDelete(HttpServletRequest request, int f_num) {

		aDAO.loginCheck(request);
		fDAO.deleteFunding(request, f_num);
		fDAO.getFundingAll(request);

		request.setAttribute("contentPage", "funding/fundingAll.jsp");
		return "index";
	}
	
	@RequestMapping(value = "/funding.regPage", method = RequestMethod.GET)
	public String fundingRegPage(HttpServletRequest request,Funding funding) {
		aDAO.loginCheck(request);
		request.setAttribute("contentPage", "funding/fundingReg.jsp");
		return "index";
	}
	
	//펀딩등록하기
	@RequestMapping(value = "/funding.reg", method =RequestMethod.POST)
	public String fundingReg(HttpServletRequest request,Funding funding) {
		
		aDAO.loginCheck(request);
		fDAO.regFunding(request,funding);
		fDAO.getFundingAll(request);
		request.setAttribute("contentPage", "funding/fundingAll.jsp");
		
		return "index";
	}
	
	//하위 카테고리로 이동
	@RequestMapping(value = "/funding.category", method = RequestMethod.GET)
	public String fundingCategory(HttpServletRequest request, String f_category) {

		aDAO.loginCheck(request);
		String f_category2 = request.getParameter("f_category");
		fDAO.getProductCategory(request, f_category2);

		request.setAttribute("contentPage", "funding/fundingAll.jsp");

		return "index";

	}

}
=======
    @Autowired
    private FundingDAO fDAO;
    @Autowired
    private AccountDAO aDAO;

    // 상품 전체 조회
    @RequestMapping(value = "/funding.all", method = RequestMethod.GET)
    public String fundingAll(HttpServletRequest request) {

        aDAO.loginCheck(request);
        fDAO.getFundingAll(request);

        request.setAttribute("contentPage", "funding/fundingAll.jsp");
        return "index";
    }

    //펀딩 등록 페이지
    @RequestMapping(value = "/funding.regPage", method = RequestMethod.GET)
    public String fundingRegPage(HttpServletRequest request,Funding funding) {
        aDAO.loginCheck(request);
        request.setAttribute("contentPage", "funding/fundingReg.jsp");
        return "index";
    }

    //펀딩등록하기
    @RequestMapping(value = "/funding.reg", method =RequestMethod.POST)
    public String fundingReg(HttpServletRequest request,Funding funding) {

        aDAO.loginCheck(request);
        fDAO.regFunding(request,funding);
        fDAO.getFundingAll(request);
        request.setAttribute("contentPage", "funding/fundingAll.jsp");

        return "index";
    }

    //하위 카테고리로 이동
    @RequestMapping(value = "/funding.category", method = RequestMethod.GET)
    public String fundingCategory(HttpServletRequest request, String f_category) {

        aDAO.loginCheck(request);
        String f_category2 = request.getParameter("f_category");
        fDAO.getFundingCategory(request, f_category2);

        request.setAttribute("contentPage", "funding/fundingAll.jsp");

        return "index";

    }

}
>>>>>>> .merge_file_a12340
