<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Zo</title>
<style>
     .tableBreakWord{display:inline-block;  white-space: nowrap;word-break: break-all;overflow: hidden; text-overflow: ellipsis;}
   .empAddZone {
        margin-left: 80px;
        width: 100%;
        text-align: left!important;
        font-size: 15pt;
      }
      .table td, .table th, .table tr {border-top:unset!important}

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
                  <button type="button" id="sendDeleteBtn" class="mainBtn btn btn-sm btn-secondary">완전삭제</button>
                </div>
                <br>
                <form action="mainBtn.mail" method="post" id="mainBtnForm">
                                    <table class="table w3-centered w3-bordered table-hover">
                    <thead>
                      <input type="hidden" id="btnType" name="btnType" value="">
                      <tr class="table-primary">
                        <th style="width:30px;"><input type="checkbox" class="bigCheckbox" id="allCheck"></th>
                        <th style="width:60px">읽음</th>
                        <th style="width:180px">발신자</th>
                        <th style="width:500px">제목</th>
                        <th style="width:170px">일시</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach var="m" varStatus="vs"  items="${ list }">
                        <tr style="width:980" <c:if test="${m.read eq 'N'}">class="font-weight-bold"</c:if>>
                          <td hidden>${m.seMailNo}</td>
                          <th style="width:30px"><input type="checkbox" class="bigCheckbox" name="mailNo" value="${m.reMailNo}"></th>
                          <td style="width:60px">
                            <c:choose>
                              <c:when test="${m.read eq 'N'}">
                                <i class="far fa-envelope"></i>
                              </c:when>   
                              <c:otherwise>
                                <i class="far fa-envelope-open"></i>
                              </c:otherwise>
                            </c:choose>
                          </td>
                          <td style="width:180px;" class="sender"
                            data-placement="bottom" data-toggle="tooltip" title="${m.sender}" id="sender${vs.index+1}">
                            <div style="width:160px;" class="tableBreakWord">
                              ${m.sender}
                            </div>
                          </td>
                          <!--발신자가 외부면 메일, 내부면 이름-->
                          <td style="width:500px;">
                            <div  style="width:450px;" class="tableBreakWord">
                              ${m.mailTitle}
                              </div>
                            <c:if test="${!empty m.attach}">
                              &nbsp;<i class="fas fa-paperclip"></i>
                            </c:if>
                          </td style="width:170px">
                          <td>${m.sendDate}</td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </form>
                <br><br>
                <div id="empList" class="empAddZone" style="text-align: center; font-size: 15pt;"></div>
          
          
                <!--페이징 처리 시작-->
                <div id="pagingArea">
                  <ul class="pagination">
                    <c:if test="${ pi.currentPage ne 1 }">
                      <li class="page-item"><a class="page-link" href="sendInbox.mail?currentPage=${ pi.currentPage-1 }">이전</a>
                      </li>
                    </c:if>
          
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                      <c:choose>
                        <c:when test="${ pi.currentPage eq p }">
                          <li class="page-item"><a class="page-link" style="background-color: lightsteelblue"
                              href="sendInbox.mail?currentPage=${ p }">${ p }</a></li>
                        </c:when>
                        <c:otherwise>
                          <li class="page-item"><a class="page-link" href="sendInbox.mail?currentPage=${ p }">${ p }</a></li>
                        </c:otherwise>
                      </c:choose>
                    </c:forEach>
          
                    <c:if test="${ pi.currentPage ne pi.maxPage and pi.maxPage ne '0'}">
                      <li class="page-item"><a class="page-link" href="sendInbox.mail?currentPage=${ pi.currentPage+1 }">다음</a>
                      </li>
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
        
  
    // 전사원 리스트 세팅
      $(function(){
        $(document).ready(function(){
          $('[data-toggle="tooltip"]').tooltip();

          // 이걸로 보여지는 화면의 SENDER를 어레이로 뽑았고
          var senderArray = [
          <c:forEach items="${list}" var="a">
                      "${a.sender}",
          </c:forEach>
            ];
          
          <c:forEach var="p" items="${ empList }" varStatus="status">
          for (var i = 0; i < senderArray.length; i++) {
            if('${p.email}' == senderArray[i]){
              $("#sender"+(i+1)).text("${p.department} / ${p.memName} ${p.rank}");
            }
          }
          </c:forEach>

        });
      })
  </script>
 	
</body>
</html>