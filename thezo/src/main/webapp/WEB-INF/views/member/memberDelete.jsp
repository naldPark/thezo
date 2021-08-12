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

table tbody {
	cursor: pointer;
}

#searchForm>* {
	float: left;
	margin: 5px;
}

  #searchForm{
        width:49%;
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
</style>
</head>
<body>

	<!-- 관리자 : 퇴사한 사원들의 정보 모두 삭제(이성경) -->
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
				<b>사원 삭제</b>
			</h2>
			<br>
			<div id="search-area" align="right">
						<form id="searchForm" action="deleteSearch.me" method="Get">
							<div class="select">
								<select class="custom-select" name="condition">
									<option value="memName">이름</option>
									<option value="memId">아이디</option>
									<option value="department">부서명</option>
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
			<table id="boardList" class="table table-hover" align="center">
				<thead>
					<tr>
						<th>사원번호</th>
						<th>이름</th>
						<th>아이디</th>
						<th>부서명</th>
						<th>직급</th>
						<th>퇴사일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="m" items="${ list }">
	                    <tr>
	                        <td class="mno">${ m.memNo }</td>
	                        <td>${ m.memName }</td>
	                        <td>${ m.memId }</td>
	                        <td>${ m.department }</td>
	                        <td>${ m.rank }</td>
	                        <td>${ m.resignDate }</td>
	                    </tr>
                    </c:forEach>
				</tbody>

			</table>
			
			<script>
            	$(function(){
            		$("#boardList>tbody>tr").click(function(){
            			location.href="memDeleteForm.me?mno=" + $(this).children(".mno").text();
            		})
            	})
            </script>

			<br>
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
		                    			<li class="page-item"><a class="page-link" href="memberDelete.me?currentPage=${ pi.currentPage-1 }">Previous</a></li>
		                    		</c:when>
		                    		<c:otherwise>
		                    			<li class="page-item"><a class="page-link" href="deleteSearch.me?currentPage=${ pi.currentPage-1 }&condition=${condition}&keyword=${keyword}">Previous</a></li>
		                    		</c:otherwise>
		                    	</c:choose>		
	                    	</c:otherwise>
	                    
                    </c:choose>
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<c:choose>
                    		<c:when test="${ empty condition }">
                    			<li class="page-item"><a class="page-link" href="memberDelete.me?currentPage=${ p }">${ p }</a></li>
                    		</c:when>
                    		<c:otherwise>
                    			<li class="page-item"><a class="page-link" href="deleteSearch.me?currentPage=${ p }&condition=${condition}&keyword=${keyword}">${ p }</a></li>
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
		                    		<li class="page-item"><a class="page-link" href="memberDelete.me?currentPage=${ pi.currentPage+1 }">Next</a></li>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<li class="page-item"><a class="page-link" href="deleteSearch.me?currentPage=${ pi.currentPage+1 }&condition=${condition}&keyword=${keyword}">Next</a></li>
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