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
<style>
	header{
		width: 75%;
		height: 30vh;
		text-align: center;
		margin: 0 auto;
		padding: 0 auto;
	}
	.wrapper{
		width: 80%;
		text-align: center;
		margin: 0 auto;
		padding: 0 auto;
		
	}
</style>
</head>
<body>
<div class="wrapper">
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
<% if(loginMember == null){ %>
					<!-- 로그인폼 시작 -->
					
      <div class="col-md-3 text-end">
        <button type="button" class="btn btn-outline-primary me-2" onclick="location.href='<%= request.getContextPath() %>'">Login</button>
        <button type="button" class="btn btn-primary">Sign-up</button>
      </div>
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
								<td><input type="password" name="password" id="password" placeholder="비밀번호" tabindex="2" value = ""></td>
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
					

<!-- 마이페이지 드롭다운 -->
		<span><%= loginMember.getMember_name() %>님, 열공합시다</span>
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
            <li><a class="dropdown-item" onclick="location.href='<%= request.getContextPath() %>/member/logout'">로그아웃</a></li>
<% if(loginMember != null && MemberService.ADMIN_ROLE.equals(loginMember.getMember_role())){ %>	
            <li><hr class="dropdown-divider"></li>
			<li id="admin_page"><a class="dropdown-item" href="<%= request.getContextPath() %>/admin/memberList">관리자 페이지</a></li>
          </ul>
        </div>
<% } %>
<% } %>
    </header>
		<section id="content">