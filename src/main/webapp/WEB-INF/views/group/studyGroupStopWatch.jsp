<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<br />
<h2>오늘의 공부 시간</h2>
<form 
	name = "stopWatchFrm"
	method = "POST"
	action="<%= request.getContextPath() %>/studygroup/stopwatch">

	<div id='box' class="box">
		<div id='timerBox' class="timerBox">
			<div id="time" class="time">00:00:00</div>
		</div>
		<div class="btnBox">
			<div id="startbtn" class="fa fa-play">시작</div>
			<div id="pausebtn" class="fa fa-pause">일시정지</div>
			<div id="stopbtn" class="fa fa-stop">멈춤</div>
		</div>
	</div>

</form>

	
<script>
var time = 0;
var starFlag = true;
$(document).ready(function(){
  buttonEvt();
});

function init(){
  document.getElementById("time").innerHTML = "00:00:00";
}

function buttonEvt(){
  var hour = 0;
  var min = 0;
  var sec = 0;
  var timer;
  var stringTime;
  // start btn
  $("#startbtn").click(function(){

    if(starFlag){
      $(".fa").css("color","#FAED7D")
      this.style.color = "#4C4C4C";
      starFlag = false;

      if(time == 0){
        init();
      }
      timer = setInterval(function(){
        time++;

        min = Math.floor(time/60);
        hour = Math.floor(min/60);
        sec = time%60;
        min = min%60;

        var th = hour;
        var tm = min;
        var ts = sec;
        if(th<10){
        th = "0" + hour;
        }
        if(tm < 10){
        tm = "0" + min;
        }
        if(ts < 10){
        ts = "0" + sec;
        
        }

        stringTime = th + ":" + tm + ":" + ts;
        document.getElementById("time").innerHTML = stringTime;
      }, 1000);
    }
  });

  // pause btn
  $("#pausebtn").click(function(){
    if(time != 0){
      $(".fa").css("color","#FAED7D")
      this.style.color = "#4C4C4C";
      clearInterval(timer);	// 반복 중단
      starFlag = true;
      
    }
  });

  // stop btn
  $("#stopbtn").click(function(){
    if(time != 0){
      $(".fa").css("color","#FAED7D")
      this.style.color = "#4C4C4C";
      clearInterval(timer);	// 반복 중단
      starFlag = true;
      time = 0;				// 시간 초기화
      init();				// time 클래스에 초기화된 텍스트 삽입 함수
      const inputTime = `<input type="hidden" name="stringTime" value="\${stringTime}" />`; 
      const inputId = `<input type="hidden" name="memberId" value="<%= loginMember.getMember_id() %>" />`; 
      $(document.stopWatchFrm)
      		.append(inputTime)
      		.append(inputId)
      		.submit();
      
    }
  });
}
</script>
	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>