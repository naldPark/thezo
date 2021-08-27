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
<!--  sockjs CDN으로다가 해당 cdn이 있어야 이 자바스크립트 안에있는 메소드 가져다 쓸수가 있다.-->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>

<style>
    #chat-room{width: 300px; height: 470px;margin: auto; background-color: rgb(213,214,228);}
    .personal-chat-header, .group-chat-header{height: 62px; font-family:'Noto Sans KR', sans-serif; padding-left: 5px; margin-top: 5px; display: flex; align-items: center; justify-content: space-between; background-color: rgb(41,128,185);
        user-select: none;
        -ms-user-select: none; 
        -moz-user-select: -moz-none;
        -khtml-user-select: none;
        -webkit-user-select: none;
    }
    #chat-content-body{height: 327px; overflow-y: scroll;}
    #chat-content-body::-webkit-scrollbar{width: 5px; display: block;}
    #chat-content-body::-webkit-scrollbar-thumb{border: 1px solid transparent; background-clip: padding-box; background-color: rgb(41,128,185);}
    #chat-content-body::-webkit-scrollbar-track{border-radius: 5px; box-shadow: inset 0px 0px 5px white; background-color: rgb(215, 238, 247);}    
    /* 여기까지가 layout */

    .personal-chat-header>.chatSingleProFile, .personal-chat-header>.chatMultiProFile{width: 58px; height: 100%;}
    .personal-chat-header>.chatSingleProFile{width: 50px; height: 50px; overflow: hidden; border-radius: 23px; background-color: lightgray;}
    .personal-chat-header>.chatSingleProFile>img{width: 50px; height: 50px; object-fit:cover;}
    .group-chat-header>.chatMultiProFile{background: white; border-radius: 10px; width: 50px; height: 50px; border-radius: none; display: flex; flex-wrap: wrap; justify-content: space-around;}
    .group-chat-header>.chatMultiProFile>img{width:48%; height: 48%; object-fit: cover; border-radius: 10px;}
    .personal-chat-header>.chatSingleProFile>img:hover{cursor: pointer;}
    .personal-chat-header>div:nth-child(2), .group-chat-header>div:nth-child(2){width: 200px; color:white; text-align: left; font-size: 18px; font-weight: bold; padding-left: 20px;
        text-overflow:ellipsis;
		white-space:nowrap; 
		overflow:hidden;
    }
    .group-chat-header>div:nth-child(2)>span{display:inline-block; max-width: 140px; text-overflow:ellipsis; white-space:nowrap;  overflow:hidden; line-height:20px;}
    .group-chat-header>div:nth-child(2)>button{color: white; border: none; outline: none; background: none;}
    .group-chat-header>div:nth-child(2)>button:hover{color: orange;}
    .personal-chat-header>div:nth-child(3), .group-chat-header>div:nth-child(3){width: 40px; height: 100%; display: flex; flex-direction: column;}
    .personal-chat-header>div:nth-child(3)>span, .group-chat-header>div:nth-child(3)>span{width: 100%; height: 50%; color: white; font-size: 20px; text-align: center;}
    .group-chat-header>div:nth-child(3)>span:last-child{font-size: 16px;}
    .personal-chat-header>div:nth-child(3)>span:hover, .group-chat-header>div:nth-child(3)>span:hover{color: orange; cursor: pointer;}
    #chat-typing-area>textarea{width: 82%;height: 100%; font-size: 14px; font-family:'Noto Sans KR', sans-serif; resize: none; padding: 5px; border:none; outline: none;}
    #chat-typing-area>textarea::-webkit-scrollbar{width: 5px; display: block;}
    #chat-typing-area>textarea::-webkit-scrollbar-thumb{border: 1px solid transparent; background-clip: padding-box; background-color: rgb(41,128,185);}
    #chat-typing-area>textarea::-webkit-scrollbar-track{border-radius: 5px; box-shadow: inset 0px 0px 5px white; background-color: rgb(215, 238, 247);}    
    #chat-typing-area{height: 80px; margin:0px 1.5px 1px 1.5px; display: flex; background-color: white;}
    .chat-btn-area{width: 18%; padding-top: 5px; display: flex; flex-direction: column; align-items: center; justify-content: space-around;}
    .chat-btn-area>button{width: 90%; height: 30px; font-size: 14px; text-align: center; border: none; outline: none;}
    .chat-btn-area>button:first-child{color: white; font-weight: bold; border-radius: 5px; background: rgb(41,128,185);}

    /* (시간될때해) 나중에 첨부파일 넣을때 (문제는 얘는 !! form형태가 아니다 그때가서 form형태로 자바스크립트로 묶어서 submit하는 방식으로 해결해야함) */
    .chat-btn-area>button:last-child{width: 28px; height: 28px; color: rgb(41,128,185); font-size: 16px; font-weight: bold; border: 1px solid rgb(41,128,185); border-radius: 12px; margin-bottom: 4px; background: white; visibility: hidden;}

    /* ★ 채팅 몸통 부분이다.  */
    #chat-content-body{padding: 0px 5px;}
    .col-chat-Log-Area, .my-chat-log-area{display: flex; align-items: flex-start; padding-top:7px; padding-bottom: 3px ;}
    .col-chat-Log-Area{justify-content: flex-start;}
    .my-chat-log-area{justify-content: flex-end; padding-right: 5px;}
    .col-chat-log-profile{width: 40px; height: 40px;}
    .col-chat-log-profile>img{width: 100%; height: 100%; object-fit: cover; border-radius: 17px;}    
    .col-chat-log-profile>img:hover{cursor: pointer;}
    .col-chat-log-box{max-width: 192px; padding-left: 15px;}
    .my-chat-log-box{max-width: 200px;}
    .col-chat-log-box>p{margin: 0px ; font-weight: bold; font-size: 15px;}
    .col-chat-log-info, .my-chat-log-info{width: 48px; height: inherit ; align-self: flex-end; margin-bottom: 3px;}
    .col-chat-log-info>p, .my-chat-log-info>p{color: black; font-size: 8px; letter-spacing: -1px; margin-bottom: 0px;}
    .col-chat-log-info>p{transform: translateX(5px);}
    .col-balloon , .my-balloon{min-width: 20px; min-height: 20px; border-radius: 6px; padding-left: 7px; position:relative;}    
    .col-balloon:after ,.my-balloon:after{content:""; top:5px; position:absolute;}
    .col-balloon {padding-right: 3px; background:white;}
    .col-balloon:after {left:-7px; border-top:15px solid white; border-left: 15px solid transparent; border-right: 0px solid transparent; border-bottom: 0px solid transparent;}
    /* 나의 채팅창 색상  */
    .my-balloon {padding-right: 7px; margin-left: 5px; background:rgb(120,167,205);}
    .my-balloon:after {right:-7px; border-top:15px solid rgb(120,167,205); border-left: 0px solid transparent; border-right: 15px solid transparent; border-bottom: 0px solid transparent;}
    .col-balloon>pre, .my-balloon>pre {width: 100%; height: 100%; font-family:'Noto Sans KR', sans-serif; margin: 0px; margin-top: 3px; white-space:pre-wrap; 
		word-break:break-all;
		text-overflow:clip;
        font-size: 14px;
    }
    .notifyChatDay{width: 240px; border-radius:12px; background-color: rgba(0,0,0,0.6); color: orange; font-size: 11px; margin:auto; text-align:center; margin-top: 10px;}
   
</style>
</head>
<body>
    <script>
        // 글자수 제한 스크립트 
	    $(document).ready(function() {
	        $('#writeChatContent').on('keyup', function() {
	            if($(this).val().length > 1300) {
	                $(this).val($(this).val().substring(0, 1300));
	            }
	        });	        
	        
	        $('#writeChatContent').on('keydwon', function() { // 복붙으로 넣을때도 
	            if($(this).val().length > 1300) {
	                $(this).val($(this).val().substring(0, 1300));
	            }
	        });	        
	    });
	    
		// 엔터로 이벤트 실행 하는 동시에 해당 기본기능 막고 ! 오직 shift+enter를 했을떄 개행하게 하는것 
	    function onEnterChange() {
	     if(event.shiftKey && event.keyCode == "13") {
	    	 return false;
	     }else if(event.keyCode == "13"){
	    	 event.preventDefault(); 
	    	 sendMessage();
	         return false;
	     }else
	         return true;
	    }				
        
        // AJAX 재사용을 위한 함수로 오직 채팅 기록만 보이게 하는 함수 
		function showChatlog(roomNo){
            $.ajax({
		 		url:"bringChatInfo.cht",
				data:{roomNo : roomNo
            	},
		 		success:function(list){
		 			var myMemNo = ${loginUser.memNo};
		 			var value='';
		 			if(list.length == 0){
		 				var date = new Date();
		 				var year = date.getFullYear();
		 				var month = (date.getMonth() + 1);
		 				var day = date.getDate();
		 				value += '<div><div class="notifyChatDay">'
		 				       + year + '년 ' + month + '월 ' +  day + '일  채팅을 시작합니다.</div></div>';
		 			}else{
		 				//여기서 이제 for문 돌릴것야 
		 				for(var i in list){
    		 				// 해당 날짜 시작하는 구간 
    		 				value += '<div><div class="notifyChatDay">'
    		 				       + list[i].formattedDate
    		 				       + '</div></div>';
    		 				for(var j in list[i].chatList){
    		 					if(list[i].chatList[j].memNo != myMemNo){// 자신이외의 사람들의 채팅 
    	    		 				value += '<div class="col-chat-Log-Area"><div class="col-chat-log-profile">'
    		 						       + '<img src="'
    		 						       + (list[i].chatList[j].path == null ? "resources/images/basicProfile.png" : list[i].chatList[j].path)
    		 						       + '" onclick="oneClickOpenImage(' + "'" ;
  		 						    value += (list[i].chatList[j].path == null ? "resources/images/basicProfile.png" : list[i].chatList[j].path)		   
    		 						       + "'" + ');">'
    		 						       + '</div>'
    		 						       + '<div class="col-chat-log-box"><p>' + list[i].chatList[j].nameAndRank + '</p>'
    		 						       + '<div class="col-balloon"><pre>' + list[i].chatList[j].chatContent + '</pre></div></div>'
    		 						       + '<div class="col-chat-log-info"><p>' + list[i].chatList[j].chatDate + '</p></div>'
    		 						       +'</div>';
    		 					}else{// 내 채팅 
    		 						value += '<div class="my-chat-log-area"><div class="my-chat-log-info"><p>'
    		 						       + list[i].chatList[j].chatDate
    		 						       + '</p></div><div class="my-chat-log-box"><div class="my-balloon"><pre>'
    		 						       + list[i].chatList[j].chatContent
    		 						       + '</pre></div></div></div>'
    		 					}
    		 					
    		 					if(i == (list.length -1) && j == (list[i].chatList.length -1)){
	    		 					$("#last-chat-mem-no").val(list[i].chatList[j].memNo);       
    		 						$("#last-chat-log-no").val(list[i].chatList[j].chatlogNo);       
    		 						//console.log("마지막 채팅 보낸 사람 번호" + $("#last-chat-mem-no").val());
    		 						//console.log("마지막 채팅 번호" + $("#last-chat-log-no").val());
	    		 					updateLastChat(roomNo, ${ loginUser.memNo } ,list[i].chatList[j].chatlogNo);
    		 					}
    		 					
    		 			        totalUnreadCount(); //채팅방 입장 할때 한번  메인 고쳐주기

    		 				}//안 for문 끝
		 				}//밖 for문  끝
		 			}
		 			$("#chat-content-body").html(value);
					$("#chat-content-body").scrollTop($("#chat-content-body")[0].scrollHeight);

		 		},error:function(){
		 			console.log("ajax통신 실패");
		 		}				
		 	})
		 	// 실시간으로 session에 담긴 방번호 비교를 위해서 한번터 controller호출후에 담기 	        
		 	bringSessRoomNo();
		}
        
		// 내가 페이지를 만들기를 ajax로 만들어서 현재 session에 담긴 roomNo을 넘기기 위한 장치 
	    function bringSessRoomNo(){
            $.ajax({
		 		url:"bringSessRoomNo.cht",
		 		success:function(roomNo){
		 			$("#check-room-member").val(roomNo);
		 		},error:function(){
		 			console.log("ajax통신 실패");
		 		}				
		 	});
	    }
        
        // ★★★★★★★★★ 만약에 ! 방에 들어간다면 !! 소켓 만들어주는 시점은 여기다!  
		// 방에 정보를 보여주며서  입장하는 함수로서  방번호와 방이 단체 채팅방인지 개인 채팅방인지 넘겨서 정보를 가져오는 함수 
	    function ShowChatRoomByRoomNo(roomNo, groupStatus){
	        $("#chatting-outer").hide();
	        $("#open-chat-Room").show();
	        $("#chat-content-body").scrollTop($("#chat-content-body")[0].scrollHeight);//채팅창 맨아래로 내리는 용도 
			// 채팅 목록 방에서 갠톡으로 넘어온 경우 
	        if(groupStatus=='P'){
                $(".personal-chat-header").show();
                $(".group-chat-header").hide();
                $("#inner-room-no-area").val(roomNo);
              	// 개인 챗 정보 가져오는 ajax 
              	// 가지고 올꺼면 2개를 가지고 오는데 담기로는 collection써서 정보와 채팅 기록들 싸그리 가져오는것 진행하자
                $.ajax({
    		 		url:"bringRoomHeader.cht",
    				data:{myMemNo : ${ loginUser.memNo }
              		 	, roomNo : roomNo
                	},
    		 		success:function(roomlist){
    		 			// 한행만 담겨서 오지만 얘는 그래도! ArrayList에 담아서 온다 메소드 하나로 끝내기 위해서 
    		 			$("#inner-chatroom-P-name").html(roomlist[0].roomName)
    		 			$("#inner-chatroom-P-img").attr("src", (roomlist[0].memList[0].path == null ? "resources/images/basicProfile.png" : roomlist[0].memList[0].path));
    		 			$("#inner-chatroom-P-img").attr("onclick", "oneClickOpenImage('"
    		 					+ (roomlist[0].memList[0].path == null ? "resources/images/basicProfile.png" : roomlist[0].memList[0].path)
    		 					+  "');");
    		 			// 방 정보 뿌려주고 
    		 			showChatlog(roomNo);
    		 		},error:function(){
    		 			console.log("ajax통신 실패");
    		 		}				
    		 	})
	        }
	
	        //  넘어온 groupStatus로 갠톡 단톡 구분한다.   
	        if(groupStatus=='G'){
                $(".personal-chat-header").hide();
                $(".group-chat-header").show();
                $("#inner-room-no-area").val(roomNo);
              	// 단체 챗 정보 가져오는 ajax 
              	// 가지고 올꺼면 2개를 가지고 오는데 담기로는 collection써서 정보와 채팅 기록들 싸그리 가져오는것 진행하자
                $.ajax({
    		 		url:"bringRoomHeader.cht",
    				data:{myMemNo : ${ loginUser.memNo }
              		 	, roomNo : roomNo
                	},
    		 		success:function(roomlist){
    		 			//console.log("단톡방 머리부 정보");
    		 			//console.log(roomlist);
    		 			$("#group-chat-room-name").html(roomlist[0].roomName)
    		 			
    		 			var value = '';
    		 			if(roomlist[0].memList.length >= 4){// 방인원이 4명이상인 경우 
							for(var i=0; i<4; i++){
								value += '<img src="'
							          + (roomlist[0].memList[i].path == null ? "resources/images/basicProfile.png" : roomlist[0].memList[i].path)
	 						          + '">';
							}    		 			
    		 			}else{// 방인원이 4명 미만인 경우 
							for(var i in roomlist[0].memList){
								value += '<img src="'
							          + (roomlist[0].memList[i].path == null ? "resources/images/basicProfile.png" : roomlist[0].memList[i].path)
	 						          + '">';
							}    		 			
    		 				for(var i=0; i<(4-roomlist[0].memList.length); i++){
    		 					value += '<img src="resources/images/basicProfile.png">'
    		 				}
    		 			}
    		 			$(".chatMultiProFile").html(value);
    		 			$("#modify-group-Name-btn").attr("onclick", "openCreateGroupChat('cgn'," + roomNo + ");");
    		 			$("#add-group-mem-btn").attr("onclick", "openCreateGroupChat('ga'," + roomNo + ");");
    		 			showChatlog(roomNo);
    		 		},error:function(){
    		 			console.log("ajax통신 실패");
    		 		}				
    		 	})
	        }

	        $("#writeChatContent").val("");
	    }
        
        // 이미 chact_connect에 행은 만들어져있어서 ! 해당 방 입장시 혹은 ! 보낼떄 받을때! 실행을 시켜줘야할 메소드이다. 
        function updateLastChat(roomNo, memNo ,chatlogNo){
            $.ajax({
		 		url:"updateConnLastChat.cht",
				data:{memNo : memNo
          		 	, roomNo : roomNo
          		 	, chatlogNo : chatlogNo
            	},
		 		success:function(result){
		 			//console.log("성공적으로 마지막 채팅 기록함")
		 		},error:function(){
		 			console.log("ajax통신 실패");
		 		}				
		 	})	        	
        }
		
		// ------------------------ ★★★★★★★★★★ 구현해 줘야할 부분 ★★★★★★★★------------------------------------------------------ 
        // 에초에 stomp를 쓰면서 만들었어야 고도화가 가능했는데 지금 내실력과 시간으로는 불가하다. 
        // 야매로라도 가상의 방을 구현행야한다. 
        // 접속한 모든 사람이 몇명일지 모른다 최소 100명 이라고 가정하면 한놈이 채팅 보내면 나머지 99명이 다받아버린다. 
        // 즉 방의 개념이 없는것이다. 해당 방에 있는 인원한테만 쪽지를 보내는 것을 생각을 해줘야하는데 음 .. 어거지로 해놔서 맘에 안든다... 애초에 
        // 전제 조건 자체가 방에 들어가고 나가고가 dom요소가 새로이 조건에 따라서 맞을때 즉 (재로딩되었을때가 기준이다. 즉 페이지 자체를 이같이 나처럼 header에 심으면 어쩔수가없다...)
		// 나중에 다시 공부하자. 
        
	    //★★★★★★★ 소켓 부분 이다 ★★★★★★★★★★★★★★★★
		let sock = new SockJS("http://localhost:8888/thezo/echo/");// 소켓을 생성한것이다. 다른 함수에서도 쓸수 있게 전역변수로 만든것이다. 
		
		// websocket과 연결을 끊고 싶을때 실행하는 메소드 이다. 
		sock.onclose = onClose;		
		
		// 전송했을때. 	    
   		$("#chatSend").click(function() {
			sendMessage(); // 아래의 sendMessage함수 실행하라는것이고   
			$('#writeChatContent').val(''); // 얘는 채팅창 비우라는것이다.
			// 여기서 insert처리가 아니다. handler쪽에서 insert 처리를 곧바로 한다
		});
	
		// 클라이언트가 메시지 전송할때  (소켓으로 보내겠다는 것이다. )
		function sendMessage() {
			if($("#writeChatContent").val().trim() != ''){// 어떤 값이 있을때만 보내기 
				//보내기전에 insert처리를 여기서 해줘야한다. 
				var roomNo = $("#inner-room-no-area").val();
				var chatContent = $("#writeChatContent").val();
				// insert처리하는 동시에 방번호 가져오는 ajax
	            $.ajax({
			 		url:"bringChatlogNo.cht",
					data:{memNo : ${ loginUser.memNo }
	          		 	, roomNo : roomNo
	          		 	, chatContent : chatContent
	            	},
			 		success:function(chatNo){
						//console.log("내가 방금 보낸 chatNo번호" + chatNo);
	 					$("#last-chat-mem-no").val(${ loginUser.memNo });       
						$("#last-chat-log-no").val(chatNo);       
						//console.log("내가 보낸  나의 사람 번호" + $("#last-chat-mem-no").val());
						//console.log("내가보낸 마지막 채팅 번호" + $("#last-chat-log-no").val());
						
						updateLastChat(roomNo, ${ loginUser.memNo } ,chatNo);
						// -----------------------------insert후에 나머지 애들한테 뿌려주라는것 ! 
						// sock에 send라는 메소드를 이용해서 보내라는 것이다.
						//console.log("보낼때 해당방의 roomNO" + $("#inner-room-no-area").val());
						sock.send(roomNo + ',' + chatNo + ',' + chatContent);
			 		},error:function(){
			 			console.log("ajax통신 실패");
			 		}				
			 	});
			}
			// 채팅창 비워주고 스크롤 내려주기 
			$("#writeChatContent").val("");
			$("#writeChatContent").focus();
			$("#chat-content-body").scrollTop($("#chat-content-body")[0].scrollHeight);
		};
		
		//-------------------------------------------------------------------------------------------
		
		sock.onmessage = onMessage;
        // ★★★★ 문자 받을때!!! 읽음 처리하는 메소드를 실행시켜줘야한다.   
		
		// 서버로부터 메시지를 받았을 때 (화면단에 뿌려주는것을 모두 컨트롤 하는것이다)
		function onMessage(msg) {
			var rcChat = msg.data;// 해당 메세지 데이터!가 담긴것이다.
			var rcChatInfo = rcChat.split(",", 7);
			var sessionRN = $("#check-room-member").val();

			if(rcChatInfo[0] != null && sessionRN !=null && rcChatInfo[0] == sessionRN){ // 방에 들어와있는 상태 이다. 
				var value='';
				if(rcChatInfo[2] != ${loginUser.memNo}){// 채팅을 받는 사람들용 화면  
					value += '<div class="col-chat-Log-Area"><div class="col-chat-log-profile">'
					       + '<img src="' + rcChatInfo[3] + '" onclick="oneClickOpenImage(' + "'" ;
				    value += rcChatInfo[3] + "'" + ');">'
					       + '</div>'
					       + '<div class="col-chat-log-box"><p>' + rcChatInfo[4] + '</p>'
					       + '<div class="col-balloon"><pre>' + rcChatInfo[6] + '</pre></div></div>'
					       + '<div class="col-chat-log-info"><p>' + rcChatInfo[5] + '</p></div>'
					       +'</div>';
				}else{//내가 보낸 채팅이 나한테 보여지는 형식 
					value += '<div class="my-chat-log-area"><div class="my-chat-log-info"><p>'
					       + rcChatInfo[5]
					       + '</p></div><div class="my-chat-log-box"><div class="my-balloon"><pre>'
					       + rcChatInfo[6]
					       + '</pre></div></div></div>'
				}
				$("#chat-content-body").append(value); // append로 뿌려줄것
				$("#chat-content-body").scrollTop($("#chat-content-body")[0].scrollHeight); // 스크롤 내려 주기
				//var updateArea = document.getElementById("room-for-lastchat" + rcChatInfo[0]);
				//console.log(document.getElementById("room-for-lastchat" + rcChatInfo[0]));
				
				// 방에 들어와 있는 상태이다. 
				$("#last-chat-mem-no").val(rcChatInfo[2]);       
				$("#last-chat-log-no").val(rcChatInfo[1]);       
				updateLastChat(rcChatInfo[0], ${ loginUser.memNo } ,rcChatInfo[1]);
			}
						
			//document.getElementById("room-for-lastchat" + rcChatInfo[0]).innerHTML = rcChatInfo[5];// 마지막 채팅 보여지게하기
			if((sessionRN == null && rcChatInfo[2] != ${loginUser.memNo}) || (sessionRN != null && rcChatInfo[0] != sessionRN && rcChatInfo[2] != ${loginUser.memNo})){
				// 막약 현재 session에 roomNo이 담겨있지 않거나 혹은 담겨있는데 받은 문자들이 현재 내가 가진 세션의 방번호와 일치 하지 않는다면 
				// 또한 공통 조건이 나의 사원 번호와 보낸 사원 번호가 동일하면 안된다.
				// 방에서 나가 있는 상태 
				// 여기서 현재 나의 chat_connect에서 마지막 읽은 채팅이랑 chat_log 비교해서 읽지않은 갯수 update해주는 ajax 실행해야함 
				$.ajax({
			 		url:"updateUnreadCount.cht",
					data:{memNo : ${ loginUser.memNo }
	          		 	, roomNo : rcChatInfo[0]
	            	},
			 		success:function(result){
			 			if(result>0){
			 				//console.log("제대로 읽지 않은 갯수 올라 갔어!"); 
							showMyChatList();
			 			}
			 		},error:function(){
			 			console.log("ajax통신 실패");
			 		}				
			 	});
			}
		}
        
		// 서버와 연결을 끊었을 때
		function onClose(evt) {
			$("#chat-content-body").append("연결 끊김");
		}
		
		//-----------------------------------------------------------------------------------------
		//-----------------------------------------------------------------------------------------
        // 뒤로가기 페이지 
        function backToChatList(){
            $("#open-chat-Room").hide();
            $("#chatting-outer").show();
            $("#chatting-list-area-page").show();
            $("#colleague-area-page").hide();
            $(".chatting-list-area").css("color","rgb(241,196,15)").css("background","rgb(56,77,97)");
            $(".colleague-area").css("color","rgb(51,51,51)").css("background","rgb(224,224,224)");
            showMyChatList();
            $("#check-room-member").val("");
        }
    </script>

<%------------------------------------------------------------------------------------------------------------------- --%>

    <div id="chat-room">
    	<input type="hidden" id="inner-room-no-area"> 
    	<input type="hidden" id="check-room-member">
    	<input type="hidden" id="last-chat-mem-no">    	
    	<input type="hidden" id="last-chat-log-no">    	
        <!-- 둘중 어떤 채팅 header가 보일지는 자바스크립트로 해결한다.! -->
        <div class="personal-chat-header" style="display: none;">
            <div class="chatSingleProFile">
                <img id="inner-chatroom-P-img" src="" onclick="oneClickOpenImage()">
            </div>
            <div>
                <span id="inner-chatroom-P-name"></span>
            </div>
            <div>
                <span onclick="backToChatList();"><i class="fas fa-reply"></i></span>
            </div>
        </div>
        <div class="group-chat-header" >
            <div class="chatMultiProFile">
            </div>
            <div>
                <span id="group-chat-room-name"></span>
                <button id="modify-group-Name-btn"  type="button"><i class="fas fa-edit"></i></button>
            </div>
            <div>
                <span onclick="backToChatList();"><i class="fas fa-reply"></i></span>
                <span id="add-group-mem-btn"><i class="fas fa-user-plus"></i></span>
            </div>
        </div>
        <!-- 채팅 header끝 -->

        <!-- 채팅 몸통 -->
        <div id="chat-content-body">
        </div>
        <!-- 채팅 작성영역 -->
        <div id="chat-typing-area">
            <textarea id="writeChatContent" onKeypress="onEnterChange();" spellcheck="false"></textarea>
            <div class="chat-btn-area">
                <button type="button" id="chatSend" value="submit" onclick="sendMessage();">전송</button>
                <button type="button" onclick="">+</button>
            </div>
        </div>
    </div>
</body>
</html>