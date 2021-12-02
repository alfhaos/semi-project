<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>  


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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css" />
<style>
#location {
	display: none;
}
table {
    margin-left:auto; 
    margin-right:auto;
}

table, td, th {
    border-collapse : collapse;
    border : 1px solid black;
};
</style>
<section id="board-container">
<h2>게시판 작성</h2>
<form
	name="boardEnrollFrm"
	action="<%=request.getContextPath() %>/board/boardEnroll" 
	method="post"
	enctype="multipart/form-data">
	<table id="tbl-board-view">
	<tr>
		<th>제 목</th>
		<td><input type="text" name="title" required></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>
			<input type="text" name="writer" value="sss" readonly/> 
		</td>
	</tr>
	<tr>
		<th>사용언어</th>
		<td>
			<select name="language" id="language">
				<option value="Javascript">Javascript</option>
				<option value="Java">Java</option>
				<option value="Python">Python</option>
				<option value="Spring">Spring</option>
				<option value="C++">C++</option>
				<option value="C">C</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>장소</th>
		<td>
			<select name="area" id="area">
				<option value="On-line">On-line</option>
				<option value="Off-line">Off-line</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>지역</th>
		<td>
			<select name="location" id="location">
				<option value="Seoul">서울</option>
				<option value="Gyeonggi-N">경기 북부</option>
				<option value="Gyeonggi-S">경기 남부</option>
				<option value="Incheon">인천</option>
				<option value="Busan">부산</option>
				<option value="Gangwon">강원도</option>
				<option value="Chungcheong">충청도</option>
				<option value="Jeolla">전라도</option>
				<option value="Gyeongsang">경상도</option>
				<option value="Jeju">제주도</option>
			</select>
		</td>
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
</form>
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
