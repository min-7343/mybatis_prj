package day0610;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.dao.MyBatisDAO;
import kr.co.sist.domain.CpEmp;
import kr.co.sist.domain.Car;

public class SelectDAO4 {
	
	private static SelectDAO4 sDAO;
	private SelectDAO4() {
		
	}
	public static SelectDAO4 getInstance() {
		if(sDAO==null) {
			sDAO=new SelectDAO4();
		}//end if
		return sDAO;
	}//getInstance
	
	
	public List<CpEmp> union( )throws PersistenceException {
		List<CpEmp> list=null;
		
		SqlSession ss=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(); //auto commit x
		//2.쿼리를 실행
		list=ss.selectList("kr.co.sist.day0610.union");
		//검색결과
		//3. Transaction처리
		//4. MyBatis Handler 닫기
		ss.close();
		return list;
	}//union
	
	public List<Car> join(String model )throws PersistenceException {
		List<Car> list=null;
		
		SqlSession ss=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(); //auto commit x
		//2.쿼리를 실행
		list=ss.selectList("kr.co.sist.day0610.join",model);
		//검색결과
		//3. Transaction처리
		//4. MyBatis Handler 닫기
		ss.close();
		return list;
	}//join
	
	
	public List<String> selectAllModel( )throws PersistenceException {
		List<String> list=null;
		
		SqlSession ss=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(); //auto commit x
		//2.쿼리를 실행
		list=ss.selectList("kr.co.sist.day0610.selectAllModel");
		//검색결과
		//3. Transaction처리
		//4. MyBatis Handler 닫기
		ss.close();
		return list;
	}//selectAllModel
	
	
	
	
	public static void main(String[] args) {
		
		try {
		//SelectDAO4.getInstance().union();
		SelectDAO4.getInstance().join("아반테");
		}catch (PersistenceException pe){
			pe.printStackTrace();
		}
	 }

	
}//class
