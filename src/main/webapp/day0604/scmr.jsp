<%@page import="day0604.SelectService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
SelectService ss=new SelectService();
pageContext.setAttribute("deptnoList", ss.scmr());

%>
<h2>컬럼 하나에 여러 행 조회</h2>
<div>
<form id="frm" action="index.jsp" ㅑ>
<input type="hidden" name="url" value="${param.url }"/>
<label>부서번호</label>
<select name="depno">
<c:forEach var="deptno" items="${deptnoList }" varStatus="i">
<option value="${deptno }"><c:out value="${ deptno }"/>번</option>
</c:forEach>
</select>

<input type="button" id="btn" value="검색" class="btn btn-success btn-sm"/>

</form>
</div>
<div>

</div>