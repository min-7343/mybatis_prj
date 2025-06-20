<%@page import="day0604.SelectService"%>
<%@page import="day0605.SelectService2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
SelectService ss=new SelectService();
pageContext.setAttribute("deptnoList", ss.scmr());

String paramDeptno=request.getParameter("deptno");
if(paramDeptno != null){
	SelectService2 ss2=new SelectService2();
	pageContext.setAttribute("empList", ss2.mcmr(Integer.parseInt(paramDeptno)));
}//end if

%>
<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		$("#frm").submit();
		
		});

});//ready
</script>

<h2>컬럼 여러 개에 여러 행 조회</h2>
<div>
<form id="frm" action="index.jsp">
<input type="hidden" name="url" value="${param.url }"/>
<label>부서번호</label>
<select name="deptno">
<c:forEach var="deptno" items="${deptnoList }" varStatus="i">
<option value="${deptno }"><c:out value="${ deptno }"/>번</option>
</c:forEach>
</select>

<input type="button" id="btn" value="검색" class="btn btn-success btn-sm"/>

</form>
</div>
<div>
<c:if test="${not empty param.deptno }">
	<h2><c:out value="${param.deptno }"/>번 부서의 사원 정보</h2>
		<table class="table table-bordered">
		<thead>
		<tr>
			<th>번호</th>
			<th>사원번호</th>
			<th>사원명</th>
			<th>직무</th>
			<th>연봉</th>
			<th>보너스</th>
			<th>입사일</th>
		</tr>
		</thead>
		<tbody>
		<c:if test="${empty empList }">
		<tr>
		<td colspan="7">사원이 존재하지 않는 부서입니다.</td>
		</tr>
		</c:if>
		<c:forEach var="empDomain" items="${empList }" varStatus="i">
		<tr>
		<td><c:out value="${ i.count }"/></td>
		<td><c:out value="${ empDomain.empno }"/></td>
		<td>
		<input type="text" name="ename" value="${ empDomain.ename }" readonly="readonly"/>
		</td>
		<td><input type="text" name="job" value="${ empDomain.job }"/></td>
		<td><input type="text" name="sal" value="${ empDomain.sal }"/></td>
		<td><input type="text" name="comm" value="${ empDomain.comm }"/></td>
		<td><fmt:formatDate pattern="MM-dd-yyyy EEEE" value="${empDomain.hiredate }"/></td>
		</tr>
		</c:forEach>
		</tbody>
		</table>

</c:if>
</div>