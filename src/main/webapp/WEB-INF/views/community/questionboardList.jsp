<%@page import="com.kh.community.model.vo.Questionboard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css" />
<section id="board-container">
	<h2>Q&A 게시판 </h2>
<% if(loginMember != null){ %>	
	<input type="button" value="글쓰기" id="btn-add" onclick="location.href='<%= request.getContextPath() %>/community/questionboardForm'"/>
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
	List<Questionboard> list = (List<Questionboard>) request.getAttribute("list"); 
	for(Questionboard questionboard : list){
%>
		<tr>
			<td><%= questionboard.getNo() %></td>
			<td>
				<a href="<%= request.getContextPath() %>/community/questionboardView?no=<%= questionboard.getNo() %>"><%= questionboard.getTitle() %></a>
				<%= questionboard.getCommentCount() > 0 ? "(" + questionboard.getCommentCount() + ")" : "" %>
			</td>
			<td><%= questionboard.getWriter() %></td>
			<td><%= questionboard.getRegDate() %></td>
			<td>
<% 	if(questionboard.getAttachCount() > 0){ %>
				<img alt="" src="<%= request.getContextPath() %>/images/file.png" width="16px">	
<%	}	%>
			</td>
			<td><%= questionboard.getReadCount() %></td>
		</tr>
	
<%			
	}
%>		
	</table>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>