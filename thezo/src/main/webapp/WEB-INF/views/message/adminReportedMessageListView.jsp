<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- @author Jaewon.s -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="Jaewon.s">
<title>TheZo 쪽지 신고처리</title>
<style>
	.outer{height: 615px; padding-top: 35px; display: flex; justify-content: space-between;}
	.left-section{width: 175px;}
	.main-section{width: 975px;}
	.main-section>h2{margin-bottom: 17px;}
	#unhandeled-count{color: orange; font-size: 18px;}
	#unhandeled-msgarea>p, #handeled-msgarea>p{margin-bottom: 0px;}
	#unhandeled-msgarea>table, #handeled-msgarea>table{width: 950px; text-align: center; margin-bottom: 10px; border-top: 10px solid rgb(44, 62, 80); border-bottom: 1px solid lightgray;}
	#unhandeled-msgarea thead, #handeled-msgarea thead{height: 36px; line-height: 22px; background-color: rgb(234,234,234);}
	#unhandeled-msgarea tbody tr, #handeled-msgarea tbody tr {height: 35px; font-size: 14px; border-bottom: 0.5px solid rgb(204,204,204);}
	#unhandeled-msgarea tbody tr:not(:last-child):hover{cursor: pointer; font-weight: bold; background-color: rgba(254,246,234,0.6);}	
	#handeled-msgarea tbody tr:hover{cursor: pointer; font-weight: bold; background-color: rgba(254,246,234,0.6);}	
	#unhandeled-msgarea thead>tr>th, #handeled-msgarea thead>tr>th{font-size: 14px; border-bottom: 1px solid gray;}
	#unhandeled-msgarea thead>tr>th{width: 16.6%;}
	#handeled-msgarea thead>tr>th{width: 14.28%;}
	#unhandeled-msgarea tbody>tr>td, #handeled-msgarea tbody>tr>td{padding: 0px; border: none; vertical-align: middle;}
	.report-btn{width: 100px; height: 28px; color: white; font-size: 12px; border: none; border-radius: 3px; margin-left: 5px; background-color: rgb(155,89,182);}  

	/* 내가 만든 paging-area 재원 ~ */
	.paging-area{text-align: center; margin: 10px 0px;} 
	.paging-area button{width:28px; height:32px; color: rgb(127,127,127); font-size:16px; font-weight: bold; border: none; border-radius: 5px; background-color: rgb(244,244,244);}       
    #dis-btn{color:white; background-color: rgb(52,152,219);}

	/* 모달 영역 */
	.text-red{color: red;}
	.text-blue{color: blue;}
	.text-purple{color: purple; font-weight: 600;}
	#report-handel-modal .modal-content, #report-detail-modal .modal-content{width: 650px; height: 500px;transform: translate(-12%, 25%); background-color :rgb(250,250,250);}
	#report-handel-modal .modal-header, #report-detail-modal .modal-header{height: 120px;}
	#report-handel-modal .modal-body, #report-detail-modal .modal-body{padding: 10px 16px; border-top: 1px solid rgb(193,193,193);}
	#report-handel-modal table, #report-detail-modal table{width: 450px;}
	.view-report-content-area{width: 640px; height: 225px; display: flex; justify-content: space-around; transform: translateX(-12px);}
	.left-content , .right-content{width: 305px;}	
	.left-content>p, .right-content>p, .modal-footer>p{font-size: 18px; font-weight: bold ; margin: 0px; padding-left: 10px;}
	.left-content>pre{width: 100%; height: 200px; color: rgb(106,102,97); padding: 8px ; border-radius: 5px ; background-color: rgb(190,190,190) ; letter-spacing: -0.5px; white-space:pre-wrap;  word-break:keep-all; text-overflow:clip;}
	.right-content>textarea{width: 100%; height: 200px; padding: 8px ; border-left: 1px solid rgb(133, 133, 133); border-radius: 5px; resize: none;}
	#report-handel-modal .modal-footer, #report-detail-modal .modal-footer{ padding-top: 0px; padding-bottom: 4px ; border-top: 1px solid rgb(193,193,193); display: flex; flex-direction: column; align-items:flex-start; }
	.modal-footer>p, .modal-footer>div{margin: 4px 0px;}
	.modal-footer>div>span{width: 75px; color:red; font-weight: bold; margin: 0px 5px;}
	.modal-footer>div>input, .modal-footer>div>select{width: 150px; height: 36px; margin-right: 25px; transform: translateX(1px);}
	.modal-footer>div>button{width: 165px; height: 40px; color: white; font-size: 17px; font-weight: bold; border: none; border-radius: 3px; background-color: rgb(190,190,190);}
	.modal-footer>div>button:hover{border: 1px solid orange; color: orange;}
	.modal-footer>div>.handel-btn{width: 185px; margin-right: 10px; background-color: rgb(155,89,182);}
	#report-detail-modal .modal-footer>div>button{width: 330px; margin-left: 30px;}
	*:disabled{color: black;}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<script>
		$(function(){
			var adminNav = document.getElementById("admin-header");
			$("section").css("margin-top", (adminNav.style.display != 'none'?"115px":"70px"));
			document.getElementById("admin-header").style.display ="block"; 
	        document.getElementById("admin-mode").style.color = "red";
	        selectUnhandledReportList();
	        selectHandledReportList();
		})
        
		// 일부러 ajax로 만든다. forward 처리할때 한번 읽히는것도 좋지만 한번 함수로 만들어놓으면 매번 사용이 가능하니까 AJAX로 진행한다. 
		// 단 2개의 ! 함수로 만든다. 그래야 복잡도가 높아지지 않는다. 페이징 처리를 위해서라도 차라리 2개로 만드는게 더 효율적이다 
		// Ajax로 데이터를 가져오는데 따로따로 가져올 필요없이 싸그리 가져와서 조건문을 돌려도된다. (여기서는 꼭 한방에 해결해야하는게 필요한게)
		// 곧바로 명시적으로 미해결신고에서 처리하면 해결 신고쪽으로 update되는것이 보여야하기 때문이다! 	 	
		function selectUnhandledReportList(page){
		 	$.ajax({
		 		url: "unhandledReport.admsg",
		 		data:{currentPage: page
		 		},
		 		success:function(list){
		 			console.log(list);
		 			mainValue= "";
		 			pagingValue = "";
		 			if(list.unhandleList.length != 0){// 조회결과가 있을때
		 				if(list.unhandleList.length<4 && page == null){//5보다 작으니 paging자체가 생기지 않느다.
		 					for(var i in list.unhandleList){
			 					mainValue += '<tr onclick="opendetailHandledReportModal(' 
			 							   + list.unhandleList[i].msgReportNo + ');"><td>'
			 					           + list.unhandleList[i].msgReportNo + '</td><td>'
			 					           + list.unhandleList[i].reportType + '</td><td>'
		 								   + list.unhandleList[i].senderNameAndRank + '</td><td>'
		 								   + list.unhandleList[i].reportDate + '</td><td>'
		 								   + list.unhandleList[i].recipientNameAndRank + '</td>'
		 								   + '<td onclick="event.cancelBubble=true">'
		 								   + '<button class="report-btn" type="button" onclick="openHandleReportModal('
		 								   + list.unhandleList[i].msgReportNo		   
		 								   + ');">신고 처리하기</button>'
		 								   + '</td></tr>';
		 					};
		 					for(var i=0; i<(4-list.unhandleList.length); i++){
		 						mainValue += '<tr style="height:35px;"><td colspan="6"></td></tr>';
		 					};
		 					
 						  	pagingValue += '<button disabled>&lt;</button>&nbsp;&nbsp;'
				              			 + '<button disabled>1</button>&nbsp;&nbsp;'
				              			 + '<button disabled>&gt;</button>';
							// 여기까지가 4개 미만 일때 이다.	              			 
		 				}else{//전체 길이가 4보다 크면 !!! paging생기고 동적으로 돌려줘야해
		 					
		 					for(var i in list.unhandleList){ // 4개 미만으로 조회한것 반복문으로 생성
			 					mainValue += '<tr onclick="opendetailHandledReportModal(' 
		 							   + list.unhandleList[i].msgReportNo + ');"><td>'
		 					           + list.unhandleList[i].msgReportNo + '</td><td>'
		 					           + list.unhandleList[i].reportType + '</td><td>'
	 								   + list.unhandleList[i].senderNameAndRank + '</td><td>'
	 								   + list.unhandleList[i].reportDate + '</td><td>'
	 								   + list.unhandleList[i].recipientNameAndRank + '</td>'
	 								   + '<td onclick="event.cancelBubble=true">'
	 								   + '<button class="report-btn" type="button" onclick="openHandleReportModal('
	 								   + list.unhandleList[i].msgReportNo		   
	 								   + ');">신고 처리하기</button>'
	 								   + '</td></tr>';
		 					};
		 					for(var i=0; i<(4-list.unhandleList.length); i++){// 4개 행 채우기 위한 용도
		 						mainValue += '<tr style="height:35px;"><td colspan="6"></td></tr>';
		 					};
		 					
		 					// 페이징 처리
		 					if(list.pi.maxPage == 1){
	 						  	pagingValue += '<button disabled>&lt;</button>&nbsp;&nbsp;'
			              			 + '<button disabled>1</button>&nbsp;&nbsp;'
			              			 + '<button disabled>&gt;</button>';
							}else if(list.pi.currentPage == 1){// 2페이지 이상있고 첫번째 페이지라면
	 						  	// ★ 여기가 정상적으로 작동하는 구간이다. 
								pagingValue += '<button disabled>&lt;</button>&nbsp;&nbsp;';
							  	for(var i=1; i<=list.pi.maxPage; i++){
							  		if(i == list.pi.currentPage){// 요청한 페이지랑 현재페이지 동일할경우
							  			pagingValue += '<button id="dis-btn" disabled>'
							  			             + list.pi.currentPage  + '</button>&nbsp;&nbsp;';
							  		}else{// 요청한 페이지랑 다른 경우 
							  			pagingValue += '<button type="button" onclick="selectUnhandledReportList('
									  				 + i + ');">' + i + '</button>&nbsp;&nbsp;';
							  		}	
								};	 						  
						  		pagingValue += '<button onclick="selectUnhandledReportList('
						  			         + (list.pi.currentPage + 1) + ');">&gt;</button>';	
								// 여기 까지가 정상적으로 작동하는 구간.
								
							}else if(list.pi.currentPage == list.pi.endPage){//2페이지 이상이고 마지막 페이지일때
	 						  	pagingValue += '<button onclick="selectUnhandledReportList('
					  			             + (list.pi.currentPage - 1) + ');">&lt;</button>&nbsp;&nbsp;';
							  	for(var i=1; i<=list.pi.endPage; i++){
							  		if(i == list.pi.currentPage){// 요청한 페이지랑 현재페이지 동일할경우
							  			pagingValue += '<button id="dis-btn" disabled>'
							  			             + list.pi.currentPage + '</button>&nbsp;&nbsp;';
							  		}else{// 요청한 페이지랑 다른 경우 
							  			pagingValue += '<button onclick="selectUnhandledReportList('
							  						 + i + ');">' + i + '</button>&nbsp;&nbsp;';
							  		};		     
								}
	 						  	pagingValue += '<button disabled>&gt;</button>';
							}else{//3페이지 이상이고 가운데 껴있을때 
	 						  	pagingValue += '<button onclick="selectUnhandledReportList('
	 						  			     + (list.pi.currentPage - 1) + ');">&lt;</button>&nbsp;&nbsp;';
	 						  	for(var i=1; i<=list.pi.endPage; i++){
	 						  		if(i == list.pi.currentPage){// 요청한 페이지랑 현재페이지 동일할경우
	 						  			pagingValue += '<button id="dis-btn" disabled>'
	 						  			             + list.pi.currentPage + '</button>&nbsp;&nbsp;';
	 						  		}else{// 요청한 페이지랑 다른 경우 
	 						  			pagingValue += '<button onclick="selectUnhandledReportList('
	 						  						 + i + ');">' + i + '</button>&nbsp;&nbsp;';
	 						  		}		     
								};	 						  
 						  		pagingValue += '<button onclick="selectUnhandledReportList('
 						  			         + (list.pi.currentPage + 1) + ');">&gt;</button>';		     
		 					}
		 					// 페이징 처리 끝
		 				}
		 			}else{//조회결과가 없을때 
		 				mainValue += '<tr style="color:red; height:140px;"><th colspan="6">'
		 						   + '<br>신고 미해결 쪽지가 존재하지 않거나<br><br>모든 미해결 신고를 처리하여 <br><br>목록이 존재하지 않습니다.'
		 						   + '</th></tr>';
		 						   
						  pagingValue += '<button disabled>&lt;</button>&nbsp;&nbsp;'
						               + '<button disabled>1</button>&nbsp;&nbsp;'
						               + '<button disabled>&gt;</button>';
		 			}
		 			
		 			// 아래는 무조건 성공시 실행되는 코드들 
		 			$("#report-info-table tbody").html(mainValue);
		 			$("#adminReportTopPagingArea").html(pagingValue);
		 			$("#unhandeled-count").html(list.pi.listCount);

		 		//아래꺼가 success끝나는 곳 	
		 		},error:function(){
		 			console.log("ajax통신 실패");
		 		}//error끝나는곳     		 		
 		
		 	})//ajax끝나는곳 
		}// 함수끝 

		function selectHandledReportList(page){
		 	$.ajax({
		 		url: "handledReport.admsg",
		 		data:{currentPage: page
		 		},
		 		success:function(list){
		 			console.log(list);
		 			mainValue= "";
		 			pagingValue = "";
		 			if(list.handleList.length != 0){// 조회결과가 있을때
		 				if(list.handleList.length<4 && page == null){//4보다 작으니 paging자체가 생기지 않느다.
		 					for(var i in list.handleList){
			 					mainValue += '<tr onclick="opendetailHandledReportModal(' 
			 							   + list.handleList[i].msgReportNo + ');"><td>'
			 					           + list.handleList[i].msgReportNo + '</td><td>'
			 					           + list.handleList[i].reportType + '</td><td>'
		 								   + list.handleList[i].senderNameAndRank + '</td><td>'
		 								   + list.handleList[i].reportDate + '</td><td>'
		 								   + list.handleList[i].recipientNameAndRank + '</td><td>'
		 								   + list.handleList[i].resultStatus + '</td><td>'
		 								   + list.handleList[i].handleDate + '</td></tr>';
		 					};
		 					for(var i=0; i<(4-list.handleList.length); i++){
		 						mainValue += '<tr style="height:35px;"><td colspan="7"></td></tr>';
		 					};
		 					
 						  	pagingValue += '<button disabled>&lt;</button>&nbsp;&nbsp;'
				              			 + '<button disabled>1</button>&nbsp;&nbsp;'
				              			 + '<button disabled>&gt;</button>';
							// 여기까지가 4개 미만 일때 이다.	              			 
		 				}else{//전체 길이가 4보다 크면 !!! paging생기고 동적으로 돌려줘야해
		 					
		 					for(var i in list.handleList){ // 4개 미만으로 조회한것 반복문으로 생성
			 					mainValue += '<tr onclick="opendetailHandledReportModal(' 
		 							   + list.handleList[i].msgReportNo + ');"><td>'
		 					           + list.handleList[i].msgReportNo + '</td><td>'
		 					           + list.handleList[i].reportType + '</td><td>'
	 								   + list.handleList[i].senderNameAndRank + '</td><td>'
	 								   + list.handleList[i].reportDate + '</td><td>'
	 								   + list.handleList[i].recipientNameAndRank + '</td><td>'
	 								   + list.handleList[i].resultStatus + '</td><td>'
	 								   + list.handleList[i].handleDate + '</td></tr>';
		 					};
		 					for(var i=0; i<(4-list.handleList.length); i++){// 5개 행 채우기 위한 용도
		 						mainValue += '<tr style="height:35px;"><td colspan="7"></td></tr>';
		 					};
		 					
		 					// 페이징 처리
		 					if(list.pi.maxPage == 1){
	 						  	pagingValue += '<button disabled>&lt;</button>&nbsp;&nbsp;'
			              			 + '<button disabled>1</button>&nbsp;&nbsp;'
			              			 + '<button disabled>&gt;</button>';
							}else if(list.pi.currentPage == 1){// 2페이지 이상있고 첫번째 페이지라면
	 						  	// ★ 여기가 정상적으로 작동하는 구간이다. 
								pagingValue += '<button disabled>&lt;</button>&nbsp;&nbsp;';
							  	for(var i=1; i<=list.pi.maxPage; i++){
							  		if(i == list.pi.currentPage){// 요청한 페이지랑 현재페이지 동일할경우
							  			pagingValue += '<button id="dis-btn" disabled>'
							  			             + list.pi.currentPage  + '</button>&nbsp;&nbsp;';
							  		}else{// 요청한 페이지랑 다른 경우 
							  			pagingValue += '<button type="button" onclick="selectHandledReportList('
									  				 + i + ');">' + i + '</button>&nbsp;&nbsp;';
							  		}	
								};	 						  
						  		pagingValue += '<button onclick="selectHandledReportList('
						  			         + (list.pi.currentPage + 1) + ');">&gt;</button>';	
								// 여기 까지가 정상적으로 작동하는 구간.
								
							}else if(list.pi.currentPage == list.pi.endPage){//2페이지 이상이고 마지막 페이지일때
	 						  	pagingValue += '<button onclick="selectHandledReportList('
					  			             + (list.pi.currentPage - 1) + ');">&lt;</button>&nbsp;&nbsp;';
							  	for(var i=1; i<=list.pi.endPage; i++){
							  		if(i == list.pi.currentPage){// 요청한 페이지랑 현재페이지 동일할경우
							  			pagingValue += '<button id="dis-btn" disabled>'
							  			             + list.pi.currentPage + '</button>&nbsp;&nbsp;';
							  		}else{// 요청한 페이지랑 다른 경우 
							  			pagingValue += '<button onclick="selectHandledReportList('
							  						 + i + ');">' + i + '</button>&nbsp;&nbsp;';
							  		};		     
								}
	 						  	pagingValue += '<button disabled>&gt;</button>';
							}else{//3페이지 이상이고 가운데 껴있을때 
	 						  	pagingValue += '<button onclick="selectHandledReportList('
	 						  			     + (list.pi.currentPage - 1) + ');">&lt;</button>&nbsp;&nbsp;';
	 						  	for(var i=1; i<=list.pi.endPage; i++){
	 						  		if(i == list.pi.currentPage){// 요청한 페이지랑 현재페이지 동일할경우
	 						  			pagingValue += '<button id="dis-btn" disabled>'
	 						  			             + list.pi.currentPage + '</button>&nbsp;&nbsp;';
	 						  		}else{// 요청한 페이지랑 다른 경우 
	 						  			pagingValue += '<button onclick="selectHandledReportList('
	 						  						 + i + ');">' + i + '</button>&nbsp;&nbsp;';
	 						  		}		     
								};	 						  
 						  		pagingValue += '<button onclick="selectHandledReportList('
 						  			         + (list.pi.currentPage + 1) + ');">&gt;</button>';		     
		 					}
		 					// 페이징 처리 끝
		 				}
		 			}else{//조회결과가 없을때 
		 				mainValue += '<tr style="color:red; height:140px;"><th colspan="7">'
		 						   + '<br><br>해결한 쪽지 신고가 존재하지 않습니다.<br><br>위 미해결 신고에서 신고 처리를 해주세요 <br><br>'
		 						   + '</th></tr>';
		 						   
						  pagingValue += '<button disabled>&lt;</button>&nbsp;&nbsp;'
						               + '<button disabled>1</button>&nbsp;&nbsp;'
						               + '<button disabled>&gt;</button>';
		 			}
		 			
		 			// 아래는 무조건 성공시 실행되는 코드들 
		 			$("#handeled-msgarea tbody").html(mainValue);
		 			$("#adminReportbottomPagingArea").html(pagingValue);

		 		//아래꺼가 success끝나는 곳 	
		 		},error:function(){
		 			console.log("ajax통신 실패");
		 		}//error끝나는곳     		 		
 		
		 	})//ajax끝나는곳 
		}// 함수끝 
	</script>

	<section>
		<div class="outer" style="width: 1170px;">
			<div class="left-section">
				<jsp:include page="../common/adminMessangerVerticalNav.jsp"/>
			</div>
			<div class="main-section">
				<h2><b>&nbsp;쪽지 신고처리</b></h2>
				
				<div id="unhandeled-msgarea">
					<p>&nbsp;&nbsp;<b>※ 미해결 신고</b>&nbsp;&nbsp;<span id="unhandeled-count">6</span></p>
					<table class="table table-sm" id="report-info-table">
						<thead>
							<tr>
								<th>신고번호</th>
								<th>신고유형</th>
								<th>신고대상</th>
								<th>신고일자</th>
								<th>신고인</th>
								<th>신고 처리하기</th>
							</tr>
						</thead>
						<tbody>
							<!-- <td onclick="event.cancelBubble=true"> 이게 EVENT제거하는 것으로 여기서의 키포인트다~! 그리고 btn클릭시 이벤트로 따로 부여하자! -->
						</tbody>
					</table>	

					<!-- 나중에  jstl로다가! 조건문 반복문으로 처리해줘야해~  -->
					<div align="center" class="paging-area" id="adminReportTopPagingArea">
					</div>
				</div>

				<div id="handeled-msgarea">
					<p>&nbsp;&nbsp;<b>※ 해결 신고내역</b></p>	
					<table class="table table-sm">
						<thead>
							<tr>
								<th>신고번호</th>
								<th>신고유형</th>
								<th>신고대상</th>
								<th>신고일자</th>
								<th>신고인</th>
								<th>신고처리상태</th>
								<th>신고처리날자</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>

					<!-- 나중에  jstl로다가! 조건문 반복문으로 처리해줘야해~  -->
					<div align="center" class="paging-area second-pagingbar" id="adminReportbottomPagingArea">
						<button onclick="location.href='';">&lt;</button>
						<button onclick="location.href='';">1</button>
						<button id="dis-btn" disabled>2</button>
						<button onclick="location.href='';">&gt;</button>
					</div>
				</div>
			</div>
		</div>
	</section>
<%----------------------------------------------------------- 스크립트영역 시작 ----------------------------------------------------------%>	
	<script>
		// 신고처리 버튼 클릭시 신고번호 모달로 넘기는 스크립트 
		function openHandleReportModal(msgReportNo){
			//신고번호 넘겨서 만들어놓은 ajax 활용하기 (재활용) 
			// 해당 전역변수 가지고 db가서 정보 조회해와서 ! 값동적으로 생성해서 보여주기 여기서 작업 해주면된다! 
			
			console.log(msgReportNo);
			
			//마지막에 만들어진 모달을 여는것으로 효율성 증대! 
			$("#report-handel-modal").modal();
		}

		// 신고 사항 상세보기이다. 이는 !!! 미해결이든 해결이든 동일하다 
		// 즉 ! ★ 해결 신고 내역을 기준으로 조회해와라 ! 
		function opendetailHandledReportModal(msgReportNo){
			//신고번호 넘겨서 만들어놓은 ajax 활용하기 (재활용) 
			// 해당 전역변수 가지고 db가서 정보 조회해와서 ! 값동적으로 생성해서 보여주기  여기서 작업 해주면된다!

			console.log(msgReportNo);

			//마지막에 만들어진 모달을 여는것으로 효율성 증대! 
			$("#report-detail-modal").modal();
		}
	</script>
<%----------------------------------------------------------- 스크립트영역 끝 ----------------------------------------------------------%>	
<%----------------------------------------------------------- 신고처리 모달 영역 시작----------------------------------------------------------%>	

	<%-- 모달을 2개만 만들자 조회용 신고처리용  먼저 만들것은 신고처리 모달이다 그래야지 좀 수월하게 만든다  위치는 나중에 바꿔주고 --%>
	<!-- 신고처리 모달 영역 -->	
	<!-- The Modal -->
	<div class="modal fade" id="report-handel-modal">
		<div class="modal-dialog">
			<div class="modal-content" >
				<!-- Modal Header -->
				<div class="modal-header">
					<table>
						<tr>
							<th class="text-red">신고대상</th>
							<td>김땡땡 과장</td>
							<th>신고유형</th>
							<td>욕설</td>						
						</tr>
						<tr>
							<th>신고시간</th>
							<td>2021-07-30 [16:24]</td>
							<th>관련내용</th>
							<td>행사</td>						
						</tr>
						<tr>
							<th class="text-blue">신고인</th>
							<td>땡땡땡 사원</td>
							<th>처리상태</th>
							<td class="text-purple">처리중</td>						
						</tr>
					</table>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				
				<!-- Modal body -->
				<div class="modal-body">
					<div class="view-report-content-area">
						<div class="left-content">
							<p>※ 신고내용</p>
							<!-- 값뿌려주기-->
							<pre>쪽지 내용이 어쩌구 저쩌구 합니다 기분나빠서 오랜 고민끝에  신고합니다 처리 부탁드려요 ! 
							</pre>
						</div>
						<div class="right-content">
							<p class="text-purple">※ 답변내용</p>
							<textarea name="" required></textarea>
						</div>
					</div>
				</div>
				
				<!-- Modal footer -->
				<div class="modal-footer">
					<p>※ 조치 영역</p>
					<div>
						<!--값들 가져와서 뿌려야함-->
						<span>신고대상</span>
						<input type="text" name="" required>  
						<span>징계정도</span>
						<select name="">
							<option value="">기능제한</option>
							<option value="">정직</option>
							<option value="">쪽지기능제한</option>
						</select>
					</div>
					<div>
						<span>처리상태</span>
						<select name="" >
							<option value="">처리중</option>
							<option value="">처리완료</option>
						</select>
						<button type="submit" class="handel-btn" onclick="">신고 처리하기</button>
						<button type="button" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
<%----------------------------------------------------------- 신고처리 모달 영역 끝----------------------------------------------------------%>	
	
<%----------------------------------------------------------- 신고상세 모달 영역 시작----------------------------------------------------------%>	
	<!-- The Modal -->
	<div class="modal fade" id="report-detail-modal">
		<div class="modal-dialog">
			<div class="modal-content" >
			
				<!-- Modal Header -->
				<div class="modal-header">
					<table>
						<!-- 값 뿌려줄 영역 -->
						<tr>
							<th class="text-red">신고대상</th>
							<td>김땡땡 과장</td>
							<th>신고유형</th>
							<td>욕설</td>						
						</tr>
						<tr>
							<th>신고시간</th>
							<td>2021-07-30 [16:24]</td>
							<th>관련내용</th>
							<td>행사</td>						
						</tr>
						<tr>
							<th class="text-blue">신고인</th>
							<td>땡땡땡 사원</td>
							<th>처리상태</th>
							<td class="text-purple">처리중</td>						
						</tr>
					</table>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				
				<!-- Modal body -->
				<div class="modal-body">
					<div class="view-report-content-area">
						<div class="left-content">
							<p>※ 신고내용</p>
							<!-- 값뿌려주기-->
							<pre>쪽지 내용이 어쩌구 저쩌구 합니다 기분나빠서 오랜 고민끝에  신고합니다 처리 부탁드려요 ! 
							</pre>
						</div>
						<div class="right-content">
							<p class="text-purple">※ 답변내용</p>
							<textarea name="" disabled></textarea>
						</div>
					</div>
				</div>
				
				<!-- Modal footer -->
				<div class="modal-footer">
					<p>※ 조치 영역</p>
					<div>
						<!--값들 가져와서 뿌려야함-->
						<span>신고대상</span>
						<input type="text" name="" disabled>  
						<span>징계정도</span>
						<select name="" disabled>
							<option value="">기능제한</option>
							<option value="">정직</option>
							<option value="">쪽지기능제한</option>
						</select>
					</div>
					<div>
						<span>처리상태</span>
						<select name=""  disabled>
							<option value="">처리중</option>
							<option value="">처리완료</option>
						</select>
						<button type="button" data-dismiss="modal">뒤로가기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
<%----------------------------------------------------------- 신고상세 모달 영역 끝----------------------------------------------------------%>	
</body>
</html>