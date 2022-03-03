package com.fp.mio.funding;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.mio.product.ProductMapper;

@Service
public class FundingDAO {

	@Autowired
	private SqlSession ss;

	public void getFundingAll(HttpServletRequest request)  {

		try {
			request.setAttribute("funding", ss.getMapper(FundingMapper.class).getFundingAll());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
