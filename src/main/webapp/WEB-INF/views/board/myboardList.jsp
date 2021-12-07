<%@page import="com.kh.community.model.vo.Freeboard"%>
<%@page import="com.kh.board.model.vo.Frontboard"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="/WEB-INF/views/common/header.jsp" %> 

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/myboardList.css" />
<title>MyBoardList</title>
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
</head>
<body>
	<h1 align="center">스터디모집</h1>
	<div id="tbl-board">
		<ul class="ultest">
<% 
	List<Frontboard> list = (List<Frontboard>) request.getAttribute("list");
	if(list.size() != 0){
	for(Frontboard frontboard : list){
%>   


			<li id="<%= frontboard.getArea() %>" class="<%= frontboard.getLanguage() %>" onclick="location.href='<%= request.getContextPath() %>/board/frontboardView?no=<%= frontboard.getNo() %>';" 
			style="width: 15rem; height: 15rem; margin:2rem; padding: 1.5rem; background: white; box-shadow:0px 5px 25px rgb(0 0 0 / 15%); border-radius:1.5rem; position: relative; cursor: pointer;
					transition: all 0.5s;">
			<h4 style= "font-family: 'InfinitySans-RegularA1';"><%= frontboard.getTitle() %></h4>
				<ul class="ultest1">
					
					<% 
						if(frontboard.getLanguage().contains("jscript"))
						{
							%>  
							<li class="litest1">
							<img alt="첨부파일" src="<%=request.getContextPath() %>/images/javascript.png" width=50rem; height=50rem;>
							<p style= "font-family: 'InfinitySans-RegularA1';">javascript</p>
						
							
							<% 
						}
					%>
					<% 
						if(frontboard.getLanguage().contains("java"))
						{
							%>  
							<li class="litest1">
							<img alt="첨부파일" src="<%=request.getContextPath() %>/images/java.png" width=50rem; height=50rem;>
							<p style= "font-family: 'InfinitySans-RegularA1';">java</p>
						
							
							<% 
						}
					%>
					<% 
						if(frontboard.getLanguage().contains("python"))
						{
							%>  
							<li class="litest1">
							<img alt="첨부파일" src="<%=request.getContextPath() %>/images/python.png" width=50rem; height=50rem;>
							<p style= "font-family: 'InfinitySans-RegularA1';">python</p>
					
							
							<% 
						}
					%> 
					<% 
						if(frontboard.getLanguage().contains("c쁠쁠"))
						{
							%>  
							<li class="litest1">
							<img alt="첨부파일" src="<%=request.getContextPath() %>/images/c++.png" width=50rem; height=50rem;>
							<p style= "font-family: 'InfinitySans-RegularA1';">c++</p>
						
							
							<% 
						}
					%>
					<% 
						if(frontboard.getLanguage().contains("spring"))
						{
							%>  
							<li class="litest1">
							<img alt="첨부파일" src="<%=request.getContextPath() %>/images/spring.png" width=50rem; height=50rem;>
							<p>spring</p>
							
						
							<% 
						}
					%>
					<% 
						if(frontboard.getLanguage().contains("nodejs"))
						{
							%>  
							<li class="litest1">
							<img alt="첨부파일" src="<%=request.getContextPath() %>/images/nodejs.png" width=50rem; height=50rem;>
							<p>node.js</p>
					
							
							<% 
						}
					%>    
					
							<section class="toptext">
							
							<p style= "font-family: 'InfinitySans-RegularA1';"> <%= frontboard.getMax_member() %>명</p>
							</section>
							<section class="undertext">
							&#128064;
							<p style= "font-family: 'InfinitySans-RegularA1';"><%= frontboard.getReadCount() %></p>	
						
							</section>
							</li>
					
					
					
				
				
				</ul>
		
			</li>
	
		
<% 
	}}else{
%>
	<h1>게시글 없으면 글쓰기 넣기</h1>
<% } %>
</ul>
	</div>
	<hr />
	<h1 align="center">자유게시판</h1>
<% 
	List<Freeboard> free = (List<Freeboard>) request.getAttribute("free"); 
	if(free.size() != 0){
	for(Freeboard freeboard : free){
%>
	<table id="tbl-board">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>추천수</th>
			</tr>
		<tr>
			<td><%= freeboard.getNo() %></td>
			<td>
				<a href="<%= request.getContextPath() %>/community/freeboardView?no=<%= freeboard.getNo() %>"><%= freeboard.getTitle() %></a>
				<%= freeboard.getCommentCount() > 0 ? "(" + freeboard.getCommentCount() + ")" : "" %>
			</td>
			<td><%= freeboard.getWriter() %></td>
			<td><%= freeboard.getRegDate() %></td>
			<td><%= freeboard.getReadCount() %></td>
			<td><%= freeboard.getLikeCount() %></td>
		</tr>
	</table>
<% if(free.size() != 0){ %>
	<div id='pageBar'><%= request.getAttribute("pagebar") %></div>	
<% } %>
<% 
	}}else{
%>
	<h1>ㅂㅇ</h1>
<% } %>



</body>
</html>

