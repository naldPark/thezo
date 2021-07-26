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
                    <h3 style="margin-bottom: 25px;">시말서</h3>
                    <div class="input-group mb-3">
                      <div class="input-group-prepend">
                        <span class="input-group-text bg-white border-0">제목</span>
                      </div>
                      <span class="input-group-text bg-white border-0">제목입니다</span>
                    </div>
                    <div class="input-group mb-3">
                      <div class="input-group-prepend">
                        <span class="input-group-text bg-white border-0">참조자</span>
                      </div>
                      <span class="input-group-text bg-white border-0">참조자입니다</span>
                    </div>
                    <div class="input-group mb-3">
                      <div class="input-group-prepend">
                        <span class="input-group-text bg-white border-0">파일첨부</span>
                      </div>
                      <span class="input-group-text bg-white border-0">첨부파일</span>
                      <div class="drop-zone" style="text-align: center; font-size: 15pt;">
                        <br>
                        
                      </div>
                    </div>
                  
                    <div class="form-group">
                        <hr>
                        <div style="min-height:500px; padding:20px">
                          <p class="a" align="center" style="text-align: center; word-break: keep-all;"><span style="font-weight: bolder;"><span style="font-size: 20pt; line-height: 32.8px; font-family: &quot;맑은 고딕&quot;;">시<span lang="EN-US">&nbsp;&nbsp;&nbsp;</span>말<span lang="EN-US">&nbsp;&nbsp;&nbsp;</span>서</span></span><span style="font-weight: bolder;"><span lang="EN-US" style="font-size: 11pt; line-height: 18.04px; font-family: &quot;맑은 고딕&quot;;"><o:p></o:p></span></span></p><p class="a"><span lang="EN-US" style="font-size: 11pt; line-height: 18.04px; font-family: &quot;맑은 고딕&quot;;">&nbsp;</span></p><p class="a"><span lang="EN-US" style="font-size: 11pt; line-height: 18.04px; font-family: &quot;맑은 고딕&quot;;">&nbsp;&nbsp;</span><span style="font-size: 11pt; line-height: 18.04px; font-family: &quot;맑은 고딕&quot;;">위 본인은 직원으로서 제 사규를 준수하고 맡은바 책임과 의무를 다하여 성실히 복무하여야 함에도 불구하고 아래와 같이 회사의 관련 규정을 위반하였는바 이에 시말서를 제출하고 그에 따른 처벌을 감수하며 차후 본건을 계기로 과오의 재발이 없을 것임을 서약합니다<span lang="EN-US">.<o:p></o:p></span></span></p><p class="a"><span lang="EN-US" style="font-size: 11pt; line-height: 18.04px; font-family: &quot;맑은 고딕&quot;;">&nbsp;</span></p><p class="a"><span lang="EN-US" style="font-size: 11pt; line-height: 18.04px; font-family: &quot;맑은 고딕&quot;;">&nbsp;</span></p><p class="a"><span style="font-weight: bolder;"><u><span lang="EN-US" style="font-size: 11pt; line-height: 18.04px; font-family: &quot;맑은 고딕&quot;;">&nbsp;</span></u></span><span style="font-weight: bolder;"><u><span style="font-size: 11pt; line-height: 18.04px; font-family: &quot;맑은 고딕&quot;;">내 용&nbsp;</span></u></span><span lang="EN-US" style="font-size: 11pt; line-height: 18.04px; font-family: &quot;맑은 고딕&quot;;">(</span><span style="font-size: 11pt; line-height: 18.04px; font-family: &quot;맑은 고딕&quot;;">상세히 기술요함<span lang="EN-US">)<o:p></o:p></span></span></p><p class="a"><br></p><p class="a"><span lang="EN-US" style="font-size: 11pt; line-height: 18.04px; font-family: &quot;맑은 고딕&quot;;">&nbsp;</span></p><p class="a"><span lang="EN-US" style="font-size: 11pt; line-height: 18.04px; font-family: &quot;맑은 고딕&quot;;">&nbsp;</span></p><p class="a"><span lang="EN-US" style="font-size: 1pt; line-height: 12.3px; font-family: &quot;맑은 고딕&quot;;">&nbsp;</span></p><p class="a"><span lang="EN-US" style="font-size: 11pt; line-height: 18.04px; font-family: &quot;맑은 고딕&quot;;">&nbsp;</span><span style="font-size: 11pt; line-height: 18.04px; font-family: &quot;맑은 고딕&quot;;">상기 기록사실에 허위가 없습니다<span lang="EN-US">.<o:p></o:p></span></span></p><p class="a"><span lang="EN-US" style="font-size: 11pt; line-height: 18.04px; font-family: &quot;맑은 고딕&quot;;">&nbsp;</span></p><p class="a" align="center" style="text-align: center; word-break: keep-all;"><span lang="EN-US" style="font-size: 11pt; line-height: 18.04px; font-family: &quot;맑은 고딕&quot;;">&nbsp; 20OO&nbsp;</span><span style="font-size: 11pt; line-height: 18.04px; font-family: &quot;맑은 고딕&quot;;">년<span lang="EN-US">&nbsp;&nbsp; O&nbsp;</span>월<span lang="EN-US">&nbsp;&nbsp; O&nbsp;</span>일<span lang="EN-US"><o:p></o:p></span></span></p><p class="a"><span lang="EN-US" style="font-size: 11pt; line-height: 18.04px; font-family: &quot;맑은 고딕&quot;;">&nbsp; &nbsp; &nbsp;&nbsp;</span></p><p class="a" align="center" style="text-align: center; word-break: keep-all;"></p><p class="a" align="center" style="text-align: center; word-break: keep-all;"><span style="font-weight: bolder;"><span style="font-size: 13pt; line-height: 21.32px; font-family: &quot;맑은 고딕&quot;;">주식회사<span lang="EN-US">&nbsp;더조&nbsp;</span></span></span><span style="font-weight: bolder;"><span style="font-size: 13pt; line-height: 21.32px; font-family: 맑은 고딕;">대표이사 귀하</span></span></p>
                        
                        </div>
                    </div><br>
                    <hr>
                    <div class="row justify-content-center">
                      <button type="button" id="submitBtn" class="btn btn-primary" data-toggle="modal" data-target="#accept">승인</button> &nbsp;
                      <button type="button" onclick="location.href=''" class="btn btn-secondary">반려</button>
                    </div>
                  </form>
                </div>
              </div>
              <!--오른쪽 결재선 시작-->
              <div class="card row  border-1" style="margin-bottom: 5rem; width:21%">
                <div class="card-body">
                  <div class="container p-3 my-3 bg-dark text-white">
                    결재선
                  </div>
                  <div class="mb-2 p-2 shadow-sm">
                    <div class="d-flex justify-content-around">
                      <div class="p-2 text-primary"><b>이성경</b></div>
                      <div class="p-2"> </div>
                      <div class="p-2"><span class="btn-sm btn-secondary">결재완료</span></div>
                    </div>
                    <div class="d-flex flex-row mb-3">
                      <span class="pl-3">인사팀 팀장</span>
                    </div>
                  </div>
                  <div class="mb-2 p-2 shadow-sm">
                    <div class="d-flex justify-content-around">
                      <div class="p-2 text-primary"><b>이성경</b></div>
                      <div class="p-2"> </div>
                      <div class="p-2"><span class="btn-sm btn-secondary">결재대기</span></div>
                    </div>
                    <div class="d-flex flex-row mb-3">
                      <span class="pl-3">인사팀 팀장</span>
                    </div>
                  </div>
                  <div class="mb-2 p-2 shadow-sm">
                    <div class="d-flex justify-content-around">
                      <div class="p-2 text-primary"><b>이성경</b></div>
                      <div class="p-2"> </div>
                      <div class="p-2"><span class="btn-sm btn-secondary">합의대기</span></div>
                    </div>
                    <div class="d-flex flex-row mb-3">
                      <span class="pl-3">인사팀 팀장</span>
                    </div>
                  </div>
                  <div class="mb-2 p-2 shadow-sm">
                    <div class="d-flex justify-content-around">
                      <div class="p-2 text-primary"><b>이성경</b></div>
                      <div class="p-2"> </div>
                      <div class="p-2"><span class="btn-sm btn-secondary">합의대기</span></div>
                    </div>
                    <div class="d-flex flex-row mb-3">
                      <span class="pl-3">인사팀 팀장</span>
                    </div>
                  </div>
                </div>
              </div>
              <!--오른쪽 결재선 끝-->


              <!-- The Modal -->
              <div class="modal fade" id="accept">
                <div class="modal-dialog">
                  <div class="modal-content">
                  
                    <!-- Modal Header -->
                    <div class="modal-header">
                      <h4 class="modal-title">승인하기</h4>
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    
                    <!-- Modal body -->
                    <div class="modal-body">
                      <textarea class="form-control" rows="5" name="comment" id="comment" style="resize:none; height: 100px" placeholder="의견이 있는 경우에 작성 해 주세요"></textarea>
                    </div>
                    
                    <!-- Modal footer -->
                    <div class="modal-footer">
                      <button type="button" class="btn btn-primary" data-dismiss="modal">승인</button>
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    </div>
                    
                  </div>
                </div>
              </div>

            </div>
    	</div>
    </section>


    


</body>
</html>