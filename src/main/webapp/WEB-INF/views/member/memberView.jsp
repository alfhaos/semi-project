<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String msg = (String) session.getAttribute("msg");
	if(msg != null) session.removeAttribute("msg");
	Member loginMember = (Member) session.getAttribute("loginMember");
%>   
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css" />
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
<script>
$(() => {
	<% if(msg != null){ %>
	alert("<%= msg %>");
	
	<%} %>
});
</script>
<section id=enroll-container>
	<h2>회원 정보</h2>
	<form id="memberUpdateFrm" method="post">
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="memberId" id="memberId" value="<%= loginMember.getMember_id() %>" readonly>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>	
				<input type="text"  name="memberName" id="memberName" value="<%= loginMember.getMember_name() %>"  required><br>
				</td>
			</tr>

			<tr>
				<th>이메일</th>
				<td>	
					<input type="email" placeholder="abc@xyz.com" name="email" id="email" value="<%= loginMember.getEmail() %>"><br>
				</td>
			</tr>
			<tr>
				<th>휴대폰</th>
				<td>	
					<input type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" value="<%= loginMember.getPhone() %>" required><br>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>	
					<input type="text" placeholder="" name="address" id="address" value="<%= loginMember.getAddress() %>"><br>
				</td>
			</tr>
			<tr>
				<th>성별 </th>
				<td>
		       		<input type="radio" name="gender" id="gender0" value="M" <%= "M".equals(loginMember.getGender()) ? "checked" : "" %>>
					<label for="gender0">남</label>
					<input type="radio" name="gender" id="gender1" value="F" <%= "F".equals(loginMember.getGender()) ? "checked" : "" %>>
					<label for="gender1">여</label>
				</td>
			</tr>
			<tr>
				<th>언어 </th>
				<td>
									
					<input type="radio" name="language" id="language0" value="c" <%= loginMember.getLanguage().contains("c") ? "checked" : "" %>><label for="language0">C</label>
					<input type="radio" name="language" id="language1" value="c++" <%= loginMember.getLanguage().contains("c++") ? "checked" : "" %>><label for="language1">C++</label>
					<input type="radio" name="language" id="language2" value="java" <%= loginMember.getLanguage().contains("java") ? "checked" : "" %>><label for="language2">Java</label><br />
					<input type="radio" name="language" id="language3" value="javaScript" <%= loginMember.getLanguage().contains("javaScript") ? "checked" : "" %>><label for="language3">JavaScript</label>
					<input type="radio" name="language" id="language4" value="Spring" <%= loginMember.getLanguage().contains("Spring") ? "checked" : "" %>><label for="language4">Spring</label><br />
					<input type="radio" name="language" id="language5" value="Python" <%= loginMember.getLanguage().contains("Python") ? "checked" : "" %>><label for="language5">Python</label><br />
				</td>
			</tr>
		</table>
        <input type="button" onclick="updateMember();" value="정보수정"/>
        <input type="button" onclick="updatePassword();" value="비밀번호변경"/>
        <input type="button" onclick="deleteMember();" value="탈퇴"/>
	</form>
</section>
<!-- 회원탈퇴폼 : POST /member/memberDelete 전송을 위해 시각화되지 않는 폼태그 이용 -->
<form name="memberDelFrm" action="<%= request.getContextPath() %>/member/memberDelete" method="POST">
	<input type="hidden" name="memberId" value="<%= loginMember.getMember_id() %>" />
</form>

<script>
const updatePassword = () => location.href = "<%= request.getContextPath() %>/member/updatePassword";
const deleteMember = () => {
	if(confirm("정말로 탈퇴하시겠습니까?")){
		$(document.memberDelFrm).submit();
	}
}
const updateMember = () => {
	// 폼의 action값을 할당후 제출!
	$(memberUpdateFrm)
		.attr("action", "<%= request.getContextPath() %>/member/memberUpdate")
		.submit();
};
</script>
