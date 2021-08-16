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

#searchForm{
    width:49%;
}
#searchForm>*{
    float:left;
    margin:5px;
}
.select {
	width: 25%;
}

table tbody {
	cursor: pointer;
}

#pagingArea {
	width: fit-content;
	margin: auto;
}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	<c:if test="${loginUser.memId eq 'admin' }">
		<script>	
			document.getElementById("admin-header").style.display = "block";
			document.getElementById("admin-mode").style.color = "red";
		</script>
		<br><br><br><br>
	</c:if>
	
	<section>

	<div class="outer">
		<div class="innerOuter">
			<h2>
				<b>신고관리</b>
			</h2>
			<br>
			<!-- 굳이 필요성이....?
			<div id="search-area" align="right">
	        	<form id="searchForm" action="reportSearch.bo" method="Get">
	            	<div class="select">
	                	<select class="custom-select" name="condition">
	                    	<option value="boardType">게시판유형</option>
	                        <option value="rpType">신고유형</option>
	                        <option value="status">상태</option>
	                    </select>
	                </div>
	                <div class="text">
	                    <input type="text" class="form-control" name="keyword">
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
	        
	        <br><br><br>
			-->
			<br><br><br>
			<!-- 게시글 10개씩 페이징바는 5-->
			<table id="boardList" class="table table-hover" align="center">
				<thead>
					<tr>
						<th>신고번호</th>
						<th>게시판유형</th>
						<th>신고유형</th>
						<th>신고분류</th>
						<th>작성자</th>
						<th>신고일</th>
						<th>처리상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="rp" items="${ list }">
						<tr>
							<td class="rpCode">${ rp.rpCode }</td>
							<td>
								<c:choose>
									<c:when test="${ rp.boardType eq 1}">
										사내게시판
									</c:when>
									<c:otherwise>
										벼룩시장
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
										<c:when test="${ rp.rpType eq 1}">
											게시글
										</c:when>
										<c:otherwise>
											댓글
									</c:otherwise>
								</c:choose>	
							</td>
							<td>${ rp.rpSection }</td>
							<td>${ rp.rpId }</td>
							<td>${ rp.rpDate }</td>
							<td>
								<c:choose>
										<c:when test="${ rp.status eq 'Y'}">
											완료
										</c:when>
										<c:otherwise>
											대기
									</c:otherwise>
								</c:choose>	
							</td>
						</tr>	
                    </c:forEach>
				</tbody>
			</table>
			 <script>
	            	$(function(){
	            		$("#boardList>tbody>tr").click(function(){
	            			location.href="adReportDetail.bo?rpCode=" + $(this).children(".rpCode").text();
	            		})
	            	})
	         </script>
				
			
			<br> <br>

			<div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
	                		<c:when test="${ pi.currentPage eq 1 }">
		                   		<li class="page-item disabled"><a class="page-link">Previous</a></li>
		                    </c:when>
		                    <c:otherwise>
		                    	<c:choose>
		                    		<c:when test="${ empty condition }">
		                    			<li class="page-item"><a class="page-link" href="boardReport.bo?currentPage=${ pi.currentPage-1 }">Previous</a></li>
		                    		</c:when>
		                    		<c:otherwise>
		                    			<li class="page-item"><a class="page-link" href="reportSearch.bo?currentPage=${ pi.currentPage-1 }&condition=${condition}&keyword=${keyword}">Previous</a></li>
		                    		</c:otherwise>
		                    	</c:choose>		
	                    	</c:otherwise>
	                    
                    </c:choose>
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<c:choose>
                    		<c:when test="${ empty condition }">
                    			<li class="page-item"><a class="page-link" href="boardReport.bo?currentPage=${ p }">${ p }</a></li>
                    		</c:when>
                    		<c:otherwise>
                    			<li class="page-item"><a class="page-link" href="reportSearch.bo?currentPage=${ p }&condition=${condition}&keyword=${keyword}">${ p }</a></li>
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
		                    		<li class="page-item"><a class="page-link" href="boardReport.bo?currentPage=${ pi.currentPage+1 }">Next</a></li>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<li class="page-item"><a class="page-link" href="reportSearch.bo?currentPage=${ pi.currentPage+1 }&condition=${condition}&keyword=${keyword}">Next</a></li>
		                    	</c:otherwise>
		                    </c:choose>		
		                </c:otherwise>    
		            </c:choose>        
                </ul>
            </div>


		</div>

	</div>
	</section>
</body>
</html>