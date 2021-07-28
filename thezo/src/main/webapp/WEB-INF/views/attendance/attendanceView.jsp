<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- select를 위한 부트스트랩-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!-- 풀캘린더  -->
<link href='${pageContext.request.contextPath}/resources/fullcalendar-5.8.0/lib/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/fullcalendar-5.8.0/lib/main.js'></script>
<!-- 한국어설정 -->
<script src='${pageContext.request.contextPath}/resources/fullcalendar-5.8.0/lib/locales/ko.js'></script> 
<script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
        	
        	eventClick: function() { 
        		$("#att-modal").modal("show");
        		
        	},
          initialView: 'dayGridMonth',
               locale: 'ko', // 한국어 설정
          themeSystem: 'bootstrap', // 테마 설정 
          	 editable: true,
          	eventDisplay: 'list-item',
           selectable: true,
           dayMaxEvents: true,
        headerToolbar: { // 헤더부 설정
          		   		start : 'prevYear,prev',
          		   		center : 'title',
          		   		end : 'today next,nextYear',
	          		   	close: 'fa-times',
	          		  	prev: 'fa-chevron-left',
	          		  	next: 'fa-chevron-right',
	          		  	prevYear: 'fa-angle-double-left',
	          		  	nextYear: 'fa-angle-double-right'
          	   			},
        
        views: {
        	
        	
        },
          	   			
        events:[
	        {
	            title: '출근',
	            start: '2021-07-27'
	        }
        ]
          
        });
        calendar.render();
      });
      
    window.onload = function(){
        $("#tab-1").click();
    }
</script>

<style>
    .outer-wrap{height: 200px;}
    .sub-menu{float: left; width: 30%; height: 100%;}
    .focus{
        border: 1px solid black !important;
        background-color: white !important;
        color: black !important;
        border-radius: 8%;
        font-weight: bold;
    }
    #sub-name{
        width: 80%;
        text-align: left;
        margin-top: 10%;
        margin-left: 10%;
        float: left;
        font-weight: bold;
        font-size: 30px;
    }
    #sub-button{
        margin-top: 46%;
        width: 100%;
        height : 15%;
    }

    .cbtn{
        font-size: 14px;
        background-color: gray;
        color: white;
        border: 0;
        padding-left : 3%;
        padding-right : 3%;
    }
    #tab-1, #tab-2 {width: 14%; height: 100%;}
    #tab-3 {height: 100%;}
    #tab-4 {width: 26%; height: 100%;}

    .sub-time{float: right; width: 30%; height: 100%;}
    #sub-curtime{
        float: right;
        margin-right: 5%; 
        margin-top: 15%;
        font-weight: bold;
        font-size: 17px;
    }
    #time-image{
        float: right;
        margin-right: 5%;
        margin-top: 15%;
    }
    #calendar{padding-top: 80px; width: 65%;}
    #search-box{
        display: inline-flex;
        width: 20%;
        float: right;
        margin-top: 5%;
    }

    .content{height: 800px;}
    .modal-lg{max-width: 400px !important; overflow: hidden;}
    .modal-body{max-height: calc(100vh - 200px); overflow-y: auto;}

    .att-modal{color:black; text-decoration: none;}
    #myModalheader{background-color: rgb(26,188,156);}
    #myModalLabel{color: white; font-size: 14px; font-weight: bold;}
    #att-form{font-weight: bold;}
    #att-form input[type="text"]{
        width: 250px;
        height: 30px;
        font-size: 12px;
        padding-left: 10px;
    }
    #att-form textarea{
        width: 250px;
        height: 130px;
        font-size: 12px;
        resize: none;
        padding-left: 10px;
    }
    .modal-footer{font-size: 13px; }
    .modal-footer>a:hover{text-decoration: none; font-weight: bold;}

    #yearly{border:1px solid rgba(0, 0, 0, 0); width: 100%; height: 100%;}
    #yearly-top{
        width: 90%;
        height: 4%;
        margin: auto;
        margin-top: 10%;
        color: rgb(164,164,164);
        font-weight: bold;
        font-size: 25px;
    }
    #year{font-weight: bold; font-size: 30px; float: left;}
    #select{float: right; width:15%;}

    #yearly-content{
        width: 90%;
        height: 60%;
        margin-top: 5%;
    }
    #att-table{
        text-align: center;
        width: 100%;
        height: 30%;
    }
    #yearly-content td{border-right: 1px solid lightgray; border-left: 1px solid lightgray; text-align: center; border-bottom: 1px solid lightgray; font-size: 14px;}
    #yearly-content th{width: 100px; background-color: rgb(214, 213, 213); text-align: center; border-bottom: 1px solid lightgray; font-size: 15px;}

    #enrstatement{
        width: 100%;
        height: 100%;
        padding-top: 10%;
    }
    #enr-top{
        border: 1px solid lightgray;
        width: 95%;
        height: 5%;
    }
    #enr-front{
        float: left;
        text-align: center;
        width: 8%;
        height: 100%;
        background-color: gray;
        color: white;
        line-height: 35px;
    }
    .form-check{
        text-align: center;
        line-height: 30px;
        font-weight: bold;
        float: left;
        margin-left: 3%;
        width: 15%;
    }
    .form-check input[type="radio"]{
        margin-top: 8px;
        vertical-align: middle;
    }
    #total-search{
        margin-top: 2px;
        vertical-align: middle;
    }
    .term{display: none}

    #enr-content{
        width: 95%;
        height: 85%;
        margin-top: 3%;
    }
    #enr-table{width: 100%;}
    #enr-table th{border: 1px solid rgb(177, 177, 177); text-align: center; background-color: lightgray;}
    #enr-table td{border: 1px solid rgb(177, 177, 177);}

    #resthistory{
        width: 95%;
        height: 90%;
        margin-top: 5%;
    }
    #rest-inform{
        width: 100%;
        height: 13%;
    }
    #myinform, #myused-name, #history-name{
        font-weight: bold;
        font-size: 20px;
        margin: auto;
        float: left;
    }
    #myinform-table{
        margin: auto;
        width: 100%;
        float: left;
    }
    #myinform-table th, #myinform-table td{border: 1px solid lightgray; text-align: center;}
    #rest-usedinform{
        width: 100%;
        height: 13%;
        margin-top: 5%;
    }
    #myused-table td{border: 1px solid lightgray; text-align: center;}
    #myused-table th{border: 1px solid lightgray; text-align: center; background-color: rgb(234,234,234);}
    #rest-usedhistory{
        width: 100%;
        height: 60%;
        margin-top: 5%;
    }
    #histroy-table td{border: 1px solid lightgray; text-align: center;}
    #histroy-table th{border: 1px solid lightgray; text-align: center; background-color: rgb(234,234,234);}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<script>

        function changetab1(){
            document.all.monthly.style.display = 'block';
            document.all.yearly.style.display = 'none';
            document.all.enrstatement.style.display = 'none';
            document.all.resthistory.style.display = 'none';
        }

        function changetab2(){
            document.all.monthly.style.display = 'none';
            document.all.yearly.style.display = 'block';
            document.all.enrstatement.style.display = 'none';
            document.all.resthistory.style.display = 'none';
        }

        function changetab3(){
            document.all.monthly.style.display = 'none';
            document.all.yearly.style.display = 'none';
            document.all.enrstatement.style.display = 'block';
            document.all.resthistory.style.display = 'none';

        }

        function changetab4(){
            document.all.monthly.style.display = 'none';
            document.all.yearly.style.display = 'none';
            document.all.enrstatement.style.display = 'none';
            document.all.resthistory.style.display = 'block';
        }



    </script>
	<section>
		<div class="outer" align="center">
            <div class="outer-wrap">
                <div class="sub-menu">
                    <div id="sub-name"><i class="fas fa-briefcase"></i> 근태관리</div>
                    <div class="tab" id="sub-button">
                        <button onclick="changetab1()" id="tab-1" type="button" class="cbtn">월간</button>&nbsp;
                        <button onclick="changetab2()" id="tab-2" type="button" class="cbtn">연간</button>&nbsp;
                        <button onclick="changetab3()" id="tab-3" type="button" class="cbtn">근태조정신청내역</button>&nbsp;
                        <button onclick="changetab4()" id="tab-4" type="button" class="cbtn">내 휴가기록</button>&nbsp;
                    </div>
                </div>
                <script>
                    $(".cbtn").click(function(){
                        $(".cbtn").removeClass("focus");

                        $(this).addClass("focus");
                    })
                </script>

                <div class="sub-time">    
                    <div id="sub-curtime">
                        2021년 7월 13일 화요일
                        <br>
                    05:06:07
                    </div>
                    <div id="time-image">
                        <img src="https://img.icons8.com/ios/50/000000/alarm-clock--v1.png"/>
                    </div>
                </div>
            </div>
            <div class="content">
                <!--월간-->
                <div id="monthly">
                	<div id="calendar"></div>
                	
                	<!-- 
                    <form id="search-date">
                        <div id="search-box">
                            <select class="form-select" name="select-year">
                                <option value="year">2021년</option>
                                <option value="year">2020년</option>
                                <option value="year">2019년</option>
                            </select>
                            &nbsp;
                            <select class="form-select" name="select-month">
                                <option value="year">12월</option>
                                <option value="year">11월</option>
                                <option value="year">10월</option>
                            </select>
                        </div>
                    </form>
                    <div id="att-enroll">
                        <a class="att-modal" data-toggle="modal" data-backdrop="static" data-keyboard="false" href="#att-modal">출근</a>
                    </div>
                    	필요시 사용--> 
                </div>
                   	

                <!--연간-->
                <div id="yearly">
                    <div id="yearly-top">
                        <div id="year">2021</div> 
                        <div id="select">
                            <select class="form-select" name="select-year" id="selectyear">
                                <option value="year">2021년</option>
                                <option value="year">2020년</option>
                                <option value="year">2019년</option>
                            </select>
                        </div>
                    </div>
                    <div id="yearly-content">
                        <table id="att-table">
                            <thead>
                                <tr>                                
                                    <th style="border-left: 1px solid lightgray;">&nbsp;</th>
                                    <th>1월</th>
                                    <th>2월</th>
                                    <th>3월</th>
                                    <th>4월</th>
                                    <th>5월</th>
                                    <th>6월</th>
                                    <th>7월</th>
                                    <th>8월</th>
                                    <th>9월</th>
                                    <th>10월</th>
                                    <th>11월</th>
                                    <th style="border-right: 1px solid lightgray;">12월</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>정상출근</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                </tr>
                                <tr>
                                    <td>지각</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                </tr>
                                <tr>
                                    <td>조퇴</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                </tr>
                                <tr>
                                    <td>결근</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!--근태조정신청내역-->
                <div id="enrstatement">
                    <div id="enr-top">
                        <div id="enr-front">검색기간</div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" id="total" name="condition" checked> 
                                <label class="form-check-label" style="margin-right: 5%;">
                                전체
                                </label>
                                <input class="form-check-input" type="radio" name="condition" value="1" style="margin-left: 5%;"> 
                                <label class="form-check-label" style="margin-left: 23%;">
                                기간
                                </label>
                            </div>
                            <div class="term" id="total-search">
                                <input type="date" id="start">&nbsp;
                                ~
                                &nbsp;<input type="date" id="end">
                            </div>
                            <script>
                                $('input[type=radio][name=condition]').on('click',function(){
                                    var chkValue = $('input[type=radio][name=condition]:checked').val();
            
                                    if(chkValue == '1'){
                                        $('.term').css('display', 'block');
                                        $('.total').css('display', 'none');
                                    } else{
                                        $('.term').css('display', 'none');
                                        $('.total').css('display', 'block');
                                    }
                                });
                            </script>
                    </div>
                    <div id="enr-content">
                        <div class="total"> <!--전체 버튼 클릭시-->
                            <table id="enr-table">
                                <thead>
                                    <tr>
                                        <th width="100">No.</th>
                                        <th width="250">작성일</th>
                                        <th width="580">내용</th>
                                        <th width="230">진행상황</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>314</td>
                                        <td>2021.07.01</td>
                                        <td>출근</td>
                                        <td>조정중</td>
                                    </tr>
                                    <tr>
                                        <td>313</td>
                                        <td>2021.06.15</td>
                                        <td>지각(2021/06/15/ 화 08:31:02)</td>
                                        <td>승인완료</td>
                                    </tr>
                                    <tr>
                                        <td>312</td>
                                        <td>2021.04.12</td>
                                        <td>퇴근</td>
                                        <td>조정중</td>
                                    </tr>
                                </tbody>
                            </table>
                            <!--페이지네이션 추가-->
                        </div>
                        <div class="term" style="display: none;"> <!--기간 버튼 클릭시-->
                            <table id="enr-table">
                                <thead>
                                    <tr>
                                        <th width="100">No.</th>
                                        <th width="250">작성일</th>
                                        <th width="580">내용</th>
                                        <th width="230">진행상황</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>314</td>
                                        <td>2021.07.01</td>
                                        <td>출근</td>
                                        <td>조정중</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!--내 휴가기록-->
                <div id="resthistory">
                    <div id="rest-inform">
                        <p id="myinform"><i class="fas fa-window-restore"></i> 내 연차 정보</p>
                        <br><br>
                        <table id="myinform-table">
                            <tr>
                                <th height="40">입사일</th>
                                <td width="150">2021-07-01</td>
                            </tr>
                            <tr>
                                <th>연차 지급일수</th>
                                <td>0일</td>
                                <th>연차 총 사용일</th>
                                <td width="150">0일</td>
                                <th>연차 잔여일수</th>
                                <td width="150">0일</td>
                            </tr>
                        </table>
                    </div>
                    <div id="rest-usedinform">
                        <p id="myused-name"><i class="fas fa-rainbow"></i> 연차 사용일수</p>
                        <br><br>
                        <table id="myused-table">
                            <tr>
                                <th width="300">휴가</th>
                                <th width="300">결근</th>
                                <th width="300">조퇴</th>
                                <th width="300">경조사</th>
                            </tr>
                            <tr>
                                <td>0일</td>
                                <td>0일</td>
                                <td>0일</td>
                                <td>0일</td>
                            </tr>
                        </table>
                    </div>
                    <div id="rest-usedhistory">
                        <p id="history-name"><i class="fas fa-history"></i> 연차 사용현황</p>
                        <br><br>
                        <table id="histroy-table">
                            <tr>
                                <th width="300">No</th>
                                <th width="300">신청일</th>
                                <th width="300">신청종류</th>
                                <th width="300">휴가일</th>
                                <th width="300">사용일수</th>
                                <th width="300">승인여부</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>2021-07-02</td>
                                <td>정기휴가</td>
                                <td>2021-07-05</td>
                                <td>1일</td>
                                <td>미승인</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>2021-07-02</td>
                                <td>정기휴가</td>
                                <td>2021-07-05</td>
                                <td>1일</td>
                                <td>미승인</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>2021-07-02</td>
                                <td>정기휴가</td>
                                <td>2021-07-05</td>
                                <td>1일</td>
                                <td>미승인</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>2021-07-02</td>
                                <td>정기휴가</td>
                                <td>2021-07-05</td>
                                <td>1일</td>
                                <td>미승인</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <!--페이지네이션-->
            </div>
        </div>
	</section>

    <!-- 근태조정신청 모달-->
    <div class="modal fade" id="att-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header" id="myModalheader">
                    <div class="modal-title" id="myModalLabel"><i class="fas fa-bars"></i> 근태 조정 신청</div>
                </div>
                <div class="modal-body">
                    <form>
                        <div id="att-form">
                            <table>
                                <tr>
                                    <th width="300">신청 날짜</th>
                                    <td><input type="text" class="form-control form-control-sm" value="2021년 7월 27일 (월요일)" disabled></td>
                                </tr>
                                <tr>
                                    <th>현재 상태</th>
                                    <td><input type="text" class="form-control form-control-sm" value="출근 (2021/07/27 월) 13:45" disabled></td>
                                </tr>
                                <tr>
                                    <th>사유</th>
                                    <td>
                                        <div class="form-group">
                                            <textarea class="form-control" id="comment"></textarea>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <a href="" style="color: rgb(26,188,156);">신청하기</a>&nbsp;
                    <a href="#" data-bs-dismiss="modal" aria-label="Close" style="color: lightslategray;">취소하기</a>
                </div>
            </div>
        </div>
    </div>
    <!--모달 기능-->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function(){
            $('.modal-dialog').draggable({
                "handle":".modal-header"
            });
        });
    </script>
</body>
</html>