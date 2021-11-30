<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member loginMember = (Member) session.getAttribute("loginMember");
%>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자기 작성글보기</title>
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
</head>
<body>
	<h1>작성글보기</h1>

</body>
</html>

