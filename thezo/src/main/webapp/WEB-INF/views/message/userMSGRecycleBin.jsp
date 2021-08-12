<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!-- @Author Jaewon.s -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="Jaewon.s">
<title>Insert title here</title>
<style>
    /* 버튼 부분 */
    .recycle-bin-btn-area{width: 284px; height: 32px; padding: 3px 0px 0px 3px; border-bottom: 1px solid rgb(204,204,204); position: fixed; display: flex; justify-content: space-between; background-color: white;}
    .recycle-bin-btn-area>div>button, .recycle-bin-btn-area>button{height: 26px; color: white; font-size: 12px; font-weight: bold; border: none; border-radius: 3px;}
    .recycle-bin-btn-area>div>button{width: 60px;}
    .recycle-bin-btn-area>div>button:first-child{padding: 0px; background-color: rgb(236,112,99);}
    .recycle-bin-btn-area>div>button:last-child{background-color: rgb(138,211,169);}
    .recycle-bin-btn-area>button{width: 90px; padding: 0px; background-color: rgb(188,144,206);}
    
    /* 몸통 영역 */
    .recycle-bin-content-area{margin-top: 32px;}
    #recycle-bin-msg-table, #empty-recycle-msg-table{font-size: 11.5px; text-align: center; letter-spacing: -0.8px; border-top: 3px solid rgb(204,204,204); border-bottom: 2px solid rgb(204,204,204);}
    #recycle-bin-msg-table>thead>tr, #empty-recycle-msg-table>thead>tr{height: 35px; font-size: 11.5px; border-bottom: 1px solid rgb(204,204,204); background-color: rgb(234,234,234);}
    #recycle-bin-msg-table>tbody>tr, #empty-recycle-msg-table>tbody>tr{height: 30px; line-height: 1; border-bottom: 1px solid rgb(204,204,204);}
    #recycle-bin-msg-table>tbody>tr:hover{cursor: pointer; background-color: rgb(252,232,200);}
    #recycle-bin-msg-table>thead>tr>th, #recycle-bin-msg-table>tbody>tr>td, #empty-recycle-msg-table>thead>tr>th, #empty-recycle-msg-table>tbody>tr>td  {vertical-align: middle; padding: 0px; border-bottom: none;}
    #recycle-bin-msg-table input{width: 20px; height: 20px;}

    /* 신고리스트 넘어가는 버튼 영역*/
    .report-list-area{display: none; margin-top: 32px;}
    .report-span{font-size: 16px; font-weight: bold; letter-spacing: -0.8px; margin-right: 65px;}
    .report-header-btn{display: none;}

    /* 신고 리스트 영역 스타일 */
    .user-report-content{margin-top: 32px;}
    #user-report-list-table, #empty-user-report-list-table{font-size: 11.5px; text-align: center; letter-spacing: -0.8px; border-top: 3px solid rgb(204,204,204); border-bottom: 2px solid rgb(204,204,204);}
    #user-report-list-table>thead>tr, #empty-user-report-list-table>thead>tr{height: 35px; font-size: 11.5px; border-bottom: 1px solid rgb(204,204,204); background-color: rgb(234,234,234);}
    #user-report-list-table>tbody>tr, #empty-user-report-list-table>tbody>tr{height: 30px; line-height: 1; border-bottom: 1px solid rgb(204,204,204);}
    #user-report-list-table>tbody>tr:hover{cursor: pointer; background-color: rgb(252,232,200);} 
    #user-report-list-table>thead>tr>th, #user-report-list-table>tbody>tr>td, #empty-user-report-list-table>thead>tr>th, #empty-user-report-list-table>tbody>tr>td  {padding: 0px; border-bottom: none; vertical-align: middle;}
    #user-report-list-table input{width: 20px; height: 20px; padding: 0px;}
</style>
</head>
<body>
	<script>
		// 휴지통 받은 쪽지 목록 
		function showRcRecycleBin(){				
		 	$.ajax({
		 		url:"selectRcRbList.msg",
				data:{memNo: "${sessionScope.loginUser.memNo}"},
		 		success:function(receiveList){

		 			var value ="";
		 			if(receiveList.length != 0){
			 			for(var i in receiveList){
			 				value += '<tr onclick="openDetailMSG('
			 					   + receiveList[i].msgNo	
			 				       + ",'rrb');" + '">'
			 				       + '<td onclick="event.cancelBubble=true">' 
			 				       + '<input type="checkbox" name="tossNo" value="'
			 				       + receiveList[i].msgNo
			 				       + ',rm"></td><td>'
			 				       + receiveList[i].senderNameAndRank
			 				       + '</td><td>'
			 				       + receiveList[i].msgStatus
			 				       + '</td><td>'
			 				       + receiveList[i].contentStatus
			 				       + '</td><td>'
			 				       + receiveList[i].createDate
			 				       + '</td></tr>';
			 			}
		 			}else{
		 				value += '<tr><td colspan="5">휴지통에 받은 쪽지가 없습니다!</td></tr>';
		 			}
		 			$("#for-rb-receive-checkbox").html(value);
		 	        $("#rrbSelectAllCheckBox").prop("checked", false);
		 		},error:function(){
		 			console.log("ajax통신 실패");
		 		}				
		 	})		 	
		}
		// 휴지통 보낸 쪽지 목록 
		function showStRecycleBin(){				
		 	$.ajax({
		 		url:"selectStRbList.msg",
				data:{memNo: "${sessionScope.loginUser.memNo}"},
		 		success:function(sentList){
		 			var value ="";
		 			if(sentList.length != 0){
			 			for(var i in sentList){
			 				value += '<tr onclick="openDetailMSG('
			 					   + sentList[i].msgNo	
			 				       + ",'srb');" + '">'
			 				       + '<td onclick="event.cancelBubble=true">' 
			 				       + '<input type="checkbox" name="tossNo" value="'
			 				       + sentList[i].msgNo
			 				       + ',sm"></td><td>'
			 				       + sentList[i].recipientNameAndRank
			 				       + '</td><td>'
			 				       + sentList[i].msgStatus
			 				       + '</td><td>'
			 				       + sentList[i].contentStatus
			 				       + '</td><td>'
			 				       + sentList[i].createDate
			 				       + '</td></tr>';
			 			}
		 			}else{
		 				value += '<tr><td colspan="5">휴지통에 보낸 쪽지가 없습니다!</td></tr>';
		 			}
			 			$("#for-rb-sent-checkbox").html(value);
			 	        $("#srbSelectAllCheckBox").prop("checked", false);
		 		},error:function(){
		 			console.log("ajax통신 실패");
		 		}				
		 	})		 	
		}
		
		$(function(){		
			showRcRecycleBin();
			showStRecycleBin();
		})
	</script>

    <div class="recycle-bin-btn-area">
        <div>
            <button type="button" class="recycle-bin-del" onclick="openRecycleBinDelete();">영구 삭제</button>
            <button type="button" class="recycle-bin-restore" onclick="openRecycleBinResorte();">복구</button>
        </div>
        <span class="report-header-btn report-span">※ 신고 처리 내역</span>
        <button type="button" class="report-log-btn" onclick="moveToReportListArea();">신고 처리 내역</button>
        <button type="button" class="report-header-btn" onclick="movebackToRecycleBin();">뒤로가기</button>
    </div>

    <div class="recycle-bin-content-area w3-animate-opacity">
        <table class="table table-sm" id="recycle-bin-msg-table">
                <thead>
                    <tr>
                        <th colspan="5" style="font-size: 20px; background-color: lightblue; color: white;">휴지통 받은 쪽지 목록 </th>
                    </tr>
                    <tr>
                        <th>
                            <input type="checkbox" id="rrbSelectAllCheckBox" onclick="rrbSelectAll();" >
                        </th>
                        <th>보낸사람</th>
                        <th>상태</th>
                        <th>관련내용</th>
                        <th>받은날자</th>
                    </tr>                
                </thead>
                <tbody id="for-rb-receive-checkbox">
                </tbody>
                <thead>
                    <tr>
                        <th colspan="5" style="font-size: 20px; background-color: lightgreen; color: white; border-top: 3px solid rgb(204,204,204)">휴지통 보낸 쪽지 목록 </th>
                    </tr>
                    <tr>
                        <th>
                            <input type="checkbox" id="srbSelectAllCheckBox" onclick="srbSelectAll();" >
                        </th>
                        <th>받는사람</th>
                        <th>상태</th>
                        <th>관련내용</th>
                        <th>보낸날자</th>
                    </tr>                
                </thead>
                <tbody id="for-rb-sent-checkbox">
                </tbody>
        </table>
    </div>

    <!-- 스크립트 영역 !  -->
    <script>
        function rrbSelectAll() {
            if ($("#rrbSelectAllCheckBox").is(':checked')) {
                $("#for-rb-receive-checkbox input:checkbox[name=tossNo]").prop("checked", true);
            } else {
                $("#for-rb-receive-checkbox input:checkbox[name=tossNo]").prop("checked", false);
            }
        }

        function srbSelectAll() {
            if ($("#srbSelectAllCheckBox").is(':checked')) {
                $("#for-rb-sent-checkbox input:checkbox[name=tossNo]").prop("checked", true);
            } else {
                $(" #for-rb-sent-checkbox input:checkbox[name=tossNo]").prop("checked", false);
            }
        }
    </script>
<%-- ------------------------------------------------------------------------------------------------- --%>
<%-- ------------------------------------------------------------------------------------------------- --%>
<%-- ----------------------------------------신고처리 내역 부분 시작 ------------------------------------------ --%>
   	<script>
    // 휴지통으로 돌아가기 
	    function movebackToRecycleBin(){
	        $(".recycle-bin-content-area").show();
	        $(".recycle-bin-del").show();
	        $(".recycle-bin-restore").show();
	        $(".report-log-btn").show();
	        $(".report-list-area").hide();
	        $(".report-header-btn").hide();
	        reloadReportList();
	    }
   	
	    //  신고처리 내역으로 넘어가기!!! 
	    function moveToReportListArea(){
	        $(".recycle-bin-content-area").hide();
	        $(".recycle-bin-del").hide();
	        $(".recycle-bin-restore").hide();
	        $(".report-log-btn").hide();
	        $(".report-list-area").show();
	        $(".report-header-btn").show();            
	        reloadReportList();
	    }

	    function reloadReportList(){	    	
		 	$.ajax({
		 		url:"selectReportList.msg",
				data:{memNo: ${sessionScope.loginUser.memNo}},
		 		success:function(reportList){
		 			//console.log(reportList);
		 			var value ="";
		 			if(reportList.length != 0){
			 			for(var i in reportList){
			 				value += '<tr onclick="openReportDetail('
			 					   + reportList[i].msgReportNo	
			 				       + ');"><td>'
			 				       + reportList[i].senderNameAndRank
			 				       + '</td><td>'
			 				       + reportList[i].handleStatus
			 				       + '</td><td>'
			 				       + (reportList[i].resultStatus == null? '미정' : reportList[i].resultStatus)
			 				       + '</td><td>'
			 				       + (reportList[i].handleDate =='일전'? "미정" : reportList[i].handleDate)
			 				       + '</td></tr>';
			 			}
		 			}else{
		 				value += '<tr><td colspan="5">신고 내역이 없습니다!</td></tr>';
		 			}
		 			$("#user-report-list-table tbody").html(value);
		 		},error:function(){
		 			console.log("ajax통신 실패");
		 		}				
		 	})		 	
	    }

	</script>
    
    
    <div class="report-list-area w3-animate-opacity">
        <!-- 여기가 !!! 신고쪽 보이게 하는것이다!  -->
    
        <div class="user-report-content">
            <table class="table table-sm" id="user-report-list-table">
                <thead>
                    <tr>
                        <th>보낸사람</th>
                        <th>처리상태</th>
                        <th>조치내용</th>
                        <th>처리날자</th>
                    </tr>                
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
<%-- ----------------------------------------신고처리 내역 부분 끝 ------------------------------------------ --%>
</body>
</html>