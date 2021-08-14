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
    #chatting-outer{width: 300px; height: 470px; padding: 5px 0px; margin: auto; background-color: white;}
    #chatting-navarea{width: 100%; height: 36px; display: flex; justify-content: space-around;}
    #chatting-navarea>div{width: 48%; height: 100%; color: rgb(51,51,51); font-size: 15px; font-weight: bold; font-family:'Noto Sans KR', sans-serif; text-align: center; line-height: 36px; border-radius: 2px; background-color: rgb(224,224,224);}
    #chatting-navarea>div:hover{cursor: pointer; transform: scale(1.02); border: 1px solid tomato;} 
    #colleague-area-page, #chatting-list-area-page{width: 100%; height:424px; padding: 0px 4px 0px 4px; overflow-y: scroll; position: relative;}
    #chatting-navarea .colleague-area{color: rgb(241,196,15); font-size: 22px; background-color: rgb(56,77,97);}
    #chatting-navarea .chatting-list-area{background-color: rgb(224,224,224);}
    #chatting-navarea .chatting-list-area>i{margin-top: 5px; font-size: 24px; transform: scaleY(1.1);}
    #colleague-area-page::-webkit-scrollbar, #chatting-list-area-page::-webkit-scrollbar{width: 10px; display: block;}
    #colleague-area-page::-webkit-scrollbar-thumb, #chatting-list-area-page::-webkit-scrollbar-thumb{border: 2px solid transparent; border-radius: 5px; background-clip: padding-box; background-color: rgb(41,128,185);}
    #colleague-area-page::-webkit-scrollbar-track, #chatting-list-area-page::-webkit-scrollbar-track{border-radius: 5px; box-shadow: inset 0px 0px 5px white; background-color: rgb(215, 238, 247);}    
</style>
</head>
<body>
    <div id="chatting-outer">
        <div id="chatting-navarea">
            <div class="colleague-area" onclick="moveToColleague();">
                <i class="far fa-user"></i>
            </div>
            <div class="chatting-list-area" onclick="moveTochatListArea();">
                <i class="far fa-comments"></i>
            </div>
        </div>  
        <!-- 보여질 영역 -->
        <div id="colleague-area-page" class="w3-animate-opacity">
            <jsp:include page="../chatting/userColleagueListView.jsp"/>
        </div>
        <div id="chatting-list-area-page" class="w3-animate-opacity" style="display: none;">
            <jsp:include page="../chatting/userChatListView.jsp"/>
        </div>
    </div>
    <!-- 채팅방 하나면 된다 여기서 조건 검사로 싸그리 해결한다. 복잡도는 늘어나지만 코드가 짧아진다. -->
    <div id="open-chat-Room" class="w3-animate-opacity" style="display: none;">
        <jsp:include page="../chatting/userChatRoom.jsp"/>
    </div>

    <script>
        function moveToColleague(){
            $("#colleague-area-page").show();
            $("#chatting-list-area-page").hide();
            $(".colleague-area").css("color","rgb(241,196,15)").css("background","rgb(56,77,97)");
            $(".chatting-list-area").css("color","rgb(51,51,51)").css("background","rgb(224,224,224)");
        }

        function moveTochatListArea(){
            $("#chatting-list-area-page").show();
            $("#colleague-area-page").hide();
            $(".chatting-list-area").css("color","rgb(241,196,15)").css("background","rgb(56,77,97)");
            $(".colleague-area").css("color","rgb(51,51,51)").css("background","rgb(224,224,224)");
            showMyChatList();
        }
    </script>

<%-- -------------------------더블클릭시 채팅방으로 이동하는 영역 시작 ------------------------------------------------%>
    <script>
        // 채팅 방과 접속 시키고 해당 방으로 이동 시키는 함수 
        function clickConnectChatRoom(coMemNo){
        	// 동료창에서 채팅방으로 넘어가는 경우 
          	$.ajax({
		 		url:"checkExistRoom.cht",
				data:{myMemNo : ${ loginUser.memNo }
          		 	, coMemNo : coMemNo
            	},
		 		success:function(result){
		 			if(result != null && result > 0){// 이미 방이 존재하는 경우 
		 				//console.log("이미 방이 존재함 방번호 :" + result);
		 				//여기서 이제 해당 방번호로 이동해주면되!
		 				ShowChatRoomByRoomNo(result, 'P');
		 			}else{// 방이 존재하지 않는 경우 
		 				// 방이 존재하지 않으니 방을 만들고 chat_connect까지도 만들어주자
		            	$.ajax({
		 			 		url:"makeRoomAndChatConnect.cht",
		 					data:{myMemNo : ${ loginUser.memNo }
		            		 	, coMemNo : coMemNo
		 	            	},
		 			 		success:function(result){
		 			 			if(result>0){
			 			 			//console.log("방 접속 싹다 만들어짐 ");
					 				//console.log("가져온 방번호 :" + result);
					 				ShowChatRoomByRoomNo(result, 'P');
		 			 			}else{
		 			 				alert("채팅방에 입장하지 못하였습니다. 개발자에게 문의해주세요!");
		 			 			}
		 			 		},error:function(){
		 			 			console.log("ajax통신 실패");
		 			 		}				
		 			 	})
		 			}
		 		},error:function(){
		 			console.log("ajax통신 실패");
		 		}				
		 	})
        } 
    </script>
<%-- -------------------------더블클릭시 채팅방으로 이동하는 영역 끝 ------------------------------------------------%>   

</body>
</html>