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
            <h2><b>공지사항</b></h2>
            <br>
    
            <a  style="float:right" href="">삭제</a>
                <br><br>
                <table id="contentArea" align="center" class="table">
                    <tr>
                        <th style="font-size:20px;">
                           	 ${ b.boardTitle }
                        </th>
                    </tr>
                    <tr align="left" style="font-size:13px;">
                        <td>
			                            작성자&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;${ b.boardWriter }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                            작성일&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;${ b.boardDate }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                            조회수&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;${ b.count }
                        </td>
                    </tr>
                    <tr>
                        <td >
                            <p style="height:400px; font-size:17px;" >
                               	${ b.boardContent }
                            </p>
                        </td>
                    </tr>
                    <tr>
                    	<c:choose>
                    		<c:when test="${ empty bf.originName }">
                    			<td>
                    				첨부파일이 없습니다.
                    			</td>
                    		</c:when>
                    		<c:otherwise>
                    			<td>
                    				첨부파일&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;<a href="${ bf.changeName }" download="${ bf.originName }">${ bf.originName }</a>
                    			</td>
                    		</c:otherwise>	
                    	</c:choose>
                    </tr>
                </table>
                <br>
    
                <div align="center">
                    <!-- 수정하기, 삭제하기 버튼은 이글이 본인글일 경우만 보여져야됨 -->
                    <a class="btn btn-secondary" href="">목록</a>
                    <a class="btn btn-secondary" href="">수정</a>
                </div><br><br>
    
    
           
        </div>
  

    </div>
  
  	</section>


</body>
</html>