package com.fp.mio.funding;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FundingDAO {

	@Autowired
	private SqlSession ss;
}
