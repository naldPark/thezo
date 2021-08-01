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

#outerHeader>div {
	float: left;
}

.header1, .header2 {
	width: 50%;
}

.header1 {
	padding: 3% 1%;
}

.header2 {
	padding: 2% 0%;
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
	
	<script>
		document.getElementById("admin-header").style.display = "block";
		document.getElementById("admin-mode").style.color = "red";
	</script>
	
	<section>

	<div class="outer">
		<br><br><br><br>
		<div class="innerOuter">
			<h2>
				<b>신고관리</b>
			</h2>
			<br>
			<div id="outerHeader">
				<div class="header1">
					<a class="btn btn-primary btn-sm" id="approval">완료</a>
				</div>


				<div class="header2" align="right">
					<form id="searchForm" action="" method="Get">
						<div class="select">
							<select class="custom-select" name="condition">
								<option value="wait">대기</option>
								<option value="complete">완료</option>
							</select>
						</div>
					</form>
					
					<!-- 검색 결과 나오게 하기 ㅜㅜ
					<!-- sql문도 수정하기  -->
					<script>
		            	$(function(){
		            		if("${condition}" != ""){
		            			$("option[value=${condition}]").attr("selected", true);
		            		}
		            	})
	            	</script>
	            	
	            	<script>
		            	$(function(){
		            		$("option[value=${condition}]").click(function(){
		            			location.href="reportSearch.bo";
		            		})
		            	})
		            </script>
				</div>

			</div>

			<!-- 게시글 10개씩 페이징바는 5-->
			<table id="boardList" class="table table-hover" align="center">
				<thead>
					<tr data-toggle="collapse" data-target="#detail">
						<th>#</th>
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
		                   <td scope="row"><input type="checkbox" name="check"></td>
							<td class="c">${ rp.rpCode }</td>
							<td class="c">
								<c:choose>
									<c:when test="${ rp.boardType eq 1}">
										사내게시판
									</c:when>
									<c:otherwise>
										벼룩시장
									</c:otherwise>
								</c:choose>
							</td>
							<td class="c">
								<c:choose>
										<c:when test="${ rp.rpType eq 1}">
											게시글
										</c:when>
										<c:otherwise>
											댓글
									</c:otherwise>
								</c:choose>	
							</td>
							<td class="c">${ rp.rpSection }</td>
							<td class="c">${ rp.rpId }</td>
							<td class="c">${ rp.rpDate }</td>
							<td class="c">
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
		                    			<li class="page-item"><a class="page-link" href="reportSearch.bo?currentPage=${ pi.currentPage-1 }&condition=${condition}">Previous</a></li>
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
                    			<li class="page-item"><a class="page-link" href="reportSearch.bo?currentPage=${ p }&condition=${condition}">${ p }</a></li>
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
		                    		<li class="page-item"><a class="page-link" href="reportSearch.bo?currentPage=${ pi.currentPage+1 }&condition=${condition}">Next</a></li>
		                    	</c:otherwise>
		                    </c:choose>		
		                </c:otherwise>    
		            </c:choose>        
                </ul>
            </div>


			<div class="collapse multi-collapse m-0 p-0" id="detail"
				style="width: 800px;">
				<h4>신고내역</h4>
				<hr>
				<br>
				<table class="table table-sm table-bordered table-hover">
					<tbody>
					</tbody>

				</table>
			</div>
			
			<!--  아래 스크립트 작성하기  -->
		</div>

	</div>
	</section>
</body>
</html>