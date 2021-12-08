<%@page import="com.kh.studygroup.model.vo.StudyGroup"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>  
<%
	
	StudyGroup studyGroup = (StudyGroup) request.getAttribute("studyGroup");


%>

<script>
/**
* boardEnrollFrm 유효성 검사
*/
function boardValidate(){
	const $title = $("[name=title]");
	const $content = $("[name=content]");
	
	//제목을 작성하지 않은 경우 폼제출할 수 없음.
	if(!/^.+$/.test($title.val())){
		alert("제목을 입력하세요.");
		return false;
	}
					   
	//내용을 작성하지 않은 경우 폼제출할 수 없음.
	// \n는 .에 포함되지 않는다.
	if(!/^(.|\n)+$/.test($title.val())){
		alert("내용을 입력하세요.");
		return false;
	}
	
	return true;
}

//off-line 선택하면 지역 선택창 뜸
$(document).ready(function(){
	$('#area').change(function() {
		var state = $('#area option:selected').val();
		
		if( state =='Off-line'){
			$('#location').show();
		}else{
			$('#location').hide();
		}
	})	
})
	

$(document.boardEnrollFrm).submit(boardValidate);

</script>
<script type="text/javascript" src="<%=request.getContextPath() %>/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css" />
<style>
#location {
	display: none;
}
table {
    margin-left:auto; 
    margin-right:auto;
}

</style>
<section id="board-container">
<h2>게시판 작성</h2>
<form
	name="boardEnrollFrm"
	action="<%=request.getContextPath() %>/board/boardEnroll" 
	method="post">
	<table id="tbl-board-view">
	<tr>
		<th>제 목</th>
		<td><input type="text" name="title" required></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>
			<input type="text" name="writer" value="<%= loginMember.getMember_id() %>" readonly/>
		<td>
	</tr>
	<tr>
		<th>내 용</th>
		<td><textarea rows="5" cols="40" name="content"></textarea></td>
	</tr>
	<tr>
		<th colspan="2">
			<input type="submit" value="등록하기">
		</th>
	</tr>
		
</table>
<% if(studyGroup != null){ %>
<input type="hidden" name="group_no" value="<%= studyGroup.getGroup_number() %>" />
<% } %>
</form >
		<% if(studyGroup != null){ %>
		<table>
			<tr>
					<th>그룹번호</th>
					<td><%= studyGroup.getGroup_number() %></td>
				</tr>
				<tr>
					<th>스터디 이름</th>
					<td><%= studyGroup.getGroup_name() %></td>
				</tr>
				<tr>
					<th>인원 현황</th>
					<td><%= studyGroup.getNow_member() / studyGroup.getMax_member() %></td>
				</tr>
				<tr>
					<th>지역</th>
					<td><%= studyGroup.getArea() %></td>
				</tr>
				
				<tr>
					<th>스터디 언어</th>
					<td>
						<%= studyGroup.getLanguage() %> 
					</td>
				</tr>
				<tr>
					<th>온/오프라인</th>
					<td><%= studyGroup.getOn_off() %></td>
				</tr>
				<tr>
					<th>모집 상태</th>
					<td><%= studyGroup.getStatus() %></td>
				</tr>
		
		</table>
		<% } %>

</section>
      
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
</section>
<script type="text/javascript" src="<%=request.getContextPath() %>/ckeditor/ckeditor.js"></script>

