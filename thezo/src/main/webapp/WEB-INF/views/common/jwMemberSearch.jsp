<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- @Author Jaewon.s -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="Jaewon.s">
<title>쪽직 동료 찾기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous"> 
<style>
    .outer{width: 430px; height: 490px; margin: auto; margin-top: 5px; font-family:'Noto Sans KR', sans-serif;}
    .outer>h2{font-weight: bold;}
    .outer>h2, .search-by-name, .search-by-category{margin-left: 10px;} 
    .search-by-name{height: 40px; display: flex; margin-bottom: 5px;}
    .search-by-name>span{font-size: 17px; font-weight: bold; margin-left: 10px; margin-right: 20px;}
    .search-by-name>div{width: 200px; height: 28px; border: 1px solid darkgray; display: flex; border-radius: 3px; overflow: hidden; justify-content: flex-start;}
    .search-by-name>div>input{width: 172px; height: 28px; outline: none; border: none;}
    .search-by-name>div>button{width: 28px; height: 28px;color: white; font-weight: bold; border: 1px solid rgb(52,152,219); border-left: 1px solid darkgray; outline: none; background-color: rgb(52,152,219);}
    .search-by-name>div>button:hover{color: orange;}
    .search-by-category>p, .department-list, .department-list{font-size: 17px; font-weight: bold; margin-left: 10px; margin-bottom: 10px;}
    .department-list>span, .department-list>span{margin-right: 25px;}
    .department-list>select, .department-list>select{width: 255px; height: 28px; font-size: 16px; font-weight: normal; border: 1px solid darkgray; border-radius: 4px;}
    .search-by-category{margin-bottom: 30px;}
    #search-result-area>table{width: 382px; height: 184px; text-align: center; margin: auto; margin-bottom: 20px; border-top: 2px solid rgb(204,204,204); border-bottom: 2px solid rgb(204,204,204);}
    #search-result-area>table>thead>tr{background-color: rgb(234,234,234);}
    #search-result-area>table>thead>tr>th{width: 20%;}
    #search-result-area>table>thead>tr>th:nth-child(1){width: 100px;}
    #search-result-area>table>thead>tr>th:nth-child(2){width: 80px;}
    #search-result-area>table>thead>tr>th:nth-child(3){width: 80px;}
    #search-result-area>table>thead>tr>th:nth-child(4){width: 80px;}
    #search-result-area>table>thead>tr>th:nth-child(5){width: 80px;}
    #search-result-area>table>tbody>tr{height: 28px;}
    #search-result-area>table>tbody>tr>td{font-size: 14px; vertical-align: middle;}
    #search-result-area>table>tbody>tr button{height: 25px; color: white; font-size: 12px; font-weight: bold; border: none; border-radius: 3px; background-color: rgb(52,152,219);}
	#msg-mem-name::placeholder{color:red;}
    /* 내가 만든 paging-area 재원 ~ */
	.paging-area{text-align: center; margin: 10px 0px;} 
	.paging-area button{width:28px; height:32px; color: rgb(127,127,127); font-size:16px; font-weight: bold; border: none; border-radius: 5px; background-color: rgb(244,244,244);}       
    #dis-btn{color:white; background-color: rgb(52,152,219);}
</style>
</head>
<body>	
    <div class="outer">

    <h2>동료 찾기</h2>
    <div class="search-by-name">
        <span>▶ 이름으로 검색</span>
        <div>
            <input type="text" id="msg-mem-name">
            <button type="button" onclick="selectMemInfoBySearch()"><i class="fas fa-search"></i></button>
        </div>
    </div>
    <div class="search-by-category">
        <p>▶ 항목으로 검색</p>
        <div class="department-list">
            <span>▷ 부서</span>
            <select id="deptSelectForChat" onChange="openRankSelect();">
                <option value="" id="deptGuideOption">선택해주세요</option>
                <option value="대표이사">대표이사</option>
                <option value="경영관리본부">경영관리본부</option>
                <option value="인사팀">인사팀</option>
                <option value="총무팀">총무팀</option>
                <option value="회계팀">회계팀</option>
                <option value="개발본부">개발본부</option>
                <option value="개발1팀">개발1팀</option>
                <option value="개발2팀">개발2팀</option>
                <option value="인프라팀">인프라팀</option>
                <option value="운영본부">운영본부</option>
                <option value="운영팀">운영팀</option>
                <option value="영업팀">영업팀</option>
                <option value="구매팀">구매팀</option>
            </select>
        </div>
        <div class="department-list">
            <span>▷ 직급</span>
            <select id="rankSelectForChat" disabled onChange="selectDeptAndRank();">
                <option value="" id="rankGuideOption">선택해주세요</option>
                <option value="사원">사원</option>
                <option value="대리">대리</option>
                <option value="과장">과장</option>
                <option value="부장">부장</option>
                <option value="상무">상무</option>
                <option value="대표이사">대표이사</option>
            </select>
        </div>
    </div>

    <div id="search-result-area">
        <table class="table table-sm">
            <thead>
                <tr>
                    <th>부서</th>
                    <th>직책</th>
                    <th>이름</th>
                    <th>아이디</th>
                    <th>선택</th>
                </tr>
            </thead>
            <tbody>
       			<tr style="color: rgb(61,78,254); height:175px;">
       				<th colspan="5">
						<br>동료의 이름으로 검색 또는<br><br>부서별로 검색 더 나아가 직책에 따라 <br><br>검색이 가능합니다!
					</th>
				</tr>
            </tbody>
        </table>

        <!-- 나중에  jstl로다가! 조건문 반복문으로 처리해줘야해~  -->
        <div align="center" id="msgPopUpPaging" class="paging-area second-pagingbar">
			<button disabled>&lt;</button>&nbsp;&nbsp;
			<button disabled>1</button>&nbsp;&nbsp;
			<button disabled>&gt;</button>
        </div>

    </div>
</div>

<!-- 값을 부모 window로 넘기자~  -->
    <script type="text/javascript">
        function sendToParent(btn){
            var name = $(btn).parent().parent().children().eq(2).text();
            var rank = $(btn).parent().parent().children().eq(1).text();

            var nameAndRank = name + " " + rank;
            opener.document.getElementById("select-member-msg").value = nameAndRank;
            
            var memNo = $(btn).parent().children().eq(0).val();
            opener.document.getElementById("hidden-member-number").value = memNo;
            
            window.close();
        }
                
        $(document).ready(function(){
	       	$("#deptSelectForChat").on('focus',function(){
	       		$("#deptGuideOption").hide();	       		
	       	});

	       	$("#rankSelectForChat").on('focus',function(){
	       		$("#rankGuideOption").hide();	       		
	       	});
        });
        //========================================================================
        // 이름으로 검색하기 일단은 해결함 	다만 페이징 처리에있어서 효율이 좋아보이지는 않는다. 
        	
        // 이름으로 검색임 해당부분은 해결함 가져올수있음 (이제 가져와서 페이징 처리하면서 가공처리 해줘야함 )
        function selectMemInfoBySearch(beforeKeyword ,page){
        	//잘가져온다. ajax 달리자! 가자 
        	if($("#msg-mem-name").val() == "" && beforeKeyword == null){
        		$("#msg-mem-name").attr("placeholder", "이름을 입력하세요");
        	}else{
				var keyword;				
	 			if(beforeKeyword != null){
	 				keyword = beforeKeyword;
	 			}else{
					keyword = $("#msg-mem-name").val();
	 			}
	 				 			
	 			// ajax로 값을 가져오면서 paging처리 
			 	$.ajax({
			 		url: "searchMemList.msg",
			 		data:{keyword: keyword
			 			, currentPage: page
			 		},
			 		success:function(list){
			 			
			 			mainValue= "";
			 			pagingValue = "";
			 			if(list.memList.length != 0){// 조회결과가 있을때
			 				if(list.memList.length<5 && page == null){//5보다 작으니 paging자체가 생기지 않느다.
			 					for(var i in list.memList){
				 					mainValue += '<tr><td>' + list.memList[i].department + '</td><td>'
				 					           + list.memList[i].rank + '</td><td>'
				 					           + list.memList[i].memName + '</td><td>'
			 								   + list.memList[i].memId + '</td><td><input type="hidden" value="'
			 								   + list.memList[i].memNo + '">'
			 								   + '<button type="button" onclick="sendToParent(this);">'
			 								   + '선택하기</button>' + '</td></tr>';
			 					};
			 					for(var i=0; i<(5-list.memList.length); i++){
			 						mainValue += '<tr style="height:35px;"><td colspan="5"></td></tr>';
			 					};
			 					
	 						  	pagingValue += '<button disabled>&lt;</button>&nbsp;&nbsp;'
					              			 + '<button disabled>1</button>&nbsp;&nbsp;'
					              			 + '<button disabled>&gt;</button>';
			 				}else{//전체 길이가 5보다 크면 !!! paging생기고 동적으로 돌려줘야해
			 					
			 					for(var i in list.memList){ // 5개 미만으로 조회한것 반복문으로 생성
				 					mainValue += '<tr><td>' + list.memList[i].department + '</td><td>'
				 					           + list.memList[i].rank + '</td><td>'
				 					           + list.memList[i].memName + '</td><td>'
			 								   + list.memList[i].memId
			 								   + '</td><td><input type="hidden" value="'
			 								   + list.memList[i].memNo + '">'
			 								   + '<button type="button" onclick="sendToParent(this);">'
			 								   + '선택하기</button>' + '</td></tr>';
			 					};
			 					for(var i=0; i<(5-list.memList.length); i++){// 5개 행 채우기 위한 용도
			 						mainValue += '<tr style="height:35px;"><td colspan="5"></td></tr>';
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
								  			pagingValue += '<button type="button" onclick="selectMemInfoBySearch('
										  				 + "'" + keyword + "'," + i + ');">' + i + '</button>&nbsp;&nbsp;';
								  		}	
									};	 						  
							  		pagingValue += '<button onclick="selectMemInfoBySearch('
							  			 + "'" + keyword + "'" + ',' + (list.pi.currentPage + 1) + ');">&gt;</button>';	
									// 여기 까지가 정상적으로 작동하는 구간.
								}else if(list.pi.currentPage == list.pi.endPage){//2페이지 이상이고 마지막 페이지일때
		 						  	pagingValue += '<button onclick="selectMemInfoBySearch('
		 						  		 + "'" + keyword + "'" + ','
						  			     + (list.pi.currentPage - 1) + ');">&lt;</button>&nbsp;&nbsp;';
								  	for(var i=1; i<=list.pi.endPage; i++){
								  		if(i == list.pi.currentPage){// 요청한 페이지랑 현재페이지 동일할경우
								  			pagingValue += '<button id="dis-btn" disabled>'
								  			             + list.pi.currentPage + '</button>&nbsp;&nbsp;';
								  		}else{// 요청한 페이지랑 다른 경우 
								  			pagingValue += '<button onclick="selectMemInfoBySearch('
								  						 + "'" + keyword + "',"  + i + ');">' + i + '</button>&nbsp;&nbsp;';
								  		};		     
									}
		 						  	pagingValue += '<button disabled>&gt;</button>';
								}else{//3페이지 이상이고 가운데 껴있을때 
		 						  	pagingValue += '<button onclick="selectMemInfoBySearch('
		 						  				 + "'" + keyword + "'" + ','
		 						  			     + (list.pi.currentPage - 1) + ');">&lt;</button>&nbsp;&nbsp;';
		 						  	for(var i=1; i<=list.pi.endPage; i++){
		 						  		if(i == list.pi.currentPage){// 요청한 페이지랑 현재페이지 동일할경우
		 						  			pagingValue += '<button id="dis-btn" disabled>'
		 						  			             + list.pi.currentPage + '</button>&nbsp;&nbsp;';
		 						  		}else{// 요청한 페이지랑 다른 경우 
		 						  			pagingValue += '<button onclick="selectMemInfoBySearch('
		 						  						 + "'" + keyword + "'," + i + ');">' + i + '</button>&nbsp;&nbsp;';
		 						  		}		     
									};	 						  
	 						  		pagingValue += '<button onclick="selectMemInfoBySearch('
	 						  			 + "'" + keyword + "'," + (list.pi.currentPage + 1) + ');">&gt;</button>';		     
			 					}
			 					// 페이징 처리 끝
			 				}
			 			}else{//조회결과가 없을때 
			 				mainValue += '<tr style="color:red; height:175px;"><th colspan="5">'
			 						   + '<br>요청하신 조건에 <br><br>해당하는 동료가 존재하지 않습니다. <br><br>'
			 						   + '다시 검색해주세요!'
			 						   + '</th></tr>';
			 						   
 						  pagingValue += '<button disabled>&lt;</button>&nbsp;&nbsp;'
 						               + '<button disabled>1</button>&nbsp;&nbsp;'
 						               + '<button disabled>&gt;</button>';
			 			}
			 			
			 			// 아래는 무조건 성공시 실행되는 코드들 
			 			$("#search-result-area tbody").html(mainValue);
			 			$("#msgPopUpPaging").html(pagingValue);
			 			
			 			// 검색창 이름 초기화 시키기
						$("#msg-mem-name").val("")
		        		$("#msg-mem-name").attr("placeholder", "");
		        		$("#deptSelectForChat").val("").prop("selected", true);
		        		$("#rankSelectForChat").val("").prop("selected", true);
		            	$("#rankSelectForChat").prop("disabled", true);        		

			 		//아래꺼가 success끝나는 곳 	
			 		},error:function(){
			 			console.log("ajax통신 실패");
			 		}//error끝나는곳     		 		
			 	})//ajax끝나는곳 
        	}// 첫번째 유효성검사 끝나는곳 
        }// function끝나는곳 
        
        
        // 부서로 검색하는 스크립트 
        function openRankSelect(beforeKeyword ,page){
        	if($("#deptSelectForChat").val() == ""){
        		$("#rankSelectForChat").val("").prop("selected", true);
            	$("#rankSelectForChat").prop("disabled", true);
            	// 여기서는 뿌려주는 테이블에 " 해당 조건에 대한 검색결과가 없다" 라고 알려줘야한다. 
        	}else{
        		$("#deptGuideOption").hide();
            	$("#rankSelectForChat").prop("disabled", false);        		
        		$("#rankSelectForChat").val("").prop("selected", true);
        	    // 여기서 부서만으로 검색해오는 ajax를 작성해줘야한다. 
        	    // 또한 !!! 페이징 처리도 동적으로 생성을 시켜줘야한다. 그래야 깜빡거림이 없다!!! 
				var keyword;				
	 			if(beforeKeyword != null){
	 				keyword = beforeKeyword;
	 			}else{
					keyword = $("#deptSelectForChat").val()
	 			}
	 				 			
	 			// ajax로 값을 가져오면서 paging처리 
			 	$.ajax({
			 		url: "MemListByDept.msg",
			 		data:{keyword: keyword
			 			, currentPage: page
			 		},
			 		success:function(list){
			 			
			 			mainValue= "";
			 			pagingValue = "";
			 			if(list.memList.length != 0){// 조회결과가 있을때
			 				if(list.memList.length<5 && page == null){//5보다 작으니 paging자체가 생기지 않느다.
			 					for(var i in list.memList){
				 					mainValue += '<tr><td>' + list.memList[i].department + '</td><td>'
				 					           + list.memList[i].rank + '</td><td>'
				 					           + list.memList[i].memName + '</td><td>'
			 								   + list.memList[i].memId + '</td><td><input type="hidden" value="'
			 								   + list.memList[i].memNo + '">'
			 								   + '<button type="button" onclick="sendToParent(this);">'
			 								   + '선택하기</button>' + '</td></tr>';
			 					};
			 					for(var i=0; i<(5-list.memList.length); i++){
			 						mainValue += '<tr style="height:35px;"><td colspan="5"></td></tr>';
			 					};
			 					
	 						  	pagingValue += '<button disabled>&lt;</button>&nbsp;&nbsp;'
					              			 + '<button disabled>1</button>&nbsp;&nbsp;'
					              			 + '<button disabled>&gt;</button>';
			 				}else{//전체 길이가 5보다 크면 !!! paging생기고 동적으로 돌려줘야해
			 					
			 					for(var i in list.memList){ // 5개 미만으로 조회한것 반복문으로 생성
				 					mainValue += '<tr><td>' + list.memList[i].department + '</td><td>'
				 					           + list.memList[i].rank + '</td><td>'
				 					           + list.memList[i].memName + '</td><td>'
			 								   + list.memList[i].memId
			 								   + '</td><td><input type="hidden" value="'
			 								   + list.memList[i].memNo + '">'
			 								   + '<button type="button" onclick="sendToParent(this);">'
			 								   + '선택하기</button>' + '</td></tr>';
			 					};
			 					for(var i=0; i<(5-list.memList.length); i++){// 5개 행 채우기 위한 용도
			 						mainValue += '<tr style="height:35px;"><td colspan="5"></td></tr>';
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
								  			pagingValue += '<button type="button" onclick="openRankSelect('
										  				 + "'" + keyword + "'," + i + ');">' + i + '</button>&nbsp;&nbsp;';
								  		}	
									};	 						  
							  		pagingValue += '<button onclick="openRankSelect('
							  			 + "'" + keyword + "'" + ',' + (list.pi.currentPage + 1) + ');">&gt;</button>';	
									// 여기 까지가 정상적으로 작동하는 구간.
								}else if(list.pi.currentPage == list.pi.endPage){//2페이지 이상이고 마지막 페이지일때
		 						  	pagingValue += '<button onclick="openRankSelect('
		 						  		 + "'" + keyword + "'" + ','
						  			     + (list.pi.currentPage - 1) + ');">&lt;</button>&nbsp;&nbsp;';
								  	for(var i=1; i<=list.pi.endPage; i++){
								  		if(i == list.pi.currentPage){// 요청한 페이지랑 현재페이지 동일할경우
								  			pagingValue += '<button id="dis-btn" disabled>'
								  			             + list.pi.currentPage + '</button>&nbsp;&nbsp;';
								  		}else{// 요청한 페이지랑 다른 경우 
								  			pagingValue += '<button onclick="openRankSelect('
								  						 + "'" + keyword + "',"  + i + ');">' + i + '</button>&nbsp;&nbsp;';
								  		};		     
									}
		 						  	pagingValue += '<button disabled>&gt;</button>';
								}else{//3페이지 이상이고 가운데 껴있을때 
		 						  	pagingValue += '<button onclick="openRankSelect('
		 						  				 + "'" + keyword + "'" + ','
		 						  			     + (list.pi.currentPage - 1) + ');">&lt;</button>&nbsp;&nbsp;';
		 						  	for(var i=1; i<=list.pi.endPage; i++){
		 						  		if(i == list.pi.currentPage){// 요청한 페이지랑 현재페이지 동일할경우
		 						  			pagingValue += '<button id="dis-btn" disabled>'
		 						  			             + list.pi.currentPage + '</button>&nbsp;&nbsp;';
		 						  		}else{// 요청한 페이지랑 다른 경우 
		 						  			pagingValue += '<button onclick="openRankSelect('
		 						  						 + "'" + keyword + "'," + i + ');">' + i + '</button>&nbsp;&nbsp;';
		 						  		}		     
									};	 						  
	 						  		pagingValue += '<button onclick="openRankSelect('
	 						  			 + "'" + keyword + "'," + (list.pi.currentPage + 1) + ');">&gt;</button>';		     
			 					}
			 					// 페이징 처리 끝
			 				}
			 			}else{//조회결과가 없을때 
			 				mainValue += '<tr style="color:red; height:175px;"><th colspan="5">'
			 						   + '<br>요청하신 조건에 <br><br>해당하는 동료가 존재하지 않습니다. <br><br>'
			 						   + '다시 검색해주세요!'
			 						   + '</th></tr>';
			 						   
 						  pagingValue += '<button disabled>&lt;</button>&nbsp;&nbsp;'
 						               + '<button disabled>1</button>&nbsp;&nbsp;'
 						               + '<button disabled>&gt;</button>';
			 			}
			 			
			 			// 아래는 무조건 성공시 실행되는 코드들 
			 			$("#search-result-area tbody").html(mainValue);
			 			$("#msgPopUpPaging").html(pagingValue);
			 			
			 			// 검색창 이름 초기화 시키기
						$("#msg-mem-name").val("")
		        		$("#msg-mem-name").attr("placeholder", "");
			 		//아래꺼가 success끝나는 곳 	
			 		},error:function(){
			 			console.log("ajax통신 실패");
			 		}//error끝나는곳     		 		
			 	})//ajax끝나는곳 
        	}// 첫번째 유효성검사 끝나는곳 
        }// 부서로 검색하는 스크립트 끝 
        
        
        
        
        // 얘가 진짜 중요하다 값이 총 3개를 넘기기에 잘보고 수정해줘야한다. 
        // 얘는 인자값을 하나 더받아줘야한다. !!! 
        // 직급과 부서로 검색하는 스크립트 
        function selectDeptAndRank(deptKeyword, rankKeyword ,page){
			
        	var deptKeyword = $("#deptSelectForChat").val()
        	var rankKeyword = $("#rankSelectForChat").val()
			// 얘는! 따로 조건처리해줄 필요가없다. 이미 함수에서 한번 걸러진 상태이기 때문이다. 
        	// 페이지를 바꾸더라도! 해당값은 그대로 고정되어있을것이다. 
			
 			// ajax로 값을 가져오면서 paging처리 
		 	$.ajax({
		 		url: "MemListByRank.msg",
		 		data:{deptKeyword: deptKeyword
		 			, rankKeyword: rankKeyword
		 			, currentPage: page
		 		},
		 		success:function(list){
		 			
		 			mainValue= "";
		 			pagingValue = "";
		 			if(list.memList.length != 0){// 조회결과가 있을때
		 				if(list.memList.length<5 && page == null){//5보다 작으니 paging자체가 생기지 않느다.
		 					for(var i in list.memList){
			 					mainValue += '<tr><td>' + list.memList[i].department + '</td><td>'
			 					           + list.memList[i].rank + '</td><td>'
			 					           + list.memList[i].memName + '</td><td>'
		 								   + list.memList[i].memId + '</td><td><input type="hidden" value="'
		 								   + list.memList[i].memNo + '">'
		 								   + '<button type="button" onclick="sendToParent(this);">'
		 								   + '선택하기</button>' + '</td></tr>';
		 					};
		 					for(var i=0; i<(5-list.memList.length); i++){
		 						mainValue += '<tr style="height:35px;"><td colspan="5"></td></tr>';
		 					};
		 					
 						  	pagingValue += '<button disabled>&lt;</button>&nbsp;&nbsp;'
				              			 + '<button disabled>1</button>&nbsp;&nbsp;'
				              			 + '<button disabled>&gt;</button>';
		 				}else{//전체 길이가 5보다 크면 !!! paging생기고 동적으로 돌려줘야해
		 					
		 					for(var i in list.memList){ // 5개 미만으로 조회한것 반복문으로 생성
			 					mainValue += '<tr><td>' + list.memList[i].department + '</td><td>'
			 					           + list.memList[i].rank + '</td><td>'
			 					           + list.memList[i].memName + '</td><td>'
		 								   + list.memList[i].memId
		 								   + '</td><td><input type="hidden" value="'
		 								   + list.memList[i].memNo + '">'
		 								   + '<button type="button" onclick="sendToParent(this);">'
		 								   + '선택하기</button>' + '</td></tr>';
		 					};
		 					for(var i=0; i<(5-list.memList.length); i++){// 5개 행 채우기 위한 용도
		 						mainValue += '<tr style="height:35px;"><td colspan="5"></td></tr>';
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
							  			pagingValue += '<button type="button" onclick="selectDeptAndRank('
									  				 + "'" + deptKeyword + "','" + rankKeyword  + "'," +  i + ');">' + i + '</button>&nbsp;&nbsp;';
							  		}	
								};	 						  
						  		pagingValue += '<button onclick="selectDeptAndRank('
						  			 + "'" + deptKeyword + "','" + rankKeyword + "'," + (list.pi.currentPage + 1) 
						  			 + ');">&gt;</button>';	
								// 여기 까지가 정상적으로 작동하는 구간.
							}else if(list.pi.currentPage == list.pi.endPage){//2페이지 이상이고 마지막 페이지일때
	 						  	pagingValue += '<button onclick="selectDeptAndRank('
	 						  		 + "'" + deptKeyword + "','" + rankKeyword + "',"
					  			     + (list.pi.currentPage - 1) + ');">&lt;</button>&nbsp;&nbsp;';
							  	for(var i=1; i<=list.pi.endPage; i++){
							  		if(i == list.pi.currentPage){// 요청한 페이지랑 현재페이지 동일할경우
							  			pagingValue += '<button id="dis-btn" disabled>'
							  			             + list.pi.currentPage + '</button>&nbsp;&nbsp;';
							  		}else{// 요청한 페이지랑 다른 경우 
							  			pagingValue += '<button onclick="selectDeptAndRank('
							  						 + "'" + deptKeyword + "','" + rankKeyword + "',"  
							  						 + i + ');">' + i + '</button>&nbsp;&nbsp;';
							  		};		     
								}
	 						  	pagingValue += '<button disabled>&gt;</button>';
							}else{//3페이지 이상이고 가운데 껴있을때 
	 						  	pagingValue += '<button onclick="selectDeptAndRank('
	 						  				 + "'" + deptKeyword + "','" + rankKeyword + "',"
	 						  			     + (list.pi.currentPage - 1) + ');">&lt;</button>&nbsp;&nbsp;';
	 						  	for(var i=1; i<=list.pi.endPage; i++){
	 						  		if(i == list.pi.currentPage){// 요청한 페이지랑 현재페이지 동일할경우
	 						  			pagingValue += '<button id="dis-btn" disabled>'
	 						  			             + list.pi.currentPage + '</button>&nbsp;&nbsp;';
	 						  		}else{// 요청한 페이지랑 다른 경우 
	 						  			pagingValue += '<button onclick="selectDeptAndRank('
					  						 + "'" + deptKeyword + "','" + rankKeyword + "',"  
					  						 + i + ');">' + i + '</button>&nbsp;&nbsp;';
	 						  		}		     
								};	 						  
 						  		pagingValue += '<button onclick="selectDeptAndRank('
 						  			 + "'" + deptKeyword + "','" + rankKeyword + "'," 
 						  			 + (list.pi.currentPage + 1) + ');">&gt;</button>';		     
		 					}
		 					// 페이징 처리 끝
		 				}
		 			}else{//조회결과가 없을때 
		 				mainValue += '<tr style="color:red; height:175px;"><th colspan="5">'
		 						   + '<br>요청하신 조건에 <br><br>해당하는 동료가 존재하지 않습니다. <br><br>'
		 						   + '다시 검색해주세요!'
		 						   + '</th></tr>';
		 						   
						  pagingValue += '<button disabled>&lt;</button>&nbsp;&nbsp;'
						               + '<button disabled>1</button>&nbsp;&nbsp;'
						               + '<button disabled>&gt;</button>';
		 			}
		 			
		 			// 아래는 무조건 성공시 실행되는 코드들 
		 			$("#search-result-area tbody").html(mainValue);
		 			$("#msgPopUpPaging").html(pagingValue);
		 			
		 			// 검색창 이름 초기화 시키기
					$("#msg-mem-name").val("")
	        		$("#msg-mem-name").attr("placeholder", "");
		 		//아래꺼가 success끝나는 곳 	
		 		},error:function(){
		 			console.log("ajax통신 실패");
		 		}//error끝나는곳     		 		
		 	})//ajax끝나는곳 
        } // 직급과 부서로 검색하는 스크립트 끝
    </script>


</body>
</html>