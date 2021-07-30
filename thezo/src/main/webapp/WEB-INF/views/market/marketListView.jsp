<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #searchForm{
        width:40%;
    }
    #searchForm>*{
         float:left;
        margin:5px;
    }
    .select{width:20%;}
    .text{width:53%;}
    .searchBtn{Width:20%;}
    #pagingArea{width:fit-content;margin:auto;}
    .list-area{
        width:760px;
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
        width: 1000px;
        margin:auto;
        padding:5% 5%;
        background:white;
    }

</style>
</head>
<body>
	
	<!--  .innerOuter 넣어서 크기 조절하기  -->
	<!-- 찜하기, 판매내역 수정하기 -->
	<jsp:include page="../common/header.jsp"/>
	<section>
	
    <div class="outer">
        <br>
        <h1><b>더조마켓</b></h1>
        <br>

        <div id="search-area" align="center">
        	<!-- 여기 부분 수정 (디자인적으로 별로...)   -->
            <a href="">찜하기</a>
            <a href="">판매내역</a>
            <form id="searchForm" action="marketSearch.bo" method="Get">
                <div class="select">
                    <select class="custom-select" name="condition">
                        <option value="title">품명</option>
                        <option value="writer">작성자</option>
                    </select>
                </div>
                <div class="text">
                    <input type="text" class="form-control" name="keyword">
                </div>
                <button type="submit" class="searchBtn btn btn-secondary">검색</button>
            </form>
            
            <script>
	        	$(function(){
	            	if("${condition}" != ""){
	            		$("option[value=${condition}]").attr("selected", true);
	            	}
	            })
	        </script>
        </div>

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
	                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ m.marketWriter }<br>
	                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ m.marketDate }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
        
        
        <div  align="center"> 
            <br>
            <a class="btn btn-secondary"  href="marketEnrollForm.bo">글쓰기</a>&nbsp;&nbsp;
        </div>
        <br><br>
        		
			<div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
	                		<c:when test="${ pi.currentPage eq 1 }">
		                   		<li class="page-item disabled"><a class="page-link">Previous</a></li>
		                    </c:when>
		                    <c:otherwise>
		                    	<c:choose>
		                    		<c:when test="${ empty condition }">
		                    			<li class="page-item"><a class="page-link" href="marketList.bo?currentPage=${ pi.currentPage-1 }">Previous</a></li>
		                    		</c:when>
		                    		<c:otherwise>
		                    			<li class="page-item"><a class="page-link" href="marketSearch.bo?currentPage=${ pi.currentPage-1 }&condition=${condition}&keyword=${keyword}">Previous</a></li>
		                    		</c:otherwise>
		                    	</c:choose>		
	                    	</c:otherwise>
	                    
                    </c:choose>
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<c:choose>
                    		<c:when test="${ empty condition }">
                    			<li class="page-item"><a class="page-link" href="marketList.bo?currentPage=${ p }">${ p }</a></li>
                    		</c:when>
                    		<c:otherwise>
                    			<li class="page-item"><a class="page-link" href="marketSearch.bo?currentPage=${ p }&condition=${condition}&keyword=${keyword}">${ p }</a></li>
                    		</c:otherwise>
                    	</c:choose>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
		                    <li class="page-item disabled"><a class="page-link">Next</a></li>
		                </c:when>
		                <c:otherwise>
		                    <c:choose>
		                   		<c:when test="${ empty condition }">
		                    		<li class="page-item"><a class="page-link" href="marketList.bo?currentPage=${ pi.currentPage+1 }">Next</a></li>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<li class="page-item"><a class="page-link" href="marketSearch.bo?currentPage=${ pi.currentPage+1 }&condition=${condition}&keyword=${keyword}">Next</a></li>
		                    	</c:otherwise>
		                    </c:choose>		
		                </c:otherwise>    
		            </c:choose>        
                </ul>
            </div>
           
            <br clear="both"><br>

    </div>
  	</section>
	
</body>
</html>