package com.fp.mio.product;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.mio.account.Account;
import com.fp.mio.account.AccountMapper;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class ProductDAO {

	@Autowired
	private SqlSession ss;

	@Autowired
	private com.fp.mio.SiteOption so;
	
	private int allPCount;
	
	public int getAllPCount() {
		return allPCount;
	}
	public void setAllPCount(int allPCount) {
		this.allPCount = allPCount;
	}

	public void calcAllPCount() {
		ProductSelector ps = new ProductSelector("", null, null);
		allPCount = ss.getMapper(ProductMapper.class).getProductCount(ps);
	}
	
	
	public void getProductAll(HttpServletRequest request) {

		try {
			request.setAttribute("products", ss.getMapper(ProductMapper.class).getProductAll());
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

	public Product getProductDetail(HttpServletRequest request, Product product) {
		System.out.println(product.getP_num() + " ~?~?~?~?~?~~?~?~~?~?~?");
		return ss.getMapper(ProductMapper.class).getProductDetail(product.getP_num());

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

	public void getProductzzim(HttpServletRequest request, Zzim zzim) {
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


	public void productSearch(ProductSelector ps,HttpServletRequest request) {
			System.out.println(ps.getSearch());
			request.setAttribute("search", ps);
		

	}

	public void writeReply(ProductReply pr, Product p, HttpServletRequest req) {

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

	public void regFood(HttpServletRequest request, Product product) {

		try {
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			String path = request.getSession().getServletContext().getRealPath("resources/img/food");
			MultipartRequest mr = new MultipartRequest(request, path, 5 * 1024 * 1024, "utf-8", policy);

			int p_price = Integer.parseInt(mr.getParameter("p_price"));
			int p_quantity = Integer.parseInt(mr.getParameter("p_quantity"));

			product.setP_name(mr.getParameter("p_name"));
			product.setP_price(p_price);
			product.setP_brand(mr.getParameter("p_brand"));
			String file = mr.getFilesystemName("p_photo");
			product.setP_photo(file);
			String file2 = mr.getFilesystemName("p_content");
			product.setP_content(file2);
			product.setP_quantity(p_quantity);

			String p_category2 = "";
			String c = mr.getParameter("p_category2");

			if (c.equals("식사거리")) {
				p_category2 = "식사거리";
			} else if (c.equals("간식거리")) {
				p_category2 = "간식거리";
			} else if (c.equals("요리재료")) {
				p_category2 = "요리재료";
			} else {
				p_category2 = "건강식품";
			}

			product.setP_category1("food");
			product.setP_category2(p_category2);

			Date today = new Date();
			product.setP_date(today);

			Account a = (Account) request.getSession().getAttribute("loginAccount");
			product.setP_owner(a.getA_id());
			
			if (ss.getMapper(ProductMapper.class).regFood(product) == 1) {
				allPCount++;
				request.setAttribute("r", "등록성공!");
				System.out.println("--등록 성공--");
			} else {
				request.setAttribute("r", "등록실패!");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void regFashion(HttpServletRequest request, Product product) {

		try {
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			String path = request.getSession().getServletContext().getRealPath("resources/img/fashion");
			MultipartRequest mr = new MultipartRequest(request, path, 5 * 1024 * 1024, "utf-8", policy);

			int p_price = Integer.parseInt(mr.getParameter("p_price"));
			int p_quantity = Integer.parseInt(mr.getParameter("p_quantity"));

			product.setP_name(mr.getParameter("p_name"));
			product.setP_price(p_price);
			product.setP_brand(mr.getParameter("p_brand"));
			String file = mr.getFilesystemName("p_photo");
			product.setP_photo(file);
			String file2 = mr.getFilesystemName("p_content");
			product.setP_content(file2);
			product.setP_quantity(p_quantity);
			String p_category2 = "";
			String c = mr.getParameter("p_category2");

			if (c.equals("의류")) {
				p_category2 = "의류";
			} else if (c.equals("가방")) {
				p_category2 = "가방";
			} else if (c.equals("지갑")) {
				p_category2 = "지갑";
			} else if (c.equals("패션소품")) {
				p_category2 = "패션소품";
			} else if (c.equals("케이스")) {
				p_category2 = "케이스";
			} else {
				p_category2 = "신발";
			}

			product.setP_category1("fashion");
			product.setP_category2(p_category2);

			Date today = new Date();
			product.setP_date(today);

			Account a = (Account) request.getSession().getAttribute("loginAccount");
			product.setP_owner(a.getA_id());
			
			if (ss.getMapper(ProductMapper.class).regFashion(product) == 1) {
				allPCount++;
				request.setAttribute("r", "등록성공!");
				System.out.println("--등록 성공--");
			} else {
				request.setAttribute("r", "등록실패!");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void regBeauty(HttpServletRequest request, Product product) {

		try {
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			String path = request.getSession().getServletContext().getRealPath("resources/img/beauty");
			MultipartRequest mr = new MultipartRequest(request, path, 5 * 1024 * 1024, "utf-8", policy);

			int p_price = Integer.parseInt(mr.getParameter("p_price"));
			int p_quantity = Integer.parseInt(mr.getParameter("p_quantity"));

			product.setP_name(mr.getParameter("p_name"));
			product.setP_price(p_price);
			product.setP_brand(mr.getParameter("p_brand"));
			String file = mr.getFilesystemName("p_photo");
			product.setP_photo(file);
			String file2 = mr.getFilesystemName("p_content");
			product.setP_content(file2);
			product.setP_quantity(p_quantity);
			String p_category2 = "";
			String c = mr.getParameter("p_category2");

			if (c.equals("스킨케어")) {
				p_category2 = "스킨케어";
			} else if (c.equals("바디케어")) {
				p_category2 = "바디케어";
			} else if (c.equals("메이크업")) {
				p_category2 = "메이크업";
			} else {
				p_category2 = "선케어";
			}

			product.setP_category1("beauty");
			product.setP_category2(p_category2);

			Date today = new Date();
			product.setP_date(today);

			Account a = (Account) request.getSession().getAttribute("loginAccount");
			product.setP_owner(a.getA_id());
			
			if (ss.getMapper(ProductMapper.class).regBeauty(product) == 1) {
				allPCount++;
				request.setAttribute("r", "등록성공!");
				System.out.println("--등록 성공--");
			} else {
				request.setAttribute("r", "등록실패!");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void regLiving(HttpServletRequest request, Product product) {

		try {
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			String path = request.getSession().getServletContext().getRealPath("resources/img/living");
			MultipartRequest mr = new MultipartRequest(request, path, 5 * 1024 * 1024, "utf-8", policy);

			int p_price = Integer.parseInt(mr.getParameter("p_price"));
			int p_quantity = Integer.parseInt(mr.getParameter("p_quantity"));

			product.setP_name(mr.getParameter("p_name"));
			product.setP_price(p_price);
			product.setP_brand(mr.getParameter("p_brand"));
			String file = mr.getFilesystemName("p_photo");
			product.setP_photo(file);
			String file2 = mr.getFilesystemName("p_content");
			product.setP_content(file2);
			product.setP_quantity(p_quantity);
			String p_category2 = "";
			String c = mr.getParameter("p_category2");

			if (c.equals("주방용품")) {
				p_category2 = "주방용품";
			} else if (c.equals("욕실용품")) {
				p_category2 = "욕실용품";
			} else if (c.equals("생활용품")) {
				p_category2 = "생활용품";
			} else {
				p_category2 = "문구";
			}

			product.setP_category1("living");
			product.setP_category2(p_category2);

			Date today = new Date();
			product.setP_date(today);

			Account a = (Account) request.getSession().getAttribute("loginAccount");
			product.setP_owner(a.getA_id());
			
			if (ss.getMapper(ProductMapper.class).regLiving(product) == 1) {
				allPCount++;
				request.setAttribute("r", "등록성공!");
				System.out.println("--등록 성공--");
			} else {
				request.setAttribute("r", "등록실패!");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void insertCart(Cart c, HttpServletRequest request, Product p) {

		Product pp = ss.getMapper(ProductMapper.class).getProductDetail(p.getP_num());
		c.setC_name(pp.getP_name());
		System.out.println(c.getC_p_photo());
		
		if (ss.getMapper(ProductMapper.class).getCartByPNo(c) == 1) {
			
			if (ss.getMapper(ProductMapper.class).updateCart(c) == 1) {
				request.setAttribute("result", "장바구니 넣기 성공");
			} else {
				request.setAttribute("result", "장바구니 넣기 실패");
			}
			
		}else {
		
		
		if (ss.getMapper(ProductMapper.class).insertCart(c) == 1) {
			request.setAttribute("result", "장바구니 넣기 성공");
		} else {
			request.setAttribute("result", "장바구니 넣기 실패");
		}
		
		}
	}

	public void getCart(HttpServletRequest request) {
		try {
			Account a = (Account) request.getSession().getAttribute("loginAccount");
			request.setAttribute("carts", ss.getMapper(ProductMapper.class).getCart(a));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	public void deleteReply(ProductReply pr, HttpServletRequest req) {
		if (ss.getMapper(ProductMapper.class).deleteReply(pr) == 1) {
			req.setAttribute("result", "댓글 삭제 성공");
		} else {
			req.setAttribute("result", "댓글 삭제 실패");
		}
	}

	public void deleteCart(HttpServletRequest request, Cart c) {
		Account a = (Account) request.getSession().getAttribute("loginAccount");
		c.setC_a_id(a.getA_id());
		if (ss.getMapper(ProductMapper.class).deleteCart(c) == 1) {
			request.setAttribute("result", "장바구니 삭제 성공");
		} else {
			request.setAttribute("result", "장바구니 삭제 실패");
		}

	}

	public void updateCart(HttpServletRequest request, Cart c) {
		Account a = (Account) request.getSession().getAttribute("loginAccount");
		c.setC_a_id(a.getA_id());
		if (ss.getMapper(ProductMapper.class).updateCart(c) == 1) {
			request.setAttribute("result", "장바구니 수정 성공");
		} else {
			request.setAttribute("result", "장바구니 수정 실패");
		}

	}

	public void deleteProduct(HttpServletRequest request, Product p) {
		if (ss.getMapper(ProductMapper.class).deleteProduct(p) == 1) {
			request.setAttribute("r", "삭제 성공!");
		} else {
			request.setAttribute("r", "삭제 실패!");
		}		
	}
	

public void getProduct(int pageNo, HttpServletRequest req) {

	int count = so.getProductCountPerpage();
	int start = (pageNo - 1) * count + 1;
	int end = start + (count - 1);

	ProductSelector search = (ProductSelector) req.getAttribute("search");
	int pCount = 0;

	if (search == null) {
		search = new ProductSelector("",new BigDecimal(start),new BigDecimal(end));
		pCount = allPCount; 
	} else {
		search.setStart(new BigDecimal(start));
		search.setEnd(new BigDecimal(end));
		pCount = ss.getMapper(ProductMapper.class).getProductCount(search);
		
	}
	System.out.println(search.getSearch());
	System.out.println(search.getStart());
	
	List<Product> products = ss.getMapper(ProductMapper.class).getProductSearch(search);
	

	int pageCount = (int) Math.ceil(pCount / (double) count);
	
	req.setAttribute("pageCount", pageCount);

	req.setAttribute("products", products);
	req.setAttribute("curPage", pageNo);

}

	
	


}
