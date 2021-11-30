<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<% if(loginMember.getStudy_group() != 0) {%>
	<h1><%= loginMember.getStudy_group() %>번 스터디 입니다.</h1>

<%} else{ %>


	<h1>소속된 스터디 그룹이 없습니다 그룹을 생성하세요.</h1>
	<input type="button" value="스터디 그룹 생성" onclick="location.href='<%= request.getContextPath() %>/studygroup/create';">
	
	
	<%} %>

<br /><br /><br />


<%@ include file="/WEB-INF/views/common/footer.jsp" %>