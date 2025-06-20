package day0602;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import day0530.Dept;
import kr.co.sist.dao.MyBatisDAO;


public class TestConfig {
	
	
	public void useMyBatis() {
		//1.설정용 xml과 연결
				
				MyBatisDAO mbDAO=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml");
				//3. MyBatis Handler 얻기
				SqlSession ss=mbDAO.getMyBatisHandler();
				//4. Handler를 사용한 조작
				//int cnt=ss.selectOne("kr.co.sist.hello.webMemberCnt");
				
				//MyBatis Handler(ss)가 namespace와 id를 결합하여 node를 찾고 parsing
				//List<Dept> list=ss.selectList("kr.co.sist.hello.selectAllDept");
				
				//MyBatis Handler(ss)가 namespace는 생략가능
				List<Dept> list=ss.selectList("day0602.selectAllDept");
				
				for(Dept dept : list ) {
					System.out.println(dept.getDeptno()+" / "+dept.getDname()+" / "+
										dept.getLoc());
				}
				//System.out.println( cnt+"건" );
				//5. MyBatis Handler 닫기
				ss.close();
			
			
	}//useMyBatis

	public static void main(String[] args) {

		new TestConfig().useMyBatis();
		
	}//main

}//class
