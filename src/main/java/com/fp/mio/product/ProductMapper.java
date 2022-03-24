package com.fp.mio.product;

import java.util.List;

import com.fp.mio.account.Account;
import com.fp.mio.account.AccountSelector;



public interface ProductMapper {

	List<Product> getProductAll();

	List<Product> getFood();

	List<Product> getFashion();

	List<Product> getBeauty();

	List<Product> getLiving();
	


	public int getProductzzim(Zzim zzim);
	
	public List<Account> getAccount();
	
	public List<Zzim> showzzim(Account a);

	public int deletezzim(Zzim zzim);

	List<Product> getProductCategory(String p_category2);

	List<Product> getProductSearch(ProductSelector ps);

	Product getProductDetail(int p_num);

	int writeReply(ProductReply pr);

	List<ProductReply> getReply(Product p);


	int regFood(Product product);

	int regBeauty(Product product);

	int regLiving(Product product);

	int regFashion(Product product);
	
	int insertCart(Cart c);

	List<Cart> getCart(Account a);

	int getCartByPNo(Cart c);
	
	int getProductPnum(Product p);

	int updateCart(Cart c);

	int deleteReply(ProductReply pr);

	int deleteCart(Cart c);

	int deleteProduct(Product p);

	int getProductCount(ProductSelector search);

	int getCProductCount(ProductCSelector search);

	List<Product> getCProductSearch(ProductCSelector search);

	int getC2ProductCount(ProductCSelector search);

	List<Product> getC2ProductSearch(ProductCSelector search);

	int regFashionDetail(ProductDetail pd);

	int updateProduct(Product product);

	ProductDetail getFashionDetail(Product p);

	int updateProductDetail(ProductDetail pd);

	List<Product> getProductRandom();

	public List<OrderDAO> getOrder(Account a);

	int getProductorderbuy(OrderDAO oda);

	List<Account> getAccountSearch(AccountSelector search);


}
