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

	int idCheck(String a_id);

	int idCheckS(String a_id);

	int deleteAccountS(Seller s);

	Account searchId(Account a);

	int getAccountCount(AccountSelector ps);

	List<Account> getAccountSearch(AccountSelector search);


}
