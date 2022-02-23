package com.fp.mio.product;

import java.util.List;


public interface ProductMapper {

	public List<Product> getFood();

	public List<Product> getFashion();

	public List<Product> getBeauty();

	public List<Product> getLiving();
	
	public Product getProductDetail();

	

}
