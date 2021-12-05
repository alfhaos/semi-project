<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css" />
<%@page import="com.kh.studygroup.board.model.vo.StudyGroupBoard"%>
<%@page import="com.kh.studygroup.board.model.vo.Attachment"%> 
<%@ page import = "java.util.List" %>

<%
	StudyGroupBoard board = (StudyGroupBoard) request.getAttribute("board");
%>
<section id="board-container">
	<h2>게시판</h2>
	<table id="tbl-board-view">
		<tr>
			<th>글번호</th>
			<td><%= board.getBoardNo() %></td>
		</tr>
		<tr>
			<th>제 목</th>
			<td><%= board.getTitle() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%= board.getWriter() %></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%= board.getRead_count() %></td>
		</tr>
		
<%
	List<Attachment> attachments = board.getAttachments();
	if(attachments != null && !attachments.isEmpty()){
		for(int i = 0; i<attachments.size(); i++ ){
			Attachment attach = attachments.get(i);
	
%>
			<tr>
			<th>첨부파일<%= i + 1 %></th>
			<td>
				<%-- 첨부파일이 있을경우만, 이미지와 함께 original파일명 표시 --%>
				<img alt="첨부파일" src="<%=request.getContextPath() %>/images/cola.png" width=16px>
				<a href="<%= request.getContextPath() %>/studygroup/fileDownload?no=<%= attach.getNo() %>"><%= attach.getOriginal_filename() %></a>
			</td>
			</tr>
			<%
			}
		}
			%>
		
		<tr>
			<th>내 용</th>
			<td><%= board.getContent() %></td>
		</tr>
		<tr>
			<%-- 작성자와 관리자만 마지막행 수정/삭제버튼이 보일수 있게 할 것 --%>
			<th colspan="2">
				<input type="button" value="수정하기" onclick="updateBoard()">
				<input type="button" value="삭제하기" onclick="deleteBoard()">
			</th>
		</tr>
	</table>
</section>

<form 
	name = "GroupBoardDelFrm"
	method = "POST"
	action="<%= request.getContextPath() %>/studygroup/boardDel">
	
	<input type="hidden" name = "no" value ="<%= board.getBoardNo() %>"/>
	

</form>
<script>
	const deleteBoard = () => {
		if(confirm("이 게시물을 정말 삭제하시겠습니까?")){
			$(document.GroupBoardDelFrm).submit();
		}
	};
	
	const updateBoard = () => {
		location.href = "<%= request.getContextPath() %>/studygroup/boardUpdate?no=<%= board.getBoardNo() %>";
	};
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
