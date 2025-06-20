package day0605;

import java.util.List;

import kr.co.sist.domain.CpEmp;

public class SelectService2 {
	public CpEmp mcsr(int empno) {
		CpEmp ceDomain=null;
		
		SelectDAO2 sDAO2=SelectDAO2.getInstance();
		ceDomain=sDAO2.mcsr(empno);
		
		return ceDomain;
	}//mcsr
	
	
	public List<CpEmp> mcmr(int depno) {
		List<CpEmp> ceList=null;
		
		SelectDAO2 sDAO2=SelectDAO2.getInstance();
		ceList=sDAO2.mcmr(depno);
		
		return ceList;
	}//mcsr
	
	public List<CpEmp> lessThan(int sal) {
		List<CpEmp> ceList=null;
		
		SelectDAO2 sDAO2=SelectDAO2.getInstance();
		ceList=sDAO2.lessThan(sal);
		
		return ceList;
	}//mcsr
	
	public List<CpEmp> greaterThan(int sal) {
		List<CpEmp> ceList=null;
		
		SelectDAO2 sDAO2=SelectDAO2.getInstance();
		ceList=sDAO2.greaterThan(sal);
		
		return ceList;
	}//greaterThan
	
	
	
}//class
