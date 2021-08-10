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
    .note-modal-content, .note-modal-content:before, .note-modal-content:after{box-sizing: unset!important;}
    .note-modal-footer,.note-modal-footer:before, .note-modal-footer:after{box-sizing: unset!important;}
    .mailOuter .input-group-text{width:80px; }
    .mailOuter .form-control:disabled,.sideOuter .form-control[readonly]{ background: white!important; }
    a{ text-decoration:none !important; cursor: pointer; }
    a:hover{ text-decoration:none !important; cursor: pointer; color: black !important;}
  </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    <section>
        <div class="outer">    
          <p class="pageTitle">  e-mail <b> 전자메일</b></p>
          <jsp:include page="mailSidebar.jsp"/>
          <div class="mailOuter row">
            <div align="left">
            <c:if test="${mm.seMailNo eq 0}"> 
              <button type="button" id="replyBtn" class="enrollBtn btn btn-sm btn-secondary">답장</button>
              <button type="button" id="forwardBtn" class="enrollBtn btn btn-sm btn-secondary">전달</button>
              <button type="button" id="deleteBtn" class="mainBtn btn btn-sm btn-secondary">삭제</button>
              <button type="button" id="spamBtn" class="mainBtn btn btn-sm btn-secondary">스팸</button>
            </c:if>
            
          </div>
          <br><br>
            <div class="card" style="margin-bottom: 5rem; width:100%">
              <div class="card-body">

                    <div class="input-group mb-3">
                      <div class="input-group-prepend">
                        <span class="input-group-text bg-white w3-round-small">보낸사람</span>
                      </div>&nbsp;
                      <span class="input-group-text bg-white border-0">${mm.sender}</span>
                    </div>
                    <div class="input-group mb-3">
                      <div class="input-group-prepend">
                        <span class="input-group-text bg-white w3-round-small">참조자</span>
                      </div>&nbsp;
                      <span class="input-group-text bg-white border-0">${mm.receiver}</span>
                    </div>
                    <div class="input-group mb-3">
                      <div class="input-group-prepend">
                        <span class="input-group-text bg-white w3-round-small">제목</span>
                      </div>&nbsp;
                      <span class="input-group-text bg-white border-0">${mm.mailTitle}</span>
                    </div>
                 
                    <div class="input-group mb-3">
                      <div class="input-group-prepend">
                        <span class="input-group-text bg-white w3-round-small">파일첨부</span>
                      </div>&nbsp;
                      <span style="padding-left:10px">
                        <c:forEach var="at" items="${ mm.at }">
                          <a href="${at.fileUrl}">${at.originName}</a><br>
                        </c:forEach>
                      </span>
                     
                     
                    </div>
                  
                    <div class="form-group" style="overflow:auto">
                        <hr>
                        <div style="min-height:500px; padding:20px">
                          ${mm.mailContent}
                        </div>
                    </div><br>
                    <hr>
                    <div class="row justify-content-center">
                      <a type="button" href="main.mail" class="btn btn-primary">목록으로</a> &nbsp;
                      <c:if test="${mm.reMailNo eq 0}"> 
                        <button type="button" id="sendDeleteBtn" class="mainBtn btn btn-secondary">삭제</button>
                      </c:if>
                    </div>
                </div>
              </div>
            </div>
    	</div>
    </section>


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
</script>

</body>
</html>