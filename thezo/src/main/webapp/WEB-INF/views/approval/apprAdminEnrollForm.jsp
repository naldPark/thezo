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
	
   	 <section>
        <div class="outer">    
            <p class="pageTitle">  관리자모드 <b> 전자결재</b></p>
            <jsp:include page="apprAdminSidebar.jsp"/>
            <div class="sideOuter">
                    <div class="card border-0">
                      <div class="card-body">
                        <form action="insertNewDocu.appr" method="post" enctype="Multipart/form-data" id="form">
                          <h3 style="margin-bottom: 25px;">문서양식 수정</h3>
                          <div class="w3-row">
                            <div class="w3-col" style="width:82%">
                              <div class="input-group mb-3">
                                <span class="input-group-text bg-white border-0">등록상태</span>
                                <div class="form-check-inline">
                                  <label class="form-check-label">
                                    <input type="radio" class="form-check-input" value="Y" name="usingStatus" checked>사용
                                  </label>
                                </div>
                                <div class="form-check-inline">
                                  <label class="form-check-label">
                                    <input type="radio" class="form-check-input" value="N" name="usingStatus">미사용                             
                                  </label>
                                </div>
                              </div>
                            </div>
                         
                          </div>
                          <div class="input-group mb-3">
                          <span class="input-group-text bg-white border-0">양식분류</span>
                            <select name="category" class="custom-select">
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
                            <input type="text" id="formName" name="formName" class="form-control">
                          </div>
                          <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text bg-white border-0">양식설명</span>
                            </div>
                            <input type="text" id="formInfo" name="formInfo" class="form-control">
                          </div>
                          <div class="form-group">
                              <textarea class="form-control" name="formContent" id="summernote" maxlength="140" rows="7" autocomplete="off"></textarea>
                          </div>
                          <br>
                          <div class="row justify-content-center">
                            <button type="submit" id="submitBtn" class="btn btn-primary" onclick="return validate();">등록하기</button>&nbsp;
                            <button type="button" onclick="location.href='adminMain.appr'" class="btn btn-secondary">취소</button>
                          </div>
      
                        </form>
                      </div>
                    </div>      
               
            </div>
    	</div>

        <br>
    </section>
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