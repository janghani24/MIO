package com.fp.mio.product;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ProductDAO {

	@Autowired
	private SqlSession ss;

	public void getFood(HttpServletRequest request) {

		try {
			request.setAttribute("food", ss.getMapper(ProductMapper.class).getFood());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	public void getFashion(HttpServletRequest request) {
		try {
			request.setAttribute("fashion", ss.getMapper(ProductMapper.class).getFashion());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	
	
}
