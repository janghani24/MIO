package com.fp.mio.funding;

import java.util.List;

public interface FundingMapper {

	List<Funding> getFundingAll();

	Funding deleteFunding(int f_num);

	int regFunding(Funding funding);

	List<Funding> getFundingCategory(String f_category2);

}
