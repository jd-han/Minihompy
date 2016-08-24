package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.MyAppSqlConfig;
import vo.AccountVO;

public class AccountDAO {
	SqlSession session = MyAppSqlConfig.getSqlSessionInstance();
	
	public List<AccountVO> selectRecentAccount(int userNo){
		return session.selectList("dao.AccountDAO.selectRecentAccount", userNo);
	}
	public int insertAccount(AccountVO account){
		int result = session.insert("dao.AccountDAO.insertAccount", account);
		session.commit();
		return result;
	}
	public int updateAccount(AccountVO account){
		int result = session.update("dao.AccountDAO.updateAccount", account);
		session.commit();
	    return result;
	}
	public int deleteAccount(int sortNo){
		int result = session.delete("dao.AccountDAO.deleteAccount", sortNo);
		session.commit();
		return result;
	}
	public AccountVO selectAccountByNo(int findNo) {
		return session.selectOne("dao.AccountDAO.selectAccountByNo", findNo);
	}
	
	



}
