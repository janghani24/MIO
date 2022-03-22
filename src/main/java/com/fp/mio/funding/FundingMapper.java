package com.fp.mio.funding;

import java.util.List;

import com.fp.mio.product.Product;

public interface FundingMapper {

	List<Funding> getFundingAll();

	int regFunding(Funding funding);

	List<Funding> getFundingCategory(String f_category);

	int deleteFunding(Funding funding);

	int getFundingCount(FundingSelector fs);

	List<Funding> getFundingSearch(FundingSelector search);

	int updateFunding(Funding funding);

	Funding getFundingtDetail(int f_num);

}
