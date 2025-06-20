<%@page import="kr.co.sist.board.PaginationDTO"%>
<%@page import="kr.co.sist.board.BoardUtil"%>
<%@page import="kr.co.sist.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.board.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="rDTO" class="kr.co.sist.board.RangeDTO" scope="page"/>
<jsp:setProperty name="rDTO" property="*" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${ site_name }" /></title>

<c:import url="${ url }/common/jsp/external_file.jsp" />


<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px auto; margin-left: 20px;width: 1200px;}
 a{ text-decoration: none; color :#333 }
 a:hover{ color:#5A90D0; }
 .pagiPrevMark{ color:#FF0000;  }
 .pagiNextMark{ color:#FF0000;  }
 .pagiCurrent{ font-weight: bold; font-size: 20px; }
 .pagiNotCurrent{ font-weight: normal; }
 .pagiNextMark{ font-weight: normal; }
</style>

<script type="text/javascript">
$(function(){
	$("#btnSearch").click(function(){
		var keyword=$("#keyword").val();
		if(keyword==""){
			alert("검색 키워드는 필수 입력");
			return;
		}//if
		
		$("#searchFrm").submit();
	});
}); // ready
</script>

</head>
<body>
<header data-bs-theme="dark">

<c:import url="${ url }/common/jsp/header.jsp" />

</header>
<main>
<div id="container">
<div style="width:1200px; margin: 0 auto;">
<%
BoardService bs=new BoardService();
int totalCount=0;//총 게시물의 수
totalCount=bs.totalCount(rDTO);


int pageScale=0;//한화면에 보여줄 게시물의 수
pageScale=bs.pageScale();

int totalPage=0; // 총 페이지의 수
totalPage=bs.totalPage(totalCount,pageScale);

int startNum=1;// 시작번호
startNum=bs.startNum(pageScale, rDTO);

int endNum=0;// 끝번호
endNum=bs.endNum(pageScale, rDTO);

List<BoardDTO> boardList=bs.searchBoard(rDTO);

/* System.out.println("총 페이지 수 : "+totalPage);
String tempPage=request.getParameter("currentPage");
System.out.println("현재 페이지 숫자 : "+ tempPage); */
System.out.println(boardList); 

pageContext.setAttribute("totalCount", totalCount);
pageContext.setAttribute("pageScale", pageScale);
pageContext.setAttribute("totalPage", totalPage);
pageContext.setAttribute("startNum", rDTO.getStartNum());
pageContext.setAttribute("endNum", rDTO.getEndNum());
pageContext.setAttribute("fieldText", rDTO.getFieldText());
pageContext.setAttribute("boardList", boardList);

session.setAttribute("cntFlag", true);//초기화
%>
<%-- 총게시물의 수 : ${ totalCount }<br>
<!-- 한 화면에 보여 줄 게시물의 수 (10개씩 할 것이다.-> service) -->
한화면에 보여줄 게시물의 수 :  ${ pageScale }<br>
총페이지 수 : ${ totalPage }<br>
시작번호 : ${ startNum }<br>
끝번호 : ${ endNum }<br> --%>

<div style="text-align: right;">
<a href="write_frm.jsp" class="btn btn-info btn-sm">글작성</a>
</div>

<h3>자유게시판</h3>
<div id="boardWrap" style="magin : 0px auto;height:540px; width:1200px;"> 
전체 <c:out value="${ totalPage }"/> 페이지에서
현재 <c:out value="${ rDTO.currentPage }"/>페이지
<table class="table table-hover">
<thead>
<tr style="text-align:center" >
	<th style="width:80px">번호</th>
	<th style="width:550px">제목</th>
	<th style="width:120px">작성자</th>
	<th style="width:200px">작성일</th>
	<th style="width:100px">조회수</th>
</tr>
</thead>
<tbody>
<c:if test="${empty boardList}">
<tr>
<td colspan="5" style="text-align:center;">
게시물이 없습니다. <br>
<img src="../login/images/login_fail.jpg" style="width:60px;"/>
</td>
</tr>
</c:if>
<%
StringBuilder searchQueryString=new StringBuilder();
if(rDTO.getKeyword() != null &&  rDTO.getKeyword().isEmpty()){
	searchQueryString.append("&field=").append(rDTO.getField())
	.append("&keyword=").append(rDTO.getKeyword());
	}
pageContext.setAttribute("searchQueryString", searchQueryString.toString());
%>
<c:forEach var="bDTO" items="${ boardList }" varStatus="i">
<tr>
<td><c:out value="${ totalCount-(rDTO.currentPage-1)*pageScale-i.index }"/></td>
<td><a href="board_detail.jsp?num=${ bDTO.num }&currentPage=${rDTO.currentPage}${searchQueryString}"><c:out value="${ bDTO.subject }"/></a></td>
<td><c:out value="${ bDTO.id }"/></td>
<td><fmt:formatDate value="${ bDTO.input_date }" pattern="yyyy-MM-dd a HH:mm:ss"/></td>
<td><c:out value="${ bDTO.cnt }"/></td>
</tr>
</c:forEach>


</tbody>
</table>
</div>
<div id="searchDiv" style="text-align: center">
<form action="board_list.jsp" id="searchFrm" method="get">
<select name="field" id="field">
<c:forEach var="field" items="${ fieldText}" varStatus="i">
<option value="${ i.index }"><c:out value="${ field }" /></option>
</c:forEach>
</select>
<input type="text" name="keyword" id="keyword" />
<input type="text" style="display:none" />
<input type="button" value="검색" id="btnSearch" class="btn btn-success btn-sm"/>
</form>
</div>
<%-- <div id="paginaionDiv">

</div>
	<div>
		<c:forEach var="i" begin="1" end="${ totalPage }" step="1">
		[ <a href="board_list.jsp?currentPage=${ i }"><c:out value="${ i }"/></a> ]
		</c:forEach>
</div> --%>
<div id="paginaionDiv2" >
<%
/* 

pageContext.setAttribute("queryStr", searchQueryString);

int pageNumber=3; //한 화면에 보여줄 페이지 인덱스의 수
//2.화면에 보여줄 시작페이지 번호
int startPage=((rDTO.getCurrentPage()-1)/pageNumber)*pageNumber+1;///1,2,3 => 1
//3. 화면에 보여줄 마지막 페이지
int endPage=(((startPage-1)+pageNumber)/pageNumber)*pageNumber;///1,2,3 => 1
// 4. 총 페이지 수가 연산된 마지막 페이지 수보다 작다면 총페이지수가 마직막 페이지수로 설정 (totalPage <=endPage)-> endPage=totalPage
if(totalPage<=endPage){
	 endPage=totalPage;
}//end if

//5. 첫 페이지가 인덱스 화면이 아닌 경우
int movePage=0;
StringBuilder prevMark=new StringBuilder("[&lt;&lt;]");

if(rDTO.getCurrentPage() > pageNumber){ // 시작페이지보다 1적은 페이지로 이동
	prevMark.delete(0,prevMark.length());
	movePage=startPage-1;
	prevMark.append("[ <a href='board_list.jsp?currentPage=")
	.append(movePage).append(searchQueryString.toString())
	.append("' class='pagiPrevMark'>&lt;&lt;</a> ]");
}

//6. 시작페이지 번호부터 끝 페이지 번호까지 화면에 출력
movePage=startPage;
StringBuilder pageLink=new StringBuilder();
while( movePage <= endPage ){ //
	if( movePage == rDTO.getCurrentPage() ){//현재 페이지는 링크를 설정하지 않음
		pageLink.append("[ <span class='pagiCurrent'>").append(rDTO.getCurrentPage()).append( "</span> ]");
	}else{
		pageLink.append("[ <a href='board_list.jsp?currentPage=")
		.append(movePage).append(searchQueryString.toString()).append("' class='pageNotCurrent'>").append(movePage).append("</a> ]");
	}//end else;
	movePage++;
}//end while
	
// 7. 뒤에 페이지가 더 있는 경우
StringBuilder nextMark=new StringBuilder("[ <span class='pagiNextMark'>&gt;&gt; </span>]"); //이미지로 넣어도 된다.(class에 이런이름으로 만들어서)

if( totalPage > endPage){
	nextMark.delete(0,nextMark.length());//링크가 없는 페이지 날리기
	movePage=endPage+1;
	nextMark.append("[ <a href='board_list.jsp?currentPage=")
	.append(movePage).append(searchQueryString.toString()).append("'>&gt;&gt;</a> ]");
}//end if */
%>
</div >
<div id="paginaionDiv" style="text-align: center;">
<%-- 시작번호 <%=startPage %><br>
끝번호 <%=endPage %><br> --%>
<%-- <%=prevMark %> ... <%=pageLink %> ... <%=nextMark %> --%> 
<% PaginationDTO pDTO=new PaginationDTO(3,rDTO.getCurrentPage(),totalPage,
		"board_list.jsp",rDTO.getField(), rDTO.getKeyword());
%>

<%=BoardUtil.pagination(pDTO) %>
</div>
		
</div>
</div>


</main>

<footer class="text-body-secondary py-5">

<c:import url="${ url }/common/jsp/footer.jsp" />

</footer>


</body>
</html>