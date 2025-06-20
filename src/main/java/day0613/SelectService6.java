package day0613;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;

import day0602.CpEmpDTO;
import kr.co.sist.domain.CpEmp;

public class SelectService6 {

	public List<CpEmp> dynamicChoose(int deptno) {
		List<CpEmp> empList=null;
		
		SelectDAO6 sDAO6=SelectDAO6.getInstance();
		empList=sDAO6.dynamicChoose( deptno );
		
		return empList;
	}//dynamicChoose
	
	public List<CpEmp> dynamicForeach(String tableName, String[] empnoArr){
		List<CpEmp> list=null;
		/*
		System.out.println(tableName);
		System.out.println(Arrays.toString(empnoArr));
		*/
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("tableName", tableName); 
		map.put("empnoArr",empnoArr); 
		SelectDAO6 sDAO6=SelectDAO6.getInstance();
		list=sDAO6.dynamicForeach(map);
		
		return list;
	}//dynamicForeach
	
	
	//모든 사원에 대한 정보 조회
	public List<Integer> searchAllEmpno(){
		List<Integer> list=null;
 
		SelectDAO6 sDAO6=SelectDAO6.getInstance();
		try {
		list=sDAO6.selectAllEmpno();
		}catch(PersistenceException p){
			p.printStackTrace();
		}
		
		return list;
	}//searchAllEmpno

	
	public CpEmp searchOneEmp(int empno){
		CpEmp ceDomain=null;
 
		SelectDAO6 sDAO6=SelectDAO6.getInstance();
		try {
			ceDomain=sDAO6.selectOneEmp(empno);
		}catch(PersistenceException p){
			p.printStackTrace();
		}
		
		return ceDomain;
	}//searchOneEmp
	
	
	public boolean  modifyEmp(CpEmpDTO ceDTO){
		boolean flag=false;
 
		SelectDAO6 sDAO6=SelectDAO6.getInstance();
		try {
			flag=sDAO6.dynamicSet(ceDTO)==1;
		}catch(PersistenceException p){
			p.printStackTrace();
		}
		
		return flag;
	}//modifyEmp
	
	public boolean  transaction(TransactionDTO tDTO){
		boolean flag=false;
 
		SelectDAO6 sDAO6=SelectDAO6.getInstance();
		try {
			flag=sDAO6.transaction(tDTO)==2;
		}catch(PersistenceException p){
			p.printStackTrace();
		}//end catch
		
		return flag;
	}//transaction
	
}//class

