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

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
   	 <section>
        <div class="outer" align="center">    
            <p class="pageTitle">  approval <b> 전자결재</b></p>
            <jsp:include page="apprSidebar.jsp"/>
			<script src="resources/js/datepicker.min.js"></script>
			<script src="resources/js/datepicker.ko.js"></script>
            <div class="sideOuter">
				<br>
				<h4 class="text-left pl-3">문서리스트</h4>
				<br>
				<!-- 검색 area -->
				<c:choose>
					<c:when test="${empty list}">
					  <div style="font-size:30pt; color: darkgray"><br>
						<img src="resources/images/empty.png" style="width:30%"><br>
						<span>무...문서함이 텅 비어있어요</span>
					  </div>
					</c:when>
					<c:otherwise>
				<form action="main.appr" method="post">
					<div class="w3-row-padding">
						<div class="w3-third">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">기간선택</span>
								</div>
								<input type="text" name="datePeriod" data-range="true" data-multiple-dates-separator=" - "
									data-language="ko" class="datepicker-here form-control" style="cursor: pointer; width:100px" />
							</div>
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
								<input type="text" name="docName" class="form-control" placeholder="검색할 제목을 입력하세요" style="width:200px">
								<input type="hidden" name="apprFolder" value="${apprFolder}">
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
						
                <c:forEach var="a" items="${ list }">
	                <!-- 문서리스트 -->
					<div class="apprList shadow p-4 mb-3 bg-white w3-cell-row" id="${a.docNo}doclist"
						onclick="location.href='detailDocu.appr?docNo=${a.docNo}'">
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
						<div class="w3-cell text-left" style="width:30%; padding-left:10px">
							<h5 class="w3-cell" id="${a.docNo}docName">${a.docName}</h5>
							<small>${ a.docDate }</small>
						</div>
						<div class="w3-cell">
							<h3 class="w3-cell"><i class="fas fa-user-edit"></i></h3>
							<h5 class="w3-cell">&nbsp; ${ a.memName }</h5>
							<small>${ a.department }</small>
					
						</div>
						<script>
							<c:forEach var="rc" items="${ readCheckList }">
								<c:if test="${rc.docNo eq a.docNo and rc.read eq 'N'}">
									$("#${a.docNo}docName").html("<i class='fas fa-exclamation-circle' style='color:firebrick'></i> ${a.docName}");
								</c:if>
							</c:forEach>
						</script>
						<div class="w3-cell" style="width:30%;">
							<c:forTokens var="l" items="${a.line}" delims="," varStatus="status">
								<c:choose>
									<c:when test="${l eq a.sort }">
										<div class="w3-cell">
											<h3 class="w3-cell"><i class="fas fa-pen apprLine"></i></h3>
											<small>${ l }</small>
										</div>
									</c:when>
									<c:otherwise>
										<div class="w3-cell">
											<h3 class="w3-cell"><i class="far fa-check-circle"></i></h3>
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
			</c:otherwise>
			</c:choose>
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
    	</div>
    </section>

	<script>

		

	// 페이징바 기능
	$(".page-link").click(function(){

		  var page = $(this).text();
		  if(page =="이전"){   //main.appr?currentPage=${ pi.currentPage-1 }&apprFolder=${apprFolder}
			$("#apprCurrentPage").val("${ pi.currentPage-1 }");
		  } else if(page=="다음"){
			$("#apprCurrentPage").val("${ pi.currentPage+1 }");
		  } else {
			$("#apprCurrentPage").val(page);
		  }
		  $("#main.appr").submit();
	})

	$(function(){
		$(function(){
		<c:if test="${!empty a.category}">
			$("#sel1").val("${a.category}").attr("selected", "selected");
		</c:if>
		})
	})

</script>
  
 	
</body>
</html>