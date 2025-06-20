package kr.co.sist.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class CpEmp2 {

	private int empno,sal,comm,deptno	;
	private String ename,job, hiredateStr;
	private Date hiredate;
	
}
