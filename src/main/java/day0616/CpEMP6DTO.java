package day0616;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CpEMP6DTO {
	private int empno, sal,	comm, cnt;	
	private String ename, job, msg;
	private Date hiredate;

}//class
