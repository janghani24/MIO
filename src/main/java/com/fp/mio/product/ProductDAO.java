package com.fp.mio.product;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductDAO {

	@Autowired
	private SqlSession ss;

	public void getProductAll(HttpServletRequest request) {

		try {
			request.setAttribute("product", ss.getMapper(ProductMapper.class).getProductAll());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

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

	public void getBeauty(HttpServletRequest request) {
		try {
			request.setAttribute("beauty", ss.getMapper(ProductMapper.class).getBeauty());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void getLiving(HttpServletRequest request) {
		try {
			request.setAttribute("living", ss.getMapper(ProductMapper.class).getLiving());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Product getProductDetail(HttpServletRequest request, Product product, int p_num) {

		return ss.getMapper(ProductMapper.class).getProductDetail(p_num);

	}

	public void getProductCategory(HttpServletRequest request, String p_category2) {
		try {
			request.setAttribute("food", ss.getMapper(ProductMapper.class).getProductCategory(p_category2));
			request.setAttribute("fashion", ss.getMapper(ProductMapper.class).getProductCategory(p_category2));
			request.setAttribute("beauty", ss.getMapper(ProductMapper.class).getProductCategory(p_category2));
			request.setAttribute("living", ss.getMapper(ProductMapper.class).getProductCategory(p_category2));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void productSearch(HttpServletRequest request, String p_name) {

		try {
			request.setAttribute("product", ss.getMapper(ProductMapper.class).getProductSearch(p_name));
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
