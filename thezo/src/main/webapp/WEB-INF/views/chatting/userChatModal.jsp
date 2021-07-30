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
</head>
<body>
    <!-- 모달로다가 ! 하나 친구 추가하는 것빼는게 좋을듯  그래야 로직처리가 가능해-->
    <!-- 친구추가용 모달 하나 -->
    <%-- ---------------------------친구 추가용 모달 시작------------------------- --%>
    <script>
        function openAddColleague(){
                $("#add-colleague-modal").modal();
        }
    </script>

    <style>
        #add-colleague-modal .modal-content{
            width: 350px;
            height: 180px;
            transform: translate(20%, 80%);
        }

        #add-colleague-modal .modal-header{
            background-color:rgb(56,77,97);
            color: white;
            font-size: 22px;
            font-weight: bold;
        }

        #add-colleague-modal .close{
            color: white;
        }

        #add-colleague-modal .modal-body>span{
            font-weight: bold;
            margin-right: 5px;
            font-size: 18px;
        }

        #add-colleague-modal .modal-body>input{
            width: 180px;
            margin: 0px;
            transform: translateX(1px);
            background-color: lightgrey;
            outline: none;
            border: 1px solid black;
            height: 26.4px;
            font-size: 15px;
            letter-spacing: -0.3px;
        }

        #add-colleague-modal .modal-body>button{
            background-color:rgb(56,77,97);
            color:white;
            transform: translateX(-10px);
        }

        #add-colleague-modal .modal-footer{
            justify-content: flex-start;
            padding: 0px;
            height: 45px;
        }

        #add-colleague-modal .modal-footer>button{
            width: 50%;
            height: 100%;
            outline: none;
            border: none;
            margin: 0px;
            font-weight: bold;
        }

        
        #add-colleague-modal .modal-footer>button:first-child{
            background-color: rgb(224,224,224);
        }
        #add-colleague-modal .modal-footer>button:last-child{
            color: white;
            background-color: rgb(52,152,219);
        }
        #add-colleague-modal .modal-footer>button:hover{
            font-size: 18px;
            color: orange;
        }
    </style>

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
                        <button type="button" onclick="addColleageuAndMakeRoom();">추가하기</button>
                    </div>
                
            </div>
        </div>
    </div>
    <script>
        function addColleageuAndMakeRoom(){
            // 위에서 ! 사원번호 가져와서 ! 
            // 친구 추가하고 ! 
            // 동시에 채팅방 만들어 

            $("#add-colleague-modal").modal('hide');

        }
    </script>

    <%-- ---------------------------친구 추가용 모달 끝------------------------- --%>
    <%-- ------------------------------------------사진 보기 모달은 공용이다.------------------------------------------ --%>

    <style>
        #chatAndProfileImage-modal .modal-content{
            width: 500px;
            max-height: 620px;
            transform: translateY(40px);
        }

        #chatAndProfileImage-modal .modal-header{
            height: 50px;
            border-bottom: none;
        }

        #chatAndProfileImage-modal .modal-header>p{
            font-size: 24px;
            font-weight: bold;
            color: tomato;
        }

        #chatAndProfileImage-modal .modal-body{
            height: 530px;
        }

        #chatAndProfileImage-modal .modal-body>img{
            width: 100%;
            height: 100%;
            object-fit: contain;
        }
        
        #chatAndProfileImage-modal .modal-footer{
            /* display: none; */
            height: 40px;
            border-top: none;
            padding: 0px;
        }

        #chatAndProfileImage-modal .modal-footer>button{
            width: 100px;
            height: 34px;
            color: white;
            background: darkgray;
            font-weight: bold;
            border: none;
            outline: none;
            border-radius: 5px;
            margin: 0px 15px 5px 0px;
        }
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
                        <button type="button" onclick="">다운로드</button>
                    </div>
                
            </div>
        </div>
    </div>
    


    <!-- 사진보기용 모달 하나. -->
    <script>    
        function oneClickOpenImage(imgSrc){
            $("#chatAndProfileImage-modal").modal();
        }
    </script>
    
    <%-- ------------------------------------------사진 보기 모달은 공용임 끝------------------------------------------ --%>

    <%-- -------------------------단톡방 만드는 모달 시작------------------------------------------------%>   

    <style>
        #createGroupChat-Modal .modal-content{
            width: 320px;
            height: 520px;
            font-family:'Noto Sans KR', sans-serif;
            border-radius: 15px;
            overflow: hidden;
            margin-left: 100px;
            margin-top: 150px;
        }
        #createGroupChat-Modal .modal-header{
            background-color: rgb(56,77,97);
            color: white;
            font-size: 22px;
            font-weight: bold;
            height: 65px;
        }

        #createGroupChat-Modal .modal-header .close{
            color: white;
        }

        #createGroupChat-Modal .modal-header>p{
            display: none;
        }

        #createGroupChat-Modal .modal-body{
            overflow-y: scroll;
            height: 410px;
        }

        #createGroupChat-Modal .modal-body::-webkit-scrollbar{width: 10px; display: block;}
        #createGroupChat-Modal .modal-body::-webkit-scrollbar-thumb{border: 2px solid transparent; border-radius: 5px; background-clip: padding-box; background-color: rgb(41,128,185);}
        #createGroupChat-Modal .modal-body::-webkit-scrollbar-track{border-radius: 5px; box-shadow: inset 0px 0px 5px white; background-color: rgb(215, 238, 247);}    

        #createGroupChat-Modal .modal-body>table{
            width: 100%;
        }

        #createGroupChat-Modal .modal-body>table>thead>tr{
            font-size: 18px;
            border-bottom: 3px solid darkgray;
        }


        #createGroupChat-Modal .modal-body>table>tbody>tr{
            height: 70px;
            display: flex;
            align-items: center;
        }

        #createGroupChat-Modal .modal-body>table>tbody>tr:hover{
            background-color: lightcyan;
        }

        #createGroupChat-Modal .modal-body>table>tbody td:nth-child(1){
            width: 60px;
            height: 60px;
            overflow: hidden;
        }

        #createGroupChat-Modal .modal-body>table>tbody td:nth-child(1)>img{
            width: 58px;
            height: 58px;
            border-radius:  26px;
            object-fit: cover;
        }

        #createGroupChat-Modal .modal-body>table>tbody td:nth-child(2){
            width: 190px;
            line-height: 58px;
            font-weight: bold;
            padding-left: 20px;
        }

        #createGroupChat-Modal .modal-body>table>tbody td:nth-child(4){
            text-align: center;
        }
        #createGroupChat-Modal .modal-body>table>tbody input[type=checkbox]{
            width: 30px;
            height: 30px;
            border-radius: 50%;
            margin-top: 4px;
        }

        
        #createGroupChat-Modal .modal-footer{
            height: 45px;
            padding: 0px;
        
        }

        #createGroupChat-Modal .modal-footer>button{
            margin: 0px;
            width: 50%;
            height: 100%;
            border: none;
            outline: none;
            font-size: 18px;
            font-weight: bold;
        }

        
        #createGroupChat-Modal .modal-footer>button:nth-child(2), #createGroupChat-Modal .modal-footer>button:nth-child(3), #createGroupChat-Modal .modal-footer>button:nth-child(4){
            background-color: rgb(66,87,107);
            color: white;
        }
        
        #createGroupChat-Modal .modal-footer>button:hover{
            color: orange;
            font-size: 20px;
        }
    </style>

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

                    <!-- form태그 쓰지마 -->

                    <!-- Modal body -->
                    <div class="modal-body">
                        <div id="beforeCreateGroupRoom" style="display: none;">
                            <span style="font-size: 18px;"><b>※ 단체 채팅방 이름</b></span><input type="text" id="group-room-name-content" name="" style="padding-left: 10px;" required>
                        </div>
                        <table id="my-colleage-group-list">
                            <thead>
                                <tr>
                                    <th>나의 동료 목록</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- 동적생성임  -->
                                <tr>
                                    <td>
                                        <img src="data:image/jpeg;base64,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" alt="">
                                    </td>
                                    <td>
                                        신재원 사원 
                                    </td>
                                    <td>
                                        <!-- 여기사원번호 박아 넣으면 된다. 그리고 자바스크립트로 배열로다가 담아서 controller단으로 넘긴다. -->
                                        <input type="checkbox" name="myCollegueNo" value="1">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <img src="data:image/jpeg;base64,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" alt="">
                                    </td>
                                    <td>
                                        신재원 사원 
                                    </td>
                                    <td>
                                        <!-- 여기사원번호 박아 넣으면 된다. 그리고 자바스크립트로 배열로다가 담아서 controller단으로 넘긴다. -->
                                        <input type="checkbox" name="myCollegueNo" value="1">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <img src="data:image/jpeg;base64,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" alt="">
                                    </td>
                                    <td>
                                        신재원 사원 
                                    </td>
                                    <td>
                                        <!-- 여기사원번호 박아 넣으면 된다. 그리고 자바스크립트로 배열로다가 담아서 controller단으로 넘긴다. -->
                                        <input type="checkbox" name="myCollegueNo" value="1">
                                    </td>
                                </tr>
                            </tbody>

                        </table>
                    </div>
                    
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" data-dismiss="modal">취소</button>
                        <button type="button" class="create-group-btn" style="display: none;" onclick="createAndMoveToGroupChat();">단체톡 만들기</button>
                        <button type="button" class="add-group-btn" style="display: none;" onclick="createAndMoveToGroupChat();">인원 추가</button>
                        <button type="button" class="change-room-name" style="display: none;" onclick=";">방이름 바꾸기</button>
                    </div>
                
            </div>
        </div>
    </div>

    <script>
        function openCreateGroupChat(mode){
            //값뿌려주면서 모달 열기 전에 ! 
            // 일단 1. 이게 단톡방에서 열은 모달인지 동료창에서 열은 모달인지 확인을 해야한다. 
            // JSTL로다가 만약에 방번호가 이미 있다면 ! 그떄는 ! 추가하는 방향으로 진행을 하고 
            // 아니면 기존에 내가 가진 동료를 싸그리 보여주는 형식이다. 
            // 추가같은 경우 방번호에 이미 나의 친구가 추가되어있다면 걔는 제외한 나머지가 추가되게 해줘야한다. 
            //console.log(mode);
            if(mode == 'gc'){
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

            }else{//mode 인자에 cgn 이 들어가있다. 
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
                
            }
            $("#createGroupChat-Modal").modal();
        }

        function createAndMoveToGroupChat(){
            // ajax처리싸그리하고 ! 
            // 이동시키는것 해야해.. 

            $("#createGroupChat-Modal").modal('hide');
        }
    </script>
    <%-- -------------------------단톡방 만드는 모달 끝------------------------------------------------%>   




</body>
</html>