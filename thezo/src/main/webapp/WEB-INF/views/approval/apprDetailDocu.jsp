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
    .sideOuter .input-group-text{width:80px}
    .sideOuter .form-control:disabled,.sideOuter .form-control[readonly]{ background: white!important; }
    a{ text-decoration:none !important; cursor: pointer; }
    a:hover{ text-decoration:none !important; cursor: pointer; color: black !important;}
    .popover-header{margin-top: 0px !important;}
  </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    <section>
        <div class="outer">    
          <p class="pageTitle">  approval <b> 전자결재</b></p>
    
            <jsp:include page="apprSidebar.jsp"/>
            <div class="sideOuter row ">
              <div class="card border-0" style=" width:80%">
                <div class="card-body">
                    <h3 style="margin-bottom: 25px;" id="apprFormName">${a.formName}</h3>
                    <div class="input-group mb-3">
                      <div class="input-group-prepend">
                        <span class="input-group-text bg-white border-0">기안자</span>
                      </div>
                      <span class="input-group-text bg-white border-0">${a.department} / ${a.memName}</span>
                    </div>
                    <div class="input-group mb-3">
                      <div class="input-group-prepend">
                        <span class="input-group-text bg-white border-0">제목</span>
                      </div>
                      <span class="input-group-text bg-white border-0">${a.docName}</span>
                    </div>
                    <div class="input-group mb-3">
                      <div class="input-group-prepend">
                        <span class="input-group-text bg-white border-0">참조자</span>
                      </div>
                      <span class="input-group-text bg-white border-0">${a.refMemNo}</span>
                    </div>
                    <div class="input-group mb-3">
                      <div class="input-group-prepend">
                        <span class="input-group-text bg-white border-0">파일첨부</span>
                      </div>
                      <span style="padding-left:10px">
                        <c:forEach var="at" items="${ a.at }">
                          <a href="${at.fileUrl}">${at.originName}</a><br>
                        </c:forEach>
                      </span>
                     
                     
                    </div>
                  
                    <div class="form-group" style="overflow:auto">
                        <hr>
                        <div style="min-height:500px; padding:20px">
                          ${a.content}
                        </div>
                    </div><br>
                    <hr>
                    <div class="row justify-content-center">
                      
                      <c:if test="${a.memNo eq loginUser.memNo and a.status eq '대기'}">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#cancel">회수</button> &nbsp;
                      </c:if>
                      <c:if test="${a.sort eq loginUser.memNo and a.status ne '반려'}">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#accept">승인</button> &nbsp;
                        <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#denied">반려</button> &nbsp;
                      </c:if>
                      <c:if test="${!empty a.sort and a.sort ne loginUser.memNo and loginUser.status eq 'A' and a.status ne '반려'}">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#accept">관리자 승인</button> &nbsp;
                        <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#denied">관리자 반려</button> &nbsp;
                      </c:if>
                    </div>
                </div>
              </div>
             

              <!--오른쪽 결재선 시작-->
              <div class="card row  border-0" style="margin-bottom: 5rem; width:21%">
                <h5 style="float:left;">결재선</h5>
                <div class="card-body" id="selectedLine">
                  
                  <c:forEach var="c" items="${ aLine }">
                    <div class="mb-2 p-2 shadow-sm">
                      <div class="d-flex">
                        <div class="p-2 text-primary"><b>${c.memName} ${c.job}</b></div>
                      </div>
                      <div class="d-flex flex-row mb-3">
                        <div class="pl-2" style="width:60%">${c.department} </div>
                        <div>
                          <button type="button" class="btn btn-sm btn-secondary" title="[${c.memName} ${c.status} 의견]"  data-toggle="opinionpop" data-placement="left" data-content="${c.memo}">
                            ${c.status}  
                          </button>
                        </div>
                      </div>
                    </div>
                  </c:forEach>
                </div>
              </div>

              <script>
                $(document).ready(function(){
                  $('[data-toggle="opinionpop"]').popover();   
                });
              </script>
              
              <!--오른쪽 결재선 끝-->


              <!-- 승인모달 -->
              
                <div class="modal fade" id="accept">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h4 class="modal-title">승인하기</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                      </div>
                      <form action="approveDocu.appr" method="post" id="approveDocuform">
                      <div class="modal-body">
                        <textarea class="form-control" rows="5" name="memo" style="resize:none; height: 100px" placeholder="의견이 있는 경우에 작성 해 주세요"></textarea>
                      </div>
                      <div class="modal-footer">
                        <input type="hidden" value="${a.sort}" name="memNo">
                        <input type="hidden" value="${ aLine[fn:length(aLine)-1].memNo}" name="lastApprover">
                        <input type="hidden" value="${a.docNo}" name="docNo">
                        <input type="hidden" value='승인' name="apprStatus">
                        <button type="button" id="approveDocuBtn" class="btn btn-primary">승인</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                      </div>
                    </form>
                    </div>
                  </div>
                </div>
              <!--승인모달끝-->
          

             


              <!-- 반려모달 -->
              
              <div class="modal fade" id="denied">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h4 class="modal-title">반려하기</h4>
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <form action="denyDocu.appr" method="post" id="denyDocuform">
                    <div class="modal-body">
                      <textarea class="form-control" rows="5" name="memo" style="resize:none; height: 100px" placeholder="의견을 작성 해 주세요" required></textarea>
                    </div>
                    <div class="modal-footer">
                      <input type="hidden" value="${a.sort}" name="memNo">
                      <input type="hidden" value="${ aLine[fn:length(aLine)-1].memNo}" name="lastApprover">
                      <input type="hidden" value="${a.docNo}" name="docNo">
                      <input type="hidden" value="반려" name="apprStatus">
                      <button type="button" id="denyDocuBtn" class="btn btn-primary">반려</button>
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    
                    </div>
                  </form>
                  </div>
                </div>
              </div>
            
              <!--반려모달끝-->

              <script>
                $(function(){
                  if($("#selectedLine").find("span").text().indexOf("반려") != -1) {
                    $("#apprFormName").html("${a.formName} <b class='text-danger'>(반려되었습니다)</b>")
                  }
                })
                $("#approveDocuBtn").click(function(){
                  $("memo").text("[시스템 관리자 처리]"+$("memo").text());
                   
                    if (confirm("승인 하시겠습니까?")) {
                      <c:if test="${a.sort ne loginUser.memNo and loginUser.status eq 'A'}">
                      $("memo").text("[시스템 관리자 처리]"+$("memo").text());
                      </c:if>
                      $("#approveDocuform").submit();
                    }
                     
                 });

                 $("#denyDocuBtn").click(function(){
                   
                   if (confirm("반려 하시겠습니까?")) {
                     <c:if test="${a.sort ne loginUser.memNo and loginUser.status eq 'A'}">
                     $("memo").text("[시스템 관리자 처리]"+$("memo").text());
                     </c:if>
                     $("#denyDocuform").submit();
                   }
                    
                });
              </script>

               <!-- 회수모달 -->
               <div class="modal fade" id="cancel">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h4 class="modal-title">회수하기</h4>
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        회수하면 임시저장함으로 이동 됩니다
                    </div>
                    <div class="modal-footer">
                      <input type="hidden" value="${a.memNo}" name="memNo">
                      <button type="button" class="btn btn-primary" data-dismiss="modal">회수</button>
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    </div>
                  </div>
                </div>
              </div>
              <!--회수모달끝-->

            </div>
    	</div>
    </section>


    


</body>
</html>