package day0609;

import java.util.List;

import day0605.SelectDAO2;
import kr.co.sist.domain.CpEmp;
import kr.co.sist.domain.Zipcode;

public class SelectService3 {
	
	public List<Zipcode> like(String dong) {
		List<Zipcode> zipList=null;
		
		SelectDAO3 sDAO3=SelectDAO3.getInstance();
		zipList=sDAO3.like(dong);
		
		return zipList;
	}//like
	
	public List<CpEmp> subquery() {
		List<CpEmp> empList=null;
		
		SelectDAO3 sDAO3=SelectDAO3.getInstance();
		empList=sDAO3.subquery();
		
		return empList;
	}//like
	
}
