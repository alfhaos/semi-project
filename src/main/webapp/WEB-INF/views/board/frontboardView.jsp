<%@page import="com.kh.board.model.vo.Frontboard"%>
<%@page import="com.kh.board.model.vo.FrontboardComment"%>
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


	<input type="button" value="스터디그룹 참가신청" id="writing-btn" onclick="noLogin_writing_btn()"/>

<%} else { %>


	<input type="button" value="스터디그룹 참가신청" id="writing-btn" onclick="groupApply()"/>

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
	<input type="hidden" id = "group" name = "group" value = "<%= loginMember.getStudy_group() %>" />
</form>
<% } %>

<form
	name="boardDelFrm"
	method="POST" 
	action="<%= request.getContextPath() %>/board/frontboardDelete" >
	<input type="hidden" name="no" value="<%= frontboard.getNo() %>" />
</form>
      
      	<div class="comment-container">
        <div class="comment-editor">
            <form 
            	action="<%=request.getContextPath()%>/board/frontboardCommentEnroll" 
            	method="post" 
            	name="boardCommentFrm">
                <input type="hidden" name="boardNo" value="<%= frontboard.getNo() %>" />
                <input type="hidden" name="writer" value="<%= loginMember != null ? loginMember.getMember_id() : "" %>" />
                <input type="hidden" name="commentLevel" value="1" />
                <input type="hidden" name="commentRef" value="0" />    
				<textarea name="content" cols="60" rows="3"></textarea>
                <button type="submit" id="btn-comment-enroll1">등록</button>
            </form>
<% 
	List<FrontboardComment> commentList = (List<FrontboardComment>) request.getAttribute("commentList"); 
	if(commentList != null && !commentList.isEmpty()){
%>
		<table id="tbl-comment">
<%
		for(FrontboardComment bc : commentList){
			boolean removable = 
					loginMember != null && 
					(
					  loginMember.getMember_id().equals(bc.getWriter())
					  || MemberService.ADMIN_ROLE.equals(loginMember.getMember_role())
					);

			if(bc.getCommentLevel() == 1){
%>
			<tr class="level1">
				<td>
					<sub class="comment-writer"><%= bc.getWriter() %></sub>
					<sub class="comment-date"><%= bc.getRegDate() %></sub>
					<br />
					<%-- 댓글내용 --%>
					<%= bc.getContent() %>
				</td>
				<td>
					<button class="btn-reply" value="<%= bc.getNo() %>">답글</button>
<% if(removable){ %>
					<button class="btn-delete" value="<%= bc.getNo() %>">삭제</button>
<% } %>

				</td>
			</tr>
<%
			} else {
%>
			<tr class="level2">
				<td>
					<sub class="comment-writer"><%= bc.getWriter() %></sub>
					<sub class="comment-date"><%= bc.getRegDate() %></sub>
					<br />
					<%-- 대댓글내용 --%>
					<%= bc.getContent() %>
				</td>
				<td>
<% if(removable){ %>
					<button class="btn-delete" value="<%= bc.getNo() %>">삭제</button>
<% } %>

				</td>
			</tr>
<%
			}
		}
%>
		</table>
<%
	}
%>
</div>
<script>

$("[name=content]", document.boardCommentFrm).focus((e) => {

	<% if(loginMember == null){ %>
		loginAlert();
		return;
	<% } %>

	});

$(document.boardCommentFrm).submit((e) => {
	<% if(loginMember == null){ %>
		loginAlert();
//		e.preventDefault();
//		return;
		return false;
	<% } %>

		const $content = $("[name=content]", e.target);
		if(!/^(.|\n)+$/.test($content.val())){
			alert("댓글을 작성해주세요.");
			e.preventDefault();
		}

	});
	
const loginAlert = () => {
	alert("로그인후 사용가능합니다.");
	$(memberId).focus();
};

function groupApply() {
	var studygroup = $("#group").val();
	console.log(studygroup);
	if(confirm("지원하시겠습니까?")){
		if( studygroup != 0){
			alert("이미 소속된 스터디 그룹이 존재합니다.");
			return;
		}
		else{
			$(document.groupApplyFrm).submit();		
		}
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