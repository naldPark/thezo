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
              height: 500,
              disabledResizeEditor:true,            
              fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
              fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],	 
              focus: true
            });
          });
  })( jQuery );
  </script>
  <style>
    .note-modal-content, .note-modal-content:before, .note-modal-content:after{box-sizing: unset!important;}
    .note-modal-footer,.note-modal-footer:before, .note-modal-footer:after{box-sizing: unset!important;}
    .input-group-text{width:80px}
      /* *{border:1px solid red} */
   .drop-zone{margin-left:80px; width: 100%; height: 110px; border: 1px solid lightgray; overflow: auto;
     
    }
    
  </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
    <section>
      <div class="outer">    
        <p class="pageTitle">  e-mail <b> 전자메일</b></p>
        <jsp:include page="mailSidebar.jsp"/>
        <div class="mailOuter row">
          <div class="card" style="margin-bottom: 5rem; width:100%">
            <div class="card-body">
              <form action="insertDocu.appr" method="post" id="fileForm" name="fileForm" enctype="multipart/form-data">
                <h3 style="margin-bottom: 25px;">메일쓰기</h3>
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text bg-white border-0">제목</span>
                  </div>
                  <input type="text" placeholder="제목을 입력해주세요" class="form-control">
                </div>
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text bg-white border-0">받는사람</span>
                  </div>
                  <input type="text" class="form-control" value="">
                </div>
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text bg-white border-0">수신참조</span>
                  </div>
                  <input type="text" class="form-control" value="">
                </div>
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text bg-white border-0">파일첨부</span>
                  </div>
                  <input type="file" id="file" name="upfile" multiple>
                  <div class="drop-zone" style="text-align: center; font-size: 15pt;">
                    <br>
                    <i class="far fa-clone"></i>
                    파일을 여기로 드래그하세요.
                  </div>
                </div>
                <div class="form-group">
                    <textarea class="form-control" name="summernote" id="summernote" maxlength="140" rows="7" autocomplete="off"></textarea>
                </div><br>
                <div class="row justify-content-center">
                  <button type="button" id="submitBtn" class="btn btn-primary">발송하기</button>&nbsp;
                  <button type="button" onclick="location.href=''" class="btn btn-secondary">취소</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <br>
    </section>


    <script>
        
      (function() {
          
          var $file = document.getElementById("file")
          var dropZone = document.querySelector(".drop-zone")

          var toggleClass = function(className) {
              
              console.log("current event: " + className)

              var list = ["dragenter", "dragleave", "dragover", "drop"]

              for (var i = 0; i < list.length; i++) {
                  if (className === list[i]) {
                      dropZone.classList.add("drop-zone-" + list[i])
                  } else {
                      dropZone.classList.remove("drop-zone-" + list[i])
                  }
              }
          }
          
          var showFiles = function(files) {
              dropZone.innerHTML = ""
              for(var i = 0, len = files.length; i < len; i++) {
                  dropZone.innerHTML += "<p>" + files[i].name + "</p>"
              }
          }

          var selectFile = function(files) {
              // input file 영역에 드랍된 파일들로 대체
              $file.files = files
              showFiles($file.files)
              
          }
          
          $file.addEventListener("change", function(e) {
              showFiles(e.target.files)
          })

          // 드래그한 파일이 최초로 진입했을 때
          dropZone.addEventListener("dragenter", function(e) {
              e.stopPropagation()
              e.preventDefault()
             
              toggleClass("dragenter")

          })

          // 드래그한 파일이 dropZone 영역을 벗어났을 때
          dropZone.addEventListener("dragleave", function(e) {
              e.stopPropagation()
              e.preventDefault()
              $(this).css("background-color", "#FFF");
              toggleClass("dragleave")

          })

          // 드래그한 파일이 dropZone 영역에 머물러 있을 때
          dropZone.addEventListener("dragover", function(e) {
              e.stopPropagation()
              e.preventDefault()
              $(this).css("background-color", "rgb(248, 241, 214)");
              toggleClass("dragover")

          })

          // 드래그한 파일이 드랍되었을 때
          dropZone.addEventListener("drop", function(e) {
              e.preventDefault()
              $(this).css("background-color", "#FFF");
              $(this).css("font-size", "11pt");
              $(this).css("text-align", "left");
              
              toggleClass("drop")

              var files = e.dataTransfer && e.dataTransfer.files
              console.log(files)

              if (files != null) {
                  if (files.length < 1) {
                      alert("폴더 업로드 불가")
                      return
                  }
                  selectFile(files)
              } else {
                  alert("ERROR")
              }

          })

      })();
  </script>


<script>
     $(document).on('click','#submitBtn',function(){
          if(confirm("정말로 제출하시겠습니까?\n기안 후엔 수정이 불가능합니다.")){
            $("#fileForm").submit();
          }					
        });
</script>
    


</body>
</html>