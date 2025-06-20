package day0609;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import day0602.CpEmpDTO;
import kr.co.sist.dao.MyBatisDAO;
import kr.co.sist.domain.CpEmp;
import kr.co.sist.domain.Zipcode;

public class SelectDAO3 {
	
	private static SelectDAO3 sDAO;
	private SelectDAO3() {
		
	}
	public static SelectDAO3 getInstance() {
		if(sDAO==null) {
			sDAO=new SelectDAO3();
		}//end if
		return sDAO;
	}//getInstance
	
	public List<Zipcode> like( String dong )throws PersistenceException {
		List<Zipcode> list=null;
		
		SqlSession ss=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(); //auto commit x
		//2.쿼리를 실행
		list=ss.selectList("kr.co.sist.day0609.like",dong);
		//검색결과
		//3. Transaction처리
		//4. MyBatis Handler 닫기
		ss.close();
		return list;
	}//like
	
	public List<CpEmp> subquery( )throws PersistenceException {
		List<CpEmp> list=null;
		
		SqlSession ss=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(); //auto commit x
		//2.쿼리를 실행
		list=ss.selectList("kr.co.sist.day0609.subquery");
		//검색결과
		//3. Transaction처리
		//4. MyBatis Handler 닫기
		ss.close();
		return list;
	}//like
	
	
	
	public static void main(String[] args) {
		
		try {
		//SelectDAO3.getInstance().like("상도동");
		SelectDAO3.getInstance().subquery();
		}catch (PersistenceException pe){
			pe.printStackTrace();
		}
	 }

	
}//class
