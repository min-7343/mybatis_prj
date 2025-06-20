package day0605;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import day0602.CpEmpDTO;
import kr.co.sist.dao.MyBatisDAO;
import kr.co.sist.domain.CpEmp;

public class SelectDAO2 {
	
	private static SelectDAO2 sDAO;
	private SelectDAO2() {
		
	}
	public static SelectDAO2 getInstance() {
		if(sDAO==null) {
			sDAO=new SelectDAO2();
		}//end if
		return sDAO;
	}//getInstance
	
	/**
	 * 컬럼 여러개에 행하나 검색 : 사원번호를 입력받아 사원명,직무,연봉,보너스,입사일을 검색
	 * @param empno
	 */
	public CpEmp mcsr( int empno ) {
		CpEmp ceDomain=null;
		
		SqlSession ss=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(); //auto commit x
		//2.쿼리를 실행
		ceDomain=(CpEmp)ss.selectOne("kr.co.sist.day0605.mcsr",empno);
		//검색결과
		//3. Transaction처리
		//4. MyBatis Handler 닫기
		ss.close();
		return ceDomain;
	}//mcsr
	
	
	public List<CpEmp> mcmr( int deptno ) {
		List<CpEmp> list=null;
		
		SqlSession ss=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(); //auto commit x
		//2.쿼리를 실행
		list=ss.selectList("kr.co.sist.day0605.mcmr",deptno);
		//검색결과
		//3. Transaction처리
		//4. MyBatis Handler 닫기
		ss.close();
		return list;
	}//mcsr
	
	
	public List<CpEmp> lessThan( int sal )throws PersistenceException {
		List<CpEmp> list=null;
		
		SqlSession ss=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(); //auto commit x
		//2.쿼리를 실행
		list=ss.selectList("kr.co.sist.day0605.lessThan",sal);
		//검색결과
		//3. Transaction처리
		//4. MyBatis Handler 닫기
		ss.close();
		return list;
	}//lessThan
	
	public List<CpEmp> greaterThan( int sal )throws PersistenceException {
		List<CpEmp> list=null;
		
		SqlSession ss=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(); //auto commit x
		//2.쿼리를 실행
		list=ss.selectList("kr.co.sist.day0605.greaterThan",sal);
		//검색결과
		//3. Transaction처리
		//4. MyBatis Handler 닫기
		ss.close();
		return list;
	}//lessThan
	
	
	public static void main(String[] args) {
		//SelectDAO2.getInstance().mcsr(7788);
		
		try {
		//SelectDAO2.getInstance().lessThan(3000);
		SelectDAO2.getInstance().greaterThan(3000);
		}catch (PersistenceException pe){
			pe.printStackTrace();
		}
	 }

	
}//class
