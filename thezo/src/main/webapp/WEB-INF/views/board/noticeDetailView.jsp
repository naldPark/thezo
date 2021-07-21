<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	   <div class="outer">
        <br>
        <h1><b>공지사항</b></h1>
        <br>

        <a  style="float:right" href="">삭제</a>
            <br><br>
            <table id="contentArea" align="center" class="table">
                <tr>
                    <th style="font-size:30px;">
                        공지사항입니다.
                    </th>
                </tr>
                <tr align="left" style="font-size:13px;">
                    <td>
                        작성자&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;user01&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        작성일&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;2021-08-01&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        조회수&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;10
                    </td>
                </tr>
                <tr>
                    <td >
                        <p style="height:400px; font-size:17px;" >
                            <!--만약 이미지 파일이 있을 때 첨부파일이 보이도록 (수정될수도..?)-->
                            <img src="" width="200" height="200"><br>
                           		 공지사항입니다. 
                        </p>
                    </td>
                </tr>
                <tr>
                    <!-- 위 방법처럼할지 고민해보기-->
                    <td>첨부파일&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;<a href="" download="">파일명.jpg</a></td>
                </tr>
            </table>
            <br>

            <div align="center">
                <!-- 수정하기, 삭제하기 버튼은 이글이 본인글일 경우만 보여져야됨 -->
                <a class="btn btn-secondary" href="">목록</a>
                <a class="btn btn-secondary" href="">수정</a>
            </div><br><br>


    </div>
  


</body>
</html>