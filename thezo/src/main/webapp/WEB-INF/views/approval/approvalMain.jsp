<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
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
                <c:forEach var="a" items="${ list }">
	                <!-- 문서리스트 -->
	                <div class="apprList shadow p-4 mb-3 bg-white w3-cell-row" onclick="location.href='detailDocu.appr?docNo=${a.docNo}'">
	                    <div class="w3-cell" style="width:10%">
	                        <h3 class="w3-cell">
								<c:choose>
									<c:when test="${a.category eq '인사'}">
										<i class="fas fa-user-alt docMenu"></i>
									</c:when>
									<c:when test="${a.category eq '비용'}">
										<i class="fas fa-coins docMenu"></i>
									</c:when>
									<c:when test="${a.category eq '총무'}">
										<i class="fas fa-box-open docMenu"></i>
									</c:when>
									<c:otherwise>
										<i class="far fa-file docMenu"></i>
									</c:otherwise>
								</c:choose><br>
								<span style="font-size:9pt">${ a.formName }</span>
							</h3>
	                    </div>
	                    <div class="w3-cell text-left" style="width:30%; padding-left:10px">
	                        <h5 class="w3-cell">${ a.docName}</h5>
							<small>${ a.docDate }</small>
	                        
	                    </div>
	                    <div class="w3-cell">
	                        <h3 class="w3-cell"><i class="fas fa-user-edit"></i></h3>
	                        <h5 class="w3-cell">&nbsp; ${ a.memName }</h5>
	                        <small>${ a.department }</small>
	                    </div>
	                    <div class="w3-cell" style="width:30%;">
	                        <c:forTokens var="l" items="${a.line}" delims="," varStatus="status">
		   						<c:choose>
		   							<c:when test="${l eq a.sort }">
		   								<div class="w3-cell"><h3 class="w3-cell"><i class="fas fa-pen apprLine"></i></h3>
				                            <small>${ l }</small>
				                        </div>
		   							</c:when>
		   							<c:otherwise>
				                    	<div class="w3-cell"><h3 class="w3-cell"><i class="far fa-check-circle"></i></h3>
				                            <small>${ l }</small>
				                        </div>
				                    </c:otherwise>
	    						</c:choose>
			                    <c:if test="${status.last eq false}">
			                    	<div class="w3-cell">&horbar;</div>
			                    </c:if>
							</c:forTokens>
	                    </div>
	                </div>
                </c:forEach>
                

                <br>
				<!--페이징 처리 시작-->
                 <div id="pagingArea">
					<ul class="pagination">
						<c:if test="${ pi.currentPage ne 1 }">
							<li class="page-item"><a class="page-link" href="main.appr?currentPage=${ pi.currentPage-1 }&apprFolder=${apprFolder}">이전</a></li>
						</c:if>

						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:choose>
								<c:when test="${ pi.currentPage eq p }">
									<li class="page-item"><a class="page-link" style="background-color: lightsteelblue" href="main.appr?currentPage=${ p }&apprFolder=${apprFolder}">${ p }</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="main.appr?currentPage=${ p }&apprFolder=${apprFolder}">${ p }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:if test="${ pi.currentPage ne pi.maxPage }">
							<li class="page-item"><a class="page-link" href="main.appr?currentPage=${ pi.currentPage+1 }&apprFolder=${apprFolder}">다음</a></li>
						</c:if>


					</ul>
           		 </div>
				<!--페이징 처리 끝-->
                <br>
            </div>
    	</div>
    </section>

  
 	
</body>
</html>