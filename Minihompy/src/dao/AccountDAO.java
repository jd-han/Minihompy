package dao;

import org.apache.ibatis.session.SqlSession;

import util.MyAppSqlConfig;

public class AccountDAO {
	SqlSession session = MyAppSqlConfig.getSqlSessionInstance();
	
	

}
