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
            <p class="pageTitle">  approval <b> 전자결재</b></p>
            <jsp:include page="apprSidebar.jsp"/>
            <div class="sideOuter">
                <!-- 안읽은 문서 건수 안내 시작 -->
                <div class="card-deck">
                    <div class="card bg-light">
                        <div class="card-body text-left">
                        <p class="card-text">기안문서</p>
                        <h5 class="card-text text-right"><span class="recentDoc">1</span> 건</h5>
                        </div>
                    </div>
                    <div class="card bg-light">
                        <div class="card-body text-left">
                        <p class="card-text">결재요청</p>
                        <h5 class="card-text text-right"><span class="recentDoc">1</span> 건</h5>
                        </div>
                    </div>
                    <div class="card bg-light">
                        <div class="card-body text-left">
                        <p class="card-text">참조문서</p>
                        <h5 class="card-text text-right"><span class="recentDoc">1</span> 건</h5>
                        </div>
                    </div>
                    <div class="card bg-light">
                        <div class="card-body text-left">
                        <p class="card-text">결재내역</p>
                        <h5 class="card-text text-right"><span class="recentDoc">1</span> 건</h5>
                        </div>
                    </div>  
                </div>
                <br><br>
                <!-- 안읽은 문서 건수 안내 끝 -->
                <!-- 문서리스트 -->
                <div class="apprList shadow p-4 mb-3 bg-white w3-cell-row">
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
                <div class="apprList shadow p-4 mb-3 bg-white w3-cell-row">
                    <div class="w3-cell" style="width:10%">
                        <h3 class="w3-cell"><i class="fas fa-couch docMenu"></i></h3>
                        <span>인사</span>
                    </div>
                    <div class="w3-cell text-left">
                        <h5 class="w3-cell">휴가신청서</h5>
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
                <div class="apprList shadow p-4 mb-3 bg-white w3-cell-row">
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
                <div class="apprList shadow p-4 mb-3 bg-white w3-cell-row">
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
                <div class="apprList shadow p-4 mb-3 bg-white w3-cell-row">
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
                <br>
                <ul class="pagination justify-content-center">
                    <li class="page-item"><a class="page-link" href="#">이전</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item active"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">다음</a></li>
                </ul>
                <br>
            </div>
    	</div>
    </section>

  
 	
</body>
</html>