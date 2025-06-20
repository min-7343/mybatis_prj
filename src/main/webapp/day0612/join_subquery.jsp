<%@page import="day0612.SelectService5"%>
<%@page import="day0604.SelectService"%>
<%@page import="day0605.SelectService2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
SelectService5 ss=new SelectService5();
pageContext.setAttribute("makerList", ss.searchAllMaker());

String paramMaker=request.getParameter("maker");
if(paramMaker != null){
	pageContext.setAttribute("carList", ss.joinSubquery(paramMaker));
}//end if

%>
<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		$("#frm").submit();
		
		});

});//ready
</script>

<h2>제조사를 선택하면 제조사별 </h2>
<div>
<form id="frm" action="index.jsp">
<input type="hidden" name="url" value="${param.url }"/>
<label>제조사 선택</label>
<select name="maker">
<c:forEach var="maker" items="${makerList }" varStatus="i">
<option value="${maker }"${param.maker  eq maker?"selected='selected'":""}><c:out value="${ maker }"/></option>
</c:forEach>
</select>

<input type="button" id="btn" value="검색" class="btn btn-success btn-sm"/>

</form>
</div>
<div>
<c:if test="${not empty param.maker }">
	<h2><c:out value="${param.maker }"/>검색 결과</h2>
		<table class="table table-bordered">
		<thead>
		<tr>
			<th>번호</th>
			<th>이미지</th>
			<th>모델</th>
			<th>배기량</th>
			<th>가격</th>
			<th>입력일</th>
		</tr>
		</thead>
		<tbody>
		<c:if test="${empty carList }">
		<tr>
		<td colspan="6">해당 제조사의 모델은 재고가 ㅇㅅㅇ!</td>
		</tr>
		</c:if>
		<c:forEach var="carDomain" items="${carList }" varStatus="i">
		<tr>
		<td><c:out value="${ i.count }"/></td>
		<td><img src="day0610/car_img/${ carDomain.car_img }" style="width:80px; height:60px"/></td>
		<td><c:out value="${ carDomain.model }" /></td>
		<td><c:out value="${ carDomain.cc }"/></td>
		<td><c:out value="${ carDomain.price }"/></td>
		<td><fmt:formatDate pattern="MM-dd-yyyy EEEE" value="${carDomain.hiredate }"/></td>
		</tr>
		</c:forEach>
		</tbody>
		</table>

</c:if>
</div>