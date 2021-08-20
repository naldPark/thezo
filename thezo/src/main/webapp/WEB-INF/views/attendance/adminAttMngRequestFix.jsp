<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- select를 위한 부트스트랩-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<style>
    .outer-wrap{height: 200px;}
    .sub-menu{float: left; width: 30%; height: 100%;}
    .focus{
        border: 1px solid black !important;
        background-color: white !important;
        color: black !important;
        border-radius: 8%;
        font-weight: bold;
    }
    #sub-name{
        width: 80%;
        text-align: left;
        margin-top: 10%;
        margin-left: 10%;
        float: left;
        font-weight: bold;
        font-size: 30px;  
    }
    #sub-button{
        margin-top: 46%;
        width: 100%;
        height : 15%;
    }

    .content-other{display: none;}

    .content{height: 800px;}
    #pagingArea{width:fit-content; margin-top: 30px;}
    .modal-lg{max-width: 500px !important; overflow: hidden;}
    .modal-sm{max-width: 400px !important; overflow: hidden;}
    .modal-body{max-height: calc(100vh - 200px); overflow-y: auto;}
    #myModalheader{background-color: rgb(94,94,94);}
    #myModalLabel{color: white; font-size: 14px; font-weight: bold;}
    .modal-footer{font-size: 13px;}
    .modal-footer>a:hover{text-decoration: none; font-weight: bold;}
    
    #att_modi {border: none; background-color:transparent;}
    #att_modi:hover {font-weight: bold;}

    #adminenrstatement{
        margin-top: 10%;
        width: 95%;
        height: 90%;
    }
      
    .form-check{
        text-align: center;
        line-height: 30px;
        font-weight: bold;
        float: left;
        margin-left: 3%;
        width: 15%;
    }
    .form-check input[type="radio"]{
        margin-top: 8px;
        vertical-align: middle;
    }
   
    #enr-content{
        width: 95%;
        height: 85%;
        margin-top: 3%;
    }
    
    #myModalheader2{background-color: rgb(94,94,94);}
    
    #enr-form{font-weight: bold;}
    #enr-form input[type="text"]{
        width: 250px;
        height: 30px;
        font-size: 12px;
        padding-left: 10px;
    }
    #enr-form textarea{
        width: 250px;
        height: 130px;
        font-size: 12px;
        resize: none;
        padding-left: 10px;
    }
   
    table tr:hover{font-weight: bolder; cursor: pointer;}
    .page-link{color: rgb(56, 56, 56)!important}

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
                  <div id="sub-name"><i class="fas fa-laptop-house"></i> 근태관리</div>
                     <div class="tab" id="sub-button">
                        <button onclick="location.href='adminAtt.ma'" id="tab-1" type="button" class="btn btn-secondary">휴가일수 수정</button>&nbsp;
                        <button onclick="location.href='adminAttFixRequest.ma'" id="tab-2" type="button" class="btn btn-secondary focus">근태조정신청내역</button>&nbsp;
                    </div>
                </div>
            </div>
         
            <div class="content">
                <!--근태조정신청내역 탭-->
                <div id="adminenrstatement">
                  <div class="w3-row">
                        <div class="w3-col" style="width:47%">&nbsp;</div>
                        <div class="w3-col" style="width:50%">
                            <form action="adminAttFixRequest.ma" method="post">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">기간검색</span>
                                    </div>
                                    <input type="date" name="startDate" class="form-control"> 
                                    <span style="padding-top:5px">&nbsp; ~ &nbsp;</span>
                                    <input type="date" name="endDate" class="form-control">
                                    <input type="hidden" name="currentPage" id="currentPage" value="${pi.currentPage}">
                                    <div class="input-group-append">
                                        <button type="submit" class="btn btn-secondary">&nbsp;조회&nbsp;</button>
                                    </div>
                                </div>
                            </form>
						</div>
					</div>
                    <div id="enr-content">
                        <div class="total"> <!--전체 버튼 클릭시-->
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th width="100">No.</th>
                                        <th width="250">작성일</th>
                                        <th width="580">내용</th>
                                        <th width="230">진행상황</th>
                                        <th hidden></th>
                                        <th hidden></th>
                                        <th hidden></th>
                                        <th hidden></th>
                                    </tr>
                                </thead>
                                <tbody id="fixTime">
                                    <c:forEach var="a" items="${ requestList }">
                                    <tr class="detailFix" data-toggle="modal" data-backdrop="static" data-keyboard="false" href="#enrcode-modal">
                                        <td>${a.attBoardNo}</td>
                                        <td>${a.attDate}</td>
                                        <td>${a.status}<c:if test="${a.status eq '지각'}">&nbsp;(출근시간: ${a.strTime})</c:if><c:if test="${a.status eq '조퇴'}">&nbsp;(퇴근시간: ${a.finTime})</c:if></td>
                                        <td>${a.attBoardStatus}</td>
                                        <td hidden>${a.strTime}</td>
                                        <td hidden>${a.finTime}</td>
                                        <td hidden>${a.attStaContent}</td>
                                        <td hidden>${a.attNo}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <!--페이징 처리 시작-->
                            <div id="pagingArea">
                                <ul class="pagination">
                                    <c:if test="${ pi.currentPage ne 1 }">
                                        <li class="page-item"><a class="page-link">이전</a></li>
                                    </c:if>
                                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                                        <c:choose>
                                            <c:when test="${ pi.currentPage eq p }">
                                                <li class="page-item"><a class="page-link w3-font-black" style="background-color: rgb(229, 230, 231)">${ p }</a></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="page-item"><a class="page-link">${ p }</a></li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                    <c:if test="${ pi.currentPage ne pi.maxPage and pi.maxPage ne '0'}">
                                        <li class="page-item">
                                            <a class="page-link">다음</a>
                                        </li>
                                    </c:if>
                                </ul>
                            </div>
                            <!--페이징 처리 끝-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script>
    $(".detailFix").click(function(){
          $("#attBoardNoModal").val($(this).children().eq(0).text());
          $("#enrollDateModal").val($(this).children().eq(1).text());
          $("#strTimeModal").val($(this).children().eq(4).text());
          $("#finTimeModal").val($(this).children().eq(5).text());
          $("#currentStatusModal").val($(this).children().eq(2).text());
          $("#requestReasonModal").val($(this).children().eq(6).text());
          $("#attNoModal").val($(this).children().eq(7).text());
        })
    </script>
   

    <!--근태조정신청확인 모달-->
    <div class="modal fade" id="enrcode-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header" id="myModalheader2">
                    <div class="modal-title" id="myModalLabel"><i class="fas fa-bars"></i> 근태 조정 신청</div>
                </div>
                <form action="updateAdminFixRequest.ma" method="post">
                    <div class="modal-body">
                        <div id="enr-form">
                            <table id="enr-modal-table">
                                <tr>
                                    <th width="100">신청 날짜</th>
                                    <td><input type="text" class="form-control form-control-sm" id="enrollDateModal"
                                            value="2021년 7월 1일 (월요일)" disabled></td>
                                </tr>
                                <tr>
                                    <th>현재 상태</th>
                                    <td><input type="text" class="form-control form-control-sm" id="currentStatusModal"
                                           value="출근 (2021/07/01 월) 13:45" disabled></td>
                                </tr>
                                <tr>
                                    <th>사유</th>
                                    <td>
                                        <div class="form-group">
                                            <textarea class="form-control" id="requestReasonModal"
                                                disabled>출근 시간이 잘못 입력되었습니다.</textarea>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>출근</th>
                                    <td><input type="text" name="strTime" class="form-control form-control-sm" id="strTimeModal" value="13:45dd"></td>
                                </tr>
                                <tr>
                                    <th>퇴근</th>
                                    <td><input type="text" name="finTime"  class="form-control form-control-sm" id="finTimeModal" value="20:30"></td>
                                </tr>
                            </table>
                            <input type="hidden" name="attBoardNo" id="attBoardNoModal" value="">
                            <input type="hidden" name="attNo" id="attNoModal" value="">
                        </div>
                
                    </div>
                    <div class="modal-footer">
                        <button type="submit" id="att_modi" style="color: rgb(26,188,156);">수정하기</button>&nbsp;
                        <a href="#" data-dismiss="modal" style="color: lightslategray;">취소하기</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--모달 기능-->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
</body>
</html>