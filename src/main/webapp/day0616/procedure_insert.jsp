<%@page import="day0616.SelectService7"%>
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
<h2>Procedure Insert</h2>
<div>
<form id="frm" action="index.jsp">
<h3>사원정보 입력</h3>
<input type="hidden" name="url" value="${param.url }"/>
<label>사원번호</label>
<input type="text" name="empno" /><br>
<label>사원명</label>
<input type="text" name="ename" /><br>
<label>직무</label>
<input type="text" name="job" /><br>
<label>연봉</label>
<input type="text" name="sal" /><br>
<input type="button" id="btn" value="입력" class="btn btn-success btn-sm"/>

</form>
</div>
<div>
<c:if test="${ not empty param.empno }">
<jsp:useBean id="ce6DTO" class="day0616.CpEMP6DTO" scope="page"/>
<jsp:setProperty property="*" name="ce6DTO"/>

<%
SelectService7 ss=new SelectService7();
ss.procedureAdd(ce6DTO);//프로시저 호출 후 결과가 cnt와 msg에 저장
%>

<c:out value="${param.empno }"/>번 사원 정보가
<c:out value="${ce6DTO.cnt }"/>건
<strong><c:out value="${ce6DTO.msg }"/></strong>

</c:if>
</div>