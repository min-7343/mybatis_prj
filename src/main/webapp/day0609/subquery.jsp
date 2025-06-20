<%@page import="day0609.SelectService3"%>
<%@page import="day0605.SelectService2"%>
<%@page import="kr.co.sist.domain.CpEmp"%>
<%@page import="day0604.SelectService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">

</script>

<%

SelectService3 ss=new SelectService3();

pageContext.setAttribute("empList", ss.subquery());

%>

	<h2>신입사원 부터 이전 10명의 사원 정보</h2>
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
		<c:if test="${ empty empList }">
		<tr>
		<td colspan="7">사원 정보가 존재하지 않습니다. ㅇㅅㅇ!</td>
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
		<td><c:out value="${empDomain.hiredateStr }"/></td>
		</tr>
		</c:forEach>
		</tbody>
		</table>

</div>