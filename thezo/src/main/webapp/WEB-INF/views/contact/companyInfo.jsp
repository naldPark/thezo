<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<style>
    .outer-wrap{height: 200px;}
    .sub-menu{float: left; width: 30%; height: 100%;}
    #sub-name{
        width: 80%;
        text-align: left;
        margin-top: 10%;
        margin-left: 10%;
        float: left;
        font-weight: bold;
        font-size: 30px;  
    }
    .content{height: 1000px;}
    #company-table input{width: 300px;}
    #sub-title{margin-top: 80px; margin-bottom: 30px;}
    #company-table{margin-top: 100px; width: 95%;}
    #company-table textarea{
        width: 390px;
        height: 32px;
        resize: none;
        padding-left: 10px;
    }
    #company-table a{color: gray;}
    #company-table th{height: 50px !important;} 
    #company-btn{
        float: right; width: 100px;
        margin-right: 100px;
        margin-top: 100px;
    }

</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    <section>
		<div class="outer" align="center">
            <div class="outer-wrap">
                <div class="sub-menu">
                    <div id="sub-name"><i class="bi bi-building"></i> 회사정보</div>
                </div>
            </div>
            <div class="content">
                <form action="">
                    <table id="company-table">
                        <tr>
                            <th colspan="4"><h5 style="margin-bottom: 30px";></h5></th>
                        </tr>
                        <tr>
                            <th width="200">회사명</th>
                            <td width="400">Thekang</td>
                            <th width="200">대표자명</th>
                            <td>강보람</td>
                        </tr>
                        <tr>
                            <th>사업자등록번호</th>
                            <td>123-81-99233</td>
                            <th>이메일</th>
                            <td>thekangpjt@gmail.com</td>
                        </tr>
                        <tr>
                            <th>업태</th>
                            <td>제조업</td>
                            <th>종목</th>
                            <td>금속</td>
                        </tr>
                        <tr>
                            <th colspan="4"><h5 id="sub-title"></h5></th>
                        </tr>
                        <tr>
                            <th>회사전화</th>
                            <td>02-123-4567</td>
                            <th>홈페이지</th>
                            <td>http://www.thekang.co.kr</td>
                        </tr>
                        <tr>
                            <th>법인등록번호</th>
                            <td></td>
                            <th>팩스</th>
                            <td>02-123-4569</td>
                        </tr>
                        <tr>
                            <th>설립일자</th>
                            <td>2021-08-23</td>
                        </tr>
                        <tr>
                            <th>주소</th>
                            <td>서울특별시 강남구 테헤란로 14길 6 남도빌딩 2~6F</td>
                            <th>대표자명(영문)</th>
                            <td>Boram, Kang</td>
                        </tr>
                        <tr>
                            <th>회사명(영문)</th>
                            <td>Thekang</td>
                        </tr>
                        <tr>
                            <th>주소(영문)</th>
                            <td colspan="2">2~6F, 6, Teheran-ro 14-gil, Gangnam-gu, Seoul, Republic of Korea</td>
                        </tr>
                        <tr>
                            <th>회사로고</th>
                            <td><img src="" width="200px" height="150"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </section>
</body>
</html>