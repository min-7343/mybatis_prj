<%@page import="day0610.SelectService4"%>
<%@page import="day0604.SelectService"%>
<%@page import="day0605.SelectService2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
SelectService4 ss=new SelectService4();
pageContext.setAttribute("modelList", ss.searchAllModel());

String paramModel=request.getParameter("model");
if(paramModel != null){
	pageContext.setAttribute("carList", ss.join(paramModel));
}//end if

%>
<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		$("#frm").submit();
		
		});

});//ready
</script>

<h2>모델을 선택하면 모델별 차량 조회</h2>
<div>
<form id="frm" action="index.jsp">
<input type="hidden" name="url" value="${param.url }"/>
<label>모델 선택</label>
<select name="model">
<c:forEach var="model" items="${modelList }" varStatus="i">
<option value="${model }"${param.model  eq model?"selected='selected'":""}><c:out value="${ model }"/></option>
</c:forEach>
</select>

<input type="button" id="btn" value="검색" class="btn btn-success btn-sm"/>

</form>
</div>
<div>
<c:if test="${not empty param.model }">
	<h2><c:out value="${param.model }"/>검색 결과</h2>
		<table class="table table-bordered">
		<thead>
		<tr>
			<th>번호</th>
			<th>이미지</th>
			<th>제조사/모델</th>
			<th>배기량</th>
			<th>가격</th>
			<th>입력일</th>
		</tr>
		</thead>
		<tbody>
		<c:if test="${empty carList }">
		<tr>
		<td colspan="6">해당 모델은 재고가 ㅇㅅㅇ!</td>
		</tr>
		</c:if>
		<c:forEach var="carDomain" items="${carList }" varStatus="i">
		<tr>
		<td><c:out value="${ i.count }"/></td>
		<td><img src="day0610/car_img/${ carDomain.car_img }" style="width:80px; height:60px"/></td>
		<td><c:out value="${ carDomain.maker } / ${ carDomain.model }" /></td>
		<td><c:out value="${ carDomain.cc }"/></td>
		<td><c:out value="${ carDomain.price }"/></td>
		<td><fmt:formatDate pattern="MM-dd-yyyy EEEE" value="${carDomain.hiredate }"/></td>
		</tr>
		</c:forEach>
		</tbody>
		</table>

</c:if>
</div>