<%@page import="com.kh.member.model.service.MemberService"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	List<Member> list = (List<Member>) request.getAttribute("list");
%>

<!-- 관리자용 admin.css link -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css" />
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>




<section id="memberList-container">
	<h2>회원관리</h2>
	<nav>
		<ul class="admin-nav">
			<li class="language-stats"><a href="#">관심 언어 통계</a></li>
			<li class="memberEnroll-stats"><a href="#">가입일 통계</a></li>
			<li class="hi"><a href="#">이것저것</a></li>
			<li class="bye"><a href="#">생각나면추가</a></li>


		</ul>
	</nav>

	<div id="search-container">
        <label for="searchType">검색타입 :</label> 
        <select id="searchType">
            <option value="memberId" >아이디</option>		
            <option value="memberName" >회원명</option>
            <option value="gender" >성별</option>
        </select>
        <div id="search-memberId" class="search-type">
            <form action="<%=request.getContextPath()%>/admin/memberFinder">
                <input type="hidden" name="searchType" value="memberId"/>
                <input type="text" name="searchKeyword" value="gd" size="25" placeholder="검색할 아이디를 입력하세요."/>
                <button type="submit">검색</button>			
            </form>	
        </div>
        <div id="search-memberName" class="search-type">
            <form action="">
                <input type="hidden" name="searchType" value="memberName"/>
                <input type="text" name="searchKeyword" value="gd" size="25" placeholder="검색할 이름을 입력하세요."/>
                <button type="submit">검색</button>			
            </form>	
        </div>
        <div id="search-gender" class="search-type">
            <form action="">
                <input type="hidden" name="searchType" value="gender"/>
                <input type="radio" name="searchKeyword" value="M" > 남
                <input type="radio" name="searchKeyword" value="F" > 여
                <button type="submit">검색</button>
            </form>
        </div>
    </div>
	
	
	<table id="tbl-member">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>회원권한</th>
				<th>성별</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>선호언어</th>
				<th>가입일</th>
			</tr>
		</thead>
		<tbody>



			

			
		</tbody>
	</table>
	<div id="pageBar">
		
	</div>
</section>








