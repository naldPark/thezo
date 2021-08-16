<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Zo</title>

<link rel="stylesheet"  href="resources/css/datepicker.min.css">
<style>
	    .fa-file-alt{font-size:50pt;}
    #newApprnav{background:rgb(20,70,104)!important; color: white!important;}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
   	 <section>
        <div class="outer" align="center">    
            <p class="pageTitle">  approval <b> 전자결재</b></p>
			<jsp:include page="apprAdminSidebar.jsp" />
			<script src="resources/js/datepicker.min.js"></script>
			<script src="resources/js/datepicker.ko.js"></script>
            <div class="sideOuter">
				   <!-- 카테고리 area -->
				   <div class="card-deck" style="width:70%">
                    <a class="card category shadow" href="adminMain.appr">
                        <div class="card-body text-center">
                            <p class="card-text"><i class="far fa-file-alt"></i></p>
                            <h5 class="card-text">전체</h5>
                        </div>
                    </a>
                    <a class="card category shadow" href="adminMain.appr?category=일반">
                        <div class="card-body text-center">
                            <p class="card-text"><i class="far fa-file-alt"></i></p>
                            <h5 class="card-text">일반</h5>
                        </div>
                    </a>
                    <a class="card category shadow" href="adminMain.appr?category=비용">
                        <div class="card-body text-center">
                            <p class="card-text"><i class="far fa-file-alt"></i></p>
                            <h5 class="card-text">비용</h5>
                        </div>
                    </a>
                    <a class="card category shadow" href="adminMain.appr?category=총무">
                        <div class="card-body text-center">
                            <p class="card-text"><i class="far fa-file-alt"></i></p>
                            <h5 class="card-text">총무</h5>
                        </div>
                    </a>
                    <a class="card category shadow" href="adminMain.appr?category=인사">
                        <div class="card-body text-center">
                            <p class="card-text"><i class="far fa-file-alt"></i></p>
                            <h5 class="card-text">인사</h5>
                        </div>
                    </a>
                </div>
				<br>
				<h4 class="text-left pl-3">문서리스트</h4>
				<br>
				<!-- 검색 area -->
				<form action="adminMain.appr" id="adminMain" method="post">
					
					<div class="w3-row-padding">
						<div class="w3-third">
							<div class="input-group mb-3"></div>
						</div>
						<div class="w3-twothird">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">검색분류</span>
								</div>
								<select class="form-control" id="sel1" name="category">
									<option value="전체">전체</option>
									<option value="일반">일반</option>
									<option value="비용">비용</option>
									<option value="총무">총무</option>
									<option value="인사">인사</option>
								</select>
								<input type="text" name="formName" class="form-control" placeholder="검색할 제목을 입력하세요" style="width:200px">
								<input type="hidden" name="currentPage" id="apprCurrentPage" value="1">
								<div class="input-group-append">
									<button type="submit" class="btn btn-primary btn-sm" style="width: 100px">&nbsp;조회&nbsp;</button>
								</div>
							</div>
						</div>
					</div>
				</form>
				
				<script>
					$(function () {
						$('.datepicker-here').datepicker({
							language: 'ko',
							autoClose: true
						})
					})
				</script>
				<br><br><hr>
						
            
	                <!-- 문서리스트 -->
					<c:forEach var="a" items="${ list }">
					<div class="apprList shadow p-4 mb-3 bg-white w3-cell-row">
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
										<i class="far fa-edit docMenu"></i>
									</c:otherwise>
								</c:choose><br>
								<span style="font-size:9pt">${ a.formName }</span>
							</h3>
						</div>
						<div class="w3-cell text-left" style="width:75%; padding-left:10px">
							<h5 class="w3-cell" id="${a.docNo}docName">${ a.formInfo }</h5>
						</div>
                        <div class="w3-cell text-center" style="width:20%; padding-left:10px">
							<c:choose>
								<c:when test="${ a.status eq 'Y' }">
									<h5><span class="badge badge-pill badge-success">사용중</span></h5>
								</c:when>
								<c:otherwise>
									<h5><span class="badge badge-pill badge-secondary">미사용</span></h5>
								</c:otherwise>
							</c:choose>
                            <button type="button" onclick="location.href='editForm.appr?formNo=${a.formNo}'"
                                class="btn btn-sm btn-outline-primary">수정</button>
                            <button type="button" class="deleteFormModal btn btn-sm btn-outline-primary" data-toggle="modal"
                                data-target="#delete" id="${a.formNo}">삭제</button>
                        </div>
	                </div>
				</c:forEach>
                
                <br>
				<!--페이징 처리 시작-->
				<div id="pagingArea">
					<ul class="pagination">
						<c:if test="${ pi.currentPage ne 1 }">
							<li class="page-item"><a class="page-link">이전</a></li>
						</c:if>
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:choose>
								<c:when test="${ pi.currentPage eq p }">
									<li class="page-item"><a class="page-link" style="background-color: lightsteelblue">${ p }</a></li>
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
			<div class="modal" id="delete">
				<div class="modal-dialog">
					<div class="modal-content" style="width:400px">
						<div class="modal-body" align="center"><br>
							<form action="deleteForm.appr" method="post">
								<h4><b id="deleteFormName">ㅇㅇㅇ문서 삭제</b></h4><br>삭제 이후 복원이 불가합니다.<br>해당문서를 삭제하시겠습니까?<br><br>
								<input type="hidden" id="deleteFormNo" name="formNo" value="">
								<button type="submit" class="btn btn-primary" class="deleteButton">삭제</button>
								<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							</form>
							<br>
						</div>
					</div>
				</div>
			</div>
    	</div>
    </section>

	<script>
		

	// 페이징바 기능
	$(".page-link").click(function(){

		  var page = $(this).text();
		  if(page =="이전"){ 
			$("#apprCurrentPage").val("${ pi.currentPage-1 }");
		  } else if(page=="다음"){
			$("#apprCurrentPage").val("${ pi.currentPage+1 }");
		  } else {
			$("#apprCurrentPage").val(page);
		  }
		  $("#adminMain").submit();
	})

	$(function(){
		$(function(){
		<c:if test="${!empty a.category}">
			$("#sel1").val("${a.category}").attr("selected", "selected");
		</c:if>
		})
	})

	$(".deleteFormModal").click(function(){
		var formName = $(this).parent().prev().prev().text();
		$("#deleteFormName").text(formName);
		$("#deleteFormNo").val($(this).attr("id"));
	})
</script>
 	
</body>
</html>