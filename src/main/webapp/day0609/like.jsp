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
<h2>like 조회</h2>
<div>
<form id="frm" action="index.jsp">
<h3>주소검색</h3>
<input type="hidden" name="url" value="${param.url }"/>
<label>동이름</label>
<input type="text" name="dong" />

<input type="button" id="btn" value="검색" class="btn btn-success btn-sm"/>

</form>
</div>
<div>
<c:if test="${ not empty param.dong }">
<%
String paramDong=request.getParameter("dong");
if( paramDong != null ){
SelectService3 ss=new SelectService3();

pageContext.setAttribute("zipList", ss.like(paramDong));
	
}//if

%>

	<h2><c:out value="${param.dong }"/>으로 검색한 결과</h2>
		<table class="table table-bordered">
		<thead>
		<tr>
			<th style="width: 10%">우편번호</th>
			<th style="width: 90%">주소</th>
		</tr>
		</thead>
		<tbody>
		<c:if test="${ empty zipList }">
		<tr>
		<td colspan="1">입력하신 동은 없어요. ㅇㅅㅇ!</td>
		</tr>
		</c:if>
		<c:forEach var="zdDomain" items="${zipList }" varStatus="i">
		<tr>
		<td><c:out value="${ zdDomain.zipcode }"/></td>
		<td><c:out value="${ zdDomain.sido }${ zdDomain.gugun }${ zdDomain.dong }${ zdDomain.bunji }"/></td>
		</tr>
		</c:forEach>
		</tbody>
		</table>


</c:if>
</div>