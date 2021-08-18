<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta charset="UTF-8">
<title>노트관리</title>
<style>
	div{box-sizing: border-box;}
	.list-area{width: 100%; float:left;}
	.note-area{width: 100%; margin:0 auto; margin-left:50px; text-align: center; border: 1px solid black; padding: 30px;}
	.button-area{margin-left: 100px;}
	
	/* 노트 display */
	.w3-container>div{margin:25px; width: 40%; display: inline-block;}
	.w3-container>div {color:gray;}
	.w3-container>div:hover{cursor:pointer;}
	#note{width: 400px; height: 300px;}
	#noteContent{
		height: 110px;
		white-space: normal; 
		line-height: 1.2;
		height: 3.6em;
		overflow: hidden; 
		word-wrap: break-word; 
		display: -webkit-box; 
		-webkit-line-clamp: 3; 
		-webkit-box-orient: vertical;
	}
	/*
	#noteSc, #createDate{color:rgb(131, 131, 131);}
	*/
	/* 검색바 */
	#search{width: 300px; margin: 0; box-sizing: border-box;}
	.btn-search{text-align: left; padding: 10px; margin: 10px;}
	.search-area{margin:auto 0;text-align: center;}
	#condition{text-align: left; margin: 10px;}
	
</style>
<script>
	function w3_open() {
		document.getElementById("main").style.marginLeft = "200px";
		document.getElementById("mySidebar").style.width = "200px";
		document.getElementById("mySidebar").style.display = "block";
		document.getElementById("openNav").style.display = 'none';
	}
	function w3_close() {
		document.getElementById("main").style.marginLeft = "0%";
		document.getElementById("mySidebar").style.display = "none";
		document.getElementById("openNav").style.display = "inline-block";
	}
</script>	
</head>
<body>
	
    <!-- 메뉴바 -->
    <jsp:include page="../../common/header.jsp"/>

    <section>
	    <div class="outer">
	        <!-- 노트관리 네비바 -->
            <jsp:include page="noteMenubar.jsp"/>
			<br>
			<div class="list-area">
				<div id="main">
                    <button id="openNav" class="w3-button w3-xlarge" onclick="w3_open()">&#9776;</button>
					<div class="note-area w3-panel w3-border w3-round">
						<div class="w3-container">
							<br>
							<c:choose>
								<c:when test="${ empty list }">
									작성한 노트가 없습니다.
								</c:when>
								<c:otherwise>
									<c:forEach var="n" items="${ list }">
										<div class="w3-panel w3-card w3-yellow w3-hover-shadow w3-padding-32 text-left" id="note">
											<input type="hidden" id="noteNo" value="${ n.noteNo }">
											<input type="hidden" id="scNo" value="${ n.scNo }">
											<p><b style="font-size:20px;">${ n.noteTitle }</b></p>
											<hr>
											<p id="noteContent">${ n.noteContent }</p>
											<p id="createDate">최근 수정일 : ${ n.createDate }</p>
											<!-- 관련일정 없을 시 보여지지 않게 -->
											<c:choose>
												<c:when test="${ !empty n.noteSc }">
													<p id="noteSc">
														관련일정 : <b>${ n.noteSc }</b>
													</p>
												</c:when>
												<c:otherwise>
													<p id="noteSc">관련일정 : <b>선택안함</b></p>
												</c:otherwise>
											</c:choose>
											
										</div>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
						
						<script>
							$(function(){
								$(".list-area #note").click(function(){
									$("#boardList>tbody>tr").click(function(){
				            			location.href="detail.bo?bno=" + $(this).children(".bno").text();
				            		})
									location.href = "detail.note?noteNo=" + $(this).children().eq(0).val() + "&memNo=" + ${ loginUser.memNo }; // 노트번호
								})
							})
						</script>
						
						<c:if test="${ !empty list }">
						<br>
						<%-- 페이징바 -------------------------------------- --%>
						<div class="paging-area">
				            <ul class="pagination justify-content-center">
				            	<c:choose>
				            		<c:when test="${ pi.currentPage eq 1 }">
					            		<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
					            	</c:when>
					            	<c:otherwise>
					            		<c:choose>
					            			<c:when test="${ empty condition }">
					                			<li class="page-item"><a class="page-link" href="list.note?memNo=${ loginUser.memNo }&currentPage=${ pi.currentPage - 1 }">Previous</a></li>
					                		</c:when>
					                		<c:otherwise>
					                			<li class="page-item"><a class="page-link" href="search.note?memNo=${ loginUser.memNo }&currentPage=${ pi.currentPage - 1 }&keyword=${ keyword }&condition=${ condition }">Previous</a></li>
					                		</c:otherwise>
					                	</c:choose>
					                </c:otherwise>
					            </c:choose>
					            
		                		<c:choose>
		                			<c:when test="${ empty condition }">
		                				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		                					<c:choose>
		                						<c:when test="${ pi.currentPage eq p }">
		                							<li class="page-item active"><a class="page-link" href="list.note?memNo=${ loginUser.memNo }&currentPage=${ p }">${ p }</a></li>
		                						</c:when>
		                						<c:otherwise>
		                							<li class="page-item"><a class="page-link" href="list.note?memNo=${ loginUser.memNo }&currentPage=${ p }">${ p }</a></li>
		                						</c:otherwise>
		                					</c:choose>
		                				</c:forEach>
		                			</c:when>
		                			
		                			<c:otherwise>
		                				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		                					<c:choose>
		                						<c:when test="${ pi.currentPage eq p }">
		                							<li class="page-item active"><a class="page-link" href="search.note?memNo=${ loginUser.memNo }&currentPage=${ p }&keyword=${ keyword }&condition=${ condition }">${ p }</a></li>
		                						</c:when>
		                						<c:otherwise>
		                							<li class="page-item"><a class="page-link" href="search.note?memNo=${ loginUser.memNo }&currentPage=${ p }&keyword=${ keyword }&condition=${ condition }">${ p }</a></li>
		                						</c:otherwise>
		                					</c:choose>
		                				</c:forEach>
		                			</c:otherwise>
		               			</c:choose>
					                			
					            <c:choose>
					            	<c:when test="${ pi.currentPage eq pi.maxPage }">
					            		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
					            	</c:when>
					            	<c:otherwise>
					            		<c:choose>
						            		<c:when test="${ empty condition }">
							                	<li class="page-item"><a class="page-link" href="list.note?memNo=${ loginUser.memNo }&currentPage=${ pi.currentPage + 1 }">Next</a></li>
						            		</c:when>
						            		<c:otherwise>
						            			<li class="page-item"><a class="page-link" href="search.note?memNo=${ loginUser.memNo }&currentPage=${ pi.currentPage + 1 }&keyword=${ keyword }&condition=${ condition }">Next</a></li>
						            		</c:otherwise>
					            		</c:choose>
				            		</c:otherwise>
				                </c:choose>
				                
				            </ul>
				        </div>
	
						<%-- 검색바 ------%>
						<div class="search-area">
							<form class="form-inline justify-content-center" action="search.note" id="searchForm">
								<select class="form-control" name="condition" id="condition" value="${ condition }">
									<option value="title">제목</option>
									<option value="content">내용</option>
									<option value="titleContent">제목+내용</option>
								</select>
								<input type="search" name="keyword" class="form-control" placeholder="검색어를 입력하세요" id="search" value="${ keyword }">
								<input type="hidden" name="noteWriter" value="${ loginUser.memNo }">
								<button type="submit" class="btn btn-primary btn-search">검색</button>
							</form>
						</div>
						</c:if>
						<br><br>
						
						<c:if test="${ !empty condition }">
							<script>
								$(function(){
									$("#searchForm option[value=${ condition }]").attr("selected", true);
								})
							</script>
						</c:if>
						
					</div>
				</div>
							
				<br>
				
			</div>		
	    </div>
	</section>
</body>
</html>