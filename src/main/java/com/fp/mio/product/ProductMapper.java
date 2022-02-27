package com.fp.mio.product;

import java.util.List;

import com.fp.mio.account.Account;


public interface ProductMapper {

	public List<Product> getFood();

	public List<Product> getFashion();

	public List<Product> getBeauty();

	public List<Product> getLiving();
	
	public Product getProductDetail(int p_num);

	public List<Product> getProductCategory(String p_category2);

	public int getProductzzim(Zzim zzim);
	
	public List<Account> getAccount();
	
	public List<Zzim> showzzim(Account a);

	public int deletezzim(Zzim zzim);

	


	

}
