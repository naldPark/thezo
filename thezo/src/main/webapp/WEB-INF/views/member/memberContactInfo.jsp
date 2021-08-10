<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .innerOuter{
      width: 1000px;
      margin:auto;
      padding:5% 5%;
      background:white;
    }
	#content1, #content2{
        float:left;
    }
    #content1{
        width:25%;
        border: 1px solid lightgray;
    }
    #content2{
        width:75%;
    }
    #group{
        border: 1px solid lightgray;
        width: 100%;
        height: 500px;
        margin:auto;
        padding:5% 5%;
        background:white;
    }
    ul{
        list-style:none;
    }
</style>
</head>
<body>


	<!-- view 수정중 -->
	<jsp:include page="../common/header.jsp"/>
	
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
		
				<h2><b>조직도</b></h2>
            
					<div id="content1">
						<div id="group">
							<div id="nav">
								<br>
								<img src="" alt=""><h5>kh그룹</h5>
								<ul class="menu">
									<li>대표이사</li>
									<li><a href="#">경영지원본부</a>
										<ul class="sub">
										<li><a href="#">인사팀</a></li>
										<li><a href="#">총무팀</a></li>
										<li><a href="#">회계팀</a></li>
										</ul>
									</li>
									<li><a href="#">개발본부</a>
										<ul class="sub">
										<li><a href="#">개발1팀</a></li>
										<li><a href="#">개발2팀</a></li>
										<li><a href="#">인프라팀</a></li>
										</ul>
									</li>
									<li><a href="#">운영본부</a>
										<ul class="sub">
										<li><a href="#">운영팀</a></li>
										<li><a href="#">영업팀</a></li>
										<li><a href="#">구매팀</a></li>
										</ul>
									</li>
								</ul>
							</div>
							

						<script>
							$(document).ready(function(){
								$("#nav ul.sub").hide();
								$("#nav ul.menu li").click(function(){
									$("ul",this).slideToggle("fast");
								});
							});
						</script>       
						</div>
					</div>

					<div id="content2">

					</div>


			</div>
		
		</div>
	
	
	
	
	</section>
	

</body>
</html>