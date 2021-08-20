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
   .popover-header{margin-top: 0px !important;}
    table a{ text-decoration:none !important; cursor: pointer; color: rgb(25, 99, 148)!important;}
    table a:hover{ text-decoration:underline !important; cursor: pointer; }
    table th{text-align: center;}
    table td{width: 600px !important; border-top:0;border-bottom: 0;}
   .table-bordered td{border: 0px !important; border-top: 1px solid #dee2e6!important; }
   #contentTd{min-height: 500px!important;}
   .expandEmpBtn{font-weight: normal!important;}
  </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
  <br><br>
    <section>
        <div class="outer">    
          <p class="pageTitle"> <span style="color:red">관리자모드</span><b> 전자결재</b></p>
          <jsp:include page="apprAdminSidebar.jsp" />
            <div class="sideOuter row ">
              <div class="card border-0" style=" width:80%">
                <div class="card-body">
                    <h3 style="margin-bottom: 25px;" id="apprFormName">${a.formName}</h3>

                    <table class="table table-bordered" style="word-break: break-all;">
                      <tr>
                        <th style="width:200px!important">기안자</th>
                        <td>${a.department} ${a.memName}</td>
                      </tr>
                      <tr>
                        <th>참조자</th>
                        <td style="display:block; width: 800px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; ">
                            <span><button id="referEmp" class="expandEmpBtn w3-button w3-white w3-border w3-padding-small w3-small">펼치기</button>&nbsp;${a.refMemNo}</span>
                        </td>
                      </tr>
                      <tr>
                        <th>제목</th>
                        <td>${a.docName}</td>
                      </tr>
                      <tr>
                        <th>파일첨부</th>
                        <td>
                          <c:forEach var="at" items="${ mm.at }">
                            <a href="${at.fileUrl}">${at.originName}</a><br>
                          </c:forEach>
                        </td>
                      </tr>
                      <tr id="contentTd">
                        <td colspan="2">${a.content}</td>
                      </tr>
                    </table>

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
                        <textarea class="form-control" rows="5" name="memo" id="acceptTextArea" style="resize:none; height: 100px" placeholder="의견이 있는 경우에 작성 해 주세요"></textarea>
                      </div>
                      <div class="modal-footer">
                        <input type="hidden" value="${a.sort}" name="memNo">
                        <input type="hidden" value="${ aLine[fn:length(aLine)-1].memNo}" name="lastApprover">
                        <input type="hidden" value="${a.docNo}" name="docNo">
                        <input type="hidden" value='승인' name="apprStatus">
                        <input type="hidden" value='${a.formNo}' name="formNo">
                        <button type="button" id="approveDocuBtn" class="btn btn-primary" >승인</button>
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
                      <textarea class="form-control" rows="5" id="denyTextArea" name="memo" style="resize:none; height: 100px" placeholder="의견을 작성 해 주세요" required></textarea>
                    </div>
                    <div class="modal-footer">
                      <input type="hidden" value="${a.sort}" name="memNo">
                      <input type="hidden" value="${ aLine[fn:length(aLine)-1].memNo}" name="lastApprover">
                      <input type="hidden" value="${a.docNo}" name="docNo">
                      <input type="hidden" value='${a.formNo}' name="formNo">
                      <input type="hidden" value="반려" name="apprStatus">
                      <button type="button" class="btn btn-primary" id="denyDocuBtn" >반려</button>
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    </div>
                  </form>
                  </div>
                </div>
              </div>
            
              <!--반려모달끝-->

               <!-- 회수모달 -->
               <div class="modal fade" id="cancel">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h4 class="modal-title">회수하기</h4>
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <form action="cancelDocu.appr" method="post" id="cancelDocuform">
                    <div class="modal-body">
                        회수하면 기안이 취소됩니다
                    </div>
                    <div class="modal-footer">
                      <input type="hidden" value="${a.memNo}" name="memNo">
                      <input type="hidden" value="${a.docNo}" name="docNo">
                      <input type="hidden" value='${a.formNo}' name="formNo">
                      <button type="button" id="cancelDocuBtn" class="btn btn-primary">회수</button>
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    </div>
                  </form>
                  </div>
                </div>
              </div>
              <!--회수모달끝-->


              
              <script>
                // 수신 참조가 많을 경우 펼치기 접기 기능 
                $(function(){
                  $(function(){
                  var refWidth = ($("#referEmp").parent().innerWidth());
                  var receiveWidth = ($("#receiveEmp").parent().innerWidth());
          
                  if(refWidth < 580){
                    $("#referEmp").hide()
                  }
                  if(receiveWidth < 580){
                    $("#receiveEmp").hide();
                  }
                })
                })
                $(".expandEmpBtn").click(function(){
          
                  if($(this).parent().parent().css("white-space")=="nowrap"){
                    $(this).html("접기")
                    // $(this).next().html("<br>"+$(this.next().html()));
                    $(this).parent().parent().css("white-space","normal");
                  }else{
                    $(this).parent().parent().css("white-space","nowrap");
                    $(this).html("펼치기")
                  }
                  
                })  
             
              // 반려된 페이지의 경우 반려표기
              $(function () {
                  $(function () {
                    if ($("#selectedLine").find("span").text().indexOf("반려") != -1) {
                      $("#apprFormName").html("${a.formName} <b class='text-danger'>(반려되었습니다)</b>")
                    }
                  })
                })

              // 버튼 페이지 이동 기능 

                $("#approveDocuBtn").click(function(){                   
                    if (confirm("승인 하시겠습니까?")) {
                      <c:if test="${a.sort ne loginUser.memNo and loginUser.status eq 'A'}">
                        $("#acceptTextArea").val("[시스템 관리자 처리]"+$("#acceptTextArea").val());
                      </c:if>
                      $("#approveDocuform").submit();
                    }
                 });

                 $("#denyDocuBtn").click(function(){
                     <c:if test="${a.sort ne loginUser.memNo and loginUser.status eq 'A'}">
                      $("#denyTextArea").val("[시스템 관리자 처리]"+$("#denyTextArea").val());
                     </c:if>
                     $("#denyDocuform").submit();
                });

                $("#cancelDocuBtn").click(function(){
                   if (confirm("회수 하시겠습니까?")) {
                     $("#cancelDocuform").submit();
                   }
                    
                });
              </script>

              

            </div>
    	</div>
    </section>


    


</body>
</html>