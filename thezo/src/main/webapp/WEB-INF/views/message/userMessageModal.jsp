<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- @Author Jaewon.s -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="Jaewon.s">
<title>쪽지 모달들</title>
<style>
	/* 받은 쪽지 상세 모달  */
    #messageDetail .modal-content{width: 630px; height: 315px; transform: translateY(150px);} 
    #messageDetail .modal-header{width: 100%; height: 77px; border-bottom: 3px solid rgb(193,193,193);}
    #messageDetail .modal-header>table{width: 440px;}
    #messageDetail .modal-header>div{display: flex; flex-direction: column;}
    #messageDetail .modal-header>div>button[class="close"]{font-size: 35px; padding: 1px;}
    #messageDetail #reply-btn, #reply-send-message #reply-send-btn{width: 70px; height: 25px; color: white; font-size: 14px; font-weight: bold; line-height: 25px; margin-top: 20px; border: none; border-radius: 5px; background-color: rgb(52,152,219);}
    #messageDetail .modal-body{padding: 0px;}
    .detail-modal-content pre{width: 100%; height: 235px; padding: 15px; font-family:'Noto Sans KR', sans-serif;
        overflow-y: scroll;
        white-space:pre-wrap;  word-break:keep-all; text-overflow:clip;}

</style>
</head>
<body>
<%-------------------------------------------받은쪽지 상세보기 모달 시작---------------------------------------------------- --%>
<!--  겁나 중요 하다 여기서 중요한것은 메소드로 해당 !모달을 호출할때에  인자값을 2개를 넘긴다 !이를 가지고  받은쪽지인지 보낸쪽지인지 휴지통에 있는 쪽지인지 판별 -->
    <!-- 쪽지 상세보기모달인데 ! 상관관계상 ! header쪽에서 삽입함.  -->
    
    
	<!-- 받은 쪽지 (답장버튼있음) 휴지통에서 받은 쪽지 보는곳 / 그리고 보낸 쪽지 보는것이 혼합 되어있는 복잡한 놈이다!!! 조심해서 다뤄주자! -->
    <div class="modal fade" id="messageDetail">
        <div class="modal-dialog">
            <div class="modal-content" >                
            <!-- Modal Header -->
                <div class="modal-header">
                    <table>
                        <tr>
                            <th id="senderType" style="display: none;">보낸사람</th>
                            <th id="receiverType" style="display: none;">받는사람</th>
                            <td id="toFromPerson">김땡땡 과장</td>
                            <th>상태</th>
                            <td>긴급</td>						
                        </tr>
                        <tr>
                            <th id="receiveTiem" style="display: none;">받은시간</th>
                            <th id="sendTiem" style="display: none;">보낸시간</th>
                            <td>2021-07-30 [16:24]</td>
                            <th>관련내용</th>
                            <td>행사</td>						
                        </tr>
                    </table>
                    <div>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <!-- 동적생성할때 ! 값을 넣어가는 ! 선언적 함수 호출 -->
                        <button id="reply-btn" onclick="openReplyAndSendMsg(1);" type="button">답장</button>
                    </div>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body">
                    <div class="detail-modal-content">
                        <pre>쪽지 내용이 어쩌구 저쩌구 합니다 기분나빠서 오랜 고민끝에  
                            신고합니다 처리 부탁드려요 ! 
                        </pre>
                    </div>
                </div>
            </div>
        </div>
    </div>


<%-------------------------------------------받은쪽지 상세보기 모달 끝---------------------------------------------------- --%>
<%-------------------------------------------답장하기 , 쪽지 쓰기 모달 시작---------------------------------------------------- --%>

    <style>
        #reply-send-message .modal-content{
            width: 630px;
            max-height: 490px;
            transform: translateY(150px);
            font-family:'Noto Sans KR', sans-serif;
            background-color: rgb(250,250,250);
        }

        #reply-send-message .modal-header{
            height: 75px;
            padding: 5px;
        }

        #reply-send-message .modal-header>div>p{
            margin: 0px;
        }

        #reply-send-message .modal-header>div:nth-child(1){
            width: 300px;
            padding-left: 10px;
        }

        #reply-send-message .modal-header>div:nth-child(1)>p{
            color: rgb(20,70,104);
            font-weight: bold;
        }

        #reply-send-message .modal-header>div:nth-child(1)>div>span{
            font-weight: bold;
            margin-right: 20px;
        }

        #reply-send-message .modal-header>div:nth-child(1)>p{
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 3px;
        }

        #reply-send-message .modal-header>div:nth-child(1)>div{
            display: flex;
            transform: translateY(1px);
        }

        #reply-send-message input{
            width: 110px;
            height: 25px;
            margin-right: 0px;
            border: none;
            background-color: inherit;
        }
        
        #searchMemMsg{
            width: 25px;
            height: 25px;
            outline: none;
            border: 1px solid lightgray;
            text-align: center;
        }

        #reply-send-message .modal-header>div>div>div{
            border: 1px solid gray;
            border-radius: 5px;
            display: flex;
            justify-content: flex-start;
            overflow: hidden;
            background-color: rgb(190,190,190);
        }

        #reply-send-message .modal-header>div:nth-child(2){
            width: 215px;
            height: 65px;
        }

        #reply-send-message .modal-header>div:nth-child(2)>table{
            width: 100%;
            transform: translateY(1px);
        }
        #reply-send-message .modal-header>div:nth-child(2)>table tr{
            height: 32px;
        }

        #reply-send-message .modal-header>div:nth-child(2)>table select{
            width: 130px;
            height: 25px;
        }

        #reply-send-message .modal-header>div:nth-child(3){
            display: flex;
            flex-direction: column;
        }



        #reply-send-message .modal-body{
            height: 240px;
            padding: 10px 15px 0px 15px;
        }

        #reply-send-message button[class="close"]{
        width: 35px;
        font-size: 30px;
        padding: 1px;
        margin: 0px 0px 0px 75px;
    }

    #reply-send-message #reply-send-btn{
        margin: 5px 0px 0px 15px;
        width: 80px;
        height: 25px;
        line-height: 10px;
    }

    #reply-send-message .modal-body>div:nth-child(1)>textarea{
        width: 595px;
        height: 195px;
        border: 1p solid red;
        transform: translateY(1px);
        resize: none;
        white-space:pre-wrap;  word-break:keep-all; text-overflow:clip;
    }

    #reply-send-message .modal-body>div:nth-child(2){
        width: 595px;
        height: 30px;
        position: relative;
    }    

    #reply-send-message .modal-body>div:nth-child(2)>span{
        position: absolute;
        right: 0;
    }

    #reply-send-message .modal-footer{
        padding: 0px 15px 15px 15px;
        border-top: none;
    }

    #reply-send-message .modal-footer>pre{
        white-space:pre-wrap;  word-break:keep-all; text-overflow:clip;
        overflow-y: scroll;
        width: 595px;
        height: 155px;
        background-color: rgb(224,224,224);
        padding: 3px;
    }
    .reply-display{
        display: none;
    }

    .send-display{
        display: block;
    }

    #select-member-msg{
        -ms-user-select: none; 
        -moz-user-select: -moz-none;
        -khtml-user-select: none;
        -webkit-user-select: none;
        user-select: none;
    }

    </style>

     <script>
        function openReplyAndSendMsg(msgNo){
            if(msgNo != null){
                $("#messageDetail").modal('hide');

                // 여기서 이제 반복문 돌리면서 !!! 
                //reply쪽은 !!! block 처리를 해주고 
                //send 쪽은 class를 부여해줘야한다. 클래스명은  .send-display 이다!!! 

                var rd = document.getElementsByClassName("reply-display");
                for(var i=0; i<rd.length;i++){
                    $(rd[i]).css("display", "block");
                }
                var sd = document.getElementsByClassName("send-display");
                for(var i=0; i<sd.length;i++){
                    $(sd[i]).css("display", "none");
                }
            }

            if(msgNo == null){
                var rd = document.getElementsByClassName("reply-display");
                for(var i=0; i<rd.length;i++){
                    $(rd[i]).css("display", "none");
                }
                var sd = document.getElementsByClassName("send-display");
                for(var i=0; i<sd.length;i++){
                    $(sd[i]).css("display", "block");
                }
            }

            $("#reply-send-message").modal();
        }
    </script>


    <!-- 쪽지 상세보기모달인데 ! 상관관계상 ! header쪽에서 삽입함.  -->
    <!-- 아주 단순하다!!! ajax로다가 값을 가져올때 !!! 자바스크립트로!!! 
        답장인 경우 ! 해당 ! 요소 display none을 풀어주는 형식이면 된다. 
        일단 만들때는!!!! 답장기준으로 만들고 그다음에 ! 쪽지 쓰기 모드로 주석바꿔가면서 진행하자.
    -->
    <div class="modal fade" id="reply-send-message">
        <div class="modal-dialog">
            <div class="modal-content" >                
            <!-- Modal Header -->
                <form action="" method="post">
                    <div class="modal-header">
                        <div>
                            <p id="sendMsg-title" class="send-display">쪽지 쓰기</p>
                            <p id="reply-title" class="reply-display">답장</p>
                            <div>
                                <span>받는 사람</span>
                                <div>
                                    <!-- 쪽지쓰기 -->
                                    <input id="select-member-msg" class="send-display" type="text" readonly required>
                                    <input id="hidden-member-number" type="hidden" name="" required>

                                    <!-- ★★★★★ 여기서 윈도우창 호출이다! onclick으로 호출이다! 1을 넘겨줘야 내가원하는것으로 호출한다. -->
                                    <button type="button" id="sendMsg-btn" class="send-display" onclick="openSearchMem(1);" style="background-color: rgb(52,152,219); color: white;"><i class="fas fa-search"></i></button>
                                    <input type="hidden" name="" value="" >
                                    <!-- 답장하기 -->
                                    <input class="reply-display" type="text" name="" readonly required>
                                    <button class="reply-display" type="button" disabled><i class="fas fa-search"></i></button>
                                </div>
                            </div>
                        </div>
                        <div>
                            <table>
                                <tr>
                                    <th>상태</th>
                                    <td>
                                        <select name="">
                                            <option value="">답변완료</option>
                                            <option value="">답변필요</option>
                                            <option value="">답변불필요</option>
                                            <option value="">공지</option>
                                            <option value="">긴급</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>관련내용</th>
                                    <td>
                                        <select name="">
                                            <option value="">행사</option>
                                            <option value="">업무</option>
                                            <option value="">회의</option>
                                            <option value="">기타</option>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <!-- 동적생성할때 ! 값을 넣어가는 ! 선언적 함수 호출 -->
                            <button id="reply-send-btn" type="submit">보내기</button>
                        </div>
                    </div>
                    
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="writing-content-area">
                            <textarea name="" required>생각보다 

                                구현할 기능이 많구먼 ~~~~~~~
                                
                                할 수 있다.
                                
                                기존에 하던것의 연장선상이다. 
                                
                                다만 시간이 오래걸린다는 단점이 있다. </textarea>
                        </div>
                        <div>
                            <span style="left: 0;font-weight: bold;" class="reply-display">↓ 받은 쪽지 내용</span>
                            <span>57 / 1000 자</span>
                        </div>
                    </div>
                </form>    
                <!-- 답장하기-->
                <!-- Modal footer -->
                <div class="modal-footer reply-display" id="sendMsg-footer">
                    <pre>쪽지 내용이 어쩌구 저쩌구 합니다 기분나빠서 오랜 고민끝에  
                        신고합니다 처리 부탁드려요 ! 
                    </pre>
                </div>
            </div>
        </div>
    </div>
<%-------------------------------------------답장하기 , 쪽지 쓰기 모달 끝---------------------------------------------------- --%>
<%-------------------------------------------신고 모달 시작 ---------------------------------------------------- --%>

    <script>
            // // 전체 갯수
            // $("input:checkbox[name=is_check]").length

            // // 선택된 갯수
            // $("input:checkbox[name=is_check]:checked").length

            // // 전체 체크
            // $("input[name=mycheck]:checkbox").prop("checked", true);

            // // 전체 체크 순회
            // $("input:checkbox[name=is_check]").each(function() {
            // this.checked = true;
            // });

            // // 체크여부 확인
            // if($("input:checkbox[name=complete_yn]").is(":checked") == true) {
            // //작업
            // }

        // ★ 체크박스 내가 만든 재원 스크립트!
        // 일단 전체선택하는 기능은 userReceiveMessage.jsp에다가 심어놨다. 
        //------------------------------------------------------------------------
        function openReceivedMsgReport(){            
            // 선택을 안했을때/ 다중선택용 대비한 요소 얘는 갯수를!  (선택한 요소의 갯수)
            // var  eachCheckCount = $("#received-msg-table input:checkbox[name=tossNo]:checked").length;
            // 개별 선택 요소 갯수! 
            var  eachCheck = $("#received-msg-table input:checkbox[name=tossNo]:checked");

            if(eachCheck.length == 0){
                alert("해당 기능은 체크 박스를 선택 해야 이용가능합니다.");
            }else if(eachCheck.length != 1){
                alert("신고기능은 오직 한개의 쪽지만 신고가 가능합니다.");
                $("#rSelectAllCheckBox").prop("checked", false);
                $(" #received-msg-table input:checkbox[name=tossNo]").prop("checked", false);
            }else{
                $("#receive-msg-report-modal #tossedReportedMsgNo").val(eachCheck.val());
                $("#receive-msg-report-modal").modal();
            }
        }
    </script>

    <style>
        #receive-msg-report-modal .modal-content{
            width: 360px;
            height: 445px;
            transform: translate(150px, 120px);
            background-color: rgb(250,250,250);
        }

        #receive-msg-report-modal .modal-header{
            width: 100%;
            height: 55px;
            border-bottom: none;
        }

        #receive-msg-report-modal .modal-header>p{
            font-size: 28px;
            font-weight: bold;
            color: rgb(167,89,182);
            transform: translateX(20px);
        }

        #receive-msg-report-modal .modal-body{
            height: 340px;
        }

        #receive-msg-report-modal .modal-body>div{
            padding-left: 10px;
            vertical-align: middle;
            padding-bottom: 7px;
        }

        #receive-msg-report-modal .modal-body>div>span{
            font-size: 16px;
            font-weight: bold;
            width: 100px;
        }

        #receive-msg-report-modal .modal-body>div>input, #receive-msg-report-modal .modal-body>div>select{
            width: 150px;
            height: 40px;
            padding: 5px;
            vertical-align: middle;
            transform: translateX(1px);
            margin: 0px;
        }

        #receive-msg-report-modal .modal-body>div>textarea{
            resize: none;
            width: 300px;
            height: 135px;
            padding: 5px 10px 5px 10px;
            white-space:pre-wrap;  word-break:keep-all; text-overflow:clip;
            transform: translateX(1px);
            margin-left: 2px;
        }

        #receive-msg-report-modal .modal-body>div:nth-child(3){
            padding-bottom: 0px;
        }

        #receive-msg-report-modal .modal-body>p{
            text-align: right;
            margin-right: 15px;
            font-weight: normal;
            margin-bottom: 3px;
        }

        #receive-msg-report-modal .modal-body>div:last-child{
            padding: 0px;
        }


        #receive-msg-report-modal .modal-body>div>p{
            font-size: 12px;
            color: red;
            letter-spacing: -0.3px;
            font-weight: bold;
            margin: 0px;
        }


        #receive-msg-report-modal .modal-footer{
            height: 45px;
            border-top: none;
            padding: 0px;
            margin: 0px;
            
        }

        #receive-msg-report-modal .modal-footer>button{
            width: 50%;
            height: 100%;
            box-sizing: border-box;
            font-size: 22px;
            border-radius: 0px;
            margin: 0px;
            margin-top: 3px;
            border: none;
        }

        #receive-msg-report-modal .modal-footer>button:hover{
            font-size: 23px;
            font-weight: bold;
        }

        #receive-msg-report-modal .modal-footer>button:first-child{
            background-color: rgb(224,224,224);
            color: rgb(51,51,51);
        }
        #receive-msg-report-modal .modal-footer>button:last-child{
            background-color: rgb(155,89,182);
            color: white;
            transform: translateX(1px);
        }
    </style>

    <!-- The Modal -->
    <div class="modal fade" id="receive-msg-report-modal">
        <div class="modal-dialog">
            <div class="modal-content">
            
                <!-- Modal Header -->
                <div class="modal-header">
                    <p class="modal-title">쪽지 신고</p>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <form action="" method="post">
                    <input type="hidden" id="tossedReportedMsgNo" name="" value="" required>
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div>
                            <span>※ 신고대상</span>
                            <input type="text" name="" value="이땡땡 개발자" required>
                        </div>
                        <div>
                            <span>※ 신고유형</span>
                            <select name="" >
                                <option value="">스팸</option>
                                <option value=""></option>
                                <option value=""></option>
                                <option value=""></option>
                                <option value=""></option>
                            </select>
                        </div>
                        <div>
                            <span>※ 신고 사유</span>
                            <textarea name="" cols="30" rows="10" required></textarea>
                        </div>
                        <p>60/100자</p>
                        <div>
                            <p>※ 신고 철회는 휴지동 => 신고내역처리에서 가능합니다.</p>
                            <p>※ 신고 시간으로부터 하루가 지나면 신고 철회가 불가합니다.</p>
                        </div>
                    </div>
                    
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" data-dismiss="modal">취소</button>
                        <button type="submit" data-dismiss="modal">신고</button>
                    </div>
                </form>
                
            </div>
        </div>
    </div>
<%-------------------------------------------신고 모달 끝 ---------------------------------------------------- --%>
<%-------------------------------------------삭제 모달 시작 (다른데서도 동일한 css가 쓰임 ) ---------------------------------------------------- --%>
    <script>
        var rcMultiVal = []; 
        function openReceivedMsgDelete(){
            var  eachCheck = $("#received-msg-table input:checkbox[name=tossNo]:checked");

            if(eachCheck.length == 0){
                alert("해당 기능은 체크 박스를 선택 해야 이용가능합니다.");
            }else{
                // 쪽지 번호들을 배열에 담았다. 
                if(rcMultiVal.length > 0){
                	rcMultiVal = []; 
                }
                eachCheck.each(function(){
                    var checkedItem = $(this).val();
                    rcMultiVal.push(checkedItem)
                })
				// multiVal에 값들이 담겨있는 상태 ! 
                $("#receive-msg-delete-modal #multiSelectMsgNo").val(rcMultiVal);    
                $("#receive-msg-delete-modal #deleteItemCount").text(eachCheck.length);    
                $("#receive-msg-delete-modal").modal();                
            }
        }
        
        function rcMsgMoveToRB(){
            //여기서 ajax 통신이다! + modal 닫기전에 !! controller에서 ! 목록 뿌려주는거 다시 사용해야한다. 
            $.ajax({
		 		url:"moveToRB.msg",
		 		traditional : true,
				data:{multiMsgNo: rcMultiVal 
					 , memNo : ${ loginUser.memNo }
            		 , msgType : 'rc'
            	},
		 		success:function(result){
		 			alert(result);
		 			showRcMsg();
		 			$("#receive-msg-delete-modal").modal('hide')
		 		},error:function(){
		 			console.log("ajax통신 실패");
		 		}				
		 	})
        }
    </script>

    <style>
        #receive-msg-delete-modal .modal-content{width: 365px; height: 182px; transform: translate(130px, 150px);}
        #receive-msg-delete-modal .modal-header{height: 52px; border-bottom: none;}
        #receive-msg-delete-modal .modal-header>p{color: rgb(231,76,60); font-size: 22px; font-weight: bold;}
        #receive-msg-delete-modal .modal-body{height: 85px; font-size: 17px;}
        #deleteItemCount{color: red; font-weight: bold;}
        #receive-msg-delete-modal .modal-footer{height: 45px; padding: 0px; border-top: none;}
        #receive-msg-delete-modal .modal-footer>button{width: 50%; height: 100%; border: none; margin: 0px; font-size: 22px;}
        #receive-msg-delete-modal .modal-footer>button:hover{font-weight: bold;}
        #receive-msg-delete-modal .modal-footer>button:focus{outline: none;}
        #receive-msg-delete-modal .modal-footer>button:first-child{color: rgb(51,51,51); background-color: rgb(224,224,224);}
        #receive-msg-delete-modal .modal-footer>button:last-child{color: white; background-color: rgb(231,76,60);}
    </style>
    <!-- The Modal -->
    <div class="modal fade" id="receive-msg-delete-modal">
        <div class="modal-dialog">
            <div class="modal-content">
            
                <!-- Modal Header -->
                <div class="modal-header">
                    <p class="modal-title">쪽지 삭제</p>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <form action="" method="POST">                  
                    <!-- 넘어온 배열은 !!! 알아서 ,를 기준으로 싸그리 문자열로 들어간다! -->
                    <input type="hidden" id="multiSelectMsgNo" name="" value="">  
                    <!-- Modal body -->
                    <div class="modal-body">
                        선택하신 (<span id="deleteItemCount">갯수</span>)개 의 <br>
                        쪽지를 삭제하시겠습니까?
                    </div>
                    
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" data-dismiss="modal">취소</button>
                        <button type="button" onclick="rcMsgMoveToRB();">삭제</button>
                    </div>
                </form>
                
            </div>
        </div>
    </div>

<%-------------------------------------------삭제 모달 끝 (다른데서도 동일한 css가 쓰임 )---------------------------------------------------- --%>
<%-------------------------------------------보낸 쪽지함 삭제 모달 시작  ---------------------------------------------------- --%>
    <script>     
    var stMultiVal = []; 
    function openSentMsgDelete(){
        var  eachCheck = $("#sent-msg-table input:checkbox[name=tossNo]:checked");
        if(eachCheck.length == 0){
            alert("해당 기능은 체크 박스를 선택 해야 이용가능합니다.");
        }else{
            // 쪽지 번호들을 배열에 담았다.
            if(stMultiVal.length > 0){
            	stMultiVal = []; 
            }
            eachCheck.each(function(){
                var checkedItem = $(this).val();
                stMultiVal.push(checkedItem)
            })
            //console.log(stMultiVal);

            $("#send-msg-delete-modal #sendMultiSentSelectMsgNo").val(stMultiVal);    
            $("#send-msg-delete-modal #sendDeleteSentItemCount").text(eachCheck.length);    
            $("#send-msg-delete-modal").modal();
        }
    }

    function stMsgMoveToRB(){
        //여기서 ajax 통신이다! + modal 닫기전에 !! controller에서 ! 목록 뿌려주는거 다시 사용해야한다. 
        $.ajax({
	 		url:"moveToRB.msg",
	 		traditional : true,
			data:{multiMsgNo: stMultiVal 
				 , memNo : ${ loginUser.memNo }
        		 , msgType : 'st'
        	},
	 		success:function(result){
	 			alert(result);
	 			showStMsg();
	 			$("#send-msg-delete-modal").modal('hide')
	 		},error:function(){
	 			console.log("ajax통신 실패");
	 		}				
	 	})
    }
    
    </script>

    <style>
        #send-msg-delete-modal .modal-content{
            width: 365px;
            height: 182px;
            transform: translate(130px, 150px);
        }

        #send-msg-delete-modal .modal-header{
            height: 52px;
            border-bottom: none;
        }

        #send-msg-delete-modal .modal-header>p{
            font-size: 22px;
            font-weight: bold;
            color: rgb(231,76,60);
        }
        #send-msg-delete-modal .modal-body{
            height: 85px;
            font-size: 17px;
        }

        #sendDeleteSentItemCount{
            color: red;
            font-weight: bold;
        }

        #send-msg-delete-modal .modal-footer{
            height: 45px;
            border-top: none;
            padding: 0px;
        }

        #send-msg-delete-modal .modal-footer>button{
            width: 50%;
            height: 100%;
            font-size: 22px;
            margin: 0px;
            border: none;
        }

        #send-msg-delete-modal .modal-footer>button:hover{
            font-weight: bold;
        }
        #send-msg-delete-modal .modal-footer>button:focus{
            outline: none;
        }

        #send-msg-delete-modal .modal-footer>button:first-child{
            background-color: rgb(224,224,224);
            color: rgb(51,51,51);
        }

        #send-msg-delete-modal .modal-footer>button:last-child{
            background-color: rgb(231,76,60);
            color: white;
        }
    </style>
    <!-- The Modal -->
    <div class="modal fade" id="send-msg-delete-modal">
        <div class="modal-dialog">
            <div class="modal-content">
            
                <!-- Modal Header -->
                <div class="modal-header">
                    <p class="modal-title">쪽지 삭제</p>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <form action="" method="POST">                  
                    <!-- 넘어온 배열은 !!! 알아서 ,를 기준으로 싸그리 문자열로 들어간다! -->
                    <input type="hidden" id="sendSeMultiSentSelectMsgNo" name="" value="">  
                    <!-- Modal body -->
                    <div class="modal-body">
                        선택하신 (<span id="sendDeleteSentItemCount">갯수</span>)개 의 <br>
                        쪽지를 삭제하시겠습니까?
                    </div>
                    
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" data-dismiss="modal">취소</button>
                        <button type="button" onclick="stMsgMoveToRB();">삭제</button>
                    </div>
                </form>
                
            </div>
        </div>
    </div>

<%-------------------------------------------보낸 쪽지함 삭제 모달 끝---------------------------------------------------- --%>  
<%-------------------------------------------휴지통 영구 삭제 모달 시작 ---------------------------------------------------- --%>
    <style>
        #recycle-bin-msg-delete-modal .modal-content{width: 365px; height: 182px; transform: translate(130px, 150px);}
        #recycle-bin-msg-delete-modal .modal-header{height: 52px; border-bottom: none;}
        #recycle-bin-msg-delete-modal .modal-header>p{color: rgb(231,76,60); font-size: 22px; font-weight: bold;}
        #recycle-bin-msg-delete-modal .modal-body{height: 85px; font-size: 15px; padding-top: 5px ;}
        #receive-deleteItemCount, #sent-deleteItemCount {color: red; font-weight: bold;}
        #recycle-bin-msg-delete-modal .modal-footer{height: 45px; border-top: none; padding: 0px;}
        #recycle-bin-msg-delete-modal .modal-footer>button{width: 50%; height: 100%; font-size: 22px; margin: 0px; border: none;}
        #recycle-bin-msg-delete-modal .modal-footer>button:hover{font-weight: bold;}
        #recycle-bin-msg-delete-modal .modal-footer>button:focus{outline: none;}
        #recycle-bin-msg-delete-modal .modal-footer>button:first-child{color: rgb(51,51,51); background-color: rgb(224,224,224);}
        #recycle-bin-msg-delete-modal .modal-footer>button:last-child{color: white; background-color: rgb(231,76,60);}
    </style>

    <script>
        function openRecycleBinDelete(){
            var  eachCheck = $("#recycle-bin-msg-table input:checkbox[name=tossNo]:checked");

            if(eachCheck.length == 0){
                alert("해당 기능은 체크 박스를 선택 해야 이용가능합니다.");
            }else{
                // 쪽지 번호들을 배열에 담았다. 
                var multiRecieveMSGVal = []; // 휴지통에있는 받은 쪽지 번호들
                var multisentMSGVal = [];  // 휴지통에 있는 보낸 쪽지 번호들
                
                eachCheck.each(function(){
                    //console.log($(this).val().slice(0,$(this).val().indexOf(',')));
                    if($(this).val().slice(-2) == 'rm'){// 받은 쪽지 번호들 multiRecieveMSGVal배열에 담기  
                        var receiveCheckedItem = $(this).val().slice(0,$(this).val().indexOf(','));
                        multiRecieveMSGVal.push(receiveCheckedItem);
                    }else{ // 보낸 쪽지 번호들 multiSentMSGVal배열에 담기
                        var sentCheckedItem = $(this).val().slice(0,$(this).val().indexOf(','));
                        multisentMSGVal.push(sentCheckedItem);
                    }
                })
                // console.log(multiRecieveMSGVal);
                // console.log(multisentMSGVal);

                $("#recycle-bin-msg-delete-modal #receive-multiSelectMsgNo").val(multiRecieveMSGVal);    
                $("#recycle-bin-msg-delete-modal #sent-multiSelectMsgNo").val(multisentMSGVal);    

                $("#recycle-bin-msg-delete-modal #receive-deleteItemCount").text(multiRecieveMSGVal.length);    
                $("#recycle-bin-msg-delete-modal #sent-deleteItemCount").text(multisentMSGVal.length);    
                $("#recycle-bin-msg-delete-modal").modal();
            }
        }
    </script>
    <!-- The Modal -->
    <div class="modal fade" id="recycle-bin-msg-delete-modal">
        <div class="modal-dialog">
            <div class="modal-content">
            
                <!-- Modal Header -->
                <div class="modal-header">
                    <p class="modal-title">쪽지 삭제</p>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <form action="" method="POST">                  
                    <!-- 넘어온 배열은 !!! 알아서 ,를 기준으로 싸그리 문자열로 들어간다! 배열 두개를 넘긴다 !! name 잘지정해줘 !  -->
                    <input type="hidden" id="receive-multiSelectMsgNo" name="" value="">  
                    <input type="hidden" id="sent-multiSelectMsgNo" name="" value="">  
                    <!-- Modal body -->
                    <div class="modal-body">
                        선택하신 (<span id="receive-deleteItemCount">갯수</span>)개 의 <span style="color:rgb(144, 144, 247); font-weight: bold;">받은쪽지</span>와<br>
                        선택하신 (<span id="sent-deleteItemCount">갯수</span>)개 의 <span style="color: rgb(109, 230, 109); font-weight: bold; ">보낸쪽지</span>를<br>
                        영구 삭제 하시겠습니까?
                    </div>
                    
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" data-dismiss="modal">취소</button>
                        <button type="submit" data-dismiss="modal" onclick="">삭제</button>
                    </div>
                </form>
                
            </div>
        </div>
    </div>

<%-------------------------------------------휴지통 영구 삭제 모달 끝---------------------------------------------------- --%>
<%-------------------------------------------휴지통 복구 모달 시작 ---------------------------------------------------- --%>
    <style>
        #recycle-bin-msg-restore-modal .modal-content{width: 365px; height: 182px; transform: translate(130px, 150px);}
        #recycle-bin-msg-restore-modal .modal-header{height: 52px; border-bottom: none;}
        #recycle-bin-msg-restore-modal .modal-header>p{color: rgb(138,211,169); font-size: 22px; font-weight: bold;}
        #recycle-bin-msg-restore-modal .modal-body{height: 85px; font-size: 15px; padding-top: 5px ;}
        #rs-receive-deleteItemCount, #rs-sent-deleteItemCount {color: blue; font-weight: bold;}
        #recycle-bin-msg-restore-modal .modal-footer{height: 45px; border-top: none; padding: 0px;}
        #recycle-bin-msg-restore-modal .modal-footer>button{width: 50%; height: 100%; font-size: 22px; margin: 0px; border: none;}
        #recycle-bin-msg-restore-modal .modal-footer>button:hover{font-weight: bold;}
        #recycle-bin-msg-restore-modal .modal-footer>button:focus{outline: none;}
        #recycle-bin-msg-restore-modal .modal-footer>button:first-child{color: rgb(51,51,51); background-color: rgb(224,224,224);}
        #recycle-bin-msg-restore-modal .modal-footer>button:last-child{color: white; background-color: rgb(138,211,169);}
    </style>

    <script>
        function openRecycleBinResorte(){
            var  eachCheck = $("#recycle-bin-msg-table input:checkbox[name=tossNo]:checked");

            if(eachCheck.length == 0){
                alert("해당 기능은 체크 박스를 선택 해야 이용가능합니다.");
            }else{
                // 쪽지 번호들을 배열에 담았다. 
                var multiRecieveMSGVal = []; // 휴지통에있는 받은 쪽지 번호들
                var multisentMSGVal = [];  // 휴지통에 있는 보낸 쪽지 번호들
                
                eachCheck.each(function(){
                    //console.log($(this).val().slice(0,$(this).val().indexOf(',')));
                    if($(this).val().slice(-2) == 'rm'){// 받은 쪽지 번호들 multiRecieveMSGVal배열에 담기  
                        var receiveCheckedItem = $(this).val().slice(0,$(this).val().indexOf(','));
                        multiRecieveMSGVal.push(receiveCheckedItem);
                    }else{ // 보낸 쪽지 번호들 multiSentMSGVal배열에 담기
                        var sentCheckedItem = $(this).val().slice(0,$(this).val().indexOf(','));
                        multisentMSGVal.push(sentCheckedItem);
                    }
                })
                // console.log(multiRecieveMSGVal);
                // console.log(multisentMSGVal);

                $("#recycle-bin-msg-restore-modal #rs-receive-multiSelectMsgNo").val(multiRecieveMSGVal);    
                $("#recycle-bin-msg-restore-modal #rs-sent-multiSelectMsgNo").val(multisentMSGVal);    

                $("#recycle-bin-msg-restore-modal #rs-receive-deleteItemCount").text(multiRecieveMSGVal.length);    
                $("#recycle-bin-msg-restore-modal #rs-sent-deleteItemCount").text(multisentMSGVal.length);    
                $("#recycle-bin-msg-restore-modal").modal();
            }
        }
    </script>
    <!-- The Modal -->
    <div class="modal fade" id="recycle-bin-msg-restore-modal">
        <div class="modal-dialog">
            <div class="modal-content">
            
                <!-- Modal Header -->
                <div class="modal-header">
                    <p class="modal-title">쪽지 복구</p>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <form action="" method="POST">                  
                    <!-- 넘어온 배열은 !!! 알아서 ,를 기준으로 싸그리 문자열로 들어간다! 배열 두개를 넘긴다 !! name 잘지정해줘 !  -->
                    <input type="hidden" id="rs-receive-multiSelectMsgNo" name="" value="">  
                    <input type="hidden" id="rs-sent-multiSelectMsgNo" name="" value="">  
                    <!-- Modal body -->
                    <div class="modal-body">
                        선택하신 (<span id="rs-receive-deleteItemCount">갯수</span>)개 의 <span style="color:rgb(144, 144, 247); font-weight: bold;">받은쪽지</span>와<br>
                        선택하신 (<span id="rs-sent-deleteItemCount">갯수</span>)개 의 <span style="color: rgb(109, 230, 109); font-weight: bold; ">보낸쪽지</span>를<br>
                        쪽지함으로 복구 하시겠습니까?
                    </div>
                    
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" data-dismiss="modal">취소</button>
                        <button type="submit" data-dismiss="modal" onclick="">복구</button>
                    </div>
                </form>
                
            </div>
        </div>
    </div>

<%-------------------------------------------휴지통 복구 모달 끝---------------------------------------------------- --%>
<%-----------------------------------------------------------유저 신고상세 모달 영역 시작----------------------------------------------------------%>	
<!-- 모달 jsp쪽으로 옮겨줘야해  -->


<style>
    /* 모달 영역 */
    #user-report-detail-modal th{
        width: 80px;
    }
    #user-report-detail-modal td{
        width: 200px;
    }
    #user-report-detail-modal .modal-content{
        width: 635px; height: 410px;transform: translate(-18%, 35%); background-color :rgb(250,250,250);
    }
    #user-report-detail-modal .modal-header{height: 90px; border-bottom: none;}
    #user-report-detail-modal .modal-header-bottom{height: 30px;  border-bottom: 1px solid lightgrey; display: flex; justify-content: space-between;}
    #user-report-detail-modal .modal-header-bottom>span{
        color: red;
        padding-left: 15px;
        font-weight: bold;
    }

    #user-report-detail-modal .modal-header-bottom>button{
        color: white;
        font-size: 11px;
        width: 60px;
        height: 25px;
        background-color:rgb(52,152,219);
        outline: none;
        border: none;
        border-radius: 5px;
        letter-spacing: -0.3px;
        margin-right: 10px;
    }
    .view-user-report-content{width: 635px; height: 225px; display: flex; justify-content: space-around; }
    
    #user-report-detail-modal .modal-body{
        padding: 0px;
    }
    #user-report-detail-modal .modal-footer{
        justify-content: flex-start;
        color: red;
        font-weight: bold;
        font-size: 14px;
    }

    .left-content , .right-content{width: 305px;}	
	.left-content>p, .right-content>p, .modal-footer>p{font-size: 18px; font-weight: bold ; margin: 0px; padding-left: 10px;}
	.left-content>pre{width: 100%; height: 200px; color: rgb(106,102,97); padding: 8px ; border-radius: 5px ; background-color: rgb(190,190,190) ; letter-spacing: -0.5px; white-space:pre-wrap;  word-break:keep-all; text-overflow:clip;}
	.right-content>textarea{width: 100%; height: 200px; padding: 8px ; border-left: 1px solid rgb(133, 133, 133); border-radius: 5px; resize: none;}

</style>

<!-- The Modal -->
<div class="modal fade" id="user-report-detail-modal">
    <div class="modal-dialog">
        <div class="modal-content" >
        
            <!-- Modal Header -->
            <div class="modal-header">
                <table>
                    <!-- 값 뿌려줄 영역 -->
                    <tr>
                        <th >신고대상</th>
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
                        <th>처리상태</th>
                        <td>처리중</td>
                    </tr>
                </table>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-header-bottom">
                <span>※ 신고 시간으로부터 하루가 지나면 신고 철회가 불가합니다.</span>
                <button type="button" onclick="cancelReportMsg(1);">신고 철회</button>
            </div>

            
            <!-- Modal body -->
            <div class="modal-body">
                <div class="view-user-report-content">
                    <div class="left-content">
                        <p>※ 신고내용</p>
                        <!-- 값뿌려주기-->
                        <pre>쪽지 내용이 어쩌구 저쩌구 합니다 기분나빠서 오랜 고민끝에  신고합니다 처리 부탁드려요 ! 
                        </pre>
                    </div>
                    <div class="right-content">
                        <p class="text-purple">※ 답변내용</p>
                        <textarea name="" readonly></textarea>
                    </div>
                </div>
            </div>
            
            <!-- Modal footer -->
            <div class="modal-footer">
                ※ 처리상태가 "처리중" 이외의 상태는 도와드리기 어렵습니다. <br>
                ※ 문제가 있을 시 개발부서로 연락 부탁드립니다.
            </div>
        </div>
    </div>
</div>



<%-----------------------------------------------------------유저 신고상세 모달 영역 끝----------------------------------------------------------%>	

</body>
</html>