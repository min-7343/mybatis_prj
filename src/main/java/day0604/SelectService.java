package day0604;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.sist.dao.MyBatisDAO;

public class SelectService {
	
	public String scsr( int empno ) {
		String ename="";
		
		SelectDAO sDAO=SelectDAO.getInstance();
		ename=sDAO.scsr(empno);
		
		return ename;
	}//scsr
	
	public List<Integer> scmr() {
		List<Integer> list=null;
		
		SelectDAO sDAO=SelectDAO.getInstance();
		list=sDAO.scmr();
		
		//검색결과
		return list;
	}//scmr
	
	
}//class
