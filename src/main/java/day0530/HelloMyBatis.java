package day0530;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class HelloMyBatis {
	
	public void useMyBatis() {
		File file=new File("C:/dev/workspace/mybatis_prj/src/main/java/day0530/mybatis-config.xml");
		if( file.exists()) {
		//1.설정용 xml과 연결
			try {
				Reader reader = Resources.getResourceAsReader("day0530/mybatis-config.xml");
				//2. MyBatis 프레임워크생성
				
				SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(reader);
				//3. MyBatis Handler 얻기
				SqlSession ss=ssf.openSession();
				//4. Handler를 사용한 조작
				//int cnt=ss.selectOne("kr.co.sist.hello.webMemberCnt");
				List<Dept> list=ss.selectList("kr.co.sist.hello.selectAllDept");
				
				for(Dept dept:list ) {
					System.out.println(dept.getDeptno()+" / "+dept.getDname()+" / "+
										dept.getLoc());
				}
				//System.out.println( cnt+"건" );
				//5. MyBatis Handler 닫기
				ss.close();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}//useMyBatis

	public static void main(String[] args) {

		new HelloMyBatis().useMyBatis();
		
	}//main

}//class
