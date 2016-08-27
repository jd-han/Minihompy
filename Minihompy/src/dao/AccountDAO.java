package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.MyAppSqlConfig;
import vo.AccountSearchVO;
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
	
	
	//검색용
	public List<AccountVO> selectAccountByTerm(AccountSearchVO aSearch) {
		return session.selectList("dao.AccountDAO.selectAccountByTerm", aSearch);
	}
	
	public List<AccountVO> selectAccountByTermAndCategory(AccountSearchVO aSearch) {
		return session.selectList("dao.AccountDAO.selectAccountByTermAndCategory", aSearch);
	}
	
	
	
	

	public List<AccountVO> selectAccountByPayment(AccountSearchVO account) {
		return session.selectList("dao.AccountDAO.selectAccountByPayment", account);
	}
	public List<AccountVO> selectAccountByPaymentAndCategory(AccountSearchVO aSearch) {
		return session.selectList("dao.AccountDAO.selectAccountByPaymentAndCategory", aSearch);
	}
	public List<AccountVO> searchAccountByCategory(AccountSearchVO aSearch) {
		return session.selectList("dao.AccountDAO.searchAccountByCategory", aSearch);
	}
	public List<AccountVO> searchAccountByCategoryAndCategory(AccountSearchVO aSearch) {
		return session.selectList("dao.AccountDAO.searchAccountByCategoryAndCategory", aSearch);
	}

	

	



}
