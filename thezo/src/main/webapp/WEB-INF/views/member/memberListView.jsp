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
	<!-- 관리자 회원정보관리 (등록/수정) : 이성경 -->

	<jsp:include page="../common/header.jsp" />
	
	<script>
		document.getElementById("admin-header").style.display = "block";
		document.getElementById("admin-mode").style.color = "red";
	</script>
	
	
	
	<div class="outer">

		<div class="innerOuter">
			<h2>
				<b>사원 관리</b>
			</h2>
			<br>
			<div id="outerHeader">
				<div class="header1">
					<a class="btn btn-primary btn-sm" id="approval" href="enrollForm.me">등록</a>
				</div>

				<div class="header2">
					<div id="search-area" align="right">
						<form id="searchForm" action="" method="Get">
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
					</div>
				</div>
				<br>

			</div>
			<br>
			<table id="boardList" class="table table-hover" align="center">
				<thead>
					<tr>
						<th>No</th>
						<th>사원번호</th>
						<th>이름</th>
						<th>아이디</th>
						<th>부서명</th>
						<th>직급</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>5</td>
						<td>100</td>
						<td>김개똥</td>
						<td>user04</td>
						<td>영업1팀</td>
						<td>대리</td>
					</tr>
					<tr>
						<td>5</td>
						<td>100</td>
						<td>김개똥</td>
						<td>user04</td>
						<td>영업1팀</td>
						<td>대리</td>
					</tr>
					<tr>
						<td>5</td>
						<td>100</td>
						<td>김개똥</td>
						<td>user04</td>
						<td>영업1팀</td>
						<td>대리</td>
					</tr>
					<tr>
						<td>5</td>
						<td>100</td>
						<td>김개똥</td>
						<td>user04</td>
						<td>영업1팀</td>
						<td>대리</td>
					</tr>
					<tr>
						<td>5</td>
						<td>100</td>
						<td>김개똥</td>
						<td>user04</td>
						<td>영업1팀</td>
						<td>대리</td>
					</tr>
				</tbody>

			</table>

			<br> <br>
			<div id="pagingArea">
				<ul class="pagination">
					<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</div>


		</div>

	</div>


</body>
</html>