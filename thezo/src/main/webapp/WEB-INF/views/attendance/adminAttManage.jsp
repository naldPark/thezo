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
        margin-top: 48%;
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

    .content{height: 900px;}

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

    .modal-lg{max-width: 500px !important; overflow: hidden;}
    .modal-sm{max-width: 400px !important; overflow: hidden;}
    .modal-body{max-height: calc(100vh - 200px); overflow-y: auto;}
    #myModalheader{background-color: rgb(94,94,94);}
    #myModalLabel{color: white; font-size: 14px; font-weight: bold;}
    #rest-history-table{width: 95%;}
    #rest-history-table th, #rest-history-table td{border: 1px solid lightgray;}
    #rest-history-table th{text-align: center; background-color: rgb(234,234,234)}
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
                            <tr>
                                <td>대표</td>
                                <td style="text-align: center;">김한우</td>
                                <td></td>
                                <td style="text-align: center;"><input type="number" class="form-control form-control-sm" value="20"></td>
                                <td style="text-align: center;"><button type="button" class="btn btn-secondary" data-toggle="modal" href="#rest-used">휴가 사용 현황</button></td>
                            </tr>
                            <tr>
                                <td>상무이사</td>
                                <td style="text-align: center;">박성우</td>
                                <td>총무팀</td>
                                <td style="text-align: center;"><input type="number" class="form-control form-control-sm" value="13"></td>
                                <td style="text-align: center;"><button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#myModal">휴가 사용 현황</button></td>
                            </tr>
                            <tr>
                                <td>팀장</td>
                                <td style="text-align: center;">전선영</td>
                                <td></td>
                                <td style="text-align: center;"><input type="number" class="form-control form-control-sm" value="13"></td>
                                <td style="text-align: center;"><button type="button" class="btn btn-secondary">휴가 사용 현황</button></td>
                            </tr>
                            <!--페이지네이션-->
                        </table>
                    </form>
                    <button class="btn btn-dark" id="restEditBtn">저장</button>
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
    <!-- 부서등록 모달-->
    <div class="modal fade" id="rest-used" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header" id="myModalheader">
                    <div class="modal-title" id="myModalLabel"><i class="fas fa-bars"></i> 대표 김한우 휴가 사용 현황</div>
                </div>
                <div class="modal-body">
                    <form>
                        <div id="rest-form">
                            <table id="rest-history-table">
                                <tr>
                                    <th>입사일</th>
                                    <td>2010-04-08</td>
                                    <th>휴가 총 사용일</th>
                                    <td width="60">10일</td>
                                </tr>
                                <tr>
                                    <th>휴가 지급일수</th>
                                    <td>30일</td>
                                    <th>휴가잔여일</th>
                                    <td>20일</td>
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
                                    <td>연차</td>
                                    <td style="text-align: right;">2일</td>
                                    <td style="text-align: center;">2021-07-01 ~ 2021-07-02</td>
                                    <td style="text-align: center;">개인사유</td>
                                </tr>
                            </table>
                            <!--페이지네이션-->
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <a href="" style="color: lightslategray;">닫기</a>
                </div>
            </div>
        </div>
    </div>

    <!--근태조정신청확인 모달-->
    <div class="modal fade" id="enrcode-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header" id="myModalheader2">
                    <div class="modal-title" id="myModalLabel"><i class="fas fa-bars"></i> 근태 조정 신청</div>
                </div>
                <div class="modal-body">
                    <form>
                        <div id="enr-form">
                            <table id="enr-modal-table">
                                <tr>
                                    <th width="100">신청 날짜</th>
                                    <td><input type="text" class="form-control form-control-sm" value="2021년 7월 1일 (월요일)" disabled></td>
                                </tr>
                                <tr>
                                    <th>현재 상태</th>
                                    <td><input type="text" class="form-control form-control-sm" value="출근 (2021/07/01 월) 13:45" disabled></td>
                                </tr>
                                <tr>
                                    <th>사유</th>
                                    <td>
                                        <div class="form-group">
                                            <textarea class="form-control" disabled>출근 시간이 잘못 입력되었습니다.</textarea>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>출근</th>
                                    <td><input type="text" class="form-control form-control-sm" value="13:45" ></td>
                                </tr>
                                <tr>
                                    <th>퇴근</th>
                                    <td><input type="text" class="form-control form-control-sm" value="20:30" ></td>
                                </tr>
                            </table>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <a href="" style="color: rgb(26,188,156);">수정하기</a>&nbsp;
                    <a href="" style="color: lightslategray;">취소하기</a>
                </div>
            </div>
        </div>
    </div>
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