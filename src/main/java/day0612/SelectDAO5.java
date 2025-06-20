package day0612;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.dao.MyBatisDAO;
import kr.co.sist.domain.CpEmp;
import kr.co.sist.domain.CpEmp2;
import kr.co.sist.domain.Car;

public class SelectDAO5 {
	
	private static SelectDAO5 sDAO;
	private SelectDAO5() {
		
	}
	public static SelectDAO5 getInstance() {
		if(sDAO==null) {
			sDAO=new SelectDAO5();
		}//end if
		return sDAO;
	}//getInstance
	
	
	public List<Car> joinSubquery(String maker )throws PersistenceException {
		List<Car> list=null;
		
		SqlSession ss=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(); //auto commit x
		//2.쿼리를 실행
		list=ss.selectList("kr.co.sist.day0612.join_subquery",maker);
		//검색결과
		//3. Transaction처리
		//4. MyBatis Handler 닫기
		ss.close();
		return list;
	}//joinSubquery
	
	
	public List<String> selectAllMaker( )throws PersistenceException {
		List<String> list=null;
		
		SqlSession ss=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(); //auto commit x
		//2.쿼리를 실행
		list=ss.selectList("kr.co.sist.day0612.selectAllMaker");
		//검색결과
		//3. Transaction처리
		//4. MyBatis Handler 닫기
		ss.close();
		return list;
	}//selectAllMaker
	
	public List<CpEmp> dollarSign(String tableName )throws PersistenceException {
		List<CpEmp> list=null;
		
		SqlSession ss=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(); //auto commit x
		//2.쿼리를 실행
		list=ss.selectList("kr.co.sist.day0612.dollarSign",tableName);
		//검색결과
		//3. Transaction처리
		//4. MyBatis Handler 닫기
		ss.close();
		return list;
	}//selectAllMaker
	
	public List<CpEmp2> dynamicIf(WhereDTO wDTO )throws PersistenceException {
		List<CpEmp2> list=null;
		
		SqlSession ss=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(); //auto commit x
		//2.쿼리를 실행
		list=ss.selectList("kr.co.sist.day0612.dynamicIf",wDTO);
		//검색결과
		//3. Transaction처리
		//4. MyBatis Handler 닫기
		ss.close();
		return list;

	}//dynamicIf
	
	

	
	
	
	
	
	public static void main(String[] args) {
		
		try {
	//	SelectDAO5.getInstance().joinSubquery("기아");
	//	SelectDAO5.getInstance().dollarSign("emp");
			WhereDTO wDTO=new WhereDTO();
			wDTO.setDeptno(10);
		SelectDAO5.getInstance().dynamicIf(wDTO);
		}catch (PersistenceException pe){
			pe.printStackTrace();
		}
	 }

	
}//class
