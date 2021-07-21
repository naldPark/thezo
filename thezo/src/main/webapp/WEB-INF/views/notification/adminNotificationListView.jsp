<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- @author Jaewon.s -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="Jaewon.s">
<title>알림 등록 및 기록</title>
<style>
	.outer{height: 615px; padding-top: 35px; display: flex; justify-content: space-between;}
	.left-section{width: 175px;}
	.main-section{width: 975px;}
	.main-section h2{margin-bottom: 15px;}

	/* 내가 만든 paging-area 재원 ~ */
	.paging-area{text-align: center; margin: 10px 0px 0px 0px;} 
	.paging-area button{width:28px; height:32px; color: rgb(127,127,127); font-size:16px; font-weight: bold; border: none; border-radius: 5px; background-color: rgb(244,244,244);}       
    #dis-btn{color:white; background-color: rgb(52,152,219);}

	/* 알림 기록쪽  */
	.inner-content{display: flex; justify-content: space-between;}
	.log-content{width: 625px; transform: translateX(-10px);}
	.log-content>p,.enroll-content>p{font-size: 18px; font-weight: bold; margin-bottom: 5px;}
	.log-content>p{color: rgb(22,160,133); padding-left: 15px;}
	.enroll-content>p{color: rgb(82,138,189);}

	.log-content>table{width: 100%; text-align: center; margin-bottom: 10px; border-top: 10px solid rgb(44, 62, 80); border-bottom: 1px solid lightgray; transform: translateX(2px);}
	.log-content>table>thead{height: 42px; line-height: 30px; background-color: rgb(234,234,234);}
	.log-content>table>tbody>tr:hover{cursor: pointer; font-weight: bold; background-color: rgba(254,246,234,0.6);}	

	
	.log-content>table>thead>tr>th{font-size: 14px; border-bottom: 1px solid gray;}
	.log-content>table>tbody>tr>td>button{width: 40px; height: 25px; color: white; font-size: 12px; font-weight: bold; line-height: 25px; padding: 0px; border: none; border-radius: 3px;}
	.blue-background{background-color: rgb(52,152,219);}
	.red-background{background-color: rgb(231,76,60);}
	.log-content button:hover{border: 1px solid black; transform: scale(1.12);}
	.log-content tr{height: 39px; font-size: 14px; border-bottom: 0.5px solid rgb(204,204,204);	}
	.log-content tr>td{line-height: 30px;}

	/* 알림 작성쪽 & 조회 수정 모달 */
	.enroll-content{width: 346px;}
	.enroll-content>div, .view-modify-content>div{height: 495px; border-top: 10px solid rgb(44, 62, 80); background-color: rgb(224,224,224);}
	.enroll-content>div>form>div:first-child, .view-modify-content>div>form>div:first-child{width: 295px; height: 50px; margin: auto; display: flex; background-color: rgb(236,180,90);}
	.enroll-content>div>form>div>div, .view-modify-content>div>form>div>div{width: 60px; color: white; font-size: 34px; text-align: center; line-height: 42px; padding: 0px;}
	.enroll-content>div>form>div>select, .view-modify-content>div>form>div>select {width: 150px; height: 40px; margin: auto; border-color: lightgray; border-radius: 3px; }
	.enroll-content>div>form>div>span, .view-modify-content>div>form>div>span{width: 60px; font-size: 26px; font-weight: bold;line-height: 48px; margin-right: 3px; display: inline-block;} 
	#notification-enrollForm p, #notification-modifyForm p{font-weight: bold; margin: 0px; padding: 5px 0px 0px 30px;}
	#notification-enrollForm table, #notification-modifyForm table{width: 310px; margin: auto; text-align: center;}
	#notification-enrollForm td, #notification-modifyForm td{padding: 4px 0px;}
	#notification-enrollForm table input , #notification-modifyForm table input{width: 95%; height: 38px; padding-left: 5px; border-color: lightgray; border-radius: 5px; border-style: none;}
	#notification-enrollForm table>tr>td>input, #notification-modifyForm table>tr>td>input{height: 100%;}
	.notification-content, .notification-view-content{width: 310px; display: block; margin: auto; margin-top: 4px; padding: 8px 15px; border: none; border-radius: 3px;
		resize: none;
		white-space:pre-wrap;  word-break:keep-all; text-overflow:clip;
		-ms-overflow-style: none; /* IE and Edge */
		scrollbar-width: none; /* Firefox */
	}
	.notification-content{height: 255px;}
	.notification-view-content{height: 220px;}
	.notification-content::-webkit-scrollbar, .notification-view-content::-webkit-scrollbar{display: none; /* Chrome, Safari, Opera*/}
	#notification-enrollForm button, #notification-modifyForm button{width: 160px; height: 40px; color: white; margin: auto; margin-top: 8px; border:none; border-radius: 5px; display: block; background-color: rgb(52,152,219);}

	/* 모달 영역 */
	#nfModal .modal-content{width: 370px; padding-bottom: 7px; transform: translate(100px, 90px);}
	#nfModal .modal-header{height: 40px; border-bottom:  none;}
	#nfModal .modal-header>p{font-size: 18px; font-weight: bold; line-height: 10px; margin-bottom: 5px;}
	#nfModal .modal-header>button{line-height: 5px;}
	
	.color-lightgreen{color: rgb(22,160,133);}
	.color-lightblue{color: rgb(82,138,189);}
	.view-modify-content{width: 95%; margin: auto; margin-top: 0px;}
	#nfModal .view-modify-content{padding: 0px;}
	.re-notification{width: 310px; height: 27px; color: red; font-size: 13px; font-weight: bold; margin: auto; margin-top: 8px; padding: 0px 10px; background: white;}
	.re-notification>i{font-size: 17px;}
	.re-notification>input{width: 20px; height: 20px; margin-left: 8px; transform: translateY(3px);}
	
	/* displayNone으로 조회냐 수정이냐에 따라 보이게 하기 */
	.for-view{display: none;}
	.for-modify{display: none;}
	select.for-view, textarea.for-view, input.for-view{background-color: lightgray ;}
	
	/* 삭제모달 css */
	#nfDeleteModal .modal-content{width: 375px; height: 185px; transform: translate(200px, 300px);}
	#nfDeleteModal .modal-header{height: 45px; color: red; font-weight: bold; font-size: 18px; border-bottom: none; overflow: hidden;}
	#nfDeleteModal .modal-header>button{font-size: 50px; padding: 2px; transform: translateY(-10px);}
	#nfDeleteModal .modal-body{height: 90px;}
	#nfDeleteModal .modal-body>p{padding-left: 20px; margin-bottom: 8px;}
	#nfDeleteModal .modal-body>p:first-child{font-weight: bold;}
	#nfDeleteModal .modal-body>p:last-child{color: red;}
	#nfDeleteModal .modal-footer{height: 50px; padding: 0px; border-top: none; flex-direction: row; justify-content: space-around;}
	#nfDeleteModal .modal-footer>button{width: 49.5%; height: 90%; color: white; font-weight: bold; margin: 0px; border: none; border-radius: 5px;}
	#nfDeleteModal .modal-footer>button:hover{color: orange; font-size: 17px;}
	#nfDeleteModal .modal-footer>button:first-child{background-color: gray;}
	#nfDeleteModal .modal-footer>button:last-child{background-color: red; }
	
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<script>
		document.getElementById("admin-header").style.display ="block"; 
        document.getElementById("admin-mode").style.color = "red";
	</script>

	<section>
		<div class="outer" style="width: 1170px;">
			<div class="left-section">
				<jsp:include page="../common/adminMessangerVerticalNav.jsp"/>
			</div>
			<div class="main-section">
				<h2><b>&nbsp;알림 등록 및 기록</b></h2>
				<div class="inner-content">
					<div class="log-content">
						<p>※ 기록</p>
						<table class="table table-sm">
							<thead>
								<tr>
									<th width="75">알림번호</th>
									<th width="90">알림 등록일</th>
									<th width="90">알림 수정일</th>
									<th width="130">알림 대상</th>
									<th width="75">시작일</th>
									<th width="75">종료일</th>
									<th width="45">수정</th>
									<th width="45">삭제</th>
								</tr>								
							</thead>
							<tbody>
								<!-- 여기가 반복문으로 값을 동적으로 뿌리는곳-->
								<tr onclick="ajaxNotificationDetail(1);">
									<td>10</td>
									<td>21-07-29</td>
									<td>21-07-30</td>
									<td>땡땡땡땡땡땡부서</td>
									<td>21-07-29</td>
									<td>21-08-03</td>
									<td onclick="event.cancelBubble=true">
										<!-- 행클릭시 조회는 모달 하나를 가지고 활용을 하자! -->
										<button type="button" class="blue-background" onclick="ajaxNotificationModify(2);">수정</button>
									</td>
									<td onclick="event.cancelBubble=true">
										<button type="button" class="red-background" onclick="ajaxNotificationDelete('알림번호');">삭제</button>
									</td>
								</tr>
								<tr>
								</tr>
								<tr>
								</tr>
								<tr>
								</tr>
								<tr>
								</tr>
								<tr>
								</tr>
								<tr>
								</tr>
								<tr>
								</tr>
								<tr>
								</tr>
								<tr>
								</tr>
							</tbody>
						</table>
						<!-- 페이징처리  나중에  jstl로다가! 조건문 반복문으로 처리해줘야해~  -->
						<div align="center" class="paging-area second-pagingbar">
							<button onclick="location.href='';">&lt;</button>
							<button onclick="location.href='';">1</button>
							<button id="dis-btn" disabled>2</button>
							<button onclick="location.href='';">&gt;</button>
						</div>		
					</div>

					<!--오른쪽 박스 -->
					<div class="enroll-content">
						<p>※ 새로운 알림 작성하기</p>
						<div id="notification-enrollForm">
							<form action="" method="">
								<div>
									<div><i class="fas fa-lightbulb"></i></div>
									<select name="" id="">
										<option value="">ssss</option>
										<option value=""></option>
										<option value=""></option>
										<option value=""></option>
									</select>
									<span>알림</span>
								</div>
								<p>▶ 일정</p>
								<table>
									<tr>
										<th>시작일</th>
										<td><input type="date" required></td>
									</tr>
									<tr>
										<th>종료일</th>
										<td><input type="date" required></td>
									</tr>
								</table>
								<textarea name="" class="notification-content" placeholder="알림을 작성해주세요." required></textarea>
								<button type="submit">등록하기</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

<%-------------------------------------------- 스크립트 영역 시작 ----------------------------------------------%>
	<script>
		// 행클릭시 modal 열리는 방식으로 1번은 detail페이지 2번은 수정페이지이다. 
		//(단 !! AJAX로 값을 가져올때에!!! model객체에!! 또한번 내가 지정한 값을 넘겨서 현재 jsp에서 jstl로다가 조건검사식으로 
		// 화면이 만들어지게 해줘야한다.) 

		// 전역변수로 세팅
		var forView = document.getElementsByClassName("for-view");
		var forModify = document.getElementsByClassName("for-modify");


		// 상세 모달
		function ajaxNotificationDetail(tossedNo){
			if(tossedNo == 1 ){
				for(var i=0; i<forView.length; i++){
					forView[i].style.display="block"; 
				}
				for(var i=0; i<forModify.length; i++){
					forModify[i].style.display="none"; 
				}
			}
			// 	$.ajax({
			// 		url:"~~ .do",
			// 		success:function(인자){
			// 		},error:function(){
			// 			console.log("ajax통신 실패");
			// 		}				
			// 	})
			$("#nfModal").modal();
		}
		
		// 수정모달 
		function ajaxNotificationModify(tossedNo){
			if(tossedNo == 2 ){
				for(var i=0; i<forModify.length; i++){
					forModify[i].style.display="block"; 
				}
				for(var i=0; i<forView.length; i++){
					forView[i].style.display="none"; 
				}
			}
			// 	$.ajax({
			// 		url:"~~ .do",
			// 		success:function(인자){
			// 		},error:function(){
			// 			console.log("ajax통신 실패");
			// 		}				
			// 	})
			$("#nfModal").modal();
		}

		function ajaxNotificationDelete(tossedNo){
			console.log(tossedNo);
			$("#nfDeleteModal").modal();
		}
	</script>
<%-------------------------------------------- 스크립트 영역 끝 ----------------------------------------------%>
<%------------------------------------------------------알림 조회 및 수정 모달 시작 -------------------------------------------------------%>
<%-- 알림 조회 수정 모달 --%>
<div class="modal fade" id="nfModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<!-- 조건문 처리해야한다. -->
				<p class="color-lightgreen for-view">※ 알림 조회</p>
				<p class="color-lightblue for-modify">※ 알림 수정</p>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->			
			<div class="modal-body view-modify-content">
				<div id="notification-modifyForm">
					<form action="" method="post">
						<div>
							<div><i class="fas fa-lightbulb"></i></div>
							<select name="" id="" class="for-view" disabled>
								<option value=""></option>
							</select>
							<select name="" id="" class="for-modify">
								<option value="">ssss</option>
								<option value=""></option>
								<option value=""></option>
								<option value=""></option>
							</select>
							<span>알림</span>
						</div>
						<p>▶ 일정</p>
						<table>
							<tr>
								<th>시작일</th>
								<td><input type="date" class="for-view" disabled></td>
								<td><input type="date" name="" class="for-modify" required></td>
							</tr>
							<tr>
								<th>종료일</th>
								<td><input type="date" class="for-view" disabled></td>
								<td><input type="date" name="" class="for-modify" required></td>
							</tr>
						</table>
						<!-- 조건문 처리해야한다. -->
						
						<textarea name="" class="notification-content for-view" placeholder="알림을 작성해주세요." disabled></textarea>
						<textarea name="" class="notification-view-content for-modify" placeholder="알림을 작성해주세요." required></textarea>						
						<div class="re-notification for-modify">
							<i class="fas fa-lightbulb"></i> &nbsp; &nbsp;다시 알림을 하고 싶을 시 선택해 주세요  
							<input type="checkbox" name="" value="">
						</div>
						<button type="submit" class="for-modify" data-dismiss="modal">등록하기</button>
						<button class="close-back-button for-view" type="button" data-dismiss="modal" style="background-color: gray;">뒤로가기</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<%------------------------------------------------------알림 조회 및 수정 모달 끝-------------------------------------------------------%>
<%------------------------------------------------------알림 삭제 모달 시작 -------------------------------------------------------%>
<%-- 알림 삭제 모달 --%>
	<div class="modal fade" id="nfDeleteModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<p>※ 알림 삭제</p>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">
					<p>해당 알림을 삭제하시겠습니까?</p>
					<p>한번 삭제된 알림은 되돌릴 수 없습니다.</p>
				</div>
				<!--url에 안찍히게 해야한다. -->
				<form action="" method="POST">
					<input type="hidden" id="notification-delNo" name="">
					<div class="modal-footer">
						<!-- Modal footer -->
						<button type="button" class="" data-dismiss="modal">취소하기</button>
						<button type="submit" class="" data-dismiss="modal" onclick="">삭제하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
<%------------------------------------------------------알림 삭제 모달 끝-------------------------------------------------------%>
</body>
</html>