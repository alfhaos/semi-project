<%@page import="com.kh.board.model.vo.Frontboard"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/frontboard.css" />
<title>MyBoardList</title>
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
</head>
<body>
	<a href="<%= request.getContextPath() %>">home</a>
	<h1>작성글보기</h1>
	<div id="tbl-board">
		<ul class="ultest">
<% 
	List<Frontboard> list = (List<Frontboard>) request.getAttribute("list"); 
	if(list != null){
	for(Frontboard frontboard : list){
%>   

		
			<li class="litest" onclick="location.href='<%= request.getContextPath() %>/board/frontboardView?no=<%= frontboard.getNo() %>';">
			<h1><%= frontboard.getTitle() %></h1>
				<ul class="ultest1">
					
					<% 
						if(frontboard.getLanguage().equals("javascript"))
						{
							%>  
							<li class="litest1">
							<img alt="첨부파일" src="<%=request.getContextPath() %>/images/javascript.png" width=50rem; height=50rem;>
							<p>javascript</p>
							</li>
							<% 
						}
					%>
					<% 
						if(frontboard.getLanguage().equals("java"))
						{
							%>  
							<li class="litest1">
							<img alt="첨부파일" src="<%=request.getContextPath() %>/images/java.png" width=50rem; height=50rem;>
							<p>java</p>
							</li>
							<% 
						}
					%>
					<% 
						if(frontboard.getLanguage().equals("python"))
						{
							%>  
							<li class="litest1">
							<img alt="첨부파일" src="<%=request.getContextPath() %>/images/python.jpg" width=50rem; height=50rem;>
							<p>python</p>
							</li>
							<% 
						}
					%> 
					<% 
						if(frontboard.getLanguage().equals("c++"))
						{
							%>  
							<li class="litest1">
							<img alt="첨부파일" src="<%=request.getContextPath() %>/images/c++.jpg" width=50rem; height=50rem;>
							<p>c++</p>
							<div class="undertext">
							&#128064;
							<p>조회수</p>	
							</div>
							</li>
							<% 
						}
					%>
					<% 
						if(frontboard.getLanguage().equals("spring"))
						{
							%>  
							<li class="litest1">
							<img alt="첨부파일" src="<%=request.getContextPath() %>/images/spring.png" width=50rem; height=50rem;>
							<p>spring</p>
							</li>
							<% 
						}
					%>  
					<% 
						if(frontboard.getLanguage().equals("java,javascript"))
						{
							%>  
							<li class="litest1"><img alt="첨부파일" src="<%=request.getContextPath() %>/images/java.png" width=50rem; height=50rem;>
							<p>java</p>
							</li>
							<li class="litest1"><img alt="첨부파일" src="<%=request.getContextPath() %>/images/javascript.png" width=50rem; height=50rem;>
							<p>javascript</p>
							</li>
							
							<% 
						}
					%>  
					
				
				
				</ul>
		
			</li>
	
		
		
			
<% } %>
<% }else{ %>

	<h1>작성한 게시글이 없습니다.</h1>
<% } %>	
	
	
		</ul>
	</div>


</body>
</html>

