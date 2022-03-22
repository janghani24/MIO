package com.fp.mio.community;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fp.mio.SiteOption;
import com.fp.mio.TokenMaker;
import com.fp.mio.account.AccountDAO;

@Controller
public class CommunityController {

	@Autowired
	private AccountDAO aDAO;

	@Autowired
	private CommunityDAO cDAO;

	@RequestMapping(value = "/community.go", method = RequestMethod.GET)

	public String home(HttpServletRequest req) {

		TokenMaker.make(req);
		SiteOption.clearSearch(req);
		cDAO.getMsg(1, req);

		aDAO.loginCheck(req);
		req.setAttribute("contentPage", "community/community.jsp");
		return "index";
	}

	@RequestMapping(value = "community.page.change", method = RequestMethod.GET)

	public String cmPageChange(HttpServletRequest req) {
		TokenMaker.make(req);
		int p = Integer.parseInt(req.getParameter("p"));
		
		aDAO.loginCheck(req);
		cDAO.getMsg(1, req);

		
		req.setAttribute("contentPage", "community/community.jsp");
		return "index";
	}
	
	@RequestMapping(value = "community.search", method = RequestMethod.GET)

	public String cmSearch(CmSelector cs ,HttpServletRequest req) {
		TokenMaker.make(req);
		
		aDAO.loginCheck(req);
		cDAO.searchMsg(cs,req);
		cDAO.getMsg(1, req);

		req.setAttribute("contentPage", "community/community.jsp");
		return "index";
	}
	
	@RequestMapping(value = "community.write", method = RequestMethod.GET)

	public String cmWrite(CommunityMsg cm ,HttpServletRequest req) {
		TokenMaker.make(req);
		
		if(aDAO.loginCheck(req)) {
			cDAO.writeMsg(cm,req);
			
		}

		cDAO.getMsg(1, req);

		req.setAttribute("contentPage", "community/community.jsp");
		return "index";
	}
	
	@RequestMapping(value = "community.reply.write", method = RequestMethod.GET)

	public String cmReplyWrite(Communityre cmr ,HttpServletRequest req) {
		TokenMaker.make(req);
		int p = Integer.parseInt(req.getParameter("p"));
		
		if(aDAO.loginCheck(req)) {
			cDAO.writeReply(cmr,req);
			
		}

		cDAO.getMsg(p, req);

		req.setAttribute("contentPage", "community/community.jsp");
		return "index";
	}

		
		
	@RequestMapping(value = "community.delete", method = RequestMethod.GET)

		public String cmDel(CommunityMsg cm ,HttpServletRequest req) {
			TokenMaker.make(req);
			SiteOption.clearSearch(req);
			
			if(aDAO.loginCheck(req)) {
				cDAO.delMsg(cm,req);
				
			}

			cDAO.getMsg(1, req);

			req.setAttribute("contentPage", "community/community.jsp");
			return "index";
		
		
		
		
		}
}
