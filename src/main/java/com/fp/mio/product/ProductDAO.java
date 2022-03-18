package com.fp.mio.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.mio.account.Account;
import com.fp.mio.account.AccountMapper;

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


	public void getProductzzim(HttpServletRequest request,Zzim zzim) {
		try {
			
			Account a = (Account) request.getSession().getAttribute("loginAccount");
			zzim.setZ_id(a.getA_id());
	
		
			if (ss.getMapper(ProductMapper.class).getProductzzim(zzim) == 1) {
				System.out.println("찜성공");
			} else {
				System.out.println("찜실패");
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void getAccount(HttpServletRequest req) {
		try {
			req.setAttribute("accounts", ss.getMapper(AccountMapper.class).getAccount());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void showzzim(HttpServletRequest req) {
		try {
			Account a = (Account) req.getSession().getAttribute("loginAccount");
			
			req.setAttribute("showZzim", ss.getMapper(ProductMapper.class).showzzim(a));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deletezzim(Zzim zzim, HttpServletRequest request) {
		
		try {
		
			if (ss.getMapper(ProductMapper.class).deletezzim(zzim) == 1) {
				System.out.println("삭제성공");
			} else {
				System.out.println("삭제실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("삭제실패");
		}
		
	}

	public void productSearch(HttpServletRequest request, String p_name) {

		try {
			request.setAttribute("product", ss.getMapper(ProductMapper.class).getProductSearch(p_name));
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void writeReply(ProductReply pr,Product p, HttpServletRequest req) {

		try {
			String token = req.getParameter("token");
			String successToken = (String) req.getSession().getAttribute("successToken");

			if (successToken != null && token.equals(successToken)) {
				return;
			}

			Account a = (Account) req.getSession().getAttribute("loginAccount");
			pr.setR_owner(a.getA_id());
			System.out.println(pr.getR_p_no());
			System.out.println(pr.getR_owner());

			if (ss.getMapper(ProductMapper.class).writeReply(pr) == 1) {
				req.setAttribute("result", "댓글쓰기성공");
				req.getSession().setAttribute("successToken", token);
			} else {
				req.setAttribute("result", "댓글쓰기실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "댓글쓰기실패");
		}
	}

	public void getReply(Product product, HttpServletRequest req) {
		List<ProductReply> pr = ss.getMapper(ProductMapper.class).getReply(product);
		req.setAttribute("replys", pr);
	}
	public Product getProductDetailRp(HttpServletRequest request, Product product) {

		
		return ss.getMapper(ProductMapper.class).getProductDetail(product.getP_num());
		

	}

}
