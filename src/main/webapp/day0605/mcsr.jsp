<%@page import="day0605.SelectService2"%>
<%@page import="kr.co.sist.domain.CpEmp"%>
<%@page import="day0604.SelectService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		$("#frm").submit();
		
		});

});//ready
</script>
<h2>컬럼 여러개에 한 행 조회</h2>
<div>
<form id="frm" action="index.jsp" ㅑ>
<h3>사원번호를 입력하여 사원정보를 검색</h3>
<input type="hidden" name="url" value="${param.url }"/>
<label>사원번호</label>
<input type="text" name="empno" />

<input type="button" id="btn" value="검색" class="btn btn-success btn-sm"/>

</form>
</div>
<div>
<c:if test="${ not empty param.empno }">
<%
String paramEmpno=request.getParameter("empno");
int empno=0;
if( paramEmpno != null ){
	empno=Integer.parseInt(paramEmpno);
}//if

SelectService2 ss=new SelectService2();
CpEmp ceDomain=ss.mcsr(empno);

pageContext.setAttribute("ceDomain", ceDomain);

%>
<c:choose>
<c:when test="${ empty ceDomain }">
<c:out value="${ param.empno }" /> 사원번호에 해당하는 사원 정보가 존재하지 않습니다.
</c:when>
<c:otherwise>
<table class="table table-bordered">
<tr>
	<td>사원번호</td>
	<td><c:out value="${param.empno }" /></td>
</tr>
<tr>
	<td>사원명</td>
	<td><input type="text" name="ename" value="${ ceDomain.ename }" readonly="readonly"></td>
</tr>
<tr>
	<td>직무</td>
	<td><input type="text" name="job" value="${ ceDomain.job }"></td>
</tr>
<tr>
	<td>연봉</td>
	<td><input type="text" name="sal" value="${ ceDomain.sal }" ></td>
</tr>
<tr>
	<td>보너스</td>
	<td><input type="text" name="comm" value="${ ceDomain.comm }"></td>
</tr>
<tr>
	<td>입사일</td>
	<td>
	<c:out  value="${ ceDomain.hiredate }" /> / 
	<c:out  value="${ ceDomain.hiredateStr }" />
	</td>
</tr>


</table>
</c:otherwise>
</c:choose>
 검색 결과 : <c:out value="${ ceDomain }"/>
</c:if>
</div>