<%@page import="day0613.SelectService6"%>
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
	$("#btn").click(function(){//본사, 지사
		$("#frm").submit();
		});//click - 본사/ 지사
		
	$("#btn2").click(function(){//본사 또는 지사에서 특정 선택한 사원만 다시 검색
		$("#frm2").submit();
		});//click
		
		<c:if test="${not empty param.tableName}">
		$("[value='${param.tableName}']").prop("checked",true);
		</c:if>
		
		

});//ready
</script>
<h2>dynamic foreach - 반복할때 사용</h2>
<div>
<form id="frm" action="index.jsp">
<h3>본사나 지사를 선택해 주세요</h3>
<input type="hidden" name="url" value="${param.url }"/>
<%-- <input type="radio" name="tableName" value="emp"${param.tableName eq 'emp'?"checked='checked'":""}" />본사
<input type="radio" name="tableName" value="cp_emp7"${param.tableName eq 'cp_emp7'?"checked='checked'":""}" />지사 --%>
<input type="radio" name="tableName" value="emp" />본사
<input type="radio" name="tableName" value="cp_emp7" />지사
<input type="button" id="btn" value="검색" class="btn btn-success btn-sm"/>

</form>
</div>
<div>
<c:if test="${ not empty param.tableName }">
<%
String paramTableName=request.getParameter("tableName");

if( paramTableName != null ){

SelectService5 ss=new SelectService5();
pageContext.setAttribute("empList", ss.dollarSign(paramTableName));
	
}//if

%>
	<c:set var="companyLabel" value="본사" />
	<c:if test="${param.tableName eq 'cm_emp7'}">
	<c:set var="companyLabel" value="지사" />
	</c:if>
	<h2><c:out value="compayLabel"/></h2>
	<form action="index.jsp"  id="frm2">
	<input type="hidden" name="url" value="${param.url }"/>
	<input type="hidden" name="tableName" value="${param.tableName }"/>
	<input type="button" id="btn2" value="사원검색" class="btn btn-success btn-sm"/>
	
		<table class="table table-bordered">
		<thead>
		<tr>   
			<th>선택</th>
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
		<td colspan="7">사원은 없어요. ㅇㅅㅇ!</td>
		</tr>
		</c:if>
		<c:forEach var="empDomain" items="${empList }" varStatus="i">
		<tr>
		<td><input type="checkbox" name="empno" value="${empDomain.empno }"/></td>
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
	</form>
<c:if test="${not empty paramValues.empno }">
<h2>선택한 사원 정보</h2>
<%
	String tableName=request.getParameter("tableName");
	String[] empnoArr=request.getParameterValues("empno");

	SelectService6 ss6=new SelectService6();
	//ss6.dynamicForeach(tableName, empnoArr);
	pageContext.setAttribute("selectEmp", ss6.dynamicForeach(tableName, empnoArr));
%>

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
			<c:forEach var="empDomain" items="${selectEmp }" varStatus="i">
			<tr>
			<td><c:out value="${i.count }"/></td>
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

</c:if>
</div>