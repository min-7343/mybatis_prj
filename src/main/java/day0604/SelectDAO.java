package day0604;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import day0602.CpEmpDTO;
import kr.co.sist.dao.MyBatisDAO;
import kr.co.sist.domain.CpEmp;

public class SelectDAO {
	
	private static SelectDAO sDAO;
	private SelectDAO() {
		
	}
	public static SelectDAO getInstance() {
		if(sDAO==null) {
			sDAO=new SelectDAO();
		}//end if
		return sDAO;
	}//getInstance
	
	/**
	 * 컬럼하나에 행하나 검색 : 사원번호를 입력받아 사원명을 검색
	 * @param empno
	 */
	public String scsr( int empno ) {
		String ename="";
		
		SqlSession ss=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(); //auto commit x
		//2.쿼리를 실행
		ename=ss.selectOne("kr.co.sist.day0604.scsr",empno);
		//검색결과
		//3. Transaction처리
		//4. MyBatis Handler 닫기
		ss.close();
		return ename;
	}//selectOne
	
	
	/**
	 * 컬럼 하나에 여러 행 조회
	 * @return
	 */
	public List<Integer> scmr() {
		List<Integer> list=null;
		
		SqlSession ss=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(); //auto commit x
		//2.쿼리를 실행 <select id="scmr" resultType="int"> parameterType속성이 
		//사용되지 않으므로, 매개변수가 하나인, selectList를 호출한다.
		list=ss.selectList("kr.co.sist.day0604.scmr");
		//검색결과
		//3. Transaction처리
		//4. MyBatis Handler 닫기
		ss.close();
		return list;
	}//selectOne

	
	
}//class
