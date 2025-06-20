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
<h2>작다(<)의 조회</h2>
<div>
<form id="frm" action="index.jsp">
<h3>입력된 연봉보다 적은 연봉을 수령하는사원정보를 검색</h3>
<input type="hidden" name="url" value="${param.url }"/>
<label>연봉</label>
<input type="text" name="sal" />

<input type="button" id="btn" value="검색" class="btn btn-success btn-sm"/>

</form>
</div>
<div>
<c:if test="${ not empty param.sal }">
<%
String paramSal=request.getParameter("sal");
if( paramSal != null ){
SelectService2 ss=new SelectService2();

pageContext.setAttribute("empList", ss.lessThan(Integer.parseInt(paramSal)));
	
}//if

%>

	<h2><c:out value="${param.sal }"/>보다 적은 연봉을 수령하는 사원 정보</h2>
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
		<td colspan="7">입력하신 연봉보다 적게 받는 사원은 없어요. ㅇㅅㅇ!</td>
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