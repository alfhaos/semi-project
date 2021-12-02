<%@page import="com.kh.member.model.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<%@page import="com.kh.member.model.vo.Member"%> 
    
<%
	String msg = (String) request.getAttribute("msg");
	if(msg != null) session.removeAttribute("msg");

	Member loginMember = (Member) session.getAttribute("loginMember");

%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Kola !</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
<script>
$(() => {
	<% if(msg != null){ %>
	alert("<%= msg %>");
	
	<%} %>
});

function noLogin_writing_btn(){
	alert('로그인 후 이용해주세요.'); 
}

</script>

<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/stopWatch.css"/>

</head>
<body>


	<div id="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
	<h1>Kola!</h1>
	
<!-- 커뮤니티 드롭다운 -->
        <div class="dropdown text-end">
          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
            커뮤니티
          </a>
          <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
            <li><a id="gathere_study_board" class="dropdown-item" href="<%= request.getContextPath() %>/board/frontboardList">스터디그룹 모집</a></li>
            <li><a id="free_board" class="dropdown-item" href="<%= request.getContextPath() %>/community/freeboardList">자유 게시판</a></li>
            <li><a id="Q&A_board" class="dropdown-item" href="#">Q&A 게시판</a></li>
          </ul>
        </div>
	<form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
          <input type="search" class="form-control" placeholder="Search..." aria-label="Search">
        </form>
        
<!-- 글쓰기 버튼 -->
<% if(loginMember == null){ %>	
	<input type="button" value="글쓰기" id="writing-btn" onclick="javascript:noLogin_writing_btn()"/> <!-- 로그인 안하고 글쓰기 누를시 -->
<%} else { %>
	<input type="button" value="글쓰기" id="writing-btn" onclick="location.href='<%= request.getContextPath() %>/board/boardForm'"/>
<% } %>		

<!-- 마이페이지 드롭다운 -->
        <div class="dropdown text-end">
          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
            <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
          </a>
          <ul id="sub_menu" class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/member/memberView">마이페이지</a></li>
            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/studygroup/view">내 스터디그룹</a></li>
            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/board/MyBoardList">내 작성글</a></li>
            <li><a class="dropdown-item" href="#">내 관심글</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">로그아웃</a></li>
<% if(loginMember != null && MemberService.ADMIN_ROLE.equals(loginMember.getMember_role())){ %>	
            <li><hr class="dropdown-divider"></li>
			<li id="admin_page"><a class="dropdown-item" href="<%= request.getContextPath() %>/admin/memberList">관리자 페이지</a></li>
<% } %>
          </ul>
        </div>

      <div class="col-md-3 text-end">
        <button type="button" class="btn btn-outline-primary me-2" onclick="location.href='<%= request.getContextPath() %>'">Login</button>
        <button type="button" class="btn btn-primary">Sign-up</button>
      </div>

				<div class="login-container">
<% if(loginMember == null){ %>
					<!-- 로그인폼 시작 -->
					<form 
						id="loginFrm" 
						action="<%= request.getContextPath() %>/member/login"
						method="GET">
						<table>
							<tr>
								<td><input type="text" name="memberId" id="memberId" placeholder="아이디" tabindex="1" value="hhhhh"></td>
								<td><input type="submit" value="로그인" tabindex="3"></td>
							</tr>
							<tr>
								<td><input type="password" name="password" id="password" placeholder="비밀번호" tabindex="2" value = "1111"></td>
								<td></td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="checkbox" name="saveId" id="saveId" />
									<label for="saveId">아이디저장</label>
									<input 
										type="button" 
										value="회원가입" 
										onclick="location.href='<%= request.getContextPath() %>/member/memberEnroll';">
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


						<li class="home"><a href="<%= request.getContextPath() %>/board/frontboardList">Home</a></li>

						<li class="board"><a href="">커뮤니티</a>
							<ul>
								<li id="gather_study_board"><a href="<%= request.getContextPath() %>/board/frontboardList">스터디그룹 모집</a></li>
								<li id="free_board"><a href="<%= request.getContextPath() %>/community/freeboardList">자유 게시판</a></li>
								<li id="Q&A_board"><a href="#">Q&A 게시판</a></li>
							</ul>
						</li>
						<li>
<% if(loginMember == null){ %>	
	<input type="button" value="글쓰기" id="writing-btn" onclick="javascript:noLogin_writing_btn()"/> <!-- 로그인 안하고 글쓰기 누를시 -->
<%} else { %>
	<input type="button" value="글쓰기" id="writing-btn" onclick="location.href='<%= request.getContextPath() %>/board/boardForm'"/>
<% } %>		
						</li>
						<li class="sub_menu">
							<ul>
							<li id="my_page"><a href="">마이페이지</a></li>
							<li id="my_study_group"><a href=" <%= request.getContextPath() %>/studygroup/view">내 스터디그룹</a></li>
<% if(loginMember != null){ %>	
	<form name="myboardListFrm" action="<%= request.getContextPath() %>/board/MyBoardList" method="GET">
	<input type="hidden" name="memberId" value="<%= loginMember.getMember_id() %>" />	
	</form>
							<li id="my_writing"><a href="#" onclick="myboardlist();">내 작성글</a></li>
<% } %>						
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

    </header>

		<section id="content">


<script>
const myboardlist = () => {
		$(document.myboardListFrm).submit();

}
</script>


		