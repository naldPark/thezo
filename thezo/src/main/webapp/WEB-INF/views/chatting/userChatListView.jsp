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
    .unitOfChatRoom>div:nth-child(2)>p{font-weight: bold; margin: 0px; display: inline-block;}
    .unitOfChatRoom>div:nth-child(2)>span:nth-child(2){color: darkgray; font-size: 13px; margin-left: 6px; transform: translateY(-2px);}
    .unitOfChatRoom>div:nth-child(2)>span:last-child{width: 185px;color: darkgray; font-size: 14px;
        text-overflow:ellipsis;
		white-space:nowrap; 
		overflow:hidden;
    }
    .unitOfChatRoom>div:nth-child(3){width: 64px; height: 50px; right: 4px; position: absolute; display: flex; flex-direction: column; align-items: flex-end; justify-content: space-between;}
    .unitOfChatRoom>div:nth-child(3)>span{color: rgb(60, 60, 60); font-size: 11px; font-weight: bold;}
    .unitOfChatRoom>div:nth-child(3)>div{width: 20px; height: 20px; color: white; font-size: 14px; text-align: center; line-height: 18px; border-radius: 50%; margin-bottom: 3px; background-color: rgb(241,196,15);}
</style>
</head>
<body>
    <!-- 조회해온 단톡방 여부가 g라면 ! 조회해온 image중 4개만 추려서 안에다 넣는다. ArrayList로 뽑아온다.-->
    <!-- 그렇지 않고 단톡방 여부가 p라면 오직 하나의 사진만을 조회해올것이기에 image로 한개만 담아서 넣는다. 오직 사진이 하나더라도 ArrayList로 뽑아올것이다.  -->
    <%-- <c:choose>
        <c:when test="">
            <div>
                <img src="">
            </div>    
        </c:when>
        <otherwise>
            <div class="multiProFileImg">
                <img src="">
                <img src="">
                <img src="">
                <img src="">
            </div>
        </otherwise>
    </c:choose> --%>

    <div class="unitOfChatRoom" ondblclick="clickShowChatRoom(1,'P');">
        <div class="singleProFileImg">
            <img src="https://image.news1.kr/system/photos/2020/11/11/4475465/article.jpg/dims/optimize">
        </div>
        <div>
            <p>사원 신재원님</p><span></span><br>
            <span>졸려....</span>
        </div>
        <div>
            <span>오후 5:54</span>
            <div class="nfCircle">1</div>
        </div>
    </div>
    
    <div class="unitOfChatRoom" ondblclick="clickShowChatRoom(1,'P');">
        <div class="singleProFileImg">
            <img src="https://cdn.ilyoseoul.co.kr/news/photo/201706/190530_131336_541.jpg">
        </div>
        <div>
            <p>사원 신재원님</p><span></span><br>
            <span>할말이....</span>
        </div>
        <div>
            <span>어제</span>
            <div class="nfCircle">1</div>
        </div>
    </div>

    <div class="unitOfChatRoom" ondblclick="clickShowChatRoom(2,'G');">
        <div class="multiProFileImg">
            <img src="https://image.news1.kr/system/photos/2020/11/11/4475465/article.jpg/dims/optimize">
            <img src="https://cdn.ilyoseoul.co.kr/news/photo/201706/190530_131336_541.jpg">
            <img src="https://image.news1.kr/system/photos/2020/11/11/4475465/article.jpg/dims/optimize">
            <img src="https://cdn.ilyoseoul.co.kr/news/photo/201706/190530_131336_541.jpg">
        </div>
        <div>
            <p>인사팀 단체방</p><span>26</span><br>
            <span>다들 보고서 제출하세요 에붸붸붸큼큼</span>
        </div>
        <div>
            <span>어제</span>
            <div class="nfCircle">99</div>
        </div>
    </div>

    <div class="unitOfChatRoom" ondblclick="clickShowChatRoom(1,'P');">
        <div class="singleProFileImg">
            <img src="https://cdn.ilyoseoul.co.kr/news/photo/201706/190530_131336_541.jpg">
        </div>
        <div>
            <p>사원 신재원님</p><span></span><br>
            <span>졸려....</span>
        </div>
        <div>
            <span>오후 5:54</span>
            <div class="nfCircle">1</div>
        </div>
    </div>

    <div class="unitOfChatRoom" ondblclick="clickShowChatRoom(2,'G');">
        <div class="multiProFileImg">
            <img src="https://cdn.ilyoseoul.co.kr/news/photo/201706/190530_131336_541.jpg">
            <img src="https://image.news1.kr/system/photos/2020/11/11/4475465/article.jpg/dims/optimize">
            <img src="https://cdn.ilyoseoul.co.kr/news/photo/201706/190530_131336_541.jpg">
            <img src="https://image.news1.kr/system/photos/2020/11/11/4475465/article.jpg/dims/optimize">
        </div>
        <div>
            <p>더조 팀</p><span>5</span><br>
            <span>다들 보고서 제출하세요</span>
        </div>
        <div>
            <span>어제</span>
            <div class="nfCircle">99</div>
        </div>
    </div>

    <div class="unitOfChatRoom" ondblclick="clickShowChatRoom(1,'P');">
        <div class="singleProFileImg">
            <img src="https://image.news1.kr/system/photos/2020/11/11/4475465/article.jpg/dims/optimize">
        </div>
        <div>
            <p>사원 신재원님</p><span></span><br>
            <span>졸려....</span>
        </div>
        <div>
            <span>오후 5:54</span>
            <div class="nfCircle">1</div>
        </div>
    </div>

    <div class="unitOfChatRoom" ondblclick="clickShowChatRoom(1,'P');">
        <div class="singleProFileImg">
            <img src="https://image.news1.kr/system/photos/2020/11/11/4475465/article.jpg/dims/optimize">
        </div>
        <div>
            <p>사원 신재원님</p><span></span><br>
            <span>졸려....</span>
        </div>
        <div>
            <span>2021-06-25</span>
            <div class="nfCircle">1</div>
        </div>
    </div>
</body>
</html>