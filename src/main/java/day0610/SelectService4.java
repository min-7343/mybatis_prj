package day0610;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import day0609.SelectDAO3;
import kr.co.sist.dao.MyBatisDAO;
import kr.co.sist.domain.CpEmp;
import kr.co.sist.domain.Car;

public class SelectService4 {
	
	public List<CpEmp> union( ) {
		List<CpEmp> empList=null;
		
		SelectDAO4 sDAO4=SelectDAO4.getInstance();
		empList=sDAO4.union();
		
		return empList;
	}//union
	
	public List<String> searchAllModel( ) {
		List<String> modelList=null;
		
		SelectDAO4 sDAO4=SelectDAO4.getInstance();
		modelList=sDAO4.selectAllModel();
		
		return modelList;
	}//searchAllModel
	
	public List<Car> join(String model ) {
		List<Car> carList=null;
		
		SelectDAO4 sDAO4=SelectDAO4.getInstance();
		carList=sDAO4.join(model);
		
		return carList;
	}//join

}

