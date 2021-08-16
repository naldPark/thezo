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
	/* 동료 추가 모달 css영역 */
   #add-colleague-modal .modal-content{width: 350px; height: 180px; transform: translate(20%, 80%);}
   #add-colleague-modal .modal-header{color: white; font-size: 22px; font-weight: bold; background-color:rgb(56,77,97);}
   #add-colleague-modal .close{color: white;}
   #add-colleague-modal .modal-body>span{font-size: 18px; font-weight: bold; margin-right: 5px;}
   #add-colleague-modal .modal-body>input{width: 180px; height: 26.4px; font-size: 15px; letter-spacing: -0.3px; border: 1px solid black; outline: none; margin: 0px; transform: translateX(1px); background-color: lightgrey;}
   #add-colleague-modal .modal-body>button{color:white; transform: translateX(-10px); background-color:rgb(56,77,97);}
   #add-colleague-modal .modal-footer{height: 45px; padding: 0px; justify-content: flex-start;}
   #add-colleague-modal .modal-footer>button{width: 50%; height: 100%; border: none; margin: 0px; outline: none; font-weight: bold;}
   #add-colleague-modal .modal-footer>button:first-child{background-color: rgb(224,224,224);}
   #add-colleague-modal .modal-footer>button:last-child{color: white; background-color: rgb(52,152,219);}
   #add-colleague-modal .modal-footer>button:hover{color: orange; font-size: 18px;}

   /* 단톡방 만드는 모달 css 영역*/ 
   #createGroupChat-Modal .modal-content{width: 320px; height: 520px; border-radius: 15px; margin-top: 150px; margin-left: 100px; overflow: hidden; font-family:'Noto Sans KR', sans-serif;}
   #createGroupChat-Modal .modal-header{height: 65px; color: white; font-size: 22px; font-weight: bold; background-color: rgb(56,77,97);}
   #createGroupChat-Modal .modal-header .close{color: white;}
   #createGroupChat-Modal .modal-header>p{display: none;}
   #createGroupChat-Modal .modal-body{height: 410px; overflow-y: scroll;}
   #createGroupChat-Modal .modal-body::-webkit-scrollbar{width: 10px; display: block;}
   #createGroupChat-Modal .modal-body::-webkit-scrollbar-thumb{border: 2px solid transparent; border-radius: 5px; background-clip: padding-box; background-color: rgb(41,128,185);}
   #createGroupChat-Modal .modal-body::-webkit-scrollbar-track{border-radius: 5px; box-shadow: inset 0px 0px 5px white; background-color: rgb(215, 238, 247);}    
   #createGroupChat-Modal .modal-body>table{width: 100%;}
   #createGroupChat-Modal .modal-body>table>thead>tr{font-size: 18px; border-bottom: 3px solid darkgray;}
   #createGroupChat-Modal .modal-body>table>tbody>tr{height: 70px; display: flex; align-items: center;}
   #createGroupChat-Modal .modal-body>table>tbody>tr:hover{background-color: lightcyan;}
   #createGroupChat-Modal .modal-body>table>tbody td:nth-child(1){width: 60px; height: 60px; overflow: hidden;}
   #createGroupChat-Modal .modal-body>table>tbody td:nth-child(1)>img{width: 58px; height: 58px; border-radius:  26px; object-fit: cover;}
   #createGroupChat-Modal .modal-body>table>tbody td:nth-child(2){width: 190px; line-height: 58px; font-weight: bold; padding-left: 20px;}
   #createGroupChat-Modal .modal-body>table>tbody td:nth-child(4){text-align: center;}
   #createGroupChat-Modal .modal-body>table>tbody input[type=checkbox]{width: 30px; height: 30px; border-radius: 50%; margin-top: 4px;}
   #createGroupChat-Modal .modal-footer{height: 45px; padding: 0px;}
   #createGroupChat-Modal .modal-footer>button{width: 50%; height: 100%; border: none; margin: 0px; outline: none; font-size: 18px; font-weight: bold;}        
   #createGroupChat-Modal .modal-footer>button:nth-child(2), #createGroupChat-Modal .modal-footer>button:nth-child(3), #createGroupChat-Modal .modal-footer>button:nth-child(4){color: white; background-color: rgb(66,87,107);}
   #createGroupChat-Modal .modal-footer>button:hover{color: orange; font-size: 20px;}

</style>
</head>
<body>
<!-- 모달로다가 ! 하나 친구 추가하는 것빼는게 좋을듯  그래야 로직처리가 가능해-->
<!-- 친구추가용 모달 하나 -->
<%-- -------------------------------------- 친구 추가용 모달 시작(완료) ---------------------------------- --%>
    <script>
        function openAddColleague(){
            $("#add-colleague-modal").modal();
        }
        
        function checkAndAddColleague(){
        		var coMemNo = $("#hidden-colleague-number").val(); 
        	if(coMemNo == ${loginUser.memNo }){
        		alert("자신은 친구로 추가할수없습니다.")
 				$("#select-colleague-name").val("");
 				$("#hidden-colleague-number").val("");
        	}else{
	            $.ajax({ // 2개의 값을 넘겨서 이미 존재하는지 여부를 알아보는 ajax
			 		url:"checkColleague.cht",
					data:{ myMemNo : ${ loginUser.memNo }
	            		 , coMemNo : coMemNo
	            	},
			 		success:function(result){
			 			if(result>0){// 이미 동료로 추가되어있는경우
			 				alert("이미 동료로 추가된 사람입니다. \n다른 동료를 추가해주세요 ");
			 				$("#select-colleague-name").val("");
			 				$("#hidden-colleague-number").val("");
			 			}else{// 동료가 아닌경우 
			 				// 방도 만들어줘야해
			 	            $.ajax({
			 			 		url:"addColleague.cht",
			 					data:{myMemNo : ${ loginUser.memNo }
			            		 	, coMemNo : coMemNo
			 	            	},
			 			 		success:function(result){
			 			 			if(result>0){
			 			 				$("#select-colleague-name").val("");
			 			 				$("#hidden-colleague-number").val("");
				 			 			alert("동료 추가에 성공하였습니다. \n동료 목록을 확인해주세요 ")
				 			 			$("#add-colleague-modal").modal('hide');
	
				 			 			// 여기서 동료 목록 가져와서 뿌리는 ajax함수 호출해줘야함 
				 			 			bringColleageuList();
			 			 			}else{
				 			 			alert("동료 추가에 실패하였습니다 \n 개발자에게 문의 해주세요")
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
        }
        
        $(document).ready(function(){   
	        $("#add-colleague-modal").on('hidden.bs.modal', function () {
 				$("#select-colleague-name").val("");
 				$("#hidden-colleague-number").val("");
	       	})
        })
    </script>

    <!-- The Modal -->
    <div class="modal fade" id="add-colleague-modal">
        <div class="modal-dialog">
            <div class="modal-content">
            
                <!-- Modal Header -->
                <div class="modal-header">
                    <p class="modal-title">+ 동료 추가</p>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">
                    <span>동료 찾기</span>
                    <input type="text" name="" id="select-colleague-name" readonly placeholder="검색을 통해 동료를 추가">
                    <input type="hidden" name="" id="hidden-colleague-number"  required>
                    <!-- 2번을 넘겨줘야 내가 원하는 팝업창을 열수가있다.  -->
                    <button type="button" onclick="openSearchMem(2)"><i class="fas fa-search-plus"></i></button>
                    <input type="text" id="popupType" value="col-select" style="display: none;">
                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" data-dismiss="modal">취소</button>
                    <button type="button" onclick="checkAndAddColleague();">추가하기</button>
                </div>
            </div>
        </div>
    </div>
<%-- --------------------------------------------친구 추가용 모달 끝 (완료) --------------------------------------------------------------------------------- --%>
<%-- -----------------------------------------단톡방 만드는 모덜, 단톡방 이름 바꾸는 모달, 단톡방인원 추가 모달 통합본  시작(완료)------------------------------------------------%>   
    <script>
	    // 글자수 제한 스크립트 시작 
	    $(document).ready(function() {
	        $('#group-room-name-content').on('keyup', function() {
	            if($(this).val().length > 30) {
	                $(this).val($(this).val().substring(0, 30));
	            }
	        });
	        
	        // 모달창 닫힐때 ! 실행되는 스크립트
	        $("#createGroupChat-Modal").on('hidden.bs.modal', function () {
 				$("#forAddAndModifyGroupChat").val(""); //채팅방 이름 날려버리기
 				$("#group-room-name-content").val(""); // 방번호도 (hidden) 날려버리기 
	       	});
	    });
	 
	    // 방번호로 나를 제외한 동료목록을 가져와서 조건 검사하는 함수 
        function showMyColListForGroupChat(roomNo){
			if(roomNo != null){ // 채팅방에서 add로 열었을떄 
	            $.ajax({
					url:"showExtraColleague.cht",
					data:{ memNo : ${ loginUser.memNo }
	            		 , roomNo : roomNo 	
					},
			 		success:function(list){
						var value;
			 			for(var i in list){		 				
			 				value += '<tr><td> <img src="'
			 				       if(list[i].coImgPath == null){
			 				 		value += "resources/images/basicProfile.png"; 
			 				       }else{
			 				    	  value += list[i].coImgPath;
			 				       }
			 				       value += '"'
			 				       + '><td>'
			 				       + list[i].coNameAndRank
			 				       + '</td><td><input type="checkbox" name="myCollegueNo" value="'
			 				       + list[i].coMemNo
			 				       + '"></td></tr>'
			 			}
			 			$("#my-colleage-group-list tbody").html(value)
			 		},error:function(request,status,error){ // 406 에러가 뜬다.... 뭐냐 json(gson)으로 반환하는 타입 맞지않아서 뜨는오류인데 select문에서 resultMap써줬는지 봐라
			 	        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			 			console.log("ajax통신 실패");
			 		}				
			 	})//ajax 끝 
			}else{ // 동료창에서 단톡방 만들때 
	            $.ajax({
					url:"selsectCoList.cht",
					data:{ memNo : ${ loginUser.memNo }},
			 		success:function(list){
			 			// 정보 싸그리 가져왔다. 
						var value;
			 			for(var i in list){		 				
			 				value += '<tr><td> <img src="'
			 				       if(list[i].coImgPath == null){
			 				 		value += "resources/images/basicProfile.png"; 
			 				       }else{
			 				    	  value += list[i].coImgPath;
			 				       }
			 				       value += '"'
			 				       + '><td>'
			 				       + list[i].coNameAndRank
			 				       + '</td><td><input type="checkbox" name="myCollegueNo" value="'
			 				       + list[i].coMemNo
			 				       + '"></td></tr>'
			 			}
			 			$("#my-colleage-group-list tbody").html(value)
			 		},error:function(request,status,error){ // 406 에러가 뜬다.... 뭐냐 json(gson)으로 반환하는 타입 맞지않아서 뜨는오류인데 select문에서 resultMap써줬는지 봐라
			 	        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			 			console.log("ajax통신 실패");
			 		}				
			 	})//ajax 끝 
			}
        }

		// 3개의 모달을 합친 것! 
        function openCreateGroupChat(mode, roomNo){
        	//console.log("mode:" +mode);
        	//console.log("modal에서의 :" +roomNo);

            if(mode == 'gc'){ // 만드는 방으로 들어왔을때 
                $("#beforeCreateGroupRoom").show();
                $("#group-room-name-content").val("");
                $(".group-create-title").show();;
                $(".group-add-title").hide();
                $(".create-group-btn").show();
                $(".add-group-btn").hide();
                $("#my-colleage-group-list").show();
                $(".change-room-name").hide();
                $("#createGroupChat-Modal .modal-body").css("height", "410px");
                $("#createGroupChat-Modal .modal-content").css("height", "520px");
				showMyColListForGroupChat();// 친구 목록 가져오기 

            }else if(mode == 'ga'){
                $("#beforeCreateGroupRoom").hide();
                $(".group-create-title").hide();
                $(".group-add-title").show();
                $(".create-group-btn").hide();
                $(".add-group-btn").show();
                $("#my-colleage-group-list").show();
                $(".change-room-name").hide();
                $("#createGroupChat-Modal .modal-body").css("height", "410px");
                $("#createGroupChat-Modal .modal-content").css("height", "520px");
                $("#forAddAndModifyGroupChat").val(roomNo); // 방번호 심어넣기  
                showMyColListForGroupChat(roomNo);// 친구 목록가져오기 
                
            }else{//mode 인자에 cgn 이 들어가있다. 단체 채칭방에서 단톡방 이름 바꾸는것 ! 
                $("#my-colleage-group-list").hide();
                $(".group-create-title").hide();;
                $(".group-add-title").hide();
                $(".create-group-btn").hide();
                $(".add-group-btn").hide();
                $("#beforeCreateGroupRoom").show();
                $(".change-room-name").show();
                $("#group-room-name-content").val($("#group-chat-room-name").text());
                $("#createGroupChat-Modal .modal-body").css("height", "100px");
                $("#createGroupChat-Modal .modal-content").css("height", "210px");
                $("#forAddAndModifyGroupChat").val(roomNo); // 방번호 심어넣기  
	            $.ajax({
					url:"bringGroupRoomName.cht",
					data:{ roomNo : roomNo},
			 		success:function(name){
			 			$("#group-room-name-content").val(name);
			 		},error:function(){ 
			 			console.log("ajax통신 실패");
			 		}				
			 	})//ajax 끝 
            }
            $("#createGroupChat-Modal").modal();
        }

        //------------------아래는 버튼 클릭시 작동 되는 function들 ------------------
        // 단톡방 만들고 해당 단톡방으로 이동하는 함수 
       var newGroupMemMultiVal = []; 
        function createAndMoveToGroupChat(){
			var newRoomName= $("#group-room-name-content").val();
            var  eachCheck = $("#my-colleage-group-list input:checkbox[name=myCollegueNo]:checked");
            if(newRoomName.trim() == ""){
            	alert("채팅방 이름을 작성해주세요")
            	$("#group-room-name-content").val("");
            	$("#group-room-name-content").focus();
            }else{
	            if(eachCheck.length < 2){
	                alert("해당 기능은 동료를 2명 이상 선택 해야 이용가능합니다.");
	            }else{
	                // 쪽지 번호들을 배열에 담았다. 
	                eachCheck.each(function(){
	                    var checkedItem = $(this).val();
	                    newGroupMemMultiVal.push(checkedItem)
	                })
	                newGroupMemMultiVal.push(${ loginUser.memNo });
					// multiVal에 값들이 담겨있는 상태 ! 
					//console.log(newGroupMemMultiVal);
	                $.ajax({
	        	 		url:"createGroupRoom.cht",
	        	 		traditional : true,
	        			data:{ newGroupMemMultiVal: newGroupMemMultiVal 
	        				 , roomName: newRoomName 
	        				 , myMemNo : ${ loginUser.memNo }
	                	},
	        	 		success:function(roomNo){
	        	 			if(roomNo > 0){
	        	 				alert("단체 채팅방을 성공적으로 생성하였습니다.");
		        	            ShowChatRoomByRoomNo(roomNo,'G');
		        	            $("#createGroupChat-Modal").modal('hide'); // 마지막에 모달창 꺼줘야지
	        	 			}else{
	        	 				alert("단체 채팅방을 생성에 실패하였습니다. \n개발자에게 문의해주세요");
		        	            $("#createGroupChat-Modal").modal('hide'); // 마지막에 모달창 꺼줘야지
	        	 			}
	        	 		},error:function(){
	        	 			console.log("ajax통신 실패");
	        	 		}				
	        	 	})//ajax끝
	            }
            }
        }
        
        // 단톡방에 인원 추가 하고 단톡방으로 다시 이동하는 함수 
		var addGroupMemMultiVal = []; 
        function addAndMoveToGroupChat(){
            var  eachCheck = $("#my-colleage-group-list input:checkbox[name=myCollegueNo]:checked");
            if(eachCheck.length == 0){
                alert("해당 기능은 동료를 1명 이상 선택 해야 이용가능합니다.");
            }else{
                // 쪽지 번호들을 배열에 담았다. 
                eachCheck.each(function(){
                    var checkedItem = $(this).val();
                    addGroupMemMultiVal.push(checkedItem)
                });// 오직 추가된 인원의 memNo만 담음 ! 
				//console.log(addGroupMemMultiVal);
                $.ajax({
        	 		url:"addGroupRoom.cht",
        	 		traditional : true,
        			data:{ addGroupMemMultiVal: addGroupMemMultiVal 
        				 , roomNo: $("#forAddAndModifyGroupChat").val() 
                	},
        	 		success:function(result){
        	 			alert(result);
        	            ShowChatRoomByRoomNo($("#forAddAndModifyGroupChat").val(),'G');
        	            $("#createGroupChat-Modal").modal('hide'); // 마지막에 모달창 꺼줘야지
        	 		},error:function(){
        	 			console.log("ajax통신 실패");
        	 		}				
        	 	})//ajax끝
            }
        }
        
        // 이름 바꾸기 버튼 클릭시에 
        function modiftGroupChatName(){
            $.ajax({
				url:"modifyGroupRoomName.cht",
				data:{ roomNo : $("#forAddAndModifyGroupChat").val()
					 , roomName : $("#group-room-name-content").val()  	
				},
		 		success:function(result){
		 			if(result>0){
			 			alert("단체 채팅방 이름을 성공적으로 수정하였습니다. \n 확인해주세요")
		                ShowChatRoomByRoomNo($("#forAddAndModifyGroupChat").val(), 'G');
		 			}else{
			 			alert("단체 채팅방 이름 수정에 실패하였습니다. \n개발자에게 문의해주세요")
		 			}
		 		},error:function(){ 
		 			console.log("ajax통신 실패");
		 		}				
		 	})//ajax 끝 
            $("#createGroupChat-Modal").modal('hide');
        }
        
    </script>

    <!-- The Modal -->
    <div class="modal fade" id="createGroupChat-Modal">
        <div class="modal-dialog">
            <div class="modal-content">
            
                <!-- Modal Header -->
                <div class="modal-header">
                    <p class="group-create-title">단체 채팅방 만들기</p>
                    <p class="group-add-title">단체 채팅방 인원 초대</p>
                    <p class="change-room-name" style="display: none;">단체 채팅방 이름 바꾸기</p>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <div id="beforeCreateGroupRoom" style="display: none;">
                        <span style="font-size: 18px;"><b>※ 단체 채팅방 이름</b></span><input type="text" id="group-room-name-content" style="padding-left: 10px;" required placeholder="최대 30자 까지 입력가능" autocomplete=”off”>
                        <input type="hidden" id="forAddAndModifyGroupChat">
                    </div>
                    <table id="my-colleage-group-list">
                        <thead>
                            <tr>
                                <th>나의 동료 목록</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" data-dismiss="modal">취소</button>
                    <button type="button" class="create-group-btn" style="display: none;" onclick="createAndMoveToGroupChat();">단체톡 만들기</button>
                    <button type="button" class="add-group-btn" style="display: none;" onclick="addAndMoveToGroupChat();">인원 추가</button>
                    <button type="button" class="change-room-name" style="display: none;" onclick="modiftGroupChatName();">방이름 바꾸기</button>
                </div>
            </div>
        </div>
    </div>

<%-- -------------------------단톡방 만드는 모덜, 단톡방 이름 바꾸는 모달, 단톡방인원 추가 모달 통합본  끝(완료)--------------------------------------------------------%>
<%-- ------------------------------------------사진 보기 모달은 공용이다.--------------------------------------------------------------------------- --%>

    <style>
    	/* 사진 보기용 모달 css영역 인데 (후에 동료 삭제하는 버튼이 들어갈수가 있음 ! )*/
        #chatAndProfileImage-modal .modal-content{width: 500px; max-height: 620px; transform: translateY(40px);}
        #chatAndProfileImage-modal .modal-header{height: 50px; border-bottom: none;}
        #chatAndProfileImage-modal .modal-header>p{color: tomato; font-size: 24px; font-weight: bold;}
        #chatAndProfileImage-modal .modal-body{height: 530px;}
        #chatAndProfileImage-modal .modal-body>img{width: 100%; height: 100%; object-fit: contain;}
        #chatAndProfileImage-modal .modal-footer{height: 40px; padding: 0px; border-top: none;}
        #chatAndProfileImage-modal .modal-footer>button{width: 200px; height: 34px; color: white; font-weight: bold; border: none; border-radius: 5px; margin: 0px 15px 5px 0px; outline: none; background: tomato;}
    </style>


    <!-- The Modal -->
    <div class="modal fade" id="chatAndProfileImage-modal">
        <div class="modal-dialog">
            <div class="modal-content">
            
                <!-- Modal Header -->
                <div class="modal-header">
                    <p class="modal-title">사진 보기</p>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">
                    <img src="">
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button id="delCoMemBtn" style="visibility:hidden;" type="button" onclick="">??? 멀넣을까 ???</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 사진보기용 모달 하나. -->
    <script>    
    	// 사진보기 모달 인데 혹여나 꼭 ! 삭제 기능을 넣을 꺼면 ! 동료번호를 넘겨서 해결하는 식으로 진행하자. 
        function oneClickOpenImage(imgSrc, coMemNo){
        	$("#chatAndProfileImage-modal img").attr("src", imgSrc);
        	// 동료 삭제 하기 용으로 넣은 것인데 만약 구현한다고 가정하면 ! 오직 통료 리스트 페이지에서만 가능한것으로 진행 
        	if(coMemNo != null){
	        	$("#delCoMemBtn").attr("onclick", "delColleague(" + coMemNo +");");
        	}
            $("#chatAndProfileImage-modal").modal();
        }
    </script>
    
<%-- ------------------------------------------사진 보기 모달은 공용임 끝------------------------------------------ --%>
   




</body>
</html>