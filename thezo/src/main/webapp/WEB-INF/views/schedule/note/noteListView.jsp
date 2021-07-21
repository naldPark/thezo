<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>노트관리</title>
<style>
	#nav{
		width: 200px;
		height: 800px; 
		margin: 0;
		float: left;
		background-color:rgb(236, 236, 236);
		box-sizing: border-box;
	}
	#nav button{
        margin: 10px;
    }

    #nav a{
        margin: 20px;
        color: black;
    }

	#nav li{
		list-style-type: none;
	}
	
	#list-area{
	    width: 600px;
	    height: 800px;
	    margin-left: 50px;
	    float:right;
	    
	}
	
	#list-area>div{
	    width: 200px;
	    height: 300px;
	    margin: 50px;
	    background: url('${pageContext.request.contextPath}/resources/images/note.png');
	    background-size: 200px 300px;
	    background-position: center;
	    float: left;
	    position:relative;
	}
	
	#list-area>div>div{
	    position:absolute;
	}
</style>
</head>
<body>
    <!-- 
        수정해야할거.. 

        2. 노트리스트 가운데에 오게 하기
        
        3. hover속성,, 귀찬타 담에담에..

    -->

    <!-- 메뉴바 -->
    <jsp:include page="../../common/header.jsp"/>

    <br><br>
    <section>
	    <div class="outer">
	        <!-- 노트관리 네비바 -->
            <div id="nav">
                <b style="margin-left: 30px; font-size: 25px;">노트관리</b> 
				<button class="btn btn-sm btn-primary" style="margin-left: 15px;">뒤로</button>

                <button class="btn btn-primary" style="width:180px;" align="center" data-toggle="modal" data-target="#scAdd">노트 추가</button>


                <button class="btn" function="click();">▼</button><b>오늘 일정</b>
                <ul id="todaySchedule">
					
					<!-- 오늘일정 수만큼 li태그가 반복되는 반복문 -->
					<li><input type="checkbox">Conference</li>
					<li><input type="checkbox">Meeting</li>
					<li><input type="checkbox">Lunch</li>

				</ul>

                <hr>

                <button class="btn" function="click();">▼</button> <b>메뉴 바로가기</b>	
				<label for="">
					<a href="list.nt" id="note-list">노트 목록</a>
				</label>
				<br>
				<label for="">
					<a href="" id="note-list">업무 보고</a>
				</label>
				<br>
				<label for="">
					<a href="myList.rez" id="note-list">자원 예약</a>
				</label>

				<hr>
            </div>
            <!-------------------------------네비바 끝-->

	
	
			<div id="list-area" style="margin-right: 300px">
				<div id="note1" style="display: block;">
					<input type="checkbox">
					<p style="margin: 5px; font-size: 11px;">
									노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용
									노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용
									노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용
					</p>
					
					<!-- hover시 노트 정보가 뜨도록-->
					
				</div>
				<div id="noteInfo" style="margin-top:250px; height:100px; background: lightgray; opacity: 50%; display: none;">
					<p>
									제목 : 노트제목 <br>
									최종 작성일 : 21-07-12 <br>
									관련일정 : 또르르 <br> <!-- 클릭 시 관련일정 뜨게?.. -->
						<a href="">관련일정 바로가기</a>
					</p>
				</div>
				<div id="note2">
					<input type="checkbox">
					<p style="margin: 5px; font-size: 11px;">
									노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용
									노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용
									노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용
					</p>
					
					<!-- hover시 노트 정보가 뜨도록-->
				</div>
				<div id="note3">
					<input type="checkbox">
					<p style="margin: 5px; font-size: 11px;">
									노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용
									노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용
									노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용
					</p>
					
					<!-- hover시 노트 정보가 뜨도록-->
				</div>
				<div id="note4">
					<input type="checkbox">
					<p style="margin: 5px; font-size: 11px;">
									노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용
									노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용
									노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용노트내용
					</p>
					
					<!-- hover시 노트 정보가 뜨도록-->
				</div>
			</div>
	
	
			<div class="button-area" style="margin-left: 300px; margin-top: 50px;">
				<button class="btn btn-primary">수정</button>
				<button class="btn btn-danger">삭제</button>
			</div>
			
			<div id="paging-area" align="center">
				<ul class="pagination justify-content-center">
					<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
					<li class="page-item active"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</div>
			
	    </div>
	</section>
</body>
</html>