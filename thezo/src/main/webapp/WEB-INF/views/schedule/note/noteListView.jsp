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
	.w3-container>div{margin:25px; width: 40%; display: inline-block;}
	.button-area{margin-left: 100px;}
	.w3-container>div:hover{cursor:pointer;}
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
						<div class="w3-panel w3-card w3-yellow w3-hover-shadow w3-padding-32 text-left" id="note">
							<input type="hidden" value="노트번호(조회용)">
							<p><b>노트제목은 진하게</b></p>
							<hr>
							<p>노트 내용이 들어갈 자리 !!! 두줄 이상 넘어가면 ...더보기(?)</p>
							<p>최근 수정일 : 21-07-25</p>
							<!-- 관련일정 없을 시 보여지지 않게 -->
							<p><a href="관련일정갈수있는url">관련일정 : 관련일정제목넣기</a></p>
						</div>
						<div class="w3-panel w3-card w3-yellow w3-hover-shadow w3-padding-32 text-left" id="note">
							<p><b>노트제목은 진하게</b></p>
							<hr>
							<p>노트 내용이 들어갈 자리 !!! 두줄 이상 넘어가면 ...더보기(?)</p>
							<p>최근 수정일 : 21-07-25</p>
							<p><a href="관련일정갈수있는url">관련일정 : 관련일정제목넣기</a></p>
						</div>
						<div class="w3-panel w3-card w3-yellow w3-hover-shadow w3-padding-32 text-left" id="note">
							<p><b>노트제목은 진하게</b></p>
							<hr>
							<p>노트 내용이 들어갈 자리 !!! 두줄 이상 넘어가면 ...더보기(?)</p>
							<p>최근 수정일 : 21-07-25</p>
							<p><a href="관련일정갈수있는url">관련일정 : 관련일정제목넣기</a></p>
						</div>
						<div class="w3-panel w3-card w3-yellow w3-hover-shadow w3-padding-32 text-left" id="note">
							<p><b>노트제목은 진하게</b></p>
							<hr>
							<p>노트 내용이 들어갈 자리 !!! 두줄 이상 넘어가면 ...더보기(?)</p>
							<p>최근 수정일 : 21-07-25</p>
							<p><a href="관련일정갈수있는url">관련일정 : 관련일정제목넣기</a></p>
						</div>
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
					<div class="paging-area">
						<ul class="pagination justify-content-center">
							<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
							<li class="page-item active"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">Next</a></li>
						</ul>
					</div>

					<%-- 검색바 ------%>
					<div class="search-area">
						<form class="form-inline justify-content-center" action="search.doc">
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