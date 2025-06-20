<%@page import="day0604.SelectService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		$("#frm").submit();
		
		});

});//ready
</script>
<h2>컬럼 하나에 한 행 조회</h2>
<div>
<form id="frm" action="index.jsp" ㅑ>
<h3>사원버호를 입력하여 사원명을 검색</h3>
<input type="hidden" name="url" value="${param.url }"/>
<label>사원번호</label>
<input type="text" name="empno" />

<input type="button" id="btn" value="검색" class="btn btn-success btn-sm"/>

</form>
</div>
<div>
<c:if test="${ not empty param.empno }">
<%
String paramEmpno=request.getParameter("empno");
int empno=0;
if( paramEmpno != null ){
	empno=Integer.parseInt(paramEmpno);
}//if

SelectService ss=new SelectService();
String ename=ss.scsr(empno);
if( ename==null ){
	ename="사원이 존재하지 않습니다.";
}//end if
pageContext.setAttribute("ename", ename);

%>
 검색 결과 : <c:out value="${ ename }"/>
</c:if>
</div>