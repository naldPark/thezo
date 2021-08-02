<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Zo</title>
  <style>
    .note-modal-content, .note-modal-content:before, .note-modal-content:after{box-sizing: unset!important;}
    .note-modal-footer,.note-modal-footer:before, .note-modal-footer:after{box-sizing: unset!important;}
    .input-group-text{width:80px}
      /* *{border:1px solid red} */
     
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
                  <form action="insertDocu.appr" method="post" enctype="Multipart/form-data" id="form">
                    <h3 style="margin-bottom: 25px;">${a.formName}</h3>
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
                      <span class="input-group-text bg-white border-0">${a.at}</span>
                      <div class="drop-zone" style="text-align: center; font-size: 15pt;">
                        <br>
                        
                      </div>
                    </div>
                  
                    <div class="form-group">
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
                      <c:if test="${a.sort eq loginUser.memNo }">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#accept">승인</button> &nbsp;
                        <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#denied">반려</button> &nbsp;
                      </c:if>
                    </div>

                  </form>
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
                          <span class="btn-sm btn-secondary">
                            ${c.status} 
                          </span>
                        </div>
                      </div>
                    </div>
                  </c:forEach>
                </div>
              </div>
              <!--오른쪽 결재선 끝-->


              <!-- 승인모달 -->
              <div class="modal fade" id="accept">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h4 class="modal-title">승인하기</h4>
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                      <textarea class="form-control" rows="5" name="comment" id="comment" style="resize:none; height: 100px" placeholder="의견이 있는 경우에 작성 해 주세요"></textarea>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-primary" data-dismiss="modal">승인</button>
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    </div>
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
                    <div class="modal-body">
                      <textarea class="form-control" rows="5" name="comment" id="comment" style="resize:none; height: 100px" placeholder="의견을 작성 해 주세요" required></textarea>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-primary" data-dismiss="modal">반려</button>
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    </div>
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
                    <div class="modal-body">
                        회수하면 임시저장함으로 이동 됩니다
                    </div>
                    <div class="modal-footer">
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