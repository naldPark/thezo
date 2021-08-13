<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Zo</title>
<style>
   .tableBreakWord{display:inline-block; white-space: nowrap;word-break: break-all;overflow: hidden; text-overflow: ellipsis;}

</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
      <section>
        <div class="outer" align="center">
          <p class="pageTitle"> e-mail <b> 전자메일</b></p>
          <jsp:include page="mailSidebar.jsp" />
      
          <div class="mailOuter">
            <c:choose>
              <c:when test="${empty list}">
                <div style="font-size:30pt; color: darkgray">
                  <br>
                  <img src="resources/images/empty.png" style="width:30%"><br>
                  <span>메..메일이 없어요</span>
                </div>
              </c:when>
              <c:otherwise>
                <div align="left">
                  <button type="button" id="readBtn" class="mainBtn btn btn-sm btn-secondary">읽음처리</button>
                  <c:choose>
                    <c:when test="${ folder eq '스팸' }">
                      <button type="button" id="unSpamBtn" class="mainBtn btn btn-sm btn-secondary">스팸해제</button>
                    </c:when>
                    <c:otherwise>
                      <button type="button" id="spamBtn" class="mainBtn btn btn-sm btn-secondary">스팸처리</button>
                    </c:otherwise>
                  </c:choose>
                  <c:choose>
                    <c:when test="${ folder eq '휴지' }">
                      <button type="button" id="deleteAllBtn" class="mainBtn btn btn-sm btn-secondary">완전삭제</button>
                    </c:when>
                    <c:otherwise>
                      <button type="button" id="deleteBtn" class="mainBtn btn btn-sm btn-secondary">삭제</button>
                    </c:otherwise>
                  </c:choose>
                  
                </div>
                <br>
                <form action="mainBtn.mail" method="post" id="mainBtnForm">
                  <table class="table w3-centered table-hover">
                    <thead>
                      <input type="hidden" id="btnType" name="btnType" value="">
                      <tr class="table-primary">
                        <th><input type="checkbox" class="bigCheckbox" id="allCheck"></th>
                        <th style="width:70px">읽음</th>
                        <th style="width:70px">발신자</th>
                        <th style="width:500px">제목</th>
                        <th style="width:100px">일시</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach var="m" items="${ list }">
                        <tr <c:if test="${m.read eq 'N'}">class="font-weight-bold"</c:if>>
                          <td hidden>${m.reMailNo}</td>
                          <th><input type="checkbox" class="bigCheckbox" name="mailNo" value="${m.reMailNo}"></th>
                          <td>
                            <c:choose>
                              <c:when test="${m.read eq 'N'}">
                                <i class="far fa-envelope"></i>
                              </c:when>
                              <c:otherwise>
                                <i class="far fa-envelope-open"></i>
                              </c:otherwise>
                            </c:choose>
                          </td>
                          <td>${m.sender}</td>
                          <!--발신자가 외부면 메일, 내부면 이름?-->
                          <td>
                            ${m.mailTitle}
                            <c:if test="${!empty m.attach}">
                              &nbsp;<i class="fas fa-paperclip"></i>
                            </c:if>
                          </td>
                          <td>${m.receiveDate}</td>
                        </tr>
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
                          href="main.mail?currentPage=${ pi.currentPage-1 }&folder=${folder}">이전</a></li>
                    </c:if>
          
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                      <c:choose>
                        <c:when test="${ pi.currentPage eq p }">
                          <li class="page-item"><a class="page-link" style="background-color: lightsteelblue"
                              href="main.mail?currentPage=${ p }&folder=${folder}">${ p }</a></li>
                        </c:when>
                        <c:otherwise>
                          <li class="page-item"><a class="page-link"
                              href="main.mail?currentPage=${ p }&folder=${folder}">${ p }</a></li>
                        </c:otherwise>
                      </c:choose>
                    </c:forEach>
          
                    <c:if test="${ pi.currentPage ne pi.maxPage and pi.maxPage ne '0'}">
                        <li class="page-item"><a class="page-link"
                          href="main.mail?currentPage=${ pi.currentPage+1 }&folder=${folder}">다음</a></li>
                    </c:if>
                  </ul>
                </div>
                <!--페이징 처리 끝-->
              </c:otherwise>
            </c:choose>
          </div>
        </div>

           

      </section>

  <script>
    	$(function () {
          $(".table>tbody>tr>td").click(function () {
            var mno = $(this).parent().children().eq(0).text();
            location.href = 'mailDetail.mail?mno=' + mno;
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