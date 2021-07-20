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
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<style>
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
    #admin-header{width: 100%; height: 45px; display: none;}
    #admin-nav{width: 1170px; height: 100%; line-height: 45px; border-bottom: 1px solid rgb(136,136,136);  margin: auto; padding-right: 10px; display: flex;}
    #admin-nav>span{ width: 250px; font-size: 18px; font-weight: bolder; padding: 0px 10px;}
    #admin-nav>ul{width: 100%; height: 100%; list-style-type: none; display: flex; justify-content: space-around; }
    #admin-nav>ul>li{height: 100%;}
    #admin-nav>ul>li>a{height: 100%; color: rgb(100, 100, 100); font-weight: bold; text-decoration: none; padding: 0px 12px; display: block;}
    #admin-nav>ul>li>a:hover{color: rgb(243,156,18);}

    /* 3. admin 세부 메뉴들 */
    #admin-nav>ul>li>ul{ width: 130px; padding: 5px 0px; line-height: 22px; font-size: 14px; list-style-type:none; background: rgb(224,224,224); z-index : 5; position: absolute; border-bottom-left-radius: 5px ; border-bottom-right-radius: 5px ;
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
    .notification-outer{ width: 325px; border: 1px solid orange; z-index: 1000; transform: translateX(1px); background-color: white;
        height: 692px;
    }

    .notification-innerline{ width: 310px; margin: auto; background-color: rgb(245,238,248);
        height: 685px;
    }


    /* ★ 모든 팀원의 각각페이지 영역 쓰는 공통 영역 ★*/
    section{width: 100%;}
    .outer{width: 1200px; margin: auto; border: 1px solid red; font-family:'Noto Sans KR', sans-serif;}
</style>

</head>
<body>
	<c:if test="${!empty alertMsg }">
		<script>	
			alert("${alertMsg}");
		</script>
	 	<!-- 뭔가가 담겨있는 경우 날려버리기~ -->	
		<c:remove var="alertMsg" scope="session"/>	
	</c:if>
	
    <header>
        <div id="header-outer"> <%-- header-outer 영역시작 --%>
            <div class="logo-area">
                <a href="<%= request.getContextPath() %>">
                    <img src="resources/images/TheZoLogo.png">
                </a>
            </div>

<%--------------------------------------------------사용자 메뉴 영역 시작--------------------------------------------------- --%>
            <div class="menu-outer">
                <ul class="menu-area">
                    <li><a href="<%= request.getContextPath() %>" style="padding: 0px 12px;">홈</a></li>
                
                    <%-- 게시판 담당하시는분 아래 href에 ! url mapping값 달아주세요~  --%>
                    <li><a href="">게시판</a>
                        <ul>
                            <li><a href="">공지사항</a></li>
                            <li><a href="">문서관리</a></li>
                            <li><a href="">벼룩시장</a></li>
                            <li><a href="">사내게시판</a></li>
                        </ul>
                    </li>

                    <%-- 연락처 담당하시는분 아래 href에 ! url mapping값 달아주세요~  --%>
                    <li><a href="">연락처</a>
                        <ul>
                            <li><a href="">직원 연락처</a></li>
                            <li><a href="">조직도</a></li>
                        </ul>
                    </li>

                    <li><a href="main.mail">메일함</a></li>
                    <li><a href="main.appr">전자결재</a></li>
                    <li><a href="">일정관리</a></li>

                    <c:if test="${loginUser.userId eq 'admin' }">
                        <li><a href="javascript:showAdminNav()" style="font-size: 17px; color: gray;" id="admin-mode">관리자모드</a></li>
                    </c:if> 
    

                    <%-- 연락처 담당하시는분 아래 href에 ! url mapping값 달아주세요~  --%>
                    <li id="user-basic-info"><a href="">${loginUser.userId}</a>님 반가워요 &nbsp;
                        <ul>
                            <li><a href="">내 정보 수정</a></li>
                            <li><a href="">근태관리</a></li>
                            <li><a href="logout.me">로그아웃</a></li>
                        </ul>
                    </li>
                </ul>
    
                <div id="messenger-area" onclick="showMessengerArea();">
                    
                    <!-- ※ 알림 영역 읽지 않은 알림이 있을시 ! -->
                    <%--<c:if test="${!empty notification}">--%>
                        <div class="notification-outer">
                            <!-- class="notification-outer"에  style="display: block; top: 70px;" 넣어주면된다.-->
                            <div class="notification-innerline">
                                <jsp:include page="../notification/unreadNotification.jsp"/>
                            </div>
                        </div>               
                        <%--</c:if>--%>

                        <!-- ★★★★ 채팅 영역이 될것임! ★★★★ -->
                        <!-- 해당 로고 클릭시 turn on -->
                        <div id="chat-on" ><i class="fas fa-power-off fa-lg"></i></div>
                        <!-- 해당 로고 클릭시 turn off (기본값) -->
                        <div id="chat-off" style="display:block"><i class="fas fa-power-off fa-lg" style="color: gray;"></i></div>
                        <!-- 읽지 않은 메세지 혹은 쪽지가 있을 경우 -->
                        <div id="chat-alert"><i class="fas fa-exclamation-circle fa-lg" style="color: rgb(243,156,18);"></i></div>
                    </div>
            </div>
        </div><%-- header-outer 영역 끝 --%>
    </header>
<%--------------------------------------------------사용자 메뉴 영역 끝--------------------------------------------------- --%>

<%--------------------------------------------------관리자 메뉴 영역 시작--------------------------------------------------- --%>

    <!-- Admin header영역  개발자 도구에서 볼수없게 jstl 처리함 -->
    <c:if test="${loginUser.userId eq 'admin' }">
	    <div id="admin-header">
	        <div id="admin-nav">
	            <span>관리자메뉴</span>
	            <ul>
	                <%-- 재원(내꺼) urlMapping값 넣으면됨~ --%> 
	                <li><a href="<%= request.getContextPath() %>">메인</a></li>
	
	                <%-- 해당영역 맡으신분들 ~ urlMapping값 넣어주세요~ --%> 
	                <li><a href="">게시판관리</a></li>
	                <li><a href="">인사근태</a></li>
	                <li><a href="">회원정보</a>
	                    <ul>
	                        <li><a href="">회원 정보 조회?</a></li>
	                        <li><a href="">사원등록</a></li>
	                    </ul>
	                </li>
	                <li><a href="adminMain.appr">전자결재관리</a></li>
	                <li><a href="">일정관리</a></li>
	
	                <%-- 재원(내꺼) urlMapping값 넣으면됨~ --%> 
	                <li><a href="list.adms">메신저</a>
	                    <ul>
	                        <li><a href="list.adms">쪽지 신고처리</a></li>
	                        <li><a href="list.adnf">알림 등록 및 기록</a></li>
	                    </ul>
	                </li>
	
	                <%-- 해당영역 맡으신분들 ~ urlMapping값 넣어주세요~ --%> 
	                <li><a href="">조직도</a></li>
	                <li><a href="">환경설정</a></li>
	            </ul>
	        </div>
	    </div>               
    </c:if>

    <!-- 스크립트 영역 !  -->
    <script>
        // 관리자 메뉴 토글용도! 
    	function showAdminNav() {
            var adminNav = document.getElementById("admin-header");
            adminNav.style.display =(adminNav.style.display != 'block'?"block":"none"); 
            var adminMode = document.getElementById("admin-mode");
            adminMode.style.color = (adminMode.style.color != 'red'?"red":"gray");
        }
        
		// Messenger쪽 기본 세팅 ! ★ 틀 잘잡아야한다!! 해당 영역은 ! include 처리로 가져오는 형식! 


        
    </script>

<%--------------------------------------------------관리자 메뉴 영역 끝--------------------------------------------------- --%>


</body>
</html>