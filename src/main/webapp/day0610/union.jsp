<%@page import="java.util.List"%>
<%@page import="day0610.SelectService4"%>
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
$(function(){
	$("#btn").click(function(){
		$("#frm").submit();
		
		});

});//ready
</script>
<style>
input {
	text-align: center;
}
</style>
<h2>union 사용</h2>
<div>
	<form action="index.jsp" id="frm">
		<h3>본사와 지사(union) 통합 조회</h3>
		<input type="hidden" name="url" value="${param.url }" />
		<input type="hidden" name="flag" value="O"/>
		<input type="button" value="검색" class="btn btn-success btn-sm" id="btn" />
	</form>
</div>
<div>
	<c:choose>
		<c:when test="${ not empty param.flag }">
			<%

			SelectService4 ss4 = new SelectService4();
			
			List<CpEmp> list = ss4.union();
			
			pageContext.setAttribute("list", list);
			%>
		</c:when>
		<c:otherwise>
검색버튼을 눌러주세요.
</c:otherwise>
	</c:choose>
	<table class="table table-bordered"
		style="width: 800px; margin-right: 10px;">
		<thead>
			<tr style="text-align: center;">
				<th style="width: 100px;">사원번호</th>
				<th style="width: 200px;">사원명</th>
				<th style="width: 150px;">직무</th>
				<th style="width: 75px;">연봉</th>
				<th style="width: 75px;">보너스</th>
				<th style="width: 200px;">입사일</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td colspan="6">조회된 데이터가 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="list" items="${list }" varStatus="i">
						<tr style="text-align: center;">
							<td><c:out value="${list.empno}" /></td>
							<td><c:out value="${list.ename}" /></td>
							<td><c:out value="${list.job}" /></td>
							<td><c:out value="${list.sal}" /></td>
							<td><c:out value="${list.comm}" /></td>
							<td><fmt:formatDate  pattern="yyyy-MM-dd EEEE" value="${list.hiredate }"/></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>