<%@page import="day0612.SelectService5"%>
<%@page import="day0605.SelectService2"%>
<%@page import="kr.co.sist.domain.CpEmp"%>
<%@page import="day0604.SelectService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		$("#frm").submit();
		
		});

});//ready
</script>
<h2>부서사원 검색</h2>
<div>
<form id="frm" action="index.jsp">
<h3>사원을 검색</h3>
<input type="hidden" name="url" value="${param.url }"/>
<label>부서번호</label>
<input type="text" name="deptno" />
<input type="button" id="btn" value="검색" class="btn btn-success btn-sm"/>

</form>
</div>
<jsp:useBean  id="wDTO" class="day0612.WhereDTO" scope="page"/>
<jsp:setProperty  name="wDTO" property="*"/>
<div>
<c:if test="${ not empty param.deptno }">
<%
SelectService5 ss=new SelectService5();
pageContext.setAttribute("empList", ss.dynamicIf(wDTO));

%>
	<h2><c:out value="${param.deptno ?'모든 부서사원정보':'사원정보'}"/></h2>
		<table class="table table-bordered">
		<thead>
		<tr>
			<th>번호</th>
			<th>부서번호 / 사원번호</th>
			<th>사원명</th>
			<th>직무</th>
			<th>연봉</th>
			<th>보너스</th>
			<th>입사일</th>
		</tr>
		</thead>
		<tbody>
		<c:if test="${ empty empList }">
		<tr>
		<td colspan="7">사원은 없어요. ㅇㅅㅇ!</td>
		</tr>
		</c:if>
		<c:forEach var="empDomain" items="${empList }" varStatus="i">
		<tr>
		<td><c:out value="${ i.count }"/></td>
		<td><c:out value="${ empDomain.deptno } / ${ empDomain.empno }"/></td>
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