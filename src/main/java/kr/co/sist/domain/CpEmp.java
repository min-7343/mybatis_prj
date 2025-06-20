package kr.co.sist.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString*/
public class CpEmp {

	private int empno,sal,comm	;
	private String ename,job, hiredateStr;
	private Date hiredate;
	
	public CpEmp() {
		System.out.println("CpEmp의 기본 생성자");
	}

	public CpEmp(int empno, int sal, int comm, String ename, String job, String hiredateStr, Date hiredate) {
		System.out.println("CpEmp의 인자 생성자");
		this.empno = empno;
		this.sal = sal;
		this.comm = comm;
		this.ename = ename;
		this.job = job;
		this.hiredateStr = hiredateStr;
		this.hiredate = hiredate;
	}

	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		System.out.println("setEmpno");
		this.empno = empno;
	}

	public int getSal() {
		return sal;
	}

	public void setSal(int sal) {
		System.out.println("setSal");
		this.sal = sal;
	}

	public int getComm() {
		return comm;
	}

	public void setComm(int comm) {
		System.out.println("setComm");
		this.comm = comm;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		System.out.println("setEname");
		this.ename = ename;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		System.out.println("setJob");
		this.job = job;
	}

	public String getHiredateStr() {
		return hiredateStr;
	}

	public void setHiredateStr(String hiredateStr) {
		System.out.println("setHiredateStr");
		this.hiredateStr = hiredateStr;
	}

	public Date getHiredate() {
		return hiredate;
	}

	public void setHiredate(Date hiredate) {
		System.out.println("setHiredate");
		this.hiredate = hiredate;
	}
	
	
	

}
