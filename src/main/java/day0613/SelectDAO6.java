package day0613;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import day0602.CpEmpDTO;
import kr.co.sist.dao.MyBatisDAO;
import kr.co.sist.domain.CpEmp;
import kr.co.sist.domain.CpEmp2;
import kr.co.sist.domain.Car;

public class SelectDAO6 {
	
	private static SelectDAO6 sDAO;
	private SelectDAO6() {
		
	}
	public static SelectDAO6 getInstance() {
		if(sDAO==null) {
			sDAO=new SelectDAO6();
		}//end if
		return sDAO;
	}//getInstance
	
	
	public List<CpEmp> dynamicChoose(int deptno )throws PersistenceException {
		List<CpEmp> list=null;
		
		SqlSession ss=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(); //auto commit x
		//2.쿼리를 실행
		list=ss.selectList("kr.co.sist.day0613.dynamicChoose",deptno);
		//검색결과
		//3. Transaction처리
		//4. MyBatis Handler 닫기
		ss.close();
		return list;
	}//dynamicChoose
	
	public List<CpEmp> dynamicForeach(Map<String, Object> map)throws PersistenceException {
		List<CpEmp> list=null;
		
		SqlSession ss=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(); //auto commit x
		//2.쿼리를 실행
		list=ss.selectList("kr.co.sist.day0613.dynamicForeach",map);
		//<select id="dynamicForeach" resultType="" parameterMap="이름">
		//검색결과
		//3. Transaction처리
		//4. MyBatis Handler 닫기
		ss.close();
		return list;
	}//dynamicForeach
	
	public List<Integer> selectAllEmpno()throws PersistenceException {
		List<Integer> list=null;
		
		SqlSession ss=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(); //auto commit x
		//2.쿼리를 실행
		list=ss.selectList("kr.co.sist.day0613.selectAllEmpno");
		//검색결과
		//3. Transaction처리
		//4. MyBatis Handler 닫기
		ss.close();
		return list;
	}//selectAllEmpno
	
	public CpEmp selectOneEmp(int empno)throws PersistenceException {
		CpEmp empDomain=null;
		
		SqlSession ss=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(); //auto commit x
		//2.쿼리를 실행
		empDomain=ss.selectOne("kr.co.sist.day0613.selectOneEmp",empno);
		//검색결과
		
		empDomain.setEmpno(empno);// 검색결과가 아닌 입력값을 Domain에 할당
		//3. Transaction처리
		//4. MyBatis Handler 닫기
		ss.close();
		return empDomain;
	}//selectOneEmp
	
	public int dynamicSet(CpEmpDTO ceDTO)throws PersistenceException{
		int rowCnt=0;
		
		SqlSession ss=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(); //auto commit x
		//2.쿼리를 실행
		rowCnt=ss.update("kr.co.sist.day0613.dynamicSet",ceDTO);
		//검색결과
		if(rowCnt ==1 ) {
			ss.commit();
		}
		//3. Transaction처리
		//4. MyBatis Handler 닫기
		ss.close();
		
		return rowCnt;
	}//dynamicSet
	
	
	public int transaction(TransactionDTO tDTO) throws PersistenceException{
		int cnt=0, cnt2=0;
		//1. MyBatis Handler 얻기
		SqlSession ss=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(); //auto commit x -> 해제된 상태
		//2.쿼리를 실행
		cnt=ss.insert("kr.co.sist.day0613.transaction",tDTO);
		cnt2=ss.insert("kr.co.sist.day0613.transaction2",tDTO);
		//검색결과
		//auto commit이 해제된 상태이므로 if를 타지 않으면 commit이 되지 않는다.
		//둘 중 하나라도 되지 않으면 commit이 되지 않는다.
		if(cnt+cnt2 == 2) {
			ss.commit();
			//안타면 롤백된다.
		}
		//3. Transaction처리
		//4. MyBatis Handler 닫기
		ss.close();
		
		return cnt+cnt2;
	}//transaction
	
	

	public static void main(String[] args) {
		
		try {
		//SelectDAO6.getInstance().dynamicChoose(2);
		//SelectDAO6.getInstance().selectAllEmpno();
		//SelectDAO6.getInstance().selectOneEmp(63);
		//	CpEmpDTO ce=new CpEmpDTO(44,9000,900,"오장훈","용사",null);
		//SelectDAO6.getInstance().dynamicSet(ce);
			
			TransactionDTO tDTO=new TransactionDTO();
			tDTO.setName("강태오");
			tDTO.setAddr("서울시 강서구");
			SelectDAO6.getInstance().transaction(tDTO);
		}catch (PersistenceException pe){
			pe.printStackTrace();
		}
	 }

	
}//class
