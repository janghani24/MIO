package com.fp.mio.funding;

import java.util.List;

public interface FundingMapper {

	List<Funding> getFundingAll();

	int regFunding(Funding funding);

	List<Funding> getFundingCategory(String f_category);

	int deleteFunding(Funding funding);

}
