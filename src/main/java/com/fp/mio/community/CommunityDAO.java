package com.fp.mio.community;

import java.math.BigDecimal;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fp.mio.SiteOption;
import com.fp.mio.account.Account;

@Service
public class CommunityDAO {

	@Autowired
	private SqlSession ss;

	@Qualifier("so2")
	@Autowired
	private SiteOption so;

	private int allMsgCount;

	public int getAllMsgCount() {
		return allMsgCount;
	}

	public void setAllMsgCount(int allMsgCount) {
		this.allMsgCount = allMsgCount;
	}

	public void calcAllmsgCount() {
		CmSelector cs = new CmSelector("", null, null);
		allMsgCount = ss.getMapper(CommunityMapper.class).getMsgCount(cs);

	}

	public void getMsg(int pageNo, HttpServletRequest req) {

		int count = so.getReplyCountPerpage();
		int start = (pageNo - 1) * count + 1;
		int end = start + (count - 1);

		CmSelector search = (CmSelector) req.getSession().getAttribute("search");
		int msgCount = 0;

		if (search == null) {
			search = new CmSelector("", new BigDecimal(start), new BigDecimal(end));
			msgCount = allMsgCount;

		} else {
			search.setStart(new BigDecimal(start));
			search.setEnd(new BigDecimal(end));
			msgCount = ss.getMapper(CommunityMapper.class).getMsgCount(search);
		}

		List<CommunityMsg> msgs = ss.getMapper(CommunityMapper.class).getMsg(search);
		for (CommunityMsg cmMsg : msgs) {
			//System.out.println(cmMsg.getC_no());
			List<Communityre> cre = ss.getMapper(CommunityMapper.class).getReply(cmMsg);
			//System.out.println(cre);
			for (Communityre re : cre) {
					System.out.println(re.getR_c_no());
					System.out.println(re.getR_txt());
			}
			
			cmMsg.setC_re(ss.getMapper(CommunityMapper.class).getReply(cmMsg));
		}
		int pageCount = (int) Math.ceil(msgCount / (double) count);
		System.out.println(msgCount);
		System.out.println(count);
		System.out.println(pageCount);
		System.out.println(pageNo);
		req.setAttribute("pageCount", pageCount);

		req.setAttribute("msgs", msgs);
		req.setAttribute("curPage", pageNo);

	}

	public void writeMsg(CommunityMsg cm, HttpServletRequest req) {

		String token = req.getParameter("token");
		String successToken = (String) req.getSession().getAttribute("successToken");

		if (token.equals(successToken)) {
			return;
		}
		Account a = (Account) req.getSession().getAttribute("loginAccount");
		cm.setC_owner(a.getA_id());

		String c_txt = cm.getC_txt();
		cm.setC_txt(c_txt.replace("\r\n", "<br>"));

		if (ss.getMapper(CommunityMapper.class).writeMsg(cm) == 1) {
			req.setAttribute("result", "글쓰기 성공");
			req.getSession().setAttribute("successToken", token);

			allMsgCount++;

		} else {
			req.setAttribute("result", "글쓰기 실패");
		}
	}

	public void writeReply(Communityre cmr, HttpServletRequest req) {
		try {

			String token = req.getParameter("token");
			String successToken = (String) req.getSession().getAttribute("successToken");
			
			if (token.equals(successToken)) {
				return;
			}
			Account a = (Account) req.getSession().getAttribute("loginAccount");
			cmr.setR_owner(a.getA_id());
			
			//System.out.println(cmr.getR_c_no());
			if (ss.getMapper(CommunityMapper.class).writeReply(cmr) == 1) {
				req.setAttribute("result", "댓글쓰기 성공");
				req.getSession().setAttribute("successToken", token);


			} else {
				req.setAttribute("result", "댓글쓰기 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "댓글쓰기 실패");
		}
	}

	public void searchMsg(CmSelector cs, HttpServletRequest req) {
		req.getSession().setAttribute("search", cs);
	}

	public void delMsg(CommunityMsg cm, HttpServletRequest req) {
		try {

			if (ss.getMapper(CommunityMapper.class).delMsg(cm) == 1) {
				req.setAttribute("result", "글 삭제 성공");

				allMsgCount--;

			} else {
				req.setAttribute("result", "글 삭제 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "글 삭제 실패");
		}
	}

	public void delReply(Communityre cmr, HttpServletRequest req) {
		try {

			if (ss.getMapper(CommunityMapper.class).delReply(cmr) == 1) {
				req.setAttribute("result", "댓글삭제 성공");
			} else {
				req.setAttribute("result", "댓글삭제 실패");

			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "댓글삭제 실패");
		}
	}
	public void updateMsg(CommunityMsg cm, HttpServletRequest req) {
		try {

			if (ss.getMapper(CommunityMapper.class).updateMsg(cm) == 1) {
				req.setAttribute("result", "글 수정 성공");
			} else {
				req.setAttribute("result", "글 수정 실패");

			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "글 수정 실패");
		}
	}

}
