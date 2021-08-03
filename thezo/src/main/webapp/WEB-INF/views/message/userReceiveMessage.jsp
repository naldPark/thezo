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
    .receive-btn-area{width: 284px; height: 32px; padding: 3px 0px 0px 3px; border-bottom: 1px solid rgb(204,204,204); display: flex; position: fixed; justify-content: space-between; background-color: white;}
    .receive-btn-area>div>button, .receive-btn-area>button{height: 26px; color: white; font-size: 12px; font-weight: bold; border: none; border-radius: 3px;}
    .receive-btn-area>div>button{width: 42px;}
    .receive-btn-area>div>button:first-child{background-color: rgb(236,112,99);}
    .receive-btn-area>div>button:last-child{background-color: rgb(188,144,206);}
    .receive-btn-area>button{width: 78px; background-color: rgb(95,160,203);}
    .receive-content-area{margin-top: 32px;}
    #received-msg-table, #empty-received-msg-table{font-size: 11.5px; text-align: center; letter-spacing: -0.8px; border-top: 3px solid rgb(204,204,204); border-bottom: 2px solid rgb(204,204,204);}
    #received-msg-table>thead>tr, #empty-received-msg-table>thead>tr{height: 35px; font-size: 11.5px; border-bottom: 1px solid rgb(204,204,204); background-color: rgb(234,234,234);}
    #received-msg-table>tbody>tr, #empty-received-msg-table>tbody>tr{height: 30px; line-height: 1; border-bottom: 1px solid rgb(204,204,204);}
    #received-msg-table>tbody>tr:hover{cursor: pointer; background-color: rgb(252,232,200);}
    #received-msg-table>thead>tr>th, #received-msg-table>tbody>tr>td, #empty-received-msg-table>thead>tr>th, #empty-received-msg-table>tbody>tr>td  {padding: 0px; border-bottom: none; vertical-align: middle;}
    #received-msg-table input{width: 20px; height: 20px; padding: 0px;}
</style>
</head>
<body>
	<script>
		function showRcMsg(){				
		 	$.ajax({
		 		url:"selectReceiveList.msg",
				data:{memNo: "${sessionScope.loginUser.memNo}"},
		 		success:function(receiveList){

		 			var value ="";
		 			if(receiveList.length != 0){
			 			for(var i in receiveList){
			 				value += '<tr onclick="openDetailMSG('
			 					   + receiveList[i].msgNo	
			 				       + ",'r');" + '">'
			 				       + '<td onclick="event.cancelBubble=true">' 
			 				       + '<input type="checkbox" name="tossNo" value="'
			 				       + receiveList[i].msgNo
			 				       + '"></td><td>'
			 				       + receiveList[i].senderNameAndRank
			 				       + '</td><td>'
			 				       + receiveList[i].msgStatus
			 				       + '</td><td>'
			 				       + receiveList[i].contentStatus
			 				       + '</td><td>'
			 				       + receiveList[i].createDate
			 				       + '</td></tr>';
			 			}
			 			$("#received-msg-table tbody").html(value);
		 			}else{
		 				value += '<table class="table table-sm" id="empty-received-msg-table">'
		 				       + '<thead><tr><th></th>'
                    		   + '<th>보낸사람</th><th>상태</th><th>관련내용</th><th>받은날자</th>'
                    		   + '</tr></thead><tbody><tr><td colspan="5">받은 쪽지가 없습니다!</td>'
                    		   + '</tr></tbody></table>';
		                $(".receive-content-area").html(value);
		 			}
		 		},error:function(){
		 			console.log("ajax통신 실패");
		 		}				
		 	})		 	
		}
		
		$(function(){		
			showRcMsg();
		})
	</script>


    <div class="receive-btn-area">
        <div>
            <button type="button" class="receive-del" onclick="openReceivedMsgDelete();">삭제</button>
            <button type="button" class="receive-report" onclick="openReceivedMsgReport();">신고</button>
        </div>
        <button type="button" class="sendign-MSG" onclick="openReplyAndSendMsg();">쪽지 보내기</button>
    </div>
    
    <div class="receive-content-area">
        <table class="table table-sm" id="received-msg-table">
            <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="rSelectAllCheckBox" onclick="rSelectAll();" >
                    </th>
                    <th>보낸사람</th>
                    <th>상태</th>
                    <th>관련내용</th>
                    <th>받은날자</th>
                </tr>                
            </thead>
            <tbody>
                <!-- 쪽지번호와 받은 쪽지인지 넘긴다. -->
                <tr onclick="openDetailMSG(1,'r');">
                    <td onclick="event.cancelBubble=true">
                        <!-- 체크박스 value값은 !!! 쪽지번호다!!!  -->
                        <input type="checkbox" name="tossNo" value="1">
                    </td>
                    <td>이땡떙 대리</td>
                    <!-- 여기서는 css로다가 하나 스타일 뺴놓고 만약 ajax해왔을떄 긴급이면 해당 td에다가 class부여하는것으로 진행 -->
                    <td>긴급</td>
                    <td>회의</td>
                    <td>11:10</td>
                </tr>
             </tbody>
        </table>
    </div>

    <script>
        function rSelectAll() {
            if ($("#rSelectAllCheckBox").is(':checked')) {
                $("#received-msg-table input:checkbox[name=tossNo]").prop("checked", true);
            } else {
                $(" #received-msg-table input:checkbox[name=tossNo]").prop("checked", false);
            }
        }
    </script>

</body>
</html>