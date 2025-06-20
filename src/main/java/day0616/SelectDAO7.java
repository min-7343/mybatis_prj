package day0616;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import day0602.CpEmpDTO;
import kr.co.sist.dao.MyBatisDAO;
import kr.co.sist.domain.CpEmp;
import kr.co.sist.domain.CpEmp2;
import kr.co.sist.domain.Car;

public class SelectDAO7 {
	
	private static SelectDAO7 sDAO;
	private SelectDAO7() {
		
	}
	public static SelectDAO7 getInstance() {
		if(sDAO==null) {
			sDAO=new SelectDAO7();
		}//end if
		return sDAO;
	}//getInstance
	
	
	public void insertProc( CpEMP6DTO ce6DTO) throws PersistenceException{
		//1. MyBatis Handler 얻기
		SqlSession ss=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(); //auto commit x -> 해제된 상태
		//2.쿼리를 실행
		ss.selectOne("kr.co.sist.day0616.proceduerSelect",ce6DTO);
		//검색결과
		//3. Transaction처리
		//4. MyBatis Handler 닫기
		ss.close();
		
	}//insertProc
	
	public void selectProc( HashMap<String, Object> hashmap) throws PersistenceException{
		//1. MyBatis Handler 얻기
		SqlSession ss=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(); //auto commit x -> 해제된 상태
		//2.쿼리를 실행
		ss.selectOne("kr.co.sist.day0616.procedureSelect",hashmap);
		//검색결과
		//3. Transaction처리
		//4. MyBatis Handler 닫기
		ss.close();
		
	}//selectProc
	
	

	public static void main(String[] args) {
		
		try {
			/*
			CpEMP6DTO ceDTO=new CpEMP6DTO();
			ceDTO.setEmpno(4);
			ceDTO.setEname("사장훈");
			ceDTO.setJob("개팔자");
			ceDTO.setSal(3500);
			
			SelectDAO7.getInstance().insertProc(ceDTO);
			System.out.println(ceDTO.getCnt());
			System.out.println(ceDTO.getMsg());*/
			HashMap<String, Object> hm=new HashMap<String,Object>();
			hm.put("maker", "현대");
			SelectDAO7.getInstance().selectProc(hm);
			System.out.println(hm);
			
		}catch (PersistenceException pe){
			pe.printStackTrace();
		}
	 }//main

	
}//class
