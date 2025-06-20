package day0602;

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
public class CpEmpDTO {

	private int empno,sal,comm	;
	private String ename,job;
	private Date hiredate;

}
