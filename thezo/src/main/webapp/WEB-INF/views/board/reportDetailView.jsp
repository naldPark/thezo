<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table * {
	margin: 5px;
}
table td, table th{ height:60px;}

table {
	width: 100%;
	height: 200px;
}
.innerOuter {
	width: 1000px;
	margin: auto;
	padding: 5% 5%;
	background: white;
}
#status {
	width: 20%;
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
			
			<br><br><br><br>
			<form action="reportUpdate.bo" id="reportUpdateForm" method="post">
				<table align="center">
					<tr>
						<th>신고번호</th>
						<td>${ r.rpCode }</td>
						<th>게시글/댓글 번호</th>
						<td>${ r.rpNo }</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${ r.rpId }</td>
						<th>신고일</th>
						<td>${ r.rpDate }</td>
					</tr>
					<tr>
						<th>게시판유형</th>
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
						<th>신고유형</th>
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
					</tr>
					<tr>
						<th>신고분류</th>
						<td>${ r.rpSection }</td>
						<th></th>
						<td></td>
					</tr>
					<tr>
						<th>신고내용</th>
						<td>${ r.rpContent }</td>
						<th></th>
						<td></td>
					</tr>
					<tr>
						<th>신고상태</th>
						<td colspan="3">
							<select name="status" id="status" class="custom-select">
								<option value="N">대기</option>
								<option value="Y">완료</option>
							</select>
						</td>
					</tr>
				</table>
				
				<br><br>

				<div align="center">
					<input type="hidden" name="rpNo" value="${ r.rpNo }">
					<input type="hidden" name="rpCode" value="${ r.rpCode }">
					<a class="btn btn-secondary" href="boardReport.bo">목록</a> 
					<button type="submit" class="btn btn-secondary">확인</button>
				</div>
				
				
			</form>
			
			<script>
			 
	            var $status = "${ r.status }"
	                
	            $("#status>option").each(function(){
	            	if($(this).val() == $status){
	                	$(this).attr("selected",true);
	                }
	            })
              </script>
			
			
			
		</div>
		
		
	</div>
	</section>
			
</body>
</html>