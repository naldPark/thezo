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
    .content{height: 800px;}
    #company-table input{width: 300px;}
    #sub-title{margin-top: 60px; margin-bottom: 30px;}
    #company-table{margin-top: 10px; width: 95%;}
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
                <table id="company-table">
                    <tr>
                        <th colspan="4"><h5 style="margin-bottom: 30px"></h5></th>
                    </tr>
                    <tr>
                        <th width="200">회사명</th>
                        <td width="400">${ cInfo.companyName }</td>
                        <th width="200">대표자명</th>
                        <td>${ cInfo.ceoName }</td>
                    </tr>
                    <tr>
                        <th>사업자등록번호</th>
                        <td>${ cInfo.regNo }</td>
                        <th>이메일</th>
                        <td>${ cInfo.email }</td>
                    </tr>
                    <tr>
                        <th>업태</th>
                        <td>${ cInfo.bussStatus }</td>
                        <th>종목</th>
                        <td>${ cInfo.bussKind }</td>
                    </tr>
                    <tr>
                        <th colspan="4"><h5 id="sub-title"></h5></th>
                    </tr>
                    <tr>
                        <th>회사전화</th>
                        <td>${ cInfo.phone }</td>
                        <th>홈페이지</th>
                        <td>${ cInfo.homePage }</td>
                    </tr>
                    <tr>
                        <th>법인등록번호</th>
                        <td>${ cInfo.corNo }</td>
                        <th>팩스</th>
                        <td>${ cInfo.fax }</td>
                    </tr>
                    <tr>
                        <th>설립일자</th>
                        <td>${ cInfo.estDate }</td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td>${ cInfo.address }</td>
                        <th>대표자명(영문)</th>
                        <td>${ cInfo.ceoEng }</td>
                    </tr>
                    <tr>
                        <th>회사명(영문)</th>
                        <td>${ cInfo.cnameEng }</td>
                    </tr>
                    <tr>
                        <th>주소(영문)</th>
                        <td colspan="2">${ cInfo.addressEng }</td>
                    </tr>
                    <tr>
                        <th>회사도장</th>
                        <td><img src="${ cInfo.changeName }" width="45px" height="45px"></td>
                    </tr>
                </table>
            </div>
        </div>
    </section>
</body>
</html>