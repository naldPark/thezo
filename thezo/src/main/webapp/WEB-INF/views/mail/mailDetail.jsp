<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Zo</title>
  <style>
    table a{ text-decoration:none !important; cursor: pointer; color: rgb(25, 99, 148)!important;}
    table a:hover{ text-decoration:underline !important; cursor: pointer; }
    table th{text-align: center;}
    table td{padding-left: 10px!important; }
    .mailInfo td{width: 800px !important; border-top:0;border-bottom: 0;border: 0px !important; border-top: 1px solid #dee2e6!important; }
   .expandEmpBtn{font-weight: normal!important; height:28px}
.receiver{line-height: 3 !important; margin-left: 5px;}
.refReceiver{line-height:3 !important; margin-left: 5px;}
   
    /* *{border:1px solid red} */
  </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    <section>
      <div class="outer">
     
        <p class="pageTitle"> e-mail <b> 전자메일</b></p>
        <jsp:include page="mailSidebar.jsp" />
        <div class="mailOuter">
          <div align="left">
            <c:if test="${mm.seMailNo eq 0}">
              <button type="button" id="replyBtn" class="enrollBtn btn btn-sm btn-secondary">답장</button>
            </c:if>
            <button type="button" id="forwardBtn" class="enrollBtn btn btn-sm btn-secondary">전달</button>
            <c:if test="${mm.seMailNo eq 0}">
            <button type="button" id="deleteBtn" class="mainBtn btn btn-sm btn-secondary">삭제</button>
            <button type="button" id="spamBtn" class="mainBtn btn btn-sm btn-secondary">스팸</button>
            </c:if>
          </div>
          <br>
    
          <table class="table table-bordered" style="word-break: break-all;">
            <tr class="mailInfo">
              <th style="width:200px!important">발신일</th>
              <td>${mm.sendDate}${mm.receiveDate}</td>
            </tr>
            <tr class="mailInfo">
              <th style="width:200px!important">보낸사람</th>
              <td>
                <span class="btn-sm btn-light" data-placement="bottom" data-toggle="tooltip" title="${mm.sender}" id="sender">${mm.sender}</span>
             </td>
            </tr>
            <tr class="mailInfo">
              <th>받는사람</th>
              <td id="receiverTd" style="display:block; width:800px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; ">
              <span>
                <button id="receiveEmp" class="expandEmpBtn w3-button w3-white w3-border w3-padding-small w3-small">열기</button>
              </span>
            </td>
          </tr>

            <tr class="mailInfo">
              <th>참조자</th>
              <td id="refReceiverTd" style="display:block; width:800px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; ">
                <span>
                  <button id="referEmp" class="expandEmpBtn w3-button w3-white w3-border w3-padding-small w3-small">열기</button>
                </span>
              </td>
          </tr>



            <tr class="mailInfo">
              <th>제목</th>
              <td>${mm.mailTitle}</td>
            </tr>
            <tr class="mailInfo">
              <th>파일첨부</th>
              <td>
                <c:forEach var="at" items="${ mm.at }">
                  <a href="${at.fileUrl}">${at.originName}</a><br>
                </c:forEach>
              </td>
            </tr>
            <tr>
              <td colspan="2" style="width: 100% !important;">${mm.mailContent}</td>
            </tr>
          </table>
         
          <div class="row justify-content-center">
            <a type="button" href="main.mail" class="btn btn-primary">목록으로</a> &nbsp;
            <c:if test="${mm.reMailNo eq 0}">
              <button type="button" id="sendDeleteBtn" class="mainBtn btn btn-secondary">완전삭제</button>
            </c:if>
          </div>
          <br>
        </div>
        <div id="empList" class="empAddZone" style="text-align: center; font-size: 15pt;"></div>
          
      </div>
    </section>

    <script>
      $(function(){
      
      })
      $(".expandEmpBtn").click(function(){

        if($(this).parent().parent().css("white-space")=="nowrap"){
          $(this).html("접기")
          $(this).parent().parent().css("white-space","normal");
        }else{
          $(this).parent().parent().css("white-space","nowrap");
          $(this).html("열기")
        }
        
      })
    </script>

    <script>
    $(".mainBtn").click(function () {
        var message = $(this).text();
        if (confirm(message + "처리 하시겠습니까?")) {
          $("#btnType").val($(this).attr("id"));
          if($(this).attr("id")=="sendDeleteBtn"){
            location.href='mainBtn.mail?btnType='+$(this).attr("id")+'&mailNo=${mm.seMailNo}';
          } else{
            location.href='mainBtn.mail?btnType='+$(this).attr("id")+'&mailNo=${mm.reMailNo}';
          }
        }
      })
   
      // controller 가서 다시 뿌리기 비효율적이라 바로 넘김..
      $(".enrollBtn").click(function () {
        <% session.setAttribute("mm", request.getAttribute("mm")); %>
        var replyType="";
        if ($(this).attr("id") == "replyBtn") {
          replyType = "re:";
        } else{
          replyType = "fwd:";
        }
          location.href = 'enrollForm.mail?replyType='+replyType;
        })


         // 전사원 리스트 세팅
      $(function(){
        $(document).ready(function(){
         
          var receiver = "${mm.receiver}".split(",");
          var refReceiver =  "${mm.refReceiver}".split(",");

          <c:forEach var="p" items="${ empList }" varStatus="status">
            if('${p.email}' == '${mm.sender}'){
              $("#sender").text("${p.department} / ${p.memName} ${p.rank}");
            }
           
            for (var i = 0; i < receiver.length; i++) {
            if('${p.email}' == receiver[i]){
              $("<span class='receiver btn-sm btn-light' data-placement='bottom' data-toggle='tooltip' data-original-title='${p.email}' title=''>${p.department} / ${p.memName} ${p.rank}</span>").appendTo("#receiverTd");
            }
          }
            
          for (var i = 0; i < refReceiver.length; i++) {
            if('${p.email}' == refReceiver[i]){
              $("<span class='refReceiver btn-sm btn-light' data-placement='bottom' data-toggle='tooltip' data-original-title='${p.email}' title=''>${p.department} / ${p.memName} ${p.rank}</span>").appendTo("#refReceiverTd");
            }
          }
          
          </c:forEach>
          $('[data-toggle="tooltip"]').tooltip();

        console.log($(".receiver").text().length);
        console.log($(".refReceiver").text().length);
        
        if($(".receiver").text().length < 70){
          $("#receiveEmp").hide()
        }
        if($(".refReceiver").text().length < 70){
          $("#referEmp").hide();
        }

        });

        
        
      });


        
</script>

</body>
</html>