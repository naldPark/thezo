<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- @author Jaewon.s -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="Jaewon.s">
<title>Insert title here</title>
<style>
	.outer{height: 615px; padding-top: 35px; display: flex; justify-content: space-between;}
	.left-section{width: 175px;}
	.main-section{width: 975px;
		/* border: 1px solid black; */
	}

	.main-section>h2{
		margin-bottom: 17px;
	}

	#unhandeled-count{
		color: orange;
		font-size: 18px;
	}

	#unhandeled-msgarea>p, #handeled-msgarea>p{
		margin-bottom: 0px;
	}

	#unhandeled-msgarea>table, #handeled-msgarea>table{
		border-top: 10px solid rgb(44, 62, 80);
		border-bottom: 1px solid lightgray;
		text-align: center;
		width: 950px;
		margin-bottom: 10px;
	}

	#unhandeled-msgarea thead, #handeled-msgarea thead{
		height: 38px;
		background-color: rgb(234,234,234);
		line-height: 24px;
	}

	#unhandeled-msgarea tbody tr, #handeled-msgarea tbody tr {
		height: 34px;
		font-size: 14px;
		border-bottom: 0.5px solid rgb(204,204,204);
	}

	#unhandeled-msgarea thead>tr>th{
		width: 16.6%;
		font-size: 15px;
	}

	#handeled-msgarea thead>tr>th{
		width: 14.28%;
		font-size: 15px;
	}

	#unhandeled-msgarea tbody>tr>td, #handeled-msgarea tbody>tr>td{
		padding: 0px;
		border: none;
		vertical-align: middle;
	}
	.report-btn{
		transform: translateX(5px);
		background-color: rgb(155,89,182);
		color: white;
		border: none;
		border-radius: 3px;
		font-size: 12px;
		width: 100px;
		height: 28px;
	}

	.pagination{
		margin-bottom: 10px;
		justify-content: center;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<script>
		document.getElementById("admin-header").style.display ="block"; 
        document.getElementById("admin-mode").style.color = "red";
	</script>

	<section>
		<div class="outer" style="width: 1170px;">
			<div class="left-section">
				<jsp:include page="../common/adminMessangerVerticalNav.jsp"/>
			</div>
			<div class="main-section">
				<h2><b>&nbsp;쪽지 신고처리</b></h2>
				
				<div id="unhandeled-msgarea">
					<p>&nbsp;&nbsp;<b>※ 미해결 신고</b>&nbsp;&nbsp;<span id="unhandeled-count">6</span></p>
					<table class="table table-sm">
						<thead>
							<tr>
								<th>신고번호</th>
								<th>신고유형</th>
								<th>신고대상</th>
								<th>신고일자</th>
								<th>신고인</th>
								<th>신고 처리하기</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>20</td>
								<td>19</td>
								<td>땡땡땡 개발자</td>
								<td>21-07-29</td>
								<td>땡땡땡 사원</td>
								<td>
									<button class="report-btn" type="button" onclick="">신고 처리하기</button>
								</td>
							</tr>
							<tr>
								<td>20</td>
								<td>19</td>
								<td>땡땡땡 개발자</td>
								<td>21-07-29</td>
								<td>땡땡땡 사원</td>
								<td>
									<button class="report-btn" type="button" onclick="">신고 처리하기</button>
								</td>
							</tr>
							<tr>
								<td>20</td>
								<td>19</td>
								<td>땡땡땡 개발자</td>
								<td>21-07-29</td>
								<td>땡땡땡 사원</td>
								<td>
									<button class="report-btn" type="button" onclick="">신고 처리하기</button>
								</td>
							</tr>
							<tr>

							</tr>
						</tbody>
					</table>	
					
					<ul class="pagination">
						<li class="page-item disabled"><a class="page-link" href="#">&lt</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">&gt</a></li>
					</ul>
					
					
				</div>

				<div id="handeled-msgarea">
					<p>&nbsp;&nbsp;<b>※ 해결 신고내역</b></p>	
					<table class="table table-sm">
						<thead>
							<tr>
								<th>신고번호</th>
								<th>신고유형</th>
								<th>신고대상</th>
								<th>신고일자</th>
								<th>신고인</th>
								<th>신고처리상태</th>
								<th>신고처리날자</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>12</td>
								<td>스팸</td>
								<td>땡땡땡 팀장</td>
								<td>21-07-29</td>
								<td>떙땡땡 사원</td>
								<td>반려</td>
								<td>21-08-01</td>
							</tr>
							<tr>
								<td>11</td>
								<td>욕설</td>
								<td>땡땡땡 팀장</td>
								<td>21-07-29</td>
								<td>떙땡땡 사원</td>
								<td>기능제한</td>
								<td>21-08-01</td>
							</tr>
							<tr>
								<td>10</td>
								<td>스팸</td>
								<td>땡땡땡 팀장</td>
								<td>21-07-29</td>
								<td>떙땡땡 사원</td>
								<td>감봉</td>
								<td>21-08-01</td>
							</tr>
							<tr>
								<td>9</td>
								<td>스팸</td>
								<td>땡땡땡 팀장</td>
								<td>21-07-29</td>
								<td>떙땡땡 사원</td>
								<td>반려</td>
								<td>21-08-01</td>
							</tr>
						</tbody>
					</table>

					<ul class="pagination">
						<li class="page-item disabled"><a class="page-link" href="#">&lt</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">&gt</a></li>
					</ul>

				</div>
			</div>
			
		</div>
	</section>
</body>
</html>