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
<script>
    window.onload = function(){
        $("#tab-1").click();
    }
</script>
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

    .cbtn{
        font-size: 14px;
        background-color: gray;
        color: white;
        border: 0;
        padding-left : 3%;
        padding-right : 3%;
    }
    #tab-1 {width: 30%; height: 100%;}
    #tab-2 {width: 40%; height: 100%;}

    .content{height: 800px;}

    #restEditTap{
        margin-top: 10%;
        width: 95%;
        height: 80%;
    }
    #restEditTable{
        border: 1px solid black;
        width: 70%;
    }
    #restEditTable th, #restEditTable td{border: 1px solid lightgray;}
    #restEditTable th{text-align: center; background-color: rgb(234,234,234)}
    #restEditTable button{padding:5% !important; height: 4%; font-size: 12px;}
    #restEditBtn{float: right; margin-right: 40px; margin-top: 500px; width: 7%;}
    #pagingArea{width:fit-content; margin-top: 30px;}
    .currentPage{background-color: rgb(234,234,234) !important;}

    .modal-lg{max-width: 500px !important; overflow: hidden;}
    .modal-sm{max-width: 400px !important; overflow: hidden;}
    .modal-body{max-height: calc(100vh - 200px); overflow-y: auto;}
    #myModalheader{background-color: rgb(94,94,94);}
    #myModalLabel{color: white; font-size: 14px; font-weight: bold;}
    #rest-history-table{width: 95%;}
    #rest-history-table th, #rest-history-table td{border: 1px solid lightgray;}
    #rest-history-table th{text-align: center; background-color: rgb(234,234,234);}
    #rest-used-history {
        font-weight: bold;
        font-size: 20px;
        margin: auto;
        float: left;
    }
    .modal-footer{font-size: 13px;}
    .modal-footer>a:hover{text-decoration: none; font-weight: bold;}

    #adminenrstatement{
        margin-top: 10%;
        width: 95%;
        height: 90%;
    }
    #enr-top{
        border: 1px solid lightgray;
        width: 95%;
        height: 4%;
        margin-top: 3%;
    }
    #enr-front{
        float: left;
        text-align: center;
        width: 8%;
        height: 100%;
        background-color: gray;
        color: white;
        line-height: 30px;
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
    #total-search{
        margin-top: 0px;
        vertical-align: middle;
    }
    .term{display: none}

    #enr-content{
        width: 95%;
        height: 85%;
        margin-top: 3%;
    }
    #enr-table{width: 100%;}
    #enr-table th{border: 1px solid rgb(177, 177, 177); text-align: center; background-color: lightgray;}
    #enr-table td{border: 1px solid rgb(177, 177, 177);}

    #myModalheader2{background-color: rgb(94,94,94);}
    #enr-table a{font-weight: 400; color: black;}
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
    #restEditTable td{text-align: center;}
    #rest-history-table{width: 465px;}
    #rest-history-table th, #rest-history-table td{border: 1px solid lightgray;}
    #rest-history-table th{text-align: center; background-color: rgb(234,234,234)}
    #rest-used-history {
        font-weight: bold;
        font-size: 20px;
        margin: auto;
        float: left;
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
    <script>

        function changetab1(){
            document.all.restEditTap.style.display = 'block';
            document.all.adminenrstatement.style.display = 'none';
        }

        function changetab2(){
            document.all.restEditTap.style.display = 'none';
            document.all.adminenrstatement.style.display = 'block';
        }
    </script>

    <section>
		<div class="outer" align="center">
            <div class="outer-wrap">
                <div class="sub-menu">
                    <div id="sub-name"><i class="fas fa-laptop-house"></i> 근태관리</div>
                    <div class="tab" id="sub-button">
                        <button onclick="changetab1()" id="tab-1" type="button" class="cbtn">휴가일수 수정</button>&nbsp;
                        <button onclick="changetab2()" id="tab-2" type="button" class="cbtn">근태조정신청내역</button>&nbsp;
                    </div>
                </div>
                <script>
                    $(".cbtn").click(function(){
                        $(".cbtn").removeClass("focus");
    
                        $(this).addClass("focus");
                    })
                </script>
            </div>

            <div class="content">
                <!--휴가일수 수정 탭-->
                <div id="restEditTap">
                    <form>
                        <table id="restEditTable">
                            <tr>
                                <th width="200">직책</th>
                                <th width="100">이름</th>
                                <th width="130">부서명</th>
                                <th>휴가잔여일수</th>
                                <th></th>
                            </tr>
                            <c:forEach var="at" items="${ list }">
	                            <tr>
	                            	<td hidden>${ at.memNo }</td>
	                                <td>${ at.rank }</td>
	                                <td>${ at.memName }</td>
	                                <td>${ at.department }</td>
	                                <td><input type="number" class="form-control form-control-sm" value="${ at.memTotalDate }"></td>
	                                <td><button type="button" class="btn btn-secondary leaveHistory" data-toggle="modal" data-bs-target="#rest-used">휴가 사용 현황</button></td>
	                            </tr>
                            </c:forEach>
                        </table>
                    </form>
                    <button class="btn btn-dark" id="restEditBtn">저장</button>
                    <!-- 페이징바 -->
                    <div id="pagingArea">
		                <ul class="pagination">
		                	<c:choose>
			                		<c:when test="${ pi.currentPage eq 1 }">
				                   		<li class="page-item disabled"><a class="page-link">Previous</a></li>
				                    </c:when>
				                    <c:otherwise>
		                    			<li class="page-item"><a class="page-link" href="adminAtt.ma?currentPage=${ pi.currentPage-1 }">Previous</a></li>
			                    	</c:otherwise>
		                    </c:choose>
		                    
		                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		                    		<c:choose>
		                    			<c:when test="${ p eq pi.currentPage }">
			                    			<li class="page-item"><a class="page-link currentPage" href="adminAtt.ma?currentPage=${ p }">${ p }</a></li>
		                    			</c:when>
		                    			<c:otherwise>
			                    			<li class="page-item"><a class="page-link" href="adminAtt.ma?currentPage=${ p }">${ p }</a></li>
		                    			</c:otherwise>
		                    		</c:choose>
		                    </c:forEach>
		                    
		                    <c:choose>
		                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
				                    <li class="page-item disabled"><a class="page-link">Next</a></li>
				                </c:when>
				                <c:otherwise>
		                    		<li class="page-item"><a class="page-link" href="adminAtt.ma?currentPage=${ pi.currentPage+1 }">Next</a></li>
				                </c:otherwise>    
				            </c:choose>        
		                </ul>
		            </div>
			               
			      <br clear="both"><br>
                    
                </div>

                <!--근태조정신청내역 탭-->
                <div id="adminenrstatement">
                    <div id="enr-top">
                        <div id="enr-front">검색기간</div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" id="total" name="condition" checked> 
                            <label class="form-check-label" style="margin-right: 5%;">
                            전체
                            </label>
                            <input class="form-check-input" type="radio" name="condition" value="1" style="margin-left: 5%;"> 
                            <label class="form-check-label" style="margin-left: 23%;">
                            기간
                            </label>
                        </div>
                        <div class="term" id="total-search">
                            <input type="date" id="start">&nbsp;
                            ~
                            &nbsp;<input type="date" id="end">
                        </div>
                        <script>
                            $('input[type=radio][name=condition]').on('click',function(){
                                var chkValue = $('input[type=radio][name=condition]:checked').val();
        
                                if(chkValue == '1'){
                                    $('.term').css('display', 'block');
                                    $('.total').css('display', 'none');
                                } else{
                                    $('.term').css('display', 'none');
                                    $('.total').css('display', 'block');
                                }
                            });
                        </script>
                    </div>
                    <div id="enr-content">
                        <div class="total"> <!--전체 버튼 클릭시-->
                            <table id="enr-table">
                                <thead>
                                    <tr>
                                        <th width="100">No.</th>
                                        <th width="250">작성일</th>
                                        <th width="580">내용</th>
                                        <th width="230">진행상황</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><a class="enr-code" data-toggle="modal" data-backdrop="static" data-keyboard="false" href="#enrcode-modal">314</a></td>
                                        <td>2021.07.01</td>
                                        <td>출근</td>
                                        <td>조정중</td>
                                    </tr>
                                    <tr>
                                        <td>313</td>
                                        <td>2021.06.15</td>
                                        <td>지각(2021/06/15/ 화 08:31:02)</td>
                                        <td>승인완료</td>
                                    </tr>
                                    <tr>
                                        <td>312</td>
                                        <td>2021.04.12</td>
                                        <td>퇴근</td>
                                        <td>조정중</td>
                                    </tr>
                                </tbody>
                            </table>
                            <!--페이지네이션 추가-->
                        </div>
                        <div class="term" style="display: none;"> <!--기간 버튼 클릭시-->
                            <table id="enr-table">
                                <thead>
                                    <tr>
                                        <th width="100">No.</th>
                                        <th width="250">작성일</th>
                                        <th width="580">내용</th>
                                        <th width="230">진행상황</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><a class="enr-code" data-toggle="modal" data-backdrop="static" data-keyboard="false" href="#enrcode-modal">314</a></td>
                                        <td>2021.07.01</td>
                                        <td>출근</td>
                                        <td>조정중</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <div class="modal fade" id="rest-used" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header" id="myModalheader">
                    <div class="modal-title" id="myModalLabel"><i class="fas fa-bars"></i> 대표 김한우 휴가 사용 현황</div>
                </div>
                <div class="modal-body">
                    <div id="rest-form">
                        <table id="rest-history-table">
                            <tr>
                                <th>입사일</th>
                                <td id="enrollDate">2010-04-08</td>
                                <th>휴가 총 사용일</th>
                                <td width="60" id="memTotalDate"></td>
                            </tr>
                            <tr>
                                <th>휴가 지급일수</th>
                                <td id="memVacDate">30일</td>
                                <th>휴가잔여일</th>
                                <td id="memTotalDate">20일</td>
                            </tr>
                        </table>
                        <br>
                        <p id="rest-used-history">휴가 사용 내역</p>
                        <br><br>
                        <table id="rest-history-table">
                            <tr>
                                <th>휴가종류</th>
                                <th>휴가일수</th>
                                <th>사용기간</th>
                                <th>사유보기</th>
                            </tr>
                            <tr>
                                <td id="leaveCate">연차</td>
                                <td style="text-align: right;" id="leaveCount">2일</td>
                                <td style="text-align: center;" id="leaveDate">2021-07-01 ~ 2021-07-02</td>
                                <td style="text-align: center;" id="leaveContent">개인사유</td>
                            </tr>
                        </table>
                        <!--페이지네이션-->
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="#" data-dismiss="modal" style="color: lightslategray;">닫기</a>
                </div>
            </div>
            
        </div>
    </div>
    
    <script>
       $(document).on("click", ".leaveHistory", function(){
	       	var memTotalDate = $(this).parent().prev().children().val();
	       	$(".modal-body #memTotalDate").text( memTotalDate + "일" );
    	  	var rname = $(this).parent().prev().prev().prev().prev().prev().val();
    	   
    	   	console.log(rname);
	   	    $.ajax({
	   		   url: "history.att",
	   		   data:{
	   			   memNo : rname
	   		   }, success:function(lData){
	   			   $(".modal-body #leaveCate").text(lData.leaveCate);
	   		   }, error:function(){
	   			   console.log("조회용 ajax통신 실패");
	   		   }
	   	    })
	     })
       
       
       
    </script>
    <!--모달 기능-->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function(){
            $('.modal-dialog').draggable({
                "handle":".modal-header"
            });
        });
    </script>
</body>
</html>