<%@page import="com.kh.member.model.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<%@page import="com.kh.member.model.vo.Member"%> 
    
<%
	String msg = (String) session.getAttribute("msg");
	if(msg != null) session.removeAttribute("msg");

	Member loginMember = (Member) session.getAttribute("loginMember");

%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kola !</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css" />
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
<script>
$(() => {
	<% if(msg != null){ %>
	alert("<%= msg %>");
	
	<%} %>
});
</script>
</head>
<body>
	<div id="container">
		<header>
			<h1>Kola !</h1>
				<div class="login-container">
<% if(loginMember == null){ %>
					<!-- 로그인폼 시작 -->
					<form 
						id="loginFrm" 
						action="<%= request.getContextPath() %>/member/login"
						method="GET">
						<table>
							<tr>
								<td><input type="text" name="memberId" id="memberId" placeholder="아이디" tabindex="1" value=""></td>
								<td><input type="submit" value="로그인" tabindex="3"></td>
							</tr>
							<tr>
								<td><input type="password" name="password" id="password" placeholder="비밀번호" tabindex="2"></td>
								<td></td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="checkbox" name="saveId" id="saveId" />
									<label for="saveId">아이디저장</label>&nbsp;&nbsp;
									<input 
										type="button" 
										value="회원가입" 
										onclick="">
								</td>
							</tr>
						</table>
					</form>
					<!-- 로그인폼 끝-->
					
<%} else { %>
					
					<table id="login">
						<tr>
							<td><%= loginMember.getMember_name() %>님, 안녕하세요.</td>
						</tr>
						<tr>
							<td>
								<input type="button" value="내정보보기" onclick="location.href='<%= request.getContextPath() %>/member/memberView';">
								<input type="button" value="로그아웃" onclick="logout();">
							</td>
						</tr>
					</table>
				</div>
<%} %>
		
				
				<!-- 메인메뉴 시작 -->
				<nav>
					<ul class="main-nav">
						<li class="home"><a href="#">Home</a></li>

						<li class="notice"><a href="#">공지사항</a></li>
						<li class="board"><a href="#">게시판</a></li>
						<li class="photo"><a href="#">사진게시판</a></li>
						<li class="chat"><a href="#">채팅</a></li>

						<li class="board"><a href="#">커뮤니티</a>
							<ul>
								<li id="gather_study_board"><a href="#">스터디그룹 모집</a></li>
								<li id="free_board"><a href="#">자유 게시판</a></li>
								<li id="Q&A_board"><a href="#">Q&A 게시판</a></li>
							</ul>
						</li>
						<li class="writing"><a href="#">새 글쓰기</a></li>
						<li class="sub_menu">
							<ul>
							<li id="my_page"><a href="">마이페이지</a></li>
							<li id="my_study_group"><a href="">내 스터디그룹</a></li>
							<li id="my_writing"><a href="">내 작성글</a></li>
							<li id="my_interest"><a href="">내 관심글</a></li>
							<li id="logout"><a href="">로그아웃</a></li>
<% if(loginMember != null && MemberService.ADMIN_ROLE.equals(loginMember.getMember_role())){ %>	
							<li id="admin_page"><a href="<%= request.getContextPath() %>/admin/memberList">관리자 페이지</a></li>
<% } %>
							</ul>
						</li>

					</ul>
				</nav>
				<!-- 메인메뉴 끝-->
						
		</header>
		
		<section id="content">