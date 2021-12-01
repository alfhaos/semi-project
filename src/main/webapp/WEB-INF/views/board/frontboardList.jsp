<%@page import="com.kh.board.model.vo.Frontboard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/frontboard.css" />
<section id="board-container">
<!-- 글쓰기 버튼 -->
<% if(loginMember == null){ %>	
	<input type="button" value="글쓰기" id="writing-btn" onclick="javascript:noLogin_writing_btn()"/> <!-- 로그인 안하고 글쓰기 누를시 -->
<%} else { %>
	<input type="button" value="글쓰기" id="writing-btn" onclick="location.href='<%= request.getContextPath() %>/board/boardForm'"/>
<% } %>		

<div id="banner">
	<ul class="ulbanner">
	<li class="libanner"><img alt="첨부파일" src="<%=request.getContextPath() %>/images/javascript.png" width=100rem; height=100rem;></li>
	<li class="libanner"><img alt="첨부파일" src="<%=request.getContextPath() %>/images/java.png" width=100rem; height=100rem;></li>
	<li class="libanner"><img alt="첨부파일" src="<%=request.getContextPath() %>/images/c++.jpg" width=100rem; height=100rem;></li>
	<li class="libanner"><img alt="첨부파일" src="<%=request.getContextPath() %>/images/python.jpg" width=100rem; height=100rem;></li>
	<li class="libanner"><img alt="첨부파일" src="<%=request.getContextPath() %>/images/spring.png" width=100rem; height=100rem;></li>
	<li class="libanner"></li>
	</ul>
</div>
<div id="tbl-board">
		<ul class="ultest">
<% 
	List<Frontboard> list = (List<Frontboard>) request.getAttribute("list"); 
	for(Frontboard frontboard : list){
%>   

		
			<li class="litest" onclick="location.href='<%= request.getContextPath() %>/board/boardView?no=<%= frontboard.getNo() %>';">
			<h4><%= frontboard.getTitle() %></h4>
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
	
		
		
<%			
	}
%>		
		</ul>
	</div>
</section>