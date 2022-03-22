package com.fp.mio.community;

import java.util.List;

import com.fp.mio.account.Account;

public interface CommunityMapper {

	int getMsgCount(CmSelector cs);

	List<CommunityMsg> getMsg(CmSelector search);

	List<Communityre> getReply(CommunityMsg cmMsg);
	
	public abstract int updateMsg(CommunityMsg cm);
	public abstract int writeMsg(CommunityMsg cm);
	public abstract int delMsg(CommunityMsg cm);
	public abstract int writeReply(Communityre cmr);
	public abstract int delReply(Communityre cmr);
	public abstract Integer getMsgCountByOwner(Account a);

}