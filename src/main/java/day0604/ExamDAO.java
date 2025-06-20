package day0604;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import day0602.CpEmpDTO;
import kr.co.sist.dao.MyBatisDAO;
import kr.co.sist.domain.CpEmp;

public class ExamDAO {
	
	public void updateDTO(CpEmpDTO ceDTO) {
		//MyBatis Handler (SqlSession을 얻기)
		SqlSession ss=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(true); //auto commit x
		//실행
		int cnt=ss.insert("day0604.updateCpEmp",ceDTO);
		System.out.println(cnt+"변경+");
		
		//transaction처리
		if( cnt != 0 ) {
			ss.commit();//
		}//end if
		//끊기
		ss.close();
	}//updateDTO
	
	public void deleteCpEmp(int empno) {
		//1.MyBatis Handler얻기
		SqlSession ss=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(true); //auto commit x
		//2.쿼리를 실행
		int cnt=ss.delete("day0604.deleteCpEmp",empno);
		//int cnt=ss.update("day0604.deleteCpEmp",empno);//이렇게해도 deleteCpEmp를 찾아가서 삭제된다.
		//쿼리를 찾아가기 때문에 어떤 것으로 해도 된다 - 의미적으로 맞춘것
		//insert,update,delete 아무것으로 해도 된다.
		System.out.println(cnt+"건 삭제");
		//3. Transaction처리
		if(cnt!=0) {
			ss.commit();
		}
		//4. MyBatis Handler 닫기
		ss.close();
		
	}//deleteCpEmp
	
	public void selectOne( int empno ) {
		SqlSession ss=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(true); //auto commit x
		//2.쿼리를 실행
		CpEmp ceDomaoin=ss.selectOne("day0604.selectOne",empno);
		//int cnt=ss.update("day0604.deleteCpEmp",empno);//이렇게해도 deleteCpEmp를 찾아가서 삭제된다.
		ceDomaoin.setEmpno(empno);
		System.out.println(ceDomaoin);
		//3. Transaction처리
		//4. MyBatis Handler 닫기
		ss.close();
	}//selectOne
	
	public void selectList() {
		SqlSession ss=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(true); //auto commit x
		//2.쿼리를 실행 : 여러 행 검색
		List<CpEmp> list=ss.selectList("day0604.selectList");
		//int cnt=ss.update("day0604.deleteCpEmp",empno);//이렇게해도 deleteCpEmp를 찾아가서 삭제된다.
		System.out.println(list);
		//3. Transaction처리
		//4. MyBatis Handler 닫기
		ss.close();
		
	}
	

	public static void main(String[] args) {
		ExamDAO iDAO=new ExamDAO();
		//iDAO.insertCpEmp7();
		//iDAO.insertEmpno(404);
		//CpEmpDTO cp=new CpEmpDTO(44,4100,100,"삼장훈","SM",null);
		//iDAO.updateDTO(cp);
		//deleteCpEmp
		//int empno=44;
		//iDAO.deleteCpEmp(empno);
		//iDAO.selectOne(empno);
		//list
		iDAO.selectList();
	}//main

}//class
