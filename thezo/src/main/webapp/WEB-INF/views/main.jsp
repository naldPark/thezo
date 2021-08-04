<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Zo</title>

<style>
    .outer{margin:auto; height: 770px;}
    .wrap{width: 100%; height:350px; margin-top:20px; border: 1px solid lightgray; font-size:11.5pt;}
    .outer-wrap{float: left; width:28%; margin: 15px;}
    .boxTitle{width:100%; height:40px; background-color: rgba(20, 70, 104, 0.123); color: black; padding-top:7px; padding-left:20px;text-align: left;}
    .more{float: right; margin-right: 20px; height:28px;}
    .board > tbody  > tr > td:nth-child(1) {
        width:60%; padding-left:20px;
        text-align: left;
    }
    .board > tbody  > tr > td:nth-child(2) {
        width:20%; 
    }
    .board > tbody  > tr > td:nth-child(3) {
        width:20%; 
    }
    .board > tbody  > tr {cursor: pointer;}

	.text-left>span:hover{
		cursor:pointer;
		color: rgb(0,121,251); 
		font-weight:bold;
	}

</style>
</head>
<body>
	<jsp:include page="common/header.jsp"/>
	
   	 <section>
        <div class="outer" align="center">      
            <div class="outer-wrap" style="width:24%">
                <div class="wrap"><br>
                    <div class="row mt-4 mb-4" style="width:100%;">
                        <div class="col-sm-4" style="height: 45%;">
                            <img src="resources/images/person.png" style="height: 70px;">
                        </div>
                        <div class="col-sm-8"  style="height: 45%;">
                            <h5>${loginUser.memName} ${loginUser.rank}</h5> <h5>${loginUser.department}</h5>
                            <button type="button" class="btn btn-sm btn-secondary">정보수정</button>
                             <a href="logout.me" class="btn btn-sm btn-secondary">로그아웃</a>                            
                        </div>
                    </div>
                    <div class="ml-5 mb-3" align="left">
                        출근시간: 오전 9시 35분<br>
                        퇴근시간: <br>
                    </div>
                    <form action="">
                    	<input type="hidden" id="timevalue">
	                    <button type="submit" id="start" onclick="start_click();" class="btn btn-primary">출근</button>
	                    <button type="submit" id="finish" onclick="finish_click();"class="btn btn-primary">퇴근</button><br>
                    </form>
                </div>
                <div class="wrap">
                    <div class="boxTitle">메세지</div>
                    <div style="padding: 40px; text-align: center; font-size:14pt">
                        <div class="row">
                            <div class="col-sm-2">
                                <i class="fas fa-envelope fa-lg"></i>
                            </div>
                            <div class="col text-left">
                                <span>새 메일 2건 <i class="fas fa-exclamation-circle" style="color:red"></i></span>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-sm-2">
                                <i class="fa fa-bell fa-lg" aria-hidden="true"></i>
                            </div>
                            <div class="col text-left">
                                <span onclick="mainOpenUnreadNf();"> 알림 
                                <i id="notifyNewNf" class="fas fa-exclamation-circle" style="color:red"></i>
                                </span>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-sm-2">
                                <i class="fas fa-comments fa-lg"></i>

                            </div>
                            <div class="col text-left">
                                <span onclick="mainOpenUnreadChat();">대화하기 
                                <i id="notifyNewChat" class="fas fa-exclamation-circle" style="color:red"></i>
                                </span>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-sm-2">
                                <i class="fas fa-sticky-note fa-lg"></i>
                            </div>
                            <div class="col text-left">
                                <span onclick="mainOpenUnreadMsg();">쪽지 
                                <span class="mainMsgUnreadCount"></span>
                                <i id="notifyNewMsg" class="fas fa-exclamation-circle" style="color:red"></i>
                                </span>
                            </div>
                        </div>


                    </div>
                </div>
            </div>

            <div class="outer-wrap" style="width:45%">
                <div class="wrap">
                    <div class="boxTitle">전자결재 <a href="main.appr" class="btn badge-secondary btn-sm more">more</a></div>
                    <div style="padding:12px;">
                        <div class="input-group-prepend" style="justify-content: left;">
                            <a href="main.appr?apprFolder=waiting" class="btn btn-sm btn-outline-danger">
                            	결재대기 <i class="fas fa-exclamation-circle" style="color:red"></i>
                            </a> &nbsp;
                            <a href="main.appr?apprFolder=send" class="btn btn-sm btn-outline-success">상신문서</a> &nbsp;
                            <a href="main.appr?apprFolder=sendFin" class="btn btn-sm btn-outline-primary">완료문서</a>
                        </div>  
                    </div>
                    <table class="table table-sm board table-hover" style="text-align: center;" >
                        <thead>
                            <tr>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>날짜</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>결재하자결재하자<span class="badge badge-danger" style="margin-left:5px;">new</span></td>
                                <td>김개똥이</td>
                                <td>2020-01-01</td>
                            </tr>
                            <tr>
                                <td>결재하자결재하자결재하자결재하자<span class="badge badge-danger" style="margin-left:5px;">new</span></td>
                                <td>이말똥</td>
                                <td>2020-01-01</td>
                            </tr>
                            <tr>
                                <td>결재하자결재하자</td>
                                <td>웋헿헤</td>
                                <td>2020-01-01</td>
                            </tr>
                            <tr>
                                <td>결재하자결재하자<span class="badge badge-danger" style="margin-left:5px;">new</span></td>
                                <td>김개똥이</td>
                                <td>2020-01-01</td>
                            </tr>
                            <tr>
                                <td>결재하자결재하자결재하자결재하자<span class="badge badge-danger" style="margin-left:5px;">new</span></td>
                                <td>이말똥</td>
                                <td>2020-01-01</td>
                            </tr>
                            <tr>
                                <td>결재하자결재하자</td>
                                <td>웋헿헤</td>
                                <td>2020-01-01</td>
                            </tr>
                        </tbody>
                    </table>

                </div>
                <div class="wrap">
                    <div class="boxTitle">게시판<button type="button" class="btn badge-secondary btn-sm more">more</button></div>
                    <div class="input-group-prepend mt-2" style="justify-content: left;">
                        <button type="button" class="btn border-bottom-0 btn-sm btn-outline-secondary">공지사항</button> &nbsp;
                        <button type="button" class="btn border-bottom-0 btn-sm btn-outline-secondary">자유게시판</button> &nbsp;
                        <button type="button" class="btn border-bottom-0 btn-sm btn-outline-secondary">벼룩시장</button>
                    </div>  
                    <table class="table table-sm board table-hover" style="text-align: center;" >
                        <thead>
                            <tr>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>날짜</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>나는야게시판이당<span class="badge badge-danger" style="margin-left:5px;">new</span></td>
                                <td>김개똥이</td>
                                <td>2020-01-01</td>
                            </tr>
                            <tr>
                                <td>나는야게시판이당<span class="badge badge-danger" style="margin-left:5px;">new</span></td>
                                <td>이말똥</td>
                                <td>2020-01-01</td>
                            </tr>
                            <tr>
                                <td>나는야게시판이당</td>
                                <td>웋헿헤</td>
                                <td>2020-01-01</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
              
            </div>
            <div class="outer-wrap" style="width:23%">
                <div class="wrap">
                    <div class="boxTitle">캘린더<button type="button" class="btn badge-secondary btn-sm more">more</button></div>
                    <div style="padding: 20px; text-align: center;">
                        <table id="calendar" border="0" align="center" width="230" height="230" style="font-size:12pt;">
                            <tr>
                              <td align ="center"> <label onclick="prevClaendar()">&lt;</label> </td>
                              <td colspan="5" align ="center" id="calendarYM">yyyy년 m월</td>
                              <td align ="center"> <label onclick="nextCalendar()">&gt;</label> </td>
                            </tr> 
                            <tr>
                              <td align="center">일</td>
                              <td align="center">월</td>
                              <td align="center">화</td>
                              <td align="center">수</td>
                              <td align="center">목</td>
                              <td align="center">금</td>
                              <td align="center">토</td>
                            </tr>
                          </table>
                    </div>
                </div>
                <div class="wrap">
                    <div class="boxTitle">일정<button type="button" class="btn badge-secondary btn-sm more">more</button></div>
                    <div class="m-3 text-left">
                        <div class="shadow-sm p-3 mb-3 bg-light">2021-06-01 <br>나는 일정이야</div>
                        <div class="shadow-sm p-3 mb-3 bg-light">2021-06-01 <br>나는 일정이야</div>
                        <div class="shadow-sm p-3 mb-3 bg-light">2021-06-01 <br>나는 일정이야</div>
                    </div>
                    
                </div>
              
            </div>  
    </div>
    </section>

    <script>
     
    var today = new Date();
    function prevClaendar(){
      today = new Date(today.getFullYear(), today.getMonth()-1,today.getDate());
      buildCalendar();
    }
    function nextCalendar(){
      today = new Date(today.getFullYear(), today.getMonth()+1,today.getDate());
      buildCalendar();
 
    }
    function buildCalendar(){
      var nMonth = new Date(today.getFullYear(),today.getMonth(),1);
      var lastDate =new Date(today.getFullYear(),today.getMonth()+1,0);
      var tblCalendar =document.getElementById("calendar");   
      var tblCalendarYM =document.getElementById("calendarYM"); 
      tblCalendarYM.innerHTML = today.getFullYear()+"년"+(today.getMonth()+1)+"월";
 
      while(tblCalendar.rows.length>2){
        tblCalendar.deleteRow(tblCalendar.rows.length -1);
      }
      var row = null;
      row =tblCalendar.insertRow();
      var cnt =0;
 
        for ( i=0; i <nMonth.getDay(); i++) {
            cell =row.insertCell();
            cnt = cnt + 1;
        }

        for(i=1; i<=lastDate.getDate(); i++){
            cell =row.insertCell();
            cell.innerHTML = i;
            cell.style.color="darkgrey";

            cnt = cnt + 1;
            if (cnt%7 == 0)  
            row = calendar.insertRow();
        }
	 
    }
    buildCalendar();
    
    function start_click(){
    	alert("오늘도 화이팅!!");
    	document.getElementById("start").disabled = true;
    	location.href="start.att";
    }
    
    function finish_click(){
    	alert("오늘도 수고하셨습니다!!");
    	document.getElementById("finish").disabled = true;
    	location.href="finish.att";
    }
    
    // @Author: Jaewon.S
    // 알림쪽 보이게 하거나 안보이게 하기! 
 	$(function(){
    	if(${!empty unreadNotification}){
	    	$("#notifyNewNf").show();    		
    	}else{    		
	    	$("#notifyNewNf").hide();    		
    	}    	    	
 	})
    
    function mainOpenUnreadNf(){
    	if(${!empty unreadNotification}){
	    	$("#messenger-outer").hide();    		
			$(".notification-outer").css("display","block");
    	}else{    		
    		showMessengerArea();
    		moveToNotification(); 
   		}
    }

    // @Author: Jaewon.S    
    function mainOpenUnreadChat(){
    }
    
    // @Author: Jaewon.S
    function mainOpenUnreadMsg(){
		showMessengerArea();
    	moveToMessage();    	
    }
    
    </script>
 	
</body>
</html>