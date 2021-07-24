<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>노트관리</title>
<style>
	div{box-sizing: border-box;}
	.list-area{width: 900px; height:700px; float:left;}
	.note-area{width: 100%; height:700px; margin-left:100px; background-color: rgb(236, 236, 236); border-radius: 15px;}
	.note-area>div{	}
	.button-area{margin-left: 100px;}
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
				<div class="note-area">
					

					

				</div>

				<br>
				<div class="button-area" align="left">
					<a href="#" data-toggle="modal" data-target="#updateNt" class="btn btn-primary">수정</a>
					<a href="#" data-toggle="modal" data-target="#deleteNt" class="btn btn-danger">삭제</a>
				</div>
				
				
				<div class="paging-area">
					<ul class="pagination justify-content-center">
						<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
						<li class="page-item active"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">Next</a></li>
					</ul>
				</div>
			</div>		
	    </div>
	</section>
</body>
</html>