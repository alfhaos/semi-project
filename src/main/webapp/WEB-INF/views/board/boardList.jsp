<%@page import="com.kh.board.model.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<section id="board-container">
	<h2>스터디 모집 게시판 </h2>
<% if(loginMember != null){ %>	
	<input type="button" value="글쓰기" id="btn-add" onclick="location.href='<%= request.getContextPath() %>/board/boardForm'"/>
<% } %>	
	<table id="tbl-board">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>찜</th>
		</tr>
		
<% 
	List<Board> list = (List<Board>) request.getAttribute("list"); 
	for(Board board : list){
%>
		<tr>
			<td><%= board.getNo() %></td>
			<td>
				<a href="<%= request.getContextPath() %>/board/boardView?no=<%= board.getNo() %>"><%= board.getTitle() %></a>
				<%= board.getCommentCount() > 0 ? "(" + board.getCommentCount() + ")" : "" %>
			</td>
			<td><%= board.getWriter() %></td>
			<td><%= board.getRegDate() %></td>
			<td><%= board.getReadCount() %></td>
			<td><%= board.getLikeCount() %></td>
		</tr>
	
<%			
	}
%>		
	</table>
</section>
