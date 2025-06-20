<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
$(function(){
	
}); // ready
</script>
<c:import url="http://localhost/mybatis_prj/common/jsp/external_file.jsp" />


<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}

</style>

<script type="text/javascript">
$(function(){
}); // ready
</script>

</head>
<body>
<header data-bs-theme="dark">

<c:import url="http://localhost/mybatis_prj/common/jsp/header.jsp" />

</header>
<main>
<div id="container">
<div id="mybatisTitle">
<%
	String[] linkName={"컬럼하나 한행조회","컬럼하나 여러행조회","컬럼여러개 한행조회","컬럼여러개 여러행조회"
			,"&lt; 조회","&gt; 조회","like조회","subquery","union","join","join_subquery"
			,"동적인테이블","동적쿼리-if","동적쿼리-choose","동적쿼리-foreach","동적쿼리-set","트랜잭션처리(insert)"
			,"procedure-insert","procedure-select"};
	
String[] link={"day0604/scsr","day0604/scmr","day0605/mcsr","day0605/mcmr","day0605/lt","day0605/gt","day0609/like","day0609/subquery","day0610/union","day0610/join"
			,"day0612/join_subquery","day0612/dollar_sign","day0612/dynamic_if"
			,"day0613/dynamic_choose","day0613/dynamic_foreach"
			,"day0613/dynamic_set","day0613/transaction"
			,"day0616/procedure_insert","day0616/procedure_select"};
%>
<table class="table table-hover">
<tr>
<%for(int i=0;i<linkName.length;i++){ %>
<th><a href="index.jsp?url=<%=link[i] %>"><%=linkName[i] %></a></th>
<%} // end for %>
</tr>
</table>
</div>
<div id="mybatisContainer">
<c:if test="${ not empty param.url }">
<c:import url="${ param.url }.jsp"/>
</c:if>
</div>
</div>

</main>

<footer class="text-body-secondary py-5">

<c:import url="http://localhost/mybatis_prj/common/jsp/footer.jsp" />

</footer>


</body>
</html>