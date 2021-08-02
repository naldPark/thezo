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
	.list-area{width: 950px; float:left;}
	.note-area{width: 100%; height:800px; margin:0 auto; margin-left:50px; text-align: center; border: 1px solid black; padding: 30px;}
	.button-area{margin-left: 100px;}
	
	/* 노트 display */
	.w3-container>div{margin:25px; width: 40%; display: inline-block;}
	.w3-container>div {color:gray;}
	.w3-container>div:hover{cursor:pointer;}
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
	#noteSc, #createDate{color:rgb(131, 131, 131);}

	
	/* 검색바 */
	#search{width: 300px; margin: 0; box-sizing: border-box;}
	.btn-search{text-align: left; padding: 10px; margin: 10px;}
	.search-area{margin:auto 0;text-align: center;}
	#condition{text-align: left; margin: 10px;}
</style>
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
				<div class="note-area w3-panel w3-border w3-round">
					<div class="w3-container">
						<c:choose>
							<c:when test="${ empty list }">
								등록된 노트가 없습니다.
							</c:when>
							<c:otherwise>
								<c:forEach var="n" items="${ list }">
									<div class="w3-panel w3-card w3-yellow w3-hover-shadow w3-padding-32 text-left" id="note">
										<input type="hidden" value="${ n.noteNo }">
										<p><b>${ n.noteTitle }</b></p>
										<hr>
										<p id="noteContent">${ n.noteContent }</p>
										<p id="createDate">최근 수정일 : ${ n.createDate }</p>
										<!-- 관련일정 없을 시 보여지지 않게 -->
										<p id="noteSc"><a href="#">관련일정 : 관련일정제목넣기</a></p>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
					
					<script>
						$(function(){
							$("#note").click(function(){
								// 노트번호 전달받아서 상세정보 페이지 이동
								location.href = "detail.note";
							})
						})
					</script>
					
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
				                			<li class="page-item"><a class="page-link" href="list.note?currentPage=${ pi.currentPage - 1 }&dCount=${ dCount }">Previous</a></li>
				                		</c:when>
				                		<c:otherwise>
				                			<li class="page-item"><a class="page-link" href="search.note?currentPage=${ pi.currentPage - 1 }&keyword=${ keyword }&condition=${ condition }&dCount=${ dCount }">Previous</a></li>
				                		</c:otherwise>
				                	</c:choose>
				                </c:otherwise>
				            </c:choose>
				            
	                		<c:choose>
	                			<c:when test="${ empty condition }">
	                				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                					<li class="page-item"><a class="page-link" href="list.note?currentPage=${ p }&dCount=${ dCount }">${ p }</a></li>
	                				</c:forEach>
	                			</c:when>
	                			<c:otherwise>
	                				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                					<li class="page-item"><a class="page-link" href="search.note?currentPage=${ p }&keyword=${ keyword }&condition=${ condition }&dCount=${ dCount }">${ p }</a></li>
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
						                	<li class="page-item"><a class="page-link" href="list.note?currentPage=${ pi.currentPage + 1 }&dCount=${ dCount }">Next</a></li>
					            		</c:when>
					            		<c:otherwise>
					            			<li class="page-item"><a class="page-link" href="search.note?currentPage=${ pi.currentPage + 1 }&keyword=${ keyword }&condition=${ condition }&dCount=${ dCount }">Next</a></li>
					            		</c:otherwise>
				            		</c:choose>
			            		</c:otherwise>
			                </c:choose>
			                
			            </ul>
			        </div>

					<%-- 검색바 ------%>
					<div class="search-area">
						<form class="form-inline justify-content-center" action="search.note">
							<select class="form-control" name="condition" id="condition">
								<option value="docContent">제목</option>
								<option value="docContent">내용</option>
								<option value="docContent">제목+내용</option>
							</select>
							<input type="search" class="form-control" placeholder="검색어를 입력하세요" id="search">
							<button type="submit" class="btn btn-primary btn-search">검색</button>
						</form>
					</div>
				</div>
				
				<br>
				
			</div>		
	    </div>
	</section>
</body>
</html>