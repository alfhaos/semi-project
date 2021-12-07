<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@page import="com.kh.studygroup.model.vo.StudyGroupMember"%> 
<%@ page import = "java.util.List" %>
<%
	
	List<StudyGroupMember> list = (List<StudyGroupMember>) request.getAttribute("MemberList");
%>
	<table>
	
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>회원 퇴장</th>

			</tr>
		</thead>
		
		
		<tbody>
			<% for(StudyGroupMember member : list){ %>
				<tr>
					<td><%= member.getGroupMemberId() %></td>
					<td><%= member.getGroupMemberName() %></td>
					<td><button type ="button" value = "<%= member.getGroupMemberId() %>" class="btn-accept">내보내기</button></td>
				</tr>	
			<%} %>	
		
		</tbody>
	

	
	</table>
<form
	name = "AdministrateFrm"
	method = "POST" 
	action="<%= request.getContextPath() %>/studygroup/administrate">
	<input type="hidden" name = "studyGroup" value = "<%= loginMember.getStudy_group() %>" />
</form>

<script>

$(".btn-accept").click((e) => {
	 const memberId = $(e.target).val();
	 const inputId = `<input type="hidden" name="memberId" value="\${memberId}" />`;
	 var returnValue = confirm("정말로 추방하시겠습니까?");
	 console.log(returnValue);
	 if(returnValue){
	
		 $(document.AdministrateFrm)
		 					.append(inputId)
		 					.submit();
		 
	 }
	 else{
		 return;
	 }
});
</script>



<%@ include file="/WEB-INF/views/common/footer.jsp" %>