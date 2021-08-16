<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Zo</title>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<link href="resources/summernote-0.8.18-dist/summernote-lite.min.css" rel="stylesheet">
<script src="resources/summernote-0.8.18-dist/summernote-lite.js"></script>
<script src="resources/summernote-0.8.18-dist/lang/summernote-ko-KR.js"></script>
<script>
  jQuery.noConflict();
  (function( $ ) {
    $(document).ready(function() {
            $('#summernote').summernote({
              toolbar: [
                ['fontname', ['fontname']],
                ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                ['fontsize', ['fontsize']],
                ['color', ['color']],
                ['table', ['table']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['insert',['picture','link']],
              ],
              lang: 'ko-KR',
              placeholder: '내용을 입력해주세요',
              height: 800,
              disabledResizeEditor:true,            
              fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
              fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],	 
              focus: true
            });
          });
  })( jQuery );
  </script>
<style>
    .fa-file-alt{font-size:50pt;}
    .input-group-text{width:80px}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<br><br>
   	 <section>
        <div class="outer">    
          <p class="pageTitle"> <span style="color:red">관리자모드</span><b> 전자결재</b></p>
            <jsp:include page="apprAdminSidebar.jsp"/>
            <div class="sideOuter">
                    <div class="card border-0">
                      <div class="card-body">
                        <form action="editNewDocu.appr" method="post" enctype="Multipart/form-data" id="form">
                          <h3 style="margin-bottom: 25px;">문서양식 수정</h3>
                          <div class="w3-row">
                            <div class="w3-col" style="width:82%">
                              <div class="input-group mb-3">
                                <span class="input-group-text bg-white border-0">등록상태</span>
                                <div class="form-check-inline">
                                  <label class="form-check-label">
                                    <input type="radio" class="form-check-input" value="Y" name="usingStatus" id="usingForm">사용
                                  </label>
                                </div>
                                <div class="form-check-inline">
                                  <label class="form-check-label">
                                    <input type="radio" class="form-check-input" value="N" name="usingStatus" id="unusingForm">미사용
                                  </label>
                                </div>
                              </div>
                            </div>
                            <div class="w3-col" style="width:18%">
                              <span class="input-group-text bg-white border-0">최종 등록일 ${a.createDate}</span>
                            </div>
                          </div>
                          <div class="input-group mb-3">
                          <span class="input-group-text bg-white border-0">양식분류</span>
                            <select name="category" id="sel1" class="custom-select">
                              <option value="일반">일반</option>
                              <option value="비용">비용</option>
                              <option value="총무">총무</option>
                              <option value="인사">인사</option>
                            </select>
                          </div>

                          <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text bg-white border-0">양식명</span>
                            </div>
                            <input type="text" class="form-control" name="formName" id="formName" value="${a.formName}">
                            <input type="hidden" name="formNo" value="${a.formNo}">
                          </div>
                          <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text bg-white border-0">양식설명</span>
                            </div>
                            <input type="text" class="form-control" name="formInfo" id="formInfo" value="${a.formInfo}">
                          </div>
                          <div class="form-group">
                              <textarea class="form-control" name="formContent" id="summernote" maxlength="140" rows="7" autocomplete="off">${a.formContent}</textarea>
                          </div>
                          <br>
                          <div class="row justify-content-center">
                            <button type="submit" id="submitBtn" class="btn btn-primary">수정하기</button>&nbsp;
                            <button type="button" onclick="location.href='adminMain.appr'" class="btn btn-secondary">취소</button>
                          </div>
      
                        </form>
                      </div>
                    </div>      
               
            </div>
    	</div>

        <div class="modal" id="delete">
            <div class="modal-dialog">
              <div class="modal-content" style="width:400px">
                <div class="modal-body" align="center"><br>
	                <form action="" method="post">
	                    <h4><b>ㅇㅇㅇ문서 삭제</b></h4><br>삭제 이후 복원이 불가합니다.<br>해당문서를 삭제하시겠습니까?<br><br>
	                    <button type="submit" class="btn btn-primary" class="deleteButton">삭제</button>
	                    <button type="button" class="btn btn-secondary"  data-dismiss="modal">취소</button>
	               </form>
                   <br>
                </div>
              </div>
            </div>
        </div>
        <br>
    </section>

      <script>
        $(function(){
          $(function(){
          <c:if test="${!empty a.category}">
            $("#sel1").val("${a.category}").attr("selected", "selected");
          </c:if>
          <c:choose>
            <c:when test="${a.status eq 'N'}">
              $("#unusingForm").attr("checked", "checked");
            </c:when>
            <c:otherwise>
              $("#usingForm").attr("checked", "checked");
            </c:otherwise>
          </c:choose>
          })
        })
      </script>
  
  <script>

    function validate(){
     
      if($("#formName").val()==""){
          alert("제목을 입력 해 주세요");
          $("#formName").focus();
          return false;
      }
      if($("#formInfo").val()==""){
          alert("설명을 입력 해 주세요");
          $("#formInfo").focus();
          return false;
      }

      if($("#summernote").val()==""){
          alert("내용을 입력 해 주세요");
          $("#summernote").focus();
          return false;
      }
  }
</script>
 	
</body>
</html>