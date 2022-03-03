package com.fp.mio.product;

import java.util.List;

public interface ProductMapper {

	List<Product> getProductAll();

	List<Product> getFood();

	List<Product> getFashion();

	List<Product> getBeauty();

	List<Product> getLiving();

	List<Product> getProductCategory(String p_category2);

	List<Product> getProductSearch(String p_name);

	Product getProductDetail(int p_num);

}
