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
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />

	<div class="outer">

		<div class="innerOuter">
			<h2>
				<b>공지사항</b>
			</h2>
			<div id="search-area" align="right">
				<form id="searchForm" action="" method="Get">
					<div class="select">
						<select class="custom-select" name="condition">
							<option value="writer">작성자</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select>
					</div>
					<div class="text">
						<input type="text" class="form-control" name="keyword">
					</div>
					<button type="submit" class="searchBtn btn btn-secondary">검색</button>
				</form>
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
					<tr>
						<td>5</td>
						<td>마지막 공지사항제목 <img src="resources/images/paper-clip.png">
						</td>
						<td>admin</td>
						<td>2020-02-10</td>
						<td>10</td>
					</tr>
					<tr>
						<td>4</td>
						<td>네번째 공지사항제목</td>
						<td>admin</td>
						<td>2020-02-07</td>
						<td>10</td>
					</tr>
					<tr>
						<td>3</td>
						<td>세번째 공지사항제목</td>
						<td>admin</td>
						<td>2020-02-03</td>
						<td>10</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두번째 공지사항제목</td>
						<td>admin</td>
						<td>2020-02-01</td>
						<td>100</td>
					</tr>
					<tr>
						<td>1</td>
						<td>첫번째 공지사항 제목</td>
						<td>admin</td>
						<td>2019-12-25</td>
						<td>45</td>
					</tr>
				</tbody>
			</table>
			<br>
			<br>
			<!-- 권한자만 볼 수 있게 -->
			<a class="btn btn-secondary" style="float: right"
				href="noticeEnrollForm.bo">글쓰기</a>&nbsp;&nbsp; <br>
			<br>
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

			<br clear="both">
			<br>

		</div>

	</div>
</body>
</html>