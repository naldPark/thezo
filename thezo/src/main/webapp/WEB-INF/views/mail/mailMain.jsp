<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Zo</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
   	 <section>
        <div class="outer" align="center">    
            <jsp:include page="mailSidebar.jsp"/>
            <br> 
            <div class="mailOuter">
                <div align="left">
                    <button type="button"  class="btn btn-sm btn-secondary">읽음</button>
                    <button type="button" class="btn btn-sm btn-secondary">삭제</button>
                    <button type="button" class="btn btn-sm btn-secondary">스팸</button>
                    <button type="button" class="btn btn-sm btn-secondary">전달</button>
                </div>
                <br><br>
                <table class="table table-sm w3-centered table-hover">
                    <thead>
                      <tr class="table-primary">
                        <th><input type="checkbox" class="bigCheckbox"></th>
                        <th>읽음</th>
                        <th>발신자</th>
                        <th>제목</th>
                        
                        <th>일시</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr class="font-weight-bold">
                        <td><input type="checkbox" class="bigCheckbox"></td>
                        <td><i class="far fa-envelope"></i></td>
                        <td>박날드</td>
                        <td>주간회의자료 빨리 보내주세요</td>
                        <td>2021-07-20 22:50</td>
                      </tr>
                      <tr>
                        <td><input type="checkbox" class="bigCheckbox"></td>
                        <td><i class="far fa-envelope-open"></i></td>
                        <td>강보람</td>
                        <td>마감기한 20일 남았는데 잠이 옵니까</td>
                        <td>2021-07-20 22:50</td>
                      </tr>
                      <tr>
                        <td><input type="checkbox" class="bigCheckbox"></td>
                        <td><i class="far fa-envelope"></i></td>
                        <td>남주혁</td>
                        <td>Re:요청하신 자료 송부드립니다<i class="fas fa-paperclip"></i></td>
                        <td>2021-07-20 22:50</td>
                      </tr>
                    </tbody>
                  </table>
                
                <ul class="pagination justify-content-center">
                    <li class="page-item"><a class="page-link" href="#">이전</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item active"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">다음</a></li>
                  </ul>
            </div>
    	</div>
    </section>

  
 	
</body>
</html>