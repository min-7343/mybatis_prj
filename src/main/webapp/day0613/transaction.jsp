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
	$("#btn").click(function(){
		$("#frm").submit();
		});//click

});//ready
</script>
<h2>trasaction처리</h2>
<div>
<h3> 사원번호정보 입력</h3>

	<form action="index.jsp" id="frm">
	<input type="hidden" name="url"value="${param.url }"/>
		<table class="table table-bordered">
		<tr>
			<td><strong>사원명</strong></td>
			<td><input type="text" name="name" /></td>
		</tr>
		<tr>
			<td><strong>주소</strong></td>
			<td><input type="text" name="addr"/></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;">
			<input type="button" id="btn" value="입력" class="btn btn-success btn-sm"/>
			</td>
		</tr>

		</table>
</form>

<c:if test="${ not empty param.name }">
<jsp:useBean id="tDTO" class="day0613.TransactionDTO" scope="page"/>
<jsp:setProperty property="*" name="tDTO"/>
<%
SelectService6 ss=new SelectService6();
pageContext.setAttribute("insertFlag", ss.transaction(tDTO));
%>
<script type="text/javascript">
var msg="사원정보가 추가되지 않았습니다.";
if( ${ pageScope.insertFlag } ){
	msg="사원정보가 추가되었습니다."
}//end if
alert(msg);
</script>

</c:if>
</div>