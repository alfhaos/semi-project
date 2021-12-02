<%@page import="com.kh.community.model.vo.Freeboard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	Freeboard freeboard = (Freeboard) request.getAttribute("freeboard");
%>    
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css" />

<script>
/**
* boardUpdateFrm 유효성 검사
*/
function boardValidate(){
	const $title = $("[name=title]");
	const $content = $("[name=content]");
	
	//제목을 작성하지 않은 경우 폼제출할 수 없음.
	if(!/^.+$/.test($title.val())){
		alert("제목을 입력하세요.");
		return false;
	}
					   
	//내용을 작성하지 않은 경우 폼제출할 수 없음.
	// \n는 .에 포함되지 않는다.
	if(!/^(.|\n)+$/.test($title.val())){
		alert("내용을 입력하세요.");
		return false;
	}
	
	return true;
}

$(document.boardUpdateFrm).submit(boardValidate);

</script>
<section id="board-container">
<h2>게시판 수정</h2>
<form
	name="boardUpdateFrm"
	action="<%=request.getContextPath() %>/community/freeboardUpdate" 
	method="post">
	<input type="hidden" name="no" value="<%= freeboard.getNo() %>" />
	<table id="tbl-board-view">
	<tr>
		<th>제 목</th>
		<td><input type="text" name="title" value="<%= freeboard.getTitle() %>" required></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>
			<input type="text" name="writer" value="<%= freeboard.getWriter() %>" readonly/>
		</td>
	</tr>
	<tr>
		<th>내 용</th>
		<td><textarea rows="5" cols="40" name="content"><%= freeboard.getContent() %></textarea></td>
	</tr>
	<tr>
		<th colspan="2">
			<input type="submit" value="수정하기">
		</th>
	</tr>
</table>
</form>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>