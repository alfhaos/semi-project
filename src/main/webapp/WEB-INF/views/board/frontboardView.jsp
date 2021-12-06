<%@page import="com.kh.board.model.vo.Frontboard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	Frontboard frontboard = (Frontboard) request.getAttribute("frontboard");
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css" />
<section id="board-container">
	<h2>게시판</h2>
	<table id="tbl-board-view">
		<tr>
			<th>글번호</th>
			<td><%= frontboard.getNo() %></td>
		</tr>
		<tr>
			<th>제 목</th>
			<td><%= frontboard.getTitle() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%= frontboard.getWriter() %></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%= frontboard.getReadCount() %></td>
		</tr>
		
		<tr>
			<th>내 용</th>
			<td>
				<%= frontboard.getContent() %> 
			</td>
		</tr>
		<tr>
			<th>스터디그룹 정보</th>
			<td>
				어쩌구
			</td>
		</tr>
		<% 	if(
				loginMember != null && 
				(
				  loginMember.getMember_id().equals(frontboard.getWriter())
				  || MemberService.ADMIN_ROLE.equals(loginMember.getMember_role())
				)
			){ %>
		<tr>
			<%-- 작성자와 관리자만 마지막행 수정/삭제버튼이 보일수 있게 할 것 --%>
			<th colspan="2">
				<input type="button" value="수정하기" onclick="updateBoard()">
				<input type="button" value="삭제하기" onclick="deleteBoard()">
			</th>
		</tr>
		<% 	} %>
	</table>
	<br />
<% if(loginMember == null){ %>	


	<input type="button" value="스터디그룹 참가신청" id="writing-btn" onclick=""/> <!-- 로그인 안하고 글쓰기 누를시 -->
	


<!-- 로그인 안하고 글쓰기 누를시 -->
	<input type="button" value="스터디그룹 참가신청" id="writing-btn" onclick="noLogin_writing_btn()"/>

<%} else { %>

	<input type="button" value="스터디그룹 참가신청" id="writing-btn" onclick=""/>


	<input type="button" value="스터디그룹 참가신청" onclick="groupApply()"/>

<% } %>		

	
	</section>
<% if(loginMember != null){ %>
<form 
	name = "groupApplyFrm"
	action="<%= request.getContextPath() %>/group/groupApply"
	method="GET">
	<input type="hidden" name="memberId" value="<%= loginMember.getMember_id() %>" />
	<input type="hidden" name="writer" value="<%= frontboard.getWriter() %>" />
	<input type="hidden" name="no" value="<%= frontboard.getNo() %>" />
</form>
<% } %>

<form
	name="boardDelFrm"
	method="POST" 
	action="<%= request.getContextPath() %>/board/frontboardDelete" >
	<input type="hidden" name="no" value="<%= frontboard.getNo() %>" />
</form>

<script>

function groupApply() {
	if(confirm("지원하시겠습니까?")){
		$(document.groupApplyFrm).submit();		
	}
};


function noLogin_writing_btn(){
	alert('로그인 후 이용해주세요.'); 
}

const deleteBoard = () => {
	if(confirm("이 게시물을 정말 삭제하시겠습니까?")){
		$(document.boardDelFrm).submit();		
	}
};

const updateBoard = () => {
	location.href = "<%= request.getContextPath() %>/board/frontboardUpdate?no=<%= frontboard.getNo() %>";
};
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>