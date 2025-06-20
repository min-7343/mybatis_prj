package day0612;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import day0609.SelectDAO3;
import kr.co.sist.dao.MyBatisDAO;
import kr.co.sist.domain.CpEmp;
import kr.co.sist.domain.CpEmp2;
import kr.co.sist.domain.Car;

public class SelectService5 {
	
	
	public List<String> searchAllMaker( ) {
		List<String> makerList=null;
		
		SelectDAO5 sDAO5=SelectDAO5.getInstance();
		makerList=sDAO5.selectAllMaker();
		
		return makerList;
	}//searchAllModel
	
	public List<Car> joinSubquery(String maker ) {
		List<Car> carList=null;
		
		SelectDAO5 sDAO5=SelectDAO5.getInstance();
		carList=sDAO5.joinSubquery(maker);
		
		return carList;
	}//joinSubquery
	
	public List<CpEmp> dollarSign(String tableName ) {
		List<CpEmp> empList=null;
		
		SelectDAO5 sDAO5=SelectDAO5.getInstance();
		empList=sDAO5.dollarSign( tableName );
		
		return empList;
	}//dollarSign
	
	public List<CpEmp2> dynamicIf(WhereDTO wDTO ) {
		List<CpEmp2> empList=null;
		
		SelectDAO5 sDAO5=SelectDAO5.getInstance();
		empList=sDAO5.dynamicIf( wDTO );
		
		return empList;
	}//dynamicIf
	

}

