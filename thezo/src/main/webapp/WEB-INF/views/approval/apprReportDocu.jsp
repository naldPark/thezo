<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Zo</title>

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
   	 <section>
        <div class="outer" align="center">    
            <jsp:include page="apprSidebar.jsp"/>
            <br><br>
            <div class="sideOuter">

                 <form action="/reserveList.mem" method="post">
                    <div class="input-group mb-3 input-group-sm">
                        <span class="input-group-text">기간</span>
                        <input type="date" class="form-control" name="startDate" style="height:36px;" id="startDate">
                        <span class="input-group-text" style="background-color: white; border: hidden;">~</span>
                        <input type="date"  id="endDate" name="endDate" class="form-control" style="height:36px; margin-right: 8px;">
                        <button type="submit" id="searchSubmitBtn" class="btn btn-primary btn-sm">기간검색</button>
                        <div class="input-group-prepend">
                            <span class="input-group-text" style="background-color: white; border: hidden; padding-right: 100px;"></span>
                        </div>
                        <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown">
                            키워드검색
                        </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">문서명</a>
                            <a class="dropdown-item" href="#">현결재자</a>
                        </div>
                        <input type="text" class="form-control" placeholder="검색어를 입력하세요" style="height:36px; margin-right: 8px;">
                        <button type="submit" id="searchSubmitBtn" class="btn btn-primary btn-sm">&nbsp;조회&nbsp;</button>
                    </div>
                 </form>
                 <br>
                
                 <!-- 문서리스트 -->
                 <div class="apprList shadow p-4 mb-4 bg-white w3-cell-row">
                    <div class="w3-cell" style="width:10%">
                        <h3 class="w3-cell"><i class="fas fa-coins docMenu"></i></h3>
                        <span>비용</span>
                    </div>
                    <div class="w3-cell text-left">
                        <h5 class="w3-cell">법인카드요청</h5>
                        <small>2021-01-13 13:03</small>
                    </div>
                    <div class="w3-cell">
                        <h3 class="w3-cell"><i class="fas fa-user-edit"></i></h3>
                        <h5 class="w3-cell">&nbsp; 박날드 대리</h5>
                        <small>경영지원본부 > 인사팀 > 팀원</small>
                    </div>
                    <div class="w3-cell" style="width:30%;">
                        <div class="w3-cell">
                            <h3 class="w3-cell"><i class="fas fa-pen apprLine"></i></h3>
                            <b>강보람 부장</b>
                        </div>
                        <div class="w3-cell">&horbar;</div>
                        <div class="w3-cell"><h3 class="w3-cell"><i class="far fa-check-circle"></i></h3>
                            <small>강보람 부장</small>
                        </div>
                        <div class="w3-cell">&horbar;</div>
                        <div class="w3-cell"><h3 class="w3-cell"><i class="far fa-check-circle"></i></h3>
                            <small>강보람 부장</small>
                        </div>
                    </div>
                </div>
                <!-- 문서리스트 -->
                <div class="apprList shadow p-4 mb-4 bg-white w3-cell-row">
                    <div class="w3-cell" style="width:10%">
                        <h3 class="w3-cell"><i class="fas fa-coins docMenu"></i></h3>
                        <span>비용</span>
                    </div>
                    <div class="w3-cell text-left">
                        <h5 class="w3-cell">법인카드요청</h5>
                        <small>2021-01-13 13:03</small>
                    </div>
                    <div class="w3-cell">
                        <h3 class="w3-cell"><i class="fas fa-user-edit"></i></h3>
                        <h5 class="w3-cell">&nbsp; 박날드 대리</h5>
                        <small>경영지원본부 > 인사팀 > 팀원</small>
                    </div>
                    <div class="w3-cell" style="width:30%;">
                        <div class="w3-cell">
                            <h3 class="w3-cell"><i class="fas fa-pen apprLine"></i></h3>
                            <b>강보람 부장</b>
                        </div>
                        <div class="w3-cell">&horbar;</div>
                        <div class="w3-cell"><h3 class="w3-cell"><i class="far fa-check-circle"></i></h3>
                            <small>강보람 부장</small>
                        </div>
                        <div class="w3-cell">&horbar;</div>
                        <div class="w3-cell"><h3 class="w3-cell"><i class="far fa-check-circle"></i></h3>
                            <small>강보람 부장</small>
                        </div>
                    </div>   
                </div>
                <!-- 문서리스트 -->
                <div class="apprList shadow p-4 mb-4 bg-white w3-cell-row">
                    <div class="w3-cell" style="width:10%">
                        <h3 class="w3-cell"><i class="fas fa-coins docMenu"></i></h3>
                        <span>비용</span>
                    </div>
                    <div class="w3-cell text-left">
                        <h5 class="w3-cell">법인카드요청</h5>
                        <small>2021-01-13 13:03</small>
                    </div>
                    <div class="w3-cell">
                        <h3 class="w3-cell"><i class="fas fa-user-edit"></i></h3>
                        <h5 class="w3-cell">&nbsp; 박날드 대리</h5>
                        <small>경영지원본부 > 인사팀 > 팀원</small>
                    </div>
                    <div class="w3-cell" style="width:30%;">
                        <div class="w3-cell">
                            <h3 class="w3-cell"><i class="fas fa-pen apprLine"></i></h3>
                            <b>강보람 부장</b>
                        </div>
                        <div class="w3-cell">&horbar;</div>
                        <div class="w3-cell"><h3 class="w3-cell"><i class="far fa-check-circle"></i></h3>
                            <small>강보람 부장</small>
                        </div>
                        <div class="w3-cell">&horbar;</div>
                        <div class="w3-cell"><h3 class="w3-cell"><i class="far fa-check-circle"></i></h3>
                            <small>강보람 부장</small>
                        </div>
                    </div>   
                </div>
                <!-- 문서리스트 -->
                <div class="apprList shadow p-4 mb-4 bg-white w3-cell-row">
                    <div class="w3-cell" style="width:10%">
                        <h3 class="w3-cell"><i class="fas fa-coins docMenu"></i></h3>
                        <span>비용</span>
                    </div>
                    <div class="w3-cell text-left">
                        <h5 class="w3-cell">법인카드요청</h5>
                        <small>2021-01-13 13:03</small>
                    </div>
                    <div class="w3-cell">
                        <h3 class="w3-cell"><i class="fas fa-user-edit"></i></h3>
                        <h5 class="w3-cell">&nbsp; 박날드 대리</h5>
                        <small>경영지원본부 > 인사팀 > 팀원</small>
                    </div>
                    <div class="w3-cell" style="width:30%;">
                        <div class="w3-cell">
                            <h3 class="w3-cell"><i class="fas fa-pen apprLine"></i></h3>
                            <b>강보람 부장</b>
                        </div>
                        <div class="w3-cell">&horbar;</div>
                        <div class="w3-cell"><h3 class="w3-cell"><i class="far fa-check-circle"></i></h3>
                            <small>강보람 부장</small>
                        </div>
                        <div class="w3-cell">&horbar;</div>
                        <div class="w3-cell"><h3 class="w3-cell"><i class="far fa-check-circle"></i></h3>
                            <small>강보람 부장</small>
                        </div>
                    </div>   
                </div>
                                
                <ul class="pagination justify-content-center">
                    <li class="page-item"><a class="page-link" href="#">이전</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item active"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">다음</a></li>
                  </ul>
            </div>
    	</div>
    </section>

  
 	
</body>
</html>