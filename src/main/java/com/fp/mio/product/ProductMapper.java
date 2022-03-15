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


}
