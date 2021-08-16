<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- @Author Jaewon.s -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="Jaewon.s">
<title>header</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous"> 
<style>
    #forFixedAndScroll{width: 100%; position: fixed; top: 0px; background: white; z-index:10;}

    /* 스크롤 숨겨버리기 */
    body {-ms-overflow-style: none;/* IE and Edge */ scrollbar-width: none; /* Firefox */}
	body::-webkit-scrollbar {display: none; /* Chrome, Safari, Opera*/}

    /* 스크롤 꾸미기  안씀   */
    /* ::-webkit-scrollbar {width: 15px; display: block; background: rgb(20,70,104) ;}
    ::-webkit-scrollbar-track {max-height: 50%; height: 50%;  background-color:rgb(20,70,104); margin-top: 70px;}
    ::-webkit-scrollbar-thumb {box-shadow: inset 0px 0px 5px orangered; border: 2px solid transparent; border-radius: 5px; background-clip: padding-box; background-color: rgb(215, 238, 247);} */

    header{width: 100%; background-color: rgb(20,70,104);} 
    #header-outer{ width: 1200px; height: 70px; margin: auto;}
    .logo-area{ width: 70px; height: 70px; float: left; }
    .logo-area img{height: 96%; object-fit: contain;}    
    .menu-outer{width: 740px; height: 100%; float: right; display: flex; justify-content: flex-end;}
    .menu-area{width: 100%; height: 100%; list-style-type: none; display: flex; justify-content: space-between;}
    .menu-area>li {color: white; font-weight: bold; position: relative;}
    .menu-area>li>a{ color: white; font-weight: bold; text-decoration: none; padding: 0px 8px; height: 100%; line-height: 72px; display: inline-block;}
    .menu-area>li>a:hover{color:rgb(243,156,18) ;}
    #user-basic-info{font-size: 15px;}
    #user-basic-info>a{margin-left: 5px; padding-right: 0px; color: rgb(243,156,18); font-size: 17px;}
    #user-basic-info>a:hover{color: palegreen;}
    
    /* 1. 세부 메뉴들 */
    .menu-outer>ul>li>ul{ width: 120px; padding:5px 0px; line-height: 22px; font-size: 14px; list-style-type:none; background: rgb(224,224,224); z-index : 5; position: absolute; border-bottom-left-radius: 5px ; border-bottom-right-radius: 5px ; display: none;}
    .menu-outer>ul>li>ul>li>a{ color: rgb(80, 80, 80); font-size: 15px; text-decoration: none; width: 100%; display: block; padding: 2px 10px;}
    .menu-outer>ul>li>ul>li>a:hover{ color: tomato;} 
    /* 1_1. 세부메뉴들 (요 두개가 핵심임)  */
    .menu-outer>ul>li>a:hover+ul{display: block;}
    .menu-outer>ul>li>ul:hover{display:block;}
    
    /* 2. 관리자 모드 클릭시 ! 열리는 서브메뉴  */
    #admin-header{width: 100%; height: 45px; display:none;}
    #admin-nav{width: 1170px; height: 100%; line-height: 45px; border-bottom: 1px solid rgb(136,136,136);  margin: auto; padding-right: 10px; display: flex;}
    #admin-nav>span{ width: 250px; font-size: 18px; font-weight: bolder; padding: 0px 10px;}
    #admin-nav>ul{width: 100%; height: 100%; list-style-type: none; display: flex; justify-content: space-around; }
    #admin-nav>ul>li{height: 100%;}
    #admin-nav>ul>li>a{height: 100%; color: rgb(100, 100, 100); font-weight: bold; text-decoration: none; padding: 0px 12px; display: block;}
    #admin-nav>ul>li>a:hover{color: rgb(243,156,18);}

    /* 3. admin 세부 메뉴들 */
    #admin-nav>ul>li>ul{ width: 135px; padding: 5px 0px; line-height: 22px; font-size: 14px; list-style-type:none; background: rgb(224,224,224); z-index : 5; position: absolute; border-bottom-left-radius: 5px ; border-bottom-right-radius: 5px ;
        display: none;
    }
    #admin-nav>ul>li>ul>li>a{ color: rgb(80, 80, 80); font-size: 14px; font-weight: bold; text-decoration: none; width: 100%; display: block; padding: 2px 10px;}
    #admin-nav>ul>li>ul>li>a:hover{ color: tomato;} 
    /* 3_1. 세부메뉴들 (요 두개가 핵심임)  */
    #admin-nav>ul>li>a:hover+ul{display: block;}
    #admin-nav>ul>li>ul:hover{display:block;}
    /* ↑↑↑↑↑↑↑↑↑↑ 손댈것들 없다.↑↑↑↑↑↑↑↑↑↑     CSS는 건들지 말아주세요 ㅜㅜ   */

    /* 4. messanger 영역  (빡센구간)*/
    #messenger-area{height: 100%; width: 60px; background-image: url("resources/images/chatLogo.png"); background-size: cover; position: relative; cursor: pointer;}
    #messenger-area > div{position: absolute; top:16%; right:2%; display: none; }
    #chat-on > i{ color: red;   text-shadow: 0 0 7px #fff, 0 0 10px #fff, 0 0 21px #fff, 0 0 42px rgb(255, 0, 170), 0 0 82px rgb(255, 0, 0), 0 0 92px rgb(255, 0, 170), 0 0 102px rgb(255, 0, 170), 0 0 151px rgb(255, 0, 170); }

    /* 알림영역 */
    #messenger-area .notification-outer{ width: 325px; border: 1px solid orange; z-index: 1000; transform: translateX(1px); background-color: white; max-height: 660px; display: block;  top: 70px; padding-bottom: 3px;}
    .notification-innerline{ width: 310px; margin: auto; background-color: rgb(245,238,248); max-height: 655px; padding-bottom: 7px;}

    /* ★ 추가 */
    #messenger-outer{width: 325px; height: 535px; border: 1px solid orange; padding-bottom: 3px; z-index: 1000; transform: translateX(1px); background-color: white;}
    .messenger-inner{width: 310px; margin: auto; background-color: rgb(245,238,248); height: 520px; margin: 7px; padding-top: 3px;}
    .messenger-navarea{width: 300px; margin: auto; display: flex; justify-content: space-between;}
    .messenger-navarea>div{cursor: pointer; color: white;border-radius: 2px; background-color: rgb(244,185,99);}
    .messenger-navarea>div:hover{color: paleturquoise; transform: scale(1.02);}
    .chat-menu, .message-menu{width: 123px; height: 42px; display: flex; justify-content: space-around; align-items: center;}
    .notification-menu{width: 46px; height: 42px; color: white; font-size: 28px; font-weight: bolder; text-align: center;}
    .chat-menu>i, .message-menu>i{font-size: 30px; line-height: 38px; margin-left: 10px;}
    .message-menu>i{font-size: 28px; margin-right: 2px;}
    .chat-menu>span, .message-menu>span{font-size: 16px; font-weight: bold; margin-left: 3px;-ms-user-select: none; -moz-user-select: -moz-none;-khtml-user-select: none; -webkit-user-select: none; user-select: none;}
    .chat-menu>div, .message-menu>div{width: 28px; height: 28px; color: orangered; text-align: center; line-height: 28px; font-size: 11px; font-weight: bold; margin-right: 3px; border-radius: 50%; background-color: white;
        -ms-user-select: none; 
        -moz-user-select: -moz-none;
        -khtml-user-select: none;
        -webkit-user-select: none;
        user-select: none;
    }

    /* ★ 모든 팀원의 각각페이지 영역 쓰는 공통 영역 ★*/
    section{width: 100%; }
    .outer{width: 1200px; margin: auto;  font-family:'Noto Sans KR', sans-serif; }
</style>

</head>
<body>
	<c:if test="${!empty alertMsg }">
		<script>	
			alert("${alertMsg}");
		</script>
        <!-- 뭔가가 담겨있는 경우 -->	
		<c:remove var="alertMsg" scope="session"/>	
	</c:if>

    <div id="forFixedAndScroll">
        <header>
            <div id="header-outer"> <%-- header-outer 영역시작 --%>
                <div class="logo-area">
                    <a href="<%= request.getContextPath() %>">
                    	<c:choose>
                    		<c:when test="${!empty sessionScope.pageType and sessionScope.pageType eq 'AdminPage'}">
              					<img src="resources/images/TheZoLogoA.png">
                    		</c:when>
                    		<c:otherwise>
		                        <img src="resources/images/TheZoLogo.png">
                    		</c:otherwise>
                    	</c:choose>
                    </a>
                </div>
<%------------------------------------------------------------------------------------------------------------------------ --%>
<%--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓사용자 메뉴 영역 (urlMapping값 달아주세요)↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ --%>
                <div class="menu-outer">
                    <ul class="menu-area">
                        <li><a href="main" style="padding: 0px 12px;">홈</a></li>
                    
                        <%-- 게시판 담당하시는분 아래 href에 ! url mapping값 달아주세요~  --%>
                        <li><a href="noticeList.bo">게시판</a>
                            <ul>
                                <li><a href="noticeList.bo">공지사항</a></li>
                                <li><a href="list.doc">문서관리</a></li>
                                <li><a href="marketList.bo">벼룩시장</a></li>
                                <li><a href="boardList.bo">사내게시판</a></li>
                            </ul>
                        </li>

                        <%-- 연락처 담당하시는분 아래 href에 ! url mapping값 달아주세요~  --%>
                        <li><a href="contactInfo.me">연락처</a>
                            <ul>
                                <li><a href="contactInfo.me">직원 연락처</a></li>
                                <li><a href="">조직도</a></li>
                                <li><a href="company.info">회사정보</a></li>
                            </ul>
                        </li>

                        <%-- 메일함 담당하시는분 아래 href에 ! url mapping값 달아주세요~  --%>
                        <li><a href="main.mail">메일함</a></li>
                        <li><a href="main.appr">전자결재</a></li>
                        <li><a href="main.sc">일정관리</a></li>

                        <c:if test="${loginUser.memId eq 'admin' }">
                            <li><a href="javascript:showAdminNav()" style="font-size: 17px; color: gray;" id="admin-mode">관리자모드</a></li>
                        </c:if> 
        

                        <%-- 연락처 담당하시는분 아래 href에 ! url mapping값 달아주세요~  --%>
                        <li id="user-basic-info"><a href="">${loginUser.memName}</a>님 반가워요 &nbsp;
                            <ul style="z-index: 10000;">
                                <li><a href="myPage.me">내 정보 수정</a></li>
                                <li><a href="attendance.ma">근태관리</a></li>
                                <li><a href="logout.me">로그아웃</a></li>
                            </ul>
                        </li>
                    </ul>
<%--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ --%>
<%------------------------------------------------------------------------------------------------------------------------ --%>
                    <!-- ★ 바뀐 부분으로 여기가 내가 작업 해야할 영역이다!!  -->
                    <div id="messenger-area" onclick="showMessengerArea();">
                        <!-- ※ 알림 영역 읽지 않은 알림이 있을시 ! -->
                        
                        <!-- 성경님이 로그인쪽 만들어주면 그쪽에서 service호출을 해주면 되는것으로 후에 완성해주시면 그떄 다시 재작업 하자!  -->
                        <!--  <script>
               				$.ajax({
               					url:"check.nf",
               					data:{memNo: "${sessionScope.loginUser.memNo}"},
               					success:function(count){
               						console.log("읽지않은 알림 조회 성공 / 읽지않은 알림 갯수 " + count);
               					},error:function(){
               						console.log("ajax통신 실패");
               					}
               				})	               				
                        </script> -->
                        <c:if test="${!empty unreadNotification}">
                            <div class="notification-outer">
                                <div class="notification-innerline" onclick="event.cancelBubble=true">
                                    <jsp:include page="../notification/unreadNotification.jsp"/>
                                </div>
                            </div>               
                        </c:if>

                        <!-- ★★★★ 채팅 영역이 될것임! ★★★★ -->
                        <!-- 해당 로고 클릭시 turn on --> 
                        <div id="chat-on" ><i class="fas fa-power-off fa-lg w3-animate-opacity"></i></div>
                        <!--★★★★ 여기서의 조건식은 읽지 않은 쪽지와, 채팅을 비교해야하는데 임시로 loginUser박은것-->
                        <!-- 읽지 않은 메세지 혹은 쪽지가 있을 경우!!!-->
                        <div id="nf-on" style="display:none"><i class="fas fa-exclamation-circle fa-lg w3-animate-opacity" style="color: rgb(243,156,18);"></i></div>
                        <!-- 해당 로고 클릭시 turn off (기본값) -->
                        <div id="chat-off" style="display:none"><i class="fas fa-power-off fa-lg w3-animate-opacity" style="color: gray;"></i></div>

                        <!-- ★ 여기가 기본적인 messenger영역으로 자리가 잡힐것이다. -->
                        <div id="messenger-outer" class="w3-animate-opacity" onclick="event.cancelBubble=true" style="top: 70px; right: 0px; cursor:auto;">
                            <div class="messenger-inner">
                                <div class="messenger-navarea" >
                                    <div class="chat-menu w3-animate-opacity" onclick="moveToChat();">
                                        <i class="far fa-comment-dots"></i>
                                        <span>채팅</span>
                                        <div class="chatUnreadCount"></div>
                                    </div>
                                    <div class="message-menu w3-animate-opacity" onclick="moveToMessage();">
                                        <i class="fas fa-comment-alt"></i>
                                        <span>쪽지</span>
                                        <div class="msgUnreadCount"></div>
                                    </div>
                                    <div class="notification-menu w3-animate-opacity" onclick="moveToNotification();">
                                        <div><i class="fas fa-lightbulb"></i></div>
                                    </div>
                                </div>

                                <!-- display none처리를 해줘야한다.  -->
                                <div id="userChatMain" class="w3-animate-opacity">
                                    <jsp:include page="../chatting/userChatMain.jsp"/>
                                </div>
                                <div id="userMessageMain" class="w3-animate-opacity" style="display: none;">
                                    <jsp:include page="../message/userMessageMain.jsp"/>
                                </div>
                                <div id="userNotificationMain" class="w3-animate-opacity" style="display: none;">
                                    <jsp:include page="../notification/userNotificationMain.jsp"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><%-- header-outer 영역 끝 --%>
        </header>
<%------------------------------------------------------------------------------------------------------------------------ --%>
<%--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓관리자 메뉴 영역 (urlMapping값 달아주세요)↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ --%>
        <!-- Admin header영역  개발자 도구에서 볼수없게 jstl 처리함 -->
        <c:if test="${loginUser.memId eq 'admin' }">
            <div id="admin-header" class="w3-animate-opacity">
                <div id="admin-nav">
                    <span>관리자메뉴</span>
                    <ul>
                        <%-- 재원(내꺼) urlMapping값 넣으면됨~ --%> 
                        <li><a href="adminmain">관리자메인</a></li>
        
                        <%-- 해당영역 맡으신분들 ~ urlMapping값 넣어주세요~ --%> 
                        <li><a href="boardReport.bo">게시판관리</a>
	                        <ul>
		                        <li><a href="boardReport.bo">신고 관리</a></li>
		                    </ul>
                        </li>
                        <li><a href="adminDept.ma">인사근태</a>
	                        <ul>
	                            <li><a href="adminDept.ma">부서관리</a></li>
	                            <li><a href="adminAtt.ma">근태관리</a></li>
	                        </ul>
                        </li>
                        <li><a href="memberInfo.me">회원정보</a>
                            <ul>
                                <li><a href="memberInfo.me">회원정보관리</a></li>
                                <li><a href="memberDelete.me">회원 삭제</a></li>
                            </ul>
                        </li>
                        <li><a href="adminMain.appr">전자결재관리</a></li>
                        <li><a href="main.sc">일정관리</a></li>
        
                        <%-- 재원(내꺼) urlMapping값 넣으면됨~ --%> 
                        <li><a href="list.adms">메신저</a>
                            <ul style="z-index:1000">
                                <li><a href="list.adms">쪽지 신고처리</a></li>
                                <li><a href="list.adnf">알림 등록 및 기록</a></li>
                            </ul>
                        </li>
        
                        <%-- 해당영역 맡으신분들 ~ urlMapping값 넣어주세요~ --%> 
                        <li><a href="">조직도</a></li>
	                	<li><a href="adminCompanyInfo.st">회사정보설정</a></li>
                    </ul>
                </div>
            </div>               
        </c:if>
<%--↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ --%>
<%------------------------------------------------------------------------------------------------------------------------ --%>
        <!-- 스크립트 영역 !  -->
        <script>
			$(function(){
				//var adMode = $("#admin-mode");
				if(${loginUser.memId != 'admin'}){				
	            	$("section").css("margin-top","70px");					
				}else{
					var forExceptionCont = document.getElementById("admin-mode").style.color;
					if(forExceptionCont == 'gray'){
	            	$("section").css("margin-top","70px");
					}
				}
				
	          	$.ajax({
			 		url:"checkUnreadMsgAndChat.cht",
					data:{memNo : ${ loginUser.memNo }
	            	},
			 		success:function(result){
						if(result>0){
			            	$("#chat-off").hide();
			                $("#nf-on").show();					
						}else{
			            	$("#chat-off").show();
			                $("#nf-on").hide();										
						}
			 		},error:function(){
			 			console.log("ajax통신 실패");
			 		}				
			 	})
				
				ajaxBringUnreadedMsgCount();
			})
        
            // 관리자 메뉴 토글용도! 
            function showAdminNav() {
                var adminNav = document.getElementById("admin-header");
                adminNav.style.display =(adminNav.style.display != 'block'?"block":"none"); 
                var adminMode = document.getElementById("admin-mode");
                adminMode.style.color = (adminMode.style.color != 'red'?"red":"gray");
                var showdiv = document.getElementById('messenger-outer');
                showdiv.style.top =(adminNav.style.display != 'none'?"114px":"70px");    
                var adminNav = document.getElementById("admin-header");
                $("section").css("margin-top", (adminNav.style.display != 'none'?"115px":"70px"));
            }
            
            //Messenger쪽 기본 세팅 ! ★ 틀 잘잡아야한다!! 해당 영역은 ! include 처리로 가져오는 형식! 
            function showMessengerArea(){           
                var showdiv = document.getElementById('messenger-outer');
                showdiv.style.display =(showdiv.style.display != 'block'?"block":"none");    
                moveToChat();
                $("#chat-on").css("display", (showdiv.style.display != 'block'?"none":"block"));
                $("#chat-off").css("display", (showdiv.style.display != 'block'?"block":"none"));
                
                
	          	$.ajax({
			 		url:"checkUnreadMsgAndChat.cht",
					data:{memNo : ${ loginUser.memNo }
	            	},
			 		success:function(result){
						if(result>0){//뭐라도 담겨있는상황 
			             	$("#chat-off").hide();
			                $("#nf-on").css("display", (showdiv.style.display != 'block'?"block":"none"));
   						}else{
   		                	$("#nf-on").hide();
   			                $("#chat-off").css("display", (showdiv.style.display != 'block'?"block":"none"));
						}
			 		},error:function(){
			 			console.log("ajax통신 실패");
			 		}				
			 	})
                
                var adminNav = document.getElementById("admin-header");
                if(adminNav != null){
                    showdiv.style.top =(adminNav.style.display != 'none'?"114px":"70px");                       
                }

                if(${loginUser.memId == 'admin'}){				
                    var forExceptionCont = document.getElementById("admin-mode").style.color;
                    if(forExceptionCont == 'gray'){
                        showdiv.style.top = "70px";
                    }
                }                
            };

            // messenger 세부메뉴영역 
            //스크립트 구문 안에서는 jstl과 엑션태그가 제어가 안된다! 
            function moveToChat(){
                $("#userChatMain").show();
                $("#userMessageMain").hide();
                $("#userNotificationMain").hide();
                $(".chat-menu").css("color","rgb(41,128,185)");
                $(".chat-menu>div").css("color","white").css("background","rgb(41,128,185)");
                $(".message-menu").css("color","white");
                $(".message-menu>div").css("color","orangered").css("background","white");
                $(".notification-menu").css("color","white");
                $("#chatting-outer").show();
                $("#open-chat-Room").hide();
                moveToReceive();
            }

            function moveToMessage(){
	                $("#userChatMain").hide();
	                $("#userMessageMain").show();
	                $("#userNotificationMain").hide();
	                $(".message-menu").css("color","rgb(41,128,185)");
	                $(".message-menu>div").css("color","white").css("background","rgb(41,128,185)");
	                $(".chat-menu").css("color","white");
	                $(".chat-menu>div").css("color","orangered").css("background","white");
	                $(".notification-menu").css("color","white");
	                $("#chatting-outer").show();
	                $("#open-chat-Room").hide();
            }

            function moveToNotification(){
                $("#userChatMain").hide();
                $("#userMessageMain").hide();
                $("#userNotificationMain").show();
                $(".notification-menu").css("color","rgb(41,128,185)");
                $(".message-menu").css("color","white");
                $(".message-menu>div").css("color","orangered").css("background","white");
                $(".chat-menu").css("color","white");
                $(".chat-menu>div").css("color","orangered").css("background","white");
                $("#chatting-outer").show();
                $("#open-chat-Room").hide();
                
                ajaxShowMyNotification();
            }
            
            // AJAX로다가 count 가져 오는 함수를 header쪽에 만들어서 !!!! 다른 곳에서 ! 읽음 처리할때마다 해당 함수 호출만 해주면된다! 
        	function ajaxBringUnreadedMsgCount(){				
		 	$.ajax({
		 		url:"countUnreadMsg.msg",
				data:{memNo: "${sessionScope.loginUser.memNo}"},
		 		success:function(unreadMsgCount){
		 			//console.log(unreadMsgCount);
		 			if(unreadMsgCount == 0){
		 				$(".msgUnreadCount").css("visibility","hidden");
		 				$(".mainMsgUnreadCount ").text('');
		 				$("#notifyNewMsg").hide();
		 			}else if(unreadMsgCount > 99){
		 				$(".msgUnreadCount").text("99..");
		 				$(".mainMsgUnreadCount ").text(unreadMsgCount +'99..건');		 					
		 			}else{
		 				$(".msgUnreadCount").text(unreadMsgCount);
		 				$(".mainMsgUnreadCount ").text(unreadMsgCount +'건');
		 			}
		 			
		 		},error:function(){
		 			console.log("ajax통신 실패");
		 		}				
		 	})		 	
		}

            
        </script>
    </div>    
<!-- 채팅 상에서 모달을 띄우기 위해서 header쪽에 넣어줘야함 -->
<jsp:include page="../chatting/userChatModal.jsp"/>
<!-- 메세지 상에서 모달을 띄우기 위해서 header쪽에 넣어줘야하는데 코드가 길어짐에 따라 include로 빼버림 -->
<jsp:include page="../message/userMessageModal.jsp"/>

<!-- header쪽에서 ! 쓰는 내가만든 api 같은것! 동료선택임 여기서 조건문 달고 ! 채팅쪽에서도 활용가능! -->
<script type="text/javascript">
    function openSearchMem(tossTypeNo){
        if(tossTypeNo == 1){
            var windowObj= window.open('search.me','_blank','width=430,height=500,location=no,status=no,scrollbars=yes left=750 top=200');                        		        
        }else{
            var windowObj= window.open('searchCol.me','_blank','width=430,height=500,location=no,status=no,scrollbars=yes left=750 top=200');                        		         
        }
    }
</script>
</body>
</html>