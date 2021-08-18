<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- @author Jaewon.s -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="Jaewon.s">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<style>
	.outer{height: 605px; padding: 0px 8px; display: flex; justify-content: space-between; background-color: #E0E0E0;}
	.outer>div{margin-top: 5px; height: 590px;}
	/* 왼쪽 박스 영역 */
	.left-section{width: 200px; border: 2px solid #BEBEBE; background-color: white;}
	.admion-Info, .btn-area{display: flex; justify-content: space-around;}
	.admion-Info{padding: 20px 2px; margin-top: 10px;}
	.admion-Info img{width: 86px;}	
	.admion-Info>div:nth-child(2){margin-right: 5px;}
	.admion-Info p{font-size: 17px; font-weight: bold; text-align: center; vertical-align: middle; margin: 0px; padding: 5px 0px ;}
	.admion-Info button{width: 64px; height: 22px; font-size: 12px; line-height: 16px; border: none; border-radius: 3px; background-color: rgb(224,224,224);}	
	.btn-area>button{width: 166px; height: 38px; color: white; font-size: 15px; border: none; border-radius: 5px; margin-top: 3px; margin-bottom: 15px; background-color: rgb(94,94,94);}
	.info-box>div, .info-content>div {width: 180px; margin: auto; background-color: rgb(20,70,104); }
	.info-box>div {height: 63px; margin-bottom: 10px;}
	.info-content>div{height: 238px; display: flex; align-items: center; flex-direction: column;}
	.info-box>div>p, .info-content>div>p {color: white; font-size: 15px; text-align: center; line-height: 20px; margin: 0px; padding-top: 6px; padding-bottom: 3px; }
	.info-box>div>div{width: 161px; height: 25px; text-align: center; margin: auto; padding-top: 2px; background-color: white;}
	.info-content>div>pre{width: 170px; height: 198px; margin: 8px 0px 0px 0px; background-color: white;
		letter-spacing: -0.5px;
		white-space:pre-wrap; 
		word-break:keep-all;
		text-overflow:clip;
	}
	#modification-content::-webkit-scrollbar {width: 10px;}
	#modification-content::-webkit-scrollbar-thumb {border: 2px solid transparent; border-radius: 5px; background-clip: padding-box; background-color: rgb(20,70,104);}
	#modification-content::-webkit-scrollbar-track {border-radius: 5px; box-shadow: inset 0px 0px 5px white; background-color: lightgrey;}
	/* ----------------------- 사이트 관리 기록 모달 css 시작 ---------------------------------- */	
	#sitelog-enroll-modal .modal-body>div{position: absolute; top: 15px; left: 50%; transform: translateX(-49%);}
	#sitelog-enroll-modal .modal-body input{width: 145px; font-size: 14px; height: 22px; margin-bottom: 15px;}
	#sitelog-enroll-modal .modal-body p{font-weight: bold; margin: 0px; padding-left: 5px;}
	#sitelog-enroll-modal .modal-footer button{width: 50%; height: 100%; margin: 0px; padding: 0px; border: none; background-color: white}
	#sitelog-enroll-modal .modal-footer button:nth-child(1){color: red;}
	#sitelog-enroll-modal .modal-footer button:nth-child(2){color: rgb(41,128,185);}
	#sitelog-enroll-modal .modal-footer button:hover{font-weight: bold;background-color: rgb(224,224,224);}
	#sitelog-enroll-modal .modal-footer button:focus{outline:none;}
	.sitelog-modal{transform: translate(-220px,200px);}
	#dev-context {width: 145px; height: 150px; font-size: 14px;
    	-ms-overflow-style: none; /* IE and Edge */
    	scrollbar-width: none; /* Firefox */
	}
	#dev-context::-webkit-scrollbar {
		display: none; /* Chrome, Safari, Opera*/
	}
	/* ----------------------- 사이트 관리 기록 모달css 끝 ---------------------------------- */
	/* 가운데 박스 영역 */
	.center-section{ width: 730px; display: flex; flex-wrap: wrap; justify-content: space-between;}
	.dal-chart, .some-chart, .table-chart>div, .deptstat-table, .memstat-table{background-color: white;}
	.dal-chart{width: 730px; height: 300px;}	
	.some-chart, .table-chart{height: 280px; margin-top: 10px;}
	.some-chart{width: 420px;}
	.table-chart{width: 300px;}
	.table-chart>p{height: 25px; color: tomato; font-weight: bold; margin: 0px;}
	.table-chart>div{width: 100% ;height: 255px;}

	/* 오른쪽 박스 영역 */
	.right-section{width: 205px;}
	.memstat-table{height: 190px;margin-top: 8px; }
	.deptstat-table{height: 392px; overflow-y: auto;}
	.deptstat-table::-webkit-scrollbar, #recycle-bin-page::-webkit-scrollbar {width: 10px; display: block;}
	.deptstat-table::-webkit-scrollbar-thumb {border: 2px solid transparent; border-radius: 5px; background-clip: padding-box; background-color: rgb(41,128,185);}
	.deptstat-table::-webkit-scrollbar-track {border-radius: 5px; box-shadow: inset 0px 0px 5px white; background-color: rgb(215, 238, 247);}
	/*오른쪽 상단 박스 영역*/ 
	#ad-progress-area .progress{width: 85%; margin:auto; margin-bottom:1.8px;}
	#ad-progress-area .progress-bar{border-radius: 0 3px 3px 0;}
	#ad-progress-area .progress:nth-of-type(1) .progress-bar{background-color : rgb(255,134,130);}
	#ad-progress-area .progress:nth-of-type(2) .progress-bar{background-color : rgb(107,145,216);}
	#ad-progress-area .progress:nth-of-type(3) .progress-bar{background-color : rgb(238,204,123);}
	#ad-progress-area .progress:nth-of-type(4) .progress-bar{background-color : rgb(73,202,159);}
	#ad-progress-area .progress:nth-of-type(5) .progress-bar{background-color : rgb(255,134,130);}
	#ad-progress-area .progress:nth-of-type(6) .progress-bar{background-color : rgb(107,145,216);}
	#ad-progress-area .progress:nth-of-type(7) .progress-bar{background-color : rgb(238,204,123);}
	#ad-progress-area .progress:nth-of-type(8) .progress-bar{background-color : rgb(73,202,159);}
	#ad-progress-area .progress:nth-of-type(9) .progress-bar{background-color : rgb(255,134,130);}
	#ad-progress-area .progress:nth-of-type(10) .progress-bar{background-color : rgb(107,145,216);}
	#ad-progress-area .progress:nth-of-type(11) .progress-bar{background-color : rgb(238,204,123);}
	#ad-progress-area .progress:nth-of-type(12) .progress-bar{background-color : rgb(73,202,159);}
	#ad-progress-area span{margin-left : 14px; font-size:13px; color:rgb(75, 72, 72);}
	#ad-progress-area p{margin-bottom: 2px; margin-left: 12px; font-weight: bold; color:rgb(237,117,105); font-size: 15px;}
	#ad-progress-area{line-height: 18px;}
	#ad-progress-area span:nth-of-type(2), #ad-progress-area span:nth-of-type(4n+2) {color: black; font-weight: bolder;}
	/*오른쪽 하단 박스영역*/
	.memstat-table>p{
		margin-bottom: 0px;
		font-size: 15px; 
		font-weight: bolder;
		margin-left: 12px;
		position: absolute;
		z-index: 100;
	}

	.memstat-table{
		position: relative; 
		overflow: hidden;
	}
	 
	.memstat-table>div:nth-child(2){
		position: absolute;
		top: 20px;
		left: 50%;
		transform: translateX(-50%);
		z-index: 50;
		font-size: 25px;
		font-weight: bolder;
		color: rgb(171,235,198);
		letter-spacing: 2px;
		text-shadow: -1px 0 green, 0 1px green, 1px 0 green, 0 -1px green;
	}
	.memstat-table>div:nth-child(3){
		position: absolute;
		top: 12px;
	}
	.memstat-table>div:nth-child(3):hover{
		z-index: 75;;
	}

	/* ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ 위에 레이아웃 요소 싸그리 끝낸것!! ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑*/
</style>

<body>
	<jsp:include page="header.jsp"/>
	
	<script>
		/*
		$(function() {
			timer = setInterval( function () {
				$.ajax ({
					"url" : "",  
					cache : false,
					success : function (html) {
					}
				});
			}, 60000); //1분마다 갱신되게 수정 
		});
		
		$(document).ready(function() {

		setInterval(doTest, 5000);
		});
		
		function doTest(){
		console.log("tttt");
		}
		*/
	
		$(function(){
			var adminNav = document.getElementById("admin-header");
			$("section").css("margin-top", (adminNav.style.display != 'none'?"115px":"70px"));
        	$(".notification-innerline").show();
			// 마지막 사이트 로그 가져오는 함수 호출 
        	ajaxSelectAdminLog();
        	ajaxSelectRightTopDept();
        	ajaxSelectRightBottomChart();
		})
		document.getElementById("admin-header").style.display ="block"; 
        document.getElementById("admin-mode").style.color = "red";
        
        // adminlog 가져오는 함수 
        function ajaxSelectAdminLog(){
            $.ajax({
		 		url:"selectDevLog.ad",
		 		success:function(adminLog){
		 			$("#last-developer-name").html(adminLog.developerName);
		 			$("#last-developer-date").html(adminLog.enrollDate);
		 			$("#modification-content").html(adminLog.modificationContent);
		 		},error:function(){
		 			console.log("ajax통신 실패");
		 		}				
		 	});
        }
        
        // adminlog 삽입하는 함수 
       	function insertSimpleDevLog(){
       		if($("#developerName").val().trim() == ""){
       			alert("성함을 입력해주세요");
       			$("#developerName").focus();
       		}else if($("#dev-context").val().trim() == ""){
       			alert("개발 내역을 입력해주세요.");
       			$("#dev-context").focus();
       		}else{
                $.ajax({
    		 		url:"insertDevLog.ad",
    				data:{developerName : $("#developerName").val()
          		 		, modificationContent : $("#dev-context").val()
            		},
    		 		success:function(result){
    		 			if(result>0){
    		 				alert("사이트 관리 기록작성에 성공하였습니다.\n 확인해주세요");
    		 				AjaxSelectAdminLog();
    		 			}else{
    		 				alert("사이트 관리 기록작성에 실패하였습니다.\n 개발자에게 문의해주세요.")
    		 			}
			 			$("#sitelog-enroll-modal").modal('hide');
    		 		},error:function(){
    		 			console.log("ajax통신 실패");
    		 		}				
    		 	});
       		}
       	}
       	
       	// adminlog 모달닫았을때 
        $(document).ready(function(){   
	        $("#sitelog-enroll-modal").on('hidden.bs.modal', function () {
 				$("#developerName").val("");
 				$("#dev-context").val("");
	       	})
        })
        
       // 부서별 인원현황 가져오는 함수  
       function ajaxSelectRightTopDept(){
            $.ajax({
		 		url:"selectRightTopDept.ad",
		 		success:function(dept){
		 			//console.log(dept);
		 			
		 			var value;
		 			value = '<p>※ 부서별 인원현황 </p><span style="font-size:8px; color: blue;">※ 가장 인원이 많은 부서 기준</span><br>';
		 			for(var i in dept){		 				
		 				value += '<span>' + dept[i].depName + '</span>'
		 				       + '<div class="progress" style="height:9px;">'
		 				       + '<div class="progress-bar" style="width:'
		 				       + dept[i].depNo
		 				       + '%"></div></div>';
		 			}
		 			$("#ad-progress-area").html(value);
		 		},error:function(){
		 			console.log("ajax통신 실패");
		 		}				
		 	});
        }

		function ajaxSelectRightBottomChart(){
            $.ajax({
		 		url:"selectRightBottomChart.ad",
		 		success:function(dept){
		 				$("#total-mem-count").html(dept[0].depClass + "명");
		 				
		 				//chart js는!! data에 담을때!!! 반복문으로 var arr=[] 안에 for in문으로다가 하나하나 넣은 값을 뽑을수가 있다. 
						var ctx = document.getElementById('myChart2').getContext('2d');
						const data = {
						  labels: [
						    'Red',
						    'Blue',
						    'Yellow'
						  ],
						  datasets: [{
						    data: [300, 50, 100],
						    backgroundColor: [
						      'rgb(255, 99, 132)',
						      'rgb(54, 162, 235)',
						      'rgb(255, 205, 86)'
						    ],
						    hoverOffset: 4
						  }]
						};
								 				
						var myChart = new Chart(ctx, {
							  type: 'doughnut',
							  data: data,
							  options: {
								  plugins: {
							            legend: {
							                display: false,
							                labels: {
							                    color: 'rgb(255, 99, 132)'
							                }
							            }
							        }
							}
						})
		 		},error:function(){
		 			console.log("ajax통신 실패");
		 		}				
		 	});

		}



	</script>
	
	<section>
		<div class="outer" style="width:1170px; margin-top:10px">
			<%-- -------------------------------------------------------  왼쪽 사이트관리대장 영역 시작 --------------------------------------------------------- --%>
			<%-- 왼쪽 박스 영역 --%>
			<div class="left-section">
				<div class="admion-Info">
					<div>
						<img src="resources/images/adminLogo.png">
					</div>
					<div>
						<p> 관리자<br>개발팀 </p>
						<button type="button" onclick="location.href='logout.me'">로그아웃</button>
					</div>
				</div>
				<div class="btn-area">
					<button type="button" onclick=""  data-toggle="modal" data-target="#sitelog-enroll-modal">사이트관리 기록 작성</button>
				</div>

				<!--사이트 관리 대장  값 뿌려줄 영역 시작-->
				<div class="info-box">
					<div>
						<p>마지막 수정 개발자</p>
						<div id="last-developer-name">
							신재원
						</div>
					</div>
				</div>
				<div class="info-box">
					<div>
						<p>최근 업데이트</p>
						<div id="last-developer-date">
							2021-08-20
						</div>
					</div>
				</div>
				<div class="info-content">
					<div>
						<p>수정 내역</p>
						<pre id="modification-content">입력 모달에 수정내역 영역은 스크롤이 보이지 않지만 작동합니다! </pre>
					</div>
				</div>
				<!--사이트 관리 대장  값 뿌려줄 영역 끝-->
			</div>
			<%-- -------------------------------------------------------  왼쪽 사이트관리대장 영역 끝 --------------------------------------------------------- --%>
			<%-- -------------------------------------------------------  가운데 차트영역 시작 --------------------------------------------------------- --%>
			<%-- 가운데 박스 영역 --%>
			<div class="center-section">
				<div class="dal-chart" >
					<!-- <canvas id="myChart" width="400" height="270"></canvas> -->
				</div>

				<div class="some-chart">
				</div>

				<div class="table-chart">
					<p>회사 부서서 인원 관련 표 (동적 생성)</p>
					<div>
					</div>
				</div>
			</div>
			<%-- -------------------------------------------------------  가운데 차트영역 끝 --------------------------------------------------------- --%>
			<%-- -------------------------------------------------------  오른쪽 차트영역 시작 --------------------------------------------------------- --%>
			<%-- 오른쪽 박스 영역 --%>
			<div class="right-section">
				<div class="deptstat-table">
					<div id="ad-progress-area">			
					</div>
				</div>

				<!--오른 쪽 하단 차트 -->
				<div class="memstat-table">
					<p>※ 전체 인원수 </p>
					<div id="total-mem-count"> 49명</div>
					<div><canvas id="myChart2" style="width:100%;max-width:160px"></canvas></div>
				</div>
			</div>
			<%-- -------------------------------------------------------  오른쪽 차트영역 끝 --------------------------------------------------------- --%>
		</div>
	</section>

	<%-- -------------------------------------------------------  사이트 관리 기록 모달영역 사작  --------------------------------------------------------- --%>
	<!-- The Modal -->
	<div class="modal fade" id="sitelog-enroll-modal">
		<div class=" modal-dialog modal-sm">
			<div class="sitelog-modal modal-content" style="width: 190px; height: 318px;">
						
				<!-- Modal body -->
				<div class="modal-body" style="padding: 5px;">
					<div>
						<p>마지막 수정 개발자</p>
							<input type="text" id="developerName" placeholder="성함을 입력해주세요">
						<p>간단한 수정내역</p>
							<textarea id="dev-context" style="resize: none;" placeholder="수정내역을                작성해주세요"></textarea>
					</div>				   
				</div>
				<!-- Modal footer -->
				<div class="modal-footer" style="width:100%; height: 49px; padding: 0px; margin: 0px;">
					<button type="button" data-dismiss="modal" >취소</button>
					<button type="button" onclick="insertSimpleDevLog();">기록</button>
				</div>				
			</div>
		</div>
	</div>
	<%-- -------------------------------------------------------  사이트 관리 기록 모달영역 끝  --------------------------------------------------------- --%>
<!-- 
<script>
var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        datasets: [{
            label: '# of Votes',
            data: [0, 19, 3, 5, 2, 3],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});
</script>
 -->
 
<!-- <script>
const labels = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
];
const data = {
  labels: labels
  datasets: [{
    label: 'My First dataset',
    backgroundColor: 'rgb(255, 99, 132)',
    borderColor: 'rgb(255, 99, 132)',
    data: [0, 10, 5, 2, 20, 30, 45],
  }]
};	  
	  
const config = {
		  type: 'bar',
		  data,
		  options: {}
		};	  
	  
  var myChart = new Chart(
    document.getElementById('myChart'),
    config
  );

</script> -->

</body>
</html>