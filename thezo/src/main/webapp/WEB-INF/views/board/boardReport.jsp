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

	<div class="outer">

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
								<option value="writer">대기</option>
								<option value="title">반려</option>
								<option value="content">완료</option>
							</select>
						</div>
					</form>
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
					<tr data-toggle="collapse" data-target="#detail">
						<td scope="row"><input type="checkbox" name="check"></td>
						<td class="c">5</td>
						<td class="c">사내게시판</td>
						<td class="c">게시글</td>
						<td class="c">욕설/비방</td>
						<td class="c">user03</td>
						<td class="c">2020-08-10</td>
						<td class="c">대기</td>
					</tr>
					<tr data-toggle="collapse" data-target="#detail">
						<td scope="row"><input type="checkbox" name="check"></td>
						<td>4</td>
						<td>벼룩시장</td>
						<td>댓글</td>
						<td>욕설/비방</td>
						<td>user03</td>
						<td>2020-08-10</td>
						<td>대기</td>
					</tr>
					<tr data-toggle="collapse" data-target="#detail">
						<td scope="row"><input type="checkbox" name="check"></td>
						<td>3</td>
						<td>사내게시판</td>
						<td>게시글</td>
						<td>욕설/비방</td>
						<td>user03</td>
						<td>2020-08-10</td>
						<td>완료</td>
					</tr>
					<tr data-toggle="collapse" data-target="#detail">
						<td scope="row"><input type="checkbox" name="check"></td>
						<td>2</td>
						<td>사내게시판</td>
						<td>게시글</td>
						<td>욕설/비방</td>
						<td>user03</td>
						<td>2020-08-10</td>
						<td>반려</td>
					</tr>
					<tr data-toggle="collapse" data-target="#detail">
						<td scope="row"><input type="checkbox" name="check"></td>
						<td>1</td>
						<td>사내게시판</td>
						<td>게시글</td>
						<td>욕설/비방</td>
						<td>user03</td>
						<td>2020-08-10</td>
						<td>완료</td>
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
</body>
</html>