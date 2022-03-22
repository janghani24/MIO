package com.fp.mio.funding;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fp.mio.account.AccountDAO;
import com.fp.mio.product.ProductSelector;

@Controller
public class FundingController {


	private boolean firstReqP;
	public FundingController() {
		firstReqP = true;
	}
    @Autowired
    private FundingDAO fDAO;
    @Autowired
    private AccountDAO aDAO;

	// 상품 전체 조회
	@RequestMapping(value = "/funding.all", method = RequestMethod.GET)
	public String fundingAll(HttpServletRequest request) {


        aDAO.loginCheck(request);
        if(firstReqP) {
    		fDAO.calcAllFCount();
    		firstReqP = false;
    		}
        fDAO.getFunding(1, request);
        request.setAttribute("contentPage", "funding/fundingAll.jsp");
        return "index";
    }

  //페이징
  	@RequestMapping(value = "/funding.paging", method = RequestMethod.GET)
  	public String PageChange(HttpServletRequest request) {
  		int p = Integer.parseInt(request.getParameter("p"));
  		aDAO.loginCheck(request);
  		fDAO.getFunding(p, request);
  		request.setAttribute("contentPage", "funding/fundingAll.jsp");
  		return "index";
  	}
  	//검색결과에서 페이징
  	@RequestMapping(value = "/funding.search.paging", method = RequestMethod.GET)
  	public String searchPageChange(HttpServletRequest request,FundingSelector fs) {
  		int p = Integer.parseInt(request.getParameter("p"));
  		aDAO.loginCheck(request);
  		fDAO.fundingSearch(fs, request);
  		fDAO.getFunding(p, request);
  		request.setAttribute("contentPage", "funding/fundingSearch.jsp");
  		return "index";
  	}
  	// 펀딩 검색
  	@RequestMapping(value = "/funding.search", method = RequestMethod.GET)
	public String productSearch(HttpServletRequest request, FundingSelector fs) {

		
		aDAO.loginCheck(request);
		fDAO.fundingSearch(fs, request);
		fDAO.getFunding(1, request);

		request.setAttribute("contentPage", "funding/fundingSearch.jsp");
		return "index";

	}
  	
  	
  	
    //펀딩 등록 페이지
    @RequestMapping(value = "/funding.regPage", method = RequestMethod.GET)
    public String fundingRegPage(HttpServletRequest request,Funding funding) {
       if (aDAO.loginCheck(request)) {
        request.setAttribute("contentPage", "funding/fundingReg.jsp");
       }
        return "index";
    }


    
    // 펀딩 삭제
    @RequestMapping(value = "/funding.deleteFunding", method =RequestMethod.GET)
    public String fundingDelete(HttpServletRequest request,Funding funding) {
    	
    	if(aDAO.loginCheck(request)) {
    	fDAO.deleteFunding(request,funding);
    	
    }
    	fDAO.getFundingAll(request);
    	request.setAttribute("contentPage", "funding/fundingAll.jsp");
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

