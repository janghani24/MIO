package com.fp.mio.account;

import java.util.List;

public interface AccountMapper {

	Account getAccountByID(Account a);

	int joinGeneral(Account a);
	
	int joinSeller(Seller s);

	int deleteAccount(Account a);

	int updateAccount(Account a);
	
	int updateGrade(Account a);

	List<Account> getAccount();

	List<Seller> getSeller();

	Seller getSellerById(Seller s);

	int IdCheck(String a_id);

	int IdCheckS(String a_id);

	int deleteAccountS(Seller s);


}
