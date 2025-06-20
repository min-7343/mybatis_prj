package day0602;

import org.apache.ibatis.session.SqlSession;

import kr.co.sist.dao.MyBatisDAO;

public class InsertDAO {
	
	public void insertCpEmp7() {
		//MyBatis Handler (SqlSession을 얻기)
		SqlSession ss=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml").getMyBatisHandler(true);
		//실행
		int cnt=ss.insert("day0602.insertCpEmp7");
		System.out.println(cnt+"건 추가");
		//transaction처리
		if( cnt == 1 ) {
			ss.commit();//
		}
		//끊기
		ss.close();
		
	}
	
	public void insertEmpno(int empno) {
		//MyBatis Handler (SqlSession을 얻기)
		SqlSession ss=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml").getMyBatisHandler(true);
		
		//실행
		int cnt=ss.insert("day0602.insertEmpno",empno);
		System.out.println(cnt+"건 추가");
		
		//transaction처리
		if( cnt == 1 ) {
			ss.commit();//
		}
		//끊기
		ss.close();
		
	}
	
	public void insertDTO(CpEmpDTO ceDTO) {
		//MyBatis Handler (SqlSession을 얻기)
		SqlSession ss=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml").getMyBatisHandler(true);
		
		//실행
		int cnt=ss.insert("day0602.insertDTO",ceDTO);
		System.out.println(cnt+"건 추가");
		
		//transaction처리
		if( cnt == 1 ) {
			ss.commit();//
		}
		//끊기
		ss.close();
	}
	

	public static void main(String[] args) {
		InsertDAO iDAO=new InsertDAO();
		//iDAO.insertCpEmp7();
		//iDAO.insertEmpno(404);
		CpEmpDTO cp=new CpEmpDTO(1234,3100,0,"유연수","QA",null);
		iDAO.insertDTO(cp);
	}//main

}//class
