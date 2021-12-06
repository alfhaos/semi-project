<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<%
	List<Member> list = (List<Member>) request.getAttribute("list");
%>

<table id="tbl-board">
		<tr>
			<th>이름</th>
			<th>아이디</th>
			<th>성별</th>
			<th>관심언어</th>
			<th>이메일</th>
			<th>핸드폰</th>
			<th>주소</th>
			<th colspan = "2">여부</th>
			
		</tr>
		
		
<%		
	for(Member member : list){
%>
		<tr>
			<td><%= member.getMember_name() %></td>
			<td><%= member.getMember_id() %></td>
			<td><%= member.getGender() %></td>
			<td><%= member.getLanguage() %></td>
			<td><%= member.getEmail() %></td>
			<td><%= member.getPhone() %></td>
			<td><%= member.getAddress() %></td>
			<td><button type ="button" value = "<%= member.getMember_id()%>"  onclick = "btnAccept()" class="btn-accept">수락</button></td>
			<td><button type ="button" value = "<%= member.getMember_id() %>"  onclick = "btnRefuse()" class="btn-refuse">거절</button></td>
		</tr>
			
		<%} %>
	</table>
<form
	name = "applicantAcceptFrm"
	method = "POST" 
	action="<%= request.getContextPath() %>/studygroup/applicantCheck">
	<input type="hidden" name = "temp" value = "1" />
	</form>
<form
	name = "applicantRefuseFrm"
	method = "POST" 
	action="<%= request.getContextPath() %>/studygroup/applicantCheck">
	<input type="hidden" name = "temp" value = "0" />
	</form>
<script>

$(".btn-accept").click((e) => {
	 const memberId = $(e.target).val();
	 const inputId = `<input type="hidden" name="memberId" value="\${memberId}" />`;
	 $(document.applicantAcceptFrm)
	 					.append(inputId)
	 					.submit();
});

$(".btn-refuse").click((e) => {
	 const memberId = $(e.target).val();
	 const inputId = `<input type="hidden" name="memberId" value="\${memberId}" />`;
	 $(document.applicantRefuseFrm)
	 					.append(inputId)
	 					.submit();
});


</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>