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
	.info-content>div>pre{width: 170px; height: 198px; margin: 8px 0px 0px 0px; background-color: white; font-family:'Noto Sans KR', sans-serif;
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
	.deptstat-table::-webkit-scrollbar, #inner-table-area::-webkit-scrollbar {width: 10px; display: block;}
	.deptstat-table::-webkit-scrollbar-thumb, #inner-table-area::-webkit-scrollbar-thumb {border: 2px solid transparent; border-radius: 5px; background-clip: padding-box; background-color: rgb(41,128,185);}
	.deptstat-table::-webkit-scrollbar-track, #inner-table-area::-webkit-scrollbar-track {border-radius: 5px; box-shadow: inset 0px 0px 5px white; background-color: rgb(215, 238, 247);}
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
	.memstat-table>p{font-size: 15px; font-weight: bolder; margin-left: 12px; margin-bottom: 0px; position: absolute; z-index: 10;}
	.memstat-table{position: relative; overflow: hidden;}
	.memstat-table>div:nth-child(2){position: absolute; top: 30px; left:25px;}
	.memstat-table>div:nth-child(3){ margin-left:5px; font-size: 25px; font-weight: bolder; color: rgb(171,235,198); letter-spacing: 2px; position: absolute; top: 90px; left: 50%; transform: translateX(-50%); text-shadow: -1px 0 green, 0 1px green, 1px 0 green, 0 -1px green;}
	.memstat-table>div:nth-child(2):hover+div{display:none;}

	/* 중앙 오른쪽 하단 table 영역 css*/
	.table-chart table{width: 95%; height: 95%; margin: auto; transform: translateY(4px); text-align: center; font-size: 11px; line-height: 11px; border-color: #212529; border-collapse: collapse; border: 1px solid  #212529;}	
	.table-chart table>tr, .table-chart table th, .table-chart table td {border: 1px solid  #212529; border-collapse: collapse}
	.table-chart tbody>tr>td:first-child{border: none;}
	.total-Td{border-bottom: none; font-weight: bold;}
	.parentDeptItem>td:nth-child(2){color: rgb(52, 185, 230); font-weight: bold; border-bottom: none;}
	.deptItems>td:nth-child(2){border: none; border-left: 1px solid #212529;}
	#inner-table-area{overflow-y: scroll;}

	/* 중앙 왼쪽 하단 테이블 영역으로 입퇴사자 현황 표 css영역 */
	.some-chart, .dal-chart{position: relative;}
	.some-chart>p, .dal-chart>p{margin:0px; font-weight: bold; color:rgb(237,117,105); font-size: 15px; position: absolute; left: 50%; transform: translateX(-50%); }
	#join-resign-past-year, #attendance-past-year{ color: navy ; position: absolute; left: 22%; cursor: pointer;}
	#join-resign-next-year, #attendance-next-year{ color: navy; position: absolute; right: 22%; cursor: pointer;}
	#join-resign-past-year:hover, #join-resign-next-year:hover, #attendance-past-year:hover, #attendance-next-year:hover{transform: scale(1.2); color: orangered;}

	/* 메인 차트 css영역 */
	.dal-chart > canvas{margin-top: 25px ;}
	.dal-chart>p, #attendance-past-year, #attendance-next-year{ font-size: 17px;}
	.data-null-notification{width: 100%; text-align: center; border-top: 1px solid orangered ; border-bottom: 1px solid orangered ; position: absolute; top: 52%; transform: translateY(-50%); background-color: rgba(255,224,230, 0.5);}
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
		//--------------------------------------------------------------------------------------------------------------------------------	
		// 로딩되자마자 실행할것들
		$(function(){
			var adminNav = document.getElementById("admin-header");
			$("section").css("margin-top", (adminNav.style.display != 'none'?"115px":"70px"));
        	$(".notification-innerline").show();
			// 마지막 사이트 로그 가져오는 함수 호출 
        	ajaxSelectAdminLog(); // 사이트관리 기록 조회
        	ajaxSelectRightTopDept(); // progress bar
        	ajaxSelectRightBottomChart(); // 도넛차트
        	ajaxSelectTableAreaDate();// table형태의 영역데이터 조회
        	ajaxBringBarChartDate(); // 중앙 왼쪽하단의 입퇴사자 현황표 데이터 조회
        	ajaxBringLineChartDate();  // 중앙 상단의 근태 현황표 데이터 조회       	
        })
		document.getElementById("admin-header").style.display ="block"; 
        document.getElementById("admin-mode").style.color = "red";
		//--------------------------------------------------------------------------------------------------------------------------------        
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
		//--------------------------------------------------------------------------------------------------------------------------------		        
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
		//--------------------------------------------------------------------------------------------------------------------------------       	
       	// adminlog 모달닫았을때 
        $(document).ready(function(){   
	        $("#sitelog-enroll-modal").on('hidden.bs.modal', function () {
 				$("#developerName").val("");
 				$("#dev-context").val("");
	       	})
        })
		//--------------------------------------------------------------------------------------------------------------------------------        
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
		//--------------------------------------------------------------------------------------------------------------------------------
       	// 오른쪽 하단 차트 
		function ajaxSelectRightBottomChart(){
            $.ajax({
		 		url:"selectRightBottomChart.ad",
		 		success:function(dept){
		 				$("#total-mem-count").html(dept[0].depClass + "명");
		 				
		 				const array = dept;
		 				// data
						let depNo = [];
		 				array.forEach((item) => {depNo.push(item.depNo);});
		 			
		 				// labels
						let depName = [];
		 				array.forEach((item) => {depName.push(item.depName);});
							
		 				//chart js는!! data에 담을때!!! 반복문으로 var arr=[] 안에 for in문으로다가 하나하나 넣은 값을 뽑을수가 있다. 
						const data = {
						  labels: depName,
						  datasets: [{
						    data: depNo,
						    backgroundColor: ['rgb(251,175,138)', 'rgb(190,255,165)', 'rgb(255,255,141)',
						                      'rgb(227,255,159)', 'rgb(162,201,252)', 'rgb(240,140,224)'],
						    hoverOffset: 4
						  }]
						};

						var ctx = document.getElementById('totalMemCountChart').getContext('2d');
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
		//--------------------------------------------------------------------------------------------------------------------------------
		// 중앙 오른쪽 하단 테이블 표 데이터 뿌려주는 함수 
		function ajaxSelectTableAreaDate(){
            $.ajax({
		 		url:"selectTableAreaDate.ad",
		 		success:function(dept){
		 			//console.log(dept);
		 			$("#headOfficer").html((dept[0].parDepclass != 0 ? dept[0].parDepclass : ""));
		 			$("#sumHeadOfficer").html((dept[0].parDepclass != 0 ? dept[0].parDepclass : ""));		 			
		 			
		 			var value;
		 			var totalEmployee = 0;
		 			var totalOfficer = 0;
		 			for(var i in dept){
		 				if(dept[i].parentDep == null){
		 					value += '';
		 				}else{
			 				if(dept[i].depName == dept[i].parentDep){
				 				value += '<tr class="parentDeptItem">'
			 						   + '<td width="30"></td>'
			 						   + '<td colspan="3">' + dept[i].depName + '</td>'
			 						   + '<td>' + (dept[i].parDepclass != 0 ? dept[i].parDepclass : "") + '</td>'
			 						   + '<td>' + (dept[i].depClass != 0 ? dept[i].depClass : "") + '</td>'
			 						   + '<td>' + (dept[i].parDepclass + dept[i].depClass) +'</td></tr>';
			 				}else{
			 					value += '<tr class="deptItems">'
			 					       + '<td></td><td width="40"></td>'
			 					       + '<td colspan="2">' + dept[i].depName + '</td>'
			 						   + '<td>' + (dept[i].parDepclass != 0 ? dept[i].parDepclass : "") + '</td>'
			 						   + '<td>' + (dept[i].depClass != 0 ? dept[i].depClass : "") + '</td>'
			 						   + '<td>' + (dept[i].parDepclass + dept[i].depClass) +'</td></tr>';
			 				}
		 				}
		 				totalEmployee += dept[i].depClass;
	 					totalOfficer += dept[i].parDepclass;
		 			}		 			
		 			$("#sum-executive").html(totalOfficer);
		 			$("#sum-employee").html(totalEmployee);
		 			$("#sum-total-mem").html(totalOfficer + totalEmployee);
		 			$("#tableChart").html(value);
		 		},error:function(){
		 			console.log("ajax통신 실패");
		 		}				
		 	});
		}
		
		//---------------------------------------------------------	
		// 입퇴사자 현황을 가져오는 함수로 가져와야할게!! 
		// 첫번째로 ! 매개변수로 현재 년도를 넘기고 ! 
		// 월을 기준으로 입사한 사원수와 퇴사한 사원 수를 담아와야한다. 
		// has many 구조를 2번 타자! vo 객체를 3개만들면 된다. 

		// 또한 고려해줘야할게 ! 해당 표에 있어서 ! 이전 년도 다음년도 값 넘길때 ! 먼저 조건 검사를 통해서 아무값도 안담겨있으면 
		// alert띄우고 막아줘야한다. 

		function ajaxBringBarChartDate(){
					
			//---------------------------------------------여기가 바로 API부분 -------------------------------------------------
			// 우선 컨텍스트를 가져오고 
			var ctx = document.getElementById("join-resign-chart").getContext('2d');
			// Chart를 생성하면서, 
			// ctx(context라는 의미)를 첫번째 argument로 넘겨주고, 
			// 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨준다. 
			var JRChart = new Chart(ctx, {
			    type: 'bar',
			    data: {
			        labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
			        datasets: [
						{label: '입사자',
						backgroundColor: "rgb(214,236,250)",
						borderColor: 'rgb(173,200,210)',
			            borderWidth: 1,
			            data: [12, 19, 3, 5, 2, 3]},
						{label: '퇴사자',
						backgroundColor: "rgb(255,224,230)",
						borderColor: 'rgb(196,173,180)',
			            borderWidth: 1,
			            data: [12, 19, 3, 5, 2, 3]}						
					]
			    },
			    options: {
			        maintainAspectRatio: false, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
			        scales: {
			            yAxes: [{
			                ticks: {
			                    beginAtZero:true
			                }
			            }]
			        },
					plugins: {
						legend: {
							display: false,
						}
					}
			    }
			});

			//현재 날짜를 바꿔줘야하고 ! 
			// onclick으로 넘겨주는 값도 다시 설정해줘야한다. 
			//$("#join-resign-past-year").
			$("#join-resign-present-year").html("2021");
			//$("#join-resign-next-year").

			//----------------------------------------------------------------------------------------------------------
		}

//------------------------------------------------메인 차트쪽이다 !!!! -------------------------------------------------
		// 얘는 부서별로 하면 스케일이 너무 커지고 (시간도 없고 셈플데이터도 충분치 않다.)
		// 전사원을 기준으로 해당 월의 total 일한 시간을 평균까지만 내자 그래도 시간이 부족할듯하다. 
		// 후에 시간내서 부서별, 그리고 가장 일을 많이한 부서 적게한 부서까지도 뽑아내는 것을 만들자.  
		function ajaxBringLineChartDate(){
			var ctx = document.getElementById("attendance-chart").getContext('2d');
			// Chart를 생성하면서, 
			// ctx(context라는 의미)를 첫번째 argument로 넘겨주고, 
			// 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨준다. 
			var ATChart = new Chart(ctx, {
			    type: 'line',
			    data: {
			        labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
			        datasets: [
						{label: '입사자',
						backgroundColor: "rgb(255,0,0)",
						borderColor: 'rgb(20,70,104)',
			            borderWidth: 1,
			            data: [8.5, 9.7, 3, 5, 2, 3]}
					]
			    },
			    options: {
			        maintainAspectRatio: true, 
			        scales: {
			            yAxes: [{
			                ticks: {
			                    beginAtZero:true
			                }
			            }]
			        },
					plugins: {
						legend: {
							display: false,
							//labels: {color: 'rgb(255, 99, 132)'}
						}
					}
			    }
			});

			//---------------------------------------메인차트 api 끝------------------------------------------------------------

		}
//------------------------------------------------메인 차트쪽 끝 -------------------------------------------------

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
					<div id="attendance-past-year" onclick="">◀</div>
					<p>※ <span id="attendance-present-year">2021</span>년도 Working Hour Average Chart</p>
					<div id="attendance-next-year" onclick="">▶</div>
					<div class="data-null-notification" style="display: none;">해당 년도에 조회된 데이터가 없습니다.</div>
					<canvas id="attendance-chart" style="width: 100%; height: 270px;"></canvas>					
				</div>

				<div class="some-chart">
					<div id="join-resign-past-year" onclick="">◀</div>
					<p>※ <span id="join-resign-present-year">2021</span>년도 입퇴사자 현황 표</p>
					<div id="join-resign-next-year" onclick="">▶</div>
					<div class="data-null-notification" style="display: none;">해당 년도에 조회된 데이터가 없습니다.</div>
					<canvas id="join-resign-chart"></canvas>
				</div>

				<div class="table-chart">
					<p>※ 조직 인원 현황 표 </p>
					<div id="inner-table-area">
						<table>
							<thead style="background: rgb(191, 230, 243);">
								<th colspan="4" width="170">구분</th>
								<th width="35">임원</th>
								<th width="35">직원</th>
								<th width="35">계</th>
							</thead>
							<tr>
								<td class="total-Td" colspan="4">전체</td>
								<td id="headOfficer"></td>	
								<td></td>	
								<td id="sumHeadOfficer"></td>	
							</tr>
							<!-- 반복문 돌려서 생성은 일단 tbody부터 생성하면서 들어간다.-->
							<tbody id="tableChart">
							</tbody>
							<tfoot style="background: rgb(191, 230, 243);"> 
								<th colspan="4">소계</th>
								<th id="sum-executive"></th>
								<th id="sum-employee"></th>
								<th id="sum-total-mem"></th>
							</tfoot>
						</table>
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
					<div><canvas id="totalMemCountChart" style="width:160px;max-width:180px;"></canvas></div>
					<div id="total-mem-count" class="w3-animate-opacity"></div>
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
</body>
</html>