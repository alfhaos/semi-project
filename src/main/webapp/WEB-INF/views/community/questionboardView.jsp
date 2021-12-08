<%@page import="com.kh.community.model.vo.QuestionboardComment"%>
<%@page import="com.kh.community.model.vo.Attachment"%>
<%@page import="com.kh.community.model.vo.Questionboard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	Questionboard questionboard = (Questionboard) request.getAttribute("questionboard");
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/freeboard.css" />
<section id="board-container">
	<h4><a href="<%= request.getContextPath() %>/community/questionboardList">Q&A게시판</a></h4>
	<table id="tbl-board-view">
	
	<% 	if(
				loginMember != null && 
				(
				  loginMember.getMember_id().equals(questionboard.getWriter())
				  || MemberService.ADMIN_ROLE.equals(loginMember.getMember_role())
				)
			){ %>
		<tr>
			<%-- 작성자와 관리자만 마지막행 수정/삭제버튼이 보일수 있게 할 것 --%>
			<th colspan="2">
				<input type="button" value="수정하기" onclick="updateBoard()" style="float: right;">
				<input type="button" value="삭제하기" onclick="deleteBoard()" style="float: right;">
			</th>
		</tr>
		<% 	} %>
	
		<tr>
		
			<td><h2><%= questionboard.getTitle() %></h2></td>
		</tr>
		<tr style="border-top:1px solid #e9ecef; border-bottom:1px solid #e9ecef;">
			
			<td><%= questionboard.getWriter() %> &nbsp; &nbsp;<%= questionboard.getRegDate() %><td style="text-align=rignt;">조회 <%= questionboard.getReadCount() %></td>
		</tr>
		
<% 
	List<Attachment> attachments = questionboard.getAttachments();
	if (attachments != null && !attachments.isEmpty()) {
		for(int i = 0; i < attachments.size(); i++){
			Attachment attach = attachments.get(i);
%>
		<tr>
			
			<td style="padding-top:3px">
				<%-- 첨부파일이 있을경우만, 이미지와 함께 original파일명 표시 --%>
				<img alt="첨부파일" src="<%=request.getContextPath() %>/images/attachment-g5d16ffa11_640.png" width=16px height="14px">
				<a href="<%= request.getContextPath() %>/community/fileDownload?no=<%= attach.getNo() %>"><%= attach.getOriginalFilename() %></a>
			</td>
		</tr>
<% 
		}
	} 
%>
		<tr style="border-top:1px solid #e9ecef;" >
			<td style="padding:15px 0 25px 15px;">
				<%= questionboard.getContent() %> 
			</td>
		</tr>
		<tr>
			<th colspan="2">
			<input type="button" value="추천" onclick="likeBoard()"/>
			<%= questionboard.getLikeCount() %>
			</th>
		</tr>
		
	</table>
	
	<hr style="margin-top:30px;" />	
    
    <div class="comment-container">
        <div class="comment-editor">
            <form 
            	action="<%=request.getContextPath()%>/community/questionboardCommentEnroll" 
            	method="post" 
            	name="boardCommentFrm">
                <input type="hidden" name="boardNo" value="<%= questionboard.getNo() %>" />
                <input type="hidden" name="writer" value="<%= loginMember != null ? loginMember.getMember_id() : "" %>" />
                <input type="hidden" name="commentLevel" value="1" />
                <input type="hidden" name="commentRef" value="0" />    
				<textarea name="content" cols="60" rows="3"></textarea>
                <button type="submit" id="btn-comment-enroll1">등록</button>
            </form>
        </div>
		
		<!--table#tbl-comment-->
<% 
	List<QuestionboardComment> commentList = (List<QuestionboardComment>) request.getAttribute("commentList"); 
	if(commentList != null && !commentList.isEmpty()){
%>
		<table id="tbl-comment">
<%
		for(QuestionboardComment bc : commentList){
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
					<br />
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
					<br />
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


</section>
<form 
	name="boardLikeFrm"
	action="<%= request.getContextPath() %>/community/questionboardLike"
	method="GET">
	<input type="hidden" name="no" value="<%= questionboard.getNo() %>" />
</form> 

<form
	name="boardDelFrm"
	method="POST" 
	action="<%= request.getContextPath() %>/community/questionboardDelete" >
	<input type="hidden" name="no" value="<%= questionboard.getNo() %>" />
</form>	
<form 
	action="<%= request.getContextPath() %>/community/questionboardCommentDelete" 
	name="boardCommentDelFrm"
	method="POST">
	<input type="hidden" name="no" />
	<input type="hidden" name="boardNo" value="<%= questionboard.getNo() %>"/>
</form>

<script>
$(".btn-delete").click(function(){
	if(confirm("해당 댓글을 삭제하시겠습니까?")){
		var $frm = $(document.boardCommentDelFrm);
		var no = $(this).val();
		$frm.find("[name=no]").val(no);
		$frm.submit();
	}
});	

/**
 * 대댓글 입력
 * 이벤트발생객체 e.target -> button.btn-reply
 */
$(".btn-reply").click((e) => {
<% if(loginMember == null){ %>
	loginAlert();
	return;
<% } %>

	const commentRef = $(e.target).val();
	console.log(commentRef);
	
	const tr = `<tr>
	<td colspan="2" style="text-align:left">
		<form 
			action="<%=request.getContextPath()%>/community/questionboardCommentEnroll" 
			method="post">
		    <input type="hidden" name="boardNo" value="<%= questionboard.getNo() %>" />
		    <input type="hidden" name="writer" value="<%= loginMember != null ? loginMember.getMember_id() : "" %>" />
		    <input type="hidden" name="commentLevel" value="2" />
		    <input type="hidden" name="commentRef" value="\${commentRef}" />    
			<textarea name="content" cols="60" rows="2"></textarea>
		    <button type="submit" class="btn-comment-enroll2">등록</button>
		</form>
	</td>
</tr>`;
	console.log(tr);
	
	// e.target인 버튼태그의 부모tr을 찾고, 다음 형제요소로 추가
	const $baseTr = $(e.target).parent().parent();
	const $tr = $(tr);
	
	$tr.insertAfter($baseTr)
		.find("form")
		.submit((e) => {
			const $content = $("[name=content]", e.target);
			if(!/^(.|\n)+$/.test($content.val())){
				alert("댓글을 작성해주세요.");
				e.preventDefault();
			}
		});
		
	
	// 클릭이벤트핸들러 제거!
	$(e.target).off("click");
	
	
	


});



$("[name=content]", document.boardCommentFrm).focus((e) => {

<% if(loginMember == null){ %>
	loginAlert();
	return;
<% } %>

});

$(document.boardCommentFrm).submit((e) => {
<% if(loginMember == null){ %>
	loginAlert();
//	e.preventDefault();
//	return;
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


const deleteBoard = () => {
	if(confirm("이 게시물을 정말 삭제하시겠습니까?")){
		$(document.boardDelFrm).submit();		
	}
};

const updateBoard = () => {
	location.href = "<%= request.getContextPath() %>/community/questionboardUpdate?no=<%= questionboard.getNo() %>";
};

const likeBoard = () =>{
	<% if(loginMember == null){ %>
		loginAlert();
		return;
	<% } %>
	if(confirm("이 게시물을 추천하시겠습니까?")){
		$(document.boardLikeFrm).submit();		
	   }
	};
</script>



<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />