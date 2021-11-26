<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kola !</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css" />
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>

</head>
<body>
	<div id="container">
		<header>
			<h1>Kola !</h1>
				<div class="login-container">
					<!-- 로그인폼 시작 -->
					<form 
						id="loginFrm" 
						action=""
						method="POST">
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
					
					<table id="login">
						<tr>
							<td></td>
						</tr>
						<tr>
							<td>
								<input type="button" value="내정보보기" onclick="">
								<input type="button" value="로그아웃" onclick="logout();">
							</td>
						</tr>
					</table>
				</div>
				
				<!-- 메인메뉴 시작 -->
				<nav>
					<ul class="main-nav">
						<li class="home"><a href="#">Home</a></li>
						<li class="board"><a href="#">커뮤니티</a>
							<ul>
								<li class="gather_study_board"><a href="#">스터디그룹 모집</a></li>
								<li class="free_board"><a href="#">자유 게시판</a></li>
								<li class="Q&A_board"><a href="#">Q&A 게시판</a></li>
							</ul>
						</li>
						<li class="writing"><a href="#">새 글쓰기</a></li>
						

					</ul>
				</nav>
				<!-- 메인메뉴 끝-->
						
		</header>
		
		<section id="content">