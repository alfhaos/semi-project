<%@page import="com.kh.community.model.vo.Freeboard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css" />
<section id="board-container">
	<h2>게시판 </h2>
<% if(loginMember != null){ %>	
	<input type="button" value="글쓰기" id="btn-add" onclick="location.href='<%= request.getContextPath() %>/community/freeboardForm'"/>
<% } %>	
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
	List<Freeboard> list = (List<Freeboard>) request.getAttribute("list"); 
	for(Freeboard freeboard : list){
%>
		<tr>
			<td><%= freeboard.getNo() %></td>
			<td>
				<a href="<%= request.getContextPath() %>/community/freeboardView?no=<%= freeboard.getNo() %>"><%= freeboard.getTitle() %></a>
				<%= freeboard.getCommentCount() > 0 ? "(" + freeboard.getCommentCount() + ")" : "" %>
			</td>
			<td><%= freeboard.getWriter() %></td>
			<td><%= freeboard.getRegDate() %></td>
			<td><%= freeboard.getReadCount() %></td>
		</tr>
<%
	}
%>		
	</table>
</section>