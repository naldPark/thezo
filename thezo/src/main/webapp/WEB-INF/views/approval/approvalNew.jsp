<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Zo</title>

<style>
    .fa-file-alt{font-size:50pt;}

</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
   	 <section>
        <div class="outer" align="center">    
            <p class="pageTitle">  approval <b> 전자결재</b></p>
            <jsp:include page="apprSidebar.jsp"/>
            <div class="sideOuter">
                
                <!-- 카테고리 area -->
                <div class="card-deck" style="width:70%">
                    
                    <div class="card category shadow">
                        <div class="card-body text-center">
                            <p class="card-text"><i class="far fa-file-alt"></i></p>
                            <h5 class="card-text">일반</h5>
                        </div>
                    </div>
                    <div class="card category shadow">
                        <div class="card-body text-center">
                            <p class="card-text"><i class="far fa-file-alt"></i></p>
                            <h5 class="card-text">비용</h5>
                        </div>
                    </div>
                    <div class="card category shadow">
                        <div class="card-body text-center">
                            <p class="card-text"><i class="far fa-file-alt"></i></p>
                            <h5 class="card-text">총무</h5>
                        </div>
                    </div>
                    <div class="card category shadow">
                        <div class="card-body text-center">
                            <p class="card-text"><i class="far fa-file-alt"></i></p>
                            <h5 class="card-text">인사</h5>
                        </div>
                    </div>
                </div>
                <br>
                <h6>결재양식을 선택 해 주세요</h6>
                <hr>
                <br>
                <!-- 안읽은 문서 건수 안내 끝 -->
                <!-- 문서리스트 -->
                
                 <c:forEach var="a" items="${ list }">
	                  <div class="d-flex mb-4 shadow newDocu">
	                    <div class="p-2 newDocuCate"><b class="text-primary"><i class="fas fa-coins docMenu"></i> ${ a.category }</b> <br>${ a.formName }</div>
	                    <div class="p-4 flex-grow-1">${ a.formInfo } </div>
	                    <div class="p-4"><button type="button"  onclick="location.href='enrollForm.appr?ano=${ a.formNo }'" class="btn btn-primary">작성</button></div>
	                 </div>
                 </c:forEach>
            

                <br><br>
               <!--페이징 처리 시작-->
                 <div id="pagingArea">
					<ul class="pagination">
						<c:choose>
							<c:when test="${ pi.currentPage eq 1 }">
								<li class="page-item disabled"><a class="page-link">이전</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="approvalNew?currentPage=${ pi.currentPage-1 }">이전</a></li>
							</c:otherwise>
						</c:choose>

						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
								<li class="page-item"><a class="page-link" href="approvalNew?currentPage=${ p }">${ p }</a></li>
						</c:forEach>

						<c:choose>
							<c:when test="${ pi.currentPage eq pi.maxPage }">
								<li class="page-item disabled"><a class="page-link">다음</a></li>
							</c:when>
							<c:otherwise>
									<li class="page-item"><a class="page-link" href="approvalNew?currentPage=${ pi.currentPage+1 }">다음</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
           		 </div>
				<!--페이징 처리 끝-->
            </div>
    	</div>
    </section>

  
 	
</body>
</html>