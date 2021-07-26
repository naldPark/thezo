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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous"> 
<style>
    .outer{width: 430px; height: 490px; margin: auto; margin-top: 5px; font-family:'Noto Sans KR', sans-serif;}
    .outer>h2{font-weight: bold;}
    .outer>h2, .search-by-name, .search-by-category{margin-left: 10px;} 
    .search-by-name{height: 40px; display: flex; margin-bottom: 5px;}
    .search-by-name>span{font-size: 17px; font-weight: bold; margin-left: 10px; margin-right: 20px;}
    .search-by-name>div{width: 200px; height: 28px; border: 1px solid darkgray; display: flex; border-radius: 3px; overflow: hidden; justify-content: flex-start;}
    .search-by-name>div>input{width: 172px; height: 28px; outline: none; border: none;}
    .search-by-name>div>button{width: 28px; height: 28px;color: white; font-weight: bold; border: 1px solid rgb(52,152,219); border-left: 1px solid darkgray; outline: none; background-color: rgb(52,152,219);}
    .search-by-name>div>button:hover{color: orange;}
    .search-by-category>p, .department-list, .department-list{font-size: 17px; font-weight: bold; margin-left: 10px; margin-bottom: 10px;}
    .department-list>span, .department-list>span{margin-right: 25px;}
    .department-list>select, .department-list>select{width: 255px; height: 28px; font-size: 16px; font-weight: normal; border: 1px solid darkgray; border-radius: 4px;}
    .search-by-category{margin-bottom: 30px;}
    #search-result-area>table{width: 382px; height: 184px; text-align: center; margin: auto; margin-bottom: 20px; border-top: 2px solid rgb(204,204,204); border-bottom: 2px solid rgb(204,204,204);}
    #search-result-area>table>thead>tr{background-color: rgb(234,234,234);}
    #search-result-area>table>thead>tr>th{width: 20%;}
    #search-result-area>table>tbody>tr{height: 28px;}
    #search-result-area>table>tbody>tr>td{font-size: 14px; vertical-align: middle;}
    #search-result-area>table>tbody>tr button{height: 25px; color: white; font-size: 12px; font-weight: bold; border: none; border-radius: 3px; background-color: rgb(52,152,219);}

    /* 내가 만든 paging-area 재원 ~ */
	.paging-area{text-align: center; margin: 10px 0px;} 
	.paging-area button{width:28px; height:32px; color: rgb(127,127,127); font-size:16px; font-weight: bold; border: none; border-radius: 5px; background-color: rgb(244,244,244);}       
    #dis-btn{color:white; background-color: rgb(52,152,219);}
</style>
</head>
<body>	
    <div class="outer">

    <h2>동료 찾기</h2>
    <div class="search-by-name">
        <span>▶ 이름으로 검색</span>
        <div>
            <input type="text" id="mem-name">
            <button type="button" onclick=""><i class="fas fa-search"></i></button>
        </div>
    </div>
    <div class="search-by-category">
        <p>▶ 항목으로 검색</p>
        <div class="department-list">
            <span>▷ 부서</span>
            <select name="">
                <option value="">전략기획</option>
                <option value=""></option>
                <option value=""></option>
            </select>
        </div>
        <div class="department-list">
            <span>▷ 직급</span>
            <select name="" disabled>
                <option value="">사원</option>
                <option value=""></option>
                <option value=""></option>
            </select>
        </div>
    </div>

    <div id="search-result-area">
        <table class="table table-sm">
            <thead>
                <tr>
                    <th>부서</th>
                    <th>직책</th>
                    <th>이름</th>
                    <th>아이디</th>
                    <th>선택</th>
                </tr>
            </thead>
            <tbody>
                <!-- 동적생성 최대 5 rows -->
                <tr>
                    <td>전략기획</td>
                    <td>사원</td>
                    <td>강떙땡</td>
                    <td>user01</td>
                    <td>
                        <!-- 얘는 사원번호 자리 -->
                        <input type="hidden" value="1">
                        <button type="button" onclick="sendToParent(this);">선택하기</button>
                    </td>
                </tr>
                <tr>
                    <td>전략기획</td>
                    <td>사원</td>
                    <td>강떙땡</td>
                    <td>user01</td>
                    <td>
                        <!-- 얘는 사원번호 자리 -->
                        <input type="hidden" value="1">
                        <button type="button" onclick="sendToParent(this);">선택하기</button>
                    </td>
                </tr>
                <tr>
                    <td>전략기획</td>
                    <td>사원</td>
                    <td>강떙땡</td>
                    <td>user01</td>
                    <td>
                        <!-- 얘는 사원번호 자리 -->
                        <input type="hidden" value="1">
                        <button type="button" onclick="sendToParent(this);">선택하기</button>
                    </td>
                </tr>
                <tr>
                    <td>전략기획</td>
                    <td>사원</td>
                    <td>강떙땡</td>
                    <td>user01</td>
                    <td>
                        <!-- 얘는 사원번호 자리 -->
                        <input type="hidden" value="1">
                        <button type="button" onclick="sendToParent(this);">선택하기</button>
                    </td>
                </tr>
                <tr>
                    <td>전략기획</td>
                    <td>사원</td>
                    <td>강큼큼</td>
                    <td>user01</td>
                    <td>
                        <!-- 얘는 사원번호 자리 -->
                        <input type="hidden" value="1">
                        <button type="button" onclick="sendToParent(this);">선택하기</button>
                    </td>
                </tr>
            </tbody>
        </table>

        <!-- 나중에  jstl로다가! 조건문 반복문으로 처리해줘야해~  -->
        <div align="center" class="paging-area second-pagingbar">
            <button onclick="location.href='';">&lt;</button>
            <button onclick="location.href='';">1</button>
            <button id="dis-btn" disabled>2</button>
            <button onclick="location.href='';">&gt;</button>
        </div>

    </div>
</div>

<!-- 값을 부모 window로 넘기자~  -->
    <script type="text/javascript">
        function sendToParent(btn){
            var name = $(btn).parent().parent().children().eq(2).text();
            var rank = $(btn).parent().parent().children().eq(1).text();

            var nameAndRank = name + " " + rank;
            opener.document.getElementById("select-member-msg").value = nameAndRank;
            
            var memNo = $(btn).parent().children().eq(0).val();
            opener.document.getElementById("hidden-member-number").value = memNo;
            
            window.close();
        }
    </script>


</body>
</html>