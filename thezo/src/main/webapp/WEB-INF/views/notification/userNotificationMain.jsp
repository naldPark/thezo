<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- @Author Jaewon.s --> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="Jaewon.s">
<title>Insert title here</title>
<style>
    #notification-list-outer{width: 300px; height: 470px; padding: 5px 0px; margin: auto;
        overflow-y: auto;
    }
    #notification-list-outer::-webkit-scrollbar {width: 10px;}
    #notification-list-outer::-webkit-scrollbar-thumb {border: 2px solid transparent; border-radius: 5px; background-clip: padding-box; background-color: rgb(241,197,7);}
    #notification-list-outer::-webkit-scrollbar-track {border-radius: 5px; box-shadow: inset 0px 0px 5px white; background-color: lightgrey;}

    .notification-item{width: 100%;}
    .notification-item:hover{cursor: pointer;}
    .notification-item:hover>.notification-item-header{background-color: rgb(238, 172, 113);}
    .notification-item-header{width: 100; height: 26px; display: flex; justify-content: space-around; background-color: rgb(247, 207, 142);}
    .notification-item-header>i{width: 33%; color: white; font-size: 14px; line-height: 28px; padding-left: 10px;}
    .notification-item-header>div{width: 66%; padding-left: 5px;}
    .notification-item-header>div>span{font-size: 17px; font-weight: bold; line-height: 28px;}
    .notification-item>p{margin: 0px; padding-top: 10px; background-color: white;}
    .schedule{padding-left: 15px;}
    .pre-outer{width: 100%; background-color: white;}
    .nf-con{width: 280px; font-size: 15px; margin: 0px; padding: 10px; background-color: white;
		white-space:pre-wrap; 
		word-break:keep-all;
		text-overflow:clip;
        line-height: 12px;
    }
</style>
</head>
<body>
    <div id="notification-list-outer">
            <!-- 동적 생성할때 ! 해당 ! 알림 번호를 넘겨야한다! -->
            <div class="notification-item" onclick="toggleContent(1);">
                <div class="notification-item-header" id="nf-item1">
                    <i class="fas fa-lightbulb"></i>
                    <div>
                        <span>전사원</span>
                        <span>알림</span>
                    </div>
                </div>
                <p class="schedule">
                    일정 : <span></span>~<span></span>
                </p>
                <div class="pre-outer">
                    <pre id="nf-con1" class="nf-con" style="display: none;">
                        sdfadsfjkhjkadhfkj
                    </pre>
                </div>
            </div>

            <div class="notification-item" onclick="toggleContent(2);">
                <div class="notification-item-header" id="nf-item2">
                    <i class="fas fa-lightbulb"></i>
                    <div>
                        <span>전사원</span>
                        <span>알림</span>
                    </div>
                </div>
                <p class="schedule">
                    일정 : <span></span>~<span></span>
                </p>
                <div class="pre-outer">
                    <pre id="nf-con2" class="nf-con" style="display: none;">
                        sdfadsfjkhjkadhfkj
                        폰트사이즈
                        sdfadsfjkhjkadhfkjsd
                    </pre>
                </div>
            </div>
            <div class="notification-item" onclick="toggleContent(3);">
                <div class="notification-item-header" id="nf-item3">
                    <i class="fas fa-lightbulb"></i>
                    <div>
                        <span>전사원</span>
                        <span>알림</span>
                    </div>
                </div>
                <p class="schedule">
                    일정 : <span></span>~<span></span>
                </p>
                <div class="pre-outer">
                    <pre id="nf-con3" class="nf-con" style="display: none;">
                        sdfadsfjkhjkadhfkj
                        폰트사이즈
                        sdfadsfjkhjkadhfkjsd
                    </pre>
                </div>
            </div>
            <div class="notification-item" onclick="toggleContent(4);">
                <div class="notification-item-header" id="nf-item4">
                    <i class="fas fa-lightbulb"></i>
                    <div>
                        <span>전사원</span>
                        <span>알림</span>
                    </div>
                </div>
                <p class="schedule">
                    일정 : <span></span>~<span></span>
                </p>
                <div class="pre-outer">
                    <pre id="nf-con4" class="nf-con" style="display: none;">
                        sdfadsfjkhjkadhfkj
                        폰트사이즈
                        sdfadsfjkhjkadhfkjsd
                    </pre>
                </div>
            </div>
            <div class="notification-item" onclick="toggleContent(5);">
                <div class="notification-item-header" id="nf-item5">
                    <i class="fas fa-lightbulb"></i>
                    <div>
                        <span>전사원</span>
                        <span>알림</span>
                    </div>
                </div>
                <p class="schedule">
                    일정 : <span></span>~<span></span>
                </p>
                <div class="pre-outer">
                    <pre id="nf-con5" class="nf-con" style="display: none;">
                        sdfadsfjkhjkadhfkj
                        폰트사이즈
                        sdfadsfjkhjkadhfkjsd
                    </pre>
                </div>
            </div>
    </div>

    <script>
        function toggleContent(num){
            $("#nf-con"+num).toggle();
        }
    </script>
</body>
</html>