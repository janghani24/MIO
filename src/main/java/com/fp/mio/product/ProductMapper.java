package com.fp.mio.product;

import java.util.List;

import com.fp.mio.account.Account;



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

	List<Product> getProductSearch(String p_name);

	Product getProductDetail(int p_num);

	int writeReply(ProductReply pr);

	List<ProductReply> getReply(Product p);

<<<<<<< HEAD
=======
	int regFood(Product product);

	int regBeauty(Product product);

	int regLiving(Product product);

	int regFashion(Product product);
	
	int insertCart(Cart c);

	List<Cart> getCart(Account a);

	int getCartByPNo(Cart c);

	int updateCart(Cart c);

	int deleteReply(ProductReply pr);

	int deleteCart(Cart c);

>>>>>>> 326a519dc408fed1b61451e33e754faaf82b310e


}
