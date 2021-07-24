<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기-나의예약목록</title>
<style>
    #myList{
        width: 950px;
        margin: 0;
        float: left;
        box-sizing: border-box;
        padding: 25px;
    }
    #myList>table{text-align: center; width: 800px;}
    #myList>table th{width: 10%;}  
</style>
</head>
<body>

    <jsp:include page="../../common/header.jsp"/>
    <section>
        <div class="outer">
			<!-- 예약관리 메뉴바 -->
            <jsp:include page="rezMenubar.jsp"/>

            <div id="myList">
                &nbsp;&nbsp;&nbsp;
                <b>나의 예약 목록</b>
                <hr>
                &nbsp;&nbsp;&nbsp;
                <b>예약 현황</b><br><br>
                <table class="table table-hover table-sm" align="center">
                    <thead class="thead-light">
                        <tr>
                            <th width="100px">분류</th>
                            <th>자원명</th>
                            <th>예약시간</th>
                            <th>상태</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>회의실</td>
                            <td>회의실A(401호)</td>
                            <td>2021-07-01 오전09:00 ~ 2021-07-01 오전10:00</td>
                            <td>
                                <a href="" data-toggle="modal" data-target="#rez-del">삭제</a>
                                | 
                                <a href="" data-toggle="modal" data-target="#rez-detail">상세보기</a>
                            </td>
                        </tr>
                        <tr>
                            <td>회의실</td>
                            <td>회의실A(401호)</td>
                            <td>2021-07-01 오전09:00 ~ 2021-07-01 오전10:00</td>
                            <td>
                                <a href="">삭제</a>
                                | 
                                <a href="">상세보기</a>
                            </td>
                        </tr>
                        <tr>
                            <td>회의실</td>
                            <td>회의실A(401호)</td>
                            <td>2021-07-01 오전09:00 ~ 2021-07-01 오전10:00</td>
                            <td>
                                <a href="">삭제</a>
                                | 
                                <a href="">상세보기</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </div>

    </section>

    <%-- 예약확인 및 삭제(모달창) -------------------------------------------------------------------------------%>
        
    <!-- The Modal -->
    <div class="modal" id="rez-detail">
        <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
	                <b class="modal-title">예약 확인</b>
	                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
	                <table class="" align="center">
	                    <tr>
	                        <th width="120px">자원 이름</th>
	                        <td colspan="2">회의실A(401호)</td>
	                    </tr>
	                    
	                    <tr>
	                        <th>예약 시간</th>
	                        <td>2021-07-01 오전09:00 ~ 2021-07-01 오전10:00</td>
	                        
	                    </tr>
	                    <tr>
	                        <th>등록자</th>
	                        <td>사원 김개똥</td>
	                    </tr>
	                    <tr>
	                        <th>사용 용도</th>
	                        <td>프로젝트 회의</td>
	                    </tr>
	            
	                </table>
                
                </div>
        
                <!-- Modal footer -->
                <div class="modal-footer">
                    <div class="button-area">
                        <button class="btn btn-primary" type="submit">확인</button>
                        <a href="delete.rez" class="btn btn-danger" data-toggle="modal" data-target="#rez-del">삭제</a>
                    </div>
                </div>
        
            </div>
        </div>
    </div>
    
    <!-- The Modal -->
    <div class="modal" id="rez-del">
        <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
	                <b class="modal-title">삭제 확인</b>
	                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                	해당 예약을 정말 삭제하시겠습니까? <br>
                	<b>*예약이 취소되고, 예약내역도 삭제됩니다.</b>
                </div>
        
                <!-- Modal footer -->
                <div class="modal-footer">
                    <div class="button-area">
                        <a href="delete.rez" class="btn btn-danger">삭제</a>
                        <button class="btn btn-secondary" class="close" data-dismiss="modal">취소</button>
                    </div>
                </div>
        
            </div>
        </div>
    </div>
       
</body>
</html>