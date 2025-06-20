package kr.co.sist.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisDAO {
	
	private static MyBatisDAO mbDAO;
	private static SqlSessionFactory ssf;
	
	private String configPath;
	
	private MyBatisDAO(String configPath) {
		org.apache.ibatis.logging.LogFactory.useLog4J2Logging();
		this.configPath=configPath;
	}
	
	/**
	 * MyBatisDAO 프레임워크에서 연동할 DB의 설정을 가진 경로를 상대경로로 설정 <br>
	 * 예) 상대경로 :  패키지명/설정파일명.xml로 설정
	 * 				kr/co/sist/dao/mybatis-config.xml
	 * @param configPath
	 * @return
	 */
	public static MyBatisDAO getInstance(String configPath) {
		if(mbDAO==null) {
			mbDAO=new MyBatisDAO(configPath);
		}
		return mbDAO;
	}//getInstance
	

	private SqlSessionFactory getSqlSessionFactory() {
	    if (ssf == null) {
	        try {
	            Reader reader = Resources.getResourceAsReader(configPath); // configPath 사용하도록 수정
	            ssf = new SqlSessionFactoryBuilder().build(reader);
	        } catch (IOException e) {
	            e.printStackTrace(); // 예외 처리가 없던 부분 보완
	        }
	    }
	    return ssf;
	}//getSqlSessionFActory
	public SqlSession getMyBatisHandler(  ) {
		SqlSession ss=getMyBatisHandler(false);
		return ss;
	}
	/**
	 * autoCommitFlag을 설정하는 Mybatis 핸들러 얻기
	 * @param autoCommitFlag true, false
	 * @return
	 */
	public SqlSession getMyBatisHandler(boolean autoCommitFlag) {
		SqlSession ss=getSqlSessionFactory().openSession(autoCommitFlag);
		return ss;
	}
	

}//class
