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
    #collegue-search-area{width: 295px; height: 45px; display: flex; position: fixed; align-items: center; justify-content: space-between; background-color: white; }
    #collegue-search-area>span{font-size: 22px; font-weight: bold; line-height: 45px; font-family:'Noto Sans KR', sans-serif; margin-left: 5px;}
    #collegue-search-area>button{height: 35px; font-size: 22px; font-weight: bold; border: none; outline: none; background-color: inherit;}
    #collegue-search-area>button:hover{color:rgb(36, 77, 209); border-radius: 50%; transform: scale(1.1); background-color: rgb(224,224,224);}
    #my-collegue-list{margin-top: 45px;}
    .my-profile-listarea{height: 70px; display: flex; justify-content: flex-start; align-items: center; border-bottom: 3px solid lightgray;}
    .my-profile-listarea>div:first-child, .collegue-profile-listarea>div>div:first-child{width: 58px; height: 58px; overflow: hidden; border-radius: 23px; background-color: lightgray;}
    .my-profile-listarea>div:first-child:hover{cursor: pointer;}
    .my-profile-listarea>div:first-child>img, .collegue-profile-listarea>div>div:first-child>img{width: 58px; height: 58px; object-fit:cover;}
    .my-profile-listarea>div:last-child, .collegue-profile-listarea>div>div:nth-child(2){width: 235px; height: 58px;}
    .my-profile-listarea>div:last-child>p, .collegue-profile-listarea>div>div:nth-child(2)>p{font-weight: bold; font-family:'Noto Sans KR', sans-serif; line-height: 58px; margin: 0px; padding-left: 20px;
        -ms-user-select: none; 
        -moz-user-select: -moz-none;
        -khtml-user-select: none;
        -webkit-user-select: none;
        user-select: none;}
    .collegue-profile-listarea>p{color: rgb(127,127,127); height: 58px; font-size: 18px; font-weight: bold; font-family:'Noto Sans KR', sans-serif; padding-left: 5px; margin-bottom: 10px;}
    .collegue-profile-listarea>div{height: 60px; margin: 7px 0px; display: flex; align-items: center; justify-content: flex-start;}
    .collegue-profile-listarea>div:hover{cursor: pointer; background-color: lightcyan; color: orange;}
    .collegue-profile-listarea>div:hover>div:first-child{box-shadow: 0 0 3px #fff,0 0 3px #fff, 0 0 3px #fff, 0 0 3px #fff, 0 0 3px rgb(255, 0, 170), 0 0 3px rgb(255, 0, 170), 0 0 3px rgb(255, 0, 170), 0 0 3px rgb(255, 0, 170);}

</style>
</head>
<body>
    <div id="collegue-search-area">
        <span>동료</span>
        <button type="button" onclick="openCreateGroupChat('gc');" style="margin-left:170px;"><i class="fas fa-comment-medical"></i></button>
        <button type="button" onclick="openAddColleague();"><i class="fas fa-search-plus"></i></button>
    </div>

    <div id="my-collegue-list">
        <div class="my-profile-listarea">
            <div>
                <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMDA5MDNfODQg%2FMDAxNTk5MTA5NTgzOTU3.5A9JW8i649B7t2hcKjVpIEf07ndwg6PEIxJfPKDcllYg.kdJJ_jmhwiLpsEtspqeGQGSRGD3Uk1dYP2ho3UG1kREg.JPEG.123kiy00%2F20200903_133730.jpg&type=sc960_832" onclick="oneClickOpenImage();">
            </div>
            <div>
                <p>신재원 사원 [개발팀]</p>
            </div>
        </div>

        <div class="collegue-profile-listarea">
            <p>동료 <span>동료 명수</span></p>
            <!-- 동적으로 생성 -->
            <!-- 채팅방번호를 넘기면서 호출해야한다 -->
            <div ondblclick="clickShowChatRoom(1,'P');">
                <div>
                    <img src="data:image/jpeg;base64,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" alt="" onclick="oneClickOpenImage();">
                </div>
                <div>
                    <p>사원 장재욱 [개발팀]</p>
                </div>
                <input type="hidden" id="chatMemNo여기사원번호" value="">
            </div>
            <div ondblclick="clickShowChatRoom(1,'P');">
                <div>
                    <img src="" alt="" onclick="oneClickOpenImage();">
                </div>
                <div>
                    <p>사원 이성경 [개발팀]</p>
                </div>
                <input type="hidden" id="chatMemNo여기사원번호" value="">
            </div>
            <div ondblclick="clickShowChatRoom(1,'P');">
                <div>
                    <img src="" alt="" onclick="oneClickOpenImage();">
                </div>
                <div>
                    <p>사원 이선영 [개발팀]</p>
                </div>
                <input type="hidden" id="chatMemNo여기사원번호" value="">
            </div>
            <div ondblclick="clickShowChatRoom(1,'P');">
                <div>
                    <img src="" alt="" onclick="oneClickOpenImage();">
                </div>
                <div>
                    <p>사원 박영익 [개발팀]</p>
                </div>
                <input type="hidden" id="chatMemNo여기사원번호" value="">
            </div>
            <div ondblclick="clickShowChatRoom(1,'P');">
                <div>
                    <img src="" alt="" onclick="oneClickOpenImage();">
                </div>
                <div>
                    <p>사원 봇봇봇 [개발팀]</p>
                </div>
                <input type="hidden" id="chatMemNo여기사원번호" value="">
            </div>
            <div ondblclick="clickShowChatRoom(1,'P');">
                <div>
                    <img src="" alt="" onclick="oneClickOpenImage();">
                </div>
                <div>
                    <p>사원이다 봇봇봇 [개발팀1팅의]</p>
                </div>
                <input type="hidden" id="chatMemNo여기사원번호" value="">
            </div>
        </div>
    </div>
</body>
</html>