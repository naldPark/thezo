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
    .sent-btn-area{width: 284px; height: 32px; padding: 3px 0px 0px 3px; border-bottom: 1px solid rgb(204,204,204); display: flex; position: fixed; justify-content: space-between; background-color: white;}
    .sent-btn-area>div>button, .sent-btn-area>button{height: 26px; color: white; font-size: 12px; font-weight: bold; border: none; border-radius: 3px;}
    .sent-btn-area>div>button{width: 42px;}
    .sent-btn-area>div>button:first-child{background-color: rgb(236,112,99);}
    .sent-content-area{margin-top: 32px;}
    #sent-msg-table{font-size: 11.5px; text-align: center; letter-spacing: -0.8px; border-top: 3px solid rgb(204,204,204); border-bottom: 2px solid rgb(204,204,204); }
    #sent-msg-table>thead>tr{height: 35px; font-size: 11.5px; border-bottom: 1px solid rgb(204,204,204); background-color: rgb(234,234,234);}
    #sent-msg-table>tbody>tr{height: 30px; line-height: 1; border-bottom: 1px solid rgb(204,204,204);}
    #sent-msg-table>tbody>tr:hover{cursor: pointer; background-color: rgb(252,232,200);}
    #sent-msg-table>thead>tr>th, #sent-msg-table>tbody>tr>td{padding: 0px; border-bottom: none; vertical-align: middle;}
    #sent-msg-table input{width: 20px; height: 20px;}
</style>
</head>
<body>
	<script>
		function showStMsg(){				
		 	$.ajax({
		 		url:"selectSentList.msg",
				data:{memNo: "${sessionScope.loginUser.memNo}"},
		 		success:function(sentList){
		 			var value ="";
		 			if(sentList.length != 0){
			 			for(var i in sentList){
			 				value += '<tr onclick="openDetailMSG('
			 					   + sentList[i].msgNo	
			 				       + ",'s');" + '">'
			 				       + '<td onclick="event.cancelBubble=true">' 
			 				       + '<input type="checkbox" name="tossNo" value="'
			 				       + sentList[i].msgNo
			 				       + '"></td><td>';
			 				       if(sentList[i].recipientNo == ${sessionScope.loginUser.memNo}){
				 				   		value += '내게 쓴 쪽지'
			 				       }else{
			 				    	    value +=  sentList[i].recipientNameAndRank 
			 				       };
			 				 value +=  '</td><td>'
			 				       + sentList[i].msgStatus
			 				       + '</td><td>'
			 				       + sentList[i].contentStatus
			 				       + '</td><td>'
			 				       + sentList[i].createDate
			 				       + '</td></tr>';
			 			}
			 			$("#sent-msg-table tbody").html(value);
		 			}else{
		 				value += '<tr><td colspan="5">보낸 쪽지가 없습니다!</td></tr>';
		                $("#sent-msg-table tbody").html(value);
		 			}
		 	        $("#sSelectAllCheckBox").prop("checked", false)
		 		},error:function(){
		 			console.log("ajax통신 실패");
		 		}				
		 	})		 	
		}
		
		$(function(){		
			showStMsg();
		})
	</script>
	


    <div class="sent-btn-area">
        <div>
            <button type="button" class="sent-del" onclick="openSentMsgDelete();">삭제</button>
        </div>
    </div>
    
    <div class="sent-content-area">
        <table class="table table-sm" id="sent-msg-table">
            <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="sSelectAllCheckBox" onclick="sSelectAll();" >
                    </th>
                    <th>받는사람</th>
                    <th>상태</th>
                    <th>관련내용</th>
                    <th>보낸날자</th>
                </tr>                
            </thead>
            <tbody>
                <!-- 쪽지번호를 넘긴다. -->
                <tr onclick="openDetailMSG(1,'s');">
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
        function sSelectAll() {
            if ($("#sSelectAllCheckBox").is(':checked')) {
                $("#sent-msg-table input:checkbox[name=tossNo]").prop("checked", true);
            } else {
                $(" #sent-msg-table input:checkbox[name=tossNo]").prop("checked", false);
            }
        }
    </script>

</body>
</html>