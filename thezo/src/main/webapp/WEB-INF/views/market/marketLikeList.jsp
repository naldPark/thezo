<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 
    #pagingArea{width:fit-content;margin:auto;}
    .list-area{
        width:780px;
        margin:auto;
    }
    .thumbnail{
        border:1px solid lightgray;
        width:220px;
        display:inline-block;
        margin:14px;
    }
    .thumbnail:hover{
        cursor:pointer;
        opacity:0.7;
    }
    .innerOuter{
        margin:auto;
        padding:5% 5%;
        background:white;
    }

</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>
	<c:if test="${loginUser.userId eq 'admin' }">
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
				<b>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<img src="resources/images/heart.png" width="20" height="20">
                    <a href="" align="left" style="text-decoration:none;">찜 목록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</b>
			</h2>

			<br><br><br>
				
			<div class="list-area">
				<c:forEach var="m" items="${ list }">
					<div class="thumbnail" align="center">
						<input type="hidden" value="${ m.marketNo }">
						<br>
						<img src="${ m.productImg }" width="200" height="180">
						<br><br>
						<p>
							<b>${ m.marketTitle }</b><br>
							${ m.price } 원<br>
							<label style="color: #0091FF;">${ m.marketSection }</label><br>
						</p>
						<p align="left">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							${ m.marketWriter }<br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							${ m.marketDate }
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<img src="resources/images/countView.png" width="20" height="20">
							${ m.count }
						</p>
					</div>                
				</c:forEach>
				<br>
			</div>
			
			<script>
				$(function(){
					$(".thumbnail").click(function(){
						location.href="marketDetail.bo?mkno=" + $(this).children().eq(0).val();
					})
				})
			</script>
			
			
			<br><br>
					
			<div id="pagingArea">
				<ul class="pagination">
					<c:choose>
							<c:when test="${ pi.currentPage eq 1 }">
								<li class="page-item disabled"><a class="page-link">Previous</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="likeList.mk?currentPage=${ pi.currentPage-1 }">Previous</a></li>
							</c:otherwise>
							
					</c:choose>
						
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<li class="page-item"><a class="page-link" href="likeList.mk?currentPage=${ p }">${ p }</a></li>
					</c:forEach>
						
					<c:choose>
						<c:when test="${ pi.currentPage eq pi.maxPage }">
							<li class="page-item disabled"><a class="page-link">Next</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="likeList.mk?currentPage=${ pi.currentPage+1 }">Next</a></li>
						</c:otherwise>    
					</c:choose>        
				</ul>
			</div>
			
			<br clear="both"><br><br>

            <div  align="center"> 
				<br>
                <a class="btn btn-secondary" href="marketList.bo">목록</a>
				<a class="btn btn-secondary"  href="marketEnrollForm.bo">글쓰기</a>&nbsp;&nbsp;
			</div>

		</div>

    </div>
  	</section>
	
</body>
</html>
   
	