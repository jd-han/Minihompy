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
		return session.insert("dao.AccountDAO.insertAccount", account);
	}
	public int updateAccount(AccountVO account){
		return session.update("dao.AccountDAO.updateAccount", account);
	}
	public int deleteAccount(int sortNo){
		return session.delete("dao.AccountDAO.deleteAccount", sortNo);
	}
	
	



}
