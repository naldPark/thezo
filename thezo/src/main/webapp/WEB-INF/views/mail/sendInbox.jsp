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
          <p class="pageTitle"> e-mail <b> 전자메일</b></p>
          <jsp:include page="mailSidebar.jsp" />
      
          <div class="mailOuter">
            <div align="left">
              <button type="button" id="sendDeleteBtn" class="mainBtn btn btn-sm btn-secondary">삭제</button>
            </div>
            <br>
            <form action="mainBtn.mail" method="post" id="mainBtnForm">
              <table class="table w3-centered table-hover">
                <thead>
                  <input type="hidden" id="btnType" name="btnType" value="">
                  <tr class="table-primary">
                    <th><input type="checkbox" class="bigCheckbox" id="allCheck"></th>
                    <th>발신자</th>
                    <th style="width:500px">제목</th>
                    <th>일시</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="m" items="${ list }">
                    <tr>
                      <td hidden>${m.seMailNo}</td>
                      <th><input type="checkbox" class="bigCheckbox" name="reMailNo" value="${m.reMailNo}"></th>
                      <td>${m.sender}</td>
                      <!--발신자가 외부면 메일, 내부면 이름?-->
                      <td>
                        ${m.mailTitle}
                        <c:if test="${!empty m.attach}">
                          &nbsp;<i class="fas fa-paperclip"></i>
                        </c:if>
                      </td>
                      <td>${m.sendDate}</td>
                    </tr>
                    <!--첨부파일 여부-->
                  </c:forEach>
      
                </tbody>
              </table>
            </form>
      
            <br><br>
      
            <!--페이징 처리 시작-->
            <div id="pagingArea">
              <ul class="pagination">
                <c:if test="${ pi.currentPage ne 1 }">
                  <li class="page-item"><a class="page-link"
                      href="sendInbox.mail?currentPage=${ pi.currentPage-1 }">이전</a></li>
                </c:if>
      
                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                  <c:choose>
                    <c:when test="${ pi.currentPage eq p }">
                      <li class="page-item"><a class="page-link" style="background-color: lightsteelblue"
                          href="sendInbox.mail?currentPage=${ p }">${ p }</a></li>
                    </c:when>
                    <c:otherwise>
                      <li class="page-item"><a class="page-link"
                          href="sendInbox.mail?currentPage=${ p }">${ p }</a></li>
                    </c:otherwise>
                  </c:choose>
                </c:forEach>
      
                <c:if test="${ pi.currentPage ne pi.maxPage }">
                  <li class="page-item"><a class="page-link"
                      href="sendInbox.mail?currentPage=${ pi.currentPage+1 }">다음</a></li>
                </c:if>
      
      
              </ul>
            </div>
            <!--페이징 처리 끝-->
          </div>
        </div>

           

      </section>

  <script>
    	$(function () {
          $(".table>tbody>tr>td").click(function () {
            var mno = $(this).parent().children().eq(0).text();
            location.href = 'sendDetail.mail?mno=' + mno;
          })
        })

      //체크박스 모두동의
      $(function(){
              $("#allCheck").change(function(){
                  if($(this).prop("checked")==true){
                      $(".bigCheckbox").prop("checked",true); 
                  }else{
                      $(".bigCheckbox").prop("checked",false); 
                  }
              })                    
        })    

        $(".mainBtn").click(function () {
            var message = $(this).text();
            if (confirm(message+" 하시겠습니까?")) {
              $("#btnType").val($(this).attr("id"));
              $("#mainBtnForm").submit();
            }
          })
        
  
  </script>
 	
</body>
</html>