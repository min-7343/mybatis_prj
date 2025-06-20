<%@page import="java.util.HashMap"%>
<%@page import="kr.co.sist.domain.ProcedureCar"%>
<%@page import="java.util.List"%>
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
<h2>Procedure Select</h2>
<div>
<form id="frm" action="index.jsp">
<h3>제조사 입력</h3>
<input type="hidden" name="url" value="${param.url }"/>
<label>제조사</label>
<input type="text" name="maker" /><br>

<input type="button" id="btn" value="입력" class="btn btn-success btn-sm"/>

</form>
</div>
<div>
<c:if test="${ not empty param.maker }">

<%
String maker=request.getParameter("maker");
SelectService7 ss=new SelectService7();
HashMap<String,Object> hm=new HashMap<String,Object>();
hm.put("maker",maker);
List<ProcedureCar> list=ss.procedureSearch(hm);//프로시저 호출 후 결과가 cnt와 msg에 저장
pageContext.setAttribute("list", list);
%>

<c:out value="${param.maker }"/>검색 결과
<ul>
<c:forEach var="car" items="${list }" varStatus="i">
<li><c:out value="${i.count }" />
	<c:out value="${car.model }" />
	년식 : <c:out value="${car.car_year }" />,
	가격 : <fmt:formatNumber pattern="#,###" value="${car.price }" />,
	옵션 : <c:out value="${car.car_option }" />,
	등록일 : <fmt:formatDate pattern="yyyy-MM-dd HH" value="${car.hiredate }" />
</li>
</c:forEach>
</ul>

</c:if>
</div>