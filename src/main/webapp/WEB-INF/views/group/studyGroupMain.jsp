<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@page import="com.kh.studygroup.model.vo.StudyGroupMember"%> 
<%@ page import = "java.util.List" %>
<%
	
	List<StudyGroupMember> list = (List<StudyGroupMember>) request.getAttribute("MemberList");

%>

<% if(loginMember.getStudy_group() != 0) {%>
	<h1><%= loginMember.getStudy_group() %>번 스터디 입니다.</h1>
	<hr />
	<ul>
	
		<% for(StudyGroupMember member : list){ %>
			<li><%= member.getGroupMemberName() %></li>
		<%} %>		

	</ul>
	
	<hr />
	
	<table>
		<thead>
			<tr>
				<th>랭킹</th>
				<th>이름</th>
				<th>공부시간</th>
			</tr>
		</thead>
		
		<tbody>
			
			<% for(int i = 0; i < list.size(); i++){ StudyGroupMember member = list.get(i); %>
			
			<tr>
				<td><%= i+1 %></td>
				<td><%= member.getGroupMemberName() %></td>
				<td><%= member.getStudyTime() %></td>
			</tr>
			<%} %>
			
		</tbody>
	</table>
	<input type="button" value = "공부 시작!" onclick="location.href='<%= request.getContextPath() %>/studygroup/stopwatch';" />
	<input type="button" value = "그룹 채팅!" onclick="location.href='<%= request.getContextPath() %>/studygroup/chat';" />
	<input type="button" value = "그룹 게시판!" onclick="location.href='<%= request.getContextPath() %>/studygroup/boardlist';" />
	<input type="button" value = "신청자 현황" onclick="location.href='<%= request.getContextPath() %>/studygroup/applicant';" />

<%} else{ %>


	<h1>소속된 스터디 그룹이 없습니다 그룹을 생성하세요.</h1>
	<input type="button" value="스터디 그룹 생성" onclick="location.href='<%= request.getContextPath() %>/studygroup/create';">
	
	
	<%} %>





<br /><br /><br />


<%@ include file="/WEB-INF/views/common/footer.jsp" %>