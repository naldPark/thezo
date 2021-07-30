<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.innerOuter {
	width: 1000px;
	margin: auto;
	padding: 5% 5%;
	background: white;
}

#searchForm {
	width: 49%;
}

#searchForm>* {
	float: left;
	margin: 5px;
}

.select {
	width: 20%;
}

.text {
	width: 53%;
}

.searchBtn {
	Width: 20%;
}

#pagingArea {
	width: fit-content;
	margin: auto;
}

table tbody {
	cursor: pointer;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<section>
	
	<div class="outer">

		<div class="innerOuter">
			<h2>
				<b>공지사항</b>
			</h2>
			<div id="search-area" align="right">
				<form id="searchForm" action="noticeSearch.bo" method="Get">
					<div class="select">
						<select class="custom-select" name="condition">
							<option value="writer">작성자</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select>
					</div>
					<div class="text">
						<input type="text" class="form-control" name="keyword" value="${ keyword }">
					</div>
					<button type="submit" class="searchBtn btn btn-secondary">검색</button>
				</form>
				<script>
	            	$(function(){
	            		if("${condition}" != ""){
	            			$("option[value=${condition}]").attr("selected", true);
	            		}
	            	})
	            </script>
			</div>

			<br>
			<br> <br>
			<!-- 게시글 10개씩 페이징바는 5-->
			<table id="boardList" class="table table-hover" align="center">
				<thead>
					<tr>
						<th>NO</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="b" items="${ list }">
	                    <tr>
	                        <td class="bno">${ b.boardNo }</td>
	                        <td>${ b.boardTitle }</td>
	                        <td>${ b.boardWriter }</td>
	                        <td>${ b.boardDate }</td>
	                        <td>${ b.count }</td>
	                    </tr>
                    </c:forEach>
				</tbody>
			</table>
			
			<script>
            	$(function(){
            		$("#boardList>tbody>tr").click(function(){
            			location.href="noticeDetail.bo?bno=" + $(this).children(".bno").text();
            		})
            	})
            </script>
			
			
			
			
			<br><br>
			<!-- 권한자만 볼 수 있게 -->
			<a class="btn btn-secondary" style="float: right"
				href="noticeEnrollForm.bo">글쓰기</a>&nbsp;&nbsp; <br>
			<br>
			
			
			<div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
	                		<c:when test="${ pi.currentPage eq 1 }">
		                   		<li class="page-item disabled"><a class="page-link">Previous</a></li>
		                    </c:when>
		                    <c:otherwise>
		                    	<c:choose>
		                    		<c:when test="${ empty condition }">
		                    			<li class="page-item"><a class="page-link" href="noticeList.bo?currentPage=${ pi.currentPage-1 }">Previous</a></li>
		                    		</c:when>
		                    		<c:otherwise>
		                    			<li class="page-item"><a class="page-link" href="noticeSearch.bo?currentPage=${ pi.currentPage-1 }&condition=${condition}&keyword=${keyword}">Previous</a></li>
		                    		</c:otherwise>
		                    	</c:choose>		
	                    	</c:otherwise>
	                    
                    </c:choose>
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<c:choose>
                    		<c:when test="${ empty condition }">
                    			<li class="page-item"><a class="page-link" href="noticeList.bo?currentPage=${ p }">${ p }</a></li>
                    		</c:when>
                    		<c:otherwise>
                    			<li class="page-item"><a class="page-link" href="noticeSearch.bo?currentPage=${ p }&condition=${condition}&keyword=${keyword}">${ p }</a></li>
                    		</c:otherwise>
                    	</c:choose>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
		                    <li class="page-item disabled"><a class="page-link">Next</a></li>
		                </c:when>
		                <c:otherwise>
		                    <c:choose>
		                   		<c:when test="${ empty condition }">
		                    		<li class="page-item"><a class="page-link" href="noticeList.bo?currentPage=${ pi.currentPage+1 }">Next</a></li>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<li class="page-item"><a class="page-link" href="noticeSearch.bo?currentPage=${ pi.currentPage+1 }&condition=${condition}&keyword=${keyword}">Next</a></li>
		                    	</c:otherwise>
		                    </c:choose>		
		                </c:otherwise>    
		            </c:choose>        
                </ul>
            </div>
			
			<br clear="both">
			<br>

		</div>

	</div>
	</section>
</body>
</html>