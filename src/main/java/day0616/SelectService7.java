package day0616;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;

import kr.co.sist.domain.ProcedureCar;

public class SelectService7 {

	public void  procedureAdd(CpEMP6DTO ceDTO){
 
		SelectDAO7 sDAO7=SelectDAO7.getInstance();
		try {
			sDAO7.insertProc(ceDTO);
		}catch(PersistenceException p){
			p.printStackTrace();
		}//end catch
		
	}//procedureAdd
	
	public List<ProcedureCar>  procedureSearch(HashMap<String, Object> hm ){
		List<ProcedureCar> list=new ArrayList<ProcedureCar>();
		
		SelectDAO7 sDAO7=SelectDAO7.getInstance();
		try {
			sDAO7.selectProc(hm);
			
			List<Map<String,Object>> carList=(List<Map<String,Object>>)hm.get("selectCar");
			
			ProcedureCar pc=null;
			BigDecimal bd=null;
			for(Map<String, Object> recordMap : carList) {
				pc=new ProcedureCar();
				pc.setModel((String)recordMap.get("MODEL"));
				pc.setCar_year((String)recordMap.get("CAR_YEAR"));;
				pc.setCar_option((String)recordMap.get("CAR_OPTION"));;
				
				bd=((BigDecimal)recordMap.get("PRICE"));
				
				if(bd !=null) {
					pc.setPrice(bd.intValue());
				}
				pc.setHiredate((Timestamp)recordMap.get("HIREDATE"));
				list.add(pc);
			}//end for
			
		}catch(PersistenceException p){
			p.printStackTrace();
		}//end catch
		
		return list;
	}//procedureSearch
	
	public static void main(String[] args) {
		HashMap<String, Object> hm=new HashMap<String,Object>();
		hm.put("maker", "현대");
		SelectDAO7.getInstance().selectProc(hm);
		System.out.println(hm);
	}
}//class

