<%@page import="com.kh.board.model.vo.Frontboard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/frontboard.css" />

<script>
$(function(){
	var clicks = 1;
	$('.libanner1').click(function() {
		if(clicks%2 != 0){
		  $(this).css('opacity', '0.3');
		
		  $('.javascript').hide();
		  
		} else{
		  $(this).css('opacity', '1');
		
		  $('.javascript').show();
		}
		++clicks;
	});
});

$(function(){
	var clicks = 1;
	$('.libanner2').click(function() {
		if(clicks%2 != 0){
		  $(this).css('opacity', '0.3');
		  $('.java').hide();
		} else{
		  $(this).css('opacity', '1');
		  $('.java').show();
		}
		++clicks;
	});
});

$(function(){
	var clicks = 1;
	$('.libanner3').click(function() {
		if(clicks%2 != 0){
		  $(this).css('opacity', '0.3');
		  $('.c쁠쁠').hide();
		} else{
		  $(this).css('opacity', '1');
		  $('.c쁠쁠').show();
		}
		++clicks;
	});
});

$(function(){
	var clicks = 1;
	$('.libanner4').click(function() {
		if(clicks%2 != 0){
		  $(this).css('opacity', '0.3');
		  $('.python').hide();
		} else{
		  $(this).css('opacity', '1');
		  $('.python').show();
		}
		++clicks;
	});
});

$(function(){
	var clicks = 1;
	$('.libanner5').click(function() {
		if(clicks%2 != 0){
		  $(this).css('opacity', '0.3');
		 
		} else{
		  $(this).css('opacity', '1');
		}
		++clicks;
	});
});



</script>
<section id="board-container">
<div id="banner">
	<ul class="ulbanner">
		<li class="libanner1" style="margin: 1.5rem; transition: all 0.25s;"><img alt="첨부파일" src="<%=request.getContextPath() %>/images/javascript.png" width=100rem; height=100rem;></li>
		<li class="libanner2" style="margin: 1.5rem; transition: all 0.25s;"><img alt="첨부파일" src="<%=request.getContextPath() %>/images/java.png" width=100rem; height=100rem;></li>
		<li class="libanner3" style="margin: 1.5rem; transition: all 0.25s;"><img alt="첨부파일" src="<%=request.getContextPath() %>/images/c++.jpg" width=100rem; height=100rem;></li>
		<li class="libanner4" style="margin: 1.5rem; transition: all 0.25s;"><img alt="첨부파일" src="<%=request.getContextPath() %>/images/python.jpg" width=100rem; height=100rem;></li>
		<li class="libanner5" style="margin: 1.5rem; transition: all 0.25s;"><img alt="첨부파일" src="<%=request.getContextPath() %>/images/spring.png" width=100rem; height=100rem;></li>
	</ul>
</div>
<div id="tbl-board">
		<ul class="ultest">
<% 
	List<Frontboard> list = (List<Frontboard>) request.getAttribute("list"); 
	for(Frontboard frontboard : list){
%>   


			<li id="<%= frontboard.getNo() %>" class="<%= frontboard.getLanguage() %>" onclick="location.href='<%= request.getContextPath() %>/board/boardView?no=<%= frontboard.getNo() %>';" style="width: 15rem; height: 15rem; margin:5rem; padding: 1.5rem; background: white; box-shadow:0px 5px 25px rgb(0 0 0 / 15%); border-radius:1.5rem; position: relative; cursor: pointer;
					transition: all 0.5s;">
			
			<h4 style= "font-family: 'InfinitySans-RegularA1';"><%= frontboard.getTitle() %></h4>

				<ul class="ultest1">
					
					<% 
						if(frontboard.getLanguage().equals("javascript"))
						{
							%>  
							<li class="litest1">
							<img alt="첨부파일" src="<%=request.getContextPath() %>/images/javascript.png" width=50rem; height=50rem;>
							<p style= "font-family: 'InfinitySans-RegularA1';">javascript</p>
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
							<p style= "font-family: 'InfinitySans-RegularA1';">java</p>
							</li>
							<% 
						}
					%>
					<% 
						if(frontboard.getLanguage().equals("python"))
						{
							%>  
							<li class="litest1">
							<img alt="첨부파일" src="<%=request.getContextPath() %>/images/python.png" width=50rem; height=50rem;>
							<p style= "font-family: 'InfinitySans-RegularA1';">python</p>
							</li>
							<% 
						}
					%> 
					<% 
						if(frontboard.getLanguage().equals("c쁠쁠"))
						{
							%>  
							<li class="litest1">
							<img alt="첨부파일" src="<%=request.getContextPath() %>/images/c++.png" width=50rem; height=50rem;>
							<p style= "font-family: 'InfinitySans-RegularA1';">c++</p>
							<div class="undertext">
							&#128064;
							<p style= "font-family: 'InfinitySans-RegularA1';">조회수</p>	
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
						if(frontboard.getLanguage().equals("java javascript"))
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