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
    #company-table input[type="date"]{height: 40px;}
    #sub-title{margin-top: 30px; margin-bottom: 10px;}
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
    }
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<script>
		$(function(){
			var adminNav = document.getElementById("admin-header");
			$("section").css("margin-top", (adminNav.style.display != 'none'?"115px":"70px"));
		})
		document.getElementById("admin-header").style.display ="block"; 
        document.getElementById("admin-mode").style.color = "red";
	</script>
    <section>
		<div class="outer" align="center">
            <div class="outer-wrap">
                <div class="sub-menu">
                    <div id="sub-name"><i class="bi bi-building"></i> 회사정보설정</div>
                </div>
            </div>
            <div class="content">
                <form action="insert.co" enctype="multipart/form-data">
                    <table id="company-table">
                        <tr>
                            <th colspan="4"><h5 style="margin-bottom: 10px;"><i class="fas fa-caret-square-right"></i> 필수입력</h5></th>
                        </tr>
                        <tr>
                            <th width="200">회사명</th>
                            <td width="400"><input type="text" name="companyName" class="form-control" placeholder="회사명을 입력해주세요" required></td>
                            <th width="200">대표자명</th>
                            <td><input type="text" name="ceoName" class="form-control" placeholder="대표자명을 입력해주세요" required></td>
                        </tr>
                        <tr>
                            <th>사업자등록번호</th>
                            <td><input type="text" name="regNo" class="form-control" placeholder="사업자등록번호를 입력해주세요" required></td>
                            <th>이메일</th>
                            <td><input type="text" name="email" class="form-control" placeholder="이메일을 입력해주세요" required></td>
                        </tr>
                        <tr>
                            <th>업태</th>
                            <td><input type="text" name="bussStatus" class="form-control" placeholder="업태를 입력해주세요" required></td>
                            <th>종목</th>
                            <td><input type="text" name="bussKidn" class="form-control" placeholder="종목을 입력해주세요" required></td>
                        </tr>
                        <tr>
                            <th colspan="4"><h5 id="sub-title"><i class="far fa-caret-square-right"></i> 선택입력</h5></th>
                        </tr>
                        <tr>
                            <th>회사전화</th>
                            <td><input type="text" name="phone" class="form-control" placeholder="번호를 입력해주세요"></td>
                            <th>홈페이지</th>
                            <td><input type="url" name="homePage" class="form-control" placeholder="홈페이지를 입력해주세요"></td>
                        </tr>
                        <tr>
                            <th>법인등록번호</th>
                            <td><input type="text" name="corNo" class="form-control" placeholder="법인등록번호를 입력해주세요"></td>
                            <th>팩스</th>
                            <td><input type="text" name="fax" class="form-control" placeholder="번호를 입력해주세요"></td>
                        </tr>
                        <tr>
                            <th>설립일자</th>
                            <td><input type="date" name="estDate"></td>
                        </tr>
                        <tr>
                            <th>주소</th>
                            <td><input type="text" name="address" class="form-control" placeholder="주소를 입력해주세요"></td>
                            <th>대표자명(영문)</th>
                            <td><input type="text" name="ceoEng" class="form-control" placeholder="대표자명(영문)을 입력해주세요"></td>
                        </tr>
                        <tr>
                            <th>회사명(영문)</th>
                            <td><input type="text" name="cNameEng" class="form-control" placeholder="회사명(영문)을 입력해주세요"></td>
                        </tr>
                        <tr>
                            <th>주소(영문)</th>
                            <td colspan="2"><input type="text" name="addressEng" class="form-control" placeholder="주소(영문)을 입력해주세요 "></td>
                        </tr>
                        <tr>
                            <th>회사로고</th>
                            <td>            
                                <div class="input-group mb-3" style="margin-bottom: 0% !important;">
                                    <input type="file" name="upImg" class="form-control" id="inputGroupFile02">
                                    <label class="input-group-text" for="inputGroupFile02">Upload</label>
                                    <img src="" width="200px" height="150">
                                </div>
                            </td>
                        </tr>
                    </table>
                    <button type="submit" id="company-btn" class="btn btn-dark">저장</button>
                </form>
            </div>
        </div>
    </section>
</body>
</html>