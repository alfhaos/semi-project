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
	action="<%=request.getContextPath() %>/board/frontboardEnroll" 
	method="post"
	enctype="multipart/form-data">      
		<div class="row justify-content-md-center">
            <div class="col-sm-5">
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <label class="input-group-text">제 목</label>
                  </div>            
                  <input type="text" class="form-control">              
                </div>
            </div>
            <div class="col-sm-4">
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <label class="input-group-text">작성자</label>
                  </div>            
                  <input readonly type="text" class="form-control" value="<%= loginMember.getMember_name() %>">              
                </div>
            </div>
            
            <div class="col-sm-1">
                <div class="input-group mb-1">
                    <select class="custom-select" id="inputGroupSelect03">
                    <option selected>분류</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                  </select>  
                </div>            
                </div>
		<div>
                  <textarea class="form-control" id="p_content"></textarea>
                  <script type="text/javascript">
                  CKEDITOR.replace('p_content'
                                                  , {height: 500                                             
                                                  });
                  </script>
		</div>        
		<br />
		
		<div class="row justify-content-md-center">
        <button type="submit" class="btn btn-outline-secondary" style="width: 20%; font-weight: bold">
             등   록          
            </button>
        </div>
        </div>
        </form>
	<table id="tbl-board-view">
	
	<tr>
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
	</table>
      
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

