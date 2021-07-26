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
    .content{height: 1000px; border: 1px solid darkblue;}
    /*기본적으로 적용해야할 스타일*/
    
    .form-check{margin-left: 0% !important; position: static !important; margin-top: 0% !important; padding-left: 0% !important;}
    .form-check-input{margin-left: 20% !important; position: static !important; margin-top: 0% !important; padding-left: 0% !important;}
    #dept-table{width: 70%; margin-top: 20%;}
    #dept-table a{font-weight: 400; color: black;}
    #dept-table tr, #dept-table td, #dept-table th{border-bottom: 1px solid rgb(177, 177, 177); text-align: center;}
    #dept-table th{background-color: lightgray;}
    #deletebtn{float: left; margin-left: 15%; margin-top: 20%;}
    #createbtn{float: right; margin-right: 15%; margin-top: 20%;}
    .modal-lg{max-width: 16% !important; overflow: hidden;}
    .modal-body{max-height: calc(100vh - 200px); overflow-y: auto;}

    .dept-modal{color:black; text-decoration: none;}
    #myModalheader{background-color: rgb(94,94,94);}
    #myModalLabel{color: white; font-size: 14px; font-weight: bold;}
    #dept-form{
        font-weight: bold;
        width: 100%;
    }

    .modal-footer{font-size: 13px; }
    .modal-footer>a:hover{text-decoration: none; font-weight: bold;}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    <section>
		<div class="outer" align="center">
            <div class="outer-wrap">
                <div class="sub-menu">
                    <div id="sub-name"><i class="fas fa-building"></i> 부서관리</div>
                </div>
            </div>
            <div class="content form-check">
                <div class="content-table">
                    <table id="dept-table">
                        <thead>
                            <tr>
                                <th width="100" height="40"><input type="checkbox" class="form-check-input" name="dept" value="selectall" onclick="selectAll(this)"></th>
                                <th width="150">부서코드</th>
                                <th width="150">부서명</th>
                                <th width="100">부서순위</th>
                                <th width="100">사용구분</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input type="checkbox" class="form-check-input" name="dept"></td>
                                <td style="text-align: center;"><a class="dept-code" data-toggle="modal" data-backdrop="static" data-keyboard="false" href="#deptcode-modal">D0100</a></td>
                                <td style="text-align: center;">총무팀</td>
                                <td>1</td>
                                <td>사용</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" class="form-check-input" name="dept"></td>
                                <td style="text-align: center;"><a >D0200</a></td>
                                <td style="text-align: center;">경리팀</td>
                                <td>2</td>
                                <td>미사용</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" class="form-check-input" name="dept"></td>
                                <td style="text-align: center;"><a href="">D0300</a></td>
                                <td style="text-align: center;">인사팀</td>
                                <td>3</td>
                                <td>사용</td>
                            </tr>
                        </tbody>
                    </table>
                    <button id="deletebtn" class="btn btn-outline-secondary">선택삭제</button>
                    <button id="createbtn" class="btn btn-secondary dept-modal" data-toggle="modal" data-backdrop="static" data-keyboard="false" href="#dept-modal">신규등록</button>
                </div>
                <script>
                    function selectAll(selectAll){
                        const checkboxes = document.getElementsByName('dept');
                        
                        checkboxes.forEach((checkbox) => {
                            checkbox.checked = selectAll.checked;
                        })
                    }
                </script>
                
            </div>
        </div>
    </section>
    <!-- 부서등록 모달-->
    <div class="modal fade" id="dept-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header" id="myModalheader">
                    <div class="modal-title" id="myModalLabel"><i class="fas fa-bars"></i> 부서 등록</div>
                </div>
                <div class="modal-body">
                    <form>
                        <div id="dept-form">
                            <table>
                                <tr>
                                    <th width="100">부서 코드</th>
                                    <td width="75%">
                                        <div class="input-group mb-3" style="margin-bottom: 0% !important;">
                                            <input type="text" class="form-control form-control-sm" aria-label="Recipient's username" aria-describedby="button-addon2">
                                            <button class="btn btn-outline-secondary btn-sm" type="button" id="button-addon2">중복여부</button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>부서명</th>
                                    <td><input type="text" class="form-control form-control-sm"></td>
                                </tr>
                                <tr>
                                    <td>부서순위</td>
                                    <td><input type="text" class="form-control form-control-sm"></td>
                                </tr>
                            </table>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <a href="" style="color: rgb(94,94,94);">등록</a>&nbsp;
                    <a href="" style="color: lightslategray;">취소하기</a>
                </div>
            </div>
        </div>
    </div>
    <!-- 부서수정 모달-->
    <div class="modal fade" id="deptcode-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header" id="myModalheader">
                    <div class="modal-title" id="myModalLabel"><i class="fas fa-bars"></i> 부서 수정</div>
                </div>
                <div class="modal-body">
                    <form>
                        <div id="dept-form">
                            <table>
                                <tr>
                                    <th width="100">부서 코드</th>
                                    <td width="75%">
                                        <input type="text" class="form-control form-control-sm" value="D0100" disabled>
                                    </td>
                                </tr>
                                <tr>
                                    <th>부서명</th>
                                    <td><input type="text" class="form-control form-control-sm" value="총무팀"></td>
                                </tr>
                                <tr>
                                    <th>부서순위</th>
                                    <td><input type="text" class="form-control form-control-sm" value="1"></td>
                                </tr>
                            </table>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <a href="" style="color: rgb(26,188,156);">수정</a>&nbsp;
                    <a href="" style="color: rgb(94,94,94);">사용중단</a>&nbsp;
                    <a href="" style="color: lightslategray;">취소</a>
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