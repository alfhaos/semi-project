<%@page import="com.kh.board.model.vo.Frontboard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css" />
<section id="board-container">
	<h2>게시판 </h2>
<table id="tbl-board">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>첨부파일</th><%--첨부파일이 있는 경우 /images/file.png 표시 width:16px --%>
			<th>조회수</th>
		</tr>
		
<% 
	List<Frontboard> list = (List<Frontboard>) request.getAttribute("list"); 
	for(Frontboard frontboard : list){
%>
		<tr>
			<td><%= frontboard.getNo() %></td>
			<td>
				<a href="<%= request.getContextPath() %>/board/boardView?no=<%= frontboard.getNo() %>"><%= frontboard.getTitle() %></a>
				<%= frontboard.getCommentCount() > 0 ? "(" + frontboard.getCommentCount() + ")" : "" %>
			</td>
			<td><%= frontboard.getWriter() %></td>
			<td><%= frontboard.getRegDate() %></td>
			<td><%= frontboard.getReadCount() %></td>
		</tr>
	
<%			
	}
%>		
	</table>
</section>