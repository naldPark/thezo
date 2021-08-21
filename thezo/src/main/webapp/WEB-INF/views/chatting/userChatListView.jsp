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
<style>
    .unitOfChatRoom{width: 283px; height: 70px;  font-family:'Noto Sans KR', sans-serif; padding-left: 5px; display: flex;  align-items: center; justify-content: space-between; user-select: none;-ms-user-select: none; -moz-user-select: -moz-none;-khtml-user-select: none;-webkit-user-select: none;}
    .unitOfChatRoom:hover{color: orange; cursor: pointer; transform: scale(1.02); background-color: lightcyan;}
    .unitOfChatRoom:hover>.singleProFileImg, .unitOfChatRoom:hover>.multiProFileImg>img{box-shadow: 0 0 3px #fff,0 0 3px #fff, 0 0 3px #fff, 0 0 3px #fff, 0 0 4px rgb(255, 0, 170), 0 0 4px rgb(255, 0, 170), 0 0 4px rgb(255, 0, 170), 0 0 4px rgb(255, 0, 170);}
    .unitOfChatRoom>.singleProFileImg{width: 58px; height: 58px; overflow: hidden; border-radius: 23px; background-color: lightgray;}
    .unitOfChatRoom>div img{width: 58px; height: 58px; object-fit:cover;}
    .unitOfChatRoom>.multiProFileImg{width: 58px; height: 58px; border-radius: none; display: flex; flex-wrap: wrap; justify-content: space-around;}
    .unitOfChatRoom>.multiProFileImg>img{width:48%; height: 48%; object-fit: cover; border-radius: 10px;}
    .unitOfChatRoom>div:nth-child(2){width: 185px; height: 50px; display: flex; flex-wrap: wrap; padding-left: 13px; margin-right: 30px; align-items: center;}
    .unitOfChatRoom>div:nth-child(2)>p{font-weight: bold; margin: 0px; display: inline-block;
    	max-width: 120px;
    	text-overflow:ellipsis;
		white-space:nowrap; 
		overflow:hidden;
    }
    .unitOfChatRoom>div:nth-child(2)>span:nth-child(2){color: darkgray; font-size: 13px; margin-left: 6px; transform: translateY(-2px);}
    .unitOfChatRoom>div:nth-child(2)>span:last-child{width: 185px;color: darkgray; font-size: 14px;
        text-overflow:ellipsis;
		white-space:nowrap; 
		overflow:hidden;
    }
    .unitOfChatRoom>div:nth-child(3){width: 64px; height: 50px; right: 4px; position: absolute; display: flex; flex-direction: column; align-items: flex-end; justify-content: space-between;}
    .unitOfChatRoom>div:nth-child(3)>span{color: rgb(60, 60, 60); font-size: 11px; font-weight: bold;}
    .unitOfChatRoom>div:nth-child(3)>div{width: 20px; height: 20px; color: white; font-size: 14px; text-align: center; line-height: 19px; border-radius: 50%; margin-bottom: 3px; background-color: rgb(241,196,15);}
</style>
</head>
<body>
    <script>
    	// 채팅 리스트 조회해오는 함수인데 !!! 
    	// 페이지 로딩시 1번  -> 채팅방에서 나갈때 1번 -> 매번 채팅 창 들어올때마다 1번씩 읽어오게 하면 된다!!!  	
    	function showMyChatList(){
    		//오직 나의 사원 번호 하나만 가지고 싸그리 가져오기 
        	$.ajax({
		 		url:"chatList.cht",
				data:{myMemNo : ${ loginUser.memNo }
            	},
		 		success:function(list){
		 			//has many구조에서 값 뽑는법 간단 하다 Json 형태라서 index와 .으로 접근해주면된다.
		 			//console.log(list);
		 			//console.log(list[0]);
		 			//console.log(list[0].roomNo);
		 			//console.log(list[0].memList);
		 			//console.log(list[0].memList[0].memNo);
		 			var value ='';
		 			for(var i in list){		 		
		 				// 먼저 조건 검사로다가 얘가 group_status가 p 인지 G인지 조건검사를 해준다. 
		 				// 그리고 잊지 말아야할게 unreadcount가 99개가 넘어가면 99로 출력되게 해줘야한다. 
		 				if(list[i].groupStatus == 'P'){// 개인 채팅방인 경우 
			 				value += '<div class="unitOfChatRoom" ondblclick="ShowChatRoomByRoomNo('
			 					   + list[i].roomNo
			 					   + ",'" + 'P' + "'" + ');">'
			 					   + '<div class="singleProFileImg"><img src="'
			 					   + (list[i].memList[0].path == null ? "resources/images/basicProfile.png" : list[i].memList[0].path)
			 					   + '"></div><div><p>'
			 					   + list[i].roomName
			 					   + '</p><span></span><br><span id="room-for-lastchat'
			 					   + list[i].roomNo
			 					   + '">'
			 					   + (list[i].lastChatContent == null ? "새로운 채팅방이에요!" : list[i].lastChatContent)
			 					   + '</span></div><div><span>'
			 					   + (list[i].lastChatDate == null ? "" : list[i].lastChatDate)
			 					   + '</span>';
			 					   if(list[i].unreadChatCount == 0 && list[i].lastChatDate == null){ //새로 방만들었을 경우 
			 						   value +='<div style="background-color:pink; color:red; font-weight:bolder;">N</div>';
			 					   }else if(list[i].unreadChatCount == 0 ){//읽지않은 글이 없을때 ! 
			 						   value += '<div style="background-color:inherit;"></div>'
			 					   }else{//읽지 않은 글이 있을때
			 						   value +='<div>'
				 					   + (list[i].unreadChatCount > 100 ? "99" : list[i].unreadChatCount)
				 					   + '</div>';
			 					   }
			 					   value += '</div></div>';
		 				}else{//단체 채팅 방인 경우 
			 				value += '<div class="unitOfChatRoom" ondblclick="ShowChatRoomByRoomNo('
			 					   + list[i].roomNo
			 					   + ",'" + 'G' + "'" + ');">'
			 					   + '<div class="multiProFileImg">';
			 					   //여기서 for문 돌려줘야해
			 					   if(list[i].memList.length<4){
				 					   for(var j=0; j<list[i].memList.length; j++){
				 						   value += '<img src="'
				 						          + (list[i].memList[j].path == null ? "resources/images/basicProfile.png" : list[i].memList[j].path)
				 						          + '">';
				 					   }
				 					   for(var j=0; j<(4-list[i].memList.length); j++){
				 						   value += '<img src="resources/images/basicProfile.png">';
				 					   }
			 						   
			 					   }else{
				 					   for(var j=0; j<4; j++){
				 						   value += '<img src="'
				 						          + (list[i].memList[j].path == null ? "resources/images/basicProfile.png" : list[i].memList[j].path)
				 						          + '">';
				 					   }
			 					   }
			 			    value += '</div><div><p>'
			 					   + list[i].roomName
			 					   + '</p><span>' 
			 					   + (list[i].memList.length + 1) 
			 					   + '</span><br><span id="room-for-lastchat'
			 					   + list[i].roomNo
			 					   + '">'
			 					   + (list[i].lastChatContent == null ? "새로운 채팅방이에요!" : list[i].lastChatContent)
			 					   + '</span></div><div><span>'
			 					   + (list[i].lastChatDate == null ? "" : list[i].lastChatDate)
			 					   + '</span>';
			 					   if(list[i].unreadChatCount == 0 && list[i].lastChatDate == null){ //새로 방만들었을 경우 
			 						   value +='<div style="background-color:pink; color:red; font-weight:bolder;">N</div>';
			 					   }else if(list[i].unreadChatCount == 0 ){//읽지않은 글이 없을때 ! 
			 						   value += '<div style="background-color:inherit;"></div>'
			 					   }else{//읽지 않은 글이 있을때
			 						   value +='<div>'
				 					   + (list[i].unreadChatCount > 100 ? "99" : list[i].unreadChatCount)
				 					   + '</div>';
			 					   }
			 					   value += '</div></div>';
			 				}
			 			}	
		 			$("#my-chat-list-area").html(value);
					totalUnreadCount();// 읽지 않는 채팅 전채갯수 뿌려주는것

		 		},error:function(){
		 			console.log("ajax통신 실패");
		 		}				
		 	})
    	}
    
        function totalUnreadCount(){
			// 내가 채팅을 치고있든 아니든 상관없이 ! unread_count 총갯수 구해서 뿌려준 Ajax
			$.ajax({
		 		url:"totalUnreadCount.cht",
				data:{memNo : ${ loginUser.memNo }},
		 		success:function(totalUnreadCount){
		 			// 여기서 요소들 마구 선택해서 update 처리해줘야한다. 
		 			//console.log(totalUnreadCount);
		 			
		 			if(totalUnreadCount > 99){
			 			$(".mainChatUnreadCount").html("99..건 ");
			 			$("#notifyNewChat").show();

			 			$(".chatUnreadCount").css("visibility", "visible");
			 			$(".chatUnreadCount").html("99..");
			 			
		 				
		 			}else if(totalUnreadCount > 0){
			 			$(".mainChatUnreadCount").html(totalUnreadCount + "건");
			 			$("#notifyNewChat").show();

			 			$(".chatUnreadCount").css("visibility", "visible");
			 			$(".chatUnreadCount").html(totalUnreadCount);
		 		
		 			}else{
			 			$(".mainChatUnreadCount").html("");
			 			$("#notifyNewChat").hide();
			 			
			 			$(".chatUnreadCount").html("");
			 			$(".chatUnreadCount").css("visibility", "hidden");
		 			}
		 			
		 		},error:function(){
		 			console.log("ajax통신 실패");
		 		}				
		 	});
        }
    	
    	$(function(){
    		showMyChatList();
    		totalUnreadCount()
    	})
    </script>
    
    <div id="my-chat-list-area">
    </div>
    
</body>
</html>